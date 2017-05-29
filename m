Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 896 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 May 2017 09:12:26 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 31DF477FF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 09:12:26 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v4T8vOHC023178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 10:57:24 +0200
Received: from dev.sbt.siemens.com ([139.16.117.78])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v4T8vOvU031419;
	Mon, 29 May 2017 10:57:24 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 0B4714F2D9;
	Mon, 29 May 2017 10:57:24 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 May 2017 10:56:54 +0200
Message-Id: <1496048214-31099-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-multimedia][PATCH] libupnp: Upgrade 1.6.19 -> 1.6.21
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
X-List-Received-Date: Mon, 29 May 2017 09:12:27 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libupnp/libupnp/CVE-2016-8863.patch            | 57 ----------------------
 .../avoid-redefining-strnlen-and-strndup.patch     | 47 ------------------
 .../libupnp/libupnp/sepbuildfix.patch              | 38 +++------------
 .../{libupnp_1.6.19.bb => libupnp_1.6.21.bb}       |  6 +--
 4 files changed, 8 insertions(+), 140 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.6.19.bb => libupnp_1.6.21.bb} (73%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
deleted file mode 100644
index abb4a72..0000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-libupnp-1.6.19: Fix CVE-2016-8863
-
-[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1388771
-
-gena_device: Fix out-of-bound access in create_url_list()
-
-If there is an invalid URL in URLS->buf after a valid one, uri_parse is
-called with out pointing after the allocated memory. As uri_parse writes
-to *out before returning an error the loop in create_url_list must be
-stopped early to prevent an out-of-bound access
-
-Upstream-Status: Backported [https://sourceforge.net/p/pupnp/code/ci/9c099c2923ab4d98530ab5204af1738be5bddba7]
-CVE: CVE-2016-8863
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-diff --git a/upnp/src/gena/gena_device.c b/upnp/src/gena/gena_device.c
-index 39edc0b..0fd60ad 100644
---- a/upnp/src/gena/gena_device.c
-+++ b/upnp/src/gena/gena_device.c
-@@ -1133,7 +1133,7 @@ static int create_url_list(
- 	/*! [out] . */
- 	URL_list *out)
- {
--    size_t URLcount = 0;
-+    size_t URLcount = 0, URLcount2 = 0;
-     size_t i;
-     int return_code = 0;
-     uri_type temp;
-@@ -1175,16 +1175,23 @@ static int create_url_list(
-         }
-         memcpy( out->URLs, URLS->buff, URLS->size );
-         out->URLs[URLS->size] = 0;
--        URLcount = 0;
-         for( i = 0; i < URLS->size; i++ ) {
-             if( ( URLS->buff[i] == '<' ) && ( i + 1 < URLS->size ) ) {
-                 if( ( ( return_code =
-                         parse_uri( &out->URLs[i + 1], URLS->size - i + 1,
--                                   &out->parsedURLs[URLcount] ) ) ==
-+                                   &out->parsedURLs[URLcount2] ) ) ==
-                       HTTP_SUCCESS )
--                    && ( out->parsedURLs[URLcount].hostport.text.size !=
-+                    && ( out->parsedURLs[URLcount2].hostport.text.size !=
-                          0 ) ) {
--                    URLcount++;
-+                    URLcount2++;
-+                    if (URLcount2 >= URLcount)
-+                        /*
-+                         * break early here in case there is a bogus URL that
-+                         * was skipped above. This prevents to access
-+                         * out->parsedURLs[URLcount] which is beyond the
-+                         * allocation.
-+                         */
-+                        break;
-                 } else {
-                     if( return_code == UPNP_E_OUTOF_MEMORY ) {
-                         free( out->URLs );
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
deleted file mode 100644
index 3c3f230..0000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 22fba4f2765f92cd592a58e1fe5c450b187e30e1 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 3 Jun 2015 21:39:03 -0700
-Subject: [PATCH] avoid redefining strnlen() and strndup()
-
-Rely on string.h definitions instead. Workaround for compiler errors such as:
-
-  | i686-rdk-linux-libtool: compile:  i686-rdk-linux-gcc -m32 -march=atom -mtune=atom -fschedule-insns -fsched-pressure -msse3 -mfpmath=sse --sysroot=/home/andre/build/tmp/sysroots/7401 -DHAVE_CONFIG_H -I. -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp -I.. -I../upnp/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/threadutil/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/ixml/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/inc -pthread -O2 -pipe -g -feliminate-unused-debug-types -Os -Wall -c /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/gena/gena_callback2.c -o src/gena/libupnp_la-gena_callback2.o >/dev/null 2>&1
-  | In file included from /home/andre/build/tmp/sysroots/7401/usr/include/string.h:634:0,
-  |                  from /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/api/UpnpString.c:23:
-  | /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/api/UpnpString.c:47:15: error: expected identifier or '(' before '__extension__'
-  |   extern char *strndup(__const char *__string, size_t __n);
-  |                ^
-  | make[3]: *** [src/api/libupnp_la-UpnpString.lo] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- upnp/src/api/UpnpString.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/upnp/src/api/UpnpString.c b/upnp/src/api/UpnpString.c
-index 41c9898..2fa09d7 100644
---- a/upnp/src/api/UpnpString.c
-+++ b/upnp/src/api/UpnpString.c
-@@ -32,7 +32,7 @@
- 	/* VC has strnlen which is already included but with (potentially) different linkage */
- 	/* strnlen() is a GNU extension. */
- 	#if HAVE_STRNLEN
--		extern size_t strnlen(const char *s, size_t maxlen);
-+//		extern size_t strnlen(const char *s, size_t maxlen);
- 	#else /* HAVE_STRNLEN */
- 		static size_t strnlen(const char *s, size_t n)
- 		{
-@@ -44,7 +44,7 @@
- 
- /* strndup() is a GNU extension. */
- #if HAVE_STRNDUP && !defined(WIN32)
--	extern char *strndup(__const char *__string, size_t __n);
-+//	extern char *strndup(__const char *__string, size_t __n);
- #else /* HAVE_STRNDUP && !defined(WIN32) */
- 	static char *strndup(const char *__string, size_t __n)
- 	{
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
index cd9768d..0493cea 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
@@ -7,54 +7,28 @@ Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- configure.ac           | 8 ++++----
- ixml/Makefile.am       | 2 +-
- threadutil/Makefile.am | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
+ configure.ac           | 10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e2c3f47..11d5e22 100644
+index a8731b5..54a3c3d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -714,8 +714,8 @@ AC_OUTPUT
+@@ -744,9 +744,9 @@ AC_OUTPUT
  #
  # Files copied for windows compilation.
  #
 -echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
+-test -d build/inc || mkdir -p build/inc
 -cp autoconfig.h build/inc/autoconfig.h
 -echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
 -cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
 +echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
++test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
 +cp autoconfig.h $srcdir/build/inc/autoconfig.h
 +echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""
 +cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
  
-diff --git a/ixml/Makefile.am b/ixml/Makefile.am
-index 49da766..0e9ab2c 100644
---- a/ixml/Makefile.am
-+++ b/ixml/Makefile.am
-@@ -7,7 +7,7 @@
- 
- SUBDIRS 		= doc
- 
--AM_CPPFLAGS		= -I$(srcdir)/inc -I$(srcdir)/src/inc
-+AM_CPPFLAGS		= -I$(top_srcdir)/upnp/inc -I$(srcdir)/inc -I$(srcdir)/src/inc
- AM_CFLAGS		= 
- 
- LDADD			= libixml.la
-diff --git a/threadutil/Makefile.am b/threadutil/Makefile.am
-index a4ed325..42d0726 100644
---- a/threadutil/Makefile.am
-+++ b/threadutil/Makefile.am
-@@ -4,7 +4,7 @@
- # (C) Copyright 2005 Remi Turboult <r3mi@users.sourceforge.net>
- #
- 
--AM_CPPFLAGS		= -I$(srcdir)/inc -I$(srcdir)/src/inc
-+AM_CPPFLAGS		= -I$(top_srcdir)/upnp/inc -I$(srcdir)/inc -I$(srcdir)/src/inc
- 
- if ENABLE_DEBUG
-     AM_CPPFLAGS		+= -DDEBUG -DSTATS
 -- 
 1.9.1
 
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
similarity index 73%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
index 71fc70d..a198829 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
@@ -9,12 +9,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
-           file://avoid-redefining-strnlen-and-strndup.patch \
            file://sepbuildfix.patch \
-           file://CVE-2016-8863.patch \
 "
 
-SRC_URI[md5sum] = "ee16e5d33a3ea7506f38d71facc057dd"
-SRC_URI[sha256sum] = "b3142b39601243b50532eec90f4a27dba85eb86f58d4b849ac94edeb29d9b22a"
+SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
+SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b"
 
 inherit autotools
-- 
2.1.4


