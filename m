Received: from 6.27.mail-out.ovh.net ([46.105.50.195] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pyqc0-00015e-Dp
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 20:06:09 +0100
Received: (qmail 17760 invoked by uid 503); 13 Mar 2011 19:51:11 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:28 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:55 +0100
Message-Id: <1300042739-17381-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411878483834809677
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 5/9] apache2: remove 2.2.14
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
X-List-Received-Date: Sun, 13 Mar 2011 19:06:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

which doesn't build and is replaced by 2.2.17

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apache2/apache2-2.2.14/apr-sockets-patch   |   10 --
 recipes/apache2/apache2-2.2.14/apr.h.in.patch      |   13 --
 recipes/apache2/apache2-2.2.14/configure-patch     |   71 -----------
 recipes/apache2/apache2-2.2.14/configure.in.patch  |   27 -----
 .../apache2/apache2-2.2.14/dftables-makefile-patch |   10 --
 .../apache2/apache2-2.2.14/server-makefile-patch   |   11 --
 recipes/apache2/apache2-native_2.2.14.bb           |   44 -------
 recipes/apache2/apache2_2.2.14.bb                  |  122 --------------------
 8 files changed, 0 insertions(+), 308 deletions(-)
 delete mode 100644 recipes/apache2/apache2-2.2.14/apr-sockets-patch
 delete mode 100644 recipes/apache2/apache2-2.2.14/apr.h.in.patch
 delete mode 100644 recipes/apache2/apache2-2.2.14/configure-patch
 delete mode 100644 recipes/apache2/apache2-2.2.14/configure.in.patch
 delete mode 100644 recipes/apache2/apache2-2.2.14/dftables-makefile-patch
 delete mode 100644 recipes/apache2/apache2-2.2.14/server-makefile-patch
 delete mode 100644 recipes/apache2/apache2-native_2.2.14.bb
 delete mode 100644 recipes/apache2/apache2_2.2.14.bb

diff --git a/recipes/apache2/apache2-2.2.14/apr-sockets-patch b/recipes/apache2/apache2-2.2.14/apr-sockets-patch
deleted file mode 100644
index 5e97482..0000000
--- a/recipes/apache2/apache2-2.2.14/apr-sockets-patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- httpd-2.2.3/srclib/apr/network_io/unix/sockets.c.orig
-+++ httpd-2.2.3/srclib/apr/network_io/unix/sockets.c	
-@@ -231,6 +231,7 @@
- #if APR_O_NONBLOCK_INHERITED
-     if (apr_is_option_set(sock, APR_SO_NONBLOCK) == 1) {
-         apr_set_option(*new, APR_SO_NONBLOCK, 1);
-+	apr_socket_opt_set(*new, APR_SO_NONBLOCK, 0); 
-     }
- #endif /* APR_O_NONBLOCK_INHERITED */
- 
diff --git a/recipes/apache2/apache2-2.2.14/apr.h.in.patch b/recipes/apache2/apache2-2.2.14/apr.h.in.patch
deleted file mode 100644
index 97554c9..0000000
--- a/recipes/apache2/apache2-2.2.14/apr.h.in.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: httpd-2.2.14/srclib/apr/include/apr.h.in
-===================================================================
---- httpd-2.2.14.orig/srclib/apr/include/apr.h.in
-+++ httpd-2.2.14/srclib/apr/include/apr.h.in
-@@ -224,7 +224,7 @@ extern "C" {
- #define APR_HAVE_STRUCT_RLIMIT  @struct_rlimit@
- #define APR_HAVE_UNION_SEMUN    @have_union_semun@
- #define APR_HAVE_SCTP           @have_sctp@
--#define APR_HAVE_IOVEC          @have_iovec@
-+#define APR_HAVE_IOVEC          1
- 
- /*  APR Feature Macros */
- #define APR_HAS_SHARED_MEMORY     @sharedmem@
diff --git a/recipes/apache2/apache2-2.2.14/configure-patch b/recipes/apache2/apache2-2.2.14/configure-patch
deleted file mode 100644
index 50f7420..0000000
--- a/recipes/apache2/apache2-2.2.14/configure-patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Index: httpd-2.2.14/configure
-===================================================================
---- httpd-2.2.14.orig/configure
-+++ httpd-2.2.14/configure
-@@ -3795,26 +3795,6 @@ if test "${with_apr+set}" = set; then :
- 
- else
- 
--        if test -n "1" && test "1" = "1"; then
--      for apr_temp_apr_config_file in $apr_temp_acceptable_apr_config
--      do
--        if $apr_temp_apr_config_file --help > /dev/null 2>&1 ; then
--          apr_config="$apr_temp_apr_config_file"
--
--          apr_found="yes"
--          break
--        else
--                    for lookdir in /usr /usr/local /usr/local/apr /opt/apr; do
--            if $TEST_X "$lookdir/bin/$apr_temp_apr_config_file"; then
--              apr_config="$lookdir/bin/$apr_temp_apr_config_file"
--
--              apr_found="yes"
--              break 2
--            fi
--          done
--        fi
--      done
--    fi
-         if test "$apr_found" = "no" && test -d ""$srcdir/srclib/apr""; then
-       apr_temp_abs_srcdir="`cd "$srcdir/srclib/apr" && pwd`"
-       apr_found="reconfig"
-@@ -4147,26 +4127,6 @@ if test "${with_apr_util+set}" = set; th
- 
- else
- 
--    if test -n "1" && test "1" = "1"; then
--      for apu_temp_apu_config_file in $apu_temp_acceptable_apu_config
--      do
--        if $apu_temp_apu_config_file --help > /dev/null 2>&1 ; then
--          apu_config="$apu_temp_apu_config_file"
--
--          apu_found="yes"
--          break
--        else
--                    for lookdir in /usr /usr/local /usr/local/apr /opt/apr; do
--            if $TEST_X "$lookdir/bin/$apu_temp_apu_config_file"; then
--              apu_config="$lookdir/bin/$apu_temp_apu_config_file"
--
--              apu_found="yes"
--              break 2
--            fi
--          done
--        fi
--      done
--    fi
-         if test "$apu_found" = "no" && test -d ""$srcdir/srclib/apr-util""; then
-       apu_temp_abs_srcdir="`cd "$srcdir/srclib/apr-util" && pwd`"
-       apu_found="reconfig"
-@@ -7045,7 +7005,11 @@ if test "${ap_cv_void_ptr_lt_long+set}"
-   $as_echo_n "(cached) " >&6
- else
-   if test "$cross_compiling" = yes; then :
--  ap_cv_void_ptr_lt_long=yes
-+    if test "$ac_cv_sizeof_long_p" = "$ac_cv_sizeof_void_p"; then
-+      ap_void_ptr_lt_long=no
-+    else
-+      ap_void_ptr_lt_long=yes
-+    fi
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/recipes/apache2/apache2-2.2.14/configure.in.patch b/recipes/apache2/apache2-2.2.14/configure.in.patch
deleted file mode 100644
index 2ca098d..0000000
--- a/recipes/apache2/apache2-2.2.14/configure.in.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: httpd-2.2.14/srclib/apr/configure.in
-===================================================================
---- httpd-2.2.14.orig/srclib/apr/configure.in
-+++ httpd-2.2.14/srclib/apr/configure.in
-@@ -923,7 +923,7 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
-                 create_area])
- 
- APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
--AC_CHECK_FILE(/dev/zero)
-+APR_CHECK_FILE(/dev/zero)
- 
- # Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
- if test "$ac_cv_func_mmap" = "yes" &&
-Index: httpd-2.2.14/configure.in
-===================================================================
---- httpd-2.2.14.orig/configure.in
-+++ httpd-2.2.14/configure.in
-@@ -61,6 +61,9 @@ APR_MKDIR_P_CHECK($top_srcdir/build/mkdi
- 
- dnl ## Run configure for packages Apache uses
- 
-+dnl first configure subdirs
-+AC_CONFIG_SUBDIRS(srclib/apr srclib/apr-util srclib/prce)
-+
- dnl shared library support for these packages doesn't currently
- dnl work on some platforms
- 
diff --git a/recipes/apache2/apache2-2.2.14/dftables-makefile-patch b/recipes/apache2/apache2-2.2.14/dftables-makefile-patch
deleted file mode 100644
index ac966db..0000000
--- a/recipes/apache2/apache2-2.2.14/dftables-makefile-patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- http-2.2.3/srclib/pcre/Makefile.in-orig
-+++ http-2.2.3/srclib/pcre/Makefile.in	2005-12-20 13:12:03.000000000 -0500
-@@ -15,6 +15,6 @@
- 	$(LINK) $(EXTRA_LDFLAGS) dftables.lo $(EXTRA_LIBS)
- 
- $(srcdir)/chartables.c: dftables
--	./dftables $@
-+	dftables $@
- 
- pcre.lo: $(srcdir)/chartables.c
diff --git a/recipes/apache2/apache2-2.2.14/server-makefile-patch b/recipes/apache2/apache2-2.2.14/server-makefile-patch
deleted file mode 100644
index f1349cb..0000000
--- a/recipes/apache2/apache2-2.2.14/server-makefile-patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000 -0500
-+++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000 -0500
-@@ -27,7 +27,7 @@
- 	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
- 
- test_char.h: gen_test_char
--	./gen_test_char > test_char.h
-+	gen_test_char > test_char.h
- 
- util.lo: test_char.h
- 
diff --git a/recipes/apache2/apache2-native_2.2.14.bb b/recipes/apache2/apache2-native_2.2.14.bb
deleted file mode 100644
index 8b1bf7e..0000000
--- a/recipes/apache2/apache2-native_2.2.14.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SECTION = "net"
-DEPENDS = "expat pcre"
-
-inherit native 
-
-PR = "r2"
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
-
-S = "${WORKDIR}/httpd-${PV}"
-
-do_configure () {
-	./configure --with-included-apr --prefix=${prefix}
-}
-
-do_install () {
-	install -d ${D}${bindir} ${D}${libdir}
-	cp server/gen_test_char ${D}${bindir}
-	cp srclib/apr/apr-1-config ${D}${bindir}
-	cp srclib/apr-util/apu-1-config ${D}${bindir}
-	cp support/apxs ${D}${bindir}
-	chmod 755 ${D}${bindir}/apxs
-	install -d ${D}/usr/build
-	cp build/*.mk ${D}/usr/build
-	cp build/instdso.sh ${D}/usr/build
-	cp .libs/httpd ${D}${bindir}
-
-	(cd srclib/apr/.libs; tar -cf - libapr-*.so* ) |
-	  (cd ${D}${libdir}; tar -xf - )
-	(cd srclib/apr-util/.libs; tar -cf - libaprutil-*.so* ) |
-	  (cd ${D}${libdir}; tar -xf - )
-
-	install -d ${D}${includedir}/apache2
-	cp include/* ${D}${includedir}/apache2
-	cp os/unix/os.h ${D}${includedir}/apache2
-	cp os/unix/unixd.h ${D}${includedir}/apache2
-
-  	cp support/envvars-std ${D}${bindir}/envvars
-    	chmod 755 ${D}${bindir}/envvars
-}
-
-SRC_URI[md5sum] = "a5226203aaf97e5b941c41a71c112704"
-SRC_URI[sha256sum] = "b2deab8a5e797fde7a04fb4a5ebfa9c80f767d064dd19dcd2857c94838ae3ac6"
-
-NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/apache2/apache2_2.2.14.bb b/recipes/apache2/apache2_2.2.14.bb
deleted file mode 100644
index 8a6b38d..0000000
--- a/recipes/apache2/apache2_2.2.14.bb
+++ /dev/null
@@ -1,122 +0,0 @@
-SECTION = "net"
-DESCRIPTION = "The apache v2 web server"
-DEPENDS = "libtool-native apache2-native openssl expat pcre"
-RDEPENDS_${PN} += "openssl"
-
-PR = "r2"
-
-SRC_URI = "http://apache.mirrors.tds.net/httpd/httpd-${PV}.tar.bz2 \
-	   file://apr-sockets-patch;apply=yes \
-	   file://configure-patch;apply=yes \
-	   file://server-makefile-patch;apply=yes \
-	   file://configure.in.patch \
-	   file://apr.h.in.patch \
-           file://init"
-
-#
-# over-ride needed since apache unpacks into httpd
-#
-S = "${WORKDIR}/httpd-${PV}"
-
-#
-# implications - autotools defines suitable do_configure, do_install, etc.
-# update-rc.d adds hooks for rc-update.
-#
-#
-inherit autotools update-rc.d
-
-#
-# implications - used by update-rc.d scripts
-#
-INITSCRIPT_NAME = "apache2"
-INITSCRIPT_PARAMS = "defaults 91 20"
-LEAD_SONAME = "libapr-1.so.0"
-
-CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
-		   ${sysconfdir}/${PN}/magic \
-		   ${sysconfdir}/${PN}/mime.types \
-		   ${sysconfdir}/init.d/${PN} "
-
-#
-PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
-
-# we override here rather than append so that .so links are
-# included in the runtime package rather than here (-dev)
-# and to get build, icons, error into the -dev package
-FILES_${PN}-dev = "${datadir}/${PN}/build \
-		${datadir}/${PN}/icons \
-		${datadir}/${PN}/error \
-		${bindir}/apr-config ${bindir}/apu-config \
-		${libdir}/apr*.exp \
-		${includedir}/${PN} \
-		${libdir}/*.la \
-		${libdir}/*.a"
-
-# manual to manual
-FILES_${PN}-doc += " ${datadir}/${PN}/manual"
-
-#
-# override this too - here is the default, less datadir
-#
-FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \
-		${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
-		${libdir}/${PN}"
-
-# we want htdocs and cgi-bin to go with the binary
-FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
-
-#make sure the lone .so links also get wrapped in the base package
-FILES_${PN} += " ${libdir}/lib*.so ${libdir}/pkgconfig/*"
-
-CFLAGS_append = " -DPATH_MAX=4096"
-CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
-EXTRA_OECONF = "--enable-ssl \
-		--with-ssl=${STAGING_LIBDIR}/.. \
-		--with-expat=${STAGING_LIBDIR}/.. \
-		--with-pcre=${STAGING_LIBDIR}/.. \
-		--enable-info \
-		--enable-rewrite \
-		--with-dbm=sdbm \
-		--with-berkeley-db=no \
-		--localstatedir=/var/${PN} \
-		--with-gdbm=no \
-		--with-ndbm=no \
-		--includedir=${includedir}/${PN} \
-		--datadir=${datadir}/${PN} \
-		--sysconfdir=${sysconfdir}/${PN} \
-		"
-
-#
-# here we over-ride the autotools provided do_configure.
-#
-
-do_configure_prepend() {
-	sed -e 's,libtool libtool15,${HOST_SYS}-libtool libtool115,' -i ${S}/srclib/apr/build/buildcheck.sh
-}
-
-do_configure() {
-	( cd srclib/apr; sh ./buildconf ) 
-	oe_runconf
-}
-
-do_compile_prepend() {
-	ln -sf ${S}/srclib/apr/${HOST_SYS}-libtool ${S}/srclib/apr/libtool
-}	
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/init.d
-	cat ${WORKDIR}/init | \
-		sed -e 's,/usr/sbin/,${sbindir}/,g' \
-		    -e 's,/usr/bin/,${bindir}/,g' \
-		    -e 's,/usr/lib,${libdir}/,g' \
-		    -e 's,/etc/,${sysconfdir}/,g' \
-		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
-	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
-# remove the goofy original files...
-	rm -rf ${D}/${sysconfdir}/${PN}/original
-# Expat should be found in the staging area via DEPENDS...
-	rm -f ${D}/${libdir}/libexpat.*
-}
-
-SRC_URI[md5sum] = "a5226203aaf97e5b941c41a71c112704"
-SRC_URI[sha256sum] = "b2deab8a5e797fde7a04fb4a5ebfa9c80f767d064dd19dcd2857c94838ae3ac6"
-- 
1.7.0.4



