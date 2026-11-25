Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36178.1795583898954195692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lyLx1QAI;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9866; q=dns/txt;
  s=iport01; t=1795583899; x=1796793499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GxgHw/h9pIXjubyKRU85SXvfG/XlBoRCH0VD0P2kIg4=;
  b=lyLx1QAI6zQOfaTSQ8PlcU8pyVrUB6Sw5BM53eVCeofmfw7YqLnuXuYW
   sB9hHh+QdPj20jB1iHHUdhqatdRC+jzeQFLY3JksXKeq0ji494w+hz372
   cHbPJvQEwyCJUEFNwi1dS0X4tGfr+cvIjfsRsxdIWR+misKo1sAEVUVFU
   09GGOd62nl6RK1hlEYZeWAXUEdjJkI1ZBn4XG9ucO5NIfF3Xy4gwcuhdq
   rbHx1R6Hs2lYfhfW3xI8VHHec5HZs8CWkZdMrvZ8nislkr549z3R6cQu0
   rNozLnQP7Q8B75fhPfura0NRwAzN5l2XJi6inKeoe1ltr1z/jo8jPhJFd
   g==;
X-CSE-ConnectionGUID: /V/e9MkPRqm07MESVp35fg==
X-CSE-MsgGUID: 5xcxeXVmTHeJCemEMLwXng==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/9VK/pBRCYJZgld1YENJA5ZIA54pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRugOBeTOBA?=
 =?us-ascii?q?YMpAYFU2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVgTuCL4EFgVwBAYEnDYZyB?=
 =?us-ascii?q?IIigQyBVIELjAgCgUmIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF0BIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CK?=
 =?us-ascii?q?QYWIQs0GA1IESw3FRkEPm4HlBMVgwYtVA0BKgGBfRAfHB6SfQGQHIIhoREKK?=
 =?us-ascii?q?IN5jCSVOhozhVulFwuYfYVTgy6CNoJTlVd6hGqBaDyBWXAVgyIJShkPWI1WC?=
 =?us-ascii?q?wuDYIVkyHcmMgIJAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:/meN7a1RtnV8de/S0/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzJVz
 TRJXj3SbK6PMzfyftsnPduy/UxUupXTx4VmTVFu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGS39xMNw9+d5NGGQWq
 tk1Ew4VNU2NiLfjqF67YrEEasULJcTxeYdasXZ6wHSAV7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU+ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjuOzaoeNJIbiqcN9w1aTt
 m/2wWHFIhw4H9Ga5B+h7UKqibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:C8P5xaMNNXqSg8BcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:PAIutmy31sI5RrDH3PM8BgVTJIcoI1je9E3JJhfnLEtSdqXOFFGfrfY=
X-Talos-MUID: 9a23:fnoTugVq8Sejl8vq/GL8jyFvBPlt34SjKmsAlLgjn9a0MyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="63625062"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id C59521800035D;
	Wed, 25 Nov 2026 05:18:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6DDDCCBF202; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/9] python3-aiohttp: fix CVE-2026-111749
Date: Tue, 24 Nov 2026 21:18:04 -0800
Message-Id: <20261125051811.2524271-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132968
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream host-only cookie state fix [1] to aiohttp
3.9.5, as identified by [2]. Track host-only state by domain, path
and name so expiring another cookie cannot widen its domain scope.

Preserve this identity during filtering, replacement and JSON
persistence. Adapt regression assertions to the existing private
state because 3.9.5 lacks the newer public inspection property.

[1] https://github.com/aio-libs/aiohttp/commit/6a07c171ef9f3be583e2907dcd1931372efca8d6
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-gx76-c99x-2c96

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111749.patch     | 197 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
new file mode 100644
index 0000000000..2a67cf3542
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
@@ -0,0 +1,197 @@
+From 6a07c171ef9f3be583e2907dcd1931372efca8d6 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 02:21:06 +0100
+Subject: [PATCH] Fix host-only state on cookie expiration (#13674) (#13676)
+
+CVE: CVE-2026-111749
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6a07c171ef9f3be583e2907dcd1931372efca8d6]
+
+Backport Changes:
+- Apply marker deletion in clear() because 3.9.5 predates the
+  _delete_cookies() helper, and preserve its untrimmed path keys.
+  Root cookie markers therefore use "/" instead of an empty path.
+- Use 3.9.5 Set/Tuple annotations and update_cookies(SimpleCookie)
+  calls; adapt regressions to private _host_only_cookies assertions.
+- Omit public host_only_cookies annotations and documentation in
+  CookieJar, DummyCookieJar and AbstractCookieJar, and the associated
+  test-jar/property changes; those interfaces are absent in 3.9.5.
+
+(cherry picked from commit 9332972cfcb0f5a2b6677e7307819ab8f13b5d09)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13674.bugfix.rst |  1 +
+ aiohttp/cookiejar.py     | 25 +++++++++-------
+ tests/test_cookiejar.py  | 62 +++++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 76 insertions(+), 12 deletions(-)
+ create mode 100644 CHANGES/13674.bugfix.rst
+
+diff --git a/CHANGES/13674.bugfix.rst b/CHANGES/13674.bugfix.rst
+new file mode 100644
+index 0000000..5152bce
+--- /dev/null
++++ b/CHANGES/13674.bugfix.rst
+@@ -0,0 +1 @@
++Fixed host-only cookie state being lost on expiration -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 4f694b6..0800a53 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -124,7 +124,8 @@ class CookieJar(AbstractCookieJar):
+         self._cookies: DefaultDict[Tuple[str, str], SimpleCookie] = defaultdict(
+             SimpleCookie
+         )
+-        self._host_only_cookies: Set[Tuple[str, str]] = set()
++        # Cookie identity is (domain, path, name).
++        self._host_only_cookies: Set[Tuple[str, str, str]] = set()
+         self._unsafe = unsafe
+         self._quote_cookie = quote_cookie
+         if treat_as_secure_origin is None:
+@@ -167,7 +168,7 @@ class CookieJar(AbstractCookieJar):
+                     if attr_val:
+                         morsel_data[attr] = attr_val
+                 # Persist or it reloads as a domain cookie and leaks to subdomains.
+-                if (domain, name) in self._host_only_cookies:
++                if (domain, path, name) in self._host_only_cookies:
+                     morsel_data["host_only"] = True
+                 if (exp := self._expirations.get((domain, path, name))) is not None:
+                     morsel_data["expires_timestamp"] = exp
+@@ -256,7 +257,7 @@ class CookieJar(AbstractCookieJar):
+                     to_del.append(key)
+ 
+         for domain, path, name in to_del:
+-            self._host_only_cookies.discard((domain, name))
++            self._host_only_cookies.discard((domain, path, name))
+             key = (domain, path, name)
+             if key in self._expirations:
+                 del self._expirations[(domain, path, name)]
+@@ -310,18 +311,12 @@ class CookieJar(AbstractCookieJar):
+                 domain = ""
+                 del cookie["domain"]
+ 
+-            if not domain and hostname is not None:
+-                # Set the cookie's domain to the response hostname
+-                # and set its host-only-flag
+-                self._host_only_cookies.add((hostname, name))
+-                domain = cookie["domain"] = hostname
+-
+             if domain.startswith("."):
+                 # Remove leading dot
+                 domain = domain[1:]
+                 cookie["domain"] = domain
+ 
+-            if hostname and not self._is_domain_match(domain, hostname):
++            if domain and hostname and not self._is_domain_match(domain, hostname):
+                 # Setting cookies for different domains is not allowed
+                 continue
+ 
+@@ -336,6 +331,14 @@ class CookieJar(AbstractCookieJar):
+                     path = "/" + path[1 : path.rfind("/")]
+                 cookie["path"] = path
+ 
++            if not domain and hostname is not None:
++                self._host_only_cookies.add((hostname, path, name))
++                domain = cookie["domain"] = hostname
++            else:
++                # A cookie with an explicit Domain attribute replaces any
++                # host-only cookie with the same (domain, path, name) identity.
++                self._host_only_cookies.discard((domain, path, name))
++
+             max_age = cookie["max-age"]
+             if max_age:
+                 try:
+@@ -393,7 +396,7 @@ class CookieJar(AbstractCookieJar):
+             if not self._unsafe and is_ip_address(hostname):
+                 continue
+ 
+-            if (domain, name) in self._host_only_cookies:
++            if (domain, cookie["path"], name) in self._host_only_cookies:
+                 if domain != hostname:
+                     continue
+             elif not self._is_domain_match(domain, hostname):
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index df59759..3e344c2 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -868,6 +868,44 @@ async def test_treat_as_secure_origin() -> None:
+     assert len(filtered_cookies) == 1
+ 
+ 
++async def test_host_only_marker_survives_same_name_expiry_on_other_path() -> None:
++    """Expiring a same-name cookie on another path must not clear host-only state."""
++    jar = CookieJar()
++    origin = URL("http://auth.example.com/")
++    subdomain = URL("http://evil.auth.example.com/")
++
++    jar.update_cookies(SimpleCookie("sid=secret; Path=/"), origin)
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    # Attacker-controlled descendant expires a same-name cookie on its own path.
++    jar.update_cookies(
++        SimpleCookie("sid=gone; Domain=auth.example.com; Path=/attacker; Max-Age=0"),
++        subdomain,
++    )
++
++    assert ("auth.example.com", "/", "sid") in jar._host_only_cookies
++    assert "sid" not in jar.filter_cookies(subdomain)
++    assert jar.filter_cookies(origin)["sid"].value == "secret"
++
++
++async def test_explicit_domain_replacement_clears_host_only_marker() -> None:
++    """A replacing cookie with an explicit Domain is a domain cookie."""
++    jar = CookieJar()
++    origin = URL("http://example.com/")
++    subdomain = URL("http://sub.example.com/")
++
++    jar.update_cookies(SimpleCookie("sid=hostonly; Path=/"), origin)
++    assert ("example.com", "/", "sid") in jar._host_only_cookies
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    jar.update_cookies(
++        SimpleCookie("sid=domainwide; Domain=example.com; Path=/"), origin
++    )
++
++    assert jar._host_only_cookies == set()
++    assert jar.filter_cookies(subdomain)["sid"].value == "domainwide"
++
++
+ # === Security tests for restricted unpickler and JSON save/load ===
+ 
+ 
+@@ -994,7 +1032,7 @@ async def test_save_load_json_preserves_host_only_scope(tmp_path: Path) -> None:
+     jar_load = CookieJar()
+     jar_load.load(file_path=file_path)
+ 
+-    assert jar_load._host_only_cookies == {("auth.example.com", "sid")}
++    assert jar_load._host_only_cookies == {("auth.example.com", "/", "sid")}
+     assert "sid" not in jar_load.filter_cookies(subdomain)
+     assert "sid" in jar_load.filter_cookies(issuer)
+ 
+@@ -1020,6 +1058,28 @@ async def test_save_load_json_domain_cookie_still_matches_subdomain(
+     assert "sid" in jar_load.filter_cookies(subdomain)
+ 
+ 
++async def test_save_load_json_host_only_per_path(tmp_path: Path) -> None:
++    """Verify save/load keeps host-only state per (domain, path, name)."""
++    file_path = tmp_path / "per_path.json"
++    origin = URL("https://example.com/")
++    subdomain = URL("https://sub.example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies(SimpleCookie("sid=hostonly; Path=/"), origin)
++    jar_save.update_cookies(
++        SimpleCookie("sid=domainwide; Domain=example.com; Path=/api"), origin
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load._host_only_cookies == {("example.com", "/", "sid")}
++    assert "sid" not in jar_load.filter_cookies(subdomain)
++    filtered = jar_load.filter_cookies(URL("https://sub.example.com/api/x"))
++    assert filtered["sid"].value == "domainwide"
++
++
+ async def test_save_load_json_preserves_max_age_deadline(tmp_path: Path) -> None:
+     """Verify save/load restores the absolute deadline without resetting it."""
+     file_path = tmp_path / "max_age.json"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 3c9a82b012..90475a5aff 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54273_p1.patch \
            file://CVE-2026-54273_p2.patch \
            file://CVE-2026-111750.patch \
+           file://CVE-2026-111749.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
