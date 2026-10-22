Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.113.1792679095145968234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 07:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Ejfim6Xg;
 spf=pass (domain: snapchat.com, ip: 209.85.221.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso1272043f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1792679093; x=1793283893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Imt9TnqPhnVDfb2A1fC/z5Rbzx+AR/CSvKWOwOZLynw=;
        b=Ejfim6XgH4BvliJ/hN9UOtWzafMy37iQSErf8qbEglDUGj4nI9j+9OhrLcdXa541Vw
         571jTXScPriXDWf4sQ27FZ72m2xmiPimf9SBCCvhkSaENv8DlQXDfkqo+7r4j6uMwKPG
         Pg+Ew6O1UASZENaTeFGsFSu/ARWtLGY+ReIc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679093; x=1793283893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imt9TnqPhnVDfb2A1fC/z5Rbzx+AR/CSvKWOwOZLynw=;
        b=htv8NyHSxdS+JoiBWzE7B2C5ZeKbRYaog1ZTsYpuDw4SqZAXQCxCPvaFHrzkShvCii
         FghHSPoBPy/vtGeKoEh4n22U4xSenWkYZoaBlyWTgzFX9EZlu4loEj/zTVFymaoGxlZH
         BgYdFXy/MHaNqoJgjZII8Kvau3r2ljNySp2Vky2fuzdJDAWwPbVv63f8y7asmSnyyPdh
         FMhga2StZGIDWMKfsNbuNApY2Jl1wOTH8RdKI9x5HkFa4Dc5Qs6U63BABPlT/OnvlRqJ
         5W8AHhTbQvNoxI8+OSsy0Sd0zcK8j4yoXy12nPfVKRoeZY3sDQDQ0djYybG0X1llc0nZ
         8aBA==
X-Gm-Message-State: AFq9FYLeMalqolTVHL3QM379tZHnCEnzv/ZjzrwlRG2vPGoXiciXKz0H
	7eXeBDvCJWsSC83gVc7HmLcvq8yOi/1n9io25+v0SiL0iMGiEAiNSu6LNO3Oy34SfNd44aM3aLr
	kpS3NIfc=
X-Gm-Gg: AYBFou2SjY/ldGFnL6l24+hwfuvdsT5Jqnpdunt7u8fxhr2TyUHewp3Wqy1uZm/4dPV
	HITrOkLIREFFIQm05YcNZuEaA1cwQhAHTFn22bupXqFbjq2tUIcQqV6QlqEwXsjK951aFsgqy1J
	XyDmqaNVR1zYo+UlZLV0LsfY9ir1UyTq7LU0QbMrVLnsjm/M5ekdxHr51mmvOCZsb+QIoatEr1K
	Lo4YvWKKiqKIHZgI+0ERrPYB4mOuyS99hyiERQSoR79KIFgOBlHz6tZL6y4Wq5akmt7DkFdvQgG
	pBwRiHSpudzSgyas0avgea8Sv2U1V1AcZcuOnq9Si+Nju+CXnBsc/dOyswh08HaLb8dlo4Kz5ym
	9BKEJ7hIIit7x4gWSMdgJPuMFqZibq0cpIMmr2mXN2hxn+MGwBHxUlJ8Ng5GX56FdpPIkiYZgbo
	U/UQpH3+bJdCe5tGeaaoqd1gY203voQIeEhKlH4FoGaWCdnatN5j3J4Lf2tMxopqRnS+FJ3inN8
	oyVcp2yM/exlRdBZIbjYPXC+z5CjXcI+7oX0ZCSJwAwbUS3JapKpyKH+3QNAIJEWDP2Byuuovzq
	uD5iYDYFOYP7UFxnTos3BGY=
X-Received: by 2002:a05:6000:98a:b0:48d:f957:bca4 with SMTP id ffacd0b85a97d-48e264dd014mr10557356f8f.44.1792679093093;
        Thu, 22 Oct 2026 07:24:53 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm12593747f8f.41.2026.10.22.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:24:52 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] android-tools: drop GPL-2.0-only from LICENSE
Date: Thu, 22 Oct 2026 16:24:48 +0200
Message-ID: <20261022142449.2372030-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 14:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131315
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

The GPL-2.0 entry dates back to the first recipe (AOSP android-5.1.1_r37,
2016) and was carried over unchanged to the Debian android-platform-tools
based 35.0.2 recipe.

In the android-5.1.1_r37 repos the recipe fetched, the only GPLv2 mentions
are headers which are dual licensed "Apache 2.0 OR GPLv2"
(system/core include/cutils/ashmem.h, include/utils/ashmem.h,
include/log/logger.h), kernel headers in libion which are not built, and
documentation templates. Apache-2.0 can be chosen for all of them.

The 35.0.2 sources come from Debian's android-platform-tools, whose
debian/copyright lists no GPL license: the files are Apache-2.0, BSD,
Expat, Khronos, PSF and public-domain, and a scan of the unpacked tarball
finds no GPL licensed source files.

Remove GPL-2.0-only from LICENSE and LIC_FILES_CHKSUM so that the recipe is
not wrongly treated as GPL by license based tooling (e.g. copyleft source
archiving).

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 65529c1b53..b7cb062410 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -1,9 +1,8 @@
 DESCRIPTION = "Various utilities from Android"
 SECTION = "console/utils"
-LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-only"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
-    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-- 
2.43.0

