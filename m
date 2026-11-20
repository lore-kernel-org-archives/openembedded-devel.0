Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4445.1795175881503278797
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JGcFI7mK;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6156; q=dns/txt;
  s=iport01; t=1795175881; x=1796385481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5mUZK+Ll2vvqvqsIlWP/r+heSR27vWAj1KlgQAcXt1w=;
  b=JGcFI7mKUGqKdu1qiVr1Zvk23cyqBcVMfuMZuto8Knp3Zs6IXG26l6zN
   6Lfuo940X/tHH9DiWKAo3hvhd344Z6FlCcRRwv0gV12X46BwNgCQ77iWu
   Ykv4TCxtrfQr5TTcJWRkD4dhtFkroil0WGjkYn5UwrXPrE2UK8PaOspuY
   bDZpuV/txLhG+PljhFAP8QSb1HUu92TZX8UoLAo/pZiRvLRwp++UMKf7A
   MoHLN9FP1z7QzmqOENt1U8eTJrp7E3kZKEpa20g7V42nqEi6qVRSfzB+v
   9hHYcpn1gw4mdkHh9vkBNDHJueFdHrA/TFiYJAMmeQZsL4tedRrnXD+u9
   g==;
X-CSE-ConnectionGUID: ALwusNfzR8OudCa7RnmbGQ==
X-CSE-MsgGUID: urT9T1hUTA6/17ZtxtIbUA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBYNABr/85K/pBaglmCV3VhQkmiNJJDgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjiECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgE1ARgBLSwDAQJPCyMhgwIBgjoDNwIBEbkXgiyBAYMpAT8CQ?=
 =?us-ascii?q?1DYTA2CWgELFAEFgTOFQoMAhSRdGAGEfScbG4FyhH+BBYEaGCoBAYFIhl4Eg?=
 =?us-ascii?q?iKBDIFUjRcCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGD?=
 =?us-ascii?q?RgNSBEsNxUZBD5uB5NsgxmBDgErgjKTMQGSPaAgcQoog3mMJI8+hXwaM4Vbp?=
 =?us-ascii?q?RcLmH2OCoQKhCKOJYRqgWg8gUcLB3AVgyIJShkPji4LC4NggX+DZch3IzUCC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:zq8hwKkFKoayZ9M1jyz+Rujo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJW26FbPrcNzf9fNAgaY2zpxsB68KAytQ2T1c//yxmHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfra8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaQ85ftsJ29cz
 6w/NTwmZ0+5gee874vuH4GAhux7RCXqFIoSoDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUURUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIeEJIXUFJgM9qqej
 n/cwzXFWxEnCPXBjmPawG68ms7FoAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:F6SUxqoBq5MmYbj9dsXfQUgaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:1AKBaG8n499bBQk5JEuVv2cwBd0+VHPP9if3PkOTADlTTrifZmbFrQ==
X-Talos-MUID: 9a23:BzRgXgUVItxAzhrq/CL2uGBebcdV343wTxlSo4kWp+iOCAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59616951"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 11:57:59 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id DF4C0180003BA;
	Fri, 20 Nov 2026 11:57:58 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 95F46CC1634; Fri, 20 Nov 2026 03:57:57 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-python][wrynose][PATCH] python3-socketio: Fix CVE-2026-48804
Date: Fri, 20 Nov 2026 03:57:51 -0800
Message-Id: <20261120115751.2246881-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132775
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/miguelgrinberg/python-socketio/commit/4bec3ef87bcfd6ab5b94cd3ac09d873283a6960e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-48804

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-socketio/CVE-2026-48804.patch     | 117 ++++++++++++++++++
 .../python/python3-socketio_5.16.3.bb         |   2 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-socketio/CVE-2026-48804.patch

diff --git a/meta-python/recipes-devtools/python/python3-socketio/CVE-2026-48804.patch b/meta-python/recipes-devtools/python/python3-socketio/CVE-2026-48804.patch
new file mode 100644
index 0000000000..8ac7a49c7d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-socketio/CVE-2026-48804.patch
@@ -0,0 +1,117 @@
+From f568afc1b85c0bd5001910cb4957a52d7116ab2f Mon Sep 17 00:00:00 2001
+From: Miguel Grinberg <miguel.grinberg@gmail.com>
+Date: Fri, 7 Aug 2026 00:02:23 +0100
+Subject: [PATCH] Delete incomplete binary packet when client disconnects
+
+CVE: CVE-2026-48804
+Upstream-Status: Backport [https://github.com/miguelgrinberg/python-socketio/commit/4bec3ef87bcfd6ab5b94cd3ac09d873283a6960e]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ src/socketio/async_server.py |  2 ++
+ src/socketio/server.py       |  2 ++
+ tests/async/test_server.py   | 19 ++++++++++++++++++-
+ tests/common/test_server.py  | 17 ++++++++++++++++-
+ 4 files changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/src/socketio/async_server.py b/src/socketio/async_server.py
+index 7e9c872..bcffb35 100644
+--- a/src/socketio/async_server.py
++++ b/src/socketio/async_server.py
+@@ -590,6 +590,8 @@ class AsyncServer(base_server.BaseServer):
+         if not self.manager.is_connected(sid, namespace):  # pragma: no cover
+             return
+         self.manager.pre_disconnect(sid, namespace=namespace)
++        if eio_sid in self._binary_packet:
++            del self._binary_packet[eio_sid]
+         await self._trigger_event('disconnect', namespace, sid,
+                                   reason or self.reason.CLIENT_DISCONNECT)
+         await self.manager.disconnect(sid, namespace, ignore_queue=True)
+diff --git a/src/socketio/server.py b/src/socketio/server.py
+index 143d27e..6af30f3 100644
+--- a/src/socketio/server.py
++++ b/src/socketio/server.py
+@@ -571,6 +571,8 @@ class Server(base_server.BaseServer):
+         if not self.manager.is_connected(sid, namespace):  # pragma: no cover
+             return
+         self.manager.pre_disconnect(sid, namespace=namespace)
++        if eio_sid in self._binary_packet:
++            del self._binary_packet[eio_sid]
+         self._trigger_event('disconnect', namespace, sid,
+                             reason or self.reason.CLIENT_DISCONNECT)
+         self.manager.disconnect(sid, namespace, ignore_queue=True)
+diff --git a/tests/async/test_server.py b/tests/async/test_server.py
+index c3c0903..97c804a 100644
+--- a/tests/async/test_server.py
++++ b/tests/async/test_server.py
+@@ -937,7 +937,7 @@ class TestAsyncServer:
+         await s.disconnect('1', namespace='/foo')
+         assert calls == s.eio.send.await_count
+ 
+-    async def test_disconnect_with_partial_binary_packet(self, eio):
++    async def test_server_disconnect_with_partial_binary_packet(self, eio):
+         eio.return_value.send = mock.AsyncMock()
+         eio.return_value.disconnect = mock.AsyncMock()
+         s = async_server.AsyncServer()
+@@ -955,6 +955,23 @@ class TestAsyncServer:
+         s.eio.send.assert_any_await('123', '1')
+         assert '123' not in s._binary_packet
+ 
++    async def test_client_disconnect_with_partial_binary_packet(self, eio):
++        eio.return_value.send = mock.AsyncMock()
++        eio.return_value.disconnect = mock.AsyncMock()
++        s = async_server.AsyncServer()
++        await s._handle_eio_connect('123', 'environ')
++        await s._handle_eio_message('123', '0')
++        await s._handle_eio_message(
++            '123',
++            '52-["my message","a",'
++            '{"_placeholder":true,"num":1},'
++            '{"_placeholder":true,"num":0}]',
++        )
++        await s._handle_eio_message('123', b'foo')
++        assert s._binary_packet['123'] is not None
++        await s._handle_disconnect('123', '/')
++        assert '123' not in s._binary_packet
++
+     async def test_namespace_handler(self, eio):
+         eio.return_value.send = mock.AsyncMock()
+         result = {}
+diff --git a/tests/common/test_server.py b/tests/common/test_server.py
+index d8d80dc..251d661 100644
+--- a/tests/common/test_server.py
++++ b/tests/common/test_server.py
+@@ -862,7 +862,7 @@ class TestServer:
+         s.disconnect('123', namespace='/foo')
+         assert calls == s.eio.send.call_count
+ 
+-    def test_disconnect_with_partial_binary_packet(self, eio):
++    def test_disconnect_server_with_partial_binary_packet(self, eio):
+         s = server.Server()
+         s._handle_eio_connect('123', 'environ')
+         s._handle_eio_message('123', '0')
+@@ -878,6 +878,21 @@ class TestServer:
+         s.eio.send.assert_any_call('123', '1')
+         assert '123' not in s._binary_packet
+ 
++    def test_disconnect_client_with_partial_binary_packet(self, eio):
++        s = server.Server()
++        s._handle_eio_connect('123', 'environ')
++        s._handle_eio_message('123', '0')
++        s._handle_eio_message(
++            '123',
++            '52-["my message","a",'
++            '{"_placeholder":true,"num":1},'
++            '{"_placeholder":true,"num":0}]',
++        )
++        s._handle_eio_message('123', b'foo')
++        assert s._binary_packet['123'] is not None
++        s._handle_disconnect('123', '/')
++        assert '123' not in s._binary_packet
++
+     def test_namespace_handler(self, eio):
+         result = {}
+ 
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
index be352876a8..be58a2172c 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
@@ -9,6 +9,8 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
+SRC_URI += "file://CVE-2026-48804.patch"
+
 SRC_URI[sha256sum] = "89b136f677ae65607a84cecda9b4d6c5377b40a97582c504c25df89af16d520e"
 
 PACKAGECONFIG ?= "asyncio_client client"
-- 
2.35.6

