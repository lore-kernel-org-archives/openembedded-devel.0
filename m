Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D3979943
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 01:19:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9G1Ixn7012771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 18:19:10 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 15 Oct 2018 18:18:49 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<manjukumar.harthikote-matha@xilinx.com>, <akuster808@gmail.com>
Date: Tue, 16 Oct 2018 09:18:47 +0800
Message-ID: <1539652727-4633-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] wireshark: update to 2.6.4
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
X-List-Received-Date: Tue, 16 Oct 2018 01:19:47 -0000
Content-Type: text/plain

* Update SRC_URI
  In https://1.as.dl.wireshark.org/src/, it only keep the latest
  release. Switch to https://1.as.dl.wireshark.org/src/all-versions/
  to make sure the old release can be found.

* Drop patch fix-fatal-no-names-found-git-error.patch
  Actually this piece of code should not be invoked when build from
  tarball. But in previous releases the code will be performed when
  building native package if host with rpmbuild and git installed, which
  will cause a configure error. This issue has been fixed in 2.6.4:
    commit 4fbc017e80d6d11f8c26cad12d883fd6da9d3504
    CMake: Fix build from tarball under certain conditions

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fix-fatal-no-names-found-git-error.patch       | 23 ----------------------
 .../{wireshark_2.6.2.bb => wireshark_2.6.4.bb}     |  7 +++----
 2 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.2.bb => wireshark_2.6.4.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
deleted file mode 100644
index 80119e3..0000000
--- a/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-fixes
-
-| fatal: No names found, cannot describe anything.
-| CMake Error at CMakeLists.txt:3086 (string):
-|   string begin index: 1 is out of range 0 - 0
-
-Use always to circumvent the issue if git tag is not present
-
-Upstream-status: Pending
-
-Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
----
---- wireshark-2.6.1/CMakeLists.txt	2018-08-08 18:18:05.388318652 -0700
-+++ wireshark-2.6.1/CMakeLists-fix.txt	2018-08-08 18:22:27.829670496 -0700
-@@ -3078,7 +3078,7 @@
- 	endif()
- 
- 	execute_process(
--		COMMAND git describe --abbrev=8 --match v[1-9]*
-+		COMMAND git describe --always --abbrev=8 --match v[1-9]*
- 		OUTPUT_VARIABLE _git_description
- 		OUTPUT_STRIP_TRAILING_WHITESPACE
- 		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb
index 5be7d4f..595502e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb
@@ -8,15 +8,14 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
+SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
            file://0001-Add-libm-to-link-for-fmod-API.patch \
-           file://fix-fatal-no-names-found-git-error.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
-SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
+SRC_URI[md5sum] = "8aa7b8c8ce0b6ce4256a081493819d6f"
+SRC_URI[sha256sum] = "a06b007e6343f148b8b93443b2fcfc9bb3204311cd268565d54d1b71660bc861"
 
 PE = "1"
 
-- 
2.7.4


