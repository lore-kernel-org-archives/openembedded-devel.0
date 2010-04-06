Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NzDpd-0001zQ-U6
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 20:49:06 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 73DF223C49; Tue,  6 Apr 2010 22:42:18 +0400 (MSD)
From: khimov@altell.ru
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Apr 2010 22:41:54 +0400
Message-Id: <1270579314-1971-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vladimir Sorokin <sorokin@altell.ru>
Subject: [PATCH] binutils: Add x86_64_i386_biarch patch for 2.20 & 2.20.1
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
X-List-Received-Date: Tue, 06 Apr 2010 18:49:06 -0000

From: Vladimir Sorokin <sorokin@altell.ru>

Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/binutils/binutils_2.20.1.bb |    3 ++-
 recipes/binutils/binutils_2.20.bb   |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 4f736f4..e5e7f54 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
-INC_PR = "r0"
+INC_PR = "r1"
 PR = "${INC_PR}.0"
 
 SRC_URI = "\
@@ -12,6 +12,7 @@ SRC_URI = "\
      file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=1 \
      "
 
 SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
diff --git a/recipes/binutils/binutils_2.20.bb b/recipes/binutils/binutils_2.20.bb
index 6863582..63186a4 100644
--- a/recipes/binutils/binutils_2.20.bb
+++ b/recipes/binutils/binutils_2.20.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
-INC_PR = "r1"
+INC_PR = "r2"
 PR = "${INC_PR}.4"
 
 SRC_URI = "\
@@ -15,6 +15,7 @@ SRC_URI = "\
      file://ld-stub-crash.patch;patch=1;pnum=0 \
      file://binutils-arm-non-empty-know.patch;patch=1 \
      file://binutils_unexport_LD_LIBRARY_PATH_for_CC_FOR_BUILD.patch;patch=1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=1 \
      "
 
 # powerpc patches
-- 
1.6.4.2



