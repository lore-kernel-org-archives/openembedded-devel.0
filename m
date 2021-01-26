Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.8242.1611637900739635397
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itiZRCiU;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id q129so31356549iod.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 21:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ehSxDIBFCbxJFrWWs2jtpqzTbmUatMf4e5kYXi+4SnQ=;
        b=itiZRCiUB3LxMXB7H7a/1cxXpKkBjn2gJhLQvc5sXBVOqS23+t4esP7b58870jQyWI
         N0VuMcRCGgUldy3RvTdeFExJsCVWaGSnGKtqr1BWF8NRDpms8nzNLTEfjVOenTy8tCKm
         z+gE0uQKTEGHVarSxWOOZFRt2GkjBR/MwtFq/90sC8UJvQ2OQ50bMAdA6QsN6Uz//pYz
         m2/cbufnRhBcKgBgVW8fWWD0bp+wgP7e3h3EZR8HbSNgLC7p5JajivcvF0dEnrqSMCni
         EZ1wdLSPJHM6Z2nU71TmC39uJ/BB1/z29pjDJBPN8klPZUOT3T4f0XZwmJXAGPTPcORu
         F3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ehSxDIBFCbxJFrWWs2jtpqzTbmUatMf4e5kYXi+4SnQ=;
        b=d0GTmDrfH5TtsHJXt00UXMHL0Ja6Mmx128TEPoBndzbzB4x0p6hNHQpr0yvS4Bni4K
         FE2WGtqJSy/UVM3cndISYC0KnnDyPLnGe0voe1LY8KnqIBI47r6rq0IvY2v4b0bwHPVV
         uOdVaG0zJtm+oMK5MFT6J6NMSJDoQmKmneL8Prya+Lv6kDqdeHP6CR73QyTuDhggPXyo
         uaVEnIzf1etQnbCC/r63vP7+1E1vUibqnvyng/6TS0Mxa57thFeDdiMxe/6fKd79VcDr
         PpiOVG+k4Bcieid4ak2QU/FTlvs8DPCGruDJHhPWl3X+UNH0QPW6Ts0eDJZXEm1UqizR
         yr9A==
X-Gm-Message-State: AOAM533csY+B4UOnz3EQg6ugz2nMw+mrkmotA5YxtOkrPSqOs9e6hMU5
	rglh3eUi2GD0xvYFoNHRsDz/uUZs/g0fpg==
X-Google-Smtp-Source: ABdhPJz5164S1ux5F4KaomYoPRbjzQQ+yMiwPiMwlTc+HT1TUHydrc/eGATQoEVZ/+ziA6ydw9PPWA==
X-Received: by 2002:a02:91c6:: with SMTP id s6mr3454079jag.78.1611637899999;
        Mon, 25 Jan 2021 21:11:39 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5442:4b7c:f358:5471])
        by smtp.gmail.com with ESMTPSA id l7sm12039974iln.74.2021.01.25.21.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:11:39 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][dunfell][PATCH 1/3] iscsi-initiator-utils: Upgrade to _2.1.2
Date: Mon, 25 Jan 2021 21:11:36 -0800
Message-Id: <20210126051138.15194-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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

