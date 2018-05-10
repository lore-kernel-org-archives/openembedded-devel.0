Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA5575120
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:10:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4AGA7Id028729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:10:22 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 May 2018 09:09:56 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 May 2018 09:09:56 -0700
Message-ID: <20180510160956.85938-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] icetea7, openjdk-8: Fix depenency to xproto -> xorgproto
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
X-List-Received-Date: Thu, 10 May 2018 16:10:32 -0000
Content-Type: text/plain

The latest oe-core has changed the X protocol header provider package
name.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc  | 2 +-
 recipes-core/openjdk/openjdk-8-cross.inc  | 2 +-
 recipes-core/openjdk/openjdk-8-native.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index d4cf7ac..2c9fa92 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -12,7 +12,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
           "
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-native libxext-native libxrender-native"
+PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
 CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d70c946..46f13fd 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -21,7 +21,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     gif jpeg png zlib \
 "
-PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
+PACKAGECONFIG[x11] = "--with-x,,libx11 xorgproto libxt libxext libxrender libxtst"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
 
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index d674474..b782c32 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -10,7 +10,7 @@ DEPENDS = "\
 SRC_URI_append += "file://handle_extra_output.patch"
 
 PACKAGECONFIG ??= "gif jpeg png zlib"
-PACKAGECONFIG[x11] = "--with-x,,libx11-native xproto-native libxt-native libxext-native libxrender-native"
+PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
 PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
-- 
2.11.0


