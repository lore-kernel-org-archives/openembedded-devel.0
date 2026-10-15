Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D897CC6B2D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29960.1792027689301234172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZUlMFEjO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27511365ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027689; x=1792632489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8Iia1BOLpNqYSiEkka5Ve7BhIf9XUifgxvn1JG1yHM=;
        b=ZUlMFEjOP4R7xaA9NDzEXeo6LLrWW2F+uWfod58KkmSoaC8/mXEQZD3fVe2xF5Koxv
         fLHf4sJaiZpJdrTxwrihCjJsu4126/2JKd/ungif/25uS/u+8C0wIDbqjC+7E66G8vt4
         ri0ivNDt53KnwbG3x/mq03eWq3+O4vLgd29r6m3GHNHx+Xv9fbj7Lxfyjt+is3NVY/Ah
         MszR6Ua+eAbEGmBrHUoBR29Dwp0C3Bmwxz1wrSwjdP82xeB1J05arAyTT+6ao9kh/5hY
         glEl/eZwpupgvrkvpvthy2FRI1J9NeYeQxeo20tM7FWNbO9SER2hLg9LgDHsQsIgW70F
         BdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027689; x=1792632489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8Iia1BOLpNqYSiEkka5Ve7BhIf9XUifgxvn1JG1yHM=;
        b=kGaKzrik2kgZUhHzAx5d4rsqzIcZNJJxk0X2E4vY/IcK9l+hpjbi6YLTp8QnkVRe8C
         uqUZPESPvfnOu5evBZiFXOqGpImxdEQFCtN3GFZTRtQGCTxHjEKcn08sa/w8zzTPu0k7
         OVEm9L6Tw5zcsJSwm6VJjd1P3MJa+lgNZmGvV/HHfhiFaX7G8ieo9bkhMSWLmNAVP9Hb
         pFmTw67Cqi9MRF6YqamZKaHlydHV9inW7f8Lq3eFmyROxlht765u1DkSC79uA48O7Ka6
         31Mhs87p3PO96FmFUkL/dn0/jDYj4UZvb4siplzAiq5UMDb/tyVOvhcDHz9nguAAsJu3
         Fzag==
X-Gm-Message-State: AFq9FYI1ksyqWH+1WCx79fLBfBZ94CcvEURcDdeFCqW/NmGuIG5YOlhH
	cOnCumqk+Gnp+LwcPzYFGuBGFVrcB5qZE/t3OG9YM3NXpNj+YmHbXwmq2FSDCw==
X-Gm-Gg: AYBFou1YY9p9m2PUsyhWjCtbVGgpR7usSCMYto4De4ROjdXmPhFrNvZQZQ/k1C9Two9
	RY3swUrean0hqdpQ2i8PEpIAJfVV23Gd3NO7ULLQDGWEGm46pqyKvNjnyQ0AYOTJThyS70tQEeh
	yCBqQdzQ8KmjSU6kVUMlLP2Hkfl/fYAwErLe6PTBvJYU8G4Mn+Ljldz86QP3O8aWEp8MdIJ4sHV
	1/RTpJuOyJB3N2dWNW1qGf04KKfmlce+5yfwM2F8lAKtvtWMMpSljcSGx0b2wUtvomMT3W9Plpu
	E+P9Blt+i/RS0pGw6hcRCGMtTmOQKfmmMO/96KnYtN3eYKKfz1b2rstUa0VPngk69fnzhdTN8RM
	gjAH+DYa1yYVT6drtM+kSMODqJoLksc3wIlB0lKTgv344hZipHJPMQ6YeYg3LVTT/scWsR/fA/e
	NIHQ5sLZGp4nzHZiQ/J6bga1OfMaYTy8RzHWR/EUUIVW5rHMMzAQgPxCoOGAe7jevdnRG6oLmZW
	ZqCoubVOoZUZyNmD7TaobmLH/4OcReIiIxG6DGQkn3KtGBrPA==
X-Received: by 2002:a17:902:f710:b0:2e9:3d65:22f2 with SMTP id d9443c01a7336-2e93d652861mr31791885ad.25.1792027688572;
        Wed, 14 Oct 2026 18:28:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:28:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/6] libheif: upgrade 1.23.5 -> 1.23.6
Date: Thu, 15 Oct 2026 14:27:50 +1300
Message-ID: <20261015012752.1650544-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130904

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/strukturag/libheif/releases/tag/v1.23.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/{libheif_1.23.5.bb => libheif_1.23.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.23.5.bb => libheif_1.23.6.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb
index 49802780c3..1bffe00fbc 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.5.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "413e2a87e6a70b3eccc3a3adc5801179dd2d9e00"
+SRCREV = "f81f28ac014b1c28dee483ac45b72c6b05bc421a"
 
 inherit cmake pkgconfig
 

