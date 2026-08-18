Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A0C5DF89
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:36 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15268.1787076932656748628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JbW2KfcH;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13294; q=dns/txt;
  s=iport01; t=1787076932; x=1788286532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yLVKO7VW872JoOexyAtmmHCJQH4L+tFY1t3dUbULZIY=;
  b=JbW2KfcH/6Ooba5IWAPWeBAn84/AGm8ohQS60X9Qcu9O9VSel06yaB9N
   RCDfDnOsxwCv0BZVKcIE/tS6ID0jZodmPcm+LrIsshM/9472wbcLwe6V8
   UbxXmBsh4YJNveNK6nEHbaZsuOCSC/Ox9QgZUwWzMaz/WaRMMkjkpCWrH
   xyY753Xg23K711+OLld97hoSoGtJsaDytN4+jHBkE+WRq8U2TLGYsiyty
   BPV3sugRk3MphI0Op1RJaVs72s3dl3eHDSHcBfpFL9Qlh57ZIeZG8GQv8
   djx0LoMrbtwS23kfHX2rtWJteUOTdF6B63FIDVYsSxykSz0Jx0s/InaAF
   w==;
X-CSE-ConnectionGUID: 7vsDNPuQSIy2sqZ4UZwOUQ==
X-CSE-MsgGUID: J7X82p63Sju/rpzGQhu3Ig==
X-IPAS-Result: =?us-ascii?q?A0BJAgBIoIRq/48QJK1aHgEBCxIMggULgld0XkNJA5ZHA?=
 =?us-ascii?q?5lthC6Bfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAhcBFysjCBmDAgGCd?=
 =?us-ascii?q?AMRxEaBeTOBAYMoAYFU2zABCxQBBYEzhT+IIl0YAYR8JxsbgXKBFYE7gi6BB?=
 =?us-ascii?q?YFcAoIoAoV7BIIigQyBWpFWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4ENGwYFgR2BKIQ3Ixk2eoEJXoErKmEBEheBCYIKAoJzggYCAUlFDgsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeOOCCBUXItEEQNASsEUgE6BwhYEwI7BhiScpApgiGBNZ9aCiiDd?=
 =?us-ascii?q?owhjg2HLRozhVulEQuYfYkBgjaCU4oNi0l6hGmBaDyBWXAVgyIJShkPV41WC?=
 =?us-ascii?q?wuDYIVkxlUnMgIIAQooAQEHAgcOAwuBaJACLW9gAQE?=
IronPort-Data: A9a23:WqLQtatOH5YZIX0Hd//2b5GZWufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTiGPazfZDSgLdskOt6/80wOv5WAytZrTQNq+382QnkSgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La90s01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpfhsLUd26
 MUjCSFXdQmx29+E35WGc7w57igjBJGD0II3s3Vky3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgx/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9KoXTFZkMwh7Bz
 o7A10amMkFALILE8jiYtWi0lMD2nT6geY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:agQFQapZ3ejJbO47vuvrcHkaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3As8aZVWplcuAT7CyoxzkabhjmUZ87aVH79GrpGG6?=
 =?us-ascii?q?pU31weuGoe0C3xZoxxg=3D=3D?=
X-Talos-MUID: 9a23:t1JB9ggihp+uN2iSUUv27MMpFphYs/62Vhs2k4hBodGWGhVwJmy8g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="811841401"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id F2D9618000589;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 406BACD03C3; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 09/10] python3-aiohttp: fix CVE-2026-54279
Date: Tue, 18 Aug 2026 11:15:27 -0700
Message-Id: <20260818181528.3405276-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129236

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/a329a7aacad5284f087af36103aff778746da0f2
[2] https://github.com/advisories/GHSA-2fqr-mr3j-6wp8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54279.patch      | 295 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 296 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
new file mode 100644
index 0000000000..9dd96d49e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
@@ -0,0 +1,295 @@
+From 9fff50c82e4fd6baa8252cb573d4a5f3df1a9dcb Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:40:24 -0500
+Subject: [PATCH] [PR #12824/60b85e98 backport][3.14] Preserve host-only cookie
+ scope across CookieJar save/load (#12833)
+
+CVE: CVE-2026-54279
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/a329a7aacad5284f087af36103aff778746da0f2]
+
+(cherry picked from commit a329a7aacad5284f087af36103aff778746da0f2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12824.bugfix.rst |   1 +
+ aiohttp/cookiejar.py     |  52 ++++++++++-----
+ tests/test_cookiejar.py  | 135 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 171 insertions(+), 17 deletions(-)
+ create mode 100644 CHANGES/12824.bugfix.rst
+
+diff --git a/CHANGES/12824.bugfix.rst b/CHANGES/12824.bugfix.rst
+new file mode 100644
+index 000000000..f8dbd169c
+--- /dev/null
++++ b/CHANGES/12824.bugfix.rst
+@@ -0,0 +1 @@
++Fixed :class:`~aiohttp.CookieJar` dropping the host-only flag of cookies when persisted with :meth:`~aiohttp.CookieJar.save` and reloaded with :meth:`~aiohttp.CookieJar.load`, so a cookie set without a ``Domain`` attribute is again scoped to the exact host that set it after a reload; the absolute expiration deadline is now persisted as well, so a reloaded cookie keeps its original lifetime instead of being rescheduled from the load time. :meth:`~aiohttp.CookieJar.load` now replaces the jar contents rather than merging onto prior state, and loaded cookies pass through the same acceptance rules as :meth:`~aiohttp.CookieJar.update_cookies`, so a cookie for an IP-address host is dropped when loaded into a jar created without ``unsafe=True`` -- by :user:`bdraco`.
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 757cc10e8..b07d1fd50 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -48,6 +48,9 @@ _FORMAT_DOMAIN_REVERSED = "{1}.{0}".format
+ _MIN_SCHEDULED_COOKIE_EXPIRATION = 100
+ _SIMPLE_COOKIE = SimpleCookie()
+ 
++# Not persisted; the absolute deadline is saved instead.
++_RELATIVE_EXPIRY_ATTRS = frozenset(("max-age", "expires"))
++
+ 
+ class _RestrictedCookieUnpickler(pickle.Unpickler):
+     """A restricted unpickler that only allows cookie-related types.
+@@ -165,21 +168,28 @@ class CookieJar(AbstractCookieJar):
+             :class:`str` or :class:`pathlib.Path` instance.
+         """
+         file_path = pathlib.Path(file_path)
+-        data: dict[str, dict[str, dict[str, str | bool]]] = {}
++        data: dict[str, dict[str, dict[str, str | bool | float]]] = {}
+         for (domain, path), cookie in self._cookies.items():
+             key = f"{domain}|{path}"
+             data[key] = {}
+             for name, morsel in cookie.items():
+-                morsel_data: dict[str, str | bool] = {
++                morsel_data: dict[str, str | bool | float] = {
+                     "key": morsel.key,
+                     "value": morsel.value,
+                     "coded_value": morsel.coded_value,
+                 }
+-                # Save all morsel attributes that have values
++                # Skip relative expiry; the absolute deadline is saved below.
+                 for attr in morsel._reserved:  # type: ignore[attr-defined]
++                    if attr in _RELATIVE_EXPIRY_ATTRS:
++                        continue
+                     attr_val = morsel[attr]
+                     if attr_val:
+                         morsel_data[attr] = attr_val
++                # Persist or it reloads as a domain cookie and leaks to subdomains.
++                if (domain, name) in self._host_only_cookies:
++                    morsel_data["host_only"] = True
++                if (exp := self._expirations.get((domain, path, name))) is not None:
++                    morsel_data["expires_timestamp"] = exp
+                 data[key][name] = morsel_data
+         with file_path.open(mode="w", encoding="utf-8") as f:
+             json.dump(data, f, indent=2)
+@@ -191,6 +201,9 @@ class CookieJar(AbstractCookieJar):
+         pickle format (using a restricted unpickler) for backward
+         compatibility with existing cookie files.
+ 
++        Replaces the current jar contents; loaded cookies pass through the
++        same acceptance rules as :meth:`update_cookies`.
++
+         :param file_path: Path to file from where cookies will be
+             imported, :class:`str` or :class:`pathlib.Path` instance.
+         """
+@@ -199,32 +212,28 @@ class CookieJar(AbstractCookieJar):
+         try:
+             with file_path.open(mode="r", encoding="utf-8") as f:
+                 data = json.load(f)
+-            self._cookies = self._load_json_data(data)
++            self._load_json_data(data)
+         except (json.JSONDecodeError, UnicodeDecodeError, ValueError):
+             # Fall back to legacy pickle format with restricted unpickler
+             with file_path.open(mode="rb") as f:
+                 self._cookies = _RestrictedCookieUnpickler(f).load()
+ 
+     def _load_json_data(
+-        self, data: dict[str, dict[str, dict[str, str | bool]]]
+-    ) -> defaultdict[tuple[str, str], SimpleCookie]:
+-        """Load cookies from parsed JSON data."""
+-        cookies: defaultdict[tuple[str, str], SimpleCookie] = defaultdict(SimpleCookie)
++        self, data: dict[str, dict[str, dict[str, str | bool | float]]]
++    ) -> None:
++        """Replace contents, routing cookies through update_cookies()."""
++        self.clear()
+         for compound_key, cookie_data in data.items():
+             domain, path = compound_key.split("|", 1)
+-            key = (domain, path)
+             for name, morsel_data in cookie_data.items():
+                 morsel: Morsel[str] = Morsel()
+-                morsel_key = morsel_data["key"]
+-                morsel_value = morsel_data["value"]
+-                morsel_coded_value = morsel_data["coded_value"]
+                 # Use __setstate__ to bypass validation, same pattern
+                 # used in _build_morsel and _cookie_helpers.
+                 morsel.__setstate__(  # type: ignore[attr-defined]
+                     {
+-                        "key": morsel_key,
+-                        "value": morsel_value,
+-                        "coded_value": morsel_coded_value,
++                        "key": morsel_data["key"],
++                        "value": morsel_data["value"],
++                        "coded_value": morsel_data["coded_value"],
+                     }
+                 )
+                 # Restore morsel attributes
+@@ -235,8 +244,17 @@ class CookieJar(AbstractCookieJar):
+                         "coded_value",
+                     ):
+                         morsel[attr] = morsel_data[attr]
+-                cookies[key][name] = morsel
+-        return cookies
++                # Drop the domain so update_cookies() re-marks it host-only.
++                if morsel_data.get("host_only"):
++                    morsel["domain"] = ""
++                response_url = (
++                    URL.build(scheme="https", host=domain) if domain else URL()
++                )
++                self.update_cookies({name: morsel}, response_url)
++                # Restore the absolute deadline; update_cookies() schedules none.
++                if (exp := morsel_data.get("expires_timestamp")) is not None:
++                    self._expire_cookie(float(exp), domain, path, name)
++        self._do_expiration()
+ 
+     def clear(self, predicate: Optional[ClearCookiePredicate] = None) -> None:
+         if predicate is None:
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 694514067..ba7ee3220 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -2,6 +2,7 @@ import asyncio
+ import datetime
+ import heapq
+ import itertools
++import json
+ import logging
+ import pathlib
+ import pickle
+@@ -1760,6 +1761,140 @@ async def test_save_load_json_partitioned_cookies(tmp_path: Path) -> None:
+         assert s["path"] == lo["path"]
+ 
+ 
++async def test_save_load_json_preserves_host_only_scope(tmp_path: Path) -> None:
++    """Verify save/load keeps host-only cookies off subdomains."""
++    file_path = tmp_path / "host_only.json"
++    issuer = URL("https://auth.example.com/login")
++    subdomain = URL("https://sub.auth.example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies({"sid": "hostonly"}, response_url=issuer)
++    assert "sid" not in jar_save.filter_cookies(subdomain)
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load.host_only_cookies == frozenset({("auth.example.com", "sid")})
++    assert "sid" not in jar_load.filter_cookies(subdomain)
++    assert "sid" in jar_load.filter_cookies(issuer)
++
++
++async def test_save_load_json_domain_cookie_still_matches_subdomain(
++    tmp_path: Path,
++) -> None:
++    """Verify save/load keeps an explicit Domain cookie valid for subdomains."""
++    file_path = tmp_path / "domain.json"
++    subdomain = URL("https://sub.example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["sid=domaincookie; Domain=example.com"], URL("https://example.com/")
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load.host_only_cookies == frozenset()
++    assert "sid" in jar_load.filter_cookies(subdomain)
++
++
++async def test_save_load_json_preserves_max_age_deadline(tmp_path: Path) -> None:
++    """Verify save/load restores the absolute deadline without resetting it."""
++    file_path = tmp_path / "max_age.json"
++    url = URL("https://example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["sid=x; Max-Age=3600; Domain=example.com"], url
++    )
++    expirations = dict(jar_save._expirations)
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    # The deadline is restored as the original absolute time, not now + Max-Age.
++    assert dict(jar_load._expirations) == expirations
++    assert "sid" in jar_load.filter_cookies(url)
++
++
++async def test_save_load_json_drops_expired_cookie(tmp_path: Path) -> None:
++    """Verify a cookie whose persisted deadline is in the past is dropped on load."""
++    file_path = tmp_path / "expired.json"
++    url = URL("https://example.com/")
++
++    # Save a future-expiring cookie, then rewrite its persisted deadline to the
++    # past so the cookie survives save() and the drop happens on the load path.
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["sid=x; Expires=Tue, 1 Jan 2999 12:00:00 GMT; Domain=example.com"], url
++    )
++    jar_save.save(file_path=file_path)
++    data = json.loads(file_path.read_text())
++    _, cookies = next(iter(data.items()))
++    cookies["sid"]["expires_timestamp"] = 0.0
++    file_path.write_text(json.dumps(data))
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert len(jar_load) == 0
++    assert "sid" not in jar_load.filter_cookies(url)
++
++
++async def test_save_load_json_preserves_expires_deadline(tmp_path: Path) -> None:
++    """Verify a future Expires deadline survives a save/load roundtrip."""
++    file_path = tmp_path / "expires.json"
++    url = URL("https://example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["sid=x; Expires=Tue, 1 Jan 2999 12:00:00 GMT; Domain=example.com"], url
++    )
++    expirations = dict(jar_save._expirations)
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert dict(jar_load._expirations) == expirations
++    assert "sid" in jar_load.filter_cookies(url)
++
++
++async def test_load_json_old_format_without_new_keys(tmp_path: Path) -> None:
++    """Verify a file written by an older version (no host_only/expires_timestamp) loads."""
++    file_path = tmp_path / "old.json"
++    # Old schema: no host_only, no expires_timestamp; relative max-age morsel attr.
++    file_path.write_text(
++        json.dumps(
++            {
++                "example.com|/": {
++                    "sid": {
++                        "key": "sid",
++                        "value": "x",
++                        "coded_value": "x",
++                        "domain": "example.com",
++                        "max-age": "3600",
++                    }
++                }
++            }
++        )
++    )
++    url = URL("https://example.com/")
++
++    jar_load = CookieJar()
++    # No exception when the new keys are absent.
++    jar_load.load(file_path=file_path)
++
++    # A host-only cookie saved without Domain by an older version had no domain
++    # field, so it now loads as a domain cookie (the documented migration loss).
++    assert "sid" in jar_load.filter_cookies(url)
++    # max-age is rescheduled from load time rather than an absolute deadline.
++    assert any(key[2] == "sid" for key in jar_load._expirations)
++
++
+ async def test_json_format_is_safe(tmp_path: Path) -> None:
+     """Verify the JSON file format cannot execute code on load."""
+     import json
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 9a53c3b518..9102175f24 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://CVE-2026-54276.patch \
     file://CVE-2026-54277.patch \
     file://CVE-2026-54278.patch \
+    file://CVE-2026-54279.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


