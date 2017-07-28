Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9DF78399
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 03:37:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6S3bPRK023089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 27 Jul 2017 20:37:25 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Jul 2017 20:37:24 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 11:28:04 +0800
Message-ID: <20170728032804.11300-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] assimp: remove recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 03:37:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove recipe of assimp which exists in oe-core.

* Patch 0001-Fix-build-on-big-endian-architectures.patch has been merged
  in 4.0.0
* Dependencies 'boost' and 'virtual/libgl' are dropped which needded by
  ASSIMP_BUILD_SAMPLES but ASSIMP_BUILD_SAMPLES is disabled by default
* Sync up other parts such as DESCRIPTION with the recipe in oe-core

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...001-Fix-build-on-big-endian-architectures.patch | 29 ----------------------
 meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb    | 18 --------------
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
 delete mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb

diff --git a/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch b/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
deleted file mode 100644
index c94bb3d..0000000
--- a/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 614475dcac1cee4d63b764282c578672bc060321 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 14:23:00 -0700
-Subject: [PATCH] Fix build on big-endian architectures
-
-see
-https://github.com/assimp/assimp/pull/986
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- code/glTFAsset.inl | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/code/glTFAsset.inl b/code/glTFAsset.inl
-index d52c825c..470246c9 100644
---- a/code/glTFAsset.inl
-+++ b/code/glTFAsset.inl
-@@ -40,6 +40,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
- #include "StringUtils.h"
- 
-+using namespace Assimp;
-+
- namespace glTF {
- 
- namespace {
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
deleted file mode 100644
index 064683a..0000000
--- a/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
-               various well-known 3D model formats in a uniform manner."
-HOMEPAGE = "http://www.assimp.org/"
-SECTION = "devel"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4cd8c0aedc7a0623476669377d7eeda8"
-
-DEPENDS = "boost virtual/libgl"
-
-SRCREV = "a8673d4828df5107186f49e5e4efa5316b727482"
-SRC_URI = "git://github.com/assimp/assimp \
-           file://0001-Fix-build-on-big-endian-architectures.patch \
-           "
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.10.1


