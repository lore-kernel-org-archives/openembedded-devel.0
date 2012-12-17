Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkYkb-0006X3-Lm
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 12:20:50 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 03:06:07 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so4449919eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 03:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Ezb8g6rs6m0IhI+M1NnQXMc6PEfOzhC0jqW5zvrzLzI=;
	b=cWIi8DGeC8dJi7JBKwFOBH6Z/9qRSjzW0OEBUWaQVR9PgN4ZyNbNR1yuB27RjA3wRh
	9Or10Mp+8yLbLJUKEk2uDmt/wdsjsjMXMzACmBF2ZLFVMEzYxAl6t/VonRCbxZxRrBAq
	pJSRYSAJDadiqTv9Ka/vbf3XDRSGGLFuUhMSxF9/XMqkGaktH9wwhVA4SQr/Xhfw+BpE
	C2I++VTsNV3qmtbkq+V02bZ9sP2JbtrPYwHbEYJqwKEDild37eWYvYw+QeDjrAtPbDAV
	2cRiqylRuA5DrCVDJevbF4aQPe/E2zLQQivx+K4A/PNYpNfM+UMMcLgLQBrP05bxQWOq
	0dpQ==
Received: by 10.194.238.226 with SMTP id vn2mr16157614wjc.23.1355742365619;
	Mon, 17 Dec 2012 03:06:05 -0800 (PST)
Received: by 10.194.238.226 with SMTP id vn2mr16157602wjc.23.1355742365532;
	Mon, 17 Dec 2012 03:06:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id i2sm10604840wiw.3.2012.12.17.03.06.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 03:06:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:04:21 +0000
Message-Id: <1355742261-14593-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmUZffwCGOpUpn5gF9Igx5VFk91cp3IE6OHvOaBBfwuZ9ssvPUE/jR87RfE92Iqa4tZCeso5mhUHTun+Eakn8dwhJiBuXLUFHQwZEnGuGomC8XFnB5Znhz7r2gjORDJvLNm5Bzc3MfT9AyurlBCsfjlFyEWEcGMaUwKpti+HbtsuqShWltuZPG8XHO4nn+fl8HfbsBy
Subject: [PATCH] waffle: new package, a GL deferred resolution library.
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
X-List-Received-Date: Mon, 17 Dec 2012 11:20:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/waffle/files/cflags.patch |   30 ++++++++++++++++++++
 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb    |   21 ++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/waffle/files/cflags.patch
 create mode 100644 meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb

diff --git a/meta-oe/recipes-graphics/waffle/files/cflags.patch b/meta-oe/recipes-graphics/waffle/files/cflags.patch
new file mode 100644
index 0000000..34b9b7f
--- /dev/null
+++ b/meta-oe/recipes-graphics/waffle/files/cflags.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2abec1cb3c17fa5ec8d945d79acd74a39c38293a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 12 Dec 2012 12:57:18 +0000
+Subject: cmake: respect existing CMAKE_C_FLAGS
+
+When cross-compiling it's not unusual to need specific arguments passed to gcc
+such as --sysroot.  Ensure that these are passed on from the toolchain file by
+appending to CMAKE_C_FLAGS instead of overwriting it.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Chad Versace <chad.versace@linux.intel.com>
+---
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3c9bb5d..5fc4467 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -211,7 +211,7 @@ endif()
+ # Compiler Flags
+ # ------------------------------------------------------------------------------
+ 
+-set(CMAKE_C_FLAGS "--std=c99 -Wall -Werror=implicit-function-declaration")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99 -Wall -Werror=implicit-function-declaration")
+ if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
+     # On MacOS, the SSE2 headers trigger this error.
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=missing-prototypes")
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
new file mode 100644
index 0000000..6bdeb1e
--- /dev/null
+++ b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
+                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
+
+PR = "r0"
+
+SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
+           file://cflags.patch"
+
+SRC_URI[md5sum] = "fdd07cea7709422fbf72418ee63a285d"
+SRC_URI[sha256sum] = "7e342c859b58d4e051b347ef3d7740ed2f3b6c506b93daec272724afe7dd1311"
+
+inherit cmake
+
+DEPENDS = "virtual/libgl libxcb libx11"
+
+# TODO: add waffle_has_wayland, waffle_has_x11_egl, waffle_has_gbm depending on environment.
+EXTRA_OECMAKE = "-Dwaffle_has_glx=1"
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.7.10



