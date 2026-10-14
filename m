Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01B1CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9329.1791969948088461959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nYqG1s9Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2197257a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969947; x=1792574747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/VdodEsNNnjnstWKGhDoEepkaSl4cgdsipZu8OI7W4=;
        b=nYqG1s9Ysggzfu5hwiFX0awbf6vASM99c4qrPCTm6Uow592f05LMF1O4Cx01CVUl09
         O8rnoTcmw7ziBtmC4u4N2i8PeX95NgFc3K7WbfGkKfvAur92AbOr8MPCL5gS0orKNbUp
         3NOY4RviwwOi8cRjSmWejxFHdZNvKAVDSngbIH3wyFsfC+XmGa1WUeapeIKT6WRYBWqg
         BSO2D4LzSJy7ITD1oUpCbuoJadq99zg3Nn9pc3F10U1ewQAK90Q7Oy2h28zqTgkFiN/M
         FF0EbNx+4TUU9NnSMj0Lt/LA+wmHUEzPGLAd7PntKHhRpm6m9QXE4HQX99B4FAC2G/j3
         vhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969947; x=1792574747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/VdodEsNNnjnstWKGhDoEepkaSl4cgdsipZu8OI7W4=;
        b=GspeZK++J1TVjJOefaLZMJku3l35M0wshJbawHk2K3Srhp1HKe+ss9jhkQ6qZD6rcZ
         rsDpRZrdnsPANopdRxk/E6XXQOs2r6M/FRYhPkC4R/rNm/XgobhBT5+nt1us/KnPc+Yh
         oxnCLfQ1ej2iQe5MwSa6MIQbR4o+d2w8j1eju9P9TOvuTVpSsMEcNHWfP9J6TfQw73VA
         MfalebNtNNddPCNWd15Bo3q1+zjNIceL2ZTwGRu65ACvl9aaA1s7ZNWZXv3fQYi4o2sF
         +PmLlYkW1jgqektYQPmiwP4ZsahhMIsd+h/kj9bRAGNaiucG2wMT/H/1vXhDkXbpchAW
         84PA==
X-Gm-Message-State: AFq9FYKKmQPo736BWMFf3XVkeHiSpidt2b48ISVw1kME2Aef079ZYoFj
	B628Ze5MKssDIlmD4doiG6VIC69FRfFqXIHSvNgkhBw2kJtLYdE1U/cEatInMg==
X-Gm-Gg: AYBFou0gRjrzBE5BFIf2+8oZUTcCw7BzZFeY+VJp3tlu7ceB5qhJir1lR1SMDvPEWx0
	7fwZnvIA4NeS07Mi9TKqVG7Mn/LK1r95LbeCmtSacVKxvEPXsoboypGf7cW0DYRlVqsD0OhQgDq
	XFlAWMi76YRvIv+DpXxw2GKdWI9yQ0ki9/Dwamcb5r9uwYatJwXIfRDvLpwLOlBy7ZC8DL3aK7x
	QTdZUArla5JsouxTvbtN9Qp4OGLqbw3fmthgMj9ndAwly9nT6xqmXmIh2tfI0KUrn0dZV5cs+73
	QD7s17p1y364pXuwtWdpTZTgmw30jG/iKo8kOgvVY2SIyg0mHbBc4RcRxT2cRW3hUe2ncZoilon
	OFaU6qV2qsNOQOuk98B63XZSfAobaEpOs+MvFdF26frX/65T+1vQbL46gUiPrqgQURZaZu7t0Ai
	co+Kxv8+B9zJbutno9So3UU0A0furEVtotyUaS09gWF7ALHgK3wDvyW7uT3dx3xTLsUQmgvasbb
	M9jHSpaZtTvx8wAqkF7zC9bEUuplWsumEzTB0c=
X-Received: by 2002:a05:6300:83:b0:3de:80a3:cc30 with SMTP id adf61e73a8af0-3e16bd7e8f6mr13032142637.19.1791969947197;
        Wed, 14 Oct 2026 02:25:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/17] imagemagick: upgrade 7.1.2-32 -> 7.1.2-33
Date: Wed, 14 Oct 2026 22:25:06 +1300
Message-ID: <20261014092514.454505-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130878

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-32.bb => imagemagick_7.1.2-33.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-32.bb => imagemagick_7.1.2-33.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb
index 818a4e8520..694741704a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-33.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "ad98b244c995d2e3051757fa3b7855f45b550d24"
+SRCREV = "211e5b975a0019a88dcef5f84c1193f46738d815"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

