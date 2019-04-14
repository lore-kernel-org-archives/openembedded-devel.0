Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 038577DA6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:16:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 557713A5023
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 16:17:48 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6599420004;
	Sun, 14 Apr 2019 16:17:46 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2019 09:17:23 -0700
Message-Id: <20190414161725.21617-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] gpm: Generate documentation
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
X-List-Received-Date: Sun, 14 Apr 2019 18:16:31 -0000
Content-Transfer-Encoding: 8bit

Remove patch disabling documentation, since it builds and is packaged
properly.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-support/gpm/gpm/no-docs.patch | 18 ------------------
 meta-oe/recipes-support/gpm/gpm_git.bb        |  1 -
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gpm/gpm/no-docs.patch

diff --git a/meta-oe/recipes-support/gpm/gpm/no-docs.patch b/meta-oe/recipes-support/gpm/gpm/no-docs.patch
deleted file mode 100644
index 3faef84ee..000000000
--- a/meta-oe/recipes-support/gpm/gpm/no-docs.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
-Index: gpm-1.99.7/Makefile.in
-===================================================================
---- gpm-1.99.7.orig/Makefile.in	2008-07-24 03:36:35.000000000 -0700
-+++ gpm-1.99.7/Makefile.in	2010-06-22 18:28:45.269507001 -0700
-@@ -19,7 +19,7 @@
- # user-overridable flags, but it's also all the implicit rule looks at.
- # missing ?
- 
--SUBDIRS = src doc contrib
-+SUBDIRS = src
- 
- 
- ### simple, but effective rules
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index fa0307038..012dceb23 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -13,7 +13,6 @@ DEPENDS = "ncurses bison-native"
 
 SRC_URI = "git://github.com/telmich/gpm;protocol=git \
            file://init \
-           file://no-docs.patch \
            file://processcreds.patch \
            file://gpm.service.in \
            file://0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch \
-- 
2.21.0


