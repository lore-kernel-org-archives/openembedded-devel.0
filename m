Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.25508.1613351616651895671
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jd7lBnBQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id t29so3211212pfg.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BvlUXj1F0iOxlAXU/gI6DG0wcRmck2Ij2H6qiZ/5Y+8=;
        b=Jd7lBnBQju6v0BBthjHz+JLPwoBbz+2UmjHXQUZCwnX6Y2xDXJRib2ZuHkCkpa3hng
         U4eWDgJYT5PJ3h2ArqNmOgTx6Ezn5v65AKJfeY8PksDLjFebJhFzKiAsRDj/EHffL0Cy
         NfgmlmNgnu2Ijbsc/+ZYtmY/C7RVXVJIEzcEpOrKi83leSlZazalcDsZyvY2fNsovwhe
         YuShbjUgkp7sz4qdYJ3qbzbDAEYfpaEan4Kn6LsZCGnhWYklM7x4esFRcjHXbAtHiEEx
         YnT3D6WSzxVeFfbL746GpUbXy/s5Cb7m5YPT1fKORS2cjXFjq+OK3VPIYu/Xz109Kce3
         Uavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BvlUXj1F0iOxlAXU/gI6DG0wcRmck2Ij2H6qiZ/5Y+8=;
        b=TVroOCiwTzbe0gcY9yp0gkaXNPN03S5/g//vDIDiarxULSkZgkFj0Xue5hksrsB6X/
         zBkWdaIxTkU3D8a7Du7NCvL87HGzltUc1P9eLEXs0wmMM2varCUM9KUpEVreDCoZiT2f
         KpFNyRIf6oj78dBBXR01pCKYxORI5UpVYkHKsDNRlDZ+TJgVLIEL68UYMuYnVYNOpht7
         aTv4AL16KIYWE64ruq6bllcUHciwN+OY8d2x7wGBQYaP8/f9toPYHVqn8q0lpldjZx7/
         4do8GQGHRqgHnm1wu19yZwT/zexNrjs7MZ1ngguN9EwGCqfy82zWeBlpZJnL5fdflyCg
         rB9A==
X-Gm-Message-State: AOAM532wJoJCgv1HOMeuxo06xvqeqHx5X2Emv4R0ejEvePMUwx9ak9OP
	TU6ktHqiF+y9shvtxKXKQpRWWdTy8ZC7iA==
X-Google-Smtp-Source: ABdhPJzv4t+BjBAOrTRA4IWcEvHOUQ9Enbj1AKTf2tp7u0BxW/Sg83HYZ8QcxcoPC2xGc8mjrhXjEg==
X-Received: by 2002:a62:5250:0:b029:1d6:a566:39f3 with SMTP id g77-20020a6252500000b02901d6a56639f3mr13111775pfb.19.1613351616098;
        Sun, 14 Feb 2021 17:13:36 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:35 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 01/15] enca: Fix SRC_URI
Date: Sun, 14 Feb 2021 17:13:15 -0800
Message-Id: <11875c1f470710b45469726d38ef57753108c3e0.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

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

