Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EFCB37232B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:51:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44790590"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 14:48:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA6pQeC010456
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:51:26 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 14:51:53 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 14:51:00 +0800
Message-ID: <1418194260-1906-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] opensc: add new recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 06:52:07 -0000
Content-Type: text/plain

OpenSC is a tool for accessing smart card devices. Basic
functionality (e.g. SELECT FILE, READ BINARY) should work on
any ISO 7816-4 compatible smart card. Encryption and decryption
using private keys on the smart card is possible with PKCS such
as the FINEID (Finnish Electronic IDentity) card. Swedish Posten
eID cards have also been confirmed to work.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...nsc.pc.in-opensc-config.in-delete-lscconf.patch |  48 ++++++++
 .../src-pkcs11-and-src-tools-Modify-Makefile.patch | 122 +++++++++++++++++++++
 meta-oe/recipes-support/opensc/opensc_0.11.13.bb   |  83 ++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/libopensc.pc.in-opensc-config.in-delete-lscconf.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/src-pkcs11-and-src-tools-Modify-Makefile.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc_0.11.13.bb

diff --git a/meta-oe/recipes-support/opensc/opensc/libopensc.pc.in-opensc-config.in-delete-lscconf.patch b/meta-oe/recipes-support/opensc/opensc/libopensc.pc.in-opensc-config.in-delete-lscconf.patch
new file mode 100644
index 0000000..6d0f7ca
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/libopensc.pc.in-opensc-config.in-delete-lscconf.patch
@@ -0,0 +1,48 @@
+From e39c0737d666c96c0713c348922aa494794bc6eb Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Wed, 10 Dec 2014 12:03:01 +0900
+Subject: [PATCH 1/2] libopensc.pc.in opensc-config.in: delete "-lscconf"
+
+Error Fix
+
+Upstream-Status: backport
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ src/libopensc/libopensc.pc.in  | 2 +-
+ src/libopensc/opensc-config.in | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/libopensc.pc.in b/src/libopensc/libopensc.pc.in
+index 1f550f3..c2baedd 100644
+--- a/src/libopensc/libopensc.pc.in
++++ b/src/libopensc/libopensc.pc.in
+@@ -6,6 +6,6 @@ includedir=@includedir@
+ Name: libopensc
+ Description: libopensc
+ Version: @VERSION@
+-Libs: -L${libdir} -lopensc -lscconf
++Libs: -L${libdir} -lopensc
+ Cflags: -I${includedir}
+ 
+diff --git a/src/libopensc/opensc-config.in b/src/libopensc/opensc-config.in
+index 85a8cf3..0898835 100644
+--- a/src/libopensc/opensc-config.in
++++ b/src/libopensc/opensc-config.in
+@@ -15,10 +15,10 @@ prefix="@prefix@"
+ exec_prefix="@exec_prefix@"
+ exec_prefix_set=no
+ 
+-libdir="@libdir@"
+-includedir="@includedir@"
++libdir=""
++includedir=""
+ opensc_cflags=""
+-opensc_libs="-L${libdir} -lopensc -lscconf"
++opensc_libs="-lopensc -lscconf"
+ 
+ usage()
+ {
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/opensc/opensc/src-pkcs11-and-src-tools-Modify-Makefile.patch b/meta-oe/recipes-support/opensc/opensc/src-pkcs11-and-src-tools-Modify-Makefile.patch
new file mode 100644
index 0000000..3eb07b7
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/src-pkcs11-and-src-tools-Modify-Makefile.patch
@@ -0,0 +1,122 @@
+From 7605f887b4c637f099bdd2eccb5d3082a6f93e31 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Wed, 10 Dec 2014 12:06:08 +0900
+Subject: [PATCH 2/2] src/pkcs11 and src/tools: Modify Makefile
+
+fix error: error: unrecognized command line option '-qversion'
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ src/pkcs11/Makefile.am | 1 +
+ src/pkcs11/Makefile.in | 5 +++--
+ src/tools/Makefile.am  | 2 ++
+ src/tools/Makefile.in  | 8 +++++---
+ 4 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs11/Makefile.am b/src/pkcs11/Makefile.am
+index f6b4361..3a3fced 100644
+--- a/src/pkcs11/Makefile.am
++++ b/src/pkcs11/Makefile.am
+@@ -23,6 +23,7 @@ OPENSC_PKCS11_LIBS = $(OPTIONAL_OPENSSL_LIBS) $(PTHREAD_LIBS) \
+ 	$(top_builddir)/src/scconf/libscconf.la
+ 
+ libpkcs11_la_SOURCES = libpkcs11.c
++libpkcs11_la_LIBADD = $(LTLIB_LIBS)
+ 
+ opensc_pkcs11_la_SOURCES = $(OPENSC_PKCS11_SRC) $(OPENSC_PKCS11_INC) hack-disabled.c
+ opensc_pkcs11_la_LIBADD = $(OPENSC_PKCS11_LIBS)
+diff --git a/src/pkcs11/Makefile.in b/src/pkcs11/Makefile.in
+index b0d0ff5..b6d81d6 100644
+--- a/src/pkcs11/Makefile.in
++++ b/src/pkcs11/Makefile.in
+@@ -82,10 +82,10 @@ am__base_list = \
+ am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(pkcs11dir)" \
+ 	"$(DESTDIR)$(openscincludedir)"
+ LTLIBRARIES = $(lib_LTLIBRARIES) $(noinst_LTLIBRARIES)
+-libpkcs11_la_LIBADD =
++am__DEPENDENCIES_1 =
++libpkcs11_la_DEPENDENCIES = $(am__DEPENDENCIES_1)
+ am_libpkcs11_la_OBJECTS = libpkcs11.lo
+ libpkcs11_la_OBJECTS = $(am_libpkcs11_la_OBJECTS)
+-am__DEPENDENCIES_1 =
+ am__DEPENDENCIES_2 = $(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1) \
+ 	$(top_builddir)/src/pkcs15init/libpkcs15init.la \
+ 	$(top_builddir)/src/libopensc/libopensc.la \
+@@ -348,6 +348,7 @@ OPENSC_PKCS11_LIBS = $(OPTIONAL_OPENSSL_LIBS) $(PTHREAD_LIBS) \
+ 	$(top_builddir)/src/scconf/libscconf.la
+ 
+ libpkcs11_la_SOURCES = libpkcs11.c
++libpkcs11_la_LIBADD = $(LTLIB_LIBS)
+ opensc_pkcs11_la_SOURCES = $(OPENSC_PKCS11_SRC) $(OPENSC_PKCS11_INC) \
+ 	hack-disabled.c $(am__append_1)
+ opensc_pkcs11_la_LIBADD = $(OPENSC_PKCS11_LIBS)
+diff --git a/src/tools/Makefile.am b/src/tools/Makefile.am
+index 20af208..dede7a7 100644
+--- a/src/tools/Makefile.am
++++ b/src/tools/Makefile.am
+@@ -22,6 +22,7 @@ LIBS = $(top_builddir)/src/libopensc/libopensc.la \
+ 	$(top_builddir)/src/common/libcompat.la
+ 
+ opensc_tool_SOURCES = opensc-tool.c util.c
++opensc_tool_LDADD = $(top_builddir)/src/scconf/libscconf.la
+ piv_tool_SOURCES = piv-tool.c util.c
+ piv_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+ opensc_explorer_SOURCES = opensc-explorer.c util.c
+@@ -39,6 +40,7 @@ pkcs15_init_SOURCES = pkcs15-init.c util.c
+ pkcs15_init_LDADD = $(OPTIONAL_OPENSSL_LIBS) \
+ 	$(top_builddir)/src/pkcs15init/libpkcs15init.la
+ cardos_tool_SOURCES = cardos-tool.c util.c
++cardos_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+ eidenv_SOURCES = eidenv.c
+ netkey_tool_SOURCES = netkey-tool.c
+ netkey_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+diff --git a/src/tools/Makefile.in b/src/tools/Makefile.in
+index 1041f00..c9b1d12 100644
+--- a/src/tools/Makefile.in
++++ b/src/tools/Makefile.in
+@@ -85,13 +85,13 @@ am__cardos_tool_SOURCES_DIST = cardos-tool.c util.c versioninfo.rc
+ am_cardos_tool_OBJECTS = cardos-tool.$(OBJEXT) util.$(OBJEXT) \
+ 	$(am__objects_1)
+ cardos_tool_OBJECTS = $(am_cardos_tool_OBJECTS)
+-cardos_tool_LDADD = $(LDADD)
++am__DEPENDENCIES_1 =
++cardos_tool_DEPENDENCIES = $(am__DEPENDENCIES_1)
+ am__cryptoflex_tool_SOURCES_DIST = cryptoflex-tool.c util.c \
+ 	versioninfo.rc
+ am_cryptoflex_tool_OBJECTS = cryptoflex-tool.$(OBJEXT) util.$(OBJEXT) \
+ 	$(am__objects_1)
+ cryptoflex_tool_OBJECTS = $(am_cryptoflex_tool_OBJECTS)
+-am__DEPENDENCIES_1 =
+ cryptoflex_tool_DEPENDENCIES = $(am__DEPENDENCIES_1)
+ am__eidenv_SOURCES_DIST = eidenv.c versioninfo.rc
+ am_eidenv_OBJECTS = eidenv.$(OBJEXT) $(am__objects_1)
+@@ -111,7 +111,7 @@ am__opensc_tool_SOURCES_DIST = opensc-tool.c util.c versioninfo.rc
+ am_opensc_tool_OBJECTS = opensc-tool.$(OBJEXT) util.$(OBJEXT) \
+ 	$(am__objects_1)
+ opensc_tool_OBJECTS = $(am_opensc_tool_OBJECTS)
+-opensc_tool_LDADD = $(LDADD)
++opensc_tool_DEPENDENCIES = $(top_builddir)/src/scconf/libscconf.la
+ am__piv_tool_SOURCES_DIST = piv-tool.c util.c versioninfo.rc
+ am_piv_tool_OBJECTS = piv-tool.$(OBJEXT) util.$(OBJEXT) \
+ 	$(am__objects_1)
+@@ -390,6 +390,7 @@ dist_bin_SCRIPTS = cardos-info $(am__append_2)
+ AM_CFLAGS = $(OPTIONAL_OPENSSL_CFLAGS) $(OPTIONAL_READLINE_CFLAGS)
+ INCLUDES = -I$(top_srcdir)/src/common -I$(top_builddir)/src/include
+ opensc_tool_SOURCES = opensc-tool.c util.c $(am__append_3)
++opensc_tool_LDADD = $(top_builddir)/src/scconf/libscconf.la
+ piv_tool_SOURCES = piv-tool.c util.c $(am__append_4)
+ piv_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+ opensc_explorer_SOURCES = opensc-explorer.c util.c $(am__append_5)
+@@ -409,6 +410,7 @@ pkcs15_init_LDADD = $(OPTIONAL_OPENSSL_LIBS) \
+ 	$(top_builddir)/src/pkcs15init/libpkcs15init.la
+ 
+ cardos_tool_SOURCES = cardos-tool.c util.c $(am__append_11)
++cardos_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+ eidenv_SOURCES = eidenv.c $(am__append_12)
+ netkey_tool_SOURCES = netkey-tool.c $(am__append_13)
+ netkey_tool_LDADD = $(OPTIONAL_OPENSSL_LIBS)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.11.13.bb b/meta-oe/recipes-support/opensc/opensc_0.11.13.bb
new file mode 100644
index 0000000..a085dee
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc_0.11.13.bb
@@ -0,0 +1,83 @@
+SUMMARY = "Smart card library and applications"
+DESCRIPTION = "OpenSC is a package for for accessing smart card devices. Basic\
+functionality (e.g. SELECT FILE, READ BINARY) should work on any ISO\
+7816-4 compatible smart card. Encryption and decryption using private\
+keys on the smart card is possible with PKCS\
+such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten\
+eID cards have also been confirmed to work."
+
+HOMEPAGE = "http://www.opensc-project.org/opensc/"
+SECTION = "System Environment/Libraries"
+
+SRC_URI = " \
+    ${DEBIAN_MIRROR}/main/o/${PN}/${PN}_${PV}.orig.tar.gz \
+    file://libopensc.pc.in-opensc-config.in-delete-lscconf.patch \
+    file://src-pkcs11-and-src-tools-Modify-Makefile.patch \
+"
+
+SRC_URI[md5sum] = "98fa151e947941f9c3f27420fdf47c11"
+SRC_URI[sha256sum] = "a9a42d6d51fb500f34248fcd0d4083c99d25bc5e74df60fe4efa19b5b4e6d890"
+
+DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " \
+    --disable-static \
+    --enable-openct \
+    --enable-doc \
+    --with-plugindir=${plugindir} \
+    --with-pinentry=/usr/bin/pinentry \
+    --disable-nsplugin \
+"
+
+do_install() {
+    rm -rf ${D} _docs
+    install -d ${D}/etc
+    install -d ${D}${libdir}/pkcs11
+    install -dm 755 ${D}${libexecdir}
+    oe_runmake install DESTDIR=${D}
+    install -Dpm 644 etc/opensc.conf ${D}/etc/opensc.conf
+    # use NEWS file timestamp as reference for configuration file
+    touch -r ${S}/NEWS ${D}/etc/opensc.conf
+    find ${D}${libdir} -type f -name "*.la" | xargs rm
+    if [ -d apidocdir ]; then
+        rm -rf apidocdir
+    fi
+    if [ -d docdir ]; then
+        rm -rf docdir
+    fi
+    mkdir apidocdir
+    mv ${D}/usr/share/doc/opensc/api.html apidocdir
+    mv -T ${D}/usr/share/doc/opensc docdir
+    #remove not packaged files
+    rm -rf ${D}${libdir}/libopensc.a
+    rm -rf ${D}${libdir}/libpkcs15init.a
+    rm -rf ${D}${libdir}/libscconf.a
+    rm -rf ${D}${libdir}/mozilla
+    rm -rf ${D}${libdir}/onepin-opensc-pkcs11.a
+    rm -rf ${D}${libdir}/opensc-pkcs11.a
+    rm -rf ${D}${libdir}/pkcs11-spy.a
+    #remove empty directory
+    rm -rf ${D}${sbindir}
+    rm -rf ${D}${libexecdir}
+}
+
+FILES_${PN} += "\
+    ${libdir}/opensc-pkcs11.so \
+    ${libdir}/onepin-opensc-pkcs11.so \
+    ${libdir}/pkcs11-spy.so \
+"
+FILES_${PN}-dev += "\
+    ${libdir}/pkcs11/opensc-pkcs11.so \
+    ${libdir}/pkcs11/onepin-opensc-pkcs11.so \
+    ${libdir}/pkcs11/pkcs11-spy.so \
+"
+FILES_${PN}-dbg += "\
+    ${libdir}/pkcs11/.debug/opensc-pkcs11.so \
+    ${libdir}/pkcs11/.debug/onepin-opensc-pkcs11.so \
+    ${libdir}/pkcs11/.debug/pkcs11-spy.so \
+"
-- 
1.8.4.2


