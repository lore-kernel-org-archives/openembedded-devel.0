Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88917CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:42:56 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16161.1792132971502053406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DG2X7PGF;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5377; q=dns/txt;
  s=iport01; t=1792132971; x=1793342571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7ejFU6x/2M+XRUoJTvI2bsdjZRzcyUytouBPqciDliY=;
  b=DG2X7PGFqHJsrabWqly1BMIRgqTKd/3xvM1xMQbFeUtyW4ngyDr3rl8V
   kwCSpXQ2ZuhxXxKyfnPVvWFvqqa6bs+f4nMQGhYil1VcIDqxRlymCUmKO
   cwQjbJoldnDlJRVb0ZgV+0vig5/Ggwug9mk2FE8VLzwG/81msbpIs/OrP
   /lEsGoYFbUi365OOZNQuQVqkp1By11uMlb6msvW9ExZDNqFD9IEWbRtaw
   C2tUUbPAU/vzbfnfljfa45MdmbbxA3ML12/QNIas0RMJ0/tCAxCVVxtJw
   +msWliIFYThYr1puU7Sgao34WGo42KdCdKJS6u4NQkQt4oz5qKxSMAway
   w==;
X-CSE-ConnectionGUID: OaipThxtSam7AlU1MDfHsQ==
X-CSE-MsgGUID: fxm9g1mSTBmWzy5eU0lnyg==
X-IPAS-Result: =?us-ascii?q?A0BJAgDLxdFq/5T/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG8eoF5M4EBg?=
 =?us-ascii?q?ykBgVTbMgELFAGBOIVAiCNdGAGEfCcbG4FygRWDaYEFgVwCgUiGXQSCIoEMg?=
 =?us-ascii?q?VqBA5RESIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC?=
 =?us-ascii?q?4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmV7EwEqAYEgS?=
 =?us-ascii?q?EROpSehDwoog3aMIpU6GjOFW6UUC5h9jgqVf1CEaYFoPIFZcBU7gmcJShkPj?=
 =?us-ascii?q?i4LC4NghWTIdicyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:DS/pPK7KGZjk7G/h+S41dgxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mEdWmrXP/jeNGH3KYogbI+3oUJTucPXn4I2SwA++XpjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGoQZ4tp3EX11/
 PlHATQwNzWvicKt+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeOJITWGZoNwi50o
 ErI72GoDUgfD+C1zAWX4y+hu7fLmzL0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:jzxzQ6wHOxPksucRLNByKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3ArPiYmGvxSCfT93bP3rPE1xCN6IsCe3zF8HfAP3S?=
 =?us-ascii?q?xDDlATIDMbHOe2Lhdxp8=3D?=
X-Talos-MUID: 9a23:fy6ejwbnfafMBuBTuS/p1T47MfxUyaGRGlFQnKhev8+VOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536044704"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:42:50 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8B4A7180002EC;
	Fri, 16 Oct 2026 06:42:50 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B9E22CBF201; Thu, 15 Oct 2026 23:42:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 1/3] python3-aiohttp: fix CVE-2026-59881
Date: Thu, 15 Oct 2026 23:42:17 -0700
Message-Id: <20261016064219.3910025-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016064219.3910025-1-dkelaiya@cisco.com>
References: <20261016064219.3910025-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131068

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1]. The 3.13.5 backport passes the negotiated
compression setting to the client WebSocket reader.

[1] https://github.com/aio-libs/aiohttp/commit/47fb6ae354d4fa22048f4dbe7dbf82b625f0a2f6
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-mq44-7p77-q5h7

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-59881.patch      | 103 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
new file mode 100644
index 0000000000..14b05cd2fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
@@ -0,0 +1,103 @@
+From b052f95658821f726388cb86cfefad1cec264842 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Thu, 1 Oct 2026 02:37:30 -0700
+Subject: [PATCH] Fix decompressing frames without negotiation (#12976)
+ (#12978)
+
+CVE: CVE-2026-59881
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/47fb6ae354d4fa22048f4dbe7dbf82b625f0a2f6]
+
+Backport Changes:
+- Passed the negotiated compression flag to the 3.13.5 client reader.
+- Kept the reader's compress=True default: both production call
+  sites now pass the negotiated setting (the server already did).
+- Adapted the upstream client regression test to the 3.13.5 API.
+- Omitted changes to newer WebSocket APIs and unrelated tests.
+
+(cherry picked from commit 47fb6ae354d4fa22048f4dbe7dbf82b625f0a2f6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/client.py                  |  4 ++-
+ tests/test_client_ws_functional.py | 40 +++++++++++++++++++++++++++++-
+ 2 files changed, 42 insertions(+), 2 deletions(-)
+
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index 0637eff6b..8cd9add5f 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -1190,7 +1190,9 @@ class ClientSession:
+             transport = conn.transport
+             assert transport is not None
+             reader = WebSocketDataQueue(conn_proto, 2**16, loop=self._loop)
+-            conn_proto.set_parser(WebSocketReader(reader, max_msg_size), reader)
++            conn_proto.set_parser(
++                WebSocketReader(reader, max_msg_size, compress=bool(compress)), reader
++            )
+             writer = WebSocketWriter(
+                 conn_proto,
+                 transport,
+diff --git a/tests/test_client_ws_functional.py b/tests/test_client_ws_functional.py
+index 7b6bd0322..a67769c1c 100644
+--- a/tests/test_client_ws_functional.py
++++ b/tests/test_client_ws_functional.py
+@@ -1,5 +1,7 @@
+ import asyncio
++import struct
+ import sys
++import zlib
+ from typing import Any, List, NoReturn, Optional
+ from unittest import mock
+ 
+@@ -15,8 +17,9 @@ from aiohttp import (
+     web,
+ )
+ from aiohttp._websocket.reader import WebSocketDataQueue
++from aiohttp._websocket.models import WS_DEFLATE_TRAILING
+ from aiohttp.client_ws import ClientWSTimeout
+-from aiohttp.http import WSCloseCode
++from aiohttp.http import WebSocketError, WSCloseCode
+ from aiohttp.pytest_plugin import AiohttpClient
+ 
+ if sys.version_info >= (3, 11):
+@@ -1276,3 +1279,38 @@ async def test_websocket_connection_cancellation(
+     # Cleanup properly
+     websocket._response = mock.Mock()
+     await websocket.close()
++
++
++async def test_client_rejects_compressed_frame_without_negotiation(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    """Reject RSV1 frames when permessage-deflate was not negotiated."""
++    payload = b"this frame should never be decompressed by the client"
++
++    async def handler(request: web.Request) -> web.WebSocketResponse:
++        ws = web.WebSocketResponse()
++        await ws.prepare(request)
++        transport = request.transport
++        assert transport is not None
++        compressor = zlib.compressobj(
++            zlib.Z_DEFAULT_COMPRESSION, zlib.DEFLATED, -zlib.MAX_WBITS
++        )
++        compressed = compressor.compress(payload)
++        compressed += compressor.flush(zlib.Z_SYNC_FLUSH)
++        compressed = compressed.removesuffix(WS_DEFLATE_TRAILING)
++        frame = struct.pack("!BB", 0x80 | 0x40 | WSMsgType.TEXT.value,
++                            len(compressed)) + compressed
++        transport.write(frame)
++        await ws.receive()
++        return ws
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++    async with client.ws_connect("/") as ws:
++        assert ws.compress == 0
++        msg = await ws.receive()
++
++    assert msg.type is WSMsgType.ERROR, msg
++    assert isinstance(msg.data, WebSocketError)
++    assert msg.data.code == WSCloseCode.PROTOCOL_ERROR
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 0faf2a8d74..b34a0fa3eb 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -19,6 +19,7 @@ SRC_URI += " \
     file://CVE-2026-54280.patch \
     file://CVE-2026-54273_p1.patch \
     file://CVE-2026-54273_p2.patch \
+    file://CVE-2026-59881.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6


