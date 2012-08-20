Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3NAS-0000ck-MI
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:17:00 +0200
Received: by wibhn17 with SMTP id hn17so3069734wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4RoqQUTF42RpNO19pQ+bjS8a/8Ez4TTbnMqb/0DSigk=;
	b=dnp5K81GfaCei7uzHj+SWHg2d7jK7UBpwYdUsJj2d2Omkt8g8ejrmuajsQXbE19VGY
	6QwC0pTq7rMbqHkjdcqGyWlwhHJF/+K27Ktg8xrIVfOSrKztQyxp28CLLazUOqzoh1Nm
	/rDdnmT830dAhk5e+ECIqhkZMXc/qOAuGCCc0pbFWhZ6diAYPpjW2TSD0tieg0WT7c0z
	ISkcB/e2B2N2r8Cr8WmpD4Z6cCX9zODnE5bxhz9zsOgNFzyukmFvtZxW8ddWLyYRbsZ9
	vZuPHL+gQRE9n5JcYW5brtN1FDe/w7sM5BBSYIjm2RJ42wyDFQB92dE6NEZmhOVbiB0K
	VKPA==
Received: by 10.180.97.106 with SMTP id dz10mr26763819wib.21.1345449898729;
	Mon, 20 Aug 2012 01:04:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm26838970wiz.1.2012.08.20.01.04.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:04:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:04:41 +0200
Message-Id: <f1b3d559f7fda42a2aaeee8bc277e03d00f138a9.1345449825.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <695786ad0fac01f3dff2232a187e95ab7ef864b0.1345449825.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
	<695786ad0fac01f3dff2232a187e95ab7ef864b0.1345449825.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449825.git.Martin.Jansa@gmail.com>
References: <cover.1345449825.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] xserver-common: add support for tuna
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
X-List-Received-Date: Mon, 20 Aug 2012 08:17:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...mon-add-support-for-tuna-alias-Galaxy-Nex.patch |   33 ++++++++++++++++++++
 .../xserver-common/xserver-common_1.34.bb          |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
new file mode 100644
index 0000000..49321eb
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
@@ -0,0 +1,33 @@
+From 176c3bd3d86c223fd44b0f15b62d38526bb3b0d2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 17 Aug 2012 13:00:56 +0200
+Subject: [PATCH 13/13] xserver-common: add support for tuna alias Galaxy
+ Nexus
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ X11/xserver-common |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index d9325dd..017e5ae 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -169,6 +169,14 @@ else
+                 ARGS="$ARGS -dpi ${DPI} -nocursor"
+             fi
+             ;;
++        "tuna")
++            DPI="316"
++            if [ "$XSERVER" != "Xorg" ] ; then
++                ARGS="$ARGS -screen ${SCREEN_SIZE}"
++            else
++                ARGS="$ARGS -dpi ${DPI} -nocursor"
++            fi
++            ;;
+         "motorola_ezx_platform")
+             ARGS="$ARGS -screen 240x320"
+             DPI="170" ;;
+-- 
+1.7.8.6
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index a7e8191..f307419 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r7"
+PR = "r8"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -22,6 +22,7 @@ SRC_URI_append = " \
   file://0010-xserver-common-add-support-for-nexus-S-alias-herring.patch \
   file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch \
   file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
+  file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
 "
 
 do_install_append() {
-- 
1.7.8.6



