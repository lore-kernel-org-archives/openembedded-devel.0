Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 61A9C734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 12:37:27 +0000 (UTC)
Received: from iapetus.enea.se (172.16.140.15) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Jun 2015 14:37:26 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 14:36:52 +0200
Message-ID: <1433421412-2498-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][PATCH] libhugetlbfs: project moved to github
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
X-List-Received-Date: Thu, 04 Jun 2015 12:37:30 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 4ce6a19..ce0c6af 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A library which provides easy access to huge pages of memory"
+HOMEPAGE = "https://github.com/libhugetlbfs/libhugetlbfs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
@@ -10,7 +11,8 @@ PV = "2.18"
 PE = "1"
 
 SRCREV = "ea3f6b273f535aab38cefae30030774457bbbfe6"
-SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
+SRC_URI = " \
+    git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
-- 
2.1.0


