Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C22460053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 02:45:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H2jUF1017129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 19:45:45 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 16 Oct 2018 19:45:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 10:32:11 +0800
Message-ID: <1539743531-11765-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-requests: fix CVE-2018-18074
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 02:45:54 -0000
Content-Type: text/plain

Backport two patches to fix the following CVE.

CVE: CVE-2018-18074

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python-requests.inc    |   6 ++
 ...rization-header-whenever-root-URL-changes.patch |  62 +++++++++++
 ...uthorization-stripping-logic-as-discussed.patch | 118 +++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-requests/0001-Strip-Authorization-header-whenever-root-URL-changes.patch
 create mode 100644 meta-python/recipes-devtools/python/python-requests/0002-Rework-authorization-stripping-logic-as-discussed.patch

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index efc652d..301c2f8 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,6 +3,12 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bfbeafb85a2cee261510d65d5ec19156"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
+
+SRC_URI += "file://0001-Strip-Authorization-header-whenever-root-URL-changes.patch \
+            file://0002-Rework-authorization-stripping-logic-as-discussed.patch \
+            "
+
 SRC_URI[md5sum] = "6c1a31afec9d614e2e71a91ee6ca2878"
 SRC_URI[sha256sum] = "ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a"
 
diff --git a/meta-python/recipes-devtools/python/python-requests/0001-Strip-Authorization-header-whenever-root-URL-changes.patch b/meta-python/recipes-devtools/python/python-requests/0001-Strip-Authorization-header-whenever-root-URL-changes.patch
new file mode 100644
index 0000000..80ef5ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests/0001-Strip-Authorization-header-whenever-root-URL-changes.patch
@@ -0,0 +1,62 @@
+From fb0d391138df48e93c44a2087ea796cca5e229c0 Mon Sep 17 00:00:00 2001
+From: Bruce Merry <bmerry@ska.ac.za>
+Date: Thu, 28 Jun 2018 16:38:42 +0200
+Subject: [PATCH 1/2] Strip Authorization header whenever root URL changes
+
+Previously the header was stripped only if the hostname changed, but in
+an https -> http redirect that can leak the credentials on the wire
+(#4716). Based on with RFC 7235 section 2.2, the header is now stripped
+if the "canonical root URL" (scheme+authority) has changed, by checking
+scheme, hostname and port.
+
+Upstream-Status: Backport
+
+Fix CVE-2018-18074
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ requests/sessions.py   |  4 +++-
+ tests/test_requests.py | 12 +++++++++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/requests/sessions.py b/requests/sessions.py
+index ba13526..2969d83 100644
+--- a/requests/sessions.py
++++ b/requests/sessions.py
+@@ -242,7 +242,9 @@ class SessionRedirectMixin(object):
+             original_parsed = urlparse(response.request.url)
+             redirect_parsed = urlparse(url)
+ 
+-            if (original_parsed.hostname != redirect_parsed.hostname):
++            if (original_parsed.hostname != redirect_parsed.hostname
++                    or original_parsed.port != redirect_parsed.port
++                    or original_parsed.scheme != redirect_parsed.scheme):
+                 del headers['Authorization']
+ 
+         # .netrc might have more auth for us on our new host.
+diff --git a/tests/test_requests.py b/tests/test_requests.py
+index fcddb1d..e0e801a 100644
+--- a/tests/test_requests.py
++++ b/tests/test_requests.py
+@@ -1575,7 +1575,17 @@ class TestRequests:
+             auth=('user', 'pass'),
+         )
+         assert r.history[0].request.headers['Authorization']
+-        assert not r.request.headers.get('Authorization', '')
++        assert 'Authorization' not in r.request.headers
++
++    def test_auth_is_stripped_on_scheme_redirect(self, httpbin, httpbin_secure, httpbin_ca_bundle):
++        r = requests.get(
++            httpbin_secure('redirect-to'),
++            params={'url': httpbin('get')},
++            auth=('user', 'pass'),
++            verify=httpbin_ca_bundle
++        )
++        assert r.history[0].request.headers['Authorization']
++        assert 'Authorization' not in r.request.headers
+ 
+     def test_auth_is_retained_for_redirect_on_host(self, httpbin):
+         r = requests.get(httpbin('redirect/1'), auth=('user', 'pass'))
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python-requests/0002-Rework-authorization-stripping-logic-as-discussed.patch b/meta-python/recipes-devtools/python/python-requests/0002-Rework-authorization-stripping-logic-as-discussed.patch
new file mode 100644
index 0000000..ef069fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests/0002-Rework-authorization-stripping-logic-as-discussed.patch
@@ -0,0 +1,118 @@
+From 698c2fa850bfc8b3bdb768e1c1cd6d57e643811d Mon Sep 17 00:00:00 2001
+From: Bruce Merry <bmerry@ska.ac.za>
+Date: Tue, 14 Aug 2018 13:30:43 +0200
+Subject: [PATCH 2/2] Rework authorization stripping logic as discussed
+
+The exception for http->https upgrade now requires the standard HTTP(S)
+ports to be used, either implicitly (no port specified) or explicitly.
+
+Upstream-Status: Backport
+
+Follow-up fix for CVE-2018-18074
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ requests/sessions.py   | 26 ++++++++++++++++++--------
+ tests/test_requests.py | 33 ++++++++++++++++++++++-----------
+ 2 files changed, 40 insertions(+), 19 deletions(-)
+
+diff --git a/requests/sessions.py b/requests/sessions.py
+index 2969d83..c11a3a2 100644
+--- a/requests/sessions.py
++++ b/requests/sessions.py
+@@ -115,6 +115,22 @@ class SessionRedirectMixin(object):
+             return to_native_string(location, 'utf8')
+         return None
+ 
++    def should_strip_auth(self, old_url, new_url):
++        """Decide whether Authorization header should be removed when redirecting"""
++        old_parsed = urlparse(old_url)
++        new_parsed = urlparse(new_url)
++        if old_parsed.hostname != new_parsed.hostname:
++            return True
++        # Special case: allow http -> https redirect when using the standard
++        # ports. This isn't specified by RFC 7235, but is kept to avoid
++        # breaking backwards compatibility with older versions of requests
++        # that allowed any redirects on the same host.
++        if (old_parsed.scheme == 'http' and old_parsed.port in (80, None)
++                and new_parsed.scheme == 'https' and new_parsed.port in (443, None)):
++            return False
++        # Standard case: root URI must match
++        return old_parsed.port != new_parsed.port or old_parsed.scheme != new_parsed.scheme
++
+     def resolve_redirects(self, resp, req, stream=False, timeout=None,
+                           verify=True, cert=None, proxies=None, yield_requests=False, **adapter_kwargs):
+         """Receives a Response. Returns a generator of Responses or Requests."""
+@@ -236,16 +252,10 @@ class SessionRedirectMixin(object):
+         headers = prepared_request.headers
+         url = prepared_request.url
+ 
+-        if 'Authorization' in headers:
++        if 'Authorization' in headers and self.should_strip_auth(response.request.url, url):
+             # If we get redirected to a new host, we should strip out any
+             # authentication headers.
+-            original_parsed = urlparse(response.request.url)
+-            redirect_parsed = urlparse(url)
+-
+-            if (original_parsed.hostname != redirect_parsed.hostname
+-                    or original_parsed.port != redirect_parsed.port
+-                    or original_parsed.scheme != redirect_parsed.scheme):
+-                del headers['Authorization']
++            del headers['Authorization']
+ 
+         # .netrc might have more auth for us on our new host.
+         new_auth = get_netrc_auth(url) if self.trust_env else None
+diff --git a/tests/test_requests.py b/tests/test_requests.py
+index e0e801a..148067b 100644
+--- a/tests/test_requests.py
++++ b/tests/test_requests.py
+@@ -1567,17 +1567,7 @@ class TestRequests:
+             preq = req.prepare()
+             assert test_url == preq.url
+ 
+-    @pytest.mark.xfail(raises=ConnectionError)
+-    def test_auth_is_stripped_on_redirect_off_host(self, httpbin):
+-        r = requests.get(
+-            httpbin('redirect-to'),
+-            params={'url': 'http://www.google.co.uk'},
+-            auth=('user', 'pass'),
+-        )
+-        assert r.history[0].request.headers['Authorization']
+-        assert 'Authorization' not in r.request.headers
+-
+-    def test_auth_is_stripped_on_scheme_redirect(self, httpbin, httpbin_secure, httpbin_ca_bundle):
++    def test_auth_is_stripped_on_http_downgrade(self, httpbin, httpbin_secure, httpbin_ca_bundle):
+         r = requests.get(
+             httpbin_secure('redirect-to'),
+             params={'url': httpbin('get')},
+@@ -1594,6 +1584,27 @@ class TestRequests:
+ 
+         assert h1 == h2
+ 
++    def test_should_strip_auth_host_change(self):
++        s = requests.Session()
++        assert s.should_strip_auth('http://example.com/foo', 'http://another.example.com/')
++
++    def test_should_strip_auth_http_downgrade(self):
++        s = requests.Session()
++        assert s.should_strip_auth('https://example.com/foo', 'http://example.com/bar')
++
++    def test_should_strip_auth_https_upgrade(self):
++        s = requests.Session()
++        assert not s.should_strip_auth('http://example.com/foo', 'https://example.com/bar')
++        assert not s.should_strip_auth('http://example.com:80/foo', 'https://example.com/bar')
++        assert not s.should_strip_auth('http://example.com/foo', 'https://example.com:443/bar')
++        # Non-standard ports should trigger stripping
++        assert s.should_strip_auth('http://example.com:8080/foo', 'https://example.com/bar')
++        assert s.should_strip_auth('http://example.com/foo', 'https://example.com:8443/bar')
++
++    def test_should_strip_auth_port_change(self):
++        s = requests.Session()
++        assert s.should_strip_auth('http://example.com:1234/foo', 'https://example.com:4321/bar')
++
+     def test_manual_redirect_with_partial_body_read(self, httpbin):
+         s = requests.Session()
+         r1 = s.get(httpbin('redirect/2'), allow_redirects=False, stream=True)
+-- 
+2.7.4
+
-- 
2.7.4


