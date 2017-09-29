Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A81C07772F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:54:29 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8TEsTMn002093
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:54:29 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.77.178])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v8TEsToJ007987;
	Fri, 29 Sep 2017 16:54:29 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Sep 2017 16:54:27 +0200
Message-Id: <1506696867-21375-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-mono][PATCH] libgdiplus: include name in downloaded file
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
X-List-Received-Date: Fri, 29 Sep 2017 14:54:30 -0000

Without this change the file is named ${PV}.tar.gz

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-mono/libgdiplus/libgdiplus-native_4.2.bb | 3 +--
 recipes-mono/libgdiplus/libgdiplus_4.2.bb        | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
index 4dee6a0..d3a988e 100644
--- a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
+++ b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
@@ -6,8 +6,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe7364dfce9f3689eb6995e7cdd56879"
 
-SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
-	"
+SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz;downloadfilename=libgdiplus-${PV}.tar.gz"
 
 inherit autotools pkgconfig native
 
diff --git a/recipes-mono/libgdiplus/libgdiplus_4.2.bb b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
index 00eb406..03d87f7 100644
--- a/recipes-mono/libgdiplus/libgdiplus_4.2.bb
+++ b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
@@ -12,9 +12,9 @@ PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
 PACKAGECONFIG[gif] = "--with-libgif,--without-libgif,giflib"
 PACKAGECONFIG[exif] = "--with-libexif,--without-libexif,libexif"
 
-SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
-	   file://01-remove-libjpeg-path.patch \
-	"
+SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz;downloadfilename=libgdiplus-${PV}.tar.gz \
+           file://01-remove-libjpeg-path.patch \
+          "
 
 inherit autotools pkgconfig
 
-- 
2.1.4


