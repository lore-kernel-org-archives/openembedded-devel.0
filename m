Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYb-0004JD-P4
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:10 +0200
Received: by fxi1 with SMTP id 1so3592499fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ehY02jLjt2HxGmcP9CG6TM64v/iicyRIdYUHH4bG1sA=;
	b=f7NPbQCAkxBAznIFBD+jgIutJb8n3vGDgLH6zewopvVnoUwbbhBBn3mU+LEavoE9G+
	jIyDnlkz+TJKwSO7oBUKVdMg9idZGzQyGrYSuuNmMd6E+x2xCDT7gPT/lZgwpdz0i805
	NYbCbuq5OrNFcBQUlexAiTtTmB7PBK4P6eS48=
Received: by 10.223.88.83 with SMTP id z19mr3043552fal.11.1316345033504;
	Sun, 18 Sep 2011 04:23:53 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:52 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:17 +0400
Message-Id: <1316344999-26642-16-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 15/17] opie: mass-correct licesnses for LGPL packages
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:10 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2.inc                  |    2 +-
 recipes-opie/opie-bounce/opie-bounce.inc           |    4 ++--
 recipes-opie/opie-buzzword/opie-buzzword.inc       |    4 ++--
 recipes-opie/opie-cardapplet/opie-cardapplet.inc   |    4 ++--
 recipes-opie/opie-ftplib/opie-ftplib.inc           |    4 ++--
 .../opie-packagemanager/opie-packagemanager.inc    |    4 ++--
 .../opie-pimconverter/opie-pimconverter.inc        |    4 ++--
 .../opie-rotateapplet/opie-rotateapplet.inc        |    4 ++--
 recipes-opie/opie-systemtime/opie-systemtime.inc   |    4 ++--
 recipes-opie/opie-todo/opie-todo.inc               |    4 ++--
 recipes-opie/opie-vmemo/opie-vmemo.inc             |    2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/recipes-opie/libopie/libopie2.inc b/recipes-opie/libopie/libopie2.inc
index f64742d..adb26ed 100644
--- a/recipes-opie/libopie/libopie2.inc
+++ b/recipes-opie/libopie/libopie2.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Base libraries for the Open Palmtop Integrated Environment"
 HOMEPAGE = "http://opie.sourceforge.net"
 SECTION = "opie/libs"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 I18N_FILES = "libopiecore2.ts libopiesecurity2.ts"
diff --git a/recipes-opie/opie-bounce/opie-bounce.inc b/recipes-opie/opie-bounce/opie-bounce.inc
index dca59c4..386aa70 100644
--- a/recipes-opie/opie-bounce/opie-bounce.inc
+++ b/recipes-opie/opie-bounce/opie-bounce.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "bounce"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 APPNAME = "bounce"
 
 
diff --git a/recipes-opie/opie-buzzword/opie-buzzword.inc b/recipes-opie/opie-buzzword/opie-buzzword.inc
index b8543f3..d1895f5 100644
--- a/recipes-opie/opie-buzzword/opie-buzzword.inc
+++ b/recipes-opie/opie-buzzword/opie-buzzword.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "BuzzWord Bingo"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 APPNAME = "buzzword"
 
 
diff --git a/recipes-opie/opie-cardapplet/opie-cardapplet.inc b/recipes-opie/opie-cardapplet/opie-cardapplet.inc
index 807cf85..e6c7aad 100644
--- a/recipes-opie/opie-cardapplet/opie-cardapplet.inc
+++ b/recipes-opie/opie-cardapplet/opie-cardapplet.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "CF/SD/PCMCIA Card Monitor applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 APPNAME = "cardapplet"
 I18N_FILES = "libcardapplet.ts"
 
diff --git a/recipes-opie/opie-ftplib/opie-ftplib.inc b/recipes-opie/opie-ftplib/opie-ftplib.inc
index 3e6c325..a8d4bc0 100644
--- a/recipes-opie/opie-ftplib/opie-ftplib.inc
+++ b/recipes-opie/opie-ftplib/opie-ftplib.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Opie FTP Library"
 SECTION = "opie/libs"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 I18N_FILES = "libftplib.ts"
 APPNAME = "opie-ftplib"
 
diff --git a/recipes-opie/opie-packagemanager/opie-packagemanager.inc b/recipes-opie/opie-packagemanager/opie-packagemanager.inc
index caddabf..f72b2f0 100644
--- a/recipes-opie/opie-packagemanager/opie-packagemanager.inc
+++ b/recipes-opie/opie-packagemanager/opie-packagemanager.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Opie Package Manager"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 DEPENDS = "opkg"
 APPNAME = "packagemanager"
 
diff --git a/recipes-opie/opie-pimconverter/opie-pimconverter.inc b/recipes-opie/opie-pimconverter/opie-pimconverter.inc
index 7687eef..6ec21c4 100644
--- a/recipes-opie/opie-pimconverter/opie-pimconverter.inc
+++ b/recipes-opie/opie-pimconverter/opie-pimconverter.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Opie PIM database converter"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 DEPENDS = "sqlite3 sqlite" 
 RDEPENDS_${PN} = "sqlite3 sqlite-bin" 
 
diff --git a/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc b/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc
index e990e29..2a8930f 100644
--- a/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc
+++ b/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Rotate Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 APPNAME = "rotateapplet"
 
 
diff --git a/recipes-opie/opie-systemtime/opie-systemtime.inc b/recipes-opie/opie-systemtime/opie-systemtime.inc
index 952bb1c..727d8d1 100644
--- a/recipes-opie/opie-systemtime/opie-systemtime.inc
+++ b/recipes-opie/opie-systemtime/opie-systemtime.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Set the system time - utilizing ntpdate, if available."
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 RRECOMMENDS_${PN} = "ntpdate"
 
 APPNAME = "systemtime"
diff --git a/recipes-opie/opie-todo/opie-todo.inc b/recipes-opie/opie-todo/opie-todo.inc
index 4771786..b2b7673 100644
--- a/recipes-opie/opie-todo/opie-todo.inc
+++ b/recipes-opie/opie-todo/opie-todo.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Todo list manager"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "LGPLv2+"
 # FIXME stopgap until split archives have license files included
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
 RDEPENDS_${PN} = "opie-pics"
 APPNAME = "todolist"
 
diff --git a/recipes-opie/opie-vmemo/opie-vmemo.inc b/recipes-opie/opie-vmemo/opie-vmemo.inc
index fe6e5cf..758846c 100644
--- a/recipes-opie/opie-vmemo/opie-vmemo.inc
+++ b/recipes-opie/opie-vmemo/opie-vmemo.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Voice Memo Recorder Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "LGPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-vmemo-settings"
-- 
1.7.2.5



