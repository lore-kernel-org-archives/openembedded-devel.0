Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C75FC617D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 11:53:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62354.1767614029952806253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 03:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAgnGZ/p;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so6663443f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767614028; x=1768218828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vO7mfVWRiDel890QlnvJD0sNzI/CJ6MWK/TJXoo9k0Q=;
        b=DAgnGZ/pfR43sF0dii5Qo3L5Q9ghQcfGd7Egbu2ifLq5Fz+TYlu/U7e2yRKLoXhhdZ
         MBBuLYepLPdx6g1NUr+C2IYvuYeu5ibbO+FORuog/2LYmjdNZiOgg2k6Y9vANM3osevl
         cu/U0jQrGqE9lqAqEULOXyagS3ZGlwaNFWntmaPlRMFKoj60t2UHO62Aytzm6JX/O36K
         aanlpxaZJqI9ZonATA/Stzev2EFY7vPYPgeR8WAAJBbBNJKNivrkEL9/Bettg6EOCchc
         Izh3SNgy1q7Mhdq+4/F9asU+0QqNEjQFCr1m2CRZbAuKYHttufnm4QPi1Q1S66X5hZAT
         7/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614028; x=1768218828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO7mfVWRiDel890QlnvJD0sNzI/CJ6MWK/TJXoo9k0Q=;
        b=c3kn0rA31+ikm8UJb8wVpTtgiN9DHSSii1VewbW/P6/fsZrssYRWc9+L+MA0oQ54Ay
         qLqs5DkkNnMoeoGDsDqX8DSccaJ3cYcFwu0WBo8zLFDdbQhF+iHFTmGJoSN4BOeQtZHL
         2QuUfLwckAX9IjoFLLqCoGRAkSTMqMgAUSosJiS/TpHKbn0Ckpz2yVatKgDjOLSc5MCd
         ii6ap9W7dinM6BB00RSWd/9LbaoXW/blw41YIKCUhDPOL1Cmanrn9wr4+cgD6G4Rv4zu
         +fmUW4DNU96ypPqT9z1Hgxg1l4RZWFBlj+cR+audyIRJGMboXz1Yoomv7kQ3Y4aUdPZb
         oPTA==
X-Gm-Message-State: AOJu0Ywik2UmKyj7j1vDBgAMBz9Ewe0Fgtg27NH+JySAPtS7QO97GQt1
	Dt2dpAT6vaMI4v6hADQ9wjB5gQ/chB+K9bXdoxQQBwQXjGX+P5VO1cRLh38t/Q==
X-Gm-Gg: AY/fxX4nceGaQR5y38F4MFDVanITJrYENS1agKsJKO7UIzGhPHYPeFAzIQ5/1rfRwZ/
	PO7m1Bsq4k4KhB/xoIKQb54Wy+uAc7iDPme0m8EC2fE1V39pVx08TZL0H/wiU04AWi5OorHnxOo
	KI95v2e/TkNEya/lSMaT4gRSVDwlj9w5WaFAIl4R45f+FH8S8omecNOZeD9rZC++dal8yXHzwPy
	LIs4NdBXmdjLAAx95opoUDLYRP/4hrOkEQbmDUd6YKh3vFoILFxf9fDScoKIDd2wf7A3bXvNhOW
	8ByGkThugpPBfnD4KXzNH3wH4inRaumzemrSVtyqiYhw2OaKD4qGCvaD5ivLBAOqpxQ7FgHSp15
	Wz4VlZcp5gp8eMCw2pgUKuuJb3YKZyS84fj/Z67bLdqdU9LaJnb0aq4F0fK83j/OgTwq9yXbdF+
	3MZNF4Vzg+
X-Google-Smtp-Source: AGHT+IFlUroO0xOiY0K63VL6C9P1p8a0lBDxTzzkXUP8WOyxPPCtEmQp7XLrvMniKo8icQfPBgC+ww==
X-Received: by 2002:a05:6000:24c4:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-4324e4c9d45mr75144520f8f.15.1767614027910;
        Mon, 05 Jan 2026 03:53:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm99300617f8f.40.2026.01.05.03.53.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:53:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] imagemagick: upgrade 7.1.2-11 -> 7.1.2-12
Date: Mon,  5 Jan 2026 12:53:42 +0100
Message-ID: <20260105115346.3385811-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 11:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123152

Contains fix for CVE-2025-69204

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-11.bb => imagemagick_7.1.2-12.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-11.bb => imagemagick_7.1.2-12.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
index ce474c96de..26c19bf986 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
@@ -17,8 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "578d60d1bf77be54b16ef2673d507932885570dd"
-
+SRCREV = "bdd4fa561d7bf4c6afd40ee9c89e9f9e82b6e88b"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

