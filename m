Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UBlJz-0005nQ-Df
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 13:13:51 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 9F8A7EA048
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2013 13:15:41 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 04D9FA406D1; Sat,  2 Mar 2013 12:57:33 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2013 12:57:02 +0100
Message-Id: <f60395b6f7952d3cbfa5c04f06e3c4e327d2e4d4.1362223895.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362223895.git.apelete@seketeli.net>
References: <cover.1362223895.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 1/7] udev: update SRC_URI of multiple recipes
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
X-List-Received-Date: Sat, 02 Mar 2013 12:14:00 -0000

Update the SRC_URI of udev_151.bb, udev_162.bb and udev_165.bb recipes
to build.shr-project.org since the corresponding source packages were
no longer available on any kernel.org mirror.
---
 recipes/udev/udev_151.bb |    2 +-
 recipes/udev/udev_162.bb |    2 +-
 recipes/udev/udev_165.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index a5a94ec..891bca3 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
-SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://build.shr-project.org/sources/udev-${PV}.tar.gz \
 	   file://udev-replace-le16toh.patch \
 	   file://udev-replace-lutimes.patch \
 	   file://mount.blacklist \
diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
index 9795c06..9c61b9b 100644
--- a/recipes/udev/udev_162.bb
+++ b/recipes/udev/udev_162.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 SRC_URI[md5sum] = "7c537de77442317ef1b93f9dba38fd4e"
 SRC_URI[sha256sum] = "f536de7fc0ec231cb793aae9501c648763901d4360c27a864d1bdf3ed8aca00f"
 
-SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://build.shr-project.org/sources/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index f79e549..fd73849 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
-SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://build.shr-project.org/sources/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
-- 
1.7.10.4



