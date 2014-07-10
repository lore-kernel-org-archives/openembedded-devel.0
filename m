Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5F9701A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 07:07:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6A77p7Q002052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 00:07:51 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 10 Jul 2014 00:07:50 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Jul 2014 15:07:57 +0800
Message-ID: <1404976077-1809-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] sdparm: add recipe file
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
X-List-Received-Date: Thu, 10 Jul 2014 07:07:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../sdparm/files/make-sysroot-work.patch           |   27 ++++++++++++++++++++
 meta-oe/recipes-support/sdparm/sdparm_1.08.bb      |   17 ++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
 create mode 100644 meta-oe/recipes-support/sdparm/sdparm_1.08.bb

diff --git a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
new file mode 100644
index 0000000..b87e05c
--- /dev/null
+++ b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
@@ -0,0 +1,27 @@
+[PATCH] make sysroot work
+
+Upstream-Status: Pending
+
+Add = before the included dir to make sysroot work
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c83788c..9f62115 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -32,7 +32,7 @@ sglib_SOURCES =		../lib/sg_lib.c \
+ 			../lib/sg_pt_common.c
+ 
+ if HAVE_SGUTILS
+-INCLUDES = -I/usr/include/scsi
++INCLUDES = -I=/usr/include/scsi
+ sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
+ sdparm_DEPENDENCIES = @GETOPT_O_FILES@
+ else
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
new file mode 100644
index 0000000..713e451
--- /dev/null
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
@@ -0,0 +1,17 @@
+SUMMARY = "fetch and change SCSI mode pages"
+DESCRIPTION = "The sdparm utility accesses and optionally modifies \
+SCSI devices' mode page and inquiry data."
+HOMEPAGE = "http://sg.danny.cz/sg/sdparm.html"
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecab6c36b7ba82c675581dd0afde36f7 \
+                    file://lib/BSD_LICENSE;md5=1d52f4a66f1e0ed96776bf354ab7a2ed"
+DEPENDS="sg3-utils"
+SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
+           file://make-sysroot-work.patch \
+           "
+
+SRC_URI[md5sum] = "be5786f37499018ef44f409597c92d42"
+SRC_URI[sha256sum] = "376b78a414b1a9c47f3f13dbeb963e7a3ec7be126f83927d6856b5f7ac425e57"
+
+inherit autotools
-- 
1.7.10.4


