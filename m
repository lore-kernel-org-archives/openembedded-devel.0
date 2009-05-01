Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LzryJ-0008V4-QN
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 14:36:07 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lzrsz-0004rH-Jt; Fri, 01 May 2009 16:30:37 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 May 2009 16:30:33 +0400
Message-Id: <1241181034-25945-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
Subject: [PATCH 1/2] bridge-utils: remove old versions
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
X-List-Received-Date: Fri, 01 May 2009 12:36:08 -0000

Version 1.0.4 FTBFS and both with 0.9.7 are very old. No distro sets any
version as preferred, so it's safe to assume that everyone is on 1.2 now.
---
 .../bridge-utils/bridge-utils-0.9.7/failout.patch  |   16 ----------------
 recipes/bridge-utils/bridge-utils_0.9.7.bb         |   10 ----------
 recipes/bridge-utils/bridge-utils_1.0.4.bb         |   14 --------------
 3 files changed, 0 insertions(+), 40 deletions(-)
 delete mode 100644 recipes/bridge-utils/bridge-utils-0.9.7/failout.patch
 delete mode 100644 recipes/bridge-utils/bridge-utils_0.9.7.bb
 delete mode 100644 recipes/bridge-utils/bridge-utils_1.0.4.bb

diff --git a/recipes/bridge-utils/bridge-utils-0.9.7/failout.patch b/recipes/bridge-utils/bridge-utils-0.9.7/failout.patch
deleted file mode 100644
index ca6e958..0000000
--- a/recipes/bridge-utils/bridge-utils-0.9.7/failout.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- bridge-utils-0.9.7/Makefile.in~failout	2002-04-03 10:19:36.000000000 -0600
-+++ bridge-utils-0.9.7/Makefile.in	2004-06-03 14:17:35.000000000 -0500
-@@ -13,7 +13,7 @@
- SUBDIRS=libbridge brctl doc
- 
- all:
--	for x in $(SUBDIRS); do (cd $$x && $(MAKE) ); done
-+	for x in $(SUBDIRS); do (cd $$x && $(MAKE) ) || exit 1; done
- 
- clean:
- 	for x in $(SUBDIRS); do (cd $$x && $(MAKE) clean ); done
diff --git a/recipes/bridge-utils/bridge-utils_0.9.7.bb b/recipes/bridge-utils/bridge-utils_0.9.7.bb
deleted file mode 100644
index 1ab9424..0000000
--- a/recipes/bridge-utils/bridge-utils_0.9.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Tools for ethernet bridging."
-LICENSE = "GPL"
-SECTION = "console/network"
-SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tgz \
-	   file://failout.patch;patch=1"
-S = "${WORKDIR}/bridge-utils-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
diff --git a/recipes/bridge-utils/bridge-utils_1.0.4.bb b/recipes/bridge-utils/bridge-utils_1.0.4.bb
deleted file mode 100644
index d72a627..0000000
--- a/recipes/bridge-utils/bridge-utils_1.0.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Tools for ethernet bridging."
-HOMEPAGE = "http://bridge.sourceforge.net/"
-SECTION = "console/network"
-LICENSE = "GPL"
-DEPENDS = "sysfsutils"
-RRECOMMENDS = "kernel-module-bridge"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
-S = "${WORKDIR}/bridge-utils-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
-- 
1.6.2.4



