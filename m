Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC403E9D411
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24636.1770222569358554011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dzg5IYQE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-480706554beso77795535e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222568; x=1770827368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzNinIXll6P7zJKV28ARs4GmYP2TUvaQrAF5IGAlf4U=;
        b=Dzg5IYQEPXjAlevjl/go6EE1Vmz4ZxxUA3wyhVjGiVQYDalswOBbNjpMU12qRmIKoW
         iVlCGsJ1lBO38DeVXs4vHXQKFxh6ce7rarkX2L9yCkV9R7O3nAy/ljmdcZoY4zhXRZxY
         ZLB/z4MM649iuXdKXV4cwfPnTJnf8ltXWuIszQplkTWrdSWBdHYA27xwdPZkKnWzaDiu
         cvnWP5o8+2OEAIxIal7vl2zbFIZ7nxxAY8WiilUQiODNsgUSicT+OHrxMqPbFQnfTSHR
         e3QmSq61nFSqc4oJxhmOVb2xU5iTEwde54fENM9ag9Ekt7XYG+j/ysvZOPT/DGcfTjB+
         nb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222568; x=1770827368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lzNinIXll6P7zJKV28ARs4GmYP2TUvaQrAF5IGAlf4U=;
        b=UJpFbsFKHYHXrXhfV0ibjB1xfIYgZgvStWTI543IdUcUJDFbQr8H0E+S4SPI5u77D2
         /aVTdR0/Cwigle8MTJ8wBGavIdh/9M7e0xYLsLUoxGZhf2YJoXYNAqCzqdEUxFIEF3RA
         bGHSKu+W66Y/acim87VQh3HR/Z8NG4opc5OElYkCMVOC1ZOptFeGM7u2JFagQrwW43nf
         m3NAI2LbfABtvqDIl2/MLnP7qjcJQ86hza81QvBjBKzs+nWgkx9LKKEcOC8ANi+BjJEj
         lmB55p49NJmonWaVt0+dGRcMXqp3W7EpQmm/dWWJXdcwrQZM5hfD9OhPVabjaptyJauz
         8Bkw==
X-Gm-Message-State: AOJu0YzDk6tSMeXTMhxW+IrgM3NloUybc4IerKoNr6TQYrI0glwCMRp+
	rnXXcyuGHQlAgpZV0KL1S0Zizbi4Sljbi25Sa3vy58ehWd4LSpK/66E0jeWyWg==
X-Gm-Gg: AZuq6aJM/sMbFdjjv8JSVJ2XVvcb5McAejazyL1uEcqOCp200vdgRnKkxgdVLe9o21b
	GmvlxWRlwsRrpI/ydKeAmaH6fEY6Et41Gn/RQLur4uyoNFmw72nRllEDLoHiPI30SiC1XBPkavY
	iM3Xy6Y++N95KJBLB01PnCpaueDN9uJntOU4XfDSIOca1QOJ2gMTxQTSHUo96+U1cRQyEbNPZqS
	/e+A2stgFS6JkkBtpUtwRtyfF4DQcmE0n/P3+GEbmmxqLoQzfPBbsmDGP3UT9sgQILrH5WBk1Ok
	7EFtIv7Aq05a2upRgmjOa6ErJLSGAZapw3peGP/t+FVEOspj/6U4uaepMVTVch7P5e9kkaYFXFS
	CvYq1sJw4s1UufTUOgpKX+ph/oQy9QsNa7SXGogY6/WoQIsYAzw/9QTTQFI/D3i05pCY3Ryqo8r
	Na+j/xkGr+
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4830e93ddd9mr48216775e9.14.1770222567576;
        Wed, 04 Feb 2026 08:29:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 3/7] python3-aiohttp: patch CVE-2025-69226
Date: Wed,  4 Feb 2026 17:29:18 +0100
Message-ID: <20260204162924.3042284-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124138

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69226

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69226.patch      | 134 ++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
new file mode 100644
index 0000000000..6786546f25
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
@@ -0,0 +1,134 @@
+From b330573c65db35ee1228615ec257619b49b918c7 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 01:55:05 +0000
+Subject: [PATCH] Reject static URLs that traverse outside static root (#11888)
+ (#11906)
+
+From: Sam Bull <git@sambull.org>
+
+(cherry picked from commit 63961fa77fa2443109f25c3d8ab94772d3878626)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+
+CVE: CVE-2025-69226
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/f2a86fd5ac0383000d1715afddfa704413f0711e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/web_urldispatcher.py          | 18 +++++++++---------
+ tests/test_urldispatch.py             | 18 +++++++++++++++++-
+ tests/test_web_sendfile_functional.py |  2 +-
+ tests/test_web_urldispatcher.py       |  4 ++--
+ 4 files changed, 29 insertions(+), 13 deletions(-)
+
+diff --git a/aiohttp/web_urldispatcher.py b/aiohttp/web_urldispatcher.py
+index 28ae251..a121656 100644
+--- a/aiohttp/web_urldispatcher.py
++++ b/aiohttp/web_urldispatcher.py
+@@ -7,6 +7,7 @@ import html
+ import inspect
+ import keyword
+ import os
++import platform
+ import re
+ import sys
+ import warnings
+@@ -94,6 +95,7 @@ ROUTE_RE: Final[Pattern[str]] = re.compile(
+ )
+ PATH_SEP: Final[str] = re.escape("/")
+ 
++IS_WINDOWS: Final[bool] = platform.system() == "Windows"
+ 
+ _ExpectHandler = Callable[[Request], Awaitable[Optional[StreamResponse]]]
+ _Resolve = Tuple[Optional["UrlMappingMatchInfo"], Set[str]]
+@@ -649,7 +651,12 @@ class StaticResource(PrefixResource):
+     async def resolve(self, request: Request) -> _Resolve:
+         path = request.rel_url.path_safe
+         method = request.method
+-        if not path.startswith(self._prefix2) and path != self._prefix:
++        # We normalise here to avoid matches that traverse below the static root.
++        # e.g. /static/../../../../home/user/webapp/static/
++        norm_path = os.path.normpath(path)
++        if IS_WINDOWS:
++            norm_path = norm_path.replace("\\", "/")
++        if not norm_path.startswith(self._prefix2) and norm_path != self._prefix:
+             return None, set()
+ 
+         allowed_methods = self._allowed_methods
+@@ -666,14 +673,7 @@ class StaticResource(PrefixResource):
+         return iter(self._routes.values())
+ 
+     async def _handle(self, request: Request) -> StreamResponse:
+-        rel_url = request.match_info["filename"]
+-        filename = Path(rel_url)
+-        if filename.anchor:
+-            # rel_url is an absolute name like
+-            # /static/\\machine_name\c$ or /static/D:\path
+-            # where the static dir is totally different
+-            raise HTTPForbidden()
+-
++        filename = request.match_info["filename"]
+         unresolved_path = self._directory.joinpath(filename)
+         loop = asyncio.get_running_loop()
+         return await loop.run_in_executor(
+diff --git a/tests/test_urldispatch.py b/tests/test_urldispatch.py
+index ba6bdff..e329ea2 100644
+--- a/tests/test_urldispatch.py
++++ b/tests/test_urldispatch.py
+@@ -1,4 +1,5 @@
+ import pathlib
++import platform
+ import re
+ from collections.abc import Container, Iterable, Mapping, MutableMapping, Sized
+ from typing import NoReturn
+@@ -1041,7 +1042,22 @@ async def test_405_for_resource_adapter(router) -> None:
+     assert (None, {"HEAD", "GET"}) == ret
+ 
+ 
+-async def test_check_allowed_method_for_found_resource(router) -> None:
++@pytest.mark.skipif(platform.system() == "Windows", reason="Different path formats")
++async def test_static_resource_outside_traversal(router: web.UrlDispatcher) -> None:
++    """Test relative path traversing outside root does not resolve."""
++    static_file = pathlib.Path(aiohttp.__file__)
++    request_path = "/st" + "/.." * (len(static_file.parts) - 2) + str(static_file)
++    assert pathlib.Path(request_path).resolve() == static_file
++
++    resource = router.add_static("/st", static_file.parent)
++    ret = await resource.resolve(make_mocked_request("GET", request_path))
++    # Should not resolve, otherwise filesystem information may be leaked.
++    assert (None, set()) == ret
++
++
++async def test_check_allowed_method_for_found_resource(
++    router: web.UrlDispatcher,
++) -> None:
+     handler = make_handler()
+     resource = router.add_resource("/")
+     resource.add_route("GET", handler)
+diff --git a/tests/test_web_sendfile_functional.py b/tests/test_web_sendfile_functional.py
+index 0325a46..3207623 100644
+--- a/tests/test_web_sendfile_functional.py
++++ b/tests/test_web_sendfile_functional.py
+@@ -638,7 +638,7 @@ async def test_static_file_directory_traversal_attack(aiohttp_client) -> None:
+ 
+     url_abspath = "/static/" + str(full_path.resolve())
+     resp = await client.get(url_abspath)
+-    assert 403 == resp.status
++    assert resp.status == 404
+     await resp.release()
+ 
+     await client.close()
+diff --git a/tests/test_web_urldispatcher.py b/tests/test_web_urldispatcher.py
+index ee60b69..7de3ea5 100644
+--- a/tests/test_web_urldispatcher.py
++++ b/tests/test_web_urldispatcher.py
+@@ -838,8 +838,8 @@ async def test_static_absolute_url(
+     here = pathlib.Path(__file__).parent
+     app.router.add_static("/static", here)
+     client = await aiohttp_client(app)
+-    resp = await client.get("/static/" + str(file_path.resolve()))
+-    assert resp.status == 403
++    async with client.get("/static/" + str(file_path.resolve())) as resp:
++        assert resp.status == 404
+ 
+ 
+ async def test_for_issue_5250(
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 9a45eecb8c..16429c9d86 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI += "file://CVE-2025-69224.patch \
             file://CVE-2025-69225.patch \
+            file://CVE-2025-69226.patch \
 "
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 

