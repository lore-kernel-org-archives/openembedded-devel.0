Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2089478AA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:14:34 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id e16-v6so604727wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VSarNFUoBE48cIpy4+Bh/9h1l6rGiYz7U/80CtwsB1Y=;
	b=PyBlrQ+DHDfLSu0Prt5yzUGDP76a2KzrCVNbIY1TIHKxDK89ddahgemeOn/ktQu7id
	6GIPta7KSP9HtKeTx25JE4BbKy68JOuqOamn4x8+GiyTPgAz0iiiAZVv0JHbreQ9fMh1
	fyAti7rlsVxPs730kXhk3m1jJbCfVQ+HceQmXrMdkR4xW1ICDcoC6lXRs/4owZT376OT
	TZOJEA6OTkMt8SiDM9Y+kDopEIQFx4HJ/ikLohEVhJFyn1W7h3YkX4fJwmS5nhRYMP/P
	wI0ZZRsSrNzVZAR5LCJGDRhPy47tXvQLaG2MPYv2ZHC7b5p6MSvoTDcAsF3YL7VQrTRv
	XHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VSarNFUoBE48cIpy4+Bh/9h1l6rGiYz7U/80CtwsB1Y=;
	b=VmJj18ZryE5rPL98ybjgV4yqpyPQNXTNt6cXF6DSDdpl4RPn4YwSpMTv1YRJi0Td7X
	2uIspHwHXfmLZFiPtRWXxAxGqdgrbYH6W/p8sJtZJYSd1zscAHJuSQRQ4GLIuG38Lcsm
	h2xf88IUF/YsOKjuA76yfkFCNbTObEkPbob9yv6xI8NzHQpzk/Aj8cjX8WSBoRrHsSaD
	hD8s3Cy59BODKMniQTj8Kb3TEWe/yx/eoUtLxS6m6UlcXcekir35nUw8pfxRB1JYXV+z
	Bd+dhBCuKEJdMKnEu9aVqMZhlTQHZ3ZnYYy1NZh1P6GfWs5B1+D57MLCOMErqRg6Tae5
	/AXQ==
X-Gm-Message-State: APt69E3UPvWRPQWsbImkZtWU3ymtpwPpqjeCZyKywQWpkgyMXQsCZl7m
	ct9aTovbPFD1yDkExUKAYPYfAw==
X-Google-Smtp-Source: ADUXVKLHNyipu8V14gqjU2zdeZjsx1vX83rlceceBUSIRAY6aO7WbYF/CRl7+ICglagoneA8Bc+Oiw==
X-Received: by 2002:a1c:6b56:: with SMTP id
	g83-v6mr1099595wmc.143.1528827275464; 
	Tue, 12 Jun 2018 11:14:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	12-v6sm1664255wmt.19.2018.06.12.11.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:14:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:14:26 +0000
Message-Id: <20180612181426.2944-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180612181426.2944-1-Martin.Jansa@gmail.com>
References: <20180612181426.2944-1-Martin.Jansa@gmail.com>
Subject: [PATCH][pyro][meta-oe 3/3] rarpd, sblim-sfcb, openct: inherit systemd unconditionally
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
X-List-Received-Date: Tue, 12 Jun 2018 18:14:35 -0000

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
index 0f5568c317..e5ccc8d4ed 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
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


