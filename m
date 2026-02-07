Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722B6EE0ADA
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2677.1770460448634331477
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hb41UhzE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48327b8350dso10922505e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460447; x=1771065247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBaw7D/ugt1ws/4hVRkJ39yJ7pS9dxvk1FYDtvRp5cg=;
        b=Hb41UhzEyBc8xY5JO/nbf0A6EojqHhIaRt4dvulND6Abt9Xm/Nd1cfnWwcMl7bBqpl
         qFiUdEp2tuK84xquMZalSvWXVn+ZWRxwY+cdQ5bNELRQk65Byu43WKeBSLzmQc68gKvt
         NMkVVzqQGCCqABdHmOFQCuXB7PMIWM98qsk5jKjJPoXuIU/iF3uQjjfBa+CQRbBGHKfI
         B1WygOCImstDcpj0O/MwRFMTrOxPchLmR0WIZJJxi1bg/yi9zhSVe4aHNgoSAr96NNWQ
         HsinYHH6yuzKjkDiIg51HnuzCYN1TTw76CK0dPeTRw9WH1vexkp8AJbTHF90rcYkMpHA
         2idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460447; x=1771065247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dBaw7D/ugt1ws/4hVRkJ39yJ7pS9dxvk1FYDtvRp5cg=;
        b=HEU/AokIhEw00zOje4Qc0xR3aHAQ+c/oEEbRL7dRmi/dNj5szBvy9qBjgmVaN6VYvL
         Dw1Txd2jOPHNdYYf3oMa1zUloDlxqq/l1q5a8vOdJZhUn5KxPTX3jScvY6akko664s0I
         UtrozBoE6Kp8Ys5emRhZt8xcKBvO+inI1pSNB8ZsTUmQYxshjkgk9WQjEboOh/AXUf37
         cwtfm5Dpdp7lczmoJhwiybN32K9KHzHCPow2LiMwANkrGjLer/gQKI/MqDBVRgQswGds
         PcCr+EXvdFlyyWXe1/RryPx7xga57BbcCoaNAIrqolQa4rZIznASCBc36xZbNI3LC9D8
         NTIw==
X-Gm-Message-State: AOJu0YxGlNEShS2Capi7oTdlfOWQ1Ik672LlYab9DnAO/CBXl9ROkc/2
	Ig2PBBBgN0lPDyAG4c7a4c7W14Z1gt4UTPpMx58zjnzMbu83kF0qlCs9zYbMHQ==
X-Gm-Gg: AZuq6aKlL4tz/7GfQWTyHvs6mWlL2qpTibVOueTUoGh2KQ7agmmejk0ref/SVSwC0kC
	8Dnv5n8JQMvg1yaBEn8lBjR0Az+QXHX/kewJeGfjqhNAUMVXTi/eraeklmOluuXAn3SAfyZ6xr8
	CAJkHfzv/bMbRJYgRcVlBhgs2siKZy0/nzFmjUKNdqX+H34pdOhg3/2rkEX3Iwazff+p9UMAHPe
	a0wHRJ1IZuR1vXSxFQZluFtq26+QBmeyt0l0cb/ZwrKXk9BRZ//JijRXo2M7uYjOwP+QJY/z+RT
	qlvlvL+ikrRANfshrhabMPqkwaJn63crAvpZL5muhkUEEBUDR34f/giC9e1+HZMEYUSAbopk2Ff
	3nP/HM8WqUUOAw/KizRMP6JHk4daw6OAQFWnHEywR6sK1aAztG8xITgqkYFjo2btznT7Y3nTaqL
	vNmcvNnMPt
X-Received: by 2002:a05:600c:1f16:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48320227d98mr84644545e9.35.1770460446797;
        Sat, 07 Feb 2026 02:34:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 09/15] python3-aiohttp: patch CVE-2025-69226
Date: Sat,  7 Feb 2026 11:33:51 +0100
Message-ID: <20260207103359.4177243-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124250

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69226

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69226.patch      | 134 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
new file mode 100644
index 0000000000..77dd89a805
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
@@ -0,0 +1,134 @@
+From 8d718d1fb8ee7a923c0e42cf100908ecead4f564 Mon Sep 17 00:00:00 2001
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
+ aiohttp/web_urldispatcher.py          | 17 +++++++++--------
+ tests/test_urldispatch.py             | 18 +++++++++++++++++-
+ tests/test_web_sendfile_functional.py |  2 +-
+ tests/test_web_urldispatcher.py       |  4 ++--
+ 4 files changed, 29 insertions(+), 12 deletions(-)
+
+diff --git a/aiohttp/web_urldispatcher.py b/aiohttp/web_urldispatcher.py
+index 954291f..864f8dd 100644
+--- a/aiohttp/web_urldispatcher.py
++++ b/aiohttp/web_urldispatcher.py
+@@ -7,6 +7,7 @@ import html
+ import inspect
+ import keyword
+ import os
++import platform
+ import re
+ import warnings
+ from contextlib import contextmanager
+@@ -88,6 +89,7 @@ ROUTE_RE: Final[Pattern[str]] = re.compile(
+ )
+ PATH_SEP: Final[str] = re.escape("/")
+ 
++IS_WINDOWS: Final[bool] = platform.system() == "Windows"
+ 
+ _ExpectHandler = Callable[[Request], Awaitable[Optional[StreamResponse]]]
+ _Resolve = Tuple[Optional["UrlMappingMatchInfo"], Set[str]]
+@@ -647,7 +649,12 @@ class StaticResource(PrefixResource):
+         path = request.rel_url.raw_path
+         method = request.method
+         allowed_methods = set(self._routes)
+-        if not path.startswith(self._prefix2) and path != self._prefix:
++        # We normalise here to avoid matches that traverse below the static root.
++        # e.g. /static/../../../../home/user/webapp/static/
++        norm_path = os.path.normpath(path)
++        if IS_WINDOWS:
++            norm_path = norm_path.replace("\\", "/")
++        if not norm_path.startswith(self._prefix2) and norm_path != self._prefix:
+             return None, set()
+ 
+         if method not in allowed_methods:
+@@ -663,14 +670,8 @@ class StaticResource(PrefixResource):
+         return iter(self._routes.values())
+ 
+     async def _handle(self, request: Request) -> StreamResponse:
+-        rel_url = request.match_info["filename"]
+         try:
+-            filename = Path(rel_url)
+-            if filename.anchor:
+-                # rel_url is an absolute name like
+-                # /static/\\machine_name\c$ or /static/D:\path
+-                # where the static dir is totally different
+-                raise HTTPForbidden()
++            filename = request.match_info["filename"]
+             unresolved_path = self._directory.joinpath(filename)
+             if self._follow_symlinks:
+                 normalized_path = Path(os.path.normpath(unresolved_path))
+diff --git a/tests/test_urldispatch.py b/tests/test_urldispatch.py
+index 4f3abb8..cec4cd0 100644
+--- a/tests/test_urldispatch.py
++++ b/tests/test_urldispatch.py
+@@ -1,4 +1,5 @@
+ import pathlib
++import platform
+ import re
+ from collections.abc import Container, Iterable, Mapping, MutableMapping, Sized
+ from urllib.parse import unquote
+@@ -967,7 +968,22 @@ async def test_405_for_resource_adapter(router) -> None:
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
+index 57ac084..aa53726 100644
+--- a/tests/test_web_sendfile_functional.py
++++ b/tests/test_web_sendfile_functional.py
+@@ -565,7 +565,7 @@ async def test_static_file_directory_traversal_attack(aiohttp_client) -> None:
+ 
+     url_abspath = "/static/" + str(full_path.resolve())
+     resp = await client.get(url_abspath)
+-    assert 403 == resp.status
++    assert resp.status == 404
+     await resp.release()
+ 
+     await client.close()
+diff --git a/tests/test_web_urldispatcher.py b/tests/test_web_urldispatcher.py
+index 0441890..4164677 100644
+--- a/tests/test_web_urldispatcher.py
++++ b/tests/test_web_urldispatcher.py
+@@ -701,8 +701,8 @@ async def test_static_absolute_url(
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 43482db392..f2332065ea 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d
 SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-53643.patch \
            file://CVE-2025-69225.patch \
+           file://CVE-2025-69226.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"

