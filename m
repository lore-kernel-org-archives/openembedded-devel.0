Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id EFD8B601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:14:55 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id w7-v6so25132029wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S18FvqQF37aFevy6aOxNin5kc7KyzsDYNnZHR1sqaLk=;
	b=KR1AQsAiww7QDph5bHQ5QQz8Ed8S4ypoMlLYtuXKTHKOm1kbecbusupPO6a9SFJZxQ
	PnszjgxSV3yUgOf6+cFFnkD1XBKoj7CxOSZsMIYNC+ZhADxGlbJRMRLfxTNrZo37bIgv
	9kS0oAwvIM7eX9QOdMALynobk/rr7pZOMWFSSIC4OFCd92ixIcxBypS66WbR31WPzTcV
	mAdJ6k8j5MSEzwNwGBG+d3d4C/3nMsjPKDyGCuoGK+gC06r8JpAehCTlTa+wbk4Lmsww
	2vaQOYgEwuGkipnohTf52KHdwbj0Y0F7rNNKSVHzGR3Tdi+K90+zhWGBIVelrSDScHAC
	iXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S18FvqQF37aFevy6aOxNin5kc7KyzsDYNnZHR1sqaLk=;
	b=FYChCkiu7zE2P7GRoMQrAcnjGY2MDJKjtZ+AfAt+NMVW1zkEqDkrF640BxM6ULgEH8
	+o4Jk9HdjWQHp/uAzrJ2Tj+xWEvBSdojpjabKI4fD/zsPHcUqoeZJVhKWyIKkBwL3SG/
	8IhYJS3hlmbv/8UdB0QHaR8E3oSx/wLBcrgFPQ4cbFyI4ump7ItV1T1v9wTHMdTwCK2g
	AoHlKH72GzJqIpeH0yjxAsj9+DlEdGJFCMVXc4+VFC6ZJ0FYftfWM04uAHbjXJvTza21
	yLD9AJQBoaEWZsPLU7XpeTlPNC1YiBc82CObNmbYx6dHB26K1kgrdVRblSp5LHo3cZJA
	SgSg==
X-Gm-Message-State: APt69E0C8E7ESY+Tx3xnFntSEt8s16Ug3lrN2NVrt0d7fNLqAdu/PIrJ
	AFSsRvHuN60UGbniu0+yKQ5HoQ==
X-Google-Smtp-Source: ADUXVKLy174labSs5F0qyukYqKPeFZECBt8/pSIHHV35INHEwNFQ/UTe4Oiupzh8pU7ebM/5ZmlRYQ==
X-Received: by 2002:adf:aef3:: with SMTP id
	y106-v6mr1344021wrc.53.1528827296446; 
	Tue, 12 Jun 2018 11:14:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c11-v6sm990220wri.49.2018.06.12.11.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:14:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:14:52 +0000
Message-Id: <20180612181452.3205-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180612181452.3205-1-Martin.Jansa@gmail.com>
References: <20180612181452.3205-1-Martin.Jansa@gmail.com>
Subject: [PATCH][morty][meta-oe 2/2] rarpd, sblim-sfcb, openct: inherit systemd unconditionally
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
X-List-Received-Date: Tue, 12 Jun 2018 18:14:56 -0000

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
index a1121686cb..7c9f2df9db 100644
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
 
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
+inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "rarpd.service"
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 84e465d855..ce5d7c3365 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -25,7 +25,7 @@ SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "sblim-sfcb.service"
@@ -50,10 +50,8 @@ do_install() {
 
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
index d4ad9c1c4b..068b09614c 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+inherit systemd
 SYSTEMD_SERVICE_${PN} += "openct.service "
 SYSTEMD_AUTO_ENABLE = "enable"
 
@@ -76,10 +76,8 @@ do_install () {
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


