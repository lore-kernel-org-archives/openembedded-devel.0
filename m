Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4791.1795146382343166330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GoUX0nx8;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13990; q=dns/txt;
  s=iport01; t=1795146382; x=1796355982;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UJj+P0Lq6xregR0wE8AqUZDUaw622ghwKDkUgdEDmCg=;
  b=GoUX0nx8cYIBVBFt1IStX9C3yHNAub1+EyhIQne5tqAT/3U9cZ5mA1iI
   bIo+YuzEdEGQSvx6o5iv5Zm+EfFmb6FKpr2ONl7rJ1kFP3Nl4Be4mZj50
   S9M0jPtJ6tBK/vuoG0pszxigvJ6LDd3rENhek2eZ2Pkv2COh45bWPzrPH
   WlHMjGz5OSPDsqQcHURZhMLirVhLwL559jXXLe4aIhnXIkvv6fiXpEW4X
   GfrAE6gXrPSK+a4v6m9MktUNdOI+ly0NbmGf5cCAnGIEabdaX//81O0Zd
   Ise0tMUf1pOO8PWLYwmPm4szyaIKMnX9CuFepHx9rC+TSGu2tugDcjtDc
   g==;
X-CSE-ConnectionGUID: vhiGr+GjT+ixQGRMp1sJkQ==
X-CSE-MsgGUID: RTgS+9TYR7+Ao5a1d1XZQQ==
X-IPAS-Result: =?us-ascii?q?A0AuAABXwf9q/9RK/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJA4xvhziBNWwDgROKU4VqjFmBfg8BAQEPRA0EAQGEP0YCjiECJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4ThhUIMg2QEgECAQMyA?=
 =?us-ascii?q?RgBPRwDAQIvIAsjCBmDAgGCOgM3AxG5O4IsgQGDKQE/AkNQ2EwNgloBCxQBg?=
 =?us-ascii?q?TgBhUGDAIUkXRgBhH0nGxuBcoEVgnR2gQWBGhgqAQGBSIZeBIIigQyBVIELh?=
 =?us-ascii?q?TGGWwKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeTbIImUxkGAXQHEwEHAyABFxJWHAUUDxcPFAYpEQ0EGJJgJZI2o?=
 =?us-ascii?q?CBxCiiDeYwkjz6FfBozhASBV5JDklQLmH2CWYhOgmOECoQijQsqIANNhGqBa?=
 =?us-ascii?q?DyBRwsHcBWDIgkKQBkPjFiBVwoLg2CBf4MUUch3JjICCQMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAAiYCBYFPAQE?=
IronPort-Data: A9a23:YHaQlq/sQa5WBmDicsnPDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2VMCm7QP6mJNmWgLdojYI21oEwF7cLdytBlQFQ6rSlEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhMs/3rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2koPYw34KVYA10N9
 OwhBwoodkmYpeGPlefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oa3aYePIIPXLSlTtnykq
 VmFrljIOE5ZHdvCwGOJq0Kev9aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:tqJJgqhTLalyZRvc/x0zOOxq4HBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3ABCvHSmoguORqi7z3wSy54s7mUd4lc1LHj1jSHwy?=
 =?us-ascii?q?5GV9GcpiNEESy+5oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Afu+g7Q1u1C4NNdaIikL2xopB4zUj2ZihMwNcraQ?=
 =?us-ascii?q?85IqtMnF5YjvEvAaOe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62152275"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 03:46:20 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 8EEBB1800042C
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:19 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3DB81CBF201; Thu, 19 Nov 2026 19:46:18 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 2/4] python3-oauthlib: fix CVE-2026-49264
Date: Thu, 19 Nov 2026 19:46:16 -0800
Message-Id: <20261120034618.604880-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120034618.604880-1-hthakar@cisco.com>
References: <20261120034618.604880-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132757
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

When enable_jsonp=True, the token revocation endpoint reflects an
unvalidated callback into its responses. Applications loading these
responses as trusted JSONP can execute attacker-controlled JavaScript.

Backport upstream fix [1], referenced by NVD [2] and Debian [3], to
remove JSONP support from token revocation in OAuthLib 3.3.1.

Include upstream follow-up [4] to reject callback passed through
keyword arguments, including callback=None, and retain its regression
tests. Omit the CHANGELOG.rst update because its newer release-note
context is absent from the 3.3.1 source.

[1] https://github.com/oauthlib/oauthlib/commit/c888359f3c42bec235b2c5caab2069c9ed62457c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-49264
[3] https://security-tracker.debian.org/tracker/CVE-2026-49264
[4] https://github.com/oauthlib/oauthlib/commit/8f7db807dfeabc69386b4b67b14bb10c9efe56c8

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-oauthlib/CVE-2026-49264_p1.patch  | 200 ++++++++++++++++++
 .../python3-oauthlib/CVE-2026-49264_p2.patch  |  50 +++++
 .../python/python3-oauthlib_3.3.1.bb          |   2 +
 3 files changed, 252 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p1.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p1.patch
new file mode 100644
index 0000000000..e336f9b6a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p1.patch
@@ -0,0 +1,200 @@
+From c888359f3c42bec235b2c5caab2069c9ed62457c Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <jonathan.huot@gmail.com>
+Date: Fri, 22 May 2026 19:51:42 +0000
+Subject: [PATCH] Remove JSONP support from token revocation
+
+JSONP was useful in the past for cross-origin requests but has been
+superseded by CORS browser protections. This change removes the outdated
+JSONP functionality.
+
+Breaking changes:
+- Remove enable_jsonp parameter from RevocationEndpoint
+- Remove callback parameter from prepare_token_revocation_request
+- Remove JSONP documentation and examples
+- Remove JSONP tests
+
+The token revocation endpoint now returns empty response bodies on
+success instead of JSONP-wrapped responses.
+
+CVE: CVE-2026-49264
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/c888359f3c42bec235b2c5caab2069c9ed62457c]
+
+Backport Changes:
+- Omit the CHANGELOG.rst hunk because its later WIP section is absent
+  from 3.3.1. Retain all upstream code, documentation and test changes.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/oauth2/rfc6749/clients/base.py            | 24 ++--------------------
+ oauthlib/oauth2/rfc6749/endpoints/revocation.py    | 11 ++--------
+ oauthlib/oauth2/rfc6749/parameters.py              |  8 ++------
+ tests/oauth2/rfc6749/clients/test_base.py          |  7 -------
+ .../rfc6749/endpoints/test_revocation_endpoint.py  | 13 ------------
+ 5 files changed, 6 insertions(+), 57 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc6749/clients/base.py b/oauthlib/oauth2/rfc6749/clients/base.py
+index 17f833d236cb0f1ca7a4dd85f661b2e6be6b087e..cdbbc191f75393d8e17fbcd852987bb45dd9c0df 100644
+--- a/oauthlib/oauth2/rfc6749/clients/base.py
++++ b/oauthlib/oauth2/rfc6749/clients/base.py
+@@ -320,7 +320,7 @@ class Client:
+         return token_url, FORM_ENC_HEADERS, body
+ 
+     def prepare_token_revocation_request(self, revocation_url, token,
+-                                         token_type_hint="access_token", body='', callback=None, **kwargs):
++                                         token_type_hint="access_token", body='', **kwargs):
+         """Prepare a token revocation request.
+ 
+         :param revocation_url: Provider token revocation endpoint URL.
+@@ -329,14 +329,9 @@ class Client:
+             ``"refresh_token"``. This is optional and if you wish to not pass it you
+             must provide ``token_type_hint=None``.
+         :param body:
+-        :param callback: A jsonp callback such as ``package.callback`` to be invoked
+-            upon receiving the response. Not that it should not include a () suffix.
+         :param kwargs: Additional parameters to included in the request.
+         :returns: The prepared request tuple with (url, headers, body).
+ 
+-        Note that JSONP request may use GET requests as the parameters will
+-        be added to the request URL query as opposed to the request body.
+-
+         An example of a revocation request
+ 
+         .. code-block:: http
+@@ -348,21 +343,6 @@ class Client:
+ 
+             token=45ghiukldjahdnhzdauz&token_type_hint=refresh_token
+ 
+-        An example of a jsonp revocation request
+-
+-        .. code-block:: http
+-
+-            GET /revoke?token=agabcdefddddafdd&callback=package.myCallback HTTP/1.1
+-            Host: server.example.com
+-            Content-Type: application/x-www-form-urlencoded
+-            Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW
+-
+-        and an error response
+-
+-        .. code-block:: javascript
+-
+-            package.myCallback({"error":"unsupported_token_type"});
+-
+         Note that these requests usually require client credentials, client_id in
+         the case for public clients and provider specific authentication
+         credentials for confidential clients.
+@@ -371,7 +351,7 @@ class Client:
+             raise InsecureTransportError()
+ 
+         return prepare_token_revocation_request(revocation_url, token,
+-                                                token_type_hint=token_type_hint, body=body, callback=callback,
++                                                token_type_hint=token_type_hint, body=body,
+                                                 **kwargs)
+ 
+     def parse_request_body_response(self, body, scope=None, **kwargs):
+diff --git a/oauthlib/oauth2/rfc6749/endpoints/revocation.py b/oauthlib/oauth2/rfc6749/endpoints/revocation.py
+index 596d0860fae67017a86b1042fcf9edb674fdf38d..06b450a43fa7c9b74c293b0cbade270629c0a9f1 100644
+--- a/oauthlib/oauth2/rfc6749/endpoints/revocation.py
++++ b/oauthlib/oauth2/rfc6749/endpoints/revocation.py
+@@ -27,13 +27,11 @@ class RevocationEndpoint(BaseEndpoint):
+     valid_token_types = ('access_token', 'refresh_token')
+     valid_request_methods = ('POST',)
+ 
+-    def __init__(self, request_validator, supported_token_types=None,
+-            enable_jsonp=False):
++    def __init__(self, request_validator, supported_token_types=None):
+         BaseEndpoint.__init__(self)
+         self.request_validator = request_validator
+         self.supported_token_types = (
+             supported_token_types or self.valid_token_types)
+-        self.enable_jsonp = enable_jsonp
+ 
+     @catch_errors_and_unavailability
+     def create_revocation_response(self, uri, http_method='POST', body=None,
+@@ -69,18 +67,13 @@ class RevocationEndpoint(BaseEndpoint):
+         except OAuth2Error as e:
+             log.debug('Client error during validation of %r. %r.', request, e)
+             response_body = e.json
+-            if self.enable_jsonp and request.callback:
+-                response_body = '{}({});'.format(request.callback, response_body)
+             resp_headers.update(e.headers)
+             return resp_headers, response_body, e.status_code
+ 
+         self.request_validator.revoke_token(request.token,
+                                             request.token_type_hint, request)
+ 
+-        response_body = ''
+-        if self.enable_jsonp and request.callback:
+-            response_body = request.callback + '();'
+-        return {}, response_body, 200
++        return {}, '', 200
+ 
+     def validate_revocation_request(self, request):
+         """Ensure the request is valid.
+diff --git a/oauthlib/oauth2/rfc6749/parameters.py b/oauthlib/oauth2/rfc6749/parameters.py
+index 8268ef927cc2d174f44a00e60cf07156fb223db7..b912e447b817c7ed125900f4e5c455ff416cb6d2 100644
+--- a/oauthlib/oauth2/rfc6749/parameters.py
++++ b/oauthlib/oauth2/rfc6749/parameters.py
+@@ -172,7 +172,7 @@ def prepare_token_request(grant_type, body='', include_client_id=True, code_veri
+ 
+ 
+ def prepare_token_revocation_request(url, token, token_type_hint="access_token",
+-        callback=None, body='', **kwargs):
++        body='', **kwargs):
+     """Prepare a token revocation request.
+ 
+     The client constructs the request by including the following parameters
+@@ -222,11 +222,7 @@ def prepare_token_revocation_request(url, token, token_type_hint="access_token",
+ 
+     headers = {'Content-Type': 'application/x-www-form-urlencoded'}
+ 
+-    if callback:
+-        params.append(('callback', callback))
+-        return add_params_to_uri(url, params), headers, body
+-    else:
+-        return url, headers, add_params_to_qs(body, params)
++    return url, headers, add_params_to_qs(body, params)
+ 
+ 
+ def parse_authorization_code_response(uri, state=None):
+diff --git a/tests/oauth2/rfc6749/clients/test_base.py b/tests/oauth2/rfc6749/clients/test_base.py
+index b0970f2d46a5f053ad7100ebda3f09bc27bc5281..d01a1dbdcc4232eacb8dafbf6f81c871f641aa35 100644
+--- a/tests/oauth2/rfc6749/clients/test_base.py
++++ b/tests/oauth2/rfc6749/clients/test_base.py
+@@ -237,13 +237,6 @@ class ClientTest(TestCase):
+         self.assertEqual(h, {'Content-Type': 'application/x-www-form-urlencoded'})
+         self.assertEqual(b, 'token=%s&token_type_hint=refresh_token' % token)
+ 
+-        # JSONP
+-        u, h, b = client.prepare_token_revocation_request(
+-            url, token, callback='hello.world')
+-        self.assertURLEqual(u, url + '?callback=hello.world&token=%s&token_type_hint=access_token' % token)
+-        self.assertEqual(h, {'Content-Type': 'application/x-www-form-urlencoded'})
+-        self.assertEqual(b, '')
+-
+     def test_prepare_authorization_request(self):
+         redirect_url = 'https://example.com/callback/'
+         scopes = 'read'
+diff --git a/tests/oauth2/rfc6749/endpoints/test_revocation_endpoint.py b/tests/oauth2/rfc6749/endpoints/test_revocation_endpoint.py
+index 338dbd91faa795a0c25d7254818fbf72879c2920..d347b1767c285bddd1e99910e173df2343239add 100644
+--- a/tests/oauth2/rfc6749/endpoints/test_revocation_endpoint.py
++++ b/tests/oauth2/rfc6749/endpoints/test_revocation_endpoint.py
+@@ -88,19 +88,6 @@ class RevocationEndpointTest(TestCase):
+         self.assertEqual(loads(b)['error'], 'invalid_client')
+         self.assertEqual(s, 401)
+ 
+-    def test_revoke_with_callback(self):
+-        endpoint = RevocationEndpoint(self.validator, enable_jsonp=True)
+-        callback = 'package.hello_world'
+-        for token_type in ('access_token', 'refresh_token', 'invalid'):
+-            body = urlencode([('token', 'foo'),
+-                              ('token_type_hint', token_type),
+-                              ('callback', callback)])
+-            h, b, s = endpoint.create_revocation_response(self.uri,
+-                    headers=self.headers, body=body)
+-            self.assertEqual(h, {})
+-            self.assertEqual(b, callback + '();')
+-            self.assertEqual(s, 200)
+-
+     def test_revoke_unsupported_token(self):
+         endpoint = RevocationEndpoint(self.validator,
+                                       supported_token_types=['access_token'])
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p2.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p2.patch
new file mode 100644
index 0000000000..24694cc8d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49264_p2.patch
@@ -0,0 +1,50 @@
+From 8f7db807dfeabc69386b4b67b14bb10c9efe56c8 Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <jonathan.huot@gmail.com>
+Date: Sat, 11 Jul 2026 12:21:48 +0200
+Subject: [PATCH] Reject callback in revocation params
+
+Prevent callback from being accepted via kwargs in prepare_token_revocation_request, and add a regression test to ensure callback now raises TypeError.
+
+CVE: CVE-2026-49264
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/8f7db807dfeabc69386b4b67b14bb10c9efe56c8]
+
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/oauth2/rfc6749/parameters.py   | 3 +++
+ tests/oauth2/rfc6749/test_parameters.py | 8 ++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/oauthlib/oauth2/rfc6749/parameters.py b/oauthlib/oauth2/rfc6749/parameters.py
+index 1b026037..ae483b9e 100644
+--- a/oauthlib/oauth2/rfc6749/parameters.py
++++ b/oauthlib/oauth2/rfc6749/parameters.py
+@@ -216,6 +216,9 @@ def prepare_token_revocation_request(url, token, token_type_hint="access_token",
+     if token_type_hint:
+         params.append(('token_type_hint', token_type_hint))
+ 
++    if 'callback' in kwargs:
++        raise TypeError("prepare_token_revocation_request() got an unexpected keyword argument 'callback'")
++
+     for k in kwargs:
+         if kwargs[k]:
+             params.append((str(k), kwargs[k]))
+diff --git a/tests/oauth2/rfc6749/test_parameters.py b/tests/oauth2/rfc6749/test_parameters.py
+index bd8a8b61..0c14de99 100644
+--- a/tests/oauth2/rfc6749/test_parameters.py
++++ b/tests/oauth2/rfc6749/test_parameters.py
+@@ -208,6 +208,14 @@ def test_prepare_token_request(self):
+         self.assertFormBodyEqual(prepare_token_request(**self.cred_grant), self.cred_body)
+         self.assertFormBodyEqual(prepare_token_request(**self.grant_body_pkce), self.auth_grant_body_pkce)
+ 
++    def test_prepare_token_revocation_request_rejects_callback(self):
++        with self.assertRaisesRegex(
++                TypeError,
++                "prepare_token_revocation_request\\(\\) got an unexpected keyword argument 'callback'"):
++            prepare_token_revocation_request(
++                "https://server.example.com/revoke", "token", callback="jsonp"
++            )
++
+     def test_grant_response(self):
+         """Verify correct parameter parsing and validation for auth code responses."""
+         params = parse_authorization_code_response(self.grant_response)
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index 0974020a17..ffb07fef30 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 SRC_URI += " \
     file://CVE-2026-49265_p1.patch \
     file://CVE-2026-49265_p2.patch \
+    file://CVE-2026-49264_p1.patch \
+    file://CVE-2026-49264_p2.patch \
 "
 
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
-- 
2.35.6

