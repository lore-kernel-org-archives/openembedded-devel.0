Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 47D3F610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:44:13 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x19so2976977qcw.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Bl+QIUC3NXlKm7EpRn9YfG6QJWRK17WTaOuTcIoS/Pg=;
	b=nm1f+tLgL4ATpDAEmfM+okHu1gqzfYKwwpiZwbHzhUsP1rT7rT8hRne7JJ7Oq7JQVl
	zZkpj/2wQEbZBelEA/blLC4Urc+bkfXvcSKOaJ/oG6ebCGR8/2v4jkaNNUYNanspbX0r
	Lv9GNtlNXAJZQudhPkICfP9qi53caTyuJ3/GHL0f2Lff5UyY2SOww7x24YifLX1l8k6U
	QLmi3wfUuHkJN9OCXgdWXRJL9m7TLq+C1FyeYxfebEkulV9z29metykbTXtJGj2RYthv
	IEgbg27NMIC1vc8pSpE3ay+9PVgZhkLxYBQhXceRllCyETqsgWbrVEiKQ1PLnmsPplRp
	UB7Q==
X-Received: by 10.49.107.105 with SMTP id hb9mr11445975qeb.74.1380026654742;
	Tue, 24 Sep 2013 05:44:14 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id e7sm45657372qag.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 05:44:13 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 09:43:56 -0300
Message-Id: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
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
X-List-Received-Date: Tue, 24 Sep 2013 12:44:13 -0000

Recipe based on OE classic's recipe for version 4.4.1, as of
0585ccfa49f71a81652c7f63885202e952ebd0e9.

Summary of changes against OE classic's recipe:

* Apply some Debian patches from
  http://patch-tracker.debian.org/package/wvstreams/4.6.1-6

* Minor adjustments for the current build system (add
  LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
  PR)

* Disable parallel make, since it was causing errors like

Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
| ./CXX -c utils/wvbuffer
| ./CXX -c utils/wvbufferstore
| ./CXX -c utils/wvcont
| /bin/bash: ./CXX: No such file or directory
| /bin/bash: ./CXX: No such file or directory
| /bin/bash: ./CXX: No such file or directory
| * Generating CC using c
| make: * Generating CXX using cc
| *** [utils/wvbuffer.o] Error 127
| make: *** Waiting for unfinished jobs....
| make: *** [utils/wvbufferstore.o] Error 127
| make: *** [utils/wvcont.o] Error 127
| ERROR: oe_runmake failed
| WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/run.do_compile.19302:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../wvdial/wvstreams/04_signed_request.diff        |   13 ++++++
 .../wvdial/wvstreams/05_gcc.diff                   |   41 +++++++++++++++++++
 .../wvdial/wvstreams/06_gcc-4.7.diff               |   18 +++++++++
 .../wvdial/wvstreams/07_buildflags.diff            |   32 +++++++++++++++
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   42 ++++++++++++++++++++
 5 files changed, 146 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
new file mode 100644
index 0000000..5ab633b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
@@ -0,0 +1,13 @@
+Index: wvstreams-4.6/crypto/wvx509.cc
+===================================================================
+--- wvstreams-4.6.orig/crypto/wvx509.cc	2009-07-29 11:58:16.000000000 -0400
++++ wvstreams-4.6/crypto/wvx509.cc	2009-07-29 11:58:43.000000000 -0400
+@@ -325,7 +325,7 @@
+     }
+ 
+     int verify_result = X509_REQ_verify(certreq, pk);
+-    if (verify_result == 0)
++    if (verify_result == 0 || verify_result == -1)
+     {
+ 	debug(WvLog::Warning, "Self signed request failed");
+ 	X509_REQ_free(certreq);
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
new file mode 100644
index 0000000..8e4fd03
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
@@ -0,0 +1,41 @@
+Index: wvstreams-4.6.1/crypto/wvx509.cc
+===================================================================
+--- wvstreams-4.6.1.orig/crypto/wvx509.cc	2011-05-20 00:02:38.119136584 +0200
++++ wvstreams-4.6.1/crypto/wvx509.cc	2011-05-20 00:02:26.035136589 +0200
+@@ -1157,7 +1157,7 @@
+         
+         if (ext)
+         {
+-            X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++            X509V3_EXT_METHOD *method = (X509V3_EXT_METHOD *)X509V3_EXT_get(ext);
+             if (!method)
+             {
+                 WvDynBuf buf;
+Index: wvstreams-4.6.1/ipstreams/wvunixdgsocket.cc
+===================================================================
+--- wvstreams-4.6.1.orig/ipstreams/wvunixdgsocket.cc	2011-05-20 00:02:38.391136584 +0200
++++ wvstreams-4.6.1/ipstreams/wvunixdgsocket.cc	2011-05-20 00:02:35.283136585 +0200
+@@ -1,8 +1,6 @@
+ #include "wvunixdgsocket.h"
+-#ifdef MACOS
+ #include <sys/types.h>
+ #include <sys/stat.h>
+-#endif
+ 
+ WvUnixDGSocket::WvUnixDGSocket(WvStringParm filename, bool _server, int perms)
+     : socketfile(filename)
+Index: wvstreams-4.6.1/streams/wvatomicfile.cc
+===================================================================
+--- wvstreams-4.6.1.orig/streams/wvatomicfile.cc	2011-05-20 00:02:38.223136584 +0200
++++ wvstreams-4.6.1/streams/wvatomicfile.cc	2011-05-20 00:02:31.619136587 +0200
+@@ -10,10 +10,7 @@
+ #include "wvatomicfile.h"
+ #include "wvfileutils.h"
+ #include "wvstrutils.h"
+-
+-#ifdef MACOS
+ #include <sys/stat.h>
+-#endif
+ 
+ WvAtomicFile::WvAtomicFile(WvStringParm filename, int flags, mode_t create_mode)
+     : tmp_file(WvString::null)
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
new file mode 100644
index 0000000..a75067a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
@@ -0,0 +1,18 @@
+Description: Fix FTBFS with gcc-4.7
+ Small header include change. This is borderlinde cosmetic, but still needed
+ to prevent the FTBFS.
+Author: Paul Tagliamonte <paultag@ubuntu.com>
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/667418
+Last-Update: 2012-04-13
+
+--- wvstreams-4.6.1.orig/utils/wvuid.cc
++++ wvstreams-4.6.1/utils/wvuid.cc
+@@ -33,6 +33,7 @@ wvuid_t wvgetuid()
+ 
+ #else // not WIN32
+ 
++#include <unistd.h>
+ 
+ WvString wv_username_from_uid(wvuid_t uid)
+ {
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
new file mode 100644
index 0000000..ec99dcd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
@@ -0,0 +1,32 @@
+Index: b/gen-cc
+===================================================================
+--- a/gen-cc
++++ b/gen-cc
+@@ -15,6 +15,11 @@
+ 	shift
+ 	shift
+ 	
++	echo $CC \$MODE -o \$BASE.o \$BASE.$EXT \\
++	        -MMD -MF \$DEPFILE -MP -MQ \$BASE.o \\
++	        $CPPFLAGS \\
++	        $CFLAGS \\
++	        "\$@"
+ 	$CC \$MODE -o \$BASE.o \$BASE.$EXT \\
+ 	        -MMD -MF \$DEPFILE -MP -MQ \$BASE.o \\
+ 	        $CPPFLAGS \\
+Index: b/wvrules-posix.mk
+===================================================================
+--- a/wvrules-posix.mk
++++ b/wvrules-posix.mk
+@@ -35,11 +35,6 @@
+ # Default compiler we use for linking
+ WVLINK_CC = $(CXX)
+ 
+-ifneq ("$(enable_optimization)", "no")
+-  CXXFLAGS+=-O2
+-  CFLAGS+=-O2
+-endif
+-
+ ifneq ("$(enable_warnings)", "no")
+   CXXFLAGS+=-Wall -Woverloaded-virtual
+   CFLAGS+=-Wall
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
new file mode 100644
index 0000000..fd6d11b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -0,0 +1,42 @@
+HOMEPAGE = "http://alumnit.ca/wiki/index.php?page=WvStreams"
+DESCRIPTION = "WvStreams is a network programming library in C++"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "zlib openssl (>= 0.9.8)"
+
+SRC_URI = "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
+           file://04_signed_request.diff \
+           file://05_gcc.diff \
+           file://06_gcc-4.7.diff \
+           file://07_buildflags.diff \
+          "
+
+SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
+SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
+
+inherit autotools pkgconfig
+
+PARALLEL_MAKE = ""
+
+LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
+
+EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
+
+PACKAGES_prepend = "libuniconf libuniconf-dbg "
+PACKAGES_prepend = "uniconfd uniconfd-dbg "
+PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
+PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "
+
+FILES_libuniconf     = "${libdir}/libuniconf.so.*"
+FILES_libuniconf-dbg = "${libdir}/.debug/libuniconf.so.*"
+
+FILES_uniconfd     = "${sbindir}/uniconfd ${sysconfdir}/uniconf.conf ${localstatedir}/uniconf"
+FILES_uniconfd-dbg = "${sbindir}/.debug/uniconfd"
+
+FILES_libwvstreams-base     = "${libdir}/libwvutils.so.*"
+FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
+
+FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
+FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
-- 
1.7.10.4


