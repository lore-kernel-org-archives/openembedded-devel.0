Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QERMi-0004wT-12
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:22:37 +0200
Received: by pvc30 with SMTP id 30so1393818pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=/6NRLvdeeopHNRUtgaBg26xSfGdr86ODg4c0lJJ6iBE=;
	b=Db7gUrhgWyJ1dyrP/APUUKUZ1djADWGXmKiq4HMeos5sXJLRgw9YzVuTeC53FfOISk
	6fVWgOnbN5xkPmbXHgTioufQg/RgHGMTJEqjJLnG5402/NVGZDTzQ1KpWNd6W+F4Wi4t
	BWblecMoe24mhpHrjCP9IrNbQ/9Pd77trTSPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xibOJHYEv/LWiXeNqP+DhQ3mgqIHJGHsd4T1qw+3X5eRqmDNohZgGzHYJix7oBBPGo
	OAHdde21eYZUmMvV+z52AWQNur+sdcHf3GCmLBPVguq+DDMfBlZEOC7nD+dtr2fpSuAk
	/+toAvRjKpz6YkQzXeyfgnqBolmsrMvjGzrds=
Received: by 10.142.149.20 with SMTP id w20mr2812279wfd.137.1303759205454;
	Mon, 25 Apr 2011 12:20:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s39sm8119787wfc.4.2011.04.25.12.20.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 12:20:04 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 12:19:51 -0700
Message-Id: <1303759192-7863-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH 1/2] proxy-libintl: Upgrade to proxy-libintl-20100902
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
X-List-Received-Date: Mon, 25 Apr 2011 19:22:37 -0000

From: Khem Raj <raj.khem@gmail.com>

We do not need shared version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../create-as-shared-lib.patch                     |   31 ---------
 .../proxy-libintl-20080418/soname.patch            |   23 ------
 .../proxy-libintl-20080418/stub-only.patch         |   72 --------------------
 .../create-as-shared-lib.patch                     |   31 +++++++++
 .../proxy-libintl-20100902/soname.patch            |   23 ++++++
 .../proxy-libintl-20100902/stub-only.patch         |   72 ++++++++++++++++++++
 .../proxy-libintl/proxy-libintl_20080418.bb        |   39 -----------
 .../proxy-libintl/proxy-libintl_20100902.bb        |   32 +++++++++
 8 files changed, 158 insertions(+), 165 deletions(-)
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/soname.patch
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb
 create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch
deleted file mode 100644
index 306e3b8..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/src/proxy-libintl/Makefile.org	2009-09-12 23:19:04.989421607 -0700
-+++ a/src/proxy-libintl/Makefile	2009-09-12 23:21:14.100640001 -0700
-@@ -4,20 +4,20 @@ ZIPFILE = proxy-libintl-$(TIMESTAMP).zip
- CC = gcc
- CFLAGS = -Wall -I ../../include
- 
--all : ../../lib/libintl.a ../../lib/intl.lib
-+all : ../../lib/libintl.so ../../lib/intl.lib
- 
--../../lib/libintl.a : libintl.o
--	ar rc $@ libintl.o
-+../../lib/libintl.so : libintl.o
-+	$(CC) -shared -o $@ libintl.o
- 
--../../lib/intl.lib : ../../lib/libintl.a
--	cp ../../lib/libintl.a $@
--	strip --strip-unneeded $@
-+../../lib/intl.lib : ../../lib/libintl.so
-+	cp ../../lib/libintl.so $@
-+	$(STRIP) --strip-unneeded $@
- 
- libintl.o : libintl.c
- 	$(CC) $(CFLAGS) -c libintl.c
- 
- clean :
--	rm -f *.o ../../lib/libintl.a ../../$(ZIPFILE)
-+	rm -f *.o ../../lib/libintl.so ../../$(ZIPFILE)
- 
- dist : clean all
--	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.a,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
-+	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.so,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch
deleted file mode 100644
index 0df232d..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: proxy-libintl-20080418-r6/src/proxy-libintl/Makefile
-===================================================================
---- proxy-libintl-20080418-r6.orig/src/proxy-libintl/Makefile	2010-07-25 08:40:22.893620001 -0700
-+++ proxy-libintl-20080418-r6/src/proxy-libintl/Makefile	2010-07-25 10:51:29.573620000 -0700
-@@ -6,16 +6,13 @@ CFLAGS = -Wall -I ../../include
- 
- all : ../../lib/libintl.so ../../lib/intl.lib
- 
--../../lib/libintl.so : libintl.o
--	$(CC) -shared -o $@ libintl.o
-+../../lib/libintl.so : libintl.c
-+	$(CC) $(CFLAGS) -shared -Wl,-soname -Wl,libintl.so -o $@ $<
- 
- ../../lib/intl.lib : ../../lib/libintl.so
- 	cp ../../lib/libintl.so $@
- 	$(STRIP) --strip-unneeded $@
- 
--libintl.o : libintl.c
--	$(CC) $(CFLAGS) -c libintl.c
--
- clean :
- 	rm -f *.o ../../lib/libintl.so ../../$(ZIPFILE)
- 
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch
deleted file mode 100644
index 7186b13..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Index: proxy-libintl/src/proxy-libintl/libintl.c
-===================================================================
---- proxy-libintl.orig/src/proxy-libintl/libintl.c
-+++ proxy-libintl/src/proxy-libintl/libintl.c
-@@ -18,9 +18,12 @@
-  */
- 
- #ifdef _WIN32
--#include <windows.h>
-+#  include <windows.h>
- #else
--#include <dlfcn.h>
-+#  include <stddef.h>
-+#  if !STUB_ONLY
-+#    include <dlfcn.h>
-+#  endif
- typedef void* HMODULE;
- #endif
- 
-@@ -65,11 +68,13 @@ static char * (*p_bind_textdomain_codese
- static int
- use_intl_dll (HMODULE dll)
- {
--#ifdef _WIN32
--#define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
--#else
--#define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
--#endif
-+#if !STUB_ONLY
-+#  ifdef _WIN32
-+#    define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
-+#  else
-+#    define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
-+#  endif  /* _WIN32 */
-+
- 
-   LOOKUP (gettext);
-   LOOKUP (dgettext);
-@@ -82,7 +87,7 @@ use_intl_dll (HMODULE dll)
-   LOOKUP (bind_textdomain_codeset);
-   
- #undef LOOKUP
--
-+#endif  /* !STUB_ONLY */
-   return 1;
- }
- 
-@@ -171,13 +176,17 @@ setup (void)
- 
-   if (!beenhere)
-     {
--#ifdef _WIN32
--      HMODULE intl_dll = LoadLibrary ("intl.dll");
--#elif defined(__APPLE__) && defined(__MACH__)
--      HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
--#else
--      HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
--#endif
-+#if !STUB_ONLY
-+#  ifdef _WIN32
-+    HMODULE intl_dll = LoadLibrary ("intl.dll");
-+#  elif defined(__APPLE__) && defined(__MACH__)
-+    HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
-+#  else
-+    HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
-+#  endif
-+#else  /* !STUB_ONLY */
-+    HMODULE intl_dll = NULL;
-+#endif  /* STUB_ONLY */
- 
-       if (intl_dll != NULL &&
- 	  use_intl_dll (intl_dll))
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
new file mode 100644
index 0000000..306e3b8
--- /dev/null
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
@@ -0,0 +1,31 @@
+--- a/src/proxy-libintl/Makefile.org	2009-09-12 23:19:04.989421607 -0700
++++ a/src/proxy-libintl/Makefile	2009-09-12 23:21:14.100640001 -0700
+@@ -4,20 +4,20 @@ ZIPFILE = proxy-libintl-$(TIMESTAMP).zip
+ CC = gcc
+ CFLAGS = -Wall -I ../../include
+ 
+-all : ../../lib/libintl.a ../../lib/intl.lib
++all : ../../lib/libintl.so ../../lib/intl.lib
+ 
+-../../lib/libintl.a : libintl.o
+-	ar rc $@ libintl.o
++../../lib/libintl.so : libintl.o
++	$(CC) -shared -o $@ libintl.o
+ 
+-../../lib/intl.lib : ../../lib/libintl.a
+-	cp ../../lib/libintl.a $@
+-	strip --strip-unneeded $@
++../../lib/intl.lib : ../../lib/libintl.so
++	cp ../../lib/libintl.so $@
++	$(STRIP) --strip-unneeded $@
+ 
+ libintl.o : libintl.c
+ 	$(CC) $(CFLAGS) -c libintl.c
+ 
+ clean :
+-	rm -f *.o ../../lib/libintl.a ../../$(ZIPFILE)
++	rm -f *.o ../../lib/libintl.so ../../$(ZIPFILE)
+ 
+ dist : clean all
+-	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.a,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
++	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.so,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/soname.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/soname.patch
new file mode 100644
index 0000000..0df232d
--- /dev/null
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/soname.patch
@@ -0,0 +1,23 @@
+Index: proxy-libintl-20080418-r6/src/proxy-libintl/Makefile
+===================================================================
+--- proxy-libintl-20080418-r6.orig/src/proxy-libintl/Makefile	2010-07-25 08:40:22.893620001 -0700
++++ proxy-libintl-20080418-r6/src/proxy-libintl/Makefile	2010-07-25 10:51:29.573620000 -0700
+@@ -6,16 +6,13 @@ CFLAGS = -Wall -I ../../include
+ 
+ all : ../../lib/libintl.so ../../lib/intl.lib
+ 
+-../../lib/libintl.so : libintl.o
+-	$(CC) -shared -o $@ libintl.o
++../../lib/libintl.so : libintl.c
++	$(CC) $(CFLAGS) -shared -Wl,-soname -Wl,libintl.so -o $@ $<
+ 
+ ../../lib/intl.lib : ../../lib/libintl.so
+ 	cp ../../lib/libintl.so $@
+ 	$(STRIP) --strip-unneeded $@
+ 
+-libintl.o : libintl.c
+-	$(CC) $(CFLAGS) -c libintl.c
+-
+ clean :
+ 	rm -f *.o ../../lib/libintl.so ../../$(ZIPFILE)
+ 
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
new file mode 100644
index 0000000..7186b13
--- /dev/null
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
@@ -0,0 +1,72 @@
+Index: proxy-libintl/src/proxy-libintl/libintl.c
+===================================================================
+--- proxy-libintl.orig/src/proxy-libintl/libintl.c
++++ proxy-libintl/src/proxy-libintl/libintl.c
+@@ -18,9 +18,12 @@
+  */
+ 
+ #ifdef _WIN32
+-#include <windows.h>
++#  include <windows.h>
+ #else
+-#include <dlfcn.h>
++#  include <stddef.h>
++#  if !STUB_ONLY
++#    include <dlfcn.h>
++#  endif
+ typedef void* HMODULE;
+ #endif
+ 
+@@ -65,11 +68,13 @@ static char * (*p_bind_textdomain_codese
+ static int
+ use_intl_dll (HMODULE dll)
+ {
+-#ifdef _WIN32
+-#define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
+-#else
+-#define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
+-#endif
++#if !STUB_ONLY
++#  ifdef _WIN32
++#    define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
++#  else
++#    define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
++#  endif  /* _WIN32 */
++
+ 
+   LOOKUP (gettext);
+   LOOKUP (dgettext);
+@@ -82,7 +87,7 @@ use_intl_dll (HMODULE dll)
+   LOOKUP (bind_textdomain_codeset);
+   
+ #undef LOOKUP
+-
++#endif  /* !STUB_ONLY */
+   return 1;
+ }
+ 
+@@ -171,13 +176,17 @@ setup (void)
+ 
+   if (!beenhere)
+     {
+-#ifdef _WIN32
+-      HMODULE intl_dll = LoadLibrary ("intl.dll");
+-#elif defined(__APPLE__) && defined(__MACH__)
+-      HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
+-#else
+-      HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
+-#endif
++#if !STUB_ONLY
++#  ifdef _WIN32
++    HMODULE intl_dll = LoadLibrary ("intl.dll");
++#  elif defined(__APPLE__) && defined(__MACH__)
++    HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
++#  else
++    HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
++#  endif
++#else  /* !STUB_ONLY */
++    HMODULE intl_dll = NULL;
++#endif  /* STUB_ONLY */
+ 
+       if (intl_dll != NULL &&
+ 	  use_intl_dll (intl_dll))
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb
deleted file mode 100644
index fbdf76a..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "Proxy libintl"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/"
-SECTION = "libs"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
-
-PR = "r7"
-PROVIDES = "virtual/libintl"
-
-SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-${PV}.zip \
-    file://stub-only.patch \
-    file://create-as-shared-lib.patch \
-    file://soname.patch \
-"
-
-S = "${WORKDIR}"
-FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
-FILES_${PN} = "${libdir}/libintl.so"
-
-CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile() {
-    cd ${WORKDIR}/src/proxy-libintl
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}/${includedir}
-    install -m 0644 ${WORKDIR}/include/libintl.h ${D}/${includedir}
-
-    install -d ${D}/${libdir}
-    oe_libinstall -a -so -C lib libintl ${D}/${libdir}
-}
-
-
-SRC_URI[md5sum] = "63047fcbe5ff853db0d04981dd9f1888"
-SRC_URI[sha256sum] = "b8519dfd77939b23ca599a724b536f48340f2c795552aa2a600155230571141c"
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
new file mode 100644
index 0000000..7c433bd
--- /dev/null
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Proxy libintl"
+HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/"
+SECTION = "libs"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
+
+PR = "r0"
+PROVIDES = "virtual/libintl virtual/gettext"
+
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip \
+"
+SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
+SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
+
+S = "${WORKDIR}"
+FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
+
+CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile() {
+    cd ${WORKDIR}/src/proxy-libintl
+    oe_runmake ../../lib/libintl.a
+}
+
+do_install() {
+    install -d ${D}/${includedir}
+    install -d ${D}/${libdir}
+    install -m 0644 ${WORKDIR}/include/libintl.h ${D}/${includedir}
+    install -m 0644 ${WORKDIR}/lib/libintl.a ${D}/${libdir}
+}
-- 
1.7.4.1



