Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T9C0g-0001Vv-PE
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:34:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=4290; q=dns/txt;
	s=iport; t=1346836958; x=1348046558;
	h=from:to:cc:subject:date:message-id;
	bh=u3vplKv8mZD8+garcgzL1JUgvgJe9NtyBSSNHKuv8cs=;
	b=BGxVH4dCDoXRXNSxMLhCwnSs6RrgS+P/c8S5cXs7EjqQFhJwAzwC1Zy9
	y2mG8WbxcF70S6F82naTU8C48WXazrzDtQG9fxzMHW/7+5FRr+Eicsxqq
	blKWJL8uz0WArHuJ3V3VXR8QX3tpJK2CPr7clTQPOnxZm7/uhNYIh8UHp I=;
X-IronPort-AV: E=Sophos;i="4.80,372,1344211200"; 
   d="scan'208";a="7817790"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-4.cisco.com with ESMTP; 05 Sep 2012 09:22:35 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q859MZp2025698;
	Wed, 5 Sep 2012 09:22:35 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 11:22:32 +0200
Message-Id: <1346836952-1804-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] task-x11*: Rename to packagegroup to match oe-core.
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
X-List-Received-Date: Wed, 05 Sep 2012 09:34:58 -0000

---
 .../packagegroups/packagegroup-x11-server_1.0.bb   |   23 +++++++++++++++
 .../packagegroups/packagegroup-x11_1.0.bb          |   30 ++++++++++++++++++++
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  |   23 ---------------
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |   30 --------------------
 4 files changed, 53 insertions(+), 53 deletions(-)
 create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
 create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
 delete mode 100644 meta-oe/recipes-core/tasks/task-x11_1.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
new file mode 100644
index 0000000..7e43d55
--- /dev/null
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Task for an image with Xserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r9"
+
+inherit task
+
+# for backwards compatibility
+RPROVIDES_${PN} += "task-xserver"
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+"
+
+
+RDEPENDS_${PN} = " \
+  ${XSERVER} \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
new file mode 100644
index 0000000..326e09f
--- /dev/null
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "The X Window System -- install this task to get a client/server based display multiplexer."
+SECTION = "x11/server"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r11"
+
+inherit task allarch
+
+PACKAGES += "${PN}-utils"
+
+RRECOMMENDS_${PN} = "\
+  ${PN}-server \
+  ${PN}-utils \
+"
+
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
+
+# elsa or xserver-nodm-init(-systemd)
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+
+RDEPENDS_${PN}-utils = "\
+  ${VIRTUAL-RUNTIME_xserver_common} \
+  ${VIRTUAL-RUNTIME_graphical_init_manager} \
+  xauth \
+  xhost \
+  xset \
+  xrandr \
+"
+
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
1.7.8.6



