Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYZ-0004Ik-0a
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:07 +0200
Received: by fxi1 with SMTP id 1so3592464fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JvFQV3IZt/E8RTBvGtoekUqHLvfGTMXKad9zPGOX4dI=;
	b=vFsObYakAdKUHV4yUSJQhHpDaqGCLlC4jXWBCOZ3YIhJ0M+eRwnk/ajGLA2Blguuxe
	ymjHELsEzP0TqpRQl71gw6SfoxFIPJ+1Wc3mkZuniiSw+FH/gJxr9lhLXu3dq3NDrNs5
	JywNgsCZ3d/9Z0b/w6V3x1DTirQY6SoDoMI4M=
Received: by 10.223.97.214 with SMTP id m22mr3031775fan.29.1316345032031;
	Sun, 18 Sep 2011 04:23:52 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:51 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:16 +0400
Message-Id: <1316344999-26642-15-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 14/17] opie: fix GPLv2 plus license
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:08 -0000

Some recipes were incorrectly marked as GPL (which means GPLv1), but in
reality they are GPLv2+, mark them so.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-aqpkg/opie-aqpkg.inc             |    2 +-
 .../opie-autorotateapplet.inc                      |    2 +-
 recipes-opie/opie-backup/opie-backup.inc           |    2 +-
 recipes-opie/opie-bartender/opie-bartender.inc     |    2 +-
 .../opie-brightnessapplet.inc                      |    2 +-
 recipes-opie/opie-checkbook/opie-checkbook.inc     |    2 +-
 recipes-opie/opie-drawpad/opie-drawpad.inc         |    2 +-
 recipes-opie/opie-kbill/opie-kbill.inc             |    2 +-
 recipes-opie/opie-odict/opie-odict.inc             |    2 +-
 recipes-opie/opie-oxygen/opie-oxygen.inc           |    2 +-
 recipes-opie/opie-rdesktop/opie-rdesktop.inc       |    2 +-
 recipes-opie/opie-remote/opie-remote.inc           |    2 +-
 recipes-opie/opie-sh/opie-sh.inc                   |    2 +-
 recipes-opie/opie-sshkeys/opie-sshkeys.inc         |    2 +-
 .../opie-today-fortuneplugin.inc                   |    2 +-
 .../opie-today-weatherplugin.inc                   |    2 +-
 recipes-opie/opie-today/opie-today.inc             |    2 +-
 recipes-opie/opie-zlines/opie-zlines.inc           |    2 +-
 recipes-opie/opie-zsame/opie-zsame.inc             |    2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes-opie/opie-aqpkg/opie-aqpkg.inc b/recipes-opie/opie-aqpkg/opie-aqpkg.inc
index 0e2ae9d..86ad8ed 100644
--- a/recipes-opie/opie-aqpkg/opie-aqpkg.inc
+++ b/recipes-opie/opie-aqpkg/opie-aqpkg.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Package Manager"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "aqpkg"
diff --git a/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc b/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
index 0ad79e9..3ba3291 100644
--- a/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
+++ b/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Applet to disable the automatic screen rotation on Zaurus C-models"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "autorotateapplet"
diff --git a/recipes-opie/opie-backup/opie-backup.inc b/recipes-opie/opie-backup/opie-backup.inc
index ea95550..7eb3bc1 100644
--- a/recipes-opie/opie-backup/opie-backup.inc
+++ b/recipes-opie/opie-backup/opie-backup.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Backup and Restore utility."
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "backup"
diff --git a/recipes-opie/opie-bartender/opie-bartender.inc b/recipes-opie/opie-bartender/opie-bartender.inc
index 67062ec..43298fb 100644
--- a/recipes-opie/opie-bartender/opie-bartender.inc
+++ b/recipes-opie/opie-bartender/opie-bartender.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Bartender drink recipe database"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "bartender"
diff --git a/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc b/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
index cef348c..e9cd66d 100644
--- a/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
+++ b/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Brightness Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "brightnessapplet"
diff --git a/recipes-opie/opie-checkbook/opie-checkbook.inc b/recipes-opie/opie-checkbook/opie-checkbook.inc
index a0a1310..4c445ff 100644
--- a/recipes-opie/opie-checkbook/opie-checkbook.inc
+++ b/recipes-opie/opie-checkbook/opie-checkbook.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Checkbook"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "checkbook"
diff --git a/recipes-opie/opie-drawpad/opie-drawpad.inc b/recipes-opie/opie-drawpad/opie-drawpad.inc
index c0b3612..40d7497 100644
--- a/recipes-opie/opie-drawpad/opie-drawpad.inc
+++ b/recipes-opie/opie-drawpad/opie-drawpad.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A note taking program with basic draw tools"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopiecore2 libopieui2 libqtaux2"
diff --git a/recipes-opie/opie-kbill/opie-kbill.inc b/recipes-opie/opie-kbill/opie-kbill.inc
index 50d9b7f..fb05f0c 100644
--- a/recipes-opie/opie-kbill/opie-kbill.inc
+++ b/recipes-opie/opie-kbill/opie-kbill.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The famous hit Bill game"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "kbill"
diff --git a/recipes-opie/opie-odict/opie-odict.inc b/recipes-opie/opie-odict/opie-odict.inc
index 03983c3..c6a437f 100644
--- a/recipes-opie/opie-odict/opie-odict.inc
+++ b/recipes-opie/opie-odict/opie-odict.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Dictionary look-up program"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "odict"
diff --git a/recipes-opie/opie-oxygen/opie-oxygen.inc b/recipes-opie/opie-oxygen/opie-oxygen.inc
index 9fe6d42..fdd592b 100644
--- a/recipes-opie/opie-oxygen/opie-oxygen.inc
+++ b/recipes-opie/opie-oxygen/opie-oxygen.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Oxygen - Periodic table of elements (Chemistry)"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "oxygen"
diff --git a/recipes-opie/opie-rdesktop/opie-rdesktop.inc b/recipes-opie/opie-rdesktop/opie-rdesktop.inc
index b33fd61..664c00e 100644
--- a/recipes-opie/opie-rdesktop/opie-rdesktop.inc
+++ b/recipes-opie/opie-rdesktop/opie-rdesktop.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Remote Desktop Protocol (RDP) Client"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "openssl"
diff --git a/recipes-opie/opie-remote/opie-remote.inc b/recipes-opie/opie-remote/opie-remote.inc
index cbcf8d6..96587b6 100644
--- a/recipes-opie/opie-remote/opie-remote.inc
+++ b/recipes-opie/opie-remote/opie-remote.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A remote control"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "lirc"
diff --git a/recipes-opie/opie-sh/opie-sh.inc b/recipes-opie/opie-sh/opie-sh.inc
index 4415fdc..8bfe795 100644
--- a/recipes-opie/opie-sh/opie-sh.inc
+++ b/recipes-opie/opie-sh/opie-sh.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A QDialog shell frontend"
 SECTION = "opie/shell"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-sh"
diff --git a/recipes-opie/opie-sshkeys/opie-sshkeys.inc b/recipes-opie/opie-sshkeys/opie-sshkeys.inc
index 3108821..68dd76e 100644
--- a/recipes-opie/opie-sshkeys/opie-sshkeys.inc
+++ b/recipes-opie/opie-sshkeys/opie-sshkeys.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Utility for managing ssh-agent keys"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "ssh opie-sh-ssh-askpass"
diff --git a/recipes-opie/opie-today-fortuneplugin/opie-today-fortuneplugin.inc b/recipes-opie/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
index e09ed4e..e543985 100644
--- a/recipes-opie/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
+++ b/recipes-opie/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "'fortune' plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-today libqtaux2"
diff --git a/recipes-opie/opie-today-weatherplugin/opie-today-weatherplugin.inc b/recipes-opie/opie-today-weatherplugin/opie-today-weatherplugin.inc
index 4f72465..3c7b3ed 100644
--- a/recipes-opie/opie-today-weatherplugin/opie-today-weatherplugin.inc
+++ b/recipes-opie/opie-today-weatherplugin/opie-today-weatherplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Weather plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopiecore2 libopiepim2"
diff --git a/recipes-opie/opie-today/opie-today.inc b/recipes-opie/opie-today/opie-today.inc
index 4600944..60355c3 100644
--- a/recipes-opie/opie-today/opie-today.inc
+++ b/recipes-opie/opie-today/opie-today.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Today screen application"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "today"
diff --git a/recipes-opie/opie-zlines/opie-zlines.inc b/recipes-opie/opie-zlines/opie-zlines.inc
index 83017c6..c6c96b6 100644
--- a/recipes-opie/opie-zlines/opie-zlines.inc
+++ b/recipes-opie/opie-zlines/opie-zlines.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "ZLines"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "zlines"
diff --git a/recipes-opie/opie-zsame/opie-zsame.inc b/recipes-opie/opie-zsame/opie-zsame.inc
index 6998cab..e1d5fbc 100644
--- a/recipes-opie/opie-zsame/opie-zsame.inc
+++ b/recipes-opie/opie-zsame/opie-zsame.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "ZSame"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "zsame"
-- 
1.7.2.5



