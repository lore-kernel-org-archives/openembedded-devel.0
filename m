Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEAECA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:07 +0000 (UTC)
Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63901.1790618224707561168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l70AMGZ7;
 spf=pass (domain: gmail.com, ip: 74.125.227.167, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso532500a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618224; x=1791223024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyJg2nXp/M9mytuDfIN9DSyBWCPT1PYholoXLgTuBZ8=;
        b=l70AMGZ7m6ul2mYcHCvV3rGvwFbG0fIceSoYKjAYRwf8DN/TGY70bQTDJweAlLkd9G
         OIt4IkmZviTjC7JUFIUAzwGPRkzYoI/MYT1uogZVSObmFlhFmfxt4w06O4/qiDmuZY5O
         n/9wkBga1bc29PENwyO5iYvvBLWutfeCiOr1p571qyRyPWx/Oo63cDijCrSuL3sSZaVZ
         Fozn6uFb34lOKHgC6ZeBVpS1ay6K5295SIv7AslRGAOJKUj9bDh9QOfXeXvJPIW6guxR
         aImRhOtyq29LI8P2Wz8cTtN1KvIuK6NMpdKMiQqXDl1Ddb0RnVptWp9F203kzr/a4+ua
         +UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618224; x=1791223024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyJg2nXp/M9mytuDfIN9DSyBWCPT1PYholoXLgTuBZ8=;
        b=izEtmrlaQzkazOudt/Bj6PPSXpWQh7r7V5Mf3HRCmDkwjivH0HpZ5Nl88SJ7J5UFGt
         YTuuK79X2SdHaPMQ45fh1brjM8m1fMq1fS/YpyHZbULi4/O3gpdH05AG4levAPIX27pr
         URJ7z6gkmuyEO0XPR8ay0W/yKEG8FaHAup0JIsBwjoKUaucln42iwVeYOWny4Jd8Q5pV
         imFwYiIHqT1mu+QLtEE07qawZU1Z2Kv+3hL8L9+hsgokwhKsZ3nT/COBlkHi/iKLiYCM
         4MZ6a1Y1vCnZOFTQOfEmNj2Wd4u5xUQ1kmwWGx/yWmrpApLLmjvsWguWXl10qe8/0q0x
         7+MQ==
X-Gm-Message-State: AFq9FYJm5sutkhP2cApkepj6u0ko6RFx/KZ+pG8hVeCoyTtvFXVNgTMv
	v+PCS3UH9ndvY039dSzdyfgVrxQTZg14wN6JQ8n+W/0zuAYYlNiQivkqdnverw==
X-Gm-Gg: AYBFou2cA4tDV78V5S394MfS8DR0uNvxI4QB+eB7glu0Nb6oxy4VMjJUj++gBOOmvFl
	LtIFbAHWpbxh2oJ3MoF8kiwnMeyDZuIq0YQ5QLA8WwcO7tCd3S4DrgppNNqEn7YUVb4quZr6a+h
	oAwtfPsQ4saZNTC0vx/gCwp7VYb2rk+T9Pjbmcqq/2HL4PMofTE4HfoHY62JPM5DWAX4wE5984R
	UC7o/jYZbM7xRAxXpBQIwtE7rgkq90pFUO4kiQwqH0Zf/13VR9Xx3O+bCOUQQnG3Z2o6XVADu3u
	/Gm3AOvwmiFo5+DIhge5KV3ge3F70DLgy/ZZVfFAEdohk7Vw36nDxOczlWGeWociDqf1xuoBovD
	AsLJsQaD8IZRs4jbOfTr9lA+BrkhlvLn6DCJRYSQu12KftnZHOdvIjeffo400RP1pTjKwJv3+qC
	aFdBCuCf1ZdIJv32jk82e5G7r3M+nkI8Cm9yjXyRaETY3zxuG/dnx99p3JDqfHCtVOvV1a2/67Q
	IKmkBavnEhB/U+P2xRSFoo=
X-Received: by 2002:a17:90b:3b43:b0:3a2:b4bb:91d0 with SMTP id 98e67ed59e1d1-3a2b4bb932emr3629529a91.36.1790618223953;
        Mon, 28 Sep 2026 10:57:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/8] imagemagick: upgrade 7.1.2-30 -> 7.1.2-32
Date: Tue, 29 Sep 2026 06:56:49 +1300
Message-ID: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130461

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://imagemagick.org/changelog/#gsc.tab=0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-30.bb => imagemagick_7.1.2-32.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-30.bb => imagemagick_7.1.2-32.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb
index 87dd0cca0b..818a4e8520 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-30.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-32.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "344e9056f43764bfdf82456faf3bc2feee98a6fe"
+SRCREV = "ad98b244c995d2e3051757fa3b7855f45b550d24"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

