Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1306.1793950037587061845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N//60w/6;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10105; q=dns/txt;
  s=iport01; t=1793950037; x=1795159637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IIVUTOiZeuf78/d1W9z8KlQ5ybKkjIZ2CnNIdHfjztc=;
  b=N//60w/6sVGnGYApLu031MzC+0TmFpk3FzZvyenZjL6j6KvtDiY9wgsx
   9inGb+9rp5YpJr9uRgTcN0YHr07KVzr5FQGBzyRQvzlWTSe8LqbK4P0Aa
   80TkweKReWjbeGNcABStFLtgZX1OrnsXZCQ/ZN1HjlGwUjjx1LVPDUzst
   DChbfaQpBNTnKDFvSRwxJHhgPxbJ7zZ8QHVVthw4m9Ez7ZOdJHYPdWPNh
   mv8YbhGy0FBLnEb2miYQ1H7s7MBouXtZpSjS8kGxC1V/gMsZCuqI+0PVF
   LASOT3gY7VtnQpkQwZkrCWgfIsHTzPmMbvAof/nDpV6c/0WOZOdWl9Tuy
   A==;
X-CSE-ConnectionGUID: SnwDtqM2SQCLuI+AlHe8cg==
X-CSE-MsgGUID: MR3Zu+srRFSNGMwPd5PYgA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmf+1q/43/Ja1RCR4BAQsSDIIFC4JXdWBDSQOWS?=
 =?us-ascii?q?AORTIxVgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCd?=
 =?us-ascii?q?AMRvBKBeTOBAYMpAYFU2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVgTuCLoEFg?=
 =?us-ascii?q?VwBAYE0hnIEgiKBDIFagQMJjAwCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bC?=
 =?us-ascii?q?i8YDUgRLDcVGQQ+bgeSPRWCdgctVA0BKgGBfRAfHB6jG4IhoREKKIN4jCSVO?=
 =?us-ascii?q?hozhASBV6UWC5h9glmCeoMugjaCU5VXKgNNhGmBaDyBWXAVO4JnCUoZD1iNV?=
 =?us-ascii?q?gsLg2CFZMZNJjICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:P8c3S6DccA8XJRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGtw0GYCz
 GMaUDzQb6qIZWL3fNp3aNnk8UNVvZbcx9NgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+PNxIF0vGNcjw81THEAN3
 Pg4JWAGYUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEtjeK9YIaMILRmQ+1wpB2qu
 yHd5V7XOTc1EcOnxWe9w32F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:6MEpwausRpRxmbQ6WxTCofhm7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:zlSLWm9AFiKefSIIZkaVv3USBew5a1iH9077B1KZSk9taLDFQlDFrQ==
X-Talos-MUID: 9a23:6PfhFwjGtcFYxAIzyOgEF8MpEf0z0bntE1o3v64glOybDSAtAwaSpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545288412"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 7F2A618000191;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2B656CBF203; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 3/7] python3-aiohttp: fix CVE-2026-111749
Date: Thu,  5 Nov 2026 23:26:58 -0800
Message-Id: <20261106072702.502813-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131966
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream host-only cookie state fix [1] to aiohttp
3.13.5, as identified by [2]. Track host-only state by domain, path
and name so expiring another cookie cannot widen its domain scope.

Preserve this identity during filtering, replacement and JSON
persistence. Adapt regression assertions to the existing private
state because 3.13.5 lacks the newer public inspection property.

[1] https://github.com/aio-libs/aiohttp/commit/6a07c171ef9f3be583e2907dcd1931372efca8d6
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-gx76-c99x-2c96

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111749.patch     | 205 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
new file mode 100644
index 0000000000..475229e180
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
@@ -0,0 +1,205 @@
+From 6a07c171ef9f3be583e2907dcd1931372efca8d6 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 02:21:06 +0100
+Subject: [PATCH] Fix host-only state on cookie expiration (#13674) (#13676)
+
+(cherry picked from commit 9332972cfcb0f5a2b6677e7307819ab8f13b5d09)
+
+CVE: CVE-2026-111749
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6a07c171ef9f3be583e2907dcd1931372efca8d6]
+
+Backport Changes:
+- Refresh the runtime hunks for aiohttp 3.13.5 and its existing
+  JSON cookie persistence backport; retain Set/Tuple type spelling.
+- Omit annotation changes for the public host_only_cookies property
+  in CookieJar, DummyCookieJar, AbstractCookieJar and the test jar.
+  That property and its documentation were introduced in 3.14.
+- Omit the absent public-property test update and use private
+  _host_only_cookies assertions in the regression and JSON tests.
+  Adapt both existing JSON scope assertions to the private state.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13674.bugfix.rst |  1 +
+ aiohttp/cookiejar.py     | 25 +++++++++-------
+ tests/test_cookiejar.py  | 64 ++++++++++++++++++++++++++++++++++++++--
+ 3 files changed, 77 insertions(+), 13 deletions(-)
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
+index b07d1fd..c5e5b09 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -139,7 +139,8 @@ class CookieJar(AbstractCookieJar):
+         self._morsel_cache: DefaultDict[Tuple[str, str], Dict[str, Morsel[str]]] = (
+             defaultdict(dict)
+         )
+-        self._host_only_cookies: Set[Tuple[str, str]] = set()
++        # Cookie identity is (domain, path, name).
++        self._host_only_cookies: Set[Tuple[str, str, str]] = set()
+         self._unsafe = unsafe
+         self._quote_cookie = quote_cookie
+         if treat_as_secure_origin is None:
+@@ -186,7 +187,7 @@ class CookieJar(AbstractCookieJar):
+                     if attr_val:
+                         morsel_data[attr] = attr_val
+                 # Persist or it reloads as a domain cookie and leaks to subdomains.
+-                if (domain, name) in self._host_only_cookies:
++                if (domain, path, name) in self._host_only_cookies:
+                     morsel_data["host_only"] = True
+                 if (exp := self._expirations.get((domain, path, name))) is not None:
+                     morsel_data["expires_timestamp"] = exp
+@@ -340,7 +341,7 @@ class CookieJar(AbstractCookieJar):
+ 
+     def _delete_cookies(self, to_del: List[Tuple[str, str, str]]) -> None:
+         for domain, path, name in to_del:
+-            self._host_only_cookies.discard((domain, name))
++            self._host_only_cookies.discard((domain, path, name))
+             self._cookies[(domain, path)].pop(name, None)
+             self._morsel_cache[(domain, path)].pop(name, None)
+             self._expirations.pop((domain, path, name), None)
+@@ -377,18 +378,12 @@ class CookieJar(AbstractCookieJar):
+                 domain = ""
+                 del cookie["domain"]
+ 
+-            if not domain and hostname is not None:
+-                # Set the cookie's domain to the response hostname
+-                # and set its host-only-flag
+-                self._host_only_cookies.add((hostname, name))
+-                domain = cookie["domain"] = hostname
+-
+             if domain and domain[0] == ".":
+                 # Remove leading dot
+                 domain = domain[1:]
+                 cookie["domain"] = domain
+ 
+-            if hostname and not self._is_domain_match(domain, hostname):
++            if domain and hostname and not self._is_domain_match(domain, hostname):
+                 # Setting cookies for different domains is not allowed
+                 continue
+ 
+@@ -404,6 +399,14 @@ class CookieJar(AbstractCookieJar):
+                 cookie["path"] = path
+             path = path.rstrip("/")
+ 
++            if not domain and hostname is not None:
++                self._host_only_cookies.add((hostname, path, name))
++                domain = cookie["domain"] = hostname
++            else:
++                # A cookie with an explicit Domain attribute replaces any
++                # host-only cookie with the same (domain, path, name) identity.
++                self._host_only_cookies.discard((domain, path, name))
++
+             if max_age := cookie["max-age"]:
+                 try:
+                     delta_seconds = int(max_age)
+@@ -493,7 +496,7 @@ class CookieJar(AbstractCookieJar):
+             for name, cookie in self._cookies[p].items():
+                 domain = cookie["domain"]
+ 
+-                if (domain, name) in self._host_only_cookies and domain != hostname:
++                if domain != hostname and p + (name,) in self._host_only_cookies:
+                     continue
+ 
+                 # Skip edge case when the cookie has a trailing slash but request doesn't.
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index ba7ee32..f82861e 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1625,6 +1625,44 @@ async def test_shared_cookie_with_multiple_domains() -> None:
+     assert "universal" in jar._morsel_cache[("", "")]
+ 
+ 
++async def test_host_only_marker_survives_same_name_expiry_on_other_path() -> None:
++    """Expiring a same-name cookie on another path must not clear host-only state."""
++    jar = CookieJar()
++    origin = URL("http://auth.example.com/")
++    subdomain = URL("http://evil.auth.example.com/")
++
++    jar.update_cookies_from_headers(["sid=secret; Path=/"], origin)
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    # Attacker-controlled descendant expires a same-name cookie on its own path.
++    jar.update_cookies_from_headers(
++        ["sid=gone; Domain=auth.example.com; Path=/attacker; Max-Age=0"],
++        subdomain,
++    )
++
++    assert ("auth.example.com", "", "sid") in jar._host_only_cookies
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
++    jar.update_cookies_from_headers(["sid=hostonly; Path=/"], origin)
++    assert ("example.com", "", "sid") in jar._host_only_cookies
++    assert "sid" not in jar.filter_cookies(subdomain)
++
++    jar.update_cookies_from_headers(
++        ["sid=domainwide; Domain=example.com; Path=/"], origin
++    )
++
++    assert jar._host_only_cookies == set()
++    assert jar.filter_cookies(subdomain)["sid"].value == "domainwide"
++
++
+ # === Security tests for restricted unpickler and JSON save/load ===
+ 
+ 
+@@ -1775,7 +1813,7 @@ async def test_save_load_json_preserves_host_only_scope(tmp_path: Path) -> None:
+     jar_load = CookieJar()
+     jar_load.load(file_path=file_path)
+ 
+-    assert jar_load.host_only_cookies == frozenset({("auth.example.com", "sid")})
++    assert jar_load._host_only_cookies == {("auth.example.com", "", "sid")}
+     assert "sid" not in jar_load.filter_cookies(subdomain)
+     assert "sid" in jar_load.filter_cookies(issuer)
+ 
+@@ -1796,10 +1834,32 @@ async def test_save_load_json_domain_cookie_still_matches_subdomain(
+     jar_load = CookieJar()
+     jar_load.load(file_path=file_path)
+ 
+-    assert jar_load.host_only_cookies == frozenset()
++    assert jar_load._host_only_cookies == set()
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
++    jar_save.update_cookies_from_headers(
++        ["sid=hostonly; Path=/", "sid=domainwide; Domain=example.com; Path=/api"],
++        origin,
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load._host_only_cookies == {("example.com", "", "sid")}
++    assert "sid" not in jar_load.filter_cookies(subdomain)
++    filtered = jar_load.filter_cookies(URL("https://sub.example.com/api/x"))
++    assert filtered["sid"].value == "domainwide"
++
++
+ async def test_save_load_json_preserves_max_age_deadline(tmp_path: Path) -> None:
+     """Verify save/load restores the absolute deadline without resetting it."""
+     file_path = tmp_path / "max_age.json"
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 40ac847c01..17398ab323 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
     file://CVE-2026-111066_p1.patch \
     file://CVE-2026-111066_p2.patch \
     file://CVE-2026-111750.patch \
+    file://CVE-2026-111749.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6
