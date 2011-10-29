Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6H3-0006fd-0u
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:25 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2w3JfyOwVvKy9naCfHyUIWFFC7ve0rTN8cut1qTuYcY=;
	b=Ms5Uti1Duglqpe0Ya5UKWXoJdrYucATPUNJc9pJouLM7Pt59qgHBS0vVtrf+qN/pb9
	pVG+FxflIsYQjfLiJPHsr4+/6lVE9Kl0uWCM4PibWXuw3pWH9x7BcPMzATG7BjVAF+tB
	Z9+zDkQ3thHROKHkl40RUWTMcb5N3O/LPZzII=
Received: by 10.223.75.15 with SMTP id w15mr13105313faj.9.1319884224227;
	Sat, 29 Oct 2011 03:30:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k16sm23366851fab.8.2011.10.29.03.30.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:06 +0200
Message-Id: <c5be2d9dea4e1914eb73f39af1517d457ef92f3a.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 10/12] task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be able to select different -common and init providers
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
X-List-Received-Date: Sat, 29 Oct 2011 10:36:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tasks/{task-x11.bb => task-x11_1.0.bb}         |   27 ++++++--------------
 1 files changed, 8 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-core/tasks/{task-x11.bb => task-x11_1.0.bb} (46%)

diff --git a/meta-oe/recipes-core/tasks/task-x11.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
similarity index 46%
rename from meta-oe/recipes-core/tasks/task-x11.bb
rename to meta-oe/recipes-core/tasks/task-x11_1.0.bb
index a7faa00..2cac01a 100644
--- a/meta-oe/recipes-core/tasks/task-x11.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -2,37 +2,26 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PV = "1.0"
-PR = "r8"
-
-# WORK IN PROGRESS
+PR = "r9"
 
 inherit task
 
-PACKAGES += "\
-  ${PN}-server \
-  ${PN}-utils \
-"
+PACKAGES += "${PN}-utils"
 
 RRECOMMENDS_${PN} = "\
   ${PN}-server \
   ${PN}-utils \
 "
 
-# Some machines don't set a *runtime* provider for X, so default to Xfbdev here
-# virtual/xserver won't work, since the kdrive recipes will build multiple xserver packages
-XSERVER ?= "xserver-xorg"
-XSERVER_COMMON ?= "xserver-common"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver-common ?= "xserver-common"
 
-RDEPENDS_${PN}-server = "\
-  ${XSERVER} \
-"
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 RDEPENDS_${PN}-utils = "\
-  ${XSERVER_COMMON} \
-  xserver-nodm-init \
+  ${VIRTUAL-RUNTIME_xserver-common} \
+  ${VIRTUAL-RUNTIME_graphical_init_manager} \
   xauth \
   xhost \
   xset \
-- 
1.7.7.1



