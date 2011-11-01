Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9o8-0008NW-UH
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:34:57 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983585faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=I8SMvdQEEJccpD7ODO4F6O7gZ4uqmPXviW7G63ILegk=;
	b=Q8nqI1eyMV1Oc+Gg/bAOFrwXM4IIgFk/erCxVWxp7tQ/SVfx0SyE+1ZbF/3p78LJPt
	hnFb6kCOcdzqUY5hrC6cyeep7YVMWI1jnt7mmEZ/gVLMnjb6Ke0KimgiKcwbk4sbIBtM
	/CA4eNWitH4EyKe6mpgoTdKWV1SfVzal/oEUY=
Received: by 10.223.5.66 with SMTP id 2mr35465089fau.26.1320136132780;
	Tue, 01 Nov 2011 01:28:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n25sm43334094fah.15.2011.11.01.01.28.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:42 +0100
Message-Id: <ee84667382ce1466f552b6c9a06d5a6245976af0.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 08/15] task-x11: remove server parts and add VIRTUAL_RUNTIME variables to be able to select different -common and init providers
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
X-List-Received-Date: Tue, 01 Nov 2011 08:34:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tasks/{task-x11.bb => task-x11_1.0.bb}         |   27 ++++++--------------
 1 files changed, 8 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-core/tasks/{task-x11.bb => task-x11_1.0.bb} (46%)

diff --git a/meta-oe/recipes-core/tasks/task-x11.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
similarity index 46%
rename from meta-oe/recipes-core/tasks/task-x11.bb
rename to meta-oe/recipes-core/tasks/task-x11_1.0.bb
index a7faa00..67ff93b 100644
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
+VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 
-RDEPENDS_${PN}-server = "\
-  ${XSERVER} \
-"
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 RDEPENDS_${PN}-utils = "\
-  ${XSERVER_COMMON} \
-  xserver-nodm-init \
+  ${VIRTUAL-RUNTIME_xserver_common} \
+  ${VIRTUAL-RUNTIME_graphical_init_manager} \
   xauth \
   xhost \
   xset \
-- 
1.7.7.1



