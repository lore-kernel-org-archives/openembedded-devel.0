Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9646FC5DF88
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15269.1787076932678337791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HRqVzg13;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17749; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tIi1ecQret2PZxj1hPykSVCVZDc9ShWXrl6glxFSiBg=;
  b=HRqVzg13dSbLk1kM7/GHqNh6kcNNBMN1qX8KNr20+zLJWVOUfJfVKJ/D
   hPxW/dsiCS7YVwJXxAUP46DnaUQi2ZJ/234cnmkGlekGES+OuJncW0tlO
   KFDlX4zc0jyTq5ggQRnVDkltY4/x0HMLdpMaKVv2+umGvKz8y+qqGIEod
   BzMr45468rT1u80eZEM9UK8sA1rd9u5Z5vI22kvjCuvP7d0vXOPkJXR4w
   Sf66K59DcW2WvJtq2GPBbOJMtGV/0eiyMK+2pNYCcr1o+rma6PBfOSsiz
   8DuKb5OLS4P/56nsWSVex2bQwPJiuFUiWGV5j9FfBrZJ4aUXYf6NH5DLt
   Q==;
X-CSE-ConnectionGUID: DoBhYFjCR2677E2pQRt1nQ==
X-CSE-MsgGUID: ypfpMjD+TfmBVpBi432w9g==
X-IPAS-Result: =?us-ascii?q?A0BLAgDJn4Rq/44QJK1aHgEBCxIMggULgld0XkNJhFeRB?=
 =?us-ascii?q?2wDnhuBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAEtEBwDAQIDAiYCAisdAQUIG?=
 =?us-ascii?q?YMCAYJ0AxEGxBl6fzOBAYMoAUNBUNswAQsUAQWBBS6FP4MfAYUCXRgBhHwnG?=
 =?us-ascii?q?xuBcoEVg2mBBYFcAgKBSINxgmoEgiKBDIFagS2QKUiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XNVgbBgWBHYEohDcjGTZ6gQlegSsqYQESF4EJggoCg?=
 =?us-ascii?q?nOCBgIBSUUOCxgNSBEsNxQZBD0BbgeOOCCCQ2EtASkBAQR7EnoCGgUODgIcF?=
 =?us-ascii?q?JMij2WCIYE1n1oKKIN2jCGVOhozhASBV5JAklELmH2JAYI2glOWAFCEaYFoP?=
 =?us-ascii?q?IFZcBU7gmcJShkPjgsjCguDYIUTUcZVJzICCTIBAQcCBw4DC4FokAEBJgeBT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:/dnkNaMIIgy6FznvrR30lsFynXyQoLVcMsEvi/4bfWQNrUomhj0Om
 mEfWmGPaPffMTf3KdxxYN/n9ExU65TVn4NlTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gmEsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69lpJkEHE48zwLwpXj5jr
 +QhEixUaCnW0opawJrjIgVtrs0nKM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY1BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FwoieG1YIuOJLRmQ+1EhkiAg
 2DqvFj3BzskLPaelWHf7SOj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:3zBYhKDD+43g/3LlHely55DYdb4zR+YMi2TDGXofdfUzSL3/qy
 nOpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyIMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYANu5eeXcGPjWvwvECZe
 Gh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3ALlv+Rmkk7ReWfJSD6a3feVWxXoTXOVHa5nfhDU2?=
 =?us-ascii?q?TMzw3F+K4E0epwr89lfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AYkoeQAxVFgJmbu3DxPRb7QKgTZqaqLW2Blgok7l?=
 =?us-ascii?q?Fh8eBHxJoETbB126oE4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="811108936"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 7C35218000221;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 1CB24CCD9B2; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 01/10] python3-aiohttp: fix CVE-2026-34993
Date: Tue, 18 Aug 2026 11:15:19 -0700
Message-Id: <20260818181528.3405276-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129241

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/dcf40f30637e8752c76781cf6703b5a236749a00
[2] https://github.com/advisories/GHSA-jg22-mg44-37j8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34993.patch      | 478 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   4 +
 2 files changed, 482 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
new file mode 100644
index 0000000000..9c430f4217
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
@@ -0,0 +1,478 @@
+From 9a92d1c1caacbb3244526d2ef9c197978f701c76 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 22 Feb 2026 15:53:43 +0000
+Subject: [PATCH] [PR #12091/8a631e74 backport][3.14] Restrict pickle
+ deserialization in CookieJar.load() (#12105)
+
+**This is a backport of PR #12091 as merged into master
+(8a631e74c1d266499dbc6bcdbc83c60f4ea3ee3c).**
+
+---------
+
+CVE: CVE-2026-34993
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/dcf40f30637e8752c76781cf6703b5a236749a00]
+
+Co-authored-by: Yuval Elbar <41901908+YuvalElbar6@users.noreply.github.com>
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit dcf40f30637e8752c76781cf6703b5a236749a00)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12091.bugfix.rst   |   6 ++
+ aiohttp/cookiejar.py       | 114 +++++++++++++++++++++-
+ docs/client_reference.rst  |  18 +++-
+ docs/spelling_wordlist.txt |   7 +-
+ tests/conftest.py          |   5 +
+ tests/test_cookiejar.py    | 189 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 331 insertions(+), 8 deletions(-)
+ create mode 100644 CHANGES/12091.bugfix.rst
+
+diff --git a/CHANGES/12091.bugfix.rst b/CHANGES/12091.bugfix.rst
+new file mode 100644
+index 000000000..45ffbc355
+--- /dev/null
++++ b/CHANGES/12091.bugfix.rst
+@@ -0,0 +1,6 @@
++Switched :py:meth:`~aiohttp.CookieJar.save` to use JSON format and
++:py:meth:`~aiohttp.CookieJar.load` to try JSON first with a fallback to
++a restricted pickle unpickler that only allows cookie-related types
++(``SimpleCookie``, ``Morsel``, ``defaultdict``, etc.), preventing
++arbitrary code execution via malicious pickle payloads
++(CWE-502) -- by :user:`YuvalElbar6`.
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 193648d43..757cc10e8 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -4,6 +4,7 @@ import contextlib
+ import datetime
+ import heapq
+ import itertools
++import json
+ import os  # noqa
+ import pathlib
+ import pickle
+@@ -48,6 +49,41 @@ _MIN_SCHEDULED_COOKIE_EXPIRATION = 100
+ _SIMPLE_COOKIE = SimpleCookie()
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
+@@ -123,14 +159,84 @@ class CookieJar(AbstractCookieJar):
+         return self._quote_cookie
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
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index a1fc98b3c..374796f40 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2464,16 +2464,28 @@ Utilities
+ 
+    .. method:: save(file_path)
+ 
+-      Write a pickled representation of cookies into the file
++      Write a JSON representation of cookies into the file
+       at provided path.
+ 
++      .. versionchanged:: 3.14
++
++         Previously used pickle format. Now uses JSON for safe
++         serialization.
++
+       :param file_path: Path to file where cookies will be serialized,
+           :class:`str` or :class:`pathlib.Path` instance.
+ 
+    .. method:: load(file_path)
+ 
+-      Load a pickled representation of cookies from the file
+-      at provided path.
++      Load cookies from the file at provided path. Tries JSON format
++      first, then falls back to legacy pickle format (using a restricted
++      unpickler that only allows cookie-related types) for backward
++      compatibility with existing cookie files.
++
++      .. versionchanged:: 3.14
++
++         Now loads JSON format by default. Falls back to restricted
++         pickle for files saved by older versions.
+ 
+       :param file_path: Path to file from where cookies will be
+            imported, :class:`str` or :class:`pathlib.Path` instance.
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 7dc09edb1..382ad414e 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -98,6 +98,7 @@ deduplicate
+ defs
+ Dependabot
+ deprecations
++deserialization
+ DER
+ dev
+ Dev
+@@ -210,7 +211,8 @@ Multipart
+ musllinux
+ mypy
+ Nagle
+-Nagle’s
++Nagle's
++NFS
+ namedtuple
+ nameservers
+ namespace
+@@ -232,6 +234,7 @@ param
+ params
+ parsers
+ pathlib
++payloads
+ peername
+ performant
+ pickleable
+@@ -351,6 +354,8 @@ unhandled
+ unicode
+ unittest
+ Unittest
++unpickler
++untrusted
+ unix
+ unsets
+ unstripped
+diff --git a/tests/conftest.py b/tests/conftest.py
+index c299df5aa..bfaa26680 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -95,6 +95,11 @@ def blockbuster(request: pytest.FixtureRequest) -> Iterator[None]:
+             bb.functions[func].can_block_in(
+                 "aiohttp/web_urldispatcher.py", "add_static"
+             )
++        # save/load is not async, so we must allow this:
++        for func in ("io.TextIOWrapper.read", "io.BufferedReader.read"):
++            bb.functions[func].can_block_in("aiohttp/cookiejar.py", "load")
++        for func in ("io.TextIOWrapper.write", "io.BufferedWriter.write"):
++            bb.functions[func].can_block_in("aiohttp/cookiejar.py", "save")
+         # Note: coverage.py uses locking internally which can cause false positives
+         # in blockbuster when it instruments code. This is particularly problematic
+         # on Windows where it can lead to flaky test failures.
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 17e27e8f7..694514067 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -9,6 +9,7 @@ import sys
+ import unittest
+ from http.cookies import BaseCookie, Morsel, SimpleCookie
+ from operator import not_
++from pathlib import Path
+ from typing import List, Set
+ from unittest import mock
+ 
+@@ -1621,3 +1622,191 @@ async def test_shared_cookie_with_multiple_domains() -> None:
+     # Verify cache is reused efficiently
+     assert ("", "") in jar._morsel_cache
+     assert "universal" in jar._morsel_cache[("", "")]
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
++async def test_save_load_json_partitioned_cookies(tmp_path: Path) -> None:
++    """Verify save/load roundtrip works with partitioned cookies."""
++    file_path = tmp_path / "partitioned.json"
++
++    jar_save = CookieJar()
++    jar_save.update_cookies_from_headers(
++        ["session=cookie; Partitioned"], URL("https://example.com/")
++    )
++    jar_save.save(file_path=file_path)
++
++    jar_load = CookieJar()
++    jar_load.load(file_path=file_path)
++
++    # Compare individual cookie values (same approach as test_save_load_partitioned_cookies)
++    saved = list(jar_save)
++    loaded = list(jar_load)
++    assert len(saved) == len(loaded)
++    for s, lo in zip(saved, loaded):
++        assert s.key == lo.key
++        assert s.value == lo.value
++        assert s["domain"] == lo["domain"]
++        assert s["path"] == lo["path"]
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
++    jar_save.update_cookies_from_headers(
++        ["token=abc123; Secure; HttpOnly; Path=/; Domain=example.com"],
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index f3a0fbf557..bce27905aa 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1"
 
+SRC_URI += " \
+    file://CVE-2026-34993.patch \
+"
+
 CVE_PRODUCT = "aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
 CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
-- 
2.35.6


