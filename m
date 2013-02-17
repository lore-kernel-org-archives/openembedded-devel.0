Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6zAF-000578-SE
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Feb 2013 09:00:00 +0100
Received: by mail-pa0-f45.google.com with SMTP id kl14so2357828pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 23:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=9jcSynF7v3yUAQx1+z5/evEFGkqVTg45qrIVlgz1EI4=;
	b=sgSpvzR08jC3mLRda42OsUjbENS/Ft2qvj0dwDtUaaFLJeBIKSL9OddZ8RfYFWvMN3
	sWPal3yAhEOHmmBcoqUJRFcqZ58dq6hjroyG9hmDZFiMZrah+Q7jmiIzuioOrElwq+4Z
	KyfFk4of8dq6auOPdk9MGYWY6UkcooLQ8dHMrxyIJreX7YPl4njVowAWCsMk4JOE+3gk
	pyS7R0jyCrXkk/E+GXp8n8He8H0KcDrDUkwIMF1GTCkWJTLIGg5lCB+x/o2hD9CiXsHy
	892qAPiblw+XNDNC0hZ5c0SAuT6wdjukfhYEdfNmGvD/C+0BLWtQSau1IA+cKww9dXl/
	ZFsg==
X-Received: by 10.68.130.1 with SMTP id oa1mr19955796pbb.134.1361087032981;
	Sat, 16 Feb 2013 23:43:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g4sm7293986pax.4.2013.02.16.23.43.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 23:43:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Feb 2013 08:43:50 +0100
Message-Id: <1361087030-21630-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-oe] swig: upgrade to 2.0.9 and add patch to fix swiglib
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
X-List-Received-Date: Sun, 17 Feb 2013 08:00:01 -0000

* FindSWIG.cmake is using swig -swiglib to find swig.swg and set
  SWIG_DIR without that patch swig -swiglib reports absolute path
  to datadir how it was on builder which created sstate archive,
  reusing swig from sstate results in invalid path hardcoded in
  swig binary and FindSWIG reporting missing swig

* unfortunately it's not using any config file we could make
  relocateble with SSTATE_SCAN_FILES

* LICENSE-UNIVERSITIES change is only formal

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/swig/swig.inc             |  2 +-
 ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ++++++++++++++++++++++
 meta-oe/recipes-devtools/swig/swig_2.0.0.bb        |  7 ---
 meta-oe/recipes-devtools/swig/swig_2.0.9.bb        |  8 +++
 4 files changed, 78 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 delete mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.0.bb
 create mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.9.bb

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 9d62d27..97fc5c7 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://swig.sourceforge.net/"
 LICENSE = "BSD & GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE-UNIVERSITIES;md5=e0eaeeef7b2662c0c2d0d3c0b2509f75"
+                    file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
 
 SECTION = "devel"
 INC_PR = "r2"
diff --git a/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
new file mode 100644
index 0000000..81df3e2
--- /dev/null
+++ b/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
@@ -0,0 +1,69 @@
+From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
+From: "NODA, Kai" <nodakai@gmail.com>
+Date: Sun, 22 Apr 2012 17:01:02 +0900
+Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
+ platforms.
+
+If it wasn't found, then fall back to a fixed string just as before.
+
+Upstream-Status: Submitted
+http://sourceforge.net/mailarchive/message.php?msg_id=29179733
+
+---
+ Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
+ 1 file changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
+index d2f5d3b..cbb0a12 100644
+--- a/Source/Modules/main.cxx
++++ b/Source/Modules/main.cxx
+@@ -26,6 +26,11 @@ char cvsroot_main_cxx[] = "$Id$";
+ #include "cparse.h"
+ #include <ctype.h>
+ #include <limits.h>		// for INT_MAX
++#ifndef _WIN32
++#include <cstddef>
++#include <unistd.h>		// for readlink
++#include <sys/stat.h>		// for stat
++#endif
+ 
+ // Global variables
+ 
+@@ -902,9 +907,9 @@ int SWIG_main(int argc, char *argv[], Language *l) {
+ 
+   // Check for SWIG_LIB environment variable
+   if ((c = getenv("SWIG_LIB")) == (char *) 0) {
++    char *p;
+ #if defined(_WIN32)
+     char buf[MAX_PATH];
+-    char *p;
+     if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
+       *(p + 1) = '\0';
+       SwigLib = NewStringf("%sLib", buf); // Native windows installation path
+@@ -914,7 +919,22 @@ int SWIG_main(int argc, char *argv[], Language *l) {
+     if (Len(SWIG_LIB_WIN_UNIX) > 0)
+       SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
+ #else
+-    SwigLib = NewString(SWIG_LIB);
++    char buf[PATH_MAX];
++    if (0 < ::readlink("/proc/self/exe", buf, sizeof(buf)) &&
++        (p = ::strstr(buf, "/bin/swig"))) {
++        int major, minor, patch;
++        const int ret = ::sscanf(VERSION, "%d.%d.%d", &major, &minor, &patch);
++        if (3 == ret) {
++            const ::ptrdiff_t dir_part_len = p - buf;
++            ::snprintf(p, PATH_MAX - dir_part_len, "/share/swig/%d.%d.%d", major, minor, patch);
++            struct ::stat stat_res;
++            if (0 == ::stat(buf, &stat_res) && S_ISDIR(stat_res.st_mode)) {
++                SwigLib = NewString(buf);
++            }
++        }
++    }
++    if (NULL == SwigLib)
++        SwigLib = NewString(SWIG_LIB);
+ #endif
+   } else {
+     SwigLib = NewString(c);
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.0.bb b/meta-oe/recipes-devtools/swig/swig_2.0.0.bb
deleted file mode 100644
index b443def..0000000
--- a/meta-oe/recipes-devtools/swig/swig_2.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require swig.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "36ee2d9974be46a9f0a36460af928eb9"
-SRC_URI[sha256sum] = "2568d042d3c7cfbcb17e2471b0434bd3aa78d7a1829f9ef6f1b9fc522e4754ea"
-
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.9.bb b/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
new file mode 100644
index 0000000..9e9544c
--- /dev/null
+++ b/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
+
+SRC_URI[md5sum] = "54d534b14a70badc226129159412ea85"
+SRC_URI[sha256sum] = "586954000d297fafd7e91d1ad31089cc7e249f658889d11a44605d3662569539"
-- 
1.8.1.2



