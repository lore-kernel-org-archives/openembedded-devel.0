Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5046A6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYg3DY4zFr
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489319;
	bh=9ly843VowJp/9aObViU/5Xs4Kr9z4xxJR7dXjhgaLIc=;
	h=From:To:Subject:Date:From;
	b=fk8BwJFHnzHW2hbFUFyb4jFS4oU7ngztCPRBIymJRrKkeYW5udCFqbmbSlmB8niM8
	WOcFpo/bJNk7kqBxZQ2prM4O2dDfpJCkRN4J7b4B56Gv4prMYA8cV16ve2CWJem4Yc
	ymOU7uG7bOTMdDHNIIGoOJlsS/zNrRRGzXS5WeP98sVQ0YACFVwyPfZC4uFCIfrG8m
	JMQtOw2UFLxYVxzUAzsiQQVvbtq2pCN2jEeTcihRot/lPd55aTIMuuFcNczXAxTpiv
	wO2Zu19WCd4mx+Ag+jqGTL57QVUzOVsmQaouGEGCuQ4HAu4HNIaUytJ50y/gKzn/sA
	0FhzoKdcDl7reBUixxXDDyRqs3VSoFZov+ps9u+4fYlThJDTe2lFh+mbaN+fc+evrU
	w3XcZMoFCF6EzUjLdS1majya0l7O3McWVspR0KO+T5uIcJUbXkpeILI9TWoEaEcSBp
	E0qk3RR6hmZL7m/nj3jEPTm3MzQucHhvg06awYEHmTkhxshd/I7nU6Xqc14vFF63KQ
	z0xAsrvZ+wOYn/qD1MtdO556XhAKFhSdYkxBjm8ttCdyiB9hmV263hHHfvjyCxUvnp
	726eTxwfOnPfywUw2VMHeHT7T1XBrswSXQFkpOwEKLKh9CJeH1o26zPP8cNYxQVzLs
	SXKXr/uXTH6lrUV+nA+m9nR4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:06 +0300
Message-Id: <20190510115515.19491-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] geos: Upgrade 3.4.2 -> 3.4.3
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
X-List-Received-Date: Fri, 10 May 2019 11:55:18 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../geos/files/fix-gcc6-isnan.patch           | 22 -------------------
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb |  7 ------
 meta-oe/recipes-navigation/geos/geos_3.4.3.bb |  7 ++++++
 3 files changed, 7 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
 delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.3.bb

diff --git a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch b/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
deleted file mode 100644
index 5c5fbd1d9..000000000
--- a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- geos-3.4.2/configure.in.orig	2016-06-08 17:46:43.002250304 +0000
-+++ geos-3.4.2/configure.in	2016-06-08 17:57:36.342241606 +0000
-@@ -197,7 +197,7 @@
- AC_LANG_PUSH([C++])
- AC_CACHE_CHECK([for isnan], ac_cv_isnan,
-  [AC_TRY_LINK([#include <cmath>],
-- [double x; int y; y = isnan(x);],
-+ [double x; int y; y = std::isnan(x);],
-  ac_cv_isnan=yes,
-  ac_cv_isnan=no
- )])
---- geos-3.4.2/include/geos/platform.h.in.orig	2016-06-08 14:06:53.910234182 -0400
-+++ geos-3.4.2/include/geos/platform.h.in	2016-06-08 14:07:19.298233844 -0400
-@@ -84,7 +84,7 @@
- #endif
- 
- #if defined(HAVE_ISNAN)
--# define ISNAN(x) (isnan(x))
-+# define ISNAN(x) (std::isnan(x))
- #else
- # if defined(_MSC_VER)
- #  define ISNAN(x) _isnan(x)
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
deleted file mode 100644
index 7193f8fb5..000000000
--- a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require geos.inc
-
-SRC_URI += "file://geos-config-Add-includedir-variable.patch \
-            file://fix-gcc6-isnan.patch"
-
-SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
-SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.3.bb b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
new file mode 100644
index 000000000..538456cc2
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
@@ -0,0 +1,7 @@
+require geos.inc
+
+SRC_URI += "file://geos-config-Add-includedir-variable.patch \
+"
+
+SRC_URI[md5sum] = "77f2c2cca1e9f49bc1bece9037ac7a7a"
+SRC_URI[sha256sum] = "cfbf68079117c1c2b76411636444ff41d73c31093c4cab9dcc9a8c1bbe7e3897"
-- 
2.17.1


