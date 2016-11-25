Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3B4601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 15:18:06 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a197so146727239wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 07:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JeCL+Ga5mGmSxd2vVCWqWWNwQjK4PhPoVGIOVTfCwTE=;
	b=U8nxkOJF+JESdd5jWALu5KwBw+/M1pG9Osigoqo8VXKP3DETsONxnCV7tjSmQaPgsm
	3YPfiaY3dOtb3GpjuHTaW0FS0VBjyga/gbwDo0w/I3eL6GgG7ZJktQjoJLVpxL1DmumY
	R7Gsk4Hg2kGzv4BySueVVCpPemL2LwGmD3lPXbu8sVrLkm2zbyk9oSXVlxpRMc12PbTX
	Y2L+UNWPRQgy/t0mq8qdBsN1v+SI8v53Ysf4zJYyA2Cp9vHyvEhbnWOWDkmendXoPqK8
	lubhzAJ7yWnl9UW6fWJInKhsH8FFbyd8s8kC2pw1/Mqlbhxgae2pFrNdFkshugTIhjOP
	WUug==
X-Gm-Message-State: AKaTC01N0y0StaQ1KinNcuzln/gdKcd0JOHf9V0+Ei7oFjXrVDqmFAmEhAabNLuDxaHFhw==
X-Received: by 10.28.173.131 with SMTP id w125mr8064156wme.0.1480087086386;
	Fri, 25 Nov 2016 07:18:06 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 6sm47458981wjt.5.2016.11.25.07.18.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 07:18:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 15:18:02 +0000
Message-Id: <20161125151803.22278-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libdbus-c++: missing DEPENDS, fix musl build, oe-stylize.py
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
X-List-Received-Date: Fri, 25 Nov 2016 15:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

- libdbus-c++ also depends on expat
- use PACKAGE_BEFORE_PN to simplify FILES
- run through oe-stylize.py
- compiling against the musl C library showed various
  problems, which have been fixed with the patches
  attached

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 ...op.cpp-use-portable-method-for-initializi.patch | 36 ++++++++++
 ...ate_proxy.cpp-avoid-possibly-undefined-ui.patch | 58 ++++++++++++++++
 ...efined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch | 30 +++++++++
 ...04-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 77 ++++++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 21 +++---
 5 files changed, 214 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
new file mode 100644
index 0000000..eed84e4
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
@@ -0,0 +1,36 @@
+From 93fd4868d71aa7a26cdfd382d1e4c85112f069f9 Mon Sep 17 00:00:00 2001
+From: Peter Williams <peter@newton.cx>
+Date: Sat, 19 Dec 2015 21:07:37 -0500
+Subject: [PATCH] src/eventloop.cpp: use portable method for initializing
+ recursive mutex
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/cdaeaa825db191bd65aad3aaaeb3178738727f05]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+ src/eventloop.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/eventloop.cpp b/src/eventloop.cpp
+index 7fb06a3..f622812 100644
+--- a/src/eventloop.cpp
++++ b/src/eventloop.cpp
+@@ -85,8 +85,11 @@ DefaultMutex::DefaultMutex(bool recursive)
+ {
+   if (recursive)
+   {
+-    pthread_mutex_t recmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
+-    _mutex = recmutex;
++    pthread_mutexattr_t attr;
++
++    pthread_mutexattr_init(&attr);
++    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
++    pthread_mutex_init(&_mutex, &attr);
+   }
+   else
+   {
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
new file mode 100644
index 0000000..65cd939
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
@@ -0,0 +1,58 @@
+From c673a76857cbe0ca82fa11aea9b70f94c3e5b041 Mon Sep 17 00:00:00 2001
+From: Peter Williams <peter@newton.cx>
+Date: Sat, 19 Dec 2015 21:08:46 -0500
+Subject: [PATCH] tools/generate_proxy.cpp: avoid possibly undefined 'uint'
+ type
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/43f119a2b3fe951c0f1d88cc61170d4c81a88880]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+ tools/generate_proxy.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/generate_proxy.cpp b/tools/generate_proxy.cpp
+index bf1094a..ebb75fa 100644
+--- a/tools/generate_proxy.cpp
++++ b/tools/generate_proxy.cpp
+@@ -352,7 +352,7 @@ void generate_proxy(Xml::Document &doc, const char *filename)
+         if (!arg_name.length())
+         {
+           arg_name = "argin";
+-          arg_name += toString <uint> (i);
++          arg_name += toString <unsigned int> (i);
+         }
+ 
+         // generate extra code to wrap object
+@@ -445,7 +445,7 @@ void generate_proxy(Xml::Document &doc, const char *filename)
+ 
+           if (!arg_name.length())
+           {
+-            arg_name = "argout" + toString <uint> (i);
++            arg_name = "argout" + toString <unsigned int> (i);
+           }
+ 
+           if (arg_object.length())
+@@ -569,7 +569,7 @@ void generate_proxy(Xml::Document &doc, const char *filename)
+         // use a default if no arg name given
+         if (!arg_name.length())
+         {
+-          arg_name = "arg" + toString <uint> (i);
++          arg_name = "arg" + toString <unsigned int> (i);
+         }
+ 
+         body << arg_name << ";" << endl;
+@@ -605,7 +605,7 @@ void generate_proxy(Xml::Document &doc, const char *filename)
+ 
+         if (!arg_name.length())
+         {
+-          arg_name = "arg" + toString <uint> (j);
++          arg_name = "arg" + toString <unsigned int> (j);
+         }
+ 
+         if (arg_object.length())
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
new file mode 100644
index 0000000..f69cefd
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
@@ -0,0 +1,30 @@
+From 465d98dbcdcb72375c198010a50b80b953e7d5a6 Mon Sep 17 00:00:00 2001
+From: Yuri <yuri@tsoft.com>
+Date: Sat, 28 May 2016 13:20:10 -0700
+Subject: [PATCH] Fixed undefined ssize_t for clang-3.8.0 on FreeBSD.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/463f5a4400d494b831c3b3348c0a21f0faf14f39]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+ include/dbus-c++/pipe.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/dbus-c++/pipe.h b/include/dbus-c++/pipe.h
+index 999f042..682646c 100644
+--- a/include/dbus-c++/pipe.h
++++ b/include/dbus-c++/pipe.h
+@@ -30,6 +30,8 @@
+ /* STD */
+ #include <cstdlib>
+ 
++#include <sys/types.h>
++
+ namespace DBus
+ {
+ 
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..0c2c487
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,77 @@
+From 12de53b0f24c478ea4ff6b4e2c55366dbd2f02b1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Fri, 25 Nov 2016 09:33:20 +0000
+Subject: [PATCH] use POSIX poll.h instead of sys/poll.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+POSIX specifies that <poll.h> is the correct header to
+include for poll()
+  http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
+whereas <sys/poll.h> is only needed for ancient glibc (<2.3),
+so let's follow POSIX instead.
+
+As a side-effect, this silences compilation warnings when
+compiling against the musl C-library such as:
+
+| In file included from ../../libdbus-c++-0.9.0/src/eventloop.cpp:31:0:
+| <sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+|  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+|   ^~~~~~~
+| In file included from ../../libdbus-c++-0.9.0/src/eventloop-integration.cpp:39:0:
+| <sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+|  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+|   ^~~~~~~
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Submitted [https://github.com/andreas-volz/dbus-cplusplus/pull/3]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+ src/eventloop-integration.cpp | 2 +-
+ src/eventloop.cpp             | 2 +-
+ src/pipe.cpp                  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/eventloop-integration.cpp b/src/eventloop-integration.cpp
+index 5776971..271b503 100644
+--- a/src/eventloop-integration.cpp
++++ b/src/eventloop-integration.cpp
+@@ -36,7 +36,7 @@
+ /* STD */
+ #include <string.h>
+ #include <cassert>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ 
+diff --git a/src/eventloop.cpp b/src/eventloop.cpp
+index f622812..7790e1e 100644
+--- a/src/eventloop.cpp
++++ b/src/eventloop.cpp
+@@ -28,7 +28,7 @@
+ #include <dbus-c++/eventloop.h>
+ #include <dbus-c++/debug.h>
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/time.h>
+ 
+ #include <dbus/dbus.h>
+diff --git a/src/pipe.cpp b/src/pipe.cpp
+index 01211b3..45c2ba6 100644
+--- a/src/pipe.cpp
++++ b/src/pipe.cpp
+@@ -32,7 +32,7 @@
+ 
+ /* STD */
+ #include <unistd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <cassert>
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 7edaffc..9b053fe 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -4,21 +4,26 @@ HOMEPAGE = "http://dbus-cplusplus.sourceforge.net"
 SECTION = "base"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "dbus glib-2.0 libpcre"
+DEPENDS = "dbus expat glib-2.0 libpcre"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BPN}-${PV}.tar.gz \
-		   file://fix-missing-unistd.h-include.patch \
-		   file://remove-CXX_FOR_BUILD-stuff.patch"
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar.gz \
+    file://fix-missing-unistd.h-include.patch \
+    file://remove-CXX_FOR_BUILD-stuff.patch \
+    file://0001-src-eventloop.cpp-use-portable-method-for-initializi.patch \
+    file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch \
+    file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch \
+    file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
+"
 SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
 SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
 
-EXTRA_OECONF = "--disable-ecore --disable-examples --disable-tests"
-
 inherit autotools pkgconfig
 
-PACKAGES += "${PN}-tools"
+EXTRA_OECONF = "--disable-ecore --disable-examples --disable-tests"
+
+PACKAGE_BEFORE_PN = "${PN}-tools"
 
-FILES_${PN} = "${libdir}"
 FILES_${PN}-tools = "${bindir}"
 
 BBCLASSEXTEND = "native"
-- 
2.10.2


