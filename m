Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nt-0007XI-PD
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:44 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1567753eae.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8tCAQ69d07eq2pMTuQS8aDm5zo/5jOgB0dQKHOh4sG4=;
	b=zFt3d/E91iEwhdUsI75eERxsBbSnWSKxHsSkXbTJWk1zNr6v0nc+3YZ4JJiQ2+KkK3
	xSfAmzUOudrgy6eKpZRfA4b2WSFwTLmtw1V22vsBnLpP2rAc9UgwP9WHuoy4mKhrZbkz
	FAbgpBNzQ5kXbvW0aUvhuwrRx78dI0tD5eAMWoui3D+RBQOnZ6kD0lN6V8kWuvW8vbju
	Jyh3dR4lBsbNCZ/JdlQ8WpVqKPdq9UiLI2wm3nNt01AlvTwJbmOqWs0d7CMhbk+SYUtS
	jtko27H/kAogqDn5Q4VGz8A+HUAumwkIr+ZG3ussrZGBspoRu3qk55z0LpnzPFJdn9J3
	7hWA==
X-Received: by 10.15.31.197 with SMTP id y45mr39500692eeu.18.1365859813672;
	Sat, 13 Apr 2013 06:30:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm16526392eel.0.2013.04.13.06.30.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:35 +0200
Message-Id: <1365859790-20947-18-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 18/33] xserver-nodm-init: move systemd support from meta-systemd back to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init-2.0}/xserver-nodm.conf       |  0
 .../xserver-nodm-init-2.0}/xserver-nodm.service    |  0
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     | 18 ++++++++++++++--
 .../xserver-nodm-init_2.0.bbappend                 | 25 ----------------------
 4 files changed, 16 insertions(+), 27 deletions(-)
 rename {meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init => meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0}/xserver-nodm.conf (100%)
 rename {meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init => meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0}/xserver-nodm.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend

diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
similarity index 100%
rename from meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.conf
rename to meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service
rename to meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 544ae7f..bbed445 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,14 +3,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r17"
+PR = "r21"
 
 SRC_URI = "file://xserver-nodm \
            file://gplv2-license.patch \
+           file://xserver-nodm.service \
+           file://xserver-nodm.conf \
 "
 S = "${WORKDIR}"
 
-inherit allarch update-rc.d
+inherit allarch update-rc.d systemd
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
@@ -19,6 +21,18 @@ INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
+
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${systemd_unitdir}/system
+	install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
+	install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
 }
 
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
+
+FILES_${PN} += "${sysconfdir}/default/xserver-nodm"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
deleted file mode 100644
index cae5a3c..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bbappend
+++ /dev/null
@@ -1,25 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 3}"
-
-inherit systemd
-
-SRC_URI += "file://xserver-nodm.service \
-            file://xserver-nodm.conf \
-"
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/default
-	install -d ${D}${systemd_unitdir}/system
-        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
-	install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
-}
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
-
-FILES_${PN} += "${sysconfdir}/default/xserver-nodm"
-
-RDEPENDS_${PN} += "xserver-common (>= 1.30) xinit"
-- 
1.8.1.5



