Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpS4L-0004kT-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:04:21 +0100
Received: by fxm17 with SMTP id 17so607413fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=fgt3r8RhhRX3SKGrypwSUN4EXEekiYKfBYn2n5qbtwo=;
	b=ToBvIVkfMhCR7sQ/msFCBf5aoLQd76qpeuBjOLFxAXz7Ctv6VIJ3cd9HgYGuVOsj0K
	nZsqEUW09hiHTZ66N0znnGRZCz5/lbA7qoyCMkGPY82tj8siPXeskMb/T5ChjXtorpQk
	HxCWsufElx4ihdXdA5M6Nv7FSZDVfLkdnYrac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WpnMyo8yQTIe150ZIGgHAXWcpf56HE4lQRYNUKd9ir+SLZjzLzzXjvriv9nkn9Od/b
	gmHSaSFaltKz2sfW/KzOuaMHUlX7D5Z23Z8rw7oJTfOBCPsTOi5FcrZqY+/hoy6z/1GI
	yAvZS4YjykpPWlSLbPydS+vBrt8E1eNBxnDx4=
Received: by 10.223.87.75 with SMTP id v11mr6721155fal.131.1297803790814;
	Tue, 15 Feb 2011 13:03:10 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm1913467faa.18.2011.02.15.13.03.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 13:03:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 22:02:58 +0100
Message-Id: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/4] glib-2.0: add 2.28.0, needed by newer libsoup
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
X-List-Received-Date: Tue, 15 Feb 2011 21:04:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../60_wait-longer-for-threads-to-die.patch        |   26 ++++++
 .../glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch  |   92 ++++++++++++++++++++
 .../glib-2.0-2.28.0/configure-libtool.patch        |   30 +++++++
 .../glib-2.0-2.28.0/g_once_init_enter.patch        |   11 +++
 .../gatomic-proper-pointer-get-cast.patch          |   12 +++
 ...b2-fix-compilation-with-no-builtin-atomic.patch |   25 ++++++
 recipes/glib-2.0/glib-2.0_2.28.0.bb                |   76 ++++++++++++++++
 7 files changed, 272 insertions(+), 0 deletions(-)
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-to-die.patch
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-cast.patch
 create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-with-no-builtin-atomic.patch
 create mode 100644 recipes/glib-2.0/glib-2.0_2.28.0.bb

diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-to-die.patch b/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-to-die.patch
new file mode 100644
index 0000000..02fe9ff
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-to-die.patch
@@ -0,0 +1,26 @@
+--- glib/tests/threadpool-test.c.old	2008-02-12 06:11:21.000000000 +0100
++++ glib/tests/threadpool-test.c	2008-02-12 06:11:52.000000000 +0100
+@@ -5,8 +5,8 @@
+ 
+ #include <glib.h>
+ 
+-#define DEBUG_MSG(x)
+-/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");  */
++/* #define DEBUG_MSG(x) */
++#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
+ 
+ #define WAIT                5    /* seconds */
+ #define MAX_THREADS         10
+@@ -124,10 +124,10 @@
+    DEBUG_MSG (("[unused] stopping unused threads"));
+    g_thread_pool_stop_unused_threads ();
+ 
+-   DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
++   DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
+ 
+    /* Some time for threads to die. */
+-   g_usleep (G_USEC_PER_SEC);
++   g_usleep (5 * G_USEC_PER_SEC);
+ 
+    DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d threads still exist",
+ 	       g_thread_pool_get_num_unused_threads (),
diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch b/recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch
new file mode 100644
index 0000000..548e0dc
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch
@@ -0,0 +1,92 @@
+From a619a217e3e5aa5345db631213aec5a3684a3001 Mon Sep 17 00:00:00 2001
+Subject: [PATCH] autodetect in6addr_{any,loopback} availability
+
+Fixes linking error on systems which choose not to support ipv6:
+./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
+./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ configure.ac       |   31 +++++++++++++++++++++++++++++++
+ gio/ginetaddress.c |   16 ++++++++++++++--
+ 2 files changed, 45 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7114014..023db49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1019,6 +1019,37 @@ if test $glib_native_win32 = no; then
+   AC_SUBST(LIBASYNCNS_LIBADD)
+ fi
+ 
++dnl handle --disable-ipv6
++AC_ARG_ENABLE(ipv6, AC_HELP_STRING([--disable-ipv6],[Disable IPv6 support]))
++if test "$ipv6" != "no"; then
++  AC_DEFINE(HAVE_IPV6, 1, [Define if IPv6 is available])
++
++  AC_MSG_CHECKING([for struct in6addr_any])
++  AC_TRY_LINK(
++   [#define IN_AUTOCONF
++     #include <sys/types.h>
++     #include <sys/socket.h>
++     #include <netinet/in.h>],
++   [struct in6_addr a = in6addr_any;
++    return a.s6_addr[0];],
++   [AC_MSG_RESULT(yes)
++    AC_DEFINE(HAVE_IN6ADDR_ANY, 1, [Define if in6addr_any is available])],
++   [AC_MSG_RESULT(no)]
++  )
++  AC_MSG_CHECKING([for struct in6addr_loopback])
++  AC_TRY_LINK(
++   [#define IN_AUTOCONF
++     #include <sys/types.h>
++     #include <sys/socket.h>
++     #include <netinet/in.h>],
++   [struct in6_addr a = in6addr_loopback;
++    return a.s6_addr[0];],
++   [AC_MSG_RESULT(yes)
++    AC_DEFINE(HAVE_IN6ADDR_LOOPBACK, 1, [Define if in6addr_loopback is available])],
++   [AC_MSG_RESULT(no)]
++  )
++fi
++
+ case $host in
+   *-*-solaris* )
+      AC_DEFINE(_XOPEN_SOURCE_EXTENDED, 1, Needed to get declarations for msg_control and msg_controllen on Solaris)
+diff --git a/gio/ginetaddress.c b/gio/ginetaddress.c
+index 0f67e4f..ed29be2 100644
+--- a/gio/ginetaddress.c
++++ b/gio/ginetaddress.c
+@@ -484,7 +484,13 @@ g_inet_address_new_loopback (GSocketFamily family)
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
+-    return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++    {
++#ifdef HAVE_IN6ADDR_LOOPBACK
++      return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++#else
++      return NULL;
++#endif
++    }
+ }
+ 
+ /**
+@@ -511,7 +517,13 @@ g_inet_address_new_any (GSocketFamily family)
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
+-    return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++    {
++#ifdef HAVE_IN6ADDR_ANY
++      return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++#else
++      return NULL;
++#endif
++    }
+ }
+ 
+ 
+-- 
+1.7.2.3
+
diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch b/recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch
new file mode 100644
index 0000000..e4e9d21
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch
@@ -0,0 +1,30 @@
+diff -uNr glib-2.28.0.orig//configure.ac glib-2.28.0/configure.ac
+--- glib-2.28.0.orig//configure.ac	2011-02-08 05:53:25.000000000 +0100
++++ glib-2.28.0/configure.ac	2011-02-15 15:07:54.683976837 +0100
+@@ -1378,7 +1378,7 @@
+   G_MODULE_LDFLAGS=
+ else
+   export SED
+-  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++  G_MODULE_LDFLAGS=`($host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ fi
+ dnl G_MODULE_IMPL= don't reset, so cmd-line can override
+ G_MODULE_NEED_USCORE=0
+@@ -1443,7 +1443,7 @@
+ 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
+ dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
+ 	echo "void glib_plugin_test(void) { }" > plugin.c
+-	${SHELL} ./libtool --mode=compile ${CC} -shared \
++	${SHELL} $host_alias-libtool --mode=compile ${CC} -shared \
+ 		-export-dynamic -o plugin.o plugin.c 2>&1 >/dev/null
+ 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
+ 		glib_cv_rtldglobal_broken,[
+@@ -1517,7 +1517,7 @@
+ 
+ AC_MSG_CHECKING(for the suffix of module shared libraries)
+ export SED
+-shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
++shrext_cmds=`$host_alias-libtool --config | grep '^shrext_cmds='`
+ eval $shrext_cmds
+ module=yes eval std_shrext=$shrext_cmds
+ # chop the initial dot
diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch b/recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch
new file mode 100644
index 0000000..58e4108
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch
@@ -0,0 +1,11 @@
+--- glib-2.22.1/glib/gthread.h.orig	2009-10-13 22:53:23.000000000 +0200
++++ glib-2.22.1/glib/gthread.h	2009-10-13 23:34:59.000000000 +0200
+@@ -341,7 +341,7 @@
+ G_INLINE_FUNC gboolean
+ g_once_init_enter (volatile gsize *value_location)
+ {
+-  if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) != NULL)
++  if G_LIKELY ((gpointer) g_atomic_pointer_get ((volatile gpointer *)value_location) != NULL)
+     return FALSE;
+   else
+     return g_once_init_enter_impl (value_location);
diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-cast.patch b/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-cast.patch
new file mode 100644
index 0000000..5a8e37d
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-cast.patch
@@ -0,0 +1,12 @@
+diff -uri glib-2.26.1.orig/glib/gatomic.h glib-2.26.1/glib/gatomic.h
+--- glib-2.26.1.orig/glib/gatomic.h	2010-07-11 05:56:45.000000000 +0200
++++ glib-2.26.1/glib/gatomic.h	2010-12-01 16:20:33.140009635 +0100
+@@ -70,7 +70,7 @@
+   (g_atomic_int_set) ((volatile gint G_GNUC_MAY_ALIAS *) (volatile void *) (atomic), (newval)))
+ # define g_atomic_pointer_get(atomic) \
+  ((void) sizeof (gchar [sizeof (*(atomic)) == sizeof (gpointer) ? 1 : -1]), \
+-  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void *) (atomic)))
++  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void G_GNUC_MAY_ALIAS *) (atomic)))
+ # define g_atomic_pointer_set(atomic, newval) \
+  ((void) sizeof (gchar [sizeof (*(atomic)) == sizeof (gpointer) ? 1 : -1]), \
+   (g_atomic_pointer_set) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volatile void *) (atomic), (newval)))
diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-with-no-builtin-atomic.patch b/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-with-no-builtin-atomic.patch
new file mode 100644
index 0000000..39c0510
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-with-no-builtin-atomic.patch
@@ -0,0 +1,25 @@
+From 58096320ea0888c4fbbff318839017a4d2e82703 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Sat, 6 Nov 2010 14:56:15 +0100
+Subject: [PATCH] glib: fix compilation with no builtin atomic operations compilers
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ glib/gatomic.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/glib/gatomic.c b/glib/gatomic.c
+index 845c866..01468ce 100644
+--- a/glib/gatomic.c
++++ b/glib/gatomic.c
+@@ -881,6 +881,7 @@ g_atomic_pointer_compare_and_exchange (volatile gpointer G_GNUC_MAY_ALIAS *atomi
+ #endif /* DEFINE_WITH_WIN32_INTERLOCKED */
+ 
+ #ifdef DEFINE_WITH_MUTEXES
++# include "gthread.h"
+ /* We have to use the slow, but safe locking method */
+ static GMutex *g_atomic_mutex; 
+ 
+-- 
+1.7.2.3
+
diff --git a/recipes/glib-2.0/glib-2.0_2.28.0.bb b/recipes/glib-2.0/glib-2.0_2.28.0.bb
new file mode 100644
index 0000000..b7f6b3e
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0_2.28.0.bb
@@ -0,0 +1,76 @@
+DESCRIPTION = "GLib is a general-purpose utility library, \
+which provides many useful data types, macros, \
+type conversions, string utilities, file utilities, a main \
+loop abstraction, and so on. It works on many \
+UNIX-like platforms, Windows, OS/2 and BeOS."
+LICENSE = "LGPLv2+"
+SECTION = "libs"
+PRIORITY = "optional"
+DEPENDS = "glib-2.0-native gtk-doc zlib"
+DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
+                            pkgconfig-native"
+
+PR = "r3"
+
+SRC_URI = "\
+  http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/glib-${PV}.tar.bz2;name=archive \
+  file://glibconfig-sysdefs.h \
+  file://configure-libtool.patch \
+  file://g_once_init_enter.patch \
+  file://gatomic-proper-pointer-get-cast.patch \
+  file://60_wait-longer-for-threads-to-die.patch \
+  file://libglib2-fix-compilation-with-no-builtin-atomic.patch \
+  file://configure-ipv6.patch \
+"
+
+SRC_URI[archive.md5sum] = "51dbe36bc03a29a1f9bf6b74fb4a6926"
+SRC_URI[archive.sha256sum] = "0605f538e5c022c237c97a34496979ba71d33c7b10b8d8edb84435498a651fb3"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/glib-${PV}"
+
+EXTRA_OECONF = "--disable-debug "
+
+# Add and entry for your favourite arch if your (g)libc has a sane printf
+EXTRA_OECONF_append_glibc_arm = "  --enable-included-printf=no "
+
+do_configure_prepend () {
+	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
+	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
+}
+
+do_install_append() {
+	sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g ${D}${bindir}/glib-mkenums || true
+}
+
+EXTRA_OECONF_virtclass-native = ""
+
+do_configure_prepend_virtclass-native() {
+    if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
+                echo "${TARGET_SYS}-libtool already present"
+    else
+        cp ${STAGING_BINDIR}/${TARGET_SYS}-libtool ${S}
+    fi
+
+}
+
+BBCLASSEXTEND = "native"
+
+PACKAGES =+ "gobject-2.0 gmodule-2.0 gthread-2.0 gio-2.0 glib-2.0-utils "
+LEAD_SONAME = "libglib-2.0.*"
+FILES_glib-2.0-utils = "${bindir}/*"
+FILES_${PN} = "${libdir}/lib*so.* ${libdir}/gio/modules/*.so"
+FILES_${PN}-dev += "${libdir}/glib-2.0 ${datadir}/glib-2.0 ${libdir}/gio/modules/*.la"
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug"
+FILES_gmodule-2.0 = "${libdir}/libgmodule-2.0.so.*"
+FILES_gobject-2.0 = "${libdir}/libgobject-2.0.so.*"
+FILES_gio-2.0 = "${libdir}/libgio-2.0.so.*"
+FILES_gthread-2.0 = "${libdir}/libgthread-2.0.so.*"
+
+# Let various glib components end up in glib package
+# for compatibility (with binary packages from Maemo).
+FILES_gthread-2.0_chinook-compat = ""
+FILES_gmodule-2.0_chinook-compat = ""
+FILES_gobject-2.0_chinook-compat = ""
+FILES_gio-2.0_chinook-compat = ""
-- 
1.7.4.1



