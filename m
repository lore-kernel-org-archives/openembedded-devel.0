Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E85E9DE4F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127053.1775718610284794894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qTGAY/UD;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cebbdab08so493576b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718609; x=1776323409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zvRK2L77iok/pCkfjGfuOusCt5Ua4baQaFE+K/6yTw=;
        b=qTGAY/UDUTzPxctGh7/w5LavejNsx5Dmx7littlgh7NNhwV2D6FXj0aB7HULuCxvh5
         dkzEPp+zxgs1H6jKR8LxeM62D6w0PSTv0SGkg021Wmv/E9MScjyiPU8iUJtdAY/nYv/G
         YBqgS3ZjsGif9guxOWTB9Egg6+Y8JmKUO+WeDWaRdt7axLdtgjXcTS+8R44veIgja3OK
         j3EGw12MK88UdPjFC+GP0JQXcF19rgWXole2C42EffTqcMNNKhAKJE3jApYFeiZVKyTt
         cJl1s01ENwI+IfBTuP2BOtGavvjx7Fto4UbqV6i+Sg+y4A6vv4d0igKcKI4om4u/QK57
         W2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718609; x=1776323409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zvRK2L77iok/pCkfjGfuOusCt5Ua4baQaFE+K/6yTw=;
        b=al8duNXk9XV2lj6lfaQH+XtB0vmDl1EsgUYVmfnxMwK5sqOdHpsP/7ksobHjFP3Bzk
         XSanJMyXEqG32VgY1xYCjDLksZVQnpW79fFnwea0SEY39tVTBd5PD91BD12pYYdCLhIW
         vveJypVTTY+K2kZs6upoFYW9QfLDRaQ52MlXelVjvnt4tF6ocwB/r36km09UaCPi4MFk
         TGAXK1RANKeWJAwFyJ7gBnMNuGFjFk0G864ewgkMPh3fMdqbu3a4Xx3cLrZZoxOBf+t0
         Jjo3ZtkJoLotXeJ2qw8nooIzv8gEAgR0hBeJhSKyVWhre01RBzPIEp1vIFfc4GTqDN61
         cOng==
X-Gm-Message-State: AOJu0YxkhiIf7NIlYTWPBa9VxIkcMz6OsRqDN5Y7uIaFlxiAB6vFad/P
	tKOcpBm7S4lvJAiuy2jgYGK2AIr/DocCaYlxFyTxNx8DVEeim4BqOg5v4rGXSA==
X-Gm-Gg: AeBDieuErGA3YyXVV7J7YIFhkdVcalPBJ8jJAAo/kbJRyAZf0Bv18xgepggHUNHg0Kf
	irgjE3QwKMSgg2Xp5JLijNBYSSddpQ+5ymE74ZeR20GZgr1QTUBz5Mf6dFtHArypMkrw/Y5SlwP
	/9YMh4EHxheRydZ+hA7DZhL2mfNl83DU2hFG/ieAIDhIcixa43iGkxqpKuwhRV7zUt/8kVlpqFD
	eVfRcITRRVeO5n8oL2McW/P3Nt8WPyp6oEU5gEwxTahJj+NVuk48TsR7kgHu73oOExwmIgEYZ9w
	wE6400CszN2L/PpOApE+hTHHyoLEjwGJvyago50YzRpaCNU6vfrKc0TFvUPjXHGTBpywtD10bWw
	RL6gjqPEHp4EfP22dLVf47of5h5M5C3imLi4o4YIDQYeD5fItAPWKzn+RunMflnGGvNwN3ZVRVI
	hnHlWj4k2RqYWRek1gqstQMHB4o85/pXXNbXQ=
X-Received: by 2002:a05:6a00:23d5:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-82dd8aca852mr2483348b3a.34.1775718609488;
        Thu, 09 Apr 2026 00:10:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 17/22] freerdp3: fix CVE-2026-31806
Date: Thu,  9 Apr 2026 19:09:14 +1200
Message-ID: <20260409070919.3968586-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126139

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-31806

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-31806.patch     | 36 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch
new file mode 100644
index 0000000000..112a924d83
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch
@@ -0,0 +1,36 @@
+From 9bf461ad116d081134adf37da9d6faa9459d1ad6 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Mon, 9 Mar 2026 08:11:19 +0100
+Subject: [PATCH] [codec,nsc] limit copy area in nsc_process_message
+
+the rectangle decoded might not fit into the destination buffer. Limit
+width and height of the area to copy to the one fitting.
+
+CVE: CVE-2026-31806
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/83d9aedea278a74af3e490ff5eeb889c016dbb2b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/nsc.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/nsc.c b/libfreerdp/codec/nsc.c
+index c2d92e48c..1cee9918d 100644
+--- a/libfreerdp/codec/nsc.c
++++ b/libfreerdp/codec/nsc.c
+@@ -494,7 +494,15 @@ BOOL nsc_process_message(NSC_CONTEXT* context, UINT16 bpp, UINT32 width, UINT32
+ 			return FALSE;
+ 	}
+ 
+-	if (!freerdp_image_copy(pDstData, DstFormat, nDstStride, nXDst, nYDst, width, height,
++	uint32_t cwidth = width;
++	if (1ull * nXDst + width > nWidth)
++		cwidth = nWidth - nXDst;
++
++	uint32_t cheight = height;
++	if (1ull * nYDst + height > nHeight)
++		cheight = nHeight - nYDst;
++
++	if (!freerdp_image_copy(pDstData, DstFormat, nDstStride, nXDst, nYDst, cwidth, cheight,
+ 	                        context->BitmapData, PIXEL_FORMAT_BGRA32, 0, 0, 0, NULL, flip))
+ 		return FALSE;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 74f80ee948..66cc3305e8 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-29774.patch \
            file://CVE-2026-29775.patch \
            file://CVE-2026-29776.patch \
+           file://CVE-2026-31806.patch \
            "
 
 S = "${WORKDIR}/git"

