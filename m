Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B86CA5FAF
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:43 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63550.1790617413037125375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S7SllN+d;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13950; q=dns/txt;
  s=iport01; t=1790617413; x=1791827013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=94LC1+SnAj5vjlD7Axwacgh09OOQlWG1wJj2zdEcgLc=;
  b=S7SllN+dkxST1KUP6DTEpmkmBYcXoqHkyXnG075j55AOnAuwyZvjP9TM
   GoOmV5Sp1oLXo0KcIIFs4aR22cIISP6TY/UXRhfK6RcnFrg2xS8n8nhOX
   YC8H9uUVbn9JCi7U89a8ANlS3+Ff8qkKeh+kB9AqnflPlJUQdE/wLv6V8
   jbNSZS36W1F/OfA+p7vUzJlBwkzxvyf974jHQKcX0BgMRYoSwNP+ajrQT
   kA/LhihxnwmJVpSPrRDArKTHc3Q0wP2GcwRWdbpp/dJIyv8YMEXflsvd7
   GLkH1heKpHZs7dXwON6DZz/wR/hmgzd5fwDtrVOnahTcxOhvWHVikdncs
   A==;
X-CSE-ConnectionGUID: LyUu0gA/RA+jxp8wbdijFg==
X-CSE-MsgGUID: qNSTTm7OTZG81ykwkxZaEg==
X-IPAS-Result: =?us-ascii?q?A0BKAgC9prpq/4v/Ja1aglmCV3VgQ0kDlkcDkUmMUYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOCQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAhcBFysjCBmDAgGCdAMRwkWBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DbMgELFAGBOIVAiCNdGAGEfCcbG4FyglCCLoEFgVwBAYIoA?=
 =?us-ascii?q?oV7BIIigQyBWoFNkXZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EhOEEJKBEYDUgRLDcVGQQ+bgeQLh6Bc3ItEEQNASsEgQ0HC?=
 =?us-ascii?q?FgTAgc0BhiScgyQHYIhgTWfWgoog3aMIo4Nhy0aM4VbpRQLmH2JAYI2glOKD?=
 =?us-ascii?q?YtJEmiEaYFoPIFHCwdwFYMiCUoZD1iNVgsLg2CBf4NlxlUnMgIIATIBAQcCB?=
 =?us-ascii?q?w4DC4FokAItb2ABAQ?=
IronPort-Data: A9a23:wLqog6oarnZ35K/gOHsvVK8wO41eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmDPPeIajD1KY93aN/kpBgEupHTy9FnSFQ+pX83RXxG8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfrS8kM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sJmPHwW+
 tVfEhlObACb1/28zLO5ZOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXH5UIxBzE/
 D+uE2LRGzchCOCalh25wF383/7MgiDraos/G+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIZgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYkD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:puDcO6HPXfQjq7COpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AHbiZo2h7ucHw8rdbNW08OjjzrDJuVmzg0S/fCgi?=
 =?us-ascii?q?CICVrWKXFVlWc+aFKnJ87?=
X-Talos-MUID: 9a23:5/uiuQt0sUfDJjDrSc2nnRdZCPttvIOSOm9dyIQFpMqUByVdNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528522425"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id EFA471800034A;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5E9F1CBEF6D; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 12/13] python3-aiohttp: fix CVE-2026-54279
Date: Mon, 28 Sep 2026 10:43:22 -0700
Message-Id: <20260928174323.1810308-13-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130451

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/a329a7aacad5284f087af36103aff778746da0f2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54279

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54279.patch      | 317 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 318 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
new file mode 100644
index 0000000000..8c735c209b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
@@ -0,0 +1,317 @@
+From 7b86b0ebf15a848e2c8e61ff58186b3bd340edfb Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:40:24 -0500
+Subject: [PATCH] [PR #12824/60b85e98 backport][3.14] Preserve host-only cookie
+ scope across CookieJar save/load (#12833)
+
+CVE: CVE-2026-54279
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/a329a7aacad5284f087af36103aff778746da0f2]
+
+Backport Changes:
+- Adapted regression tests to aiohttp 3.9.5's private
+  `_host_only_cookies` state because the newer public
+  `host_only_cookies` property is absent.
+- Used `SimpleCookie` with `update_cookies()` because aiohttp 3.9.5
+  predates the `update_cookies_from_headers()` test API.
+- This fix depends on the JSON CookieJar persistence implementation
+  introduced by CVE-2026-34993.patch. Keep CVE-2026-34993.patch
+  earlier in SRC_URI.
+
+(cherry picked from commit a329a7aacad5284f087af36103aff778746da0f2)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12824.bugfix.rst |   1 +
+ aiohttp/cookiejar.py     |  52 +++++++++-----
+ tests/test_cookiejar.py  | 144 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 180 insertions(+), 17 deletions(-)
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
+index 376f7597a..4f694b6d7 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -36,6 +36,9 @@ __all__ = ("CookieJar", "DummyCookieJar")
+ 
+ CookieItem = Union[str, "Morsel[str]"]
+ 
++# Not persisted; the absolute deadline is saved instead.
++_RELATIVE_EXPIRY_ATTRS = frozenset(("max-age", "expires"))
++
+ 
+ class _RestrictedCookieUnpickler(pickle.Unpickler):
+     """A restricted unpickler that only allows cookie-related types.
+@@ -146,21 +149,28 @@ class CookieJar(AbstractCookieJar):
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
+@@ -172,6 +182,9 @@ class CookieJar(AbstractCookieJar):
+         pickle format (using a restricted unpickler) for backward
+         compatibility with existing cookie files.
+ 
++        Replaces the current jar contents; loaded cookies pass through the
++        same acceptance rules as :meth:`update_cookies`.
++
+         :param file_path: Path to file from where cookies will be
+             imported, :class:`str` or :class:`pathlib.Path` instance.
+         """
+@@ -180,32 +193,28 @@ class CookieJar(AbstractCookieJar):
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
+@@ -216,8 +225,17 @@ class CookieJar(AbstractCookieJar):
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
+index bdc5cfd72..df59759c5 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1,6 +1,7 @@
+ import asyncio
+ import datetime
+ import itertools
++import json
+ import pathlib
+ import pickle
+ import unittest
+@@ -979,6 +980,149 @@ async def test_save_load_json_roundtrip(
+     assert saved_cookies == loaded_cookies
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
++    assert jar_load._host_only_cookies == {("auth.example.com", "sid")}
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
++    jar_save.update_cookies(
++        SimpleCookie("sid=domaincookie; Domain=example.com"),
++        URL("https://example.com/"),
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    assert jar_load._host_only_cookies == set()
++    assert "sid" in jar_load.filter_cookies(subdomain)
++
++
++async def test_save_load_json_preserves_max_age_deadline(tmp_path: Path) -> None:
++    """Verify save/load restores the absolute deadline without resetting it."""
++    file_path = tmp_path / "max_age.json"
++    url = URL("https://example.com/")
++
++    jar_save = CookieJar()
++    jar_save.update_cookies(
++        SimpleCookie("sid=x; Max-Age=3600; Domain=example.com"), url
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
++    jar_save.update_cookies(
++        SimpleCookie(
++            "sid=x; Expires=Tue, 1 Jan 2999 12:00:00 GMT; Domain=example.com"
++        ),
++        url,
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
++    jar_save.update_cookies(
++        SimpleCookie(
++            "sid=x; Expires=Tue, 1 Jan 2999 12:00:00 GMT; Domain=example.com"
++        ),
++        url,
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
++    subdomain = URL("https://sub.example.com/")
++
++    jar_load = CookieJar()
++    # No exception when the new keys are absent.
++    jar_load.load(file_path=file_path)
++
++    # The old schema has a domain field but no host_only marker, so a cookie
++    # originally set without Domain is indistinguishable from a domain cookie.
++    assert "sid" in jar_load.filter_cookies(url)
++    assert "sid" in jar_load.filter_cookies(subdomain)
++    # max-age is rescheduled from load time rather than an absolute deadline.
++    assert any(key[2] == "sid" for key in jar_load._expirations)
++
++
+ async def test_json_format_is_safe(tmp_path: Path) -> None:
+     """Verify the JSON file format cannot execute code on load."""
+     import json
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index f91c9cb181..88ae49dec4 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54275.patch \
            file://CVE-2026-54277.patch \
            file://CVE-2026-54278.patch \
+           file://CVE-2026-54279.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


