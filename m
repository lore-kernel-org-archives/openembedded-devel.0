Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B3FFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18188.1777549662915759553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hS5Cqq9e;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so466357a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549662; x=1778154462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY0yUNopjYJ8npE8zQ2TtkfzG5wP1G+ogfM1RjBt7TI=;
        b=hS5Cqq9eOFjIvwQnTFkh/ZEB0HSQ3UaQApdzugbCGJASnCAhRNmDPGmA4XdWvHqgiu
         gKV58XYbI3GIMn3IEiZJjGasJeiDPnD72ZAM8kyml805OsVVN69glUbQc9Mn62tyqlSm
         LOjp4ZFVicqwGuqI533ci4+OPhSvAs/wbYdj+eDbefgWDQ9tY7Y+i4G5Yqnq39j7fe6p
         dHpFPi3J9HIiFbZspiyBphf3HXDwkDVPxOTx+Og1DJS43ZaTuxUkYMYWKvtUR31FZVKi
         9ysiYdCsIrnMx+KllxdXGBpv/H0y9hfoZH53YK+bVYuFPfidR8wCYNTgS18dlA6EY09A
         GcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549662; x=1778154462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dY0yUNopjYJ8npE8zQ2TtkfzG5wP1G+ogfM1RjBt7TI=;
        b=fnHwbtu8yeCahs92fUboWSzGAblcTMfalc7NgAsY/DobtF/hyS2VbGJXlW3IDGyUFN
         ALNil4Qov+UWxEEOkSxb/lMokGWNt+sTOC4+Po+DK129Bb6S7a0wuEW/1dQP+AaJnIeu
         nL1EItPCQTBM3u6VHNfz7Eg8BkeGWUc99fRczus/looIZr3B1eyj+NIYx/Mdi8hpHThL
         p0VxECQLDf+9Amz1DvvFa+UPxMnSxMzzlGr2rIHh1/EWfpD+vitqCXDensqcpo6Cs0Uo
         zeg8MixKfJCRPDmwLIXI3qzhMpBiPdWl5WYhych2Hn0uWI29hPlyXsEPJnLnqjSfU/LR
         TWFQ==
X-Gm-Message-State: AOJu0YwPhCCDahFGgPaLswc/OinRyPHW0Ccd0+p8ZNqWdjBr3dcGPv1J
	jANwB1nZ60cKo7WFrXq+zL853drs0XALzwk0erVYe/qrfWJUDGrgH6FLwBCaY10f
X-Gm-Gg: AeBDievdsjJC82spr2cKcDY/3jfsXOzN18XK7G7s/Z6fb9JCXphtk+A15H4jxqxChLR
	8w44r+iMBt2CmKGzVntq3z3CTwql+/vSK7w+hMOKBgc6xSmFSYN3bPyzwenz5JbmBSBGzYm7s8O
	wugHcL2QWIfPQgC3PjCgcD1vb657K6Io2h0ejbz2BUtd8bZR12TFpH0ylop5L9iF8K+7FmsSy6+
	/YwU+MCV/myfw9wK3NgL7gnRPptu7X/vBept8sYBpu2VfZqz24+y/0xjT04SrF5dtG+fIGD3fe/
	HgvQW1Wgv1KzaevrL7tzdAE3eWwWUudKcuNl0Sc9t5IP7PLT1b+iFgziGOtvwBEwGVSdiv6nrAf
	5gSgkB8FUZlwhBZ/LUQiQaCL3OJYL4hp2/oKM7w5cTuWh/5tk9AmjOLthre8pg70ozOcvtEgboL
	K/B/Q7QGKd11zWjs6/Ei00IMrx+B5H5uDhyTfoebh6TJT6C/4=
X-Received: by 2002:a17:90b:3f8b:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-364c316618emr2552217a91.20.1777549662072;
        Thu, 30 Apr 2026 04:47:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 15/24] python3-django: upgrade 5.2.12 -> 5.2.13
Date: Thu, 30 Apr 2026 23:46:38 +1200
Message-ID: <20260430114649.4184890-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126749

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fixes for CVE-2026-3902, CVE-2026-4277, CVE-2026-4292,
CVE-2026-33033 and CVE-2026-33034.

Changelog: https://docs.djangoproject.com/en/6.0/releases/5.2.13/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.12.bb => python3-django_5.2.13.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.12.bb => python3-django_5.2.13.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.12.bb b/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.12.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.13.bb
index a7567265b5..5b4dc02d87 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb"
+SRC_URI[sha256sum] = "a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

