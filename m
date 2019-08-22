Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id A35AC7F276
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:42:14 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 7ABBB102CFA;
	Thu, 22 Aug 2019 16:42:15 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 18:42:07 +0200
Message-Id: <20190822164207.17029-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libmxml: Use autotools bbclass and cleanup the recipe a bit.
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
X-List-Received-Date: Thu, 22 Aug 2019 16:42:15 -0000
Content-Transfer-Encoding: 8bit

The package does use autotools based build systemd but it comes with a
bit of a twist. It explicitly disallows running autoheader on the source
tree. This can apparently be easilt accomplished with exclude parameter
passed via EXTRA_AUTORECONF.

This patch also adds PACKAGECONFIG option allowing the user to toggle
threading support in the library. Not sure how useful it is, but upstream
does offer such option, it works, and its not a lot of work to expose it
via PACKAGECONFIG.

Another improvement is related to package optimization handling.
mxml has a nasty habit of disregarding optimization flags passed by the
user. It always appends -Os -g to CFLAGS in its configure script. Its
a bit suprising to find out DEBUG_BUILD=1 in local.conf has no impact on
libraries produced by mxml recipe. This can be fixed with a simple sed
script.

Sed is also used to enable verbose compilation output. Having full
compiler invocations visible in the logs is generally useful, but
more importantly it allows some of the QA checks to their work.

While doing this cleanup I've also renamed the recipe from libxml_git.bb
to libxml_3.0.bb. The git keyword suggests this recipe is for some
random git snapshot, while in reality its for latest stable upstream
release of the package.

Last but not least this patch removes the bin package. Current versions of
mxml no longer provide any tools. The package was empty.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-support/libmxml/libmxml_3.0.bb    | 33 ++++++++++++++
 .../recipes-support/libmxml/libmxml_git.bb    | 44 -------------------
 2 files changed, 33 insertions(+), 44 deletions(-)
 create mode 100644 meta-oe/recipes-support/libmxml/libmxml_3.0.bb
 delete mode 100644 meta-oe/recipes-support/libmxml/libmxml_git.bb

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.0.bb b/meta-oe/recipes-support/libmxml/libmxml_3.0.bb
new file mode 100644
index 000000000..5ca2dda32
--- /dev/null
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Tiny XML Library"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+HOMEPAGE = "https://www.msweet.org/mxml/"
+BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
+
+SRC_URI = "git://github.com/michaelrsweet/mxml.git"
+SRCREV = "c7755b6992a2afdd34dde47fc9be97f1237cfded"
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+PACKAGECONFIG ??= "threads"
+PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
+
+# Package does not support out of tree builds.
+B = "${S}"
+
+# MXML uses autotools but it explicitly states it does not support autoheader.
+EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
+
+do_configure_prepend() {
+    # Respect optimization CFLAGS specified by OE.
+    sed -e 's/-Os -g//' -i ${S}/configure.ac
+
+    # Enable verbose compilation output. This is required for extra QA checks to work.
+    sed -e '/.SILENT:/d' -i ${S}/Makefile.in
+}
+
+do_install() {
+    # Package uses DSTROOT instread of standard DESTDIR to specify install location.
+    oe_runmake install DSTROOT=${D}
+}
diff --git a/meta-oe/recipes-support/libmxml/libmxml_git.bb b/meta-oe/recipes-support/libmxml/libmxml_git.bb
deleted file mode 100644
index b17fc67e0..000000000
--- a/meta-oe/recipes-support/libmxml/libmxml_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Tiny XML Library"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-HOMEPAGE = "https://www.msweet.org/mxml/"
-BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
-
-SRC_URI = "git://github.com/michaelrsweet/mxml.git"
-SRCREV = "c7755b6992a2afdd34dde47fc9be97f1237cfded"
-S = "${WORKDIR}/git"
-# v3.0
-PV = "3.0"
-
-CONFIGUREOPTS = " --prefix=${prefix} \
-                  --bindir=${bindir} \
-                  --sbindir=${sbindir} \
-                  --libexecdir=${libexecdir} \
-                  --datadir=${datadir} \
-                  --sysconfdir=${sysconfdir} \
-                  --sharedstatedir=${sharedstatedir} \
-                  --localstatedir=${localstatedir} \
-                  --libdir=${libdir} \
-                  --includedir=${includedir} \
-                  --oldincludedir=${oldincludedir} \
-                  --infodir=${infodir} \
-                  --mandir=${mandir} \
-                  --host=${TARGET_SYS} \
-                  --build=${BUILD_SYS} \
-                  ${PACKAGECONFIG_CONFARGS} \
-                "
-
-do_configure() {
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    ./configure ${CONFIGUREOPTS} --enable-shared
-}
-
-do_install () {
-    export DSTROOT=${D}
-    oe_runmake install
-}
-
-PACKAGES += " ${PN}-bin "
-FILES_${PN} = "${libdir}/*"
-FILES_${PN}-bin = "${bindir}/*"
-- 
2.21.0


