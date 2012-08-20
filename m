Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3NAB-0000TQ-2u
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:16:44 +0200
Received: by wgbdr1 with SMTP id dr1so4519280wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iQIRdeo+E+mavhOJ0WLfrmjTx8+QxRRsCeiMgpui5oA=;
	b=ihx0n0J+LVJu1ntqjBG8WIE51usqIuyqV7GRU/DbX8ozpADXEgb/6lbVDkSu78qttZ
	cjnPu08a8+kQ/18Bo6MgPgSDFPegVkkQ0MMTqcHcjNE9gZjQsanWnU2GMXaI3GHu553T
	npYsNn8DZ92F4dHD/tnib5p5Q4d9f73mivTa9jpT732RIfqtO1pI6I9nPBGgnDqq4fFk
	hIXKihSwYvq8Yz0KSaxsg8bxmgL3MPrsSyVOypfmxq7E+ZZ4rz+1/tmH/MBj7Vwhxxeu
	MxzKILGCfxqDjywDmAqhbrqlOw9+9JCVj//Iy5fADzCufI+SlV0XT3W1h2hb9DcKalNa
	p/Sw==
Received: by 10.216.137.32 with SMTP id x32mr6455061wei.95.1345449881161;
	Mon, 20 Aug 2012 01:04:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm39883780wiz.11.2012.08.20.01.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:04:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:04:39 +0200
Message-Id: <695786ad0fac01f3dff2232a187e95ab7ef864b0.1345449825.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449825.git.Martin.Jansa@gmail.com>
References: <cover.1345449825.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] xf86-video-glamo: disable KMS, fix build with KMS disabled
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
X-List-Received-Date: Mon, 20 Aug 2012 08:16:44 -0000

* RDEPENDS are not needed without KMS
* libdrm in meta-openmoko doesn't provide support for glamo, so not it would fail to build with KMS enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-fix-build-with-KMS-disabled.patch         |   29 ++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |    6 ++--
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-fix-build-with-KMS-disabled.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-fix-build-with-KMS-disabled.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-fix-build-with-KMS-disabled.patch
new file mode 100644
index 0000000..25e8320
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-fix-build-with-KMS-disabled.patch
@@ -0,0 +1,29 @@
+From f485e878bc8bb0e381a38a30009308c82fa8d672 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 16 Aug 2012 08:18:56 +0200
+Subject: [PATCH] fix build with KMS disabled
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/glamo.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/src/glamo.h b/src/glamo.h
+index d4a2f19..5fd5c04 100644
+--- a/src/glamo.h
++++ b/src/glamo.h
+@@ -37,8 +37,11 @@
+ #include "xf86.h"
+ #include "exa.h"
+ #include <linux/fb.h>
++
++#ifdef HAVE_KMS
+ #include <libdrm/drm.h>
+ #include <libdrm/glamo_bo.h>
++#endif
+ 
+ #define GLAMO_REG_BASE(c)		((c)->attr.address[0])
+ #define GLAMO_REG_SIZE(c)		(0x2400)
+-- 
+1.7.8.6
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 5d752db..6fb78ab 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -4,16 +4,16 @@ DEPENDS += "libdrm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
+           file://0001-fix-build-with-KMS-disabled.patch \
           "
 
 S = "${WORKDIR}/git"
 SRCREV = "cb9ed17035a79e49dde26a1e7e2bc5f10fd8144b"
 
-EXTRA_OECONF = " --enable-kms "
+EXTRA_OECONF = " --disable-kms "
-- 
1.7.8.6



