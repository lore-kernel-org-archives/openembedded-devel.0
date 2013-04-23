Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UUlLA-0005St-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 00:05:32 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 73B18EA048
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 00:18:41 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A8DA4A460F2; Tue, 23 Apr 2013 23:48:34 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 23:48:24 +0200
Message-Id: <05bfb679afd9d4f22f794adf1b8aa85bdb58b04c.1366753073.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366753073.git.apelete@seketeli.net>
References: <cover.1366753073.git.apelete@seketeli.net>
In-Reply-To: <cover.1366753073.git.apelete@seketeli.net>
References: <cover.1366753073.git.apelete@seketeli.net>
Subject: [meta-opie][PATCH 1/1] uicmoc: fix compile issue with GCC-4.7
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
X-List-Received-Date: Tue, 23 Apr 2013 22:06:38 -0000

Fix compile issue found when building uicmoc-native with GCC-4.7.
Though it was detected with version 4.7, the problem may appear with
an earlier version of GCC-4.x.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch |   11 +++++++++++
 recipes-qt/uicmoc/uicmoc_2.3.10.bb           |    1 +
 2 files changed, 12 insertions(+)
 create mode 100644 recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch

diff --git a/recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch
new file mode 100644
index 0000000..ad09bfe
--- /dev/null
+++ b/recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.7.patch
@@ -0,0 +1,11 @@
+--- qt-2.3.10/src/tools/qvaluestack.h.orig	2013-04-23 21:04:50.373589050 +0200
++++ qt-2.3.10/src/tools/qvaluestack.h	2013-04-23 21:33:48.857599178 +0200
+@@ -49,7 +49,7 @@
+ public:
+     QValueStack() {}
+    ~QValueStack() {}
+-    void  push( const T& d ) { append(d); }
++    void  push( const T& d ) { this->append(d); }
+     T pop()
+     {
+ 	T elem( this->last() );
diff --git a/recipes-qt/uicmoc/uicmoc_2.3.10.bb b/recipes-qt/uicmoc/uicmoc_2.3.10.bb
index ca6a7a1..0588436 100644
--- a/recipes-qt/uicmoc/uicmoc_2.3.10.bb
+++ b/recipes-qt/uicmoc/uicmoc_2.3.10.bb
@@ -9,6 +9,7 @@ SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
            file://gcc3_4.patch \
            file://gcc4.patch \
            file://gcc4_1.patch \
+           file://gcc4.7.patch \
            file://64bit-cleanup.patch \
 	   file://kernel-asm-page.patch"
 S = "${WORKDIR}/qt-${PV}"
-- 
1.7.10.4



