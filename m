Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5878BC624C2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:51 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22957.1788152269275233289
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gr6JB0Td;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13960; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Daz4g8CztPUK0y4ZTgiMEedIhFH65z629dJd2LrK0U=;
  b=gr6JB0Tdf4onH314DoZgmePoG1c+TyBK8g4uSvAEb7/gaLY3/sgD84Yi
   LcoQ2/Zi2YnegAcCd5v7piXK1k/CIVSfroYPa+FtCTdDQW45zY9Fd9Lj1
   R4wyA3FRhKTcEMUkrcKXpVHRsEdg1dDDHV70ZrVMP2jIs33lo3FTHgf6t
   u/HN13VsOd7lQz8gOqhhLUVVcsJcur2ivN75wwHD8svh3jYMBaeLAsClS
   DPchJ1vkp3n0xfb1+LzVgoLoZFCU3Wav0Jl4uPmDHTGcF/nm+smGyIK74
   krApLS0B6QRjd4rHM8FdsFoaOQVGBitgoI37pEz8bIL90DSGgET4Z1NaI
   w==;
X-CSE-ConnectionGUID: 8x0Pq1vtTSyzIrwdsQgdlg==
X-CSE-MsgGUID: zIV9ZJotS4+qww8/9DJm+g==
X-IPAS-Result: =?us-ascii?q?A0BIAgAsCZVq/5IQJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNcwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBsF7gXkzgQGDK?=
 =?us-ascii?q?AE/AgJAAVDbMAELFAGBOIU/iCJdGAGEfCcbG4FyhH6BBYFcAQECgUiGWwSCI?=
 =?us-ascii?q?oEMgVqBF5EISIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BK?=
 =?us-ascii?q?IQPIxk2eoEJXoErKWABEheBCYIIAoJaggUCAUlDDgdHUwkECxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB456H4JLYS0BKQEBBHsSegIHEwUOAw0cFJJpOY9lgiGBNZ9aCiiDdowil?=
 =?us-ascii?q?ToaM4VbpRELmH2JAYI2glOWUIRpgWg8gUcLB3AVO4JnCUoZD44LLYNrgX+DF?=
 =?us-ascii?q?FHGVScyAgkyAQEHAgcOAwuBaJABASYHgU8BAQ?=
IronPort-Data: A9a23:UrM5Kq1pe4pB6WLQofbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzNWy
 GZMWGGPb6mLZmT2eY10bY+xph8Bv5XTxtFjGgo43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24vajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXFFuBZRB5PpLOnBc1
 OYHJCs0YRyHiLfjqF67YrEEasULJc3vOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEqojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZgOK2bIaJJILaLSlTtlS5m
 DP03WPlOU1ZLcOAmX3U3lCpxeCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:5bumxqwPOwB0ziteGB9yKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AIVMax2pqLnyMdO7JBHn8N8DmUZA1KkXElWnMH3S?=
 =?us-ascii?q?pG0dzV7GOcFCc/Kwxxg=3D=3D?=
X-Talos-MUID: 9a23:xWGJngQ7REQIDSVBRXT+pQ8zBuVv/5/yS1kSjsVB6uWmMG9/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="823444668"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id AA31918000446;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E78F9CD02BF; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 8/9] python3-aiohttp: fix CVE-2026-34993
Date: Sun, 30 Aug 2026 21:57:43 -0700
Message-Id: <20260831045744.3321483-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129605

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/dcf40f30637e8752c76781cf6703b5a236749a00
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34993

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34993.patch      | 364 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
new file mode 100644
index 0000000000..76756759c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
@@ -0,0 +1,364 @@
+From d4f415a2a236f92c23b66f7e025419f1c3e9ac77 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 22 Feb 2026 15:53:43 +0000
+Subject: [PATCH] Restrict pickle deserialization in CookieJar.load() (#12105)
+
+**This is a backport of PR #12091 as merged into master
+(8a631e74c1d266499dbc6bcdbc83c60f4ea3ee3c).**
+
+---------
+
+CVE: CVE-2026-34993
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/dcf40f30637e8752c76781cf6703b5a236749a00]
+
+Backport Changes:
+- Omitted tests/conftest.py Blockbuster allowances because
+  aiohttp 3.9.5 does not use the upstream Blockbuster fixture.
+- Omitted the partitioned-cookie JSON roundtrip test because
+  aiohttp 3.9.5 lacks partitioned-cookie support.
+- Adapted the secure-cookie JSON roundtrip test to construct a
+  SimpleCookie and call CookieJar.update_cookies(), since
+  aiohttp 3.9.5 lacks update_cookies_from_headers().
+- Omitted CHANGES/12091.bugfix.rst, docs/client_reference.rst,
+  and docs/spelling_wordlist.txt as release documentation unrelated
+  to the runtime security fix; the upstream 3.14 version directives
+  do not apply to this aiohttp 3.9.5 backport.
+
+Co-authored-by: Yuval Elbar <41901908+YuvalElbar6@users.noreply.github.com>
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit dcf40f30637e8752c76781cf6703b5a236749a00)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/cookiejar.py    | 114 ++++++++++++++++++++++++++-
+ tests/test_cookiejar.py | 168 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 278 insertions(+), 4 deletions(-)
+
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index a348f112c..376f7597a 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -2,6 +2,7 @@ import asyncio
+ import calendar
+ import contextlib
+ import datetime
++import json
+ import os  # noqa
+ import pathlib
+ import pickle
+@@ -36,6 +37,41 @@ __all__ = ("CookieJar", "DummyCookieJar")
+ CookieItem = Union[str, "Morsel[str]"]
+ 
+ 
++class _RestrictedCookieUnpickler(pickle.Unpickler):
++    """A restricted unpickler that only allows cookie-related types.
++
++    This prevents arbitrary code execution when loading pickled cookie data
++    from untrusted sources. Only types that are expected in a serialized
++    CookieJar are permitted.
++
++    See: https://docs.python.org/3/library/pickle.html#restricting-globals
++    """
++
++    _ALLOWED_CLASSES: frozenset[tuple[str, str]] = frozenset(
++        {
++            # Core cookie types
++            ("http.cookies", "SimpleCookie"),
++            ("http.cookies", "Morsel"),
++            # Container types used by CookieJar._cookies
++            ("collections", "defaultdict"),
++            # builtins that pickle uses for reconstruction
++            ("builtins", "tuple"),
++            ("builtins", "set"),
++            ("builtins", "frozenset"),
++            ("builtins", "dict"),
++        }
++    )
++
++    def find_class(self, module: str, name: str) -> type:
++        if (module, name) not in self._ALLOWED_CLASSES:
++            raise pickle.UnpicklingError(
++                f"Forbidden class: {module}.{name}. "
++                "CookieJar.load() only allows cookie-related types for security. "
++                "See https://docs.python.org/3/library/pickle.html#restricting-globals"
++            )
++        return super().find_class(module, name)  # type: ignore[no-any-return]
++
++
+ class CookieJar(AbstractCookieJar):
+     """Implements cookie storage adhering to RFC 6265."""
+ 
+@@ -104,14 +140,84 @@ class CookieJar(AbstractCookieJar):
+         self._expirations: Dict[Tuple[str, str, str], float] = {}
+ 
+     def save(self, file_path: PathLike) -> None:
++        """Save cookies to a file using JSON format.
++
++        :param file_path: Path to file where cookies will be serialized,
++            :class:`str` or :class:`pathlib.Path` instance.
++        """
+         file_path = pathlib.Path(file_path)
+-        with file_path.open(mode="wb") as f:
+-            pickle.dump(self._cookies, f, pickle.HIGHEST_PROTOCOL)
++        data: dict[str, dict[str, dict[str, str | bool]]] = {}
++        for (domain, path), cookie in self._cookies.items():
++            key = f"{domain}|{path}"
++            data[key] = {}
++            for name, morsel in cookie.items():
++                morsel_data: dict[str, str | bool] = {
++                    "key": morsel.key,
++                    "value": morsel.value,
++                    "coded_value": morsel.coded_value,
++                }
++                # Save all morsel attributes that have values
++                for attr in morsel._reserved:  # type: ignore[attr-defined]
++                    attr_val = morsel[attr]
++                    if attr_val:
++                        morsel_data[attr] = attr_val
++                data[key][name] = morsel_data
++        with file_path.open(mode="w", encoding="utf-8") as f:
++            json.dump(data, f, indent=2)
+ 
+     def load(self, file_path: PathLike) -> None:
++        """Load cookies from a file.
++
++        Tries to load JSON format first. Falls back to loading legacy
++        pickle format (using a restricted unpickler) for backward
++        compatibility with existing cookie files.
++
++        :param file_path: Path to file from where cookies will be
++            imported, :class:`str` or :class:`pathlib.Path` instance.
++        """
+         file_path = pathlib.Path(file_path)
+-        with file_path.open(mode="rb") as f:
+-            self._cookies = pickle.load(f)
++        # Try JSON format first
++        try:
++            with file_path.open(mode="r", encoding="utf-8") as f:
++                data = json.load(f)
++            self._cookies = self._load_json_data(data)
++        except (json.JSONDecodeError, UnicodeDecodeError, ValueError):
++            # Fall back to legacy pickle format with restricted unpickler
++            with file_path.open(mode="rb") as f:
++                self._cookies = _RestrictedCookieUnpickler(f).load()
++
++    def _load_json_data(
++        self, data: dict[str, dict[str, dict[str, str | bool]]]
++    ) -> defaultdict[tuple[str, str], SimpleCookie]:
++        """Load cookies from parsed JSON data."""
++        cookies: defaultdict[tuple[str, str], SimpleCookie] = defaultdict(SimpleCookie)
++        for compound_key, cookie_data in data.items():
++            domain, path = compound_key.split("|", 1)
++            key = (domain, path)
++            for name, morsel_data in cookie_data.items():
++                morsel: Morsel[str] = Morsel()
++                morsel_key = morsel_data["key"]
++                morsel_value = morsel_data["value"]
++                morsel_coded_value = morsel_data["coded_value"]
++                # Use __setstate__ to bypass validation, same pattern
++                # used in _build_morsel and _cookie_helpers.
++                morsel.__setstate__(  # type: ignore[attr-defined]
++                    {
++                        "key": morsel_key,
++                        "value": morsel_value,
++                        "coded_value": morsel_coded_value,
++                    }
++                )
++                # Restore morsel attributes
++                for attr in morsel._reserved:  # type: ignore[attr-defined]
++                    if attr in morsel_data and attr not in (
++                        "key",
++                        "value",
++                        "coded_value",
++                    ):
++                        morsel[attr] = morsel_data[attr]
++                cookies[key][name] = morsel
++        return cookies
+ 
+     def clear(self, predicate: Optional[ClearCookiePredicate] = None) -> None:
+         if predicate is None:
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 9c608959c..bdc5cfd72 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -5,6 +5,7 @@ import pathlib
+ import pickle
+ import unittest
+ from http.cookies import BaseCookie, Morsel, SimpleCookie
++from pathlib import Path
+ from unittest import mock
+ 
+ import pytest
+@@ -864,3 +865,170 @@ async def test_treat_as_secure_origin() -> None:
+     assert len(jar) == 1
+     filtered_cookies = jar.filter_cookies(request_url=endpoint)
+     assert len(filtered_cookies) == 1
++
++
++# === Security tests for restricted unpickler and JSON save/load ===
++
++
++async def test_load_rejects_malicious_pickle(tmp_path: Path) -> None:
++    """Verify CookieJar.load() blocks arbitrary code execution via pickle.
++
++    A crafted pickle payload using os.system (or any non-cookie class)
++    must be rejected by the restricted unpickler.
++    """
++    import os
++
++    file_path = tmp_path / "malicious.pkl"
++
++    class RCEPayload:
++        def __reduce__(self) -> tuple[object, ...]:
++            return (os.system, ("echo PWNED",))
++
++    with open(file_path, "wb") as f:
++        pickle.dump(RCEPayload(), f, pickle.HIGHEST_PROTOCOL)
++
++    jar = CookieJar()
++    with pytest.raises(pickle.UnpicklingError, match="Forbidden class"):
++        jar.load(file_path)
++
++
++async def test_load_rejects_eval_payload(tmp_path: Path) -> None:
++    """Verify CookieJar.load() blocks eval-based pickle payloads."""
++    file_path = tmp_path / "eval_payload.pkl"
++
++    class EvalPayload:
++        def __reduce__(self) -> tuple[object, ...]:
++            return (eval, ("__import__('os').system('echo PWNED')",))
++
++    with open(file_path, "wb") as f:
++        pickle.dump(EvalPayload(), f, pickle.HIGHEST_PROTOCOL)
++
++    jar = CookieJar()
++    with pytest.raises(pickle.UnpicklingError, match="Forbidden class"):
++        jar.load(file_path)
++
++
++async def test_load_rejects_subprocess_payload(tmp_path: Path) -> None:
++    """Verify CookieJar.load() blocks subprocess-based pickle payloads."""
++    import subprocess
++
++    file_path = tmp_path / "subprocess_payload.pkl"
++
++    class SubprocessPayload:
++        def __reduce__(self) -> tuple[object, ...]:
++            return (subprocess.call, (["echo", "PWNED"],))
++
++    with open(file_path, "wb") as f:
++        pickle.dump(SubprocessPayload(), f, pickle.HIGHEST_PROTOCOL)
++
++    jar = CookieJar()
++    with pytest.raises(pickle.UnpicklingError, match="Forbidden class"):
++        jar.load(file_path)
++
++
++async def test_load_falls_back_to_pickle(
++    tmp_path: Path,
++    cookies_to_receive: SimpleCookie,
++) -> None:
++    """Verify load() falls back to restricted pickle for legacy cookie files.
++
++    Existing cookie files saved with older versions of aiohttp used pickle.
++    load() should detect that the file is not JSON and fall back to the
++    restricted pickle unpickler for backward compatibility.
++    """
++    file_path = tmp_path / "legit.pkl"
++
++    # Write a legacy pickle file directly (as old aiohttp save() would)
++    jar_save = CookieJar()
++    jar_save.update_cookies(cookies_to_receive)
++    with file_path.open(mode="wb") as f:
++        pickle.dump(jar_save._cookies, f, pickle.HIGHEST_PROTOCOL)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    jar_test = SimpleCookie()
++    for cookie in jar_load:
++        jar_test[cookie.key] = cookie
++
++    assert jar_test == cookies_to_receive
++
++
++async def test_save_load_json_roundtrip(
++    tmp_path: Path,
++    cookies_to_receive: SimpleCookie,
++) -> None:
++    """Verify save/load roundtrip preserves cookies via JSON format."""
++    file_path = tmp_path / "cookies.json"
++
++    jar_save = CookieJar()
++    jar_save.update_cookies(cookies_to_receive)
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    saved_cookies = SimpleCookie()
++    for cookie in jar_save:
++        saved_cookies[cookie.key] = cookie
++
++    loaded_cookies = SimpleCookie()
++    for cookie in jar_load:
++        loaded_cookies[cookie.key] = cookie
++
++    assert saved_cookies == loaded_cookies
++
++
++async def test_json_format_is_safe(tmp_path: Path) -> None:
++    """Verify the JSON file format cannot execute code on load."""
++    import json
++
++    file_path = tmp_path / "safe.json"
++
++    # Write something that might look dangerous but is just data
++    malicious_data = {
++        "evil.com|/": {
++            "session": {
++                "key": "session",
++                "value": "__import__('os').system('echo PWNED')",
++                "coded_value": "__import__('os').system('echo PWNED')",
++            }
++        }
++    }
++    with open(file_path, "w") as f:
++        json.dump(malicious_data, f)
++
++    jar = CookieJar()
++    jar.load(file_path=file_path)
++
++    # The "malicious" string is just a cookie value, not executed code
++    cookies = list(jar)
++    assert len(cookies) == 1
++    assert cookies[0].value == "__import__('os').system('echo PWNED')"
++
++
++async def test_save_load_json_secure_cookies(tmp_path: Path) -> None:
++    """Verify save/load preserves Secure and HttpOnly flags."""
++    file_path = tmp_path / "secure.json"
++
++    jar_save = CookieJar()
++    cookies = SimpleCookie(
++        "token=abc123; Secure; HttpOnly; Path=/; Domain=example.com"
++    )
++    jar_save.update_cookies(
++        cookies,
++        URL("https://example.com/"),
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    loaded_cookies = list(jar_load)
++    assert len(loaded_cookies) == 1
++    cookie = loaded_cookies[0]
++    assert cookie.key == "token"
++    assert cookie.value == "abc123"
++    assert cookie["secure"] is True
++    assert cookie["httponly"] is True
++    assert cookie["domain"] == "example.com"
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index e104b62e1e..245abe4b89 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-22815.patch \
            file://CVE-2026-34514.patch \
            file://CVE-2026-34513.patch \
+           file://CVE-2026-34993.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6


