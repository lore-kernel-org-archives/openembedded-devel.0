Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE19676099
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 06:14:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B6EjBA029417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 23:14:45 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 10 Jul 2018 23:14:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jul 2018 14:24:46 +0800
Message-ID: <1531290287-82549-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] sblim-sfcb: fix sfcbinst2mof_DEPENDENCIES in Makefile.am
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
X-List-Received-Date: Wed, 11 Jul 2018 06:14:45 -0000
Content-Type: text/plain

Fixed build with automake 1.16.1:
/path/to/i586-poky-linux/8.1.0/ld: cannot find -lsfcBrokerCore
collect2: error: ld returned 1 exit status

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch        | 31 ++++++++++++++++++++++
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch
new file mode 100644
index 0000000..7279d84
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch
@@ -0,0 +1,31 @@
+From ad6ca4f392bf549239b1ed3b2b372070eb127e7f Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 11 Jul 2018 11:06:04 +0800
+Subject: [PATCH] Makefile.am: fix sfcbinst2mof_DEPENDENCIES
+
+Fixed build with automake 1.16.1:
+/path/to/i586-poky-linux/8.1.0/ld: cannot find -lsfcBrokerCore
+collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 34ac319..47deed7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -360,6 +360,7 @@ sfcbproc_SOURCES=sfcbproc.c
+ 
+ sfcbinst2mof_SOURCES=sfcbinst2mof.c
+ sfcbinst2mof_LDADD = -lsfcFileRepository -lsfcBrokerCore
++sfcbinst2mof_DEPENDENCIES = libsfcBrokerCore.la libsfcFileRepository.la
+ 
+ sfcbtrace_SOURCES=sfcbtrace.c
+ sfcbtrace_LDADD = -lsfcBrokerCore
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 10ffaaa..ffbe7ea 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.4.9-fix-ftbfs.patch \
            file://0001-include-stdint.h-system-header-for-UINT16_MAX.patch \
            file://0001-Replace-need-for-error.h-when-it-does-not-exist.patch \
+           file://sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch \
 "
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
-- 
2.7.4


