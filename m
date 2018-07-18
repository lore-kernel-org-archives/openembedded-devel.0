Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B92D78493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7Vmds001623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:48 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:28 +0800
Message-ID: <1531899089-395618-9-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] udisks2: 2.7.6 -> 2.7.7
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:47 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../udisks2/0001-data-fix-out-of-tree-build.patch  | 35 ----------------------
 .../udisks/{udisks2_2.7.6.bb => udisks2_2.7.7.bb}  |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.7.6.bb => udisks2_2.7.7.bb} (91%)

diff --git a/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch b/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
deleted file mode 100644
index 1cbd877..0000000
--- a/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7fdd4acdf6daf95c5cc74e968f4710513c8ddaea Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 23 Mar 2018 18:33:52 +0100
-Subject: [PATCH] data: fix out of tree build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| sed: can't read udisks2.service.in: No such file or directory
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/storaged-project/udisks/pull/510
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- data/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/data/Makefile.am b/data/Makefile.am
-index ddf9e3d6..b38928c8 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -22,7 +22,7 @@ systemdservicedir       = $(systemdsystemunitdir)
- systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
- 
- $(systemdservice_DATA): udisks2.service.in Makefile
--	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" udisks2.service.in > udisks2.service
-+	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" $(srcdir)/udisks2.service.in > udisks2.service
- endif
- 
- udevrulesdir = $(udevdir)/rules.d
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb b/meta-oe/recipes-support/udisks/udisks2_2.7.7.bb
similarity index 91%
rename from meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.7.7.bb
index 4d22afd..ac86a69 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.7.7.bb
@@ -20,10 +20,9 @@ RDEPENDS_${PN} = "acl"
 
 SRC_URI = " \
     git://github.com/storaged-project/udisks.git \
-    file://0001-data-fix-out-of-tree-build.patch \
     file://non-gnu-libc.patch \
 "
-SRCREV = "b6471f2e99f6aa1133af0de658f1fa05c748932c"
+SRCREV = "fcf888ca00980f75ce0c47041629b3d77e9f352e"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.7.4


