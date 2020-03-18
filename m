Return-Path: <ssajal@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00D756012F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 19:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02IJsck6011083
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 12:54:38 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 18 Mar 2020 12:54:38 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 35698901348;
	Wed, 18 Mar 2020 12:54:38 -0700 (PDT)
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 12:54:36 -0700
Message-ID: <20200318195436.185832-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gd: Fix CVE-2018-14553
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
X-List-Received-Date: Wed, 18 Mar 2020 19:54:38 -0000
Content-Type: text/plain

Backport fix from upstream to fix NULL pointer dereference.

Upstream-Status: Backport
CVE: CVE-2018-14553

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../gd/gd/CVE-2018-14553.patch                | 110 ++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb        |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch b/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch
new file mode 100644
index 000000000..344f34feb
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch
@@ -0,0 +1,110 @@
+From a93eac0e843148dc2d631c3ba80af17e9c8c860f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?F=C3=A1bio=20Cabral=20Pacheco?= <fcabralpacheco@gmail.com>
+Date: Fri, 20 Dec 2019 12:03:33 -0300
+Subject: [PATCH] Fix potential NULL pointer dereference in gdImageClone()
+
+---
+ src/gd.c                          |  9 +--------
+ tests/gdimageclone/.gitignore     |  1 +
+ tests/gdimageclone/CMakeLists.txt |  1 +
+ tests/gdimageclone/Makemodule.am  |  3 ++-
+ tests/gdimageclone/style.c        | 30 ++++++++++++++++++++++++++++++
+ 5 files changed, 35 insertions(+), 9 deletions(-)
+ create mode 100644 tests/gdimageclone/style.c
+
+diff --git a/src/gd.c b/src/gd.c
+index 592a028..d564d1f 100644
+--- a/src/gd.c
++++ b/src/gd.c
+@@ -2865,14 +2865,6 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
+ 		}
+ 	}
+ 
+-	if (src->styleLength > 0) {
+-		dst->styleLength = src->styleLength;
+-		dst->stylePos    = src->stylePos;
+-		for (i = 0; i < src->styleLength; i++) {
+-			dst->style[i] = src->style[i];
+-		}
+-	}
+-
+ 	dst->interlace   = src->interlace;
+ 
+ 	dst->alphaBlendingFlag = src->alphaBlendingFlag;
+@@ -2907,6 +2899,7 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
+ 
+ 	if (src->style) {
+ 		gdImageSetStyle(dst, src->style, src->styleLength);
++		dst->stylePos = src->stylePos;
+ 	}
+ 
+ 	for (i = 0; i < gdMaxColors; i++) {
+diff --git a/tests/gdimageclone/.gitignore b/tests/gdimageclone/.gitignore
+index a70782d..f4129cc 100644
+--- a/tests/gdimageclone/.gitignore
++++ b/tests/gdimageclone/.gitignore
+@@ -1 +1,2 @@
+ /bug00300
++/style
+diff --git a/tests/gdimageclone/CMakeLists.txt b/tests/gdimageclone/CMakeLists.txt
+index e6ccc31..662f4e9 100644
+--- a/tests/gdimageclone/CMakeLists.txt
++++ b/tests/gdimageclone/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ LIST(APPEND TESTS_FILES
+ 	bug00300
++	style
+ )
+ 
+ ADD_GD_TESTS()
+diff --git a/tests/gdimageclone/Makemodule.am b/tests/gdimageclone/Makemodule.am
+index 4b1b54c..51abf5c 100644
+--- a/tests/gdimageclone/Makemodule.am
++++ b/tests/gdimageclone/Makemodule.am
+@@ -1,5 +1,6 @@
+ libgd_test_programs += \
+-	gdimageclone/bug00300
++	gdimageclone/bug00300 \
++	gdimageclone/style
+ 
+ EXTRA_DIST += \
+ 	gdimageclone/CMakeLists.txt
+diff --git a/tests/gdimageclone/style.c b/tests/gdimageclone/style.c
+new file mode 100644
+index 0000000..c2b246e
+--- /dev/null
++++ b/tests/gdimageclone/style.c
+@@ -0,0 +1,30 @@
++/**
++ * Cloning an image should exactly reproduce all style related data
++ */
++
++
++#include <string.h>
++#include "gd.h"
++#include "gdtest.h"
++
++
++int main()
++{
++    gdImagePtr im, clone;
++    int style[] = {0, 0, 0};
++
++    im = gdImageCreate(8, 8);
++    gdImageSetStyle(im, style, sizeof(style)/sizeof(style[0]));
++
++    clone = gdImageClone(im);
++    gdTestAssert(clone != NULL);
++
++    gdTestAssert(clone->styleLength == im->styleLength);
++    gdTestAssert(clone->stylePos == im->stylePos);
++    gdTestAssert(!memcmp(clone->style, im->style, sizeof(style)/sizeof(style[0])));
++
++    gdImageDestroy(clone);
++    gdImageDestroy(im);
++
++    return gdNumFailures();
++}
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index dda2e67d6..a665de4bf 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://CVE-2018-1000222.patch \
            file://CVE-2019-6978.patch \
            file://CVE-2017-6363.patch \
+           file://CVE-2018-14553.patch \
           "
 
 SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
-- 
2.17.1


