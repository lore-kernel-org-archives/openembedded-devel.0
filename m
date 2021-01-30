Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.8676.1612035469746678567
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lf3OuNxW;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id g15so8599454pjd.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ehSxDIBFCbxJFrWWs2jtpqzTbmUatMf4e5kYXi+4SnQ=;
        b=Lf3OuNxWL880/pmqfEMBSpQHWEPestM/yaO1jZE1r2c2P0/tYiudCi13YqI0VRCCUo
         bVXg+qxnigLYVEWy8hXUGyJ9h3PjwnWJ4BuIZyEJr8yWF8P5na183cpNG72ZNEPKolC+
         D32NN/ehhNkSkKHDBRvtisCToUmzFuFb0eDcf1+zsxjspiJGVr3yyCrfJ2Bi1eslHEAi
         yS/VIuQPwX7iDYl1k9k81C/ZSdhth9elLBKdM20XOnPu9wOtrG6abJsc/VEOYyG2eO0f
         ndOXaNdTP9XYGMS4Di4O4wxRePDTtMPjswHyCAaXGmNbdAWamS5Kde4WMEx1qndYCf/A
         mkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ehSxDIBFCbxJFrWWs2jtpqzTbmUatMf4e5kYXi+4SnQ=;
        b=XduLOhKGVFRQ5ivnqvTIEy0NrKk/ajz2MG9O3rhmAw3u8UDHS7oBNJl7T/gnUpGCri
         HtZqKDbXxsMIVH3FIY1WhaHpeOLPYzFNEkpJzJwHhCkQMbMkQM4Qt4+Y+lJj+1946G4E
         KzD3DK5ZzKHO5x1zeZItTDzBbwXFhvljjTl1HDh5MwvGXZVwOkWvb3GYYj4SmjdbXwxu
         JK50ESkJFA0dDYmsOYr2ci/g33+8OZYk+qU+jXwwr1P/DbTkPRWgzkQImMZ+Fd4hFCDp
         kXz50IJItb6SsrI9wkYxPZPu+LEPGHPFzLI2/ZCpO6ut3GfsFeIqnlZYpphKBjOsB268
         XtoQ==
X-Gm-Message-State: AOAM531kDd3y1vcWLeDxY0TK2DSEQ6C5qsb6enaWra4XeDtxLogwq2VZ
	bYR9VzS3ysEeDtlg7YP1y2zXm+hervGVgA==
X-Google-Smtp-Source: ABdhPJz8LBLkGvJJHUAdjFC2hpdCF1Msj74yBV41ozfViUEEdW17XZ/LfP0Vj7rY7BNUmybBzSIVhw==
X-Received: by 2002:a17:90a:5a86:: with SMTP id n6mr10554371pji.65.1612035468935;
        Sat, 30 Jan 2021 11:37:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:48 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/13] iscsi-initiator-utils: Upgrade to _2.1.2
Date: Sat, 30 Jan 2021 11:37:28 -0800
Message-Id: <0a81e46a209d8ec559a7b2576dac5c56b35aa15d.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b99b2f5297a587188cf28e687111b58d7e358fb7)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Makefile-Do-not-set-Werror.patch     | 31 +++++++++++++++++++
 ....1.0.bb => iscsi-initiator-utils_2.1.2.bb} |  9 ++----
 2 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb => iscsi-initiator-utils_2.1.2.bb} (96%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
new file mode 100644
index 0000000000..d5e0deb899
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
@@ -0,0 +1,31 @@
+From 31d88f46bfc67de2659991674253a5d5dfb92afc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 12:00:29 -0700
+Subject: [PATCH] Makefile: Do not set -Werror
+
+clang finds more warnings which causes build to fail, disable treating
+warning as errors
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index 21bb154..0018605 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -35,7 +35,7 @@ endif
+ PKG_CONFIG = /usr/bin/pkg-config
+ 
+ CFLAGS ?= -O2 -g
+-WARNFLAGS ?= -Wall -Wextra -Werror -Wstrict-prototypes -fno-common
++WARNFLAGS ?= -Wall -Wextra -Wstrict-prototypes -fno-common
+ CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
+ 	  -I$(TOPDIR)/libopeniscsiusr
+ CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
similarity index 96%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
index 97b5563574..254362881b 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
@@ -12,9 +12,10 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "549f8987be49583bb06b117a364bea3a8fc5250c"
+SRCREV ?= "802688debcd88c48edabe86deb7e7ed47ebadc26"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
+           file://0001-Makefile-Do-not-set-Werror.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
@@ -23,9 +24,6 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://set_initiatorname \
            "
 S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-PV .= "+git${SRCPV}"
 
 inherit update-rc.d systemd autotools pkgconfig
 
@@ -34,7 +32,7 @@ EXTRA_OECONF = " \
     --host=${BUILD_SYS} \
 "
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '--without-systemd',     d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '--without-systemd NO_SYSTEMD=1',     d)}"
 
 EXTRA_OEMAKE = ' \
     OS="${TARGET_SYS}" \
@@ -43,7 +41,6 @@ EXTRA_OEMAKE = ' \
     MANDIR="${mandir}" \
     OPTFLAGS="-DNO_SYSTEMD ${CFLAGS}" \
     PKG_CONFIG="${STAGING_BINDIR_NATIVE}/pkg-config" \
-    NO_SYSTEMD=1 \
 '
 
 
-- 
2.17.1

