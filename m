Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF0970A0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:10:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8J3A6Fu001245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 20:10:06 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 20:10:05 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Sep 2014 23:10:02 -0400
Message-ID: <2b3f477519a9ff09ab1b7620241ba1bc9eb792ec.1411095911.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1411095911.git.wenzong.fan@windriver.com>
References: <cover.1411095911.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-oe] imagemagick: do not install magick-baseconfig.h repeatedly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 03:10:11 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Both targets install-data-local & install-includeHEADERS will install
header file magick-baseconfig.h to the same location, and they might
be run in the same time while enabling parallel build:

* target dependencies:
  + install-data-am: ... install-data-local ... install-includeHEADERS

* make install error:
  /usr/bin/install: cannot create regular file \
  `.../usr/include/ImageMagick-6/magick/magick-baseconfig.h': \
  File exists \
  make[3]: *** [install-magickincarchHEADERS] Error 1

* reproduce the error:
  $ /usr/bin/install test /tmp & /usr/bin/install test /tmp
  [1] 4052
  /usr/bin/install: cannot create regular file `/tmp/test': File exists
  [1]+  Exit 1                  /usr/bin/install test /tmp

Just disable the one from install-data-local to remove this race issue.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...ot-install-magick-baseconfig.h-repeatedly.patch |   49 ++++++++++++++++++++
 .../imagemagick/imagemagick_6.8.8.bb               |    1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch b/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch
new file mode 100644
index 0000000..114fb5e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/do-not-install-magick-baseconfig.h-repeatedly.patch
@@ -0,0 +1,49 @@
+From bbdd42384d0b5f3ccb11465f63d90097579a1897 Mon Sep 17 00:00:00 2001
+From: Konrad Scherer <konrad.scherer@windriver.com>
+Date: Tue, 10 Jun 2014 15:43:16 +0800
+Subject: [PATCH] imagemagick: do not install magick-baseconfig.h repeatedly
+
+Both targets install-data-local & install-includeHEADERS will install
+header file magick-baseconfig.h to the same location, and they might
+be run in the same time while enabling parallel build:
+
+* target dependencies:
+  + install-data-am: ... install-data-local ... install-includeHEADERS
+
+* make install error:
+  /usr/bin/install: cannot create regular file \
+  `.../usr/include/ImageMagick-6/magick/magick-baseconfig.h': \
+  File exists \
+  make[3]: *** [install-magickincarchHEADERS] Error 1
+
+* reproduce the error:
+  $ /usr/bin/install test /tmp & /usr/bin/install test /tmp
+  [1] 4052
+  /usr/bin/install: cannot create regular file `/tmp/test': File exists
+  [1]+  Exit 1                  /usr/bin/install test /tmp
+
+Just disable the one from install-data-local to remove this race issue.
+
+Upstream-Status: pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ magick/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/magick/Makefile.am b/magick/Makefile.am
+index 2f72461..e45466c 100644
+--- a/magick/Makefile.am
++++ b/magick/Makefile.am
+@@ -468,7 +468,7 @@ MAGICK_EXTRA_DIST = \
+ 	magick/xwdfile.h_vms 
+ 
+ # Install magick-baseconfig.h
+-MAGICK_INSTALL_DATA_LOCAL_TARGETS = magick-install-data-local
++MAGICK_INSTALL_DATA_LOCAL_TARGETS =
+ magick-install-data-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(magickincarchdir)
+ 	$(INSTALL_HEADER) magick/magick-baseconfig.h $(DESTDIR)$(magickincarchdir)/magick-baseconfig.h
+-- 
+1.8.2.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
index 31207da..847ab34 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
@@ -8,6 +8,7 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 PATCHSET = "10"
 SRC_URI = "http://www.imagemagick.org/download/legacy/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://remove.dist-lzip.patch \
+           file://do-not-install-magick-baseconfig.h-repeatedly.patch \
 "
 SRC_URI[md5sum] = "a3a0fa301965d6fde68fccd066f62b0b"
 SRC_URI[sha256sum] = "8c0982b2bc0c1cea8ac9627b4e1e5d37f8171ef8282ee09aef32529cf68e1820"
-- 
1.7.9.5


