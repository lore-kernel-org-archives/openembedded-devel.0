Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2322.1613440709619158280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IWaDuKO/;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id k22so4672331pll.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BvlUXj1F0iOxlAXU/gI6DG0wcRmck2Ij2H6qiZ/5Y+8=;
        b=IWaDuKO/nuhQ9LT93tJFg9dg+nyi6pbmZfd11YL2NKVlSQtgVlqDcA8ufXsmV2HsEI
         56M5VzeRMVFoSW7cBRhLJa+cPmFWAlYzJ90C8VwVUlWlFPLc+c1gYPvfLzu98OX6YZ6n
         /zVm2LxeF1h94SvtBtRPVV+9j4rNF2GE0b/79AmuGzlRXMZhc5ir2tCXuUq5n0k/xjkG
         on7rtNMlSF91MFFlfbNUvKgoOj67vcVwiTD5Fd03VlzK+HRG48cFGevkjLdM13b6z75j
         wWYRFOVgvLMAVfMAc9lstw/vU+ZG/BouGMqhQ7srDd9/00DF6l2GJkG2qaV/jrLbmx4q
         qHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BvlUXj1F0iOxlAXU/gI6DG0wcRmck2Ij2H6qiZ/5Y+8=;
        b=L2EOag8Mr0Nx1SwtBz0vj4DO7aEggEGD0YlQuFXAjJO19FGjf6QBzzm4LQPvx3hvBy
         d+7Gxke/+9agrxtZrYUwJ1sF0lo3KTrD2xz9UgOMJo5slyYjNAJTPYMU0Vx1Dp8tENkj
         n8d1N6VQJOMuOfDMIRRJQFHqtjHJP5400R3/M5a6Xuguv3RoLzSnw+Y3QEyrpSOKFxdZ
         Z0M/Ux2HDWs1pzK72mlNmlCCnHxgp1ma5u/BQoJCVof4XeRMdV8SrZEAo43KgAGZwrYO
         7+OQPfTG5vA3eA4eMjlQUhPuWO3dffRDLYPztJYHukbqoW5AUfRnKnXY//PXzMBLDtYq
         QT4Q==
X-Gm-Message-State: AOAM531qMYTgGNyG6+ei40JPqh1DRuCarMyh9KWikdKwP/CiAK4PkohT
	7ssBi7qsL8cjbSXDpHpVhSo1Mo5llAQDkA==
X-Google-Smtp-Source: ABdhPJwq3DWA2v3KxhlOx8MlR+Gegf7nwVRMUn0/vDbllYHD3EKUq2oj5p9ow9QgnO8uo8T6++pS5g==
X-Received: by 2002:a17:90b:1090:: with SMTP id gj16mr1643286pjb.63.1613440709087;
        Mon, 15 Feb 2021 17:58:29 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:28 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/11] enca: Fix SRC_URI
Date: Mon, 15 Feb 2021 17:58:15 -0800
Message-Id: <a9befa4413656dc94d57a5738cff8242d4468457.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: akuster <akuster808@gmail.com>

The project appears to have moved.
Update HOMEPAGE and SRC_URI. bz2 is not available, use gz
Update HASH accordingly.

Fixes:
WARNING: enca-1.9-r0 do_fetch: Failed to fetch URL http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-1.9.tar.bz2, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 460077d30ffedca4c794f60cd0f21404fc1736d7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/enca/enca_1.9.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index bf19843b2f..b0ba3aedef 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -1,21 +1,20 @@
 SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
-HOMEPAGE = "http://trific.ath.cx/software/enca/"
+HOMEPAGE = "https://cihar.com/software/enca/"
 
 DEPENDS += "gettext-native"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 
-SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2 \
+SRC_URI = "https://dl.cihar.com/enca/enca-${PV}.tar.gz \
     file://configure-hack.patch \
     file://dont-run-tests.patch \
     file://configure-remove-dumbness.patch \
     file://makefile-remove-tools.patch \
     file://libenca-003-iconv.patch "
 
-SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
-SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
+SRC_URI[sha256sum] = "75a38ed23bac37cc12166cc5edc8335c3af862adc202f84823d3aef3e2208e47"
 
 inherit autotools
 
-- 
2.17.1

