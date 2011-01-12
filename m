Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PcwmC-0002DM-49
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:13:56 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pcwlg-00012J-AD by authid <stefan@sostec.de> with cram_md5;
	Wed, 12 Jan 2011 10:13:26 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Pcwlf-0000ij-I8; Wed, 12 Jan 2011 10:13:23 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 10:13:18 +0100
Message-Id: <1294823599-2669-2-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294823599-2669-1-git-send-email-stefan@buglabs.net>
References: <1294823599-2669-1-git-send-email-stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH 2/3] bug-image.bbclass: Add class for bug images
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
X-List-Received-Date: Wed, 12 Jan 2011 09:13:56 -0000


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 classes/bug-image.bbclass |   54 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 classes/bug-image.bbclass

diff --git a/classes/bug-image.bbclass b/classes/bug-image.bbclass
new file mode 100644
index 0000000..4e8104c
--- /dev/null
+++ b/classes/bug-image.bbclass
@@ -0,0 +1,54 @@
+# Available IMAGE_FEATURES:
+# - apps-console-core
+# - x11-base            - X11 server + minimal desktop
+# - x11-sato            - OpenedHand Sato environment
+# - dev-pkgs            - development packages
+# - dbg-pkgs            - debug packages
+
+DISTRO_TASKS += '\
+    ${@base_contains("IMAGE_FEATURES", "apps-console-core", "task-poky-apps-console", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dbg-pkgs"], "task-poky-apps-console-dbg", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["apps-console-core", "dev-pkgs"], "task-poky-apps-console-dev", "",d)} \
+    \
+    ${@base_contains("IMAGE_FEATURES", "x11-base", "task-poky-x11-base", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dbg-pkgs"], "task-poky-x11-base-dbg", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["x11-base", "dev-pkgs"], "task-poky-x11-base-dev", "",d)} \
+    \
+    ${@base_contains("IMAGE_FEATURES", "x11-sato", "task-poky-x11-sato", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dbg-pkgs"], "task-poky-x11-sato-dbg", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", ["x11-sato", "dev-pkgs"], "task-poky-x11-sato-dev", "",d)} \
+    '
+
+IMAGE_INSTALL ?= "${DISTRO_TASKS}"
+
+X11_IMAGE_FEATURES  = "x11-base"
+SATO_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-sato"
+
+inherit image
+
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_buildinfo"
+
+rootfs_update_buildinfo () {
+	echo "BUG Linux Build Information"	> ${IMAGE_ROOTFS}/etc/buildinfo
+	echo "Version:    2.0.2"		>> ${IMAGE_ROOTFS}/etc/buildinfo
+	echo "Build Host: `uname -a`"		>> ${IMAGE_ROOTFS}/etc/buildinfo
+	echo "Build User: `whoami`"		>> ${IMAGE_ROOTFS}/etc/buildinfo
+	echo "Build Time: `date -u`"		>> ${IMAGE_ROOTFS}/etc/buildinfo
+	echo "Revision:  ${METADATA_REVISION}"	>> ${IMAGE_ROOTFS}/etc/buildinfo
+
+	# Alias stuff that normally should belong into the bashrc or similar
+	echo "alias ipkg='opkg'" >>${IMAGE_ROOTFS}/etc/profile
+	echo "alias ll='ls -al'" >>${IMAGE_ROOTFS}/etc/profile
+
+	# Bandaid for RI1413
+	echo "vm.min_free_kbytes = 4096" >> ${IMAGE_ROOTFS}/etc/sysctl.conf
+
+	# We don't want persistent net rules as we would like to be able using
+	# the same rootfs in other bugs.
+	rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
+
+	curdir=$PWD
+	cd ${IMAGE_ROOTFS}/usr/lib/
+	ln -sf libbluetooth.so.3 libbluetooth.so
+	cd $curdir
+}
-- 
1.7.2.3



