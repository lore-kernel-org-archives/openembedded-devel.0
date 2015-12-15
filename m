Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43ABB60796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 06:46:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBF6kbGF023703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 22:46:37 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 14 Dec 2015 22:46:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2015 14:46:45 +0800
Message-ID: <1450162005-9885-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-7: drop an inappropriate patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 06:46:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The patch icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
is to add static option to build nio gensor/genuc/gensc, and
was added when upgrading to IcedTea 2.6.1 OpenJDK 7u85b01.

Another patch icedtea-jdk-nio-use-host-cc.patch uses host cc
for nio build so it fails on host that lack of static libraries:
| /usr/bin/ld: cannot find -lpthread

And there is no comments explaining why it needs static linking,
so drop the patch for now unless we have better understanding
and make a more proper patch.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |  2 --
 ...a-jdk-build-nio-gensor-genuc-gensc-static.patch | 29 ----------------------
 2 files changed, 31 deletions(-)
 delete mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch

diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index 4bff40a..854d179 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -52,7 +52,6 @@ OEPATCHES = "\
 ICEDTEAPATCHES = "\
     file://icedtea-zero-hotspotfix.patch;apply=no \
     file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
-    file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
     file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
     file://icedtea-crosscompile-fix.patch;apply=no \
     file://icedtea-xawt-crosscompile-fix.patch;apply=no \
@@ -61,7 +60,6 @@ ICEDTEAPATCHES = "\
 DISTRIBUTION_PATCHES = "\
     patches/icedtea-zero-hotspotfix.patch \
     patches/icedtea-jdk-nio-use-host-cc.patch \
-    patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
     patches/icedtea-jdk-rmi-crosscompile.patch \
     patches/icedtea-crosscompile-fix.patch \
     patches/icedtea-xawt-crosscompile-fix.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
deleted file mode 100644
index 3152b38..0000000
--- a/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -966,7 +966,7 @@
- 
- $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
- 	$(prep-target)
--	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) $(LDDFLAGS) \
-+	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) -static $(LDDFLAGS) \
- 	   -o genSocketOptionRegistry$(EXE_SUFFIX) $(GENSOR_SRC))
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
-@@ -1006,7 +1006,7 @@
- 
- $(GENUC_EXE) : $(GENUC_SRC)
- 	$(prep-target)
--	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENUC_SRC)
-+	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENUC_SRC)
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
- $(SFS_GEN)/UnixConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/UnixConstants-$(PLATFORM)-$(ARCH).java
-@@ -1032,7 +1032,7 @@
- 
- $(GENSC_EXE) : $(GENSC_SRC)
- 	$(prep-target)
--	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENSC_SRC)
-+	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENSC_SRC)
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
- $(SFS_GEN)/SolarisConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/SolarisConstants-$(PLATFORM)-$(ARCH).java
-- 
2.3.5


