Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEC474F37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:13:46 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id f16-v6so25128449wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eu3nqsIu5jXJ/PeQg6a3CteL/w1N/EBQ0uZiFb4OK8o=;
	b=TUvZb+qDJvX/a7RkNkbJvCYKzmAsD2azAmG6tEEmV2NRxP/hV0Dfh+G8Xm3O3U9ESE
	0H43Twr8ROZoS0QDlq4Jn9JePhbMFwGAEpv68BEGexMemeNDab1vDPDijp1VS80Hx5rS
	77DgONXkhestwWJKaIIT4dJbr+5fQwqlap5o4lXdVkqWqGfncnlKRq9hyid9mz2IjA86
	ZJSg1w5tDBqVonOw+YAchK1gKTlQpskPZRqTz3hsz6glQ9fr9zw/gr4h/FElZDH3KDgd
	Hq9O5hyJcL5LyOc5yq3QYzm159HlNihQoLO/XLm+/MPaDquh+Yl95Y/UeTbYOpap4yMs
	ob2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eu3nqsIu5jXJ/PeQg6a3CteL/w1N/EBQ0uZiFb4OK8o=;
	b=mlKLGOJofn9YHWNRtOwhUUUbykHf6LI685fWO5d5iGL3UBUPuka1rHGey+JfgvGEUw
	YPr2W3XnuDjy98W8l2bU06wgk1nIXt2Se97/3Jk59V4U/bC8AVxrGV2e0AuObzkDwcoD
	NNc6u1eKFvuxTMSm4JQf17NW9vlL4I0Fej/6Kv9ouLrAcRXmwkHApp2n//EApJOpGdlj
	0RO3qsOjLrYhaIwpqqiXqFGMzzzdjkepfv4GFqYhPdeVTtdsAIW2/FOZRqwIRCLHHlzD
	mWPbDyWhmfSeVoc8fWn9RYIWmzkoNAQFgkpPjtorTvSw+Iz+4AJsZTGOnNEl+o9UWoay
	fBGA==
X-Gm-Message-State: APt69E0bh0yUQXHdM5wS/MdC8mGFZBAVwyJKyYMdNfuGqMYDrgl28wTF
	KTeuElR5nijGB0UaCnF4kHIHXQ==
X-Google-Smtp-Source: ADUXVKK9VPcnQhvFUEt+nReAUWYolyAirEe249A7VYv61oF5w7L3XpFcwIOvbCOtNdgFNd26I1Rv+A==
X-Received: by 2002:adf:af6b:: with SMTP id
	z98-v6mr1299699wrc.250.1528827226745; 
	Tue, 12 Jun 2018 11:13:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n17-v6sm348786wrs.96.2018.06.12.11.13.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:13:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:13:44 +0000
Message-Id: <20180612181344.2727-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][rocko][meta-oe] rarpd, sblim-sfcb, openct: inherit systemd unconditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2018 18:13:46 -0000

* the inherit was controlled by VIRTUAL-RUNTIME_init_manager and the installation
  of .service files by DISTRO_FEATURES and systemd was in DISTRO_FEATURES but not
  in VIRTUAL-RUNTIME_init_manager it was causing QA issues about unpackaged
  .service files

ERROR: rarpd-ss981107-r0 do_package: QA Issue: rarpd: Files/directories
were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/rarpd.service

ERROR: sblim-sfcb-1.4.9-r0 do_package: QA Issue: sblim-sfcb:
Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/sblim-sfcb.service

ERROR: sblim-sfcb-1.4.9-r0 do_package: QA Issue: sblim-sfcb:
Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/sblim-sfcb.service

* systemd.bbclass will take care of removing /lib/systemd when systemd
  isn't in DISTRO_FEATURES, so we can remove both conditions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb        | 8 +++-----
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 8 +++-----
 meta-oe/recipes-support/openct/openct_0.6.20.bb         | 8 +++-----
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index 4025b8087e..7c9f2df9db 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -38,13 +38,11 @@ do_install() {
     install -m 644 rarpd.8 ${D}${mandir}/man8/rarpd.8
     install -m 644 ${WORKDIR}/ethers.sample ${D}${sysconfdir}/ethers
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
-    fi
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
 }
 
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
+inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "rarpd.service"
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index c6b9f1019b..3db8c14842 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -28,7 +28,7 @@ SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
+inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
@@ -53,10 +53,8 @@ do_install() {
 
     oe_runmake DESTDIR=${D} install
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
-    fi
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
 
     install -d ${D}${sysconfdir}/init.d
     mv ${D}${sysconfdir}/init.d/sfcb ${D}${sysconfdir}/init.d/sblim-sfcb
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index c7d7203eda..913290cd97 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
+inherit systemd
 SYSTEMD_SERVICE_${PN} += "openct.service "
 SYSTEMD_AUTO_ENABLE = "enable"
 
@@ -77,10 +77,8 @@ do_install () {
     install -Dpm 755 ${WORKDIR}/openct.init ${D}/etc/init.d/openct
     install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}/etc/sysconfig/openct
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}/system
-    fi
+    install -d ${D}/${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}/system
 
     so=$(find ${D} -name \*.so | sed "s|^${D}||")
     sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
-- 
2.17.1


