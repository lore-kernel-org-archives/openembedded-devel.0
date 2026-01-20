Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7636ED2ECF9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 06:48:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1279.1768891689240505315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 22:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PnpWbs+W;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3233103f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 22:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891688; x=1769496488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqQGVlaaLhgBnDSa2U8VizLIuUYwtt2gSuGVwWaTBGU=;
        b=PnpWbs+WBzDBTSRYteYkNTqi30E16OD1mzHv8WzQu5WmAKTaNj6lSN0tEDONW33sXH
         dH+THIhV+F03QM15TZnjrXDd+ycmMK/yGkrwziam+vDv64g2RWKbRsBK5dwz1SBxSuyo
         I92D88n8gr5EJfnob/K2MMg0InqXkficJ1eZbh8JHpLTNWDTs/OsTwbuP4ekgRU0DQ1V
         YB3otCBumbUBCmnTTEHdznxe5h0eKxR03uGKKj7+F0QIYUYh1/KciEoKsbapm3A10r2f
         Phpqj0c+pUWTBGmGeglwiTZ9JR1oAJKOcZ8R5/Fv7h+x7ZnS/lKrkWu3lfsqZDZ3ii3E
         ZrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891688; x=1769496488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqQGVlaaLhgBnDSa2U8VizLIuUYwtt2gSuGVwWaTBGU=;
        b=Ud+9kYeVswPUt58efbUM/OVt3D5tUEhS3knfTqZzmNGaR2i5nF/WapWrOeXzu67AJd
         zbPm4XI4K1dgrL7ikNwRybaFIGySdCrHTYvr9bowGUf8OQHBgAo/8l7qKwzXl6HNxEpk
         4yO/p/TG7d6KBQsoJqWAla7uGnFls5dJQ6aWRYNfQEHBxOWUWHEHmhF+qv0NSxgvcL5r
         TTT9NiO/xnl97bvyFvrJKaGmWrgeh+Ghd9U5e93FqC/TQATfLCBrDQspS2lKNolPkr2W
         H8NVLL382JCmarWPrtpd6jiv5QUZw7GArJwX7sHRUeckL7uJTQtwHT+LOzEWTLomz7sF
         S2mA==
X-Gm-Message-State: AOJu0Yx6rhdSq6Q2Ob9Qbf/5//B1AVH27DjM5cwqLOP9J2Q6Se293Gq+
	IFXdCuE4UdPGEB6yRa5XIP10XHXV6Jgi6OIAjyoPF/CAO3UHLlNv6htKya1psg==
X-Gm-Gg: AZuq6aJmUSRLzgJm4cZPEimKUh74c5ids+KjSlmsFrw7n00UU7SwKFqmqSOXTCaODIM
	ZARj6ZIvSN4X/OwQ7ZiB158FA6qFsqz+7N0Qcz7lh3RcOVGApuPKhGQbM4izW2peOmesyYl1ZLG
	vXqf80k5D+9v+/UtNfqs/s8Q1ht0f5aHswBhG2VLQ+EoSFGt4O2NJID2zuh1xllcdvUgyqLgozN
	LtI1sGcp1HJvwCxU0pECvMCdpTUp1y5Fd5CoRXnMS/OptJJz8GiCEiQ1ekdAmegDvgJBzdjO9sD
	VoXAns6r8EYesnREGB5mu3uj8HcWAGw47bCx7YNCwn3Z6y1+u2B1p8hZaYtwjAtFNUfM+YBjQEc
	3613sjTUW9WI2Mu2Cxt2JdvkQ8KCF5SMfidjKo927Gt3gGlAizaHjBzJnO4ZmAwLhFVoe1gS2tr
	GBtUfgVY8q
X-Received: by 2002:a05:6000:402a:b0:42f:b581:c69a with SMTP id ffacd0b85a97d-4358ff1c1f1mr1017589f8f.5.1768891687512;
        Mon, 19 Jan 2026 22:48:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm26469633f8f.38.2026.01.19.22.48.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:48:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] freerdp: patch CVE-2023-39350
Date: Tue, 20 Jan 2026 07:48:03 +0100
Message-ID: <20260120064803.831507-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120064803.831507-1-skandigraun@gmail.com>
References: <20260120064803.831507-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 06:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123658

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39350

Pick the patch that's mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-39350.patch      | 53 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch
new file mode 100644
index 0000000000..17a4aacb32
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch
@@ -0,0 +1,53 @@
+From 944994cb41d62ea893bd8bdaf436e97f42965de0 Mon Sep 17 00:00:00 2001
+From: Armin Novak <anovak@thincast.com>
+Date: Sat, 5 Aug 2023 08:57:28 +0200
+Subject: [PATCH] check indices are within range
+
+reported by @pwn2carr
+
+CVE: CVE-2023-39350
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/e204fc8be5a372626b13f66daf2abafe71dbc2dc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/rfx.c | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
+index 8c65e7508..998a7aa56 100644
+--- a/libfreerdp/codec/rfx.c
++++ b/libfreerdp/codec/rfx.c
+@@ -932,10 +932,33 @@ static BOOL rfx_process_message_tileset(RFX_CONTEXT* context, RFX_MESSAGE* messa
+ 			rc = FALSE;
+ 			break;
+ 		}
+-
+ 		Stream_Read_UINT8(&sub, tile->quantIdxY);  /* quantIdxY (1 byte) */
+ 		Stream_Read_UINT8(&sub, tile->quantIdxCb); /* quantIdxCb (1 byte) */
+ 		Stream_Read_UINT8(&sub, tile->quantIdxCr); /* quantIdxCr (1 byte) */
++		if (tile->quantIdxY >= context->numQuant)
++		{
++			WLog_Print(context->priv->log, WLOG_ERROR,
++				   "quantIdxY %" PRIu8 " >= numQuant %" PRIu8, tile->quantIdxY,
++				   context->numQuant);
++			rc = FALSE;
++			break;
++		}
++		if (tile->quantIdxCb >= context->numQuant)
++		{
++			WLog_Print(context->priv->log, WLOG_ERROR,
++				   "quantIdxCb %" PRIu8 " >= numQuant %" PRIu8, tile->quantIdxCb,
++				   context->numQuant);
++			rc = FALSE;
++			break;
++		}
++		if (tile->quantIdxCr >= context->numQuant)
++		{
++			WLog_Print(context->priv->log, WLOG_ERROR,
++				   "quantIdxCr %" PRIu8 " >= numQuant %" PRIu8, tile->quantIdxCr,
++				    context->numQuant);
++			rc = FALSE;
++			break;
++		}
+ 		Stream_Read_UINT16(&sub, tile->xIdx);      /* xIdx (2 bytes) */
+ 		Stream_Read_UINT16(&sub, tile->yIdx);      /* yIdx (2 bytes) */
+ 		Stream_Read_UINT16(&sub, tile->YLen);      /* YLen (2 bytes) */
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 7cadae3d45..a104f33e52 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-24883.patch \
            file://CVE-2022-39282.patch \
            file://CVE-2022-39320.patch \
+           file://CVE-2023-39350.patch \
            "
 
 S = "${WORKDIR}/git"

