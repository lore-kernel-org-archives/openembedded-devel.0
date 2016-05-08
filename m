Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0E1F731C7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 19:08:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u48J8Sp2012483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 May 2016 12:08:28 -0700 (PDT)
Received: from co-op.corp.ad.wrs.com (128.224.56.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 8 May 2016 12:08:28 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 May 2016 15:08:12 -0400
Message-ID: <1462734493-3819-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
References: <1462734493-3819-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] autotools-bootstrap: make bootstrap package specific.
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
X-List-Received-Date: Sun, 08 May 2016 19:08:30 -0000
Content-Type: text/plain

The theory behind this bbclass was reasonable, with the primary
goal being to avoid multiple downloads of gnulib, but it neglected
the fact that packages would be shipping a specific version of the
./bootstrap which will support some flags but maybe not all the
latest ones from the latest gnulib/build-aux/bootstrap file.

I attempted to simply update the two pkgs to use the latest copy
of bootstrap from gnulib but this of course triggers the descent
into autoconf hell that we all know and love.  Rather than futzing
with the packages configure.ac and deviating from what the pkg
maintainers intended and tested, we can just let the packages have
independent calls to ./bootstrap with whatever flags are needed.

The goal of this commit is to move the prepend out to the packages
and then delete the class without any real functional change ; i.e.
a purely mechanical change.  Then we can adjust each package to
ensure it will still build with a modern host, in an independent
fashion, while keeping the main advantage of not fetching gnulib
two extra times for netcf and fontforge.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 22 +++++++++++++++++++-
 meta-oe/classes/autotools-bootstrap.bbclass        | 24 ----------------------
 .../fontforge/fontforge_20150824.bb                | 18 +++++++++++++++-
 3 files changed, 38 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/classes/autotools-bootstrap.bbclass

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 1bc6baef0d34..f67f4ec6082e 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -16,13 +16,33 @@ DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools-bootstrap pkgconfig systemd
+inherit gettext autotools pkgconfig systemd
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
+do_configure_prepend() {
+    currdir=`pwd`
+    cd ${S}
+
+    # avoid bootstrap cloning gnulib on every configure
+    cat >.gitmodules <<EOF
+[submodule "gnulib"]
+       path = gnulib
+       url = git://git.sv.gnu.org/gnulib
+EOF
+    cp -rf ${STAGING_DATADIR}/gnulib ${S}
+
+    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
+    # | bootstrap: running: libtoolize --quiet
+    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
+    # | ...
+    ./bootstrap --force
+    cd $currdir
+}
+
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
diff --git a/meta-oe/classes/autotools-bootstrap.bbclass b/meta-oe/classes/autotools-bootstrap.bbclass
deleted file mode 100644
index 8d7af1b47222..000000000000
--- a/meta-oe/classes/autotools-bootstrap.bbclass
+++ /dev/null
@@ -1,24 +0,0 @@
-# Class to inherit when you want to build with autotools after running bootstrap
-inherit autotools
-
-DEPENDS += "gnulib"
-
-do_configure_prepend() {
-    currdir=`pwd`
-    cd ${S}
-
-    # avoid bootstrap cloning gnulib on every configure
-    cat >.gitmodules <<EOF
-[submodule "gnulib"]
-	path = gnulib
-	url = git://git.sv.gnu.org/gnulib
-EOF
-    cp -rf ${STAGING_DATADIR}/gnulib ${S}
-
-    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
-    # | bootstrap: running: libtoolize --quiet
-    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
-    # | ...
-    ./bootstrap --force
-    cd $currdir
-}
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index b50202d0a660..53899f13cdc2 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash"
 DEPENDS_append_class-target = " libxi"
 
-inherit autotools-bootstrap pkgconfig pythonnative distro_features_check
+inherit autotools pkgconfig pythonnative distro_features_check
 
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
@@ -24,8 +24,24 @@ do_configure_prepend() {
     # uthash sources are expected in uthash/src
     currdir=`pwd`
     cd ${S}
+
     mkdir -p uthash/src
     cp ${STAGING_INCDIR}/ut*.h uthash/src
+
+    # avoid bootstrap cloning gnulib on every configure
+    cat >.gitmodules <<EOF
+[submodule "gnulib"]
+       path = gnulib
+       url = git://git.sv.gnu.org/gnulib
+EOF
+    cp -rf ${STAGING_DATADIR}/gnulib ${S}
+
+    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
+    # | bootstrap: running: libtoolize --quiet
+    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
+    # | ...
+    ./bootstrap --force
+
     cd $currdir
 }
 
-- 
2.7.4


