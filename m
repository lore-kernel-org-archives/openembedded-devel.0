Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24.1794851777884695967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pekR1vql;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6024937eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851777; x=1795456577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wFMIXMrqFNJSdBczucUAX2KG94BDS+WxREh5532NkU=;
        b=pekR1vql88W0yWi3hv7mc966IC6jysWleKUpfYXcULdeiZM4x7YnliMuqyp9WGyuJ3
         pr9ONPPIqmbLN1OGDO0y2CRIIUZMWANEryTURoy+drQ1idtlxiWaeaBXPpK4k453KJvS
         Z/cD1Su6J+VMNAzo9AaavWDOXYESdtOdi/86WN7574iL4PB9NBtoEt/Yc8Cx5juR7fKL
         WrqsaxG7O3vZsAtlpf32SHugxbJBKpmqdjCKdJNxZ1lo8iak8qAMrEi1tPDB+vG/bKbt
         bdFyKDUKsbqu9J1tqwCuzRnHSvFlJtLDZLRNh0PsCP3htdLrmHOX2B6zdi43PrGHPu6d
         g8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851777; x=1795456577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wFMIXMrqFNJSdBczucUAX2KG94BDS+WxREh5532NkU=;
        b=bhmehKrpx7IlgHytAr/0bhjauPfvsuuokRfcLH3Nao9SZDGOXNBROzSXRiTnQRT4IU
         hWQTwhqaCSICDh9dOxgUpD+7E2QBxl39ARg2w9vc5gjnsVutSnEdVsdkTF8yo0bYXir/
         wgFx80Sjq6gbEIjqES14JkIgd3BtW+ZZNM4saa2vWez5cSZK0jN9AoFX4dY+U2PkSm2I
         12X1znBr1MfcgY0B8VWLI066ZKGCC4H8x6HB3lb/sx5hihvfNHXMvU3LOOSwOQdvSR8i
         Hb1D/UQ8r5aD3x1C/AosvWRAdQHAhCnZIEyFRsgV1CmkPPoyXriV8+ouCLlNn2O92unF
         SZkw==
X-Gm-Message-State: APuU4Z+X93ZXSMYoOSvFVLcq/uBNCLGXw0DDWT2Isdgsx1L1sI8Yl/4x
	ruMLYn9k3BrVbY9/VEtEnQ8E1Opeu3wkhJQhdauFJGhMl+CFQU7G69a5P8+OELKi
X-Gm-Gg: AYBFou3etxldUrM9gUuEyi50eIRteg6cB0KUbt1L9t00FZ56eQxK6SdhJmrw5CR0xr9
	Qbf25IQf9RGCO+AQmHYYPjoz0DWtrJPSh3D0rdBvpOS0CtGWS94MNxLOwXjT/CUpdxEIFR3wlzv
	bOKXSQ+0GzG/GYL/zy//ZiGJR4mWTawVSVaiLfJVVMGMSSMQPR4Q4EzlnKdqiYaM1Ux8mSqxMfo
	fgcuBf4DnCCXUmWxochRl/eKrYeNqeEgCs3dxT2tUZcUnfy60TWDdcVAKieKCdy7E7dg+PmvZJc
	ltG/VUGqS09DxVLAQkCcfCTmaaZVeofTScMm9WSXXzqRtMyoQiS0439drn25/9wk64O77YmC0/E
	rhKQrX8rIaCB3SrVfY+3a2hKGOky2tOu5uc0B5n/yo4wjBbFo6T1+d6bnlE/pEyjiiDGGna7ShC
	3Ee0H+zjCfYXik/Go80/+Gw4TNvkDdgY8MfVsKO+tN9CiwymCFV/7nVMVzSyYv1jn0/Vq8iIREK
	6dunXMbP7CIbIMvxlUBe/gA1FAYyzTZUDB5FmiED0gUeeTgVGgFKyaqN0xM4jMTEDXQ3m2KAcEk
	CDIYpTzua2FzVWeyWrd/U/dfLF+MFx0r7u0NQ0UCwHa3/9rFwXqDBfUsL6RRDW1uNhcBUia3X9C
	b2J1ZnNdgzVwCP25rVHc22gA/6sxshMyKhCJdSHRQShBhW4TH6NqzMYga+KuMsMq27IQb0lswQl
	6b5vsU2XsUKmJrRGCC1mGfqBRkFSleS5rJpLodYIlvCG9QspuK5QYIxyEOAgavdf6o5LssGd6HP
	+Z0PLiaWyLeedsl1yf2ukSPoN8MHzEYCbbDBN12Rv3kQw1ugSRXAp0mRsi0k9Ns3F6vMOMXkt2/
	EpfF
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr10769231eec.1.1794851777046;
        Mon, 16 Nov 2026 09:56:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 100/105] python3-uvicorn: upgrade 0.49.0 -> 0.54.0
Date: Mon, 16 Nov 2026 09:53:52 -0800
Message-ID: <20261116175359.342679-100-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132555
Content-Type: text/plain; charset="utf-8"

Refresh the ptest skip patches. The tests moved from httpx to httpx2;
update the ptest RDEPENDS.

Changes:
- 0.50: --ws auto now selects websockets-sansio (needs websockets
  >=13.0); legacy websockets implementation deprecated. Startup
  failures exit with code 3 and stop the multiprocess supervisor.
- 0.51: workers restarted one at a time on SIGHUP; colorama removed
  from the "standard" extra. click.style replaced by internal helper.
- 0.52 to 0.54: experimental HTTP/1.1 and HTTP/2 via the new optional
  zttp package (--http zttp [--http2]), zuvloop support, HTTP/2
  trailers and 103 Early Hints.
- Fixes: WebSocket closing handshake, write flow control, duplicate
  headers, IPv6 loopback trusted in default FORWARDED_ALLOW_IPS,
  memory regression with --reload/--workers.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-ptest-disable-failing-tests.patch    | 24 +++++++----------
 .../0002-ptest-skip-test_headers.patch        | 27 +++++++++----------
 ...rn_0.49.0.bb => python3-uvicorn_0.54.0.bb} |  4 +--
 3 files changed, 24 insertions(+), 31 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.49.0.bb => python3-uvicorn_0.54.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch b/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
index 54e8c21aca..ba00b12c56 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
+++ b/meta-python/recipes-devtools/python/python3-uvicorn/0001-ptest-disable-failing-tests.patch
@@ -9,16 +9,15 @@ Upstream-Status: Pending [https://github.com/Kludex/uvicorn/discussions/2759]
 
 Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
 ---
- tests/protocols/test_websocket.py      | 3 +++
- tests/supervisors/test_multiprocess.py | 2 ++
- tests/test_config.py                   | 5 +++--
+ tests/protocols/test_websocket.py      |    3 +++
+ tests/supervisors/test_multiprocess.py |    2 ++
+ tests/test_config.py                   |    5 +++--
  3 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/tests/protocols/test_websocket.py b/tests/protocols/test_websocket.py
-index 2e1a33a..ae1e041 100644
 --- a/tests/protocols/test_websocket.py
 +++ b/tests/protocols/test_websocket.py
-@@ -685,6 +685,9 @@ MAX_WS_BYTES = 1024 * 1024 * 16
+@@ -694,6 +694,9 @@
  MAX_WS_BYTES_PLUS1 = MAX_WS_BYTES + 1
  
  
@@ -29,30 +28,28 @@ index 2e1a33a..ae1e041 100644
      "client_size_sent, server_size_max, expected_result",
      [
 diff --git a/tests/supervisors/test_multiprocess.py b/tests/supervisors/test_multiprocess.py
-index e1f594e..43002c3 100644
 --- a/tests/supervisors/test_multiprocess.py
 +++ b/tests/supervisors/test_multiprocess.py
-@@ -75,6 +75,7 @@ def test_multiprocess_run() -> None:
-     supervisor.join_all()
+@@ -86,6 +86,7 @@
+     thread.join()
  
  
 +@pytest.mark.skip(reason="fails on OpenEmbedded/Yocto")
  @new_console_in_windows
  def test_multiprocess_health_check() -> None:
      """
-@@ -121,6 +122,7 @@ def test_multiprocess_sigbreak() -> None:  # pragma: py-not-win32
+@@ -151,6 +152,7 @@
      supervisor.join_all()
  
  
 +@pytest.mark.skip(reason="failing on Yocto/OpenEmbedded")
  @pytest.mark.skipif(not hasattr(signal, "SIGHUP"), reason="platform unsupports SIGHUP")
- def test_multiprocess_sighup() -> None:
+ def test_multiprocess_sighup(monkeypatch: pytest.MonkeyPatch) -> None:
      """
 diff --git a/tests/test_config.py b/tests/test_config.py
-index 9c80ca4..fe4c2e8 100644
 --- a/tests/test_config.py
 +++ b/tests/test_config.py
-@@ -303,8 +303,9 @@ def test_asgi_version(app: ASGIApplication, expected_interface: Literal["2.0", "
+@@ -309,8 +309,9 @@
  @pytest.mark.parametrize(
      "use_colors, expected",
      [
@@ -64,6 +61,3 @@ index 9c80ca4..fe4c2e8 100644
          pytest.param(True, True, id="use_colors_enabled"),
          pytest.param(False, False, id="use_colors_disabled"),
      ],
--- 
-2.47.3
-
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch b/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
index 6b921db579..931f682106 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
+++ b/meta-python/recipes-devtools/python/python3-uvicorn/0002-ptest-skip-test_headers.patch
@@ -38,17 +38,16 @@ parametrized tests based on only some combinations failing.
 Upstream-Status: Inappropriate (embedded specific)
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/protocols/test_websocket.py | 19 +++++++++++++++++++
+ tests/protocols/test_websocket.py |   19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
 diff --git a/tests/protocols/test_websocket.py b/tests/protocols/test_websocket.py
-index 87a151d..85eb362 100644
 --- a/tests/protocols/test_websocket.py
 +++ b/tests/protocols/test_websocket.py
-@@ -204,6 +204,11 @@ async def test_close_connection(ws_protocol_cls: WSProtocol, http_protocol_cls:
+@@ -206,6 +206,11 @@
          assert not is_open
-
-
+ 
+ 
 +# FAIL: tests/protocols/test_websocket.py:test_headers[websockets-httptools]
 +# FAIL: tests/protocols/test_websocket.py:test_headers[websockets-h11]
 +# FAIL: tests/protocols/test_websocket.py:test_headers[websockets-sansio-httptools]
@@ -57,10 +56,10 @@ index 87a151d..85eb362 100644
  async def test_headers(ws_protocol_cls: WSProtocol, http_protocol_cls: HTTPProtocol, unused_tcp_port: int):
      class App(WebSocketResponse):
          async def websocket_connect(self, message: WebSocketConnectEvent):
-@@ -758,6 +763,13 @@ async def test_send_binary_data_to_server_bigger_than_default_on_websockets(
-                 assert ws.close_code == expected_result
-
-
+@@ -762,6 +767,13 @@
+         assert disconnect_code == expected_result
+ 
+ 
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_exceeding_max_size[wsproto-httptools]
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_exceeding_max_size[wsproto-h11]
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_exceeding_max_size[websockets-httptools]
@@ -71,10 +70,10 @@ index 87a151d..85eb362 100644
  async def test_fragmented_message_exceeding_max_size(
      ws_protocol_cls: WSProtocol, http_protocol_cls: HTTPProtocol, unused_tcp_port: int
  ):
-@@ -782,6 +794,13 @@ async def test_fragmented_message_exceeding_max_size(
+@@ -784,6 +796,13 @@
      assert exc_info.value.rcvd.code == 1009
-
-
+ 
+ 
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_reassembly[wsproto-httptools]
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_reassembly[wsproto-h11]
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_reassembly[websockets-httptools]
@@ -82,6 +81,6 @@ index 87a151d..85eb362 100644
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_reassembly[websockets-sansio-httptools]
 +# FAIL: tests/protocols/test_websocket.py:test_fragmented_message_reassembly[websockets-sansio-h11]
 +@pytest.mark.skip(reason="failing on Yocto/OpenEmbedded")
+ @pytest.mark.parametrize("opcode", [Opcode.TEXT, Opcode.BINARY])
  async def test_fragmented_message_reassembly(
-     ws_protocol_cls: WSProtocol, http_protocol_cls: HTTPProtocol, unused_tcp_port: int
- ):
+     ws_protocol_cls: WSProtocol, http_protocol_cls: HTTPProtocol, unused_tcp_port: int, opcode: Opcode
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.54.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.54.0.bb
index 7f5c91ff3a..e238c4a0ba 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.54.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "ebf4271aa580d9de97f93192d4595176df6e91f9aae919ca73e4fc07df1e66a3"
+SRC_URI[sha256sum] = "a2e33cbfaa0306f8e6b0c13e0cb89d7d7a2da3e62b90c66e18c33d9807b28620"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch \
             file://0002-ptest-skip-test_headers.patch \
@@ -27,7 +27,7 @@ RDEPENDS:${PN} = "\
 
 RDEPENDS:${PN}-ptest += "\
     python3-a2wsgi \
-    python3-httpx \
+    python3-httpx2 \
     python3-pytest-mock \
     python3-pyyaml \
 "
