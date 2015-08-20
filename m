Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BEC80766DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:59:40 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so40059628wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=33ykVxktLtDmoMBtp26lLio3i2uqlCyCB/romd+RFBU=;
	b=aICvBKM/QTXv0r3V7QgMoKMDimY4csBn+W1SXSG0m7LJaDRKRcp911qTqWlLFIJ9x6
	fPNmGpxQkRx56k20uLezjClbfoB1GZzUotyn2nW0Z9wRrexoaTLKhkfKtXnApn37c9rh
	6RmZESBnQRWzeS8RcGaqikgJ+sZ7mdAe0oYj2OSx1hqVP0dtpQtFZuucM+4lkeY52DFC
	pH2EMYuKAOLHgFSZtdQ2wsGdYCt5K+cRqtS5ZmD5hkFrto37V5PVqzQOqr0swLAwKwUY
	/QqV+8OdzFJCp/12e5Z0JUxe7FMSAt21ab4m/jCCwYFmOPFIdUxCEjQqqHYyCecAFNH5
	JeKg==
X-Gm-Message-State: ALoCoQnwiUsbMqp15/mURQb7qvfhv3dLOJVCPy70YZd9A15VnkEANRx+22P/VZlEG5hG2MHJ+ZGu
X-Received: by 10.180.87.71 with SMTP id v7mr65559416wiz.74.1440086380248;
	Thu, 20 Aug 2015 08:59:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	l13sm6151270wjr.18.2015.08.20.08.59.39
	(version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:59:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:59:27 +0200
Message-Id: <1440086369-3321-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 3/5] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 20 Aug 2015 15:59:42 -0000

From: Bian Naimeng <biannm@cn.fujitsu.com>

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../install-swig-interface-in-SWINGLIBDIR.patch    | 23 -----------
 .../recipes-support/talloc/talloc/sepbuild.patch   | 27 -------------
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     | 45 ----------------------
 meta-oe/recipes-support/talloc/talloc_2.1.3.bb     | 43 +++++++++++++++++++++
 4 files changed, 43 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/sepbuild.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb
 create mode 100644 meta-oe/recipes-support/talloc/talloc_2.1.3.bb

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
diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.3.bb b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
new file mode 100644
index 0000000..55285c5
--- /dev/null
+++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
+HOMEPAGE = "http://talloc.samba.org"
+SECTION = "libs"
+
+LICENSE = "LGPL-3.0+ & GPL-3.0+"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+
+SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "3e285de2228ae67ff0a0f5cec658f627"
+SRC_URI[sha256sum] = "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
+
+inherit waf-samba
+
+EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --disable-silent-rules \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix} \
+                "
+
+PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg pytalloc-dev"
+
+#ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_${PN}-dev = ""
+FILES_${PN}-dbg = ""
+
+FILES_libtalloc = "${libdir}/libtalloc${SOLIBS}"
+FILES_libtalloc-dbg = "/usr/src/debug/ \
+                       ${libdir}/.debug/libtalloc*"
+FILES_libtalloc-dev = "${includedir}/ \
+                       ${libdir}/libtalloc${SOLIBSDEV} \
+                       ${libdir}/pkgconfig/"
+
+FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+                  ${libdir}/libpytalloc-util${SOLIBS} \
+                 "
+FILES_pytalloc-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
+                      ${libdir}/.debug/libpytalloc*"
+FILES_pytalloc-dev = "${libdir}/libpytalloc-util${SOLIBSDEV}"
+RDEPENDS_pytalloc = "python"
-- 
2.0.1


