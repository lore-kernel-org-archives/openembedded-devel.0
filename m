Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13VD-0001kW-5R
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1936B3148E2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id daWlZnC+L1IH; Wed, 29 Sep 2010 22:37:09 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 74DF53148E16;
	Wed, 29 Sep 2010 22:37:05 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:05 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:25 +0000
Message-Id: <1285792594-10032-10-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/18] cdrkit: update from 1.1.9 to 1.1.10
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:58 -0000

* 1.1.9 had conflicts with (e)glibc.
* 1.1.10 was released on 2009/10/11 and is the latest version.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/cdrkit/cdrkit_1.1.10.bb    |   14 ++++++++++++++
 recipes/cdrkit/cdrkit_1.1.9.bb     |   22 ----------------------
 recipes/cdrkit/files/xconfig.patch |   10 ++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)
 create mode 100644 recipes/cdrkit/cdrkit_1.1.10.bb
 delete mode 100644 recipes/cdrkit/cdrkit_1.1.9.bb

diff --git a/recipes/cdrkit/cdrkit_1.1.10.bb b/recipes/cdrkit/cdrkit_1.1.10.bb
new file mode 100644
index 0000000..dad20f1
--- /dev/null
+++ b/recipes/cdrkit/cdrkit_1.1.10.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A set of tools for CD recording"
+HOMEPAGE = "http://www.cdrkit.org"
+DEPENDS = "libcap2 bzip2"
+LICENSE = "GPLv2"
+
+SRC_URI = " \
+	http://cdrkit.org/releases/${P}.tar.gz;name=archive \
+	file://xconfig.patch \
+"
+
+inherit cmake
+
+SRC_URI[archive.md5sum] = "3c25505d567113c269dc6e71640646d8"
+SRC_URI[archive.sha256sum] = "8b6e90b4068cac6f3a75a501d7a85aba6583b2dc34f434e3eb62d29104b107e5"
diff --git a/recipes/cdrkit/cdrkit_1.1.9.bb b/recipes/cdrkit/cdrkit_1.1.9.bb
deleted file mode 100644
index 2986328..0000000
--- a/recipes/cdrkit/cdrkit_1.1.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-# cdrkit build file
-
-LICENSE="GPLv2"
-DESCRIPTION="A set of tools for CD recording"
-HOMEPAGE="http://www.cdrkit.org"
-
-PARALLEL_MAKE = ""
-DEPENDS = "libcap"
-SRC_URI="http://cdrkit.org/releases/cdrkit-${PV}.tar.gz \
-	file://xconfig.patch"
-
-S="${WORKDIR}/cdrkit-${PV}"
-PR = "r2"
-
-inherit cmake 
-
-do_install() {
-	oe_runmake install DESTDIR="${D}"
-}
-
-SRC_URI[md5sum] = "cbc0647e5d85f0e8fb3a692ba1d42edd"
-SRC_URI[sha256sum] = "d5d58ab4c7bef036a53ef9742b4e57621f61310cd0cd28f558ba0b88c354efa2"
diff --git a/recipes/cdrkit/files/xconfig.patch b/recipes/cdrkit/files/xconfig.patch
index 5af1a37..866b602 100644
--- a/recipes/cdrkit/files/xconfig.patch
+++ b/recipes/cdrkit/files/xconfig.patch
@@ -13,3 +13,13 @@
  #define	HAVE_C_BIGENDIAN	/* Flag that WORDS_BIGENDIAN test was done */
  #define	HAVE_C_BITFIELDS	/* Flag that BITFIELDS_HTOL test was done  */
  
+--- cdrkit-1.1.9/include/CMakeLists.txt.orig	2010-09-27 23:17:34.000000000 +0000
++++ cdrkit-1.1.9/include/CMakeLists.txt	2010-09-27 23:17:58.000000000 +0000
+@@ -35,7 +35,6 @@
+ INCLUDE(TestBigEndian)
+ TEST_BIG_ENDIAN(WORDS_BIGENDIAN)
+ 
+-TRY_RUN(BITFIELDS_HTOL TEST_DUMMY ${CMAKE_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/test_BITFIELDS_HTOL.c)
+ 
+ INCLUDE(CheckIncludeFiles)
+ 
-- 
1.7.1



