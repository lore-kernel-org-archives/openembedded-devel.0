Received: from mail-fx0-f65.google.com ([209.85.161.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eN-0001Wk-EH
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:31 +0200
Received: by mail-fx0-f65.google.com with SMTP id 20so290398fxm.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=vO1UJ/6z7/OJGBYH5g/4iXdJVeifER4ds9s5QT+9p3Q=;
	b=OVnxlQOHa1sZzWETAcHmo71ttGvMg1eNxdtE1putO+vxKWYwdH98MUdMHydYtGmYjE
	VtVLPyFSPWTNp49ieWrpXMsdBMWF/4CRdB6RndhEX7wWUos1d0WGwUOCeJ0Fa91KhvcF
	IFUTpt8wZIhMb3LbqmH85h7ev5aU3hSVaCbC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uyfszhExon4TUS2XKudNLM0916/h8Qc9n5qxNSyb0x0pVkZKaJcLPeO6c8DUi7SW/K
	AeL4ClxaPLrSVUxloRlcFSriplW1WgRUeR2f0V7rLXuUSHPT6Fob9VCjI7JA48X7cyr8
	93BH27XNZYFJg8W8N7Fem3Fb+gBN2Xir+E8i0=
Received: by 10.102.244.13 with SMTP id r13mr1839892muh.14.1287477235559;
	Tue, 19 Oct 2010 01:33:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f28sm4732041faa.0.2010.10.19.01.33.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:20 +0200
Message-Id: <1287477207-27752-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.65
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/13] openmoko: obsolete tasks and images, openmoko as distribution was obsoleted on Aug 10, 2010.
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/openmoko-panel-plugin.bbclass              |    6 -
 recipes/images/minimal-openmoko-image.bb           |   21 ---
 recipes/images/openmoko-devel-image.bb             |    3 -
 recipes/images/openmoko-image.bb                   |   21 ---
 recipes/images/openmoko-minimal-image.bb           |   21 ---
 recipes/images/openmoko-python-devel-image.bb      |    7 -
 recipes/images/openmoko-sdk-image.bb               |    3 -
 recipes/meta/meta-toolchain-openmoko.bb            |    7 -
 recipes/meta/openmoko-feed.bb                      |   10 --
 .../obsolete/classes/openmoko-panel-plugin.bbclass |    6 +
 recipes/obsolete/images/minimal-openmoko-image.bb  |   21 +++
 recipes/obsolete/images/openmoko-devel-image.bb    |    3 +
 recipes/obsolete/images/openmoko-image.bb          |   21 +++
 recipes/obsolete/images/openmoko-minimal-image.bb  |   21 +++
 .../obsolete/images/openmoko-python-devel-image.bb |    7 +
 recipes/obsolete/images/openmoko-sdk-image.bb      |    3 +
 recipes/obsolete/meta/meta-toolchain-openmoko.bb   |    7 +
 recipes/obsolete/meta/openmoko-feed.bb             |   10 ++
 .../openmoko-base/openmoko-session/session         |   24 +++
 .../obsolete/openmoko-base/openmoko-session_svn.bb |   32 ++++
 .../openmoko-panel-battery_svn.bb                  |    7 +
 .../openmoko-panel-bt_svn.bb                       |    8 +
 .../openmoko-panel-clock_svn.bb                    |    6 +
 .../openmoko-panel-gps_svn.bb                      |    7 +
 .../openmoko-panel-gsm_svn.bb                      |    7 +
 .../openmoko-panel-mainmenu_svn.bb                 |    8 +
 .../openmoko-panel-memory_svn.bb                   |    8 +
 .../openmoko-panel-usb_svn.bb                      |    6 +
 .../openmoko-panel-wifi_svn.bb                     |    7 +
 recipes/obsolete/openmoko2/openmoko-session2.bb    |   53 +++++++
 .../openmoko-session2/etc/matchbox/session         |   12 ++
 .../openmoko2/openmoko-session2/matchbox-session   |   24 +++
 recipes/obsolete/tasks/task-openmoko-base.bb       |   31 ++++
 recipes/obsolete/tasks/task-openmoko-debug.bb      |   38 +++++
 recipes/obsolete/tasks/task-openmoko-examples.bb   |    6 +
 recipes/obsolete/tasks/task-openmoko-feed.bb       |  157 ++++++++++++++++++++
 recipes/obsolete/tasks/task-openmoko-games.bb      |   15 ++
 recipes/obsolete/tasks/task-openmoko-linux.bb      |   19 +++
 recipes/obsolete/tasks/task-openmoko-native-sdk.bb |   41 +++++
 recipes/obsolete/tasks/task-openmoko-net.bb        |   15 ++
 recipes/obsolete/tasks/task-openmoko-phone.bb      |   19 +++
 recipes/obsolete/tasks/task-openmoko-pim.bb        |   23 +++
 .../obsolete/tasks/task-openmoko-python-devel.bb   |   11 ++
 .../obsolete/tasks/task-openmoko-toolchain-host.bb |   15 ++
 .../tasks/task-openmoko-toolchain-target.bb        |   23 +++
 recipes/obsolete/tasks/task-openmoko-ui.bb         |   58 +++++++
 recipes/obsolete/tasks/task-openmoko.bb            |   31 ++++
 recipes/openmoko-base/openmoko-session/session     |   24 ---
 recipes/openmoko-base/openmoko-session_svn.bb      |   32 ----
 .../openmoko-panel-battery_svn.bb                  |    7 -
 .../openmoko-panel-bt_svn.bb                       |    8 -
 .../openmoko-panel-clock_svn.bb                    |    6 -
 .../openmoko-panel-gps_svn.bb                      |    7 -
 .../openmoko-panel-gsm_svn.bb                      |    7 -
 .../openmoko-panel-mainmenu_svn.bb                 |    8 -
 .../openmoko-panel-memory_svn.bb                   |    8 -
 .../openmoko-panel-usb_svn.bb                      |    6 -
 .../openmoko-panel-wifi_svn.bb                     |    7 -
 recipes/openmoko2/openmoko-session2.bb             |   53 -------
 .../openmoko-session2/etc/matchbox/session         |   12 --
 .../openmoko2/openmoko-session2/matchbox-session   |   24 ---
 recipes/tasks/task-openmoko-base.bb                |   31 ----
 recipes/tasks/task-openmoko-debug.bb               |   38 -----
 recipes/tasks/task-openmoko-examples.bb            |    6 -
 recipes/tasks/task-openmoko-feed.bb                |  157 --------------------
 recipes/tasks/task-openmoko-games.bb               |   15 --
 recipes/tasks/task-openmoko-linux.bb               |   19 ---
 recipes/tasks/task-openmoko-native-sdk.bb          |   41 -----
 recipes/tasks/task-openmoko-net.bb                 |   15 --
 recipes/tasks/task-openmoko-phone.bb               |   19 ---
 recipes/tasks/task-openmoko-pim.bb                 |   23 ---
 recipes/tasks/task-openmoko-python-devel.bb        |   11 --
 recipes/tasks/task-openmoko-toolchain-host.bb      |   15 --
 recipes/tasks/task-openmoko-toolchain-target.bb    |   23 ---
 recipes/tasks/task-openmoko-ui.bb                  |   58 -------
 recipes/tasks/task-openmoko.bb                     |   31 ----
 76 files changed, 810 insertions(+), 810 deletions(-)
 delete mode 100644 classes/openmoko-panel-plugin.bbclass
 delete mode 100644 recipes/images/minimal-openmoko-image.bb
 delete mode 100644 recipes/images/openmoko-devel-image.bb
 delete mode 100644 recipes/images/openmoko-image.bb
 delete mode 100644 recipes/images/openmoko-minimal-image.bb
 delete mode 100644 recipes/images/openmoko-python-devel-image.bb
 delete mode 100644 recipes/images/openmoko-sdk-image.bb
 delete mode 100644 recipes/meta/meta-toolchain-openmoko.bb
 delete mode 100644 recipes/meta/openmoko-feed.bb
 create mode 100644 recipes/obsolete/classes/openmoko-panel-plugin.bbclass
 create mode 100644 recipes/obsolete/images/minimal-openmoko-image.bb
 create mode 100644 recipes/obsolete/images/openmoko-devel-image.bb
 create mode 100644 recipes/obsolete/images/openmoko-image.bb
 create mode 100644 recipes/obsolete/images/openmoko-minimal-image.bb
 create mode 100644 recipes/obsolete/images/openmoko-python-devel-image.bb
 create mode 100644 recipes/obsolete/images/openmoko-sdk-image.bb
 create mode 100644 recipes/obsolete/meta/meta-toolchain-openmoko.bb
 create mode 100644 recipes/obsolete/meta/openmoko-feed.bb
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-session/session
 create mode 100644 recipes/obsolete/openmoko-base/openmoko-session_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
 create mode 100644 recipes/obsolete/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-session2.bb
 create mode 100755 recipes/obsolete/openmoko2/openmoko-session2/etc/matchbox/session
 create mode 100755 recipes/obsolete/openmoko2/openmoko-session2/matchbox-session
 create mode 100644 recipes/obsolete/tasks/task-openmoko-base.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-debug.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-examples.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-feed.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-games.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-linux.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-native-sdk.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-net.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-phone.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-pim.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-python-devel.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-toolchain-host.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-toolchain-target.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko-ui.bb
 create mode 100644 recipes/obsolete/tasks/task-openmoko.bb
 delete mode 100644 recipes/openmoko-base/openmoko-session/session
 delete mode 100644 recipes/openmoko-base/openmoko-session_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
 delete mode 100644 recipes/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-session2.bb
 delete mode 100755 recipes/openmoko2/openmoko-session2/etc/matchbox/session
 delete mode 100755 recipes/openmoko2/openmoko-session2/matchbox-session
 delete mode 100644 recipes/tasks/task-openmoko-base.bb
 delete mode 100644 recipes/tasks/task-openmoko-debug.bb
 delete mode 100644 recipes/tasks/task-openmoko-examples.bb
 delete mode 100644 recipes/tasks/task-openmoko-feed.bb
 delete mode 100644 recipes/tasks/task-openmoko-games.bb
 delete mode 100644 recipes/tasks/task-openmoko-linux.bb
 delete mode 100644 recipes/tasks/task-openmoko-native-sdk.bb
 delete mode 100644 recipes/tasks/task-openmoko-net.bb
 delete mode 100644 recipes/tasks/task-openmoko-phone.bb
 delete mode 100644 recipes/tasks/task-openmoko-pim.bb
 delete mode 100644 recipes/tasks/task-openmoko-python-devel.bb
 delete mode 100644 recipes/tasks/task-openmoko-toolchain-host.bb
 delete mode 100644 recipes/tasks/task-openmoko-toolchain-target.bb
 delete mode 100644 recipes/tasks/task-openmoko-ui.bb
 delete mode 100644 recipes/tasks/task-openmoko.bb

diff --git a/classes/openmoko-panel-plugin.bbclass b/classes/openmoko-panel-plugin.bbclass
deleted file mode 100644
index 6a22a92..0000000
--- a/classes/openmoko-panel-plugin.bbclass
+++ /dev/null
@@ -1,6 +0,0 @@
-SECTION = "openmoko/panel-plugin"
-DEPENDS += "matchbox-panel-2 libmokopanelui2"
-
-inherit openmoko2
-
-FILES_${PN} = "${libdir}/matchbox-panel/lib*.so* ${datadir}"
diff --git a/recipes/images/minimal-openmoko-image.bb b/recipes/images/minimal-openmoko-image.bb
deleted file mode 100644
index 70658fd..0000000
--- a/recipes/images/minimal-openmoko-image.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-#------------------------------------------------------
-# Minimal Openmoko Image Recipe
-# This should only have the base system + dialer
-# #------------------------------------------------------
-
-IMAGE_LINGUAS = ""
-ANGSTROM_EXTRA_INSTALL ?= ""
-
-IMAGE_INSTALL = "\
-  task-base \
-  ${ANGSTROM_EXTRA_INSTALL} \
-  task-openmoko-linux \
-  task-openmoko-net \
-  task-openmoko-ui \
-  task-openmoko-base \
-  task-openmoko-phone \
-  "
-
-inherit image
-
-ROOTFS_POSTPROCESS_COMMAND += 'date "+%m%d%H%M%Y" >${IMAGE_ROOTFS}/etc/timestamp'
diff --git a/recipes/images/openmoko-devel-image.bb b/recipes/images/openmoko-devel-image.bb
deleted file mode 100644
index 3b2111e..0000000
--- a/recipes/images/openmoko-devel-image.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require openmoko-image.bb
-
-IMAGE_INSTALL += "task-openmoko-debug"
diff --git a/recipes/images/openmoko-image.bb b/recipes/images/openmoko-image.bb
deleted file mode 100644
index 48b0d7d..0000000
--- a/recipes/images/openmoko-image.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-#------------------------------------------------------
-# Openmoko Image Recipe
-#------------------------------------------------------
-
-require openmoko-minimal-image.bb
-
-IMAGE_INSTALL += "\
-  task-openmoko-net \
-  task-openmoko-ui \
-  task-openmoko-base \
-  task-openmoko-phone \
-  task-openmoko-games \
-  task-openmoko-pim \
-  "
-
-DEPENDS += "\
-  task-openmoko \
-  "
-
-inherit image
-
diff --git a/recipes/images/openmoko-minimal-image.bb b/recipes/images/openmoko-minimal-image.bb
deleted file mode 100644
index 678400f..0000000
--- a/recipes/images/openmoko-minimal-image.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-#------------------------------------------------------
-# Openmoko Minimal Image Recipe
-# other openmoko images should include this.
-# -----------------------------------------------------
-
-IMAGE_LINGUAS = ""
-
-IMAGE_INSTALL = "\
-  ${MACHINE_TASK_PROVIDER} \
-  task-openmoko-linux \
-  "
-
-DEPENDS = "\
-  ${MACHINE_TASK_PROVIDER} \
-  task-openmoko-linux \
-  "
-
-
-inherit image
-
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp;"
diff --git a/recipes/images/openmoko-python-devel-image.bb b/recipes/images/openmoko-python-devel-image.bb
deleted file mode 100644
index 615042f..0000000
--- a/recipes/images/openmoko-python-devel-image.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require openmoko-image.bb
-
-IMAGE_INSTALL += "\
-  task-openmoko-python-devel \
-  task-python-efl-examples \
-  edje-viewer \
-"
diff --git a/recipes/images/openmoko-sdk-image.bb b/recipes/images/openmoko-sdk-image.bb
deleted file mode 100644
index 8595808..0000000
--- a/recipes/images/openmoko-sdk-image.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require openmoko-devel-image.bb
-
-IMAGE_INSTALL += "task-openmoko-native-sdk"
diff --git a/recipes/meta/meta-toolchain-openmoko.bb b/recipes/meta/meta-toolchain-openmoko.bb
deleted file mode 100644
index b265615..0000000
--- a/recipes/meta/meta-toolchain-openmoko.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-PR = "r2"
-
-TOOLCHAIN_TARGET_TASK = "task-openmoko-toolchain-target"
-TOOLCHAIN_HOST_TASK = "task-openmoko-toolchain-host"
-
-require meta-toolchain.bb
-SDK_SUFFIX = "toolchain-openmoko"
diff --git a/recipes/meta/openmoko-feed.bb b/recipes/meta/openmoko-feed.bb
deleted file mode 100644
index 21bdbc6..0000000
--- a/recipes/meta/openmoko-feed.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Meta-package for Openmoko Misc. Feed Items"
-LICENSE = "MIT"
-
-RDEPENDS_${PN} = "\
-  task-openmoko-debug \
-  task-openmoko-native-sdk \
-  task-openmoko-feed \
-"
-
-inherit meta
diff --git a/recipes/obsolete/classes/openmoko-panel-plugin.bbclass b/recipes/obsolete/classes/openmoko-panel-plugin.bbclass
new file mode 100644
index 0000000..6a22a92
--- /dev/null
+++ b/recipes/obsolete/classes/openmoko-panel-plugin.bbclass
@@ -0,0 +1,6 @@
+SECTION = "openmoko/panel-plugin"
+DEPENDS += "matchbox-panel-2 libmokopanelui2"
+
+inherit openmoko2
+
+FILES_${PN} = "${libdir}/matchbox-panel/lib*.so* ${datadir}"
diff --git a/recipes/obsolete/images/minimal-openmoko-image.bb b/recipes/obsolete/images/minimal-openmoko-image.bb
new file mode 100644
index 0000000..70658fd
--- /dev/null
+++ b/recipes/obsolete/images/minimal-openmoko-image.bb
@@ -0,0 +1,21 @@
+#------------------------------------------------------
+# Minimal Openmoko Image Recipe
+# This should only have the base system + dialer
+# #------------------------------------------------------
+
+IMAGE_LINGUAS = ""
+ANGSTROM_EXTRA_INSTALL ?= ""
+
+IMAGE_INSTALL = "\
+  task-base \
+  ${ANGSTROM_EXTRA_INSTALL} \
+  task-openmoko-linux \
+  task-openmoko-net \
+  task-openmoko-ui \
+  task-openmoko-base \
+  task-openmoko-phone \
+  "
+
+inherit image
+
+ROOTFS_POSTPROCESS_COMMAND += 'date "+%m%d%H%M%Y" >${IMAGE_ROOTFS}/etc/timestamp'
diff --git a/recipes/obsolete/images/openmoko-devel-image.bb b/recipes/obsolete/images/openmoko-devel-image.bb
new file mode 100644
index 0000000..3b2111e
--- /dev/null
+++ b/recipes/obsolete/images/openmoko-devel-image.bb
@@ -0,0 +1,3 @@
+require openmoko-image.bb
+
+IMAGE_INSTALL += "task-openmoko-debug"
diff --git a/recipes/obsolete/images/openmoko-image.bb b/recipes/obsolete/images/openmoko-image.bb
new file mode 100644
index 0000000..48b0d7d
--- /dev/null
+++ b/recipes/obsolete/images/openmoko-image.bb
@@ -0,0 +1,21 @@
+#------------------------------------------------------
+# Openmoko Image Recipe
+#------------------------------------------------------
+
+require openmoko-minimal-image.bb
+
+IMAGE_INSTALL += "\
+  task-openmoko-net \
+  task-openmoko-ui \
+  task-openmoko-base \
+  task-openmoko-phone \
+  task-openmoko-games \
+  task-openmoko-pim \
+  "
+
+DEPENDS += "\
+  task-openmoko \
+  "
+
+inherit image
+
diff --git a/recipes/obsolete/images/openmoko-minimal-image.bb b/recipes/obsolete/images/openmoko-minimal-image.bb
new file mode 100644
index 0000000..678400f
--- /dev/null
+++ b/recipes/obsolete/images/openmoko-minimal-image.bb
@@ -0,0 +1,21 @@
+#------------------------------------------------------
+# Openmoko Minimal Image Recipe
+# other openmoko images should include this.
+# -----------------------------------------------------
+
+IMAGE_LINGUAS = ""
+
+IMAGE_INSTALL = "\
+  ${MACHINE_TASK_PROVIDER} \
+  task-openmoko-linux \
+  "
+
+DEPENDS = "\
+  ${MACHINE_TASK_PROVIDER} \
+  task-openmoko-linux \
+  "
+
+
+inherit image
+
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp;"
diff --git a/recipes/obsolete/images/openmoko-python-devel-image.bb b/recipes/obsolete/images/openmoko-python-devel-image.bb
new file mode 100644
index 0000000..615042f
--- /dev/null
+++ b/recipes/obsolete/images/openmoko-python-devel-image.bb
@@ -0,0 +1,7 @@
+require openmoko-image.bb
+
+IMAGE_INSTALL += "\
+  task-openmoko-python-devel \
+  task-python-efl-examples \
+  edje-viewer \
+"
diff --git a/recipes/obsolete/images/openmoko-sdk-image.bb b/recipes/obsolete/images/openmoko-sdk-image.bb
new file mode 100644
index 0000000..8595808
--- /dev/null
+++ b/recipes/obsolete/images/openmoko-sdk-image.bb
@@ -0,0 +1,3 @@
+require openmoko-devel-image.bb
+
+IMAGE_INSTALL += "task-openmoko-native-sdk"
diff --git a/recipes/obsolete/meta/meta-toolchain-openmoko.bb b/recipes/obsolete/meta/meta-toolchain-openmoko.bb
new file mode 100644
index 0000000..b265615
--- /dev/null
+++ b/recipes/obsolete/meta/meta-toolchain-openmoko.bb
@@ -0,0 +1,7 @@
+PR = "r2"
+
+TOOLCHAIN_TARGET_TASK = "task-openmoko-toolchain-target"
+TOOLCHAIN_HOST_TASK = "task-openmoko-toolchain-host"
+
+require meta-toolchain.bb
+SDK_SUFFIX = "toolchain-openmoko"
diff --git a/recipes/obsolete/meta/openmoko-feed.bb b/recipes/obsolete/meta/openmoko-feed.bb
new file mode 100644
index 0000000..21bdbc6
--- /dev/null
+++ b/recipes/obsolete/meta/openmoko-feed.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Meta-package for Openmoko Misc. Feed Items"
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "\
+  task-openmoko-debug \
+  task-openmoko-native-sdk \
+  task-openmoko-feed \
+"
+
+inherit meta
diff --git a/recipes/obsolete/openmoko-base/openmoko-session/session b/recipes/obsolete/openmoko-base/openmoko-session/session
new file mode 100644
index 0000000..c7a773e
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-session/session
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+export GTK_MODULES="libgtkstylus.so libgtkinput.so"
+SHOWCURSOR="no"
+
+matchbox-panel-2 \
+	--start-applets=openmoko-panel-mainmenu,systray,startup \
+	--end-applets=openmoko-panel-battery,openmoko-panel-gsm,openmoko-panel-gps,openmoko-panel-usb,openmoko-panel-bt,openmoko-panel-clock &
+
+# start old-style panel plugin to get a keyboard
+mbinputmgr &
+
+# set default alsa configuration
+alsactl restore 0 -f /etc/alsa/stereoout.state
+
+# start UI and dialer
+openmoko-footer &
+openmoko-today --desktop &
+openmoko-dialer &
+
+sleep 1
+
+exec matchbox-window-manager -use_titlebar no -use_cursor $SHOWCURSOR $@
+
diff --git a/recipes/obsolete/openmoko-base/openmoko-session_svn.bb b/recipes/obsolete/openmoko-base/openmoko-session_svn.bb
new file mode 100644
index 0000000..05625a1
--- /dev/null
+++ b/recipes/obsolete/openmoko-base/openmoko-session_svn.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Matchbox session files for Openmoko"
+SECTION = "openmoko/base"
+RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today2 gconf"
+PV = "0.1+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-base
+
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE};module=etc;proto=http \
+           file://session"
+S = "${WORKDIR}"
+
+do_install() {
+	cp -R ${S}/etc ${D}/${sysconfdir}
+	rm -fR ${D}/${sysconfdir}/.svn
+	rm -fR ${D}/${sysconfdir}/matchbox/.svn
+	chmod -R 755 ${D}/${sysconfdir}
+    # DEMO only. Need to handle this differently in actual production images
+	install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/matchbox/session
+}
+
+pkg_postinst_openmoko-session () {
+#!/bin/sh -e
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/openmoko/interface/theme openmoko-standard
+}
+
+PACKAGE_ARCH = "all"
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-battery_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
new file mode 100644
index 0000000..b4926af
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Shows the battery/AC status in the Openmoko panel"
+DEPENDS = "apmd libnotify"
+SRCREV = "3360"
+PV = "0.1.1+svnr${SRCPV}"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-bt_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
new file mode 100644
index 0000000..b9015a3
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Shows the bluetooth status in the Openmoko panel"
+DEPENDS = "bluez-libs libnotify"
+SRCREV = "4331"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-clock_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
new file mode 100644
index 0000000..90e5e92
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "Shows the current time in the Openmoko panel"
+SRCREV = "2567"
+PV = "0.1.0+svnr${SRCPV}"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gps_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
new file mode 100644
index 0000000..928a993
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Shows the GPS status in the Openmoko panel"
+DEPENDS = "gpsd"
+SRCREV = "4330"
+PV = "0.1.0+svnr${SRCPV}"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
new file mode 100644
index 0000000..1ce27a6
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Shows the GSM / GPRS status in the Openmoko panel"
+DEPENDS = "libmokogsmd2 libnotify"
+SRCREV = "4335"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko-panel-plugin
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
new file mode 100644
index 0000000..ebc0416
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Main menu applet for the Openmoko panel"
+DEPENDS += "pulseaudio startup-notification"
+SRCREV = "2567"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-memory_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
new file mode 100644
index 0000000..767546f
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Shows an out-of-memory warning in the Openmoko panel"
+DEPENDS = "libnotify"
+RDEPENDS_${PN} = "openmoko-dialer2"
+SRCREV = "3903"
+PV = "0.0.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko-panel-plugin
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-usb_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
new file mode 100644
index 0000000..272df4c
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "USB applet for the Openmoko panel"
+SRCREV = "3360"
+PV = "0.1.0+svnr${SRCPV}"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
new file mode 100644
index 0000000..ae8a697
--- /dev/null
+++ b/recipes/obsolete/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Shows the wifi status in the Openmoko panel"
+DEPENDS = "libmokopanelui2"
+SRCREV = "4344"
+PV = "0.0.0+svnr${SRCPV}"
+
+inherit openmoko-panel-plugin
+
diff --git a/recipes/obsolete/openmoko2/openmoko-session2.bb b/recipes/obsolete/openmoko2/openmoko-session2.bb
new file mode 100644
index 0000000..d0c3268
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-session2.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Custom Matchbox session files for Openmoko"
+LICENSE = "GPL"
+SECTION = "x11"
+RDEPENDS_${PN} = "matchbox-panel-2 openmoko-common2 openmoko-today2 openmoko-dialer2"
+RCONFLICTS_${PN} = "openmoko-session matchbox-common"
+PR = "r69"
+
+SRC_URI = "\
+  file://etc \
+  file://matchbox-session \
+"
+
+S = "${WORKDIR}"
+
+inherit update-alternatives
+
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0655 ${WORKDIR}/matchbox-session ${D}${bindir}
+        install -d ${D}${sysconfdir}
+        cp -R ${S}/etc/* ${D}${sysconfdir}
+        rm -fR ${D}${sysconfdir}/.svn
+        rm -fR ${D}${sysconfdir}/matchbox/.svn
+        chmod -R 755 ${D}${sysconfdir}/
+}
+
+PACKAGE_ARCH = "all"
+
+pkg_postinst_openmoko-session2 () {
+#!/bin/sh -e
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Moko
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme openmoko-standard
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 5"
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/wallpaper ${datadir}/pixmaps/wallpaper.png
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/digital_clock 1
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/poky/peripherals/mouse/drag_threshold 8
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/openmoko/neod/power_management 2
+# gstreamer audio settings
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosink pulsesink
+gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc
+
+}
+
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/matchbox-session"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "11"
+
+CONFFILES_${PN} = "${sysconfdir}/matchbox/session"
diff --git a/recipes/obsolete/openmoko2/openmoko-session2/etc/matchbox/session b/recipes/obsolete/openmoko2/openmoko-session2/etc/matchbox/session
new file mode 100755
index 0000000..732cce9
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-session2/etc/matchbox/session
@@ -0,0 +1,12 @@
+#!/bin/sh
+SHOWCURSOR="no"
+
+openmoko-today &
+phone-kit &
+
+matchbox-window-manager -use_titlebar yes -use_desktop_mode decorated -theme Moko -use_cursor $SHOWCURSOR $@ &
+
+matchbox-panel-2 --start-applets systray,startup \
+  --end-applets openmoko-panel-battery,openmoko-panel-gsm,openmoko-panel-gps,openmoko-panel-usb,openmoko-panel-bt,openmoko-panel-memory,openmoko-panel-wifi --titlebar &
+
+exec neod
diff --git a/recipes/obsolete/openmoko2/openmoko-session2/matchbox-session b/recipes/obsolete/openmoko2/openmoko-session2/matchbox-session
new file mode 100755
index 0000000..65f1ce7
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-session2/matchbox-session
@@ -0,0 +1,24 @@
+#!/bin/sh
+#
+# Very simple session manager for matchbox tools
+#
+
+# Uncomment below to enable parsing of debian menu entrys
+# export MB_USE_DEB_MENUS=1 
+
+if [ -e $HOME/.matchbox/session ]
+then
+exec $HOME/.matchbox/session
+fi
+
+if [ -e /etc/matchbox/session ]
+then
+exec /etc/matchbox/session
+fi
+
+# Default files to run if $HOME/.matchbox/session or /etc/matchbox/session
+# dont exist. 
+
+matchbox-desktop &
+matchbox-panel  --orientation south &
+exec matchbox-window-manager $@
diff --git a/recipes/obsolete/tasks/task-openmoko-base.bb b/recipes/obsolete/tasks/task-openmoko-base.bb
new file mode 100644
index 0000000..3c46c56
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-base.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Openmoko: Base Task for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r74"
+
+inherit task
+
+#
+# task-openmoko-base
+#
+DESCRIPTION_task-openmoko-base = "Openmoko: Top Panel, Application Launcher, Application Manager"
+RDEPENDS_task-openmoko-base = "\
+  matchbox-panel-2 \
+#  matchbox-panel-2-applets \
+#  matchbox-keyboard-inputmethod \
+#  matchbox-keyboard-im \
+#  matchbox-keyboard-applet \
+  matchbox-stroke \
+  multitap-pad \
+  vala-terminal \
+#  openmoko-keyboard \
+  openmoko-panel-battery \
+  openmoko-panel-clock \
+  openmoko-panel-usb \
+  ${@base_contains('MACHINE_FEATURES', 'bluetooth', 'openmoko-panel-bt', '', d)} \
+  ${@base_contains('MACHINE_FEATURES', 'gps', 'openmoko-panel-gps', '', d)} \
+  ${@base_contains('MACHINE_FEATURES', 'wifi', 'openmoko-panel-wifi', '', d)} \
+  \
+  openmoko-today2 \
+#  openmoko-appmanager \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-debug.bb b/recipes/obsolete/tasks/task-openmoko-debug.bb
new file mode 100644
index 0000000..f30a024
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-debug.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Openmoko: Debugging and Benchmarking Tools"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r59.01"
+
+inherit task
+
+RDEPENDS_task-openmoko-debug = "\
+  alsa-utils-amixer \
+  alsa-utils-aplay \
+  alsa-utils-aconnect \
+  alsa-utils-alsamixer \
+  alsa-utils-speakertest \
+  bonnie++ \
+  cu \
+  dbench \
+  fbgrab \
+  fbset \
+  fstests \
+  gdb \
+  gdbserver \
+  lrzsz \
+  lsof \
+  ltrace \
+  memtester \
+#  sensors-i2cdetect sensors-i2cdump sensors-i2cset \
+  strace \
+  tcpdump \
+  tslib-calibrate \
+  tslib-tests \
+  udev-utils \
+  usbutils \
+  uucp \
+  vorbis-tools \
+  x11perf \
+  xev \
+  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'madplay', d)} \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-examples.bb b/recipes/obsolete/tasks/task-openmoko-examples.bb
new file mode 100644
index 0000000..7ebe32d
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-examples.bb
@@ -0,0 +1,6 @@
+DESCRIPTION = "Openmoko: Examples for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r71"
+
+inherit task
diff --git a/recipes/obsolete/tasks/task-openmoko-feed.bb b/recipes/obsolete/tasks/task-openmoko-feed.bb
new file mode 100644
index 0000000..66ddecd
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-feed.bb
@@ -0,0 +1,157 @@
+DESCRIPTION = "Openmoko: Misc. Feed Items"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r62"
+
+inherit task
+
+RDEPENDS_task-openmoko-feed = "\
+  aspell enchant \
+  openmoko-agpsui \
+  gypsy \
+  fso-gsm0710muxd \
+  ppp \
+  bluez-hcidump \
+  bootchart \
+  eet evas ecore embryo edje efreet emotion epdf \
+  edje-viewer \
+  free42-vga \
+  gpe-filemanager gpe-gallery gpe-timesheet gpe-todo gpe-contacts \
+  leafpad abiword \
+  claws-mail claws-plugin-mailmbox claws-plugin-gtkhtml2-viewer claws-plugin-rssyl \
+  ipkg-link ipkg-utils \
+  joe \
+  kbdd \
+  kexec-tools \
+  midori \
+  dillo \
+  fennec \
+  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'mplayer', d)} \
+  mtpaint \
+  mysql \
+  nano \
+  ntpclient ntp \
+  openssh openssh-scp openssh-ssh openssh-sshd openssh-sftp openssh-misc \
+  python python-pygtk python-pyserial python-gst python-pygame \
+#  python-lightblue \
+  python-pybluez \
+  obexpush \
+  ruby \
+  libsdl-x11 libsdl-mixer libsdl-net libsdl-ttf \
+  settingsgui \
+  synergy \
+  tzdata \
+  tor \
+  vnc \
+  wxwidgets \
+  x11vnc \
+  libswt3.4-gtk-java \
+  cacao \
+  jamvm \
+  classpath \
+  gpsdrive \
+  gpsd \
+  asterisk \
+  gnash \
+  mono \
+  diversity-daemon \
+  om-maps-berlin \
+  om-maps-buenos-aires \
+  om-maps-hong-kong \
+  om-maps-london \
+  om-maps-low-levels \
+  om-maps-new-york \
+  om-maps-paris \
+  om-maps-providence \
+  om-maps-san-francisco \
+  om-maps-sydney \
+  om-maps-taipei \
+  tangogps \
+  pyefl-sudoku \
+  minicom \
+  iotop \
+  evince \
+  epdfview \
+  xprop \
+  xev \
+  xwininfo \
+  gpsd \
+  mc \
+  devmem2 \
+  bluez-utils-alsa \
+  tcpdump \
+  gdb \
+  lsof \
+  openmoko-set-root-password \
+#  qtopia-phone-enable-debug \
+  git \
+  navit \
+  libnotify \
+  notification-daemon \
+  libxine \
+#  subversion \
+  task-openmoko-games \
+  xournal \
+  openvpn \
+  python-pygame \
+  irssi \
+  zsh \
+  fbreader \
+  gzip \
+  zip \
+  firefox \
+  pidgin \
+  epdfview \
+  midori \
+  microcom \
+  zhone \
+  frameworkd \
+  emacs \
+  gpe-scap \
+# for werner \
+  net-tools \
+  iproute2 \
+  iputils \
+  psmisc \
+  debianutils \
+  tcptraceroute \
+  task-proper-tools \
+  wmiconfig \
+  netkit-telnet \
+  bind-utils \
+  font-adobe-100dpi \
+  font-adobe-75dpi \
+  font-adobe-utopia-100dpi \
+  font-adobe-utopia-75dpi \
+  font-adobe-utopia-type1 \
+  font-arabic-misc \
+  font-bh-100dpi \
+  font-bh-75dpi \
+  font-bh-lucidatypewriter-100dpi \
+  font-bh-lucidatypewriter-75dpi \
+  font-bh-ttf \
+  font-bh-type1 \
+  font-bitstream-100dpi \
+  font-bitstream-75dpi \
+  font-bitstream-speedo \
+  font-bitstream-type1 \
+  font-cronyx-cyrillic \
+  font-cursor-misc \
+  font-daewoo-misc \
+  font-dec-misc \
+  font-ibm-type1 \
+  font-isas-misc \
+  font-jis-misc \
+  font-micro-misc \
+  font-misc-cyrillic \
+  font-misc-ethiopic \
+  font-misc-meltho \
+  font-misc-misc \
+  font-mutt-misc \
+  font-schumacher-misc \
+  font-screen-cyrillic \
+  font-sony-misc \
+  font-sun-misc \
+  font-winitzki-cyrillic \
+  font-xfree86-type1 \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-games.bb b/recipes/obsolete/tasks/task-openmoko-games.bb
new file mode 100644
index 0000000..c4aaa70
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-games.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Openmoko: Games for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r72"
+
+inherit task
+
+#
+# task-openmoko-games
+#
+DESCRIPTION_task-openmoko-games = "Openmoko: Games"
+RDEPENDS_task-openmoko-games = "\
+  oh-puzzles \
+  kobodeluxe \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-linux.bb b/recipes/obsolete/tasks/task-openmoko-linux.bb
new file mode 100644
index 0000000..dbd3a72
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-linux.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Openmoko: Core system for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r72"
+
+inherit task
+
+#
+# task-openmoko-core
+#
+DESCRIPTION_task-openmoko-linux = "Openmoko: Linux Core Services"
+RDEPENDS_task-openmoko-linux = "\
+  task-base \
+  udev-static-devices \
+  rsync \
+  screen \
+  fbset \
+  fbset-modes \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-native-sdk.bb b/recipes/obsolete/tasks/task-openmoko-native-sdk.bb
new file mode 100644
index 0000000..56f6824d
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-native-sdk.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Openmoko: Native SDK"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r58"
+
+inherit task
+
+RDEPENDS_task-openmoko-native-sdk = "\
+  binutils \
+  binutils-symlinks \
+  gcc \
+  gcc-symlinks \
+  cpp \
+  cpp-symlinks \
+  cvs \
+  libc6-dev \
+  libgcc-dev \
+  glibc-utils \
+  ldd \
+  g++ \
+  g++-symlinks \
+  libstdc++-dev \
+  \
+  make \
+  flex \
+  flex-dev \
+  bison \
+  gawk \
+  grep \
+  sed \
+  automake \
+  autoconf \
+  patch \
+  patchutils \
+  diffstat \
+  diffutils \
+  libtool \
+  pkgconfig \
+  \
+  xoo \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-net.bb b/recipes/obsolete/tasks/task-openmoko-net.bb
new file mode 100644
index 0000000..d58b05a
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-net.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Openmoko: Networking for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r71"
+
+inherit task
+
+#
+# task-openmoko-net
+#
+DESCRIPTION_task-openmoko-net = "Openmoko: Linux Advanced Networking"
+RDEPENDS_task-openmoko-net = "\
+  bluez-utils \
+  bridge-utils \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-phone.bb b/recipes/obsolete/tasks/task-openmoko-phone.bb
new file mode 100644
index 0000000..306ff05
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-phone.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Openmoko: Tasks for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r73"
+
+inherit task
+
+#
+# task-openmoko-phone
+#
+DESCRIPTION_task-openmoko-phone = "Openmoko: GSM and GPRS Phone Services"
+RDEPENDS_task-openmoko-phone = "\
+  gsmd \
+  libgsmd-tools \
+  openmoko-dialer2 \
+  openmoko-panel-gsm \
+  openmoko-panel-memory \
+#  ppp \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-pim.bb b/recipes/obsolete/tasks/task-openmoko-pim.bb
new file mode 100644
index 0000000..ba2ced5
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-pim.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Openmoko: PIM for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r72"
+
+inherit task
+
+#
+# task-openmoko-pim
+#
+DESCRIPTION_task-openmoko-pim = "Openmoko: Personal Information Management Suite"
+RDEPENDS_task-openmoko-pim = "\
+  eds-dbus \
+  openmoko-calculator2 \
+#  openmoko-contacts2 \
+#  openmoko-dates2 \
+#  openmoko-feedreader2 \
+  openmoko-browser2 \
+  openmoko-appmanager2 \
+#  openmoko-tasks2 \
+  openmoko-mediaplayer2 \
+  openmoko-messages2 \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-python-devel.bb b/recipes/obsolete/tasks/task-openmoko-python-devel.bb
new file mode 100644
index 0000000..7b375c0
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-python-devel.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Openmoko: Python Development Tools"
+SECTION = "openmoko/devel"
+LICENSE = "MIT"
+PR = "r3"
+
+inherit task
+
+RDEPENDS_task-openmoko-python-devel = "\
+  task-python-efl \
+  python-pygtk \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-toolchain-host.bb b/recipes/obsolete/tasks/task-openmoko-toolchain-host.bb
new file mode 100644
index 0000000..7d4398b
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-toolchain-host.bb
@@ -0,0 +1,15 @@
+require task-sdk-host.bb
+
+DESCRIPTION = "Packages for a standalone Openmoko SDK or external toolchain"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+PR = "r2"
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} += "\
+    openmoko-sample2-src \
+    openmoko-toolchain-scripts \
+    edje-sdk \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-toolchain-target.bb b/recipes/obsolete/tasks/task-openmoko-toolchain-target.bb
new file mode 100644
index 0000000..6d4ee62
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-toolchain-target.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Packages for a standalone Openmoko SDK or external toolchain"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+PR = "r3"
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "\
+    glibc \
+    glibc-dbg \
+    glibc-dev \
+    glibc-utils \
+    libsegfault \
+    glibc-thread-db \
+    glibc-localedata-i18n \
+    glibc-gconv-ibm850 \
+    glibc-gconv-cp1252 \
+    glibc-gconv-iso8859-1 \
+    glibc-gconv-iso8859-15 \
+    libgcc \
+    libstdc++ \
+"
diff --git a/recipes/obsolete/tasks/task-openmoko-ui.bb b/recipes/obsolete/tasks/task-openmoko-ui.bb
new file mode 100644
index 0000000..71020af
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko-ui.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "Openmoko: GUI for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PR = "r73"
+
+inherit task
+
+XSERVER ?= "xserver-kdrive-fbdev"
+
+#
+# task-openmoko-ui
+#
+DESCRIPTION_task-openmoko-ui = "Openmoko: The X11/Gtk+2 based native User Interface"
+PACKAGE_ARCH_task-openmoko-ui = "${MACHINE_ARCH}"
+RDEPENDS_task-openmoko-ui = "\
+  gdk-pixbuf-loader-png \
+  gdk-pixbuf-loader-gif \
+  gdk-pixbuf-loader-xpm \
+  gdk-pixbuf-loader-jpeg \
+  pango-module-basic-x \
+  pango-module-basic-fc \
+  gtk+ \
+  matchbox-wm \
+  ${XSERVER} \
+  xserver-kdrive-common \
+  xserver-nodm-init \
+  xauth \
+  xhost \
+  xset \
+  xrandr \
+  \
+  settings-daemon \
+  notification-daemon \
+  neod \
+  libnotify \
+  \
+  openmoko-session2 \
+  openmoko-sound-system2 \
+  openmoko-sound-theme-standard2 \
+  \
+  gpe-scap \
+"
+
+# Handle theming. FIXME: properly use machine database in a smart way,
+# taking into account not only size but also PPI! Ultimately this might
+# need recomputing some theme files and images on-the-fly :/ SVG and logical
+# theme description anyone? Or simply Edje to the rescue! :D
+THEMES          = "openmoko-icon-theme-standard2      moko-gtk-engine"
+THEMES_a780     = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_e680     = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_a1200    = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_rokre2   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_rokre6   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_magician = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_chumby   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+THEMES_htcblueangel = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
+
+RDEPENDS_task-openmoko-ui += "${THEMES}"
diff --git a/recipes/obsolete/tasks/task-openmoko.bb b/recipes/obsolete/tasks/task-openmoko.bb
new file mode 100644
index 0000000..6c195ba
--- /dev/null
+++ b/recipes/obsolete/tasks/task-openmoko.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Openmoko: Tasks for the Openmoko Linux Distribution"
+SECTION = "openmoko/base"
+LICENSE = "MIT"
+PROVIDES = "task-openmoko-everything"
+PR = "r71"
+
+inherit task
+
+PACKAGES += "\
+        task-openmoko-everything \
+"
+
+RDEPENDS_task-openmoko-everything := "\
+  task-openmoko-linux \
+  task-openmoko-ui \
+  task-openmoko-base \
+  task-openmoko-phone \
+  task-openmoko-pim \
+  task-openmoko-net \
+  task-openmoko-games \
+  task-openmoko-examples \
+  task-openmoko-debug \
+  task-openmoko-native-sdk \
+"
+
+
+
+
+
+
+
diff --git a/recipes/openmoko-base/openmoko-session/session b/recipes/openmoko-base/openmoko-session/session
deleted file mode 100644
index c7a773e..0000000
--- a/recipes/openmoko-base/openmoko-session/session
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-
-export GTK_MODULES="libgtkstylus.so libgtkinput.so"
-SHOWCURSOR="no"
-
-matchbox-panel-2 \
-	--start-applets=openmoko-panel-mainmenu,systray,startup \
-	--end-applets=openmoko-panel-battery,openmoko-panel-gsm,openmoko-panel-gps,openmoko-panel-usb,openmoko-panel-bt,openmoko-panel-clock &
-
-# start old-style panel plugin to get a keyboard
-mbinputmgr &
-
-# set default alsa configuration
-alsactl restore 0 -f /etc/alsa/stereoout.state
-
-# start UI and dialer
-openmoko-footer &
-openmoko-today --desktop &
-openmoko-dialer &
-
-sleep 1
-
-exec matchbox-window-manager -use_titlebar no -use_cursor $SHOWCURSOR $@
-
diff --git a/recipes/openmoko-base/openmoko-session_svn.bb b/recipes/openmoko-base/openmoko-session_svn.bb
deleted file mode 100644
index 05625a1..0000000
--- a/recipes/openmoko-base/openmoko-session_svn.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Matchbox session files for Openmoko"
-SECTION = "openmoko/base"
-RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today2 gconf"
-PV = "0.1+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-base
-
-SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE};module=etc;proto=http \
-           file://session"
-S = "${WORKDIR}"
-
-do_install() {
-	cp -R ${S}/etc ${D}/${sysconfdir}
-	rm -fR ${D}/${sysconfdir}/.svn
-	rm -fR ${D}/${sysconfdir}/matchbox/.svn
-	chmod -R 755 ${D}/${sysconfdir}
-    # DEMO only. Need to handle this differently in actual production images
-	install -m 0755 ${WORKDIR}/session ${D}/${sysconfdir}/matchbox/session
-}
-
-pkg_postinst_openmoko-session () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/openmoko/interface/theme openmoko-standard
-}
-
-PACKAGE_ARCH = "all"
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-battery_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
deleted file mode 100644
index b4926af..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-battery_svn.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Shows the battery/AC status in the Openmoko panel"
-DEPENDS = "apmd libnotify"
-SRCREV = "3360"
-PV = "0.1.1+svnr${SRCPV}"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-bt_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
deleted file mode 100644
index b9015a3..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-bt_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Shows the bluetooth status in the Openmoko panel"
-DEPENDS = "bluez-libs libnotify"
-SRCREV = "4331"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-clock_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
deleted file mode 100644
index 90e5e92..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-clock_svn.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "Shows the current time in the Openmoko panel"
-SRCREV = "2567"
-PV = "0.1.0+svnr${SRCPV}"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-gps_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
deleted file mode 100644
index 928a993..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-gps_svn.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Shows the GPS status in the Openmoko panel"
-DEPENDS = "gpsd"
-SRCREV = "4330"
-PV = "0.1.0+svnr${SRCPV}"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
deleted file mode 100644
index 1ce27a6..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-gsm_svn.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Shows the GSM / GPRS status in the Openmoko panel"
-DEPENDS = "libmokogsmd2 libnotify"
-SRCREV = "4335"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko-panel-plugin
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
deleted file mode 100644
index ebc0416..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-mainmenu_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Main menu applet for the Openmoko panel"
-DEPENDS += "pulseaudio startup-notification"
-SRCREV = "2567"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
deleted file mode 100644
index 767546f..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Shows an out-of-memory warning in the Openmoko panel"
-DEPENDS = "libnotify"
-RDEPENDS_${PN} = "openmoko-dialer2"
-SRCREV = "3903"
-PV = "0.0.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko-panel-plugin
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-usb_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
deleted file mode 100644
index 272df4c..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-usb_svn.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "USB applet for the Openmoko panel"
-SRCREV = "3360"
-PV = "0.1.0+svnr${SRCPV}"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
deleted file mode 100644
index ae8a697..0000000
--- a/recipes/openmoko-panel-plugins/openmoko-panel-wifi_svn.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Shows the wifi status in the Openmoko panel"
-DEPENDS = "libmokopanelui2"
-SRCREV = "4344"
-PV = "0.0.0+svnr${SRCPV}"
-
-inherit openmoko-panel-plugin
-
diff --git a/recipes/openmoko2/openmoko-session2.bb b/recipes/openmoko2/openmoko-session2.bb
deleted file mode 100644
index d0c3268..0000000
--- a/recipes/openmoko2/openmoko-session2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-DESCRIPTION = "Custom Matchbox session files for Openmoko"
-LICENSE = "GPL"
-SECTION = "x11"
-RDEPENDS_${PN} = "matchbox-panel-2 openmoko-common2 openmoko-today2 openmoko-dialer2"
-RCONFLICTS_${PN} = "openmoko-session matchbox-common"
-PR = "r69"
-
-SRC_URI = "\
-  file://etc \
-  file://matchbox-session \
-"
-
-S = "${WORKDIR}"
-
-inherit update-alternatives
-
-do_install() {
-        install -d ${D}${bindir}
-        install -m 0655 ${WORKDIR}/matchbox-session ${D}${bindir}
-        install -d ${D}${sysconfdir}
-        cp -R ${S}/etc/* ${D}${sysconfdir}
-        rm -fR ${D}${sysconfdir}/.svn
-        rm -fR ${D}${sysconfdir}/matchbox/.svn
-        chmod -R 755 ${D}${sysconfdir}/
-}
-
-PACKAGE_ARCH = "all"
-
-pkg_postinst_openmoko-session2 () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Moko
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme openmoko-standard
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 5"
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/wallpaper ${datadir}/pixmaps/wallpaper.png
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/digital_clock 1
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/poky/peripherals/mouse/drag_threshold 8
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type int --set /desktop/openmoko/neod/power_management 2
-# gstreamer audio settings
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosink pulsesink
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc
-
-}
-
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/matchbox-session"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "11"
-
-CONFFILES_${PN} = "${sysconfdir}/matchbox/session"
diff --git a/recipes/openmoko2/openmoko-session2/etc/matchbox/session b/recipes/openmoko2/openmoko-session2/etc/matchbox/session
deleted file mode 100755
index 732cce9..0000000
--- a/recipes/openmoko2/openmoko-session2/etc/matchbox/session
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-SHOWCURSOR="no"
-
-openmoko-today &
-phone-kit &
-
-matchbox-window-manager -use_titlebar yes -use_desktop_mode decorated -theme Moko -use_cursor $SHOWCURSOR $@ &
-
-matchbox-panel-2 --start-applets systray,startup \
-  --end-applets openmoko-panel-battery,openmoko-panel-gsm,openmoko-panel-gps,openmoko-panel-usb,openmoko-panel-bt,openmoko-panel-memory,openmoko-panel-wifi --titlebar &
-
-exec neod
diff --git a/recipes/openmoko2/openmoko-session2/matchbox-session b/recipes/openmoko2/openmoko-session2/matchbox-session
deleted file mode 100755
index 65f1ce7..0000000
--- a/recipes/openmoko2/openmoko-session2/matchbox-session
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-#
-# Very simple session manager for matchbox tools
-#
-
-# Uncomment below to enable parsing of debian menu entrys
-# export MB_USE_DEB_MENUS=1 
-
-if [ -e $HOME/.matchbox/session ]
-then
-exec $HOME/.matchbox/session
-fi
-
-if [ -e /etc/matchbox/session ]
-then
-exec /etc/matchbox/session
-fi
-
-# Default files to run if $HOME/.matchbox/session or /etc/matchbox/session
-# dont exist. 
-
-matchbox-desktop &
-matchbox-panel  --orientation south &
-exec matchbox-window-manager $@
diff --git a/recipes/tasks/task-openmoko-base.bb b/recipes/tasks/task-openmoko-base.bb
deleted file mode 100644
index 3c46c56..0000000
--- a/recipes/tasks/task-openmoko-base.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Openmoko: Base Task for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r74"
-
-inherit task
-
-#
-# task-openmoko-base
-#
-DESCRIPTION_task-openmoko-base = "Openmoko: Top Panel, Application Launcher, Application Manager"
-RDEPENDS_task-openmoko-base = "\
-  matchbox-panel-2 \
-#  matchbox-panel-2-applets \
-#  matchbox-keyboard-inputmethod \
-#  matchbox-keyboard-im \
-#  matchbox-keyboard-applet \
-  matchbox-stroke \
-  multitap-pad \
-  vala-terminal \
-#  openmoko-keyboard \
-  openmoko-panel-battery \
-  openmoko-panel-clock \
-  openmoko-panel-usb \
-  ${@base_contains('MACHINE_FEATURES', 'bluetooth', 'openmoko-panel-bt', '', d)} \
-  ${@base_contains('MACHINE_FEATURES', 'gps', 'openmoko-panel-gps', '', d)} \
-  ${@base_contains('MACHINE_FEATURES', 'wifi', 'openmoko-panel-wifi', '', d)} \
-  \
-  openmoko-today2 \
-#  openmoko-appmanager \
-"
diff --git a/recipes/tasks/task-openmoko-debug.bb b/recipes/tasks/task-openmoko-debug.bb
deleted file mode 100644
index f30a024..0000000
--- a/recipes/tasks/task-openmoko-debug.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Openmoko: Debugging and Benchmarking Tools"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r59.01"
-
-inherit task
-
-RDEPENDS_task-openmoko-debug = "\
-  alsa-utils-amixer \
-  alsa-utils-aplay \
-  alsa-utils-aconnect \
-  alsa-utils-alsamixer \
-  alsa-utils-speakertest \
-  bonnie++ \
-  cu \
-  dbench \
-  fbgrab \
-  fbset \
-  fstests \
-  gdb \
-  gdbserver \
-  lrzsz \
-  lsof \
-  ltrace \
-  memtester \
-#  sensors-i2cdetect sensors-i2cdump sensors-i2cset \
-  strace \
-  tcpdump \
-  tslib-calibrate \
-  tslib-tests \
-  udev-utils \
-  usbutils \
-  uucp \
-  vorbis-tools \
-  x11perf \
-  xev \
-  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'madplay', d)} \
-"
diff --git a/recipes/tasks/task-openmoko-examples.bb b/recipes/tasks/task-openmoko-examples.bb
deleted file mode 100644
index 7ebe32d..0000000
--- a/recipes/tasks/task-openmoko-examples.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-DESCRIPTION = "Openmoko: Examples for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r71"
-
-inherit task
diff --git a/recipes/tasks/task-openmoko-feed.bb b/recipes/tasks/task-openmoko-feed.bb
deleted file mode 100644
index 66ddecd..0000000
--- a/recipes/tasks/task-openmoko-feed.bb
+++ /dev/null
@@ -1,157 +0,0 @@
-DESCRIPTION = "Openmoko: Misc. Feed Items"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r62"
-
-inherit task
-
-RDEPENDS_task-openmoko-feed = "\
-  aspell enchant \
-  openmoko-agpsui \
-  gypsy \
-  fso-gsm0710muxd \
-  ppp \
-  bluez-hcidump \
-  bootchart \
-  eet evas ecore embryo edje efreet emotion epdf \
-  edje-viewer \
-  free42-vga \
-  gpe-filemanager gpe-gallery gpe-timesheet gpe-todo gpe-contacts \
-  leafpad abiword \
-  claws-mail claws-plugin-mailmbox claws-plugin-gtkhtml2-viewer claws-plugin-rssyl \
-  ipkg-link ipkg-utils \
-  joe \
-  kbdd \
-  kexec-tools \
-  midori \
-  dillo \
-  fennec \
-  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'mplayer', d)} \
-  mtpaint \
-  mysql \
-  nano \
-  ntpclient ntp \
-  openssh openssh-scp openssh-ssh openssh-sshd openssh-sftp openssh-misc \
-  python python-pygtk python-pyserial python-gst python-pygame \
-#  python-lightblue \
-  python-pybluez \
-  obexpush \
-  ruby \
-  libsdl-x11 libsdl-mixer libsdl-net libsdl-ttf \
-  settingsgui \
-  synergy \
-  tzdata \
-  tor \
-  vnc \
-  wxwidgets \
-  x11vnc \
-  libswt3.4-gtk-java \
-  cacao \
-  jamvm \
-  classpath \
-  gpsdrive \
-  gpsd \
-  asterisk \
-  gnash \
-  mono \
-  diversity-daemon \
-  om-maps-berlin \
-  om-maps-buenos-aires \
-  om-maps-hong-kong \
-  om-maps-london \
-  om-maps-low-levels \
-  om-maps-new-york \
-  om-maps-paris \
-  om-maps-providence \
-  om-maps-san-francisco \
-  om-maps-sydney \
-  om-maps-taipei \
-  tangogps \
-  pyefl-sudoku \
-  minicom \
-  iotop \
-  evince \
-  epdfview \
-  xprop \
-  xev \
-  xwininfo \
-  gpsd \
-  mc \
-  devmem2 \
-  bluez-utils-alsa \
-  tcpdump \
-  gdb \
-  lsof \
-  openmoko-set-root-password \
-#  qtopia-phone-enable-debug \
-  git \
-  navit \
-  libnotify \
-  notification-daemon \
-  libxine \
-#  subversion \
-  task-openmoko-games \
-  xournal \
-  openvpn \
-  python-pygame \
-  irssi \
-  zsh \
-  fbreader \
-  gzip \
-  zip \
-  firefox \
-  pidgin \
-  epdfview \
-  midori \
-  microcom \
-  zhone \
-  frameworkd \
-  emacs \
-  gpe-scap \
-# for werner \
-  net-tools \
-  iproute2 \
-  iputils \
-  psmisc \
-  debianutils \
-  tcptraceroute \
-  task-proper-tools \
-  wmiconfig \
-  netkit-telnet \
-  bind-utils \
-  font-adobe-100dpi \
-  font-adobe-75dpi \
-  font-adobe-utopia-100dpi \
-  font-adobe-utopia-75dpi \
-  font-adobe-utopia-type1 \
-  font-arabic-misc \
-  font-bh-100dpi \
-  font-bh-75dpi \
-  font-bh-lucidatypewriter-100dpi \
-  font-bh-lucidatypewriter-75dpi \
-  font-bh-ttf \
-  font-bh-type1 \
-  font-bitstream-100dpi \
-  font-bitstream-75dpi \
-  font-bitstream-speedo \
-  font-bitstream-type1 \
-  font-cronyx-cyrillic \
-  font-cursor-misc \
-  font-daewoo-misc \
-  font-dec-misc \
-  font-ibm-type1 \
-  font-isas-misc \
-  font-jis-misc \
-  font-micro-misc \
-  font-misc-cyrillic \
-  font-misc-ethiopic \
-  font-misc-meltho \
-  font-misc-misc \
-  font-mutt-misc \
-  font-schumacher-misc \
-  font-screen-cyrillic \
-  font-sony-misc \
-  font-sun-misc \
-  font-winitzki-cyrillic \
-  font-xfree86-type1 \
-"
diff --git a/recipes/tasks/task-openmoko-games.bb b/recipes/tasks/task-openmoko-games.bb
deleted file mode 100644
index c4aaa70..0000000
--- a/recipes/tasks/task-openmoko-games.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Openmoko: Games for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r72"
-
-inherit task
-
-#
-# task-openmoko-games
-#
-DESCRIPTION_task-openmoko-games = "Openmoko: Games"
-RDEPENDS_task-openmoko-games = "\
-  oh-puzzles \
-  kobodeluxe \
-"
diff --git a/recipes/tasks/task-openmoko-linux.bb b/recipes/tasks/task-openmoko-linux.bb
deleted file mode 100644
index dbd3a72..0000000
--- a/recipes/tasks/task-openmoko-linux.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Openmoko: Core system for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r72"
-
-inherit task
-
-#
-# task-openmoko-core
-#
-DESCRIPTION_task-openmoko-linux = "Openmoko: Linux Core Services"
-RDEPENDS_task-openmoko-linux = "\
-  task-base \
-  udev-static-devices \
-  rsync \
-  screen \
-  fbset \
-  fbset-modes \
-"
diff --git a/recipes/tasks/task-openmoko-native-sdk.bb b/recipes/tasks/task-openmoko-native-sdk.bb
deleted file mode 100644
index 56f6824d..0000000
--- a/recipes/tasks/task-openmoko-native-sdk.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Openmoko: Native SDK"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r58"
-
-inherit task
-
-RDEPENDS_task-openmoko-native-sdk = "\
-  binutils \
-  binutils-symlinks \
-  gcc \
-  gcc-symlinks \
-  cpp \
-  cpp-symlinks \
-  cvs \
-  libc6-dev \
-  libgcc-dev \
-  glibc-utils \
-  ldd \
-  g++ \
-  g++-symlinks \
-  libstdc++-dev \
-  \
-  make \
-  flex \
-  flex-dev \
-  bison \
-  gawk \
-  grep \
-  sed \
-  automake \
-  autoconf \
-  patch \
-  patchutils \
-  diffstat \
-  diffutils \
-  libtool \
-  pkgconfig \
-  \
-  xoo \
-"
diff --git a/recipes/tasks/task-openmoko-net.bb b/recipes/tasks/task-openmoko-net.bb
deleted file mode 100644
index d58b05a..0000000
--- a/recipes/tasks/task-openmoko-net.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Openmoko: Networking for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r71"
-
-inherit task
-
-#
-# task-openmoko-net
-#
-DESCRIPTION_task-openmoko-net = "Openmoko: Linux Advanced Networking"
-RDEPENDS_task-openmoko-net = "\
-  bluez-utils \
-  bridge-utils \
-"
diff --git a/recipes/tasks/task-openmoko-phone.bb b/recipes/tasks/task-openmoko-phone.bb
deleted file mode 100644
index 306ff05..0000000
--- a/recipes/tasks/task-openmoko-phone.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Openmoko: Tasks for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r73"
-
-inherit task
-
-#
-# task-openmoko-phone
-#
-DESCRIPTION_task-openmoko-phone = "Openmoko: GSM and GPRS Phone Services"
-RDEPENDS_task-openmoko-phone = "\
-  gsmd \
-  libgsmd-tools \
-  openmoko-dialer2 \
-  openmoko-panel-gsm \
-  openmoko-panel-memory \
-#  ppp \
-"
diff --git a/recipes/tasks/task-openmoko-pim.bb b/recipes/tasks/task-openmoko-pim.bb
deleted file mode 100644
index ba2ced5..0000000
--- a/recipes/tasks/task-openmoko-pim.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Openmoko: PIM for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r72"
-
-inherit task
-
-#
-# task-openmoko-pim
-#
-DESCRIPTION_task-openmoko-pim = "Openmoko: Personal Information Management Suite"
-RDEPENDS_task-openmoko-pim = "\
-  eds-dbus \
-  openmoko-calculator2 \
-#  openmoko-contacts2 \
-#  openmoko-dates2 \
-#  openmoko-feedreader2 \
-  openmoko-browser2 \
-  openmoko-appmanager2 \
-#  openmoko-tasks2 \
-  openmoko-mediaplayer2 \
-  openmoko-messages2 \
-"
diff --git a/recipes/tasks/task-openmoko-python-devel.bb b/recipes/tasks/task-openmoko-python-devel.bb
deleted file mode 100644
index 7b375c0..0000000
--- a/recipes/tasks/task-openmoko-python-devel.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Openmoko: Python Development Tools"
-SECTION = "openmoko/devel"
-LICENSE = "MIT"
-PR = "r3"
-
-inherit task
-
-RDEPENDS_task-openmoko-python-devel = "\
-  task-python-efl \
-  python-pygtk \
-"
diff --git a/recipes/tasks/task-openmoko-toolchain-host.bb b/recipes/tasks/task-openmoko-toolchain-host.bb
deleted file mode 100644
index 7d4398b..0000000
--- a/recipes/tasks/task-openmoko-toolchain-host.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require task-sdk-host.bb
-
-DESCRIPTION = "Packages for a standalone Openmoko SDK or external toolchain"
-LICENSE = "MIT"
-ALLOW_EMPTY = "1"
-
-PR = "r2"
-
-PACKAGES = "${PN}"
-
-RDEPENDS_${PN} += "\
-    openmoko-sample2-src \
-    openmoko-toolchain-scripts \
-    edje-sdk \
-"
diff --git a/recipes/tasks/task-openmoko-toolchain-target.bb b/recipes/tasks/task-openmoko-toolchain-target.bb
deleted file mode 100644
index 6d4ee62..0000000
--- a/recipes/tasks/task-openmoko-toolchain-target.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Packages for a standalone Openmoko SDK or external toolchain"
-LICENSE = "MIT"
-ALLOW_EMPTY = "1"
-
-PR = "r3"
-
-PACKAGES = "${PN}"
-
-RDEPENDS_${PN} = "\
-    glibc \
-    glibc-dbg \
-    glibc-dev \
-    glibc-utils \
-    libsegfault \
-    glibc-thread-db \
-    glibc-localedata-i18n \
-    glibc-gconv-ibm850 \
-    glibc-gconv-cp1252 \
-    glibc-gconv-iso8859-1 \
-    glibc-gconv-iso8859-15 \
-    libgcc \
-    libstdc++ \
-"
diff --git a/recipes/tasks/task-openmoko-ui.bb b/recipes/tasks/task-openmoko-ui.bb
deleted file mode 100644
index 71020af..0000000
--- a/recipes/tasks/task-openmoko-ui.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION = "Openmoko: GUI for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PR = "r73"
-
-inherit task
-
-XSERVER ?= "xserver-kdrive-fbdev"
-
-#
-# task-openmoko-ui
-#
-DESCRIPTION_task-openmoko-ui = "Openmoko: The X11/Gtk+2 based native User Interface"
-PACKAGE_ARCH_task-openmoko-ui = "${MACHINE_ARCH}"
-RDEPENDS_task-openmoko-ui = "\
-  gdk-pixbuf-loader-png \
-  gdk-pixbuf-loader-gif \
-  gdk-pixbuf-loader-xpm \
-  gdk-pixbuf-loader-jpeg \
-  pango-module-basic-x \
-  pango-module-basic-fc \
-  gtk+ \
-  matchbox-wm \
-  ${XSERVER} \
-  xserver-kdrive-common \
-  xserver-nodm-init \
-  xauth \
-  xhost \
-  xset \
-  xrandr \
-  \
-  settings-daemon \
-  notification-daemon \
-  neod \
-  libnotify \
-  \
-  openmoko-session2 \
-  openmoko-sound-system2 \
-  openmoko-sound-theme-standard2 \
-  \
-  gpe-scap \
-"
-
-# Handle theming. FIXME: properly use machine database in a smart way,
-# taking into account not only size but also PPI! Ultimately this might
-# need recomputing some theme files and images on-the-fly :/ SVG and logical
-# theme description anyone? Or simply Edje to the rescue! :D
-THEMES          = "openmoko-icon-theme-standard2      moko-gtk-engine"
-THEMES_a780     = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_e680     = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_a1200    = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_rokre2   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_rokre6   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_magician = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_chumby   = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-THEMES_htcblueangel = "openmoko-icon-theme-standard2-qvga openmoko-theme-standard2-qvga"
-
-RDEPENDS_task-openmoko-ui += "${THEMES}"
diff --git a/recipes/tasks/task-openmoko.bb b/recipes/tasks/task-openmoko.bb
deleted file mode 100644
index 6c195ba..0000000
--- a/recipes/tasks/task-openmoko.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Openmoko: Tasks for the Openmoko Linux Distribution"
-SECTION = "openmoko/base"
-LICENSE = "MIT"
-PROVIDES = "task-openmoko-everything"
-PR = "r71"
-
-inherit task
-
-PACKAGES += "\
-        task-openmoko-everything \
-"
-
-RDEPENDS_task-openmoko-everything := "\
-  task-openmoko-linux \
-  task-openmoko-ui \
-  task-openmoko-base \
-  task-openmoko-phone \
-  task-openmoko-pim \
-  task-openmoko-net \
-  task-openmoko-games \
-  task-openmoko-examples \
-  task-openmoko-debug \
-  task-openmoko-native-sdk \
-"
-
-
-
-
-
-
-
-- 
1.7.3.1



