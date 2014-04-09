Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E69665DEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 07:49:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s397nbaA013382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 00:49:37 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 00:49:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 15:50:26 +0800
Message-ID: <1397029826-16492-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fbset: fix parallel build
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
X-List-Received-Date: Wed, 09 Apr 2014 07:49:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix an incorrect dependency in makefile so that we can build
in parallel.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../fbset-2.1/fbset-2.1-fix-makefile-dep.patch     |   31 ++++++++++++++++++++
 meta-oe/recipes-support/fbset/fbset_2.1.bb         |    6 ++--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch

diff --git a/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
new file mode 100644
index 0000000..41ab8af
--- /dev/null
+++ b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.patch
@@ -0,0 +1,31 @@
+From 3db6782de1de7ca4f1bb9ee7652c4f2808e57539 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 10 Jan 2013 12:24:33 +0800
+Subject: [PATCH] fbset 2.1 fix makefile dep modes.tab.c
+
+Upstream-Status: Inappropriate [no upstream]
+
+fix the error in parallel build:
+make: *** No rule to make target `modes.tab.h', needed by `lex.yy.o'.  Stop. 
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 61536c1..09183e5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -15,7 +15,7 @@ fbset:		fbset.o modes.tab.o lex.yy.o
+ 
+ fbset.o:	fbset.c fbset.h fb.h
+ modes.tab.o:	modes.tab.c fbset.h fb.h
+-lex.yy.o:	lex.yy.c fbset.h modes.tab.h
++lex.yy.o:	lex.yy.c fbset.h modes.tab.c
+ 
+ lex.yy.c:	modes.l
+ 		$(FLEX) modes.l
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index aa78008..84f35ff 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -14,12 +14,12 @@ DEPENDS = "bison-native"
 PR = "r4"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
-           file://makefile.patch"
+           file://makefile.patch \
+           file://fbset-2.1-fix-makefile-dep.patch \
+"
 
 inherit autotools update-alternatives
 
-PARALLEL_MAKE = ""
-
 do_install() {
     install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
     install -m 0755 ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real
-- 
1.7.9.5


