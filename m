Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548E8D262B0
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:04:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6847.1768979083238871061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JKBGrVyQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso58824805e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979081; x=1769583881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IY3Gqq0PwWpWMs7fAZG1AdwdRerqjKUnPpiUkIROOg=;
        b=JKBGrVyQdypB7NNQhcNqUpK/1ZoYHdSxHooYgjm9oQnpMx1BrCwOMPP44PPU4rKBIF
         L66isWJK+LQQTMuaMp5Ngbj80XS/awhWWZ3LvgqoqnICmlvQtwUzEL7s736+LrRxgjoB
         c7/F3s99pQAKt1iKqmrQXMZuyFV9EaJUszVaDDnwnpWc067IPY3WNgXA8Z1DZ6gYZosC
         GaBUSHElf17WgSnBlqDiBZBOnadN8usuRwQ8L/es1eEG1+a3t15byHFjjJgIx2n8ghfY
         e1F557DP9TslFUcbWLpP/zfTY7XCVClvxU64LWy+t2LyYu82m57oAJ1WnI7VYuJ5JKcy
         Fmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979081; x=1769583881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5IY3Gqq0PwWpWMs7fAZG1AdwdRerqjKUnPpiUkIROOg=;
        b=kv/puMX5oG84fH/LtD5Qnqcklvavgq4cofxtZC+EF/DxukfetcgLjMMKWhNpV5BrIT
         B8XhSPBcRdI/KYKH9OcG4KHppzn1Yajf1ha5TP+/UCYLZGmcpAdCEpVxZVraSTtPEC8C
         QX+/9ZZKR5MwlUyf5OVx5QqtwNuvUR4t14k9lqHTJttOqc7o7xBA06X5XcJ32fQR+6eT
         fE0sdRqWWpVawdIB7nEsoIHmYRyAtwhvlf6h7p5RlVMkwueI22ItTsHyDBklUj+ry5Bh
         TgH6h5y6fN6F4J+Ad/5lzm6/Nwu0cAj/ud3945yZ4E0r0ZCGYbfVIVvwGlkhWsbI2Fy/
         8nxg==
X-Gm-Message-State: AOJu0YxvLKB7xVte7UBKQSjUbzNdRcKk+6MVDeRzDmbVSi5hmJphSrum
	A+wqXkgJ3Ndb2H3GIxLKDqmW2kCG7duApe2op7nKBX1jQk6ih6opNZz1ShLgNg==
X-Gm-Gg: AZuq6aJB4/UItFWJOQKePSzD8dbhDo0VSuGT7hVwENVq2ttpK0JFsFXnuRujDgrT68c
	H1iKrO8e8YPaRlg8bzUzNXcq65WL1xc9AYNifwLQL8mGuCfDZX3sOLg+gvcFSnZKthqeI8F8xeX
	cwoD2/WTokvNfcK3CdD9knF/CVyBtnnJJXxmdIbJhnFBDxsN5A/JqkqMzhwR4C3rbnLi11M8PEa
	koA445SxgJFLfMete56zbj9MA6u0Y42LAHBbRShHG8iZzv+84Er7Ar3+wiOck6HgpLOuPmiIWKY
	ACAaomFnkxWmK0Cj+VjKEbrKMAxq038Ri0z1e7+ECzkLXkO1d4Cw3GEIA/kqPpkiTjWvCG9StTz
	ks5uLFyCKECkD2L+kj0CMq3nAtFyDpOMLzSJhJsjQu2g04Ro9LMvpBK76XtrOKP/OzoRiStsviW
	2rgSwv5Y5e
X-Received: by 2002:a05:600c:458f:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-4801eabee40mr202497075e9.11.1768979081399;
        Tue, 20 Jan 2026 23:04:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm34106880f8f.21.2026.01.20.23.04.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:04:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] freerdp: patch CVE-2023-39353
Date: Wed, 21 Jan 2026 08:04:37 +0100
Message-ID: <20260121070439.1632875-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121070439.1632875-1-skandigraun@gmail.com>
References: <20260121070439.1632875-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 07:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123686

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39353

Pick the patch that was identified[1] by Debian as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-39353
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-39353.patch      | 53 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39353.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39353.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39353.patch
new file mode 100644
index 0000000000..51ac065687
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39353.patch
@@ -0,0 +1,53 @@
+From 944994cb41d62ea893bd8bdaf436e97f42965de0 Mon Sep 17 00:00:00 2001
+From: Armin Novak <anovak@thincast.com>
+Date: Sat, 5 Aug 2023 08:57:28 +0200
+Subject: [PATCH] check indices are within range
+
+reported by pwn2carr
+
+CVE: CVE-2023-39353
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
index 052e77932e..dd944e450d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-39350.patch \
            file://CVE-2023-39351.patch \
            file://CVE-2023-39352.patch \
+           file://CVE-2023-39353.patch \
            "
 
 S = "${WORKDIR}/git"

