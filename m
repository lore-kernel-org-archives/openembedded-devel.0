Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DF91473E44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:58:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97190624"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:02:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H7ub80016514
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:56:37 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 15:58:25 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:49:12 +0800
Message-ID: <1434527353-47017-7-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2 6/7] talloc: upgrade to 2.1.1
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
X-List-Received-Date: Wed, 17 Jun 2015 07:58:11 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../install-swig-interface-in-SWINGLIBDIR.patch    | 23 -----------
 .../recipes-support/talloc/talloc/sepbuild.patch   | 27 -------------
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     | 45 ----------------------
 meta-oe/recipes-support/talloc/talloc_2.1.1.bb     | 45 ++++++++++++++++++++++
 4 files changed, 45 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/sepbuild.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb
 create mode 100644 meta-oe/recipes-support/talloc/talloc_2.1.1.bb

diff --git a/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch b/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
deleted file mode 100644
index 635c60e..0000000
--- a/meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Using the way swig interface is installed leads to a bad path in ${D}.
-The interface ended up in ${D}/${STAGING_DIR_NATIVE} which is wrong. The
-fix is to define a variable in recipe which is used in install rule by
-talloc.
-
-Upstream-Status: Inappropriate [build system specific]
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: talloc-2.0.1/talloc.mk
-===================================================================
---- talloc-2.0.1.orig/talloc.mk	2009-10-11 16:42:24.000000000 +0300
-+++ talloc-2.0.1/talloc.mk	2012-09-13 23:15:05.283539702 +0300
-@@ -23,8 +23,8 @@
- 	${INSTALLCMD} -m 644 talloc.pc $(DESTDIR)$(libdir)/pkgconfig
- 	if [ -f talloc.3 ];then ${INSTALLCMD} -d $(DESTDIR)$(mandir)/man3; fi
- 	if [ -f talloc.3 ];then ${INSTALLCMD} -m 644 talloc.3 $(DESTDIR)$(mandir)/man3; fi
--	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)`swig -swiglib` || true
--	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 talloc.i $(DESTDIR)`swig -swiglib` || true
-+	which swig >/dev/null 2>&1 && ${INSTALLCMD} -d $(DESTDIR)/$(SWIGLIBDIR) || true
-+	which swig >/dev/null 2>&1 && ${INSTALLCMD} -m 644 $(srcdir)/$(tallocdir)/talloc.i $(DESTDIR)/$(SWIGLIBDIR) || true
- 
- doc:: talloc.3 talloc.3.html
- 
diff --git a/meta-oe/recipes-support/talloc/talloc/sepbuild.patch b/meta-oe/recipes-support/talloc/talloc/sepbuild.patch
deleted file mode 100644
index 05506c3..0000000
--- a/meta-oe/recipes-support/talloc/talloc/sepbuild.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: talloc-2.0.1/Makefile.in
-===================================================================
---- talloc-2.0.1.orig/Makefile.in
-+++ talloc-2.0.1/Makefile.in
-@@ -33,8 +33,8 @@ EXPORTSFILE = @EXPORTSFILE@
- 
- all:: showflags $(EXTRA_TARGETS)
- 
--include $(tallocdir)/rules.mk
--include $(tallocdir)/talloc.mk
-+include $(srcdir)/$(tallocdir)/rules.mk
-+include $(srcdir)/$(tallocdir)/talloc.mk
- 
- @TALLOC_COMPAT1_MK@
- 
-Index: talloc-2.0.1/libtalloc.m4
-===================================================================
---- talloc-2.0.1.orig/libtalloc.m4
-+++ talloc-2.0.1/libtalloc.m4
-@@ -33,6 +33,6 @@ if test $ac_cv_sizeof_size_t -lt $ac_cv_
- fi
- 
- if test x"$VERSIONSCRIPT" != "x"; then
--    EXPORTSFILE=talloc.exports
-+    EXPORTSFILE=$srcdir/$tallocdir/talloc.exports
-     AC_SUBST(EXPORTSFILE)
- fi
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
deleted file mode 100644
index 7bbfbc2..0000000
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
-HOMEPAGE = "http://talloc.samba.org"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
-           file://install-swig-interface-in-SWINGLIBDIR.patch \
-           file://sepbuild.patch \
-"
-SRC_URI[md5sum] = "c6e736540145ca58cb3dcb42f91cf57b"
-SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd27c9b4"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-PR = "r2"
-
-EXTRA_AUTORECONF = "--exclude=autopoint --exclude=aclocal"
-
-DEPENDS += "swig-native"
-
-do_install_prepend() {
-    # Hack the way swig interface for talloc is installed
-    # This hack is accompanied by install-swig-interface-in-SWINGLIBDIR.patch
-    if which swig > /dev/null; then
-        SWIGLIBDIR="$(echo $(readlink -f $(swig -swiglib)) | \
-            sed -e 's#^${STAGING_DIR_NATIVE}##')"
-    fi
-    if [ -n "$SWIGLIBDIR" ]; then
-        export SWIGLIBDIR
-    else
-        echo "No swig found"
-    fi
-}
-
-do_install_append() {
-    install -d ${D}${libdir}
-    ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
-    ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
-    ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
-}
-
-PACKAGES += "${PN}-swig"
-FILES_${PN}-swig += "${datadir}"
diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
new file mode 100644
index 0000000..89c390f
--- /dev/null
+++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
+HOMEPAGE = "http://talloc.samba.org"
+SECTION = "libs"
+LICENSE = "LGPL-3.0+ & GPL-3.0+"
+
+SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+
+SRC_URI[md5sum] = "5dffb86414218a91864ed4453ba9be07"
+SRC_URI[sha256sum] = "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
+
+inherit waf-samba
+
+EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --disable-silent-rules \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                "
+
+PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg pytalloc-dev"
+
+#ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_${PN}-dev = ""
+FILES_${PN}-dbg = ""
+
+FILES_libtalloc = "${libdir}/libtalloc.so.2 \
+                   ${libdir}/libtalloc.so.2.1.1"
+FILES_libtalloc-dbg = "/usr/src/debug/ \
+                   ${libdir}/.debug/libtalloc.so.2.1.1"
+FILES_libtalloc-dev = "${includedir}/ \
+                   ${libdir}/libtalloc.so \
+                   ${libdir}/pkgconfig/"
+
+FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+                  ${libdir}/libpytalloc-util.so.2 \
+                  ${libdir}/libpytalloc-util.so.2.1.1 \
+                 "
+FILES_pytalloc-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
+                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
+FILES_pytalloc-dev = "${libdir}/libpytalloc-util.so"
+RDEPENDS_pytalloc = "python"
-- 
1.9.1


