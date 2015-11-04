Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7DB76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:31 +0000 (UTC)
Received: by wmec75 with SMTP id c75so126345386wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0BGUfwlbYjpSIvyV9ZmspZ25lkoNTxlH2f4KSguN4aM=;
	b=rZP/mo1BC24SC3mOUHUZTwU63IP8+/719IL6ozFtP3e5tYIV5rFOQWBcWr74ss/0u3
	m+tWq5fd+rwFgMlQflwEglL5oHGhGyO4t8uWg8kv75f4GXBCB2E6t/vhbUCPjUOxdMdl
	ztu/fcuPG5dyvNJdnMW8D9oktWvzF5kGxkRFnUnmJn+z6mx9E7SEJ2WgPR8dSnfsIiT6
	+I/2djBQ3EGj3I0uhaMutpmweRLjF54eYPe3qGJd/jDI60Sa47EchCrlyYrXXZdCGgIg
	ODehd5CLZ2V9sGFuwEFpAtbno2IC/aTdRmjR8lsE9QW45M8u1xhNcEWba2m4Jkui2/ZL
	xi/Q==
X-Received: by 10.28.18.3 with SMTP id 3mr30822164wms.67.1446680671615;
	Wed, 04 Nov 2015 15:44:31 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:57 +0100
Message-Id: <1446680640-31722-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 15/18] cdrkit: initial add 1.1.11
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 18 ++++++++
 ...te-a-run-test-to-determine-order-of-bitfi.patch | 53 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
new file mode 100644
index 0000000..554b89f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -0,0 +1,18 @@
+SUMMARY = "CD/DVD command line tools"
+HOMEPAGE = "http://cdrkit.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b30d3b2750b668133fc17b401e1b98f8"
+
+# While writing download from cdrkit.org was broken so get sources from debian
+SRC_URI = " \
+    ${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
+    file://0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch \
+"
+SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
+SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
+
+inherit cmake
+
+DEPENDS = "libcap file bzip2"
+RDEPENDS_${PN} = "perl"
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch
new file mode 100644
index 0000000..c9725cb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch
@@ -0,0 +1,53 @@
+From a702cd1bb5eba5a05d1098862b5b863a3f6dd558 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 10 Sep 2015 09:39:13 +0200
+Subject: [PATCH] do not create a run test to determine order of bitfields
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+taken from [1]
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+[1] http://cgit.openembedded.org/openembedded/tree/recipes/cdrkit/cdrkit/xconfig.patch
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ include/CMakeLists.txt | 2 --
+ include/xconfig.h.in   | 6 +++++-
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+index 99a69fd..e5ba8a7 100644
+--- a/include/CMakeLists.txt
++++ b/include/CMakeLists.txt
+@@ -35,8 +35,6 @@ endif(VA_LIST_IS_ARRAY)
+ INCLUDE(TestBigEndian)
+ TEST_BIG_ENDIAN(WORDS_BIGENDIAN)
+ 
+-TRY_RUN(BITFIELDS_HTOL TEST_DUMMY ${CMAKE_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/test_BITFIELDS_HTOL.c)
+-
+ INCLUDE(CheckIncludeFiles)
+ 
+ #SET(CMAKE_REQUIRED_INCLUDES "/usr/include;/usr/local/include")
+diff --git a/include/xconfig.h.in b/include/xconfig.h.in
+index c130600..476c00b 100644
+--- a/include/xconfig.h.in
++++ b/include/xconfig.h.in
+@@ -233,7 +233,11 @@
+ /* If using network byte order             */
+ #cmakedefine WORDS_BIGENDIAN
+ /* If high bits come first in structures   */
+-#cmakedefine BITFIELDS_HTOL
++#ifdef WORDS_BIGENDIAN
++#define BITFIELDS_HTOL
++#else
++#define BITFIELDS_LTOH
++#endif
+ #define	HAVE_C_BIGENDIAN	/* Flag that WORDS_BIGENDIAN test was done */
+ #define	HAVE_C_BITFIELDS	/* Flag that BITFIELDS_HTOL test was done  */
+ 
+-- 
+2.1.0
+
-- 
2.1.0


