Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65573CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32797.1792042984978670830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bclW0Rdp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso11430645ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042984; x=1792647784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SypwQzOkwr9JGVLj6x2qF+QnK525gJNk2oB+kfnhCWQ=;
        b=bclW0RdpFKjwGjAj7iN7X15cKooM8mzXiVXBN3yMSP1JpYpGR+8JBPpOUINE2oqlYR
         LewTKpo4/OVkt+kj75f9YdGVJcFMllMzzlSN/b0jS5sLMs0OX/sc1h76zTekluHNGlEH
         HQCpuF/69b1TeEetU1GpvSW2lWadOd0pkJpSf49ikuOgIMdrbluDDtFWZ+25kiZraSMw
         tpJReCHwb+txiCe1wjI2dUfsghUuvA9i010ljbQQ4fCLji79x8t46PG3l0Fcgtg2JWgT
         MmJckqltgfkdIOFO+JiNGfbSdmCOdjaAnKgcfPXRRwH5j8LhvkWH40QUfh8w0bhF4BIP
         RL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042984; x=1792647784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SypwQzOkwr9JGVLj6x2qF+QnK525gJNk2oB+kfnhCWQ=;
        b=DMXQSTWYmOTfTsFGZwk7D0h1xl9axLZK9G4jt3K1gWdGuRNtSOuUlVncoNVha+ymHP
         r+Fzym1rQvaGJuWWWUm+mRAlHGz40DYV7BV0ukoQEH7iEQBbjCy+RzLN47AF2Kcdxkom
         4QwEee4tvw8G1nHKypafwciGeDz7eRQdXtKhs7XqQbI/lrxkrhTQxGORr2TKgEYgTQ71
         sQ89mV5Ch12VWvf6Yh+DzdxRmFzV+ldu08khbD3fe06nu1JFEMHYL9P6tCApVtG2CLhk
         5je+SRfwfZ1uOHBeV58H/A7PwwXLqfULSyhsqqKro7OnZ3rx1VcVWebsIByVCCbdb5cq
         tmfg==
X-Gm-Message-State: AFq9FYLESsq1a22tejAveEZCivElxkIen9u8oRF8r0A9uuLgIq0MGNzA
	YoPo5F4CqV+8FilErI5o99osz39ZDi5BSDzZoj9fkwBXRLgmKC8Xe156+xTkGQ==
X-Gm-Gg: AYBFou0JvvrS2kQH8dwRdJ+P8CSEkJ/CT0Sg55lNh4RLm++xntHLnirbBu7I9Jo5PXW
	DOL87obwv2/lAYCUcy/NbZ4NlBWxCVfl9debhnMp1I+TjWUZeG/H5K21Ufwq3rbAvdwNR/BZHwH
	DQY/X6o0RZQFCeSXRkMTXbiO39RytIphCRIHv8tEmXmzo/Sag5KzYTVwlsnnVolFcbHVpf/uMBY
	533xTNaoACYvq+YpOC2s0wMgFExiSIT+fd9/uHBiUL1UMcDD9UsK+ZPE1WVGqBqVj34rAXT4mR2
	DRAKDRm8krP/6oMiVITZ2NhDYlRLg9m6MDN2H6MLuPKtFFtnc3szxzKKVZ9QZ57Ou7nXDndxV7Q
	USEr7UrS+S559mg50QQN/26GXDShlHKOrZoaTSmnPLeA8g2a/KXZAp/ML2lzRtZu9b4R9APITj/
	wVmYIUVhhDFl8Zqh+SOq858cYkw5odZ8uzBlujOGh/U3pC0meMMyzKkz8Hj0/mVe0gbVSxrHfwT
	YqI4DOZoQ/A+1c5JBLJ6FE=
X-Received: by 2002:a17:903:298d:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2e9670fd389mr2048995ad.32.1792042984236;
        Wed, 14 Oct 2026 22:43:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/82] libwebsockets: patch CVE-2026-78161
Date: Thu, 15 Oct 2026 18:40:56 +1300
Message-ID: <9aeb9f56897ae3f18415491524e51511a1bec1d3.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130928

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-78161

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
index 11da4b299c..0b612c6f4f 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
     file://CVE-2026-10650.patch \
     file://CVE-2026-19773.patch \
+    file://CVE-2026-78161.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

