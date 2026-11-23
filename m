Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57538.1795451468536343108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=nTWmvFk2;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7032462358;
	Mon, 23 Nov 2026 16:31:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795451467;
	b=xrbIbXu2hAFXpQ15L7FAuIyUgMp7WNpzI0+J97nMKmrEQHXnWrjaCqgXaigIqpAq74dh
	 rkPnhunKVT/dA1aCW9MfNdSN0FNwI2EXZo94dET31gFTkQ+z1HZ71SbedwvzkZBQ5lVxe
	 mwny0Ei1EEMrE3Go9ZuJPZ4e54yLTcIBd2RNi293IIAXhCySnuouECw9pJs4dKrzPlEHz
	 yIcDFAGLu8uUflRIQk2gydfIve9C0xU2DK6F4uS0tmEPpbqew3KGCrEJ5wvmgE6PMoD31
	 8keE9XAsxy7uRecgNj02v6PgIl/AGMok8q3dDtwUfhUG/4T9LBMe6AdIl4e6I5YUS4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795451467;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8RPLc9R+imROcfxP6fu/96/JcV3of+Mk5pjOa7hl9ZU=;
	b=RnIcqbgsgWOQo6WCFeY8EMwm+J1AyWPV/EAVjcTj1P/3XezKwnDqMCNjcOTOnBaRzjM+
	 D0o9qISAjsVRXuNFvFb1owoIwfi35YbtvxOOtRyixWPbneY9i6Lg/WI4LmcOCxAWLoqgj
	 rpw6IgnlmTCrTYAmljbv249mKbuQWN9bYadjXmHnXq73XsY3I5jBhX/vXlA+5eUkqPlAj
	 jmb4ZOsdBjj7PTbAL43J7ueqdFG7m6HWkFOpJ70QaAgtbvERGeO2BWSOPb4HiE9iJGJHD
	 oHK8tHhEIXMcMYBMpPpsqHPnlcBRM3MKl4tasnzUEpSw4Ske1rTcaGGZ+4op3t5iHsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A17F21F000D0;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451467;
	bh=8RPLc9R+imROcfxP6fu/96/JcV3of+Mk5pjOa7hl9ZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nTWmvFk263tKx555Giu/419C1t11qK91oTmSNPAyTUPPAu2ALFlnhJw43lZS8siQv
	 NHlVvBG2bZoUTuOShXTy09QE34UqqFV71tbfvllG4vL2umbL9LixgXzxk8gbN+lLpu
	 6JreO+/KuCoLYOd+pNO4Gd5cp/5weI0Qr/DMG4KYTZVDG3SSz9SqC2HcWGOeSxnGef
	 04/t5vkmxvhavj0XcDcPKI8CLPy0X7Wp2SnyfIa+V6Kq4umDplBJh0LiOAuk7p9ziN
	 eKyFRoLQsCKMO3sE0ZMfcWcBESf/nxhrUh4oHVthOmUtxmy83NugE/PESqhvuXjD3e
	 wErnJxDYFcjEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25BA44C553;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Mon, 23 Nov 2026 17:30:40 +0100
Subject: [meta-webserver][scarthgap][PATCH 1/5] nginx: fix for
 CVE-2026-123007
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-fix_nginx2root-v1-1-1b30332ed757@belden.com>
References: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
In-Reply-To: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795451453; l=5389;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=sl+SYHio9pl1mwO2VG7JCTHtcn53Bo+ql8yxIo4agnI=;
 b=K+ZA10qVEQcHy1DHwxbn0g2LNijwGvH7hhX0Uy9ITszV2YRnnyHViFNd+68aLHACsda8hbTve
 bGKi0pZ5PTSDdJxZBY/xFZi0BtxtWer3QAdTNER64J1nNenllW4qiwC
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132906

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Pick patch [0] as mentioned in [1].

[0] https://github.com/nginx/nginx/commit/b89c4100bf6762a45e4a6463eaf4b70368277c94
[1] https://security-tracker.debian.org/tracker/CVE-2026-123007

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 .../nginx/nginx-1.26.3/CVE-2026-123007.patch       | 95 ++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb |  5 +-
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123007.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123007.patch
new file mode 100644
index 0000000000..80c34af596
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123007.patch
@@ -0,0 +1,95 @@
+From 2132cbc91feb99db7439ecd195d49f821469085b Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 29 Oct 2026 21:37:05 +0400
+Subject: [PATCH 01/10] HTTP/2: account for queued frames when validating
+ WINDOW_UPDATE
+
+When a stream is terminated, its unsent payload length is refunded back
+to the connection flow control.  Previously, this could increase the
+flow control beyond NGX_HTTP_V2_MAX_WINDOW, if it was increased by the
+client after the stream frames were queued and before the stream was
+terminated.  This eventually resulted in broken buffer size control in
+ngx_http_v2_send_chain() followed by memory corruption and a possible
+segmentation fault.
+
+The fix is to account for the queued frames when validating a client
+WINDOW_UPDATE.  From the client's point of view, the queued frames
+still belong to the flow control window.
+
+Reported by Xint.io.
+
+(cherry picked from commit b89c4100bf6762a45e4a6463eaf4b70368277c94)
+
+CVE: CVE-2026-123007
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b89c4100bf6762a45e4a6463eaf4b70368277c94]
+
+Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
+---
+ src/http/v2/ngx_http_v2.c               | 4 ++--
+ src/http/v2/ngx_http_v2.h               | 1 +
+ src/http/v2/ngx_http_v2_filter_module.c | 3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index 0f5bd3de8..7ab97bbf9 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -2466,13 +2466,13 @@ ngx_http_v2_state_window_update(ngx_http_v2_connection_t *h2c, u_char *pos,
+         return ngx_http_v2_state_complete(h2c, pos, end);
+     }
+ 
+-    if (window > NGX_HTTP_V2_MAX_WINDOW - h2c->send_window) {
++    if (window > NGX_HTTP_V2_MAX_WINDOW - h2c->send_window - h2c->send_queued) {
+         ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
+                       "client violated connection flow control: "
+                       "received WINDOW_UPDATE frame "
+                       "with window increment %uz "
+                       "not allowed for window %uz",
+-                      window, h2c->send_window);
++                      window, h2c->send_window + h2c->send_queued);
+ 
+         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_FLOW_CTRL_ERROR);
+     }
+diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
+index 6751b3026..a64599daf 100644
+--- a/src/http/v2/ngx_http_v2.h
++++ b/src/http/v2/ngx_http_v2.h
+@@ -136,6 +136,7 @@ struct ngx_http_v2_connection_s {
+     ngx_uint_t                       priority_limit;
+ 
+     size_t                           send_window;
++    size_t                           send_queued;
+     size_t                           recv_window;
+     size_t                           init_window;
+ 
+diff --git a/src/http/v2/ngx_http_v2_filter_module.c b/src/http/v2/ngx_http_v2_filter_module.c
+index 1e2cafaf1..c44954067 100644
+--- a/src/http/v2/ngx_http_v2_filter_module.c
++++ b/src/http/v2/ngx_http_v2_filter_module.c
+@@ -1028,6 +1028,7 @@ ngx_http_v2_send_chain(ngx_connection_t *fc, ngx_chain_t *in, off_t limit)
+             ngx_http_v2_queue_frame(h2c, frame);
+ 
+             h2c->send_window -= frame_size;
++            h2c->send_queued += frame_size;
+ 
+             stream->send_window -= frame_size;
+             stream->queued++;
+@@ -1423,6 +1424,7 @@ done:
+     stream->request->header_size += NGX_HTTP_V2_FRAME_HEADER_SIZE;
+ 
+     h2c->payload_bytes += frame->length;
++    h2c->send_queued -= frame->length;
+ 
+     ngx_http_v2_handle_frame(stream, frame);
+ 
+@@ -1557,6 +1559,7 @@ ngx_http_v2_filter_cleanup(void *data)
+     }
+ 
+     h2c->send_window += window;
++    h2c->send_queued -= window;
+ }
+ 
+ 
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index 658b1c0fce..18cd8bbfde 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -6,7 +6,10 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI:append = " file://CVE-2026-28755.patch"
+SRC_URI:append = " \
+                  file://CVE-2026-28755.patch \
+                  file://CVE-2026-123007.patch \
+                  "
 
 SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"
 

-- 
2.43.0


