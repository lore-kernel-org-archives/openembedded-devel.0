Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id E8C6861883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 23:26:26 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so2645442pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2013 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dJZYyZN6SIhCqTP1DsJroOgfdZid9GSQ1zCR8SUhGkw=;
	b=l9x/WxxA5TRa7kWUBK/+JYUvtlKNv8zuhwwKO9N9G6o5DuucY/5lujYrlI7OnO5xhA
	hP6D4FIrk01BcE3DiHWgY6zFF53DaZEz8G5YUS59Th5cVdoOTOt3dXih696WtYsObl7B
	mOB3CIYJO/NDJfrlwBsEQRoosb21uVGtaStODGA5KaPv00aVyM+hhfrX5fpurxdkUDG0
	riPVSdSsPwo2liExHA+0MuPJqbvrzWil+r0HM8tnaECadUaQ2efdeSn938mn6cD7L2Co
	RpkUpX2EZ0g7o25Y6cOoYvanywVW33K3YpozkbuXTuqLqp/Zk1TmIb1jCN/T/3HKqFbF
	wZDw==
X-Received: by 10.68.96.133 with SMTP id ds5mr4448823pbb.169.1375399587634;
	Thu, 01 Aug 2013 16:26:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id iu7sm6422877pbc.8.2013.08.01.16.26.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 16:26:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Aug 2013 16:26:12 -0700
Message-Id: <1375399572-4926-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-kde][PATCH] qt4: Rename bbappend to match oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 23:26:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-misc-support/qt4-native_4.8.4.bbappend   |    9 ---------
 recipes-misc-support/qt4-native_4.8.5.bbappend   |    9 +++++++++
 recipes-misc-support/qt4-x11-free_4.8.4.bbappend |   11 -----------
 recipes-misc-support/qt4-x11-free_4.8.5.bbappend |   11 +++++++++++
 4 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 recipes-misc-support/qt4-native_4.8.4.bbappend
 create mode 100644 recipes-misc-support/qt4-native_4.8.5.bbappend
 delete mode 100644 recipes-misc-support/qt4-x11-free_4.8.4.bbappend
 create mode 100644 recipes-misc-support/qt4-x11-free_4.8.5.bbappend

diff --git a/recipes-misc-support/qt4-native_4.8.4.bbappend b/recipes-misc-support/qt4-native_4.8.4.bbappend
deleted file mode 100644
index b6ee9f2..0000000
--- a/recipes-misc-support/qt4-native_4.8.4.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# Needed by kdelibs4-native
-DEPENDS += "openssl-native"
-PRINC := "${@int(PRINC) + 1}"
-
-EXTRA_OECONF += "-no-pch -no-sm -openssl"
-
-TOBUILD += "src/phonon"
-
-PRINC := "${@int(PRINC) + 1}"
diff --git a/recipes-misc-support/qt4-native_4.8.5.bbappend b/recipes-misc-support/qt4-native_4.8.5.bbappend
new file mode 100644
index 0000000..b6ee9f2
--- /dev/null
+++ b/recipes-misc-support/qt4-native_4.8.5.bbappend
@@ -0,0 +1,9 @@
+# Needed by kdelibs4-native
+DEPENDS += "openssl-native"
+PRINC := "${@int(PRINC) + 1}"
+
+EXTRA_OECONF += "-no-pch -no-sm -openssl"
+
+TOBUILD += "src/phonon"
+
+PRINC := "${@int(PRINC) + 1}"
diff --git a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
deleted file mode 100644
index 9d13ffa..0000000
--- a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-DEPENDS_append_omap3 = " libgles-omap3"
-DEPENDS_append_ti33x = " libgles-omap3"
-PRINC := "${@int(PRINC) + 3}"
-
-#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
-QT_CONFIG_FLAGS_append = " --reduce-exports"
-
-# Build OpenGL/ES support if available
-QT_GLFLAGS_omap3 = "-opengl es2 "
-# Needed by kdelibs
-QT_DISTRO_FLAGS = "-accessibility -sm"
diff --git a/recipes-misc-support/qt4-x11-free_4.8.5.bbappend b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
new file mode 100644
index 0000000..9d13ffa
--- /dev/null
+++ b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
@@ -0,0 +1,11 @@
+DEPENDS_append_omap3 = " libgles-omap3"
+DEPENDS_append_ti33x = " libgles-omap3"
+PRINC := "${@int(PRINC) + 3}"
+
+#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
+QT_CONFIG_FLAGS_append = " --reduce-exports"
+
+# Build OpenGL/ES support if available
+QT_GLFLAGS_omap3 = "-opengl es2 "
+# Needed by kdelibs
+QT_DISTRO_FLAGS = "-accessibility -sm"
-- 
1.7.9.5


