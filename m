Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD5C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5274.1785589962019589592
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=odhk1Qla;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84847482584so1243121b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589961; x=1786194761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQE2Czgo/3cqOiX6O/1Ue2tuIuf1m5CpREfOFYlLYfM=;
        b=odhk1QlaBx8qr8DTHrpttjlCFqyBFHpsnVmXij7chf7d+eOXsf1AhkzzqAHZ1+QOXI
         1cKs45ZPaygSiCDQyODFcDz25QaeZ2baduZH1uTTOv1CssP8V8cKfB1iZeyJ3RrKrxK1
         omcYa/Agq9vzZbE4DZpM5TYQcpZKtSWCYKAEAu0deK6d7u0YBah2Nr2aUVsIIg5bEiI1
         KzXt26cAgZ9qc9WCRhCRhnMkI7nORcXR1K+4R0fwf2D6d5o0XaEovQeQrXIxKu7ahzjA
         RUFN2KC3CwFq9t2zltH60OTlWHuKE6//DaSXBQODgwAuvHNe4d8KLQMIWpD39QWEgfrf
         iNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589961; x=1786194761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQE2Czgo/3cqOiX6O/1Ue2tuIuf1m5CpREfOFYlLYfM=;
        b=WOmnpdQi6NjsHHQ0i0EXSYxWhOZ4yXy+iiETvCl77Zflfxhjk8QmAHUor5Ja7pK1Sb
         0GqEyJ0nzXJnVVsdiuSOj3YgjvSPIHJxAl13yAAoyIcVkiP3MveDxsdFXsE7tbzrzOEn
         TuYxOpjTGgXQ1NlnVLLVo8ZVqjTaK20oVW4vUAkNPOMXudX5gxOI0zgMq6od5qfvoZQx
         Apv+9anXEeZsILoIWOGf4NQ42bgJ5FmLB/Qz+7G4ho5hq9BrZJ4jknQLlubsrEGyqbdW
         CHa79Mt8Q8mz1/WDEHGr9g/P8lde6IuKx5J4B86wi/A1oQC92tBKaU6+AflGdM6bd96M
         RRkg==
X-Gm-Message-State: AOJu0YwyWZGCTefR/YuRVVyYiY71b50Yjd2rsW2D/S6HYV3bId/5jqmy
	qbKvH22u+DDlFWtWWjfBCAfNiPfyz1bEdrZ5fIrzOjvlb5kDF+zdzssArQj2/73o
X-Gm-Gg: AR+sD10LXifZoh5NbL139uYfmSZmhWi6zcXnQ97JLMHHh09SYzksOHZTWIQiAaYRn6V
	Ah6x262PDf8F8T8Ez66vGGr6wG8oD+Rviqqqw6CAvmwuKvPJa0i0ZRBWt/GpBCohfkR0zcjYrTo
	wHvttjjAY6b88iu92aWCSG/h8OYZycsVvWP9YJuqcJ0AnWBGYvul6It/4qFmF34jF+KhFvJV3Gr
	qPdB5LPFVR8wgF7XccWB+mvb8IWKqDUpD22ovzZ268uJPeqPF3g9R/w3/tMmHtN2NX9gCwUM8Hs
	mWHEIdAI7U6Y/kvvLw2wSGVP20ov85JuTdqnPx4YJ+BomwciqhK0aH16CFuR51kS5H8AO0MyI8C
	P9CbNCB4BkS5F6yZUNgGL0K8lOP34PiZ+hGkNZTfM2b278GYbjPBMvBOZsnBq6CmDehuUACT0yD
	b/LGgsKuOEAP5RxNT6BRu/OwSF8jP23sO8copyis95/r5aD6FbaBLklBBsifcdQe4wjwT/sk07R
	7xf19okP3w3YA==
X-Received: by 2002:a05:6a00:4b0d:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84ee4811a1fmr2693509b3a.7.1785589961236;
        Sat, 01 Aug 2026 06:12:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 19/20] libdvdread: upgrade 7.0.1 -> 7.1.1
Date: Sun,  2 Aug 2026 01:11:37 +1200
Message-ID: <20260801131138.3299410-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128613

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libdvdread/{libdvdread_7.0.1.bb => libdvdread_7.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libdvdread/{libdvdread_7.0.1.bb => libdvdread_7.1.1.bb} (85%)

diff --git a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
similarity index 85%
rename from meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
rename to meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
index 0be61c2174..f57515f732 100644
--- a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407"
+SRC_URI[sha256sum] = "a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9"
 
 inherit meson lib_package binconfig pkgconfig manpages
 

