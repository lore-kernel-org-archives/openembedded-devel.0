Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBCBCAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:47 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.11303.1758716925907464730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljOh05UP;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so9724845a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716924; x=1759321724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLVkc/iOxrn64G+n26KDoC3978cfrTmTYh82V8YTy8o=;
        b=ljOh05UPXNmraUWbbO6SJp2VHjchA+7+KWGxFcqSU2zcGDy8vUK1Ken5SNahcBDlIv
         DggKLoFeaZRCvWS1FV1lZ4JWYNZ1F12UQClSdeJYeY4/fxqUDyU1wdNzKVxuLSKFiIZu
         gwOjOEHA9E2ro/x26eJP8t0cjckY7//RvwJ2oGrq7M4WgvHEzRrNCZARDg3b5V4QIEj0
         UZPoeVR3LuwZz0itk/0aGHB1EKAf0pP7k9mjGTQtXluX8Mwvq64Lxt5vmffNIzRQZocM
         YKBogbejH00uQo59ZOhYMt67CncCIfRs9+se6RIA5iwLVD4iTNuodhMbXdhDk14Vxiyv
         CozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716924; x=1759321724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLVkc/iOxrn64G+n26KDoC3978cfrTmTYh82V8YTy8o=;
        b=uzOHTJD7l5VOBRNUO3VBHS3QO4EbRVkEtcQuCUy8Q79f0HsCkwfdyDBJAt3GQMus7i
         ph2zw65+tyTXsMwbxlrBcBm0/2ibntNJ/DajaW2+afXS6fZdNwMI7BMvlByPjkYZmi1w
         cxrvOQPvKUbHNKKLqRImzzIo7wgz5oRVFRfWGsP0/Cn5kpKkg5lh2JeHAvG+lg5q/ePF
         eL4fLYgyU3xeFrbvZB/5SU4Xa1Rph+CoyRlYH6jxZU04pKvD7+Qgyp9TjnBdh7JEOV94
         Mmn/yhStcLieGwETktB69bLayGOsTUV7fc6K+oJRcc0zItarBHChVuMzFuQk1iD5310Z
         3uQQ==
X-Gm-Message-State: AOJu0Ywn9wKPGTmNklstC5VN9g6EwmiR/2dlvSwGaBu3MyjhR6FRciLz
	M9K3ZOuCZksbXXsDFsBBSFFH/nkVO/Pu6LALUKHEp2GQQ5LD71kZfGjp+BfzCg==
X-Gm-Gg: ASbGncutp9xPjRnTjG0avC8N5TjhCkQ1e2yxvtlFnd+6H0qQs9R4gXkxWwmJaRVV4Wu
	RqTCiSpcNJPPESUHEGnIEQvTuzf0jVotD/9nKTDDKvTp+Qr8EtTUSPbkBMCJmEKoIwTrpmcK9GL
	m/s7+Kg7zXglTiR7PnM4wiul59JSOSEa48IVeCuzuavGwm/dNqcj8dOv047JfVK23ad+Yr3P8Na
	2FPsrHZoQxzp7V51bOeRuNoltwOy8lp4sKgE6RDvo83NBjFi+kn58NTfnuxMn69dZx5Nd9ip7ap
	6OVvDYhCEr8rkQuopmXU7ozU8S1zimQxsG8UUZZWPFKsB/IXLMlPnduJkSYKcTexVY+6z0UWEd3
	E2CMnGzS9bym2p0G0qgDH4ve2x3O42bY=
X-Google-Smtp-Source: AGHT+IH5TM/DDWyZBJsIlbtzmwu1aWqLExIpXLXBBxMcB9PVD701KGLP3/uYdpLFP+SR5+u8Mo3V6g==
X-Received: by 2002:a05:6402:40c2:b0:631:f57c:c32d with SMTP id 4fb4d7f45d1cf-63466e7957amr5675192a12.0.1758716924175;
        Wed, 24 Sep 2025 05:28:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 03/20] gnome-calculator: upgrade 42.0 -> 42.2
Date: Wed, 24 Sep 2025 14:28:21 +0200
Message-ID: <20250924122839.4184719-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119806

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
 * Updated translations
 * Fixed incorrect history with bits toggling #281
 * Fixed crash when typing in variable popover #282
 * Fixed incorrect libxml usage #283

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d9d207bb44da6dc2c33b8880e46d5f501b1e2c16)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
index 80cc38c615..31513a5f61 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
@@ -28,7 +28,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "a535a14ebea58e691a4b5a085256aed060a2c3f07384ac3a3d01832332a27e4a"
+SRC_URI[archive.sha256sum] = "33dab1bca43658d66520958b0f674cb0ad3185cfd30c12e459e7f69481c5c6a0"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \

