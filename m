Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5ED76A33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:31:22 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so70720322wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ulUZbYPPD1ga8q53F1REDYc+FBNFi02g2REBFp4j2jY=;
	b=Zb2K1GKI6qIuofVphfHvxotIWgWnBAWs4rCvmhYdZGF0go8aNV3+ASyBm7gTzMVB+k
	9YNqb41HHpc5zvc1yrEXYXHhmjA0CL3ZRf5ItCoGKAICVF+RY+1zuzHO5EE8vrlQlvPb
	tK2HOJOqHoLF1YPJfX1EiEDCAKMCNxmYfDJPuhXkuIjUm24bsVS7z6IjjGcDxqnOcUr8
	DNQvigWlONP9RcvH3Yqgt1UuShAR+CiK13XDO0kGv5ajsxQ3rFXcUvXWmC+CJPj8S7Lw
	oSDuxlw1rVTzXPTaW03v6MzaqGDLVPbEOQhiLoIe1IbF3WpRX3Kdle9e1qHRhhUoD+RL
	k2yA==
X-Received: by 10.194.209.167 with SMTP id mn7mr38654711wjc.64.1440419482946; 
	Mon, 24 Aug 2015 05:31:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm22968359wjb.49.2015.08.24.05.31.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:31:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 14:31:25 +0200
Message-Id: <1440419486-29461-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH 1/2] oscam: respect *flags set from OE
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
X-List-Received-Date: Mon, 24 Aug 2015 12:31:24 -0000

* build with -mfloat-abi=hard are failing with:
  sysroots/foo/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
  because cmake wasn't respecting *flags set from OE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-dvb/oscam/oscam/respect-cflags.patch   | 38 ++++++++++++++++++++++
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb     |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch b/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
new file mode 100644
index 0000000..179d04a
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+http://www.streamboard.tv/oscam/changeset/10068
+http://www.streamboard.tv/oscam/changeset/10070
+
+Index: /CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt	(revision 10067)
++++ b/CMakeLists.txt	(revision 10068)
+@@ -625,8 +625,8 @@
+     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
+     add_definitions ("-W -Wall ")
+-    set (CMAKE_C_FLAGS "-Wall -O2")
+-	set (CMAKE_CXX_FLAGS "-Wall -O2")
+-    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
+-    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
++    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
++	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
++    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
++    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
+ endif (CMAKE_COMPILER_IS_GNUCC)
+ # some optimisations
+Index: /csctapi/CMakeLists.txt
+===================================================================
+--- a/csctapi/CMakeLists.txt	(revision 10069)
++++ b/csctapi/CMakeLists.txt	(revision 10070)
+@@ -6,8 +6,8 @@
+     list(GET GCC_VERSION_COMPONENTS 0 GCC_MINOR)
+     add_definitions ("-W -Wall ")
+-    set (CMAKE_C_FLAGS "-Wall -O2")
+-	set (CMAKE_CXX_FLAGS "-Wall -O2")
+-    set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb")
+-    set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")
++    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O2")
++	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2")
++    set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -ggdb")
++    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb")
+ endif (CMAKE_COMPILER_IS_GNUCC)
+ # Mac extra removes to avoid ranlib warnings in some situations
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index c4a4d99..cac517f 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libusb1 openssl pcsc-lite"
 
-SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http"
+SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
+    file://respect-cflags.patch \
+"
 SRCREV = "9164"
 PV = "1.10+${SRCPV}"
 
-- 
2.5.0


