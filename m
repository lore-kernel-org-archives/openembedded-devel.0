Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE3760A88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 23:59:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2013 16:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="401691802"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.66])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2013 16:59:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2013 00:58:54 +0100
Message-Id: <3aa48bfdc2fe9de7144730bef76bd39fb6807da9.1380239858.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380239858.git.paul.eggleton@linux.intel.com>
References: <cover.1380239858.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1380239858.git.paul.eggleton@linux.intel.com>
References: <cover.1380239858.git.paul.eggleton@linux.intel.com>
Subject: [meta-multimedia][PATCH 2/2] schroedinger: add recipe
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
X-List-Received-Date: Thu, 26 Sep 2013 23:59:00 -0000

Originally based on the recipe from OE-Classic. Changes from that
version:

* Remove packaging of gstreamer plugin that was removed in 1.09
* Inherit pkgconfig since pkg-config is being used
* Set more appropriate LICENSE
* Add LIC_FILES_CHKSUM
* Add SUMMARY
* Optimise out inc file since it doesn't seem particularly useful to
  have one for this recipe

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../schroedinger/files/configure.ac.patch          | 20 ++++++++++++++++++++
 .../schroedinger/schroedinger_1.0.11.bb            | 22 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch
 create mode 100644 meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch b/meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch
new file mode 100644
index 0000000..2ed8d22
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/schroedinger/files/configure.ac.patch
@@ -0,0 +1,20 @@
+Use the version of orcc in the sysroot not the one from the host
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: schroedinger-1.0.9/configure.ac
+===================================================================
+--- schroedinger-1.0.9.orig/configure.ac
++++ schroedinger-1.0.9/configure.ac
+@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" != xyes ; then
+   AC_ERROR([orc-0.4 >= $ORC_VER is required])
+ fi
+ SCHRO_PKG_DEPS="$SCHRO_PKG_DEPS orc-0.4 >= $ORC_VER"
+-ORCC=`$PKG_CONFIG --variable=orcc orc-0.4`
++ORCC=$STAGING_DIR`$PKG_CONFIG --variable=orcc orc-0.4`
+ AC_SUBST(ORCC)
+ 
+ AC_ARG_WITH([thread],
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
new file mode 100644
index 0000000..c338903
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Dirac compressed video encoder/decoder"
+HOMEPAGE = "http://schrodinger.sourceforge.net/"
+LICENSE = "MPL-1.1 | GPLv2 | LGPLv2 | MIT"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
+                    file://COPYING.GPL;md5=e181e3b7c66f5f96921d813c1074f833 \
+                    file://COPYING.LGPL;md5=38c893e21baec4cd75ad800ba9e2410a \
+                    file://COPYING.MIT;md5=8b345371b3536b4ce37ead1eafc88221 \
+                    file://COPYING.MPL;md5=0117647fecb9a932c25a7bbfc0333c37"
+
+DEPENDS = "liboil orc-native orc"
+
+SRC_URI = "http://www.diracvideo.org/download/schroedinger/${BP}.tar.gz \
+           file://configure.ac.patch"
+
+SRC_URI[md5sum] = "da6af08e564ca1157348fb8d92efc891"
+SRC_URI[sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912"
+
+EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
+
+inherit autotools pkgconfig
+
-- 
1.8.1.2


