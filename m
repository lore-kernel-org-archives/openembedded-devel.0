Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9Lyp-0003QR-Bd
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 22:13:43 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so532118bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EMqvO4Ow+u1P17L59wZYB+tlcnuSyPbOdpLO14NnfaU=;
	b=pthE/QuZa8hU9UOHdFebd5h7xZRYpN1itEnRosYwTiTcoG8nDPMz0VAy0VnTIyddbg
	U4lhxLDqRePhDAxgrb6MyLuEJbkzKMFLYyfmHHVpa8raahJ9ocazRPcD2Hj2VfMlsf2x
	GJ50+RZWDokDfvhdP8uMW+Dpaf4RE/ReGoPUIPEb8wwc+TB3/+VF4MCgzqVFAAEBhczW
	z46eEloc//rO8bFmri4S6spbJz45zIUHXKzigpK5nTvXCo1DwAl1ubMBF6O85A49j80v
	zFiu5CxiF+74jlUwUoj3/up5ZCyLMCyY4+00sq7w7bFAagR25MakanSI3+xdOQ1Eioi8
	Ys3g==
Received: by 10.204.151.81 with SMTP id b17mr10182857bkw.95.1346875282209;
	Wed, 05 Sep 2012 13:01:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm2059945bkv.11.2012.09.05.13.01.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:01:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 22:01:37 +0200
Message-Id: <2ad51f9bd03f2c7f79f54381cde086f6411fb01f.1346875241.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346875241.git.Martin.Jansa@gmail.com>
References: <cover.1346875241.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346875241.git.Martin.Jansa@gmail.com>
References: <cover.1346875241.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/2] task-x11*: remove in favor of packagegroup-core-x11* variants from oe-core
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
X-List-Received-Date: Wed, 05 Sep 2012 20:13:43 -0000

* packagegroup-core-x11* allows to remove task-x11-server and
  task-x11 from meta-oe without loosing any functionality
* be carefull with 2 changed default values:
  XSERVER does not include xf86-input-mouse and xf86-input-keyboard
  VIRTUAL-RUNTIME_xserver_common defaults to x11-common in oe-core
  and to xserver-common in meta-oe's task-x11

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf                           |  1 -
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb | 23 -----------------
 meta-oe/recipes-core/tasks/task-x11_1.0.bb        | 30 -----------------------
 3 files changed, 54 deletions(-)
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11_1.0.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index dcacb32..abb8d47 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,7 +26,6 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal-xinput \
   mplayer-common \
-  task-x11-server \
   fbset-modes \
   gpsd-machine-conf \
 "
diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
deleted file mode 100644
index 7e43d55..0000000
--- a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Task for an image with Xserver"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r9"
-
-inherit task
-
-# for backwards compatibility
-RPROVIDES_${PN} += "task-xserver"
-
-XSERVER ?= "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-video-fbdev \
-           xf86-input-keyboard \
-"
-
-
-RDEPENDS_${PN} = " \
-  ${XSERVER} \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
deleted file mode 100644
index 326e09f..0000000
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "The X Window System -- install this task to get a client/server based display multiplexer."
-SECTION = "x11/server"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r11"
-
-inherit task allarch
-
-PACKAGES += "${PN}-utils"
-
-RRECOMMENDS_${PN} = "\
-  ${PN}-server \
-  ${PN}-utils \
-"
-
-# xserver-common, x11-common
-VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
-
-# elsa or xserver-nodm-init(-systemd)
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
-
-RDEPENDS_${PN}-utils = "\
-  ${VIRTUAL-RUNTIME_xserver_common} \
-  ${VIRTUAL-RUNTIME_graphical_init_manager} \
-  xauth \
-  xhost \
-  xset \
-  xrandr \
-"
-
-- 
1.7.12



