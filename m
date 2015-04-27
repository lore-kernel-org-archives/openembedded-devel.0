Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 54F0165CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:44:48 +0000 (UTC)
Received: by wiun10 with SMTP id n10so1601180wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5ahdM3xaRBa3lDOcGvBAIzH3ta+AEwfkMEDv+MESL80=;
	b=GE7e1f5u6WHBCsHm6EPh9lYRq1rWROIIBbYu1HLBZHeuZ9dE+ZbJVDdeyKR3Z14sKn
	FXxATrxZi4WVjKY69WkINlc0SK1zfku1gDSuqeFln3mQLoJth7WaIbqS9+lTqNDwjYYK
	+rIh32xEK/U1QhbYVPimBI6hENHUms0Rp9dnZD9dUoXUKUyfbkfFiGfe+WzpjLQWnomw
	ZbuA4b0q4jekJF/ut7mpvi0X6ae/EkKkGHTKbZzzJy84ddss/3Edo8FfC/mEk40TysC5
	zUrp17qd9JN5bH+EAzVQq5tJGpP343mhwKZUWDd0BYZz7m5b0gGg857fh8ewfEozYtGw
	98MQ==
X-Received: by 10.194.89.70 with SMTP id bm6mr23893042wjb.146.1430160288987;
	Mon, 27 Apr 2015 11:44:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g5sm22693611wjq.6.2015.04.27.11.44.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:44:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:45:40 +0200
Message-Id: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH 1/4] vala-dbus-binding-tool: upgrade to 0.4.0
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
X-List-Received-Date: Mon, 27 Apr 2015 18:44:49 -0000

* be aware that it's actually newer than 0.4.1 used before
  and it's compatible with gee-0.8 which is newer than gee-1.0
  and yes I know how incorrect it sounds, but it's truth
  I've bumped PE for sane package managers to trust me.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-dbus-binding-tool/vala-dbus-binding-tool.inc              | 7 ++-----
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb         | 4 ++++
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb         | 4 ----
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb           | 4 ++--
 4 files changed, 8 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
 delete mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index 976c087..8d5b239 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -4,15 +4,12 @@ DEPENDS = "vala libgee libxml2 intltool-native"
 HOMEPAGE = "http://wiki.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-PE = "1"
-INC_PR = "r3"
+PE = "2"
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
-SRC_URI = "https://github.com/freesmartphone/vala-dbus-binding-tool/archive/vdbt-${PV}.tar.gz;name=archive"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freesmartphone/sources/${BP}.tar.bz2"
 
 inherit autotools perlnative pkgconfig
 
 BBCLASSEXTEND = "native"
-
-S = "${WORKDIR}/vala-dbus-binding-tool-vdbt-${PV}"
\ No newline at end of file
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
new file mode 100644
index 0000000..0a38772
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
@@ -0,0 +1,4 @@
+require vala-dbus-binding-tool.inc
+
+SRC_URI[md5sum] = "b7537a087f9f468e25170e81df0ed93f"
+SRC_URI[sha256sum] = "6b0d3796e92b031839e2e2f484e294153ad9eaf9d32915056199a49ce8328722"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb
deleted file mode 100644
index c51298b..0000000
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require vala-dbus-binding-tool.inc
-
-SRC_URI[archive.md5sum] = "76540eb575bef04d4250166208c0bb5b"
-SRC_URI[archive.sha256sum] = "656e8fedaac7ab783bbe4bcfb3584c785998792136d8e3fd83e4956613a6e728"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index 32d2818..22e41fb 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -2,8 +2,8 @@ require vala-dbus-binding-tool.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "53d56816a4154e3467f07bd22f4e27d166e3e3f3"
+SRCREV = "742c04c2bb0743891904522ce47e50f9e5c99b12"
 PV = "0.4.0+gitr${SRCPV}"
 
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;branch=master"
+SRC_URI = "git://github.com/freesmartphone/vala-dbus-binding-tool.git;protocol=https"
 S = "${WORKDIR}/git"
-- 
2.3.5


