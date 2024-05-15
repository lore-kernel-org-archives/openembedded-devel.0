Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768FC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:49:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.79.1715813346527170308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 15:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GRASl3TY;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f4e59191a1so4688643b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715813346; x=1716418146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/GOMHCFBnqx4J/Qahk0XTmRmRc/uplWQRmUf6kOqOM=;
        b=GRASl3TYaJW8WGjXucGLvL9axG3JHoZXYXk5PrXqkwODKmNsvwy7aoclIAv0nFBE+p
         Kb9IwfjXP5MNo85UvLzEkuI3bhabv/lQrzOn+tTPmPYA+SrGwOs8Qrs7OdDotkltMMtw
         Q74iXulthR8MVQFQanL1/W8lqttwSpTxfvU3drF3gljZL2GCmNq/Ay9bXMr4vfTxNKeg
         0oISdLnWvgqGBvPUutlmcK6Z0fG1cyDKsbr/iQqMKZsiXQLS7jmaR2z02UPwNGRlBoRF
         F4N4rBBZ50hp+WcGMj/IRQvXoVYZQIdfpCIyPF6cI69hyBOeeXLPTCDJpQDNP2T+rQaJ
         zFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715813346; x=1716418146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/GOMHCFBnqx4J/Qahk0XTmRmRc/uplWQRmUf6kOqOM=;
        b=JCEe6Zb0ONBVHAAyItLG7oM4okblN33F1x3QrZcYat7+csr7XcIkEBF25yw+53E6fG
         jn/+bGo15OF6E56fFxEjP7JnYuGmEYYj9GwOJTa4HZkWSBq5Oo+sBKXpf2MiQzg5zSwt
         Yd/ZuEQTOn17eIZPOF7njwfrGgMb4ogblvTBWWWJ9p8iTY2ibG646WlQLjJK7QUssUlT
         /JBgjaBPpQlQjSk737uQ5b0H6lRB1BAUnBYrqEOFvwcKvZy8vX3n/Su9H0rGyda6lG9X
         TnthbszUdH50surZIyhW/4Gfk0JKKlnv1avYuV1nedWYGA8XbQxqiriuoS9s77PUYZGF
         Ofqg==
X-Gm-Message-State: AOJu0YzZvv7lyAxs8iAi8FVPBCnT9v8eOm19bsTraeMBrHpnadCJE0jL
	vfyceE/CIaq4eY3x5KXN5LVeDp0gTVVUKlhDWKia1RKrMzcy1XXmBy2N55sTjb4=
X-Google-Smtp-Source: AGHT+IHUYzQleo856K08SmXa6W30egL93MKPPxnbU9zuspQEVRAiMxJvhhtVizcSEwAV0seG7i95sA==
X-Received: by 2002:a05:6a00:1387:b0:6f4:436d:fd0d with SMTP id d2e1a72fcca58-6f4e0355fc0mr16609659b3a.27.1715813345261;
        Wed, 15 May 2024 15:49:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f80e4sm12090938a12.75.2024.05.15.15.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 15:49:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] recipes: Switch away from S = WORKDIR
Date: Wed, 15 May 2024 15:48:59 -0700
Message-ID: <20240515224900.232825-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240515224900.232825-1-raj.khem@gmail.com>
References: <20240515224900.232825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 22:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110406

Make it dependent on UNPACKDIR instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../faenza-icon-theme/faenza-icon-theme_1.3.bb      |  3 ++-
 .../gtksourceview-classic-light_1.0.bb              |  7 ++++---
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb      |  3 ++-
 .../initrdscripts/initramfs-debug_1.0.bb            |  5 +++--
 .../recipes-support/nuttcp/nuttcp_8.2.2.bb          |  7 ++++---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb    |  3 ++-
 .../recipes-benchmark/whetstone/whetstone_1.2.bb    |  5 +++--
 .../recipes-bsp/lm_sensors/lmsensors-config_1.0.bb  | 13 +++++++------
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb    |  3 ++-
 .../proxy-libintl/proxy-libintl_20100902.bb         |  7 ++++---
 meta-oe/recipes-core/usleep/usleep_1.2.bb           |  7 ++++---
 .../systemd/nativesdk-systemd-systemctl.bb          |  5 +++--
 .../recipes-graphics/ttf-fonts/ttf-google-fira.bb   |  3 ++-
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb  |  3 ++-
 .../recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb  |  3 ++-
 meta-oe/recipes-support/fbset/fbset-modes.bb        |  6 ++++--
 meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb |  3 ++-
 meta-oe/recipes-support/nmon/nmon_16m.bb            |  3 ++-
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb     |  3 ++-
 meta-oe/recipes-test/testfloat/testfloat_3e.bb      |  3 ++-
 20 files changed, 58 insertions(+), 37 deletions(-)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index 12d344bff5..5db9457122 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit allarch gtk-icon-cache
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
 SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
index 4e1e434314..9d46b43c42 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
@@ -6,13 +6,14 @@ inherit allarch
 
 SRC_URI = "file://classic-light.xml"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}${datadir}/gtksourceview-3.0/styles
-    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-3.0/styles/
+    install -m 0644 ${UNPACKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-3.0/styles/
     install -d ${D}${datadir}/gtksourceview-4/styles
-    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-4/styles/
+    install -m 0644 ${UNPACKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-4/styles/
 }
 
 FILES:${PN} = " \
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index 2dce19c6be..d8134b228c 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://icon.xpm"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install:prepend () {
 echo '# /boot/boot.cfg - KEXECBOOT configuration file.
diff --git a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
index 4c06346570..c2b3faddda 100644
--- a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
+++ b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
@@ -3,10 +3,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SRC_URI = "file://init-debug.sh"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-debug.sh ${D}/init
+        install -m 0755 ${UNPACKDIR}/init-debug.sh ${D}/init
 }
 
 inherit allarch
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
index 115b51e96c..b02f775a55 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
@@ -18,7 +18,8 @@ SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
 SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
 SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
     ${CC} ${CFLAGS} ${LDFLAGS} -o nuttcp nuttcp-${PV}.c
@@ -28,8 +29,8 @@ do_install () {
     install -d ${D}${bindir}
     install -d ${D}${systemd_system_unitdir}
     install -m 0755 nuttcp ${D}${bindir}
-    install -m 0644 ${WORKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
 }
 
 FILES:${PN} += " \
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index b49951cc27..a0327ee154 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -10,7 +10,8 @@ SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpack
 SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
 SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -DDP -o linpack_dp linpacknew.c -lm
diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index 8fad04e365..ce28fc732c 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "Whetstone benchmark is a synthetic benchmark for evaluating the p
 SUMMARY = "CPU benchmark to measure floating point performance"
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM ="file://${WORKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
+LIC_FILES_CHKSUM ="file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
 
 SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
 SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
 SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
index 25ab44f75e..6fad255c89 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
@@ -12,7 +12,8 @@ SRC_URI = "file://fancontrol \
            file://sensors.conf \
            file://sensord \
 "
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 PACKAGECONFIG ??= "sensord"
 PACKAGECONFIG[sensord] = ",,"
@@ -22,20 +23,20 @@ RDEPENDS:${PN}-dev = ""
 do_install() {
     # Install fancontrol configuration file
     install -d ${D}${sysconfdir}/sysconfig
-    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/sensord ${D}${sysconfdir}/sysconfig
+    install -m 0644 ${UNPACKDIR}/fancontrol ${D}${sysconfdir}
+    install -m 0644 ${UNPACKDIR}/sensord ${D}${sysconfdir}/sysconfig
     # Install libsensors configuration file
     install -d ${D}${sysconfdir}/sensors.d
-    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
+    install -m 0644 ${UNPACKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
         # Install sensord configuration file
-        install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
+        install -m 0644 ${UNPACKDIR}/sensord.conf ${D}${sysconfdir}
 
         # Install sensord.cgi script and create world-writable
         # web-accessible sensord directory
         install -d ${D}/www/pages/cgi-bin
-        install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
+        install -m 0755 ${UNPACKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
         install -d -m a=rwxs ${D}/www/pages/sensord
     fi
 }
diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index 61be5b2dcc..20e870ccb2 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
 SRC_URI = "file://pointercal \
            file://COPYING"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     # Only install file if it has a contents
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 247cc4266f..afc14e56b0 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -12,7 +12,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 PACKAGES = "${PN} ${PN}-dev"
 FILES:${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
 INSANE_SKIP:${PN}-dev = "staticdev"
@@ -28,6 +29,6 @@ do_compile() {
 do_install() {
     install -d ${D}/${includedir}
     install -d ${D}/${libdir}
-    install -m 0644 ${WORKDIR}/include/libintl.h ${D}/${includedir}
-    install -m 0644 ${WORKDIR}/lib/libintl.a ${D}/${libdir}
+    install -m 0644 ${UNPACKDIR}/include/libintl.h ${D}/${includedir}
+    install -m 0644 ${UNPACKDIR}/lib/libintl.a ${D}/${libdir}
 }
diff --git a/meta-oe/recipes-core/usleep/usleep_1.2.bb b/meta-oe/recipes-core/usleep/usleep_1.2.bb
index a529032aad..882ac2c2ff 100644
--- a/meta-oe/recipes-core/usleep/usleep_1.2.bb
+++ b/meta-oe/recipes-core/usleep/usleep_1.2.bb
@@ -3,7 +3,8 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 DEPENDS = "popt"
 
 SRC_URI = "file://usleep.c \
@@ -19,8 +20,8 @@ do_install() {
     install -d ${D}${base_bindir}
     install -d ${D}${mandir}/man1
 
-    install -m 0755 ${WORKDIR}/usleep   ${D}${base_bindir}
-    install -m 0644 ${WORKDIR}/usleep.1 ${D}${mandir}/man1
+    install -m 0755 ${UNPACKDIR}/usleep   ${D}${base_bindir}
+    install -m 0644 ${UNPACKDIR}/usleep.1 ${D}${mandir}/man1
 }
 
 inherit update-alternatives
diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
index f7160f508b..3360ccf357 100644
--- a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
+++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
@@ -7,9 +7,10 @@ inherit nativesdk
 
 SRC_URI = "file://systemctl"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+	install -m 0755 ${UNPACKDIR}/systemctl ${D}${bindir}
 }
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
index d618607496..c142f1dd02 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -23,7 +23,8 @@ SRC_URI = "git://github.com/google/fonts.git;protocol=https;branch=main;subpath=
            git://github.com/google/fonts.git;protocol=https;branch=main;subpath=ofl/firasanscondensed;name=firasanscondensed \
            git://github.com/google/fonts.git;protocol=https;branch=main;subpath=ofl/firasansextracondensed;name=firasansextracondensed"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install:append() {
     install -d ${D}${datadir}/fonts/truetype/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
index 3951647337..65d0f0bb35 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "de5750f7048973f851961050f76b8b58e9bda400d5007c3078d9317fbe
 
 DEPENDS = "fontforge-native"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 FONT_PACKAGES = "${PN}"
 FILES:${PN} = "${datadir}"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
index 1870c78f99..3752ec39bc 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/google/roboto/releases/download/v${PV}/roboto-andr
 SRC_URI[md5sum] = "3b43a5cb33196ec25e44d5fcb40219e1"
 SRC_URI[sha256sum] = "c825453253f590cfe62557733e7173f9a421fff103b00f57d33c4ad28ae53baf"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 FILES:${PN} = "${datadir}/fonts/truetype/*.ttf"
diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index aa5f631c38..fcaf31795b 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PV = "0.1.0"
 
 SRC_URI = "file://fb.modes"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/fb.modes ${D}${sysconfdir}
+    install -m 0644 ${UNPACKDIR}/fb.modes ${D}${sysconfdir}
 }
 
 # fb.modes file is MACHINE_ARCH, base.bbclass correctly changes it to MACHINE_ARCH, but too late for allarch.bbclass
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
index 9130b110a8..4f0d8e5548 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "e04d192c2356e9d4c2b2c7d83fde9408713212b53c4d106e5b9e46c1a5
 JQUERYDIR = "${datadir}/javascript/jquery"
 JQUERYDOCDIR = "${docdir}/libjs-jquery"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d -m 0755 ${D}${JQUERYDIR}
diff --git a/meta-oe/recipes-support/nmon/nmon_16m.bb b/meta-oe/recipes-support/nmon/nmon_16m.bb
index d4a357cea0..1779dd2273 100644
--- a/meta-oe/recipes-support/nmon/nmon_16m.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16m.bb
@@ -18,7 +18,8 @@ CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
 LDFLAGS += "-ltinfo -lncursesw -lm"
 ASNEEDED:pn-nmon = ""
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} lmon${PV}.c -o nmon
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
index b61fb026ca..09534c44fd 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -9,7 +9,8 @@ SRC_URI = "file://pxaregs.c \
            file://serial.patch \
            file://usb.patch "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
     ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
diff --git a/meta-oe/recipes-test/testfloat/testfloat_3e.bb b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
index 48f50d8274..071be2a200 100644
--- a/meta-oe/recipes-test/testfloat/testfloat_3e.bb
+++ b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
@@ -19,7 +19,8 @@ SRC_URI[TestFloat.sha256sum] = "6d4bdf0096b48a653aa59fc203a9e5fe18b5a58d7a1b7151
 SRC_URI[SoftFloat.md5sum] = "7dac954ea4aed0697cbfee800ba4f492"
 SRC_URI[SoftFloat.sha256sum] = "21130ce885d35c1fe73fc1e1bf2244178167e05c6747cad5f450cc991714c746"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile(){
     oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
-- 
2.45.1


