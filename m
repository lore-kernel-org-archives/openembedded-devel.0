Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF38871AB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:59:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o23so17546998wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eK9VVwk0K22uXLddJAhRMVqh7WamDjfuVkFAsk4MHes=;
	b=rhMl3RznwTqhJce3peI908ts4dTjCfBHP+BN7sodh/+YUcunb338J9Pz+KaawSQ9IC
	Va+xUw0xXVQbSgdUKdM5lx+iVFSgIx1UBAxdfaHF6mhnzPyp6zpb63d5bNGpA64KJZmr
	Fqf+drUG4vJ4vkG9NgW2q8fyN35qcH2bB2r1plGUdixo4IzumeZ6HB+91zStcdppCdKa
	vm5R2zZTu2D4KtogcPPahc3LH12rXtYOeG3SMC54Wpvcqw0fPVDQYUqYXiZB7AT2pldh
	2Jk7ykMzzDO3NFdGil/1Vz6wD3/e/yGyZbI7qRcQR1yZ6vLFUCOMUBsA0P4vZlVkGPvM
	OCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eK9VVwk0K22uXLddJAhRMVqh7WamDjfuVkFAsk4MHes=;
	b=SsyaW+AsLQ903OK2MRMfTUU8WH0Ny0uesZiFScSmKrZWIbN8CMU94mWUYp9qp4to4G
	akheF5E3TBq1GiF8cpNMX6uE7Cb6ud+D16sld8Jpy45cAFr2SnFMSPfT3wdrd2+Zoe8b
	0pVEIh2b1V5kE7F97betzsF8WsY9NdYUGg3fLyFgUi+HICHqWhka+gbvnoxPwoBgXFN7
	prkK2cIKGplcFh0X+slMXFUXots62GUnAG1z2NDlg5CfZYXPcIF0xPcJSGQhX/eK112O
	Cxw1okvJuSsAoTaBadzVDecwDpwX8Lq3QIbBY+3wyHt7EcsGy7f8kQHb5Y7wrXsYKoDH
	VE8g==
X-Gm-Message-State: ALQs6tDjpcVLhiPNZXGSAxYTlKoNU+wphI+AP6SVNFULbUUYL4e2kn5F
	o8d4J2RFSRI41a4g+04fwMrOKQ==
X-Google-Smtp-Source: AIpwx48kU82hQORjWsrWxQUWZMP7JwpxSMDExvq3uzJYRkR2v3HMTFWLdOl5vGSK4mGvcIj+kJIOSg==
X-Received: by 10.28.17.142 with SMTP id 136mr4409065wmr.38.1522778351132;
	Tue, 03 Apr 2018 10:59:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e10sm5026891wrh.38.2018.04.03.10.59.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 10:59:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:57:09 +0000
Message-Id: <20180403175709.19166-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] rarpd, sblim-sfcb, openct: inherit systemd unconditionally
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
X-List-Received-Date: Tue, 03 Apr 2018 17:59:11 -0000

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
index 152ae22902..10ffaaa31b 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -31,7 +31,7 @@ SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
+inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
@@ -56,10 +56,8 @@ do_install() {
 
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
2.15.1


