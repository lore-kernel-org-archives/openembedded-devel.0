Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003bX-8C
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 61788EA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7D264604D2; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:24 +0200
Message-Id: <8a4f6f561ebc5900cb785f41774a8cda4cac8633.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 06/14] udev: update SRC_URI of multiple recipes
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

This patch updates the SRC_URI of udev_151.bb, udev_154.bb,
udev_162.bb and udev_165.bb recipes to www.mirrorservice.org because
the corresponding source package is no longer available at kernel.org
This commit is the result of rebasing my patch 206155 from master.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/udev/udev_151.bb |    2 +-
 recipes/udev/udev_154.bb |    2 +-
 recipes/udev/udev_162.bb |    2 +-
 recipes/udev/udev_165.bb |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index d31d99a..a5a94ec 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://udev-replace-le16toh.patch \
 	   file://udev-replace-lutimes.patch \
 	   file://mount.blacklist \
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index 44d7b13..588b547 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 SRC_URI[md5sum] = "4ee3bcc4e326e967167ccb6a6ba04514"
 SRC_URI[sha256sum] = "29d66a5a8499cc6e4f2bcc7f79f2c6b44f4d720cecef2e552f0354d792e40a83"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
index 2991b28..9795c06 100644
--- a/recipes/udev/udev_162.bb
+++ b/recipes/udev/udev_162.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 SRC_URI[md5sum] = "7c537de77442317ef1b93f9dba38fd4e"
 SRC_URI[sha256sum] = "f536de7fc0ec231cb793aae9501c648763901d4360c27a864d1bdf3ed8aca00f"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index 63e62f1..f79e549 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
-- 
1.7.10



