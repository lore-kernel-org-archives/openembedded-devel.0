Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204D0CA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 18:55:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2094.1791485701616164286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 11:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ElxLVrJJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202610081854585f52e2ae740002073c-ekvtvn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610081854585f52e2ae740002073c
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 08 Oct 2026 20:54:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0tUD1F6LObaVapb9Ula7tFp+PPXmbT00HCtjAo1SG1I=;
 b=ElxLVrJJhz1fffrStFZTEviamuDaLinC5zwV5AChwvhdDMNi4PL2luWiAmynT/ty/DBwI4
 8zGsSCUAQF9OvbwWRZGc1JOGcm+kWsdKs2xmAZVMdFP0HZBlKkmkC74l2/gq4QQ5BEwgVN/O
 cifFOtncBppwv1tGH/YRgwg6GF3Xam8WirLA6/CPDm0vJn9Y/yChxbmOe+wJG7f52mLj9W8e
 aflybPeOR6sNHf/RgpMlkByN8t6Iku13+ixlcaJtS/uh+WV+dEkJgie+BQaHrJtuXDke2RCi
 Bh/z56deFwY7qVACov5SW1Al4pd+3ElGJ1YmeVL4i0WNbZNu+nC6cADA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] libwebsockets: patch CVE-2026-78161
Date: Thu,  8 Oct 2026 20:54:41 +0200
Message-ID: <20261008185441.999869-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130674

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-78161

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-78161.patch        | 45 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch
new file mode 100644
index 0000000000..ab978811d8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch
@@ -0,0 +1,45 @@
+From 1d44554a1bb262db63ff4e240152a9deecd99054 Mon Sep 17 00:00:00 2001
+From: Biniam F Demissie <biniamfd@gmail.com>
+Date: Mon, 6 Jul 2026 04:33:45 +0100
+Subject: [PATCH] cbor: overflow
+
+CVE: CVE-2026-78161
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/1d44554a1bb262db63ff4e240152a9deecd99054]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/misc/lecp.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/lib/misc/lecp.c b/lib/misc/lecp.c
+index 44a7ac667..13e6ba476 100644
+--- a/lib/misc/lecp.c
++++ b/lib/misc/lecp.c
+@@ -325,11 +325,11 @@ report_raw_cbor(struct lecp_ctx *ctx)
+ 	if (!ctx->cbor_pos)
+ 		return 0;
+ 
++	ctx->cbor_pos = 0;                /* reset BEFORE callback */
++
+ 	if (pst->cb(ctx, LECPCB_LITERAL_CBOR))
+ 		return 1;
+ 
+-	ctx->cbor_pos = 0;
+-
+ 	return 0;
+ }
+ 
+@@ -388,10 +388,11 @@ lecp_parse(struct lecp_ctx *ctx, const uint8_t *cbor, size_t len)
+ 		 */
+ 
+ 		if (ctx->literal_cbor_report) {
++			if (ctx->cbor_pos >= sizeof(ctx->cbor)) {
++				if (report_raw_cbor(ctx))
++					goto reject_callback;
++			}
+ 			ctx->cbor[ctx->cbor_pos++] = c;
+-			if (ctx->cbor_pos == sizeof(ctx->cbor) &&
+-			    report_raw_cbor(ctx))
+-				goto reject_callback;
+ 		}
+ 
+ 		switch (st->s) {
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 6a3d0b4033..f0cc181ab7 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
     file://CVE-2026-10650.patch \
     file://CVE-2026-19773.patch \
+    file://CVE-2026-78161.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

