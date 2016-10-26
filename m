Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0DA971A31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:14:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q2EF7w013505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 19:14:15 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 19:14:14 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Oct 2016 10:14:11 +0800
Message-ID: <1477448051-9728-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH V3] sdparm: 1.09 -> 1.10
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
X-List-Received-Date: Wed, 26 Oct 2016 02:14:13 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../recipes-support/sdparm/files/make-sysroot-work.patch   | 14 +++++++++-----
 .../sdparm/{sdparm_1.09.bb => sdparm_1.10.bb}              |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/sdparm/{sdparm_1.09.bb => sdparm_1.10.bb} (83%)

diff --git a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
index 5405ed8..3fd85d9 100644
--- a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
+++ b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
@@ -1,27 +1,31 @@
-[PATCH] make sysroot work
+From 15f0722bc5481cca5ba92adceab8c769112e4ea6 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Mon, 24 Oct 2016 07:28:13 +0000
+Subject: [PATCH] sdparm: make sysroot work
 
 Upstream-Status: Pending
 
 Add = before the included dir to make sysroot work
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  src/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c83788c..9f62115 100644
+index 61dd9f8..42c911f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -32,7 +32,7 @@ sglib_SOURCES =		../lib/sg_lib.c \
+@@ -41,7 +41,7 @@ sglib_SOURCES =		../lib/sg_lib.c \
  			../lib/sg_pt_common.c
  
  if HAVE_SGUTILS
--INCLUDES = -I/usr/include/scsi
+-INCLUDES = -I/scsi
 +INCLUDES = -I=@includedir@/scsi
  sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
  sdparm_DEPENDENCIES = @GETOPT_O_FILES@
  else
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.09.bb b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
similarity index 83%
rename from meta-oe/recipes-support/sdparm/sdparm_1.09.bb
rename to meta-oe/recipes-support/sdparm/sdparm_1.10.bb
index ca11ca4..8ab2819 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.09.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS_${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "e51b1fd41c3e4c9d1274a2e4f046eebf"
-SRC_URI[sha256sum] = "7294f44173ac0946f1de8af02b1bdb0bd648079245396589397a2b0d3abc42d3"
+SRC_URI[md5sum] = "bdae64375376ce8fe4bf9521c1db858f"
+SRC_URI[sha256sum] = "1ea1ed1bb1ee2aef62392618fa42da9ed027d5e655f174525c39235778292ab3"
 
 inherit autotools
 
-- 
2.7.4


