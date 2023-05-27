Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00545C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:36:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3270.1685151396229506281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 18:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Lw+8hoxz;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ae3ed1b0d6so9036595ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 18:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685151395; x=1687743395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyLOLcBnHeypqEzmYXF7Uq67xqmQOxCUCY5+djX6k9c=;
        b=Lw+8hoxzhuZ4HT0tprJZCQ9yxFH37QAF9b3EdCFPA9JE9z1x6RDOgmZ8fVIzq5kLVY
         UrYqDQRKihpE3cEAAqg9hVGPZn/ci8fEBocGLNUrp2cgBqXMdYNEuScf/q9qh+da6eoX
         ZAOQBYTdSMzG8k/lc+NMvnV2ildAV39LtVkd5dU6SR97x44nWy3d2F1ayjmjh+3QRtK+
         BZ+/iK4oqt0bQ9vu9XF1Q0wWuZTiCe8Hw67FMlo2/s1CC5HONazsQpYQW1brL5PI3opp
         yM2SNToF6YlcphZYz0wuQQOApYrGlmbp6ylciAZlKFWz1Kv+xDtjdynIa5GCE97xxWMV
         RU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151395; x=1687743395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyLOLcBnHeypqEzmYXF7Uq67xqmQOxCUCY5+djX6k9c=;
        b=WX6eQO43sbDWmDmXDLH2VUl9VwHJQtycIBezVz5SNaCWYlrjqYsow5j4U7625kkqYV
         0eIOnGAgc+oYWnQoRcJYUo1r7Q5BChzIWq0GF49q8IPqmqsoRNHvMxHAVkAWW6lEfQis
         GLDT/zaAlFnQVPvqYho1EDHcF9hIOU/CDG2AQPigbp7uMbHeMeUKEGCObn6Zkv/lflEL
         y+dtd+YVipx3jLStOr0Y8W3iVy1nx8CD3QlCSxhLbjfki5cNhq7PcQDnRiHhCB7Vh8cx
         y47GFcmqU6aMw0eQgghX4Fuo/TcxBWneOcdXaNLgGr1S5hVujK7nTKDtSPnrdcM6k650
         F+TA==
X-Gm-Message-State: AC+VfDyx8G8HvM+ZSoyOfYDciDD4KJzKh1ig8zAbT2eVABXah1AQn2LN
	jWLTWtg039Pccu8hozpXVua5zt6KH/E=
X-Google-Smtp-Source: ACHHUZ4IHYkAimLQ1+nGe+H1yTVZl/hLF9fE2laZ1Um0vap3CfDZaKIwnXvcOyHbhl0NbJFhABv4Ig==
X-Received: by 2002:a17:902:ce8b:b0:1af:c602:cd52 with SMTP id f11-20020a170902ce8b00b001afc602cd52mr4853368plg.67.1685151395364;
        Fri, 26 May 2023 18:36:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001aafe4f9b8esm3802191plp.180.2023.05.26.18.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:36:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] orrery: Pass OE provided cflags
Date: Fri, 26 May 2023 18:36:29 -0700
Message-Id: <20230527013632.96030-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527013632.96030-1-raj.khem@gmail.com>
References: <20230527013632.96030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 01:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102875

Drop Makefiles from packaging /usr/share as a result of mass copy

Fixes
WARNING: orrery-2.7-r0 do_package_qa: QA Issue: File /usr/bin/.debug/orrery in package orrery-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...instead-of-overriding-in-Makefile.am.patch | 28 +++++++++++++++++++
 .../recipes-navigation/orrery/orrery_2.7.bb   |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch

diff --git a/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch b/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch
new file mode 100644
index 0000000000..829ace09b5
--- /dev/null
+++ b/meta-oe/recipes-navigation/orrery/orrery/0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch
@@ -0,0 +1,28 @@
+From e13f15205425c67e1101031a33107fa9cd2d65f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 May 2023 10:32:53 -0700
+Subject: [PATCH] Append cflags instead of overriding in Makefile.am
+
+Fixes
+WARNING: orrery-2.7-r0 do_package_qa: QA Issue: File /usr/bin/.debug/orrery in package orrery-dbg contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b64449f..23637b3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-CFLAGS = -g -O3 -Wall
++CFLAGS += -g -O3 -Wall
+ 
+ bin_PROGRAMS = orrery
+ orrery_SOURCES = planetInfo.c orrery.c orrery.h phaseConstants.h
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 100ecb1331..96a7018de2 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.ta
            file://orrery.png \
            file://use.GdkPixbuf.patch \
            file://0001-orrery-Fix-sprintf-format.patch \
+           file://0001-Append-cflags-instead-of-overriding-in-Makefile.am.patch \
            "
 
 SRC_URI[md5sum]    = "bd62a33e7554ee1030313dfcdefcda8b"
@@ -22,7 +23,7 @@ S = "${WORKDIR}/${BPN}"
 
 do_configure:prepend() {
     # fix DSO issue with binutils-2.22
-    sed -i 's/ -lrt/ -lrt -lm/g' ${S}/Makefile.am
+    sed -i 's/ -lrt$/ -lrt -lm/g' ${S}/Makefile.am
 }
 do_install:append() {
     install -d ${D}${datadir}/orrery
@@ -30,6 +31,7 @@ do_install:append() {
     chown -R root:root ${D}${datadir}/orrery
     install -d ${D}${datadir}/icons
     install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
+    rm -rf ${D}${datadir}/orrery/Makefile*
 }
 
 FILES:${PN} += "${datadir}/icons/orrery.png"
-- 
2.40.1


