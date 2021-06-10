Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9336.1623328564670381623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 05:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C62A8ED1
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 05:36:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F27C3F73D
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 05:36:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] zsync-curl: add recipe
Date: Thu, 10 Jun 2021 13:35:58 +0100
Message-Id: <20210610123558.1409739-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

zsync is a tool that is similar to rsync but optimised for transfering
single large files where you have a previous version of the file locally.
These qualities make it an excellent choice for transfering built images
between hosts.

zsync-curl is a maintained fork of the original zsync, that uses curl for
HTTP requests allowing it to connect to HTTPS servers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../zsync/zsync-curl/fixes.patch              | 115 ++++++++++++++++++
 .../zsync/zsync-curl/make.patch               |  50 ++++++++
 .../recipes-extended/zsync/zsync-curl_git.bb  |  20 +++
 3 files changed, 185 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch
 create mode 100644 meta-oe/recipes-extended/zsync/zsync-curl/make.patch
 create mode 100644 meta-oe/recipes-extended/zsync/zsync-curl_git.bb

diff --git a/meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch b/meta=
-oe/recipes-extended/zsync/zsync-curl/fixes.patch
new file mode 100644
index 0000000000..1ec4993a1c
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch
@@ -0,0 +1,115 @@
+Upstream-Status: Submitted [https://github.com/probonopd/zsync-curl/pull=
/41]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/configure.ac b/src/configure.ac
+index 10de8c4..6488140 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -9,7 +9,6 @@ AC_CONFIG_MACRO_DIR([autotools])
+ AC_CANONICAL_HOST
+=20
+ AM_INIT_AUTOMAKE([dist-bzip2 no-dist-gzip foreign check-news -Woverride=
 -Wobsolete -Wportability -Wsyntax -Wunsupported])
+-AM_MAINTAINER_MODE
+=20
+ dnl --- Check for programs
+ AC_PROG_CC
+@@ -23,6 +22,7 @@ AS_IF([test "x$enable_profile" =3D "xyes"], [
+    ZS_CFLAGS=3D"${ZS_CFLAGS} -pg" ])
+=20
+ dnl --- Header files, typedefs, structures, libraries
++AC_USE_SYSTEM_EXTENSIONS
+ AC_C_CONST
+ AC_HEADER_STDC
+ # string.h, memory.h, stdlib.h both included in the default header chec=
ks
+@@ -55,10 +55,6 @@ case $host_os in
+        host_os_mingw32=3Dyes
+        LIBS=3D"${LIBS} -lwsock32"
+        ;;
+-   *)
+-       AC_DEFINE([_XOPEN_SOURCE], 600, [Enable POSIX extensions if pres=
ent])
+-       AC_DEFINE([_BSD_SOURCE],1, [Enable BSD extensions if present])
+-       ;;
+ esac
+ AM_CONDITIONAL([MINGW32], test "x$host_os_mingw32" =3D "xyes")
+=20
+diff --git a/src/librcksum/Makefile.am b/src/librcksum/Makefile.am
+index f4fce72..47754eb 100644
+--- a/src/librcksum/Makefile.am
++++ b/src/librcksum/Makefile.am
+@@ -1,4 +1,4 @@
+-
++AM_CPPFLAGS =3D "-I$(top_srcdir)"
+=20
+ noinst_LIBRARIES =3D librcksum.a
+=20
+diff --git a/src/librcksum/md4.h b/src/librcksum/md4.h
+index e90603a..0ed7485 100644
+--- a/src/librcksum/md4.h
++++ b/src/librcksum/md4.h
+@@ -18,11 +18,8 @@
+=20
+ #include "zsglobal.h"
+=20
+-#ifdef HAVE_INTTYPES_H
+-#include <inttypes.h>
+-#else
++#include <stdint.h>
+ #include <sys/types.h>
+-#endif
+=20
+ #define	MD4_BLOCK_LENGTH		64
+ #define	MD4_DIGEST_LENGTH		16
+diff --git a/src/libzsync/Makefile.am b/src/libzsync/Makefile.am
+index 0a6ae85..33a5951 100644
+--- a/src/libzsync/Makefile.am
++++ b/src/libzsync/Makefile.am
+@@ -1,3 +1,4 @@
++AM_CPPFLAGS =3D "-I$(top_srcdir)"
+=20
+ noinst_LIBRARIES =3D libzsync.a
+=20
+diff --git a/src/libzsync/sha1.h b/src/libzsync/sha1.h
+index 3946505..87f3794 100644
+--- a/src/libzsync/sha1.h
++++ b/src/libzsync/sha1.h
+@@ -11,11 +11,8 @@
+=20
+ #include "config.h"
+=20
+-#ifdef HAVE_INTTYPES_H
+-#include <inttypes.h>
+-#else
++#include <stdint.h>
+ #include <sys/types.h>
+-#endif
+=20
+ #define	SHA1_BLOCK_LENGTH		64
+ #define	SHA1_DIGEST_LENGTH		20
+diff --git a/src/libzsync/zmap.c b/src/libzsync/zmap.c
+index f052dba..030b2a5 100644
+--- a/src/libzsync/zmap.c
++++ b/src/libzsync/zmap.c
+@@ -28,9 +28,6 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <arpa/inet.h>
+-#ifdef HAVE_INTTYPES_H
+-#include <inttypes.h>
+-#endif
+=20
+ #ifdef WITH_DMALLOC
+ # include <dmalloc.h>
+diff --git a/src/make.c b/src/make.c
+index 191b527..ba7f3a9 100644
+--- a/src/make.c
++++ b/src/make.c
+@@ -28,9 +28,6 @@
+ #include <time.h>
+=20
+ #include <arpa/inet.h>
+-#ifdef HAVE_INTTYPES_H
+-#include <inttypes.h>
+-#endif
+=20
+ #include <sys/types.h>
+ #include <sys/stat.h>
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl/make.patch b/meta-=
oe/recipes-extended/zsync/zsync-curl/make.patch
new file mode 100644
index 0000000000..ef19b5e85e
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync-curl/make.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 3b9d64cf3c33ad235ed444f8715732e509ab023f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 9 Jun 2021 16:11:25 +0100
+Subject: [PATCH] Build zsyncmake
+
+No point having the zsync client without the server-side tool.
+
+Closes #42
+---
+ .gitignore      | 1 +
+ src/Makefile.am | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/.gitignore b/.gitignore
+index 36f7bd8..728658e 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -22,3 +22,4 @@ src/librcksum/md4test
+ src/libzsync/sha1test
+ stamp-h1
+ zsync_curl
++zsyncmake_curl
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5f8ff73..ffa2280 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -4,13 +4,16 @@ ACLOCAL_AMFLAGS =3D -I autotools
+=20
+ SUBDIRS =3D librcksum zlib libzsync doc
+=20
+-bin_PROGRAMS =3D zsync_curl
++bin_PROGRAMS =3D zsync_curl zsyncmake_curl
+=20
+ zsync_curl_SOURCES =3D client.c http.c http.h url.c url.h progress.c pr=
ogress.h base64.c format_string.h zsglobal.h
+ zsync_curl_LDADD =3D libzsync/libzsync.a librcksum/librcksum.a zlib/lib=
inflate.a $(LIBOBJS)
+=20
+ EXTRA_zsync_curl_SOURCES =3D getaddrinfo.h
+=20
++zsyncmake_curl_SOURCES =3D make.c makegz.c makegz.h format_string.h
++zsyncmake_curl_LDADD =3D libzsync/libzsync.a librcksum/librcksum.a zlib=
/libinflate.a zlib/libdeflate.a -lm
++
+ # From "GNU autoconf, automake and libtool" Vaughan, Elliston,=20
+ # #  Tromey and Taylor, publisher New Riders, p.134
+ # # They made me do it! :-)
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/r=
ecipes-extended/zsync/zsync-curl_git.bb
new file mode 100644
index 0000000000..adb72d5de2
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "File transfer tool optimised for large files (curl port)"
+HOMEPAGE =3D "http://zsync.moria.org.uk/"
+DEPENDS =3D "curl"
+
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://src/COPYING;md5=3D71c0ac4d86266533509aa0825=
b8d323c"
+
+SRC_URI =3D "git://github.com/probonopd/zsync-curl;protocol=3Dhttps \
+           file://fixes.patch \
+           file://make.patch"
+SRCREV =3D "00141c2806ccc4ddf2ff6263ee1612d19c0b713f"
+
+PV =3D "0.6.2+git${SRCPV}"
+
+inherit autotools
+
+S =3D "${WORKDIR}/git"
+AUTOTOOLS_SCRIPT_PATH =3D "${S}/src"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

