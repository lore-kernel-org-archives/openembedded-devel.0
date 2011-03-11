Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyBxw-0002ZI-7W
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:41:52 +0100
Received: (qmail 8166 invoked by uid 503); 12 Mar 2011 00:19:12 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 12 Mar 2011 00:19:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 01:33:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 01:33:31 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 00:34:56 +0100
Message-Id: <1299886498-22190-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12775304768398404937
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] apache2: add 2.2.17
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
X-List-Received-Date: Fri, 11 Mar 2011 23:41:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/apache2/apache2-2.2.17/apr-sockets-patch   |   10 ++
 recipes/apache2/apache2-2.2.17/apr.h.in.patch      |   13 ++
 recipes/apache2/apache2-2.2.17/configure-patch     |   71 +++++++++++
 recipes/apache2/apache2-2.2.17/configure.in.patch  |   27 +++++
 .../apache2/apache2-2.2.17/dftables-makefile-patch |   10 ++
 .../apache2/apache2-2.2.17/server-makefile-patch   |   11 ++
 recipes/apache2/apache2-native_2.2.17.bb           |   44 +++++++
 recipes/apache2/apache2_2.2.17.bb                  |  122 ++++++++++++++++++++
 8 files changed, 308 insertions(+), 0 deletions(-)
 create mode 100644 recipes/apache2/apache2-2.2.17/apr-sockets-patch
 create mode 100644 recipes/apache2/apache2-2.2.17/apr.h.in.patch
 create mode 100644 recipes/apache2/apache2-2.2.17/configure-patch
 create mode 100644 recipes/apache2/apache2-2.2.17/configure.in.patch
 create mode 100644 recipes/apache2/apache2-2.2.17/dftables-makefile-patch
 create mode 100644 recipes/apache2/apache2-2.2.17/server-makefile-patch
 create mode 100644 recipes/apache2/apache2-native_2.2.17.bb
 create mode 100644 recipes/apache2/apache2_2.2.17.bb

diff --git a/recipes/apache2/apache2-2.2.17/apr-sockets-patch b/recipes/apache2/apache2-2.2.17/apr-sockets-patch
new file mode 100644
index 0000000..5e97482
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/apr-sockets-patch
@@ -0,0 +1,10 @@
+--- httpd-2.2.3/srclib/apr/network_io/unix/sockets.c.orig
++++ httpd-2.2.3/srclib/apr/network_io/unix/sockets.c	
+@@ -231,6 +231,7 @@
+ #if APR_O_NONBLOCK_INHERITED
+     if (apr_is_option_set(sock, APR_SO_NONBLOCK) == 1) {
+         apr_set_option(*new, APR_SO_NONBLOCK, 1);
++	apr_socket_opt_set(*new, APR_SO_NONBLOCK, 0); 
+     }
+ #endif /* APR_O_NONBLOCK_INHERITED */
+ 
diff --git a/recipes/apache2/apache2-2.2.17/apr.h.in.patch b/recipes/apache2/apache2-2.2.17/apr.h.in.patch
new file mode 100644
index 0000000..97554c9
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/apr.h.in.patch
@@ -0,0 +1,13 @@
+Index: httpd-2.2.14/srclib/apr/include/apr.h.in
+===================================================================
+--- httpd-2.2.14.orig/srclib/apr/include/apr.h.in
++++ httpd-2.2.14/srclib/apr/include/apr.h.in
+@@ -224,7 +224,7 @@ extern "C" {
+ #define APR_HAVE_STRUCT_RLIMIT  @struct_rlimit@
+ #define APR_HAVE_UNION_SEMUN    @have_union_semun@
+ #define APR_HAVE_SCTP           @have_sctp@
+-#define APR_HAVE_IOVEC          @have_iovec@
++#define APR_HAVE_IOVEC          1
+ 
+ /*  APR Feature Macros */
+ #define APR_HAS_SHARED_MEMORY     @sharedmem@
diff --git a/recipes/apache2/apache2-2.2.17/configure-patch b/recipes/apache2/apache2-2.2.17/configure-patch
new file mode 100644
index 0000000..405b1c1
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/configure-patch
@@ -0,0 +1,71 @@
+diff --git a/configure b/configure
+index 7cc39f3..447a65a 100755
+--- a/configure
++++ b/configure
+@@ -3545,26 +3545,6 @@ $as_echo "$as_me: error: the --with-apr parameter is incorrect. It must specify
+ 
+ else
+ 
+-        if test -n "1" && test "1" = "1"; then
+-      for apr_temp_apr_config_file in $apr_temp_acceptable_apr_config
+-      do
+-        if $apr_temp_apr_config_file --help > /dev/null 2>&1 ; then
+-          apr_config="$apr_temp_apr_config_file"
+-
+-          apr_found="yes"
+-          break
+-        else
+-                    for lookdir in /usr /usr/local /usr/local/apr /opt/apr; do
+-            if $TEST_X "$lookdir/bin/$apr_temp_apr_config_file"; then
+-              apr_config="$lookdir/bin/$apr_temp_apr_config_file"
+-
+-              apr_found="yes"
+-              break 2
+-            fi
+-          done
+-        fi
+-      done
+-    fi
+         if test "$apr_found" = "no" && test -d ""$srcdir/srclib/apr""; then
+       apr_temp_abs_srcdir="`cd "$srcdir/srclib/apr" && pwd`"
+       apr_found="reconfig"
+@@ -3905,26 +3885,6 @@ $as_echo "$as_me: error: the --with-apr-util parameter is incorrect. It must spe
+ 
+ else
+ 
+-    if test -n "1" && test "1" = "1"; then
+-      for apu_temp_apu_config_file in $apu_temp_acceptable_apu_config
+-      do
+-        if $apu_temp_apu_config_file --help > /dev/null 2>&1 ; then
+-          apu_config="$apu_temp_apu_config_file"
+-
+-          apu_found="yes"
+-          break
+-        else
+-                    for lookdir in /usr /usr/local /usr/local/apr /opt/apr; do
+-            if $TEST_X "$lookdir/bin/$apu_temp_apu_config_file"; then
+-              apu_config="$lookdir/bin/$apu_temp_apu_config_file"
+-
+-              apu_found="yes"
+-              break 2
+-            fi
+-          done
+-        fi
+-      done
+-    fi
+         if test "$apu_found" = "no" && test -d ""$srcdir/srclib/apr-util""; then
+       apu_temp_abs_srcdir="`cd \""$srcdir/srclib/apr-util"\" && pwd`"
+       apu_found="reconfig"
+@@ -7800,7 +7760,11 @@ if test "${ap_cv_void_ptr_lt_long+set}" = set; then
+   $as_echo_n "(cached) " >&6
+ else
+   if test "$cross_compiling" = yes; then
+-  ap_cv_void_ptr_lt_long=yes
++  if test "$ac_cv_sizeof_long_p" = "$ac_cv_sizeof_void_p"; then
++    ap_void_ptr_lt_long=no
++  else
++    ap_void_ptr_lt_long=yes
++  fi
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
diff --git a/recipes/apache2/apache2-2.2.17/configure.in.patch b/recipes/apache2/apache2-2.2.17/configure.in.patch
new file mode 100644
index 0000000..2ca098d
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/configure.in.patch
@@ -0,0 +1,27 @@
+Index: httpd-2.2.14/srclib/apr/configure.in
+===================================================================
+--- httpd-2.2.14.orig/srclib/apr/configure.in
++++ httpd-2.2.14/srclib/apr/configure.in
+@@ -923,7 +923,7 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
+                 create_area])
+ 
+ APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
+-AC_CHECK_FILE(/dev/zero)
++APR_CHECK_FILE(/dev/zero)
+ 
+ # Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
+ if test "$ac_cv_func_mmap" = "yes" &&
+Index: httpd-2.2.14/configure.in
+===================================================================
+--- httpd-2.2.14.orig/configure.in
++++ httpd-2.2.14/configure.in
+@@ -61,6 +61,9 @@ APR_MKDIR_P_CHECK($top_srcdir/build/mkdi
+ 
+ dnl ## Run configure for packages Apache uses
+ 
++dnl first configure subdirs
++AC_CONFIG_SUBDIRS(srclib/apr srclib/apr-util srclib/prce)
++
+ dnl shared library support for these packages doesn't currently
+ dnl work on some platforms
+ 
diff --git a/recipes/apache2/apache2-2.2.17/dftables-makefile-patch b/recipes/apache2/apache2-2.2.17/dftables-makefile-patch
new file mode 100644
index 0000000..ac966db
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/dftables-makefile-patch
@@ -0,0 +1,10 @@
+--- http-2.2.3/srclib/pcre/Makefile.in-orig
++++ http-2.2.3/srclib/pcre/Makefile.in	2005-12-20 13:12:03.000000000 -0500
+@@ -15,6 +15,6 @@
+ 	$(LINK) $(EXTRA_LDFLAGS) dftables.lo $(EXTRA_LIBS)
+ 
+ $(srcdir)/chartables.c: dftables
+-	./dftables $@
++	dftables $@
+ 
+ pcre.lo: $(srcdir)/chartables.c
diff --git a/recipes/apache2/apache2-2.2.17/server-makefile-patch b/recipes/apache2/apache2-2.2.17/server-makefile-patch
new file mode 100644
index 0000000..f1349cb
--- /dev/null
+++ b/recipes/apache2/apache2-2.2.17/server-makefile-patch
@@ -0,0 +1,11 @@
+--- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000 -0500
++++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000 -0500
+@@ -27,7 +27,7 @@
+ 	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
+ 
+ test_char.h: gen_test_char
+-	./gen_test_char > test_char.h
++	gen_test_char > test_char.h
+ 
+ util.lo: test_char.h
+ 
diff --git a/recipes/apache2/apache2-native_2.2.17.bb b/recipes/apache2/apache2-native_2.2.17.bb
new file mode 100644
index 0000000..66b326d
--- /dev/null
+++ b/recipes/apache2/apache2-native_2.2.17.bb
@@ -0,0 +1,44 @@
+SECTION = "net"
+DEPENDS = "expat pcre"
+
+inherit native 
+
+PR = "r0"
+SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
+
+S = "${WORKDIR}/httpd-${PV}"
+
+do_configure () {
+	./configure --with-included-apr --prefix=${prefix}
+}
+
+do_install () {
+	install -d ${D}${bindir} ${D}${libdir}
+	cp server/gen_test_char ${D}${bindir}
+	cp srclib/apr/apr-1-config ${D}${bindir}
+	cp srclib/apr-util/apu-1-config ${D}${bindir}
+	cp support/apxs ${D}${bindir}
+	chmod 755 ${D}${bindir}/apxs
+	install -d ${D}/usr/build
+	cp build/*.mk ${D}/usr/build
+	cp build/instdso.sh ${D}/usr/build
+	cp .libs/httpd ${D}${bindir}
+
+	(cd srclib/apr/.libs; tar -cf - libapr-*.so* ) |
+	  (cd ${D}${libdir}; tar -xf - )
+	(cd srclib/apr-util/.libs; tar -cf - libaprutil-*.so* ) |
+	  (cd ${D}${libdir}; tar -xf - )
+
+	install -d ${D}${includedir}/apache2
+	cp include/* ${D}${includedir}/apache2
+	cp os/unix/os.h ${D}${includedir}/apache2
+	cp os/unix/unixd.h ${D}${includedir}/apache2
+
+  	cp support/envvars-std ${D}${bindir}/envvars
+    	chmod 755 ${D}${bindir}/envvars
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
+SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e"
+SRC_URI[sha256sum] = "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04"
diff --git a/recipes/apache2/apache2_2.2.17.bb b/recipes/apache2/apache2_2.2.17.bb
new file mode 100644
index 0000000..18d036d
--- /dev/null
+++ b/recipes/apache2/apache2_2.2.17.bb
@@ -0,0 +1,122 @@
+SECTION = "net"
+DESCRIPTION = "The apache v2 web server"
+DEPENDS = "libtool-native apache2-native openssl expat pcre"
+RDEPENDS_${PN} += "openssl"
+
+PR = "r0"
+
+SRC_URI = "http://apache.mirrors.tds.net/httpd/httpd-${PV}.tar.bz2 \
+	   file://apr-sockets-patch;apply=yes \
+	   file://configure-patch;apply=yes \
+	   file://server-makefile-patch;apply=yes \
+	   file://configure.in.patch \
+	   file://apr.h.in.patch \
+           file://init"
+
+#
+# over-ride needed since apache unpacks into httpd
+#
+S = "${WORKDIR}/httpd-${PV}"
+
+#
+# implications - autotools defines suitable do_configure, do_install, etc.
+# update-rc.d adds hooks for rc-update.
+#
+#
+inherit autotools update-rc.d
+
+#
+# implications - used by update-rc.d scripts
+#
+INITSCRIPT_NAME = "apache2"
+INITSCRIPT_PARAMS = "defaults 91 20"
+LEAD_SONAME = "libapr-1.so.0"
+
+CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
+		   ${sysconfdir}/${PN}/magic \
+		   ${sysconfdir}/${PN}/mime.types \
+		   ${sysconfdir}/init.d/${PN} "
+
+#
+PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+
+# we override here rather than append so that .so links are
+# included in the runtime package rather than here (-dev)
+# and to get build, icons, error into the -dev package
+FILES_${PN}-dev = "${datadir}/${PN}/build \
+		${datadir}/${PN}/icons \
+		${datadir}/${PN}/error \
+		${bindir}/apr-config ${bindir}/apu-config \
+		${libdir}/apr*.exp \
+		${includedir}/${PN} \
+		${libdir}/*.la \
+		${libdir}/*.a"
+
+# manual to manual
+FILES_${PN}-doc += " ${datadir}/${PN}/manual"
+
+#
+# override this too - here is the default, less datadir
+#
+FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \
+		${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
+		${libdir}/${PN}"
+
+# we want htdocs and cgi-bin to go with the binary
+FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
+
+#make sure the lone .so links also get wrapped in the base package
+FILES_${PN} += " ${libdir}/lib*.so ${libdir}/pkgconfig/*"
+
+CFLAGS_append = " -DPATH_MAX=4096"
+CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
+EXTRA_OECONF = "--enable-ssl \
+		--with-ssl=${STAGING_LIBDIR}/.. \
+		--with-expat=${STAGING_LIBDIR}/.. \
+		--with-pcre=${STAGING_LIBDIR}/.. \
+		--enable-info \
+		--enable-rewrite \
+		--with-dbm=sdbm \
+		--with-berkeley-db=no \
+		--localstatedir=/var/${PN} \
+		--with-gdbm=no \
+		--with-ndbm=no \
+		--includedir=${includedir}/${PN} \
+		--datadir=${datadir}/${PN} \
+		--sysconfdir=${sysconfdir}/${PN} \
+		"
+
+#
+# here we over-ride the autotools provided do_configure.
+#
+
+do_configure_prepend() {
+	sed -e 's,libtool libtool15,${TARGET_PREFIX}libtool libtool115,' -i ${S}/srclib/apr/build/buildcheck.sh
+}
+
+do_configure() {
+	( cd srclib/apr; sh ./buildconf ) 
+	oe_runconf
+}
+
+do_compile_prepend() {
+	ln -sf ${S}/srclib/apr/${TARGET_PREFIX}libtool ${S}/srclib/apr/libtool
+}	
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/init.d
+	cat ${WORKDIR}/init | \
+		sed -e 's,/usr/sbin/,${sbindir}/,g' \
+		    -e 's,/usr/bin/,${bindir}/,g' \
+		    -e 's,/usr/lib,${libdir}/,g' \
+		    -e 's,/etc/,${sysconfdir}/,g' \
+		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
+	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
+# remove the goofy original files...
+	rm -rf ${D}/${sysconfdir}/${PN}/original
+# Expat should be found in the staging area via DEPENDS...
+	rm -f ${D}/${libdir}/libexpat.*
+}
+
+SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e"
+SRC_URI[sha256sum] = "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04"
-- 
1.7.0.4



