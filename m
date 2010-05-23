Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGGn3-00007T-7r
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 21:24:50 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NJK53a006943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 21:20:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGGiT-0002Tc-Ci; Sun, 23 May 2010 21:20:05 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 21:20:01 +0200
Message-Id: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/3] freetype: updated to 2.3.12
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
X-List-Received-Date: Sun, 23 May 2010 19:24:50 -0000

That's (nearly) a copy of the old 2.3.11 recipe.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../freetype/freetype-2.3.12/fix-configure.patch   |   13 ++++++
 recipes/freetype/freetype-2.3.12/libtool-tag.patch |   20 ++++++++++
 recipes/freetype/freetype_2.3.12.bb                |   40 ++++++++++++++++++++
 3 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 recipes/freetype/freetype-2.3.12/fix-configure.patch
 create mode 100644 recipes/freetype/freetype-2.3.12/libtool-tag.patch
 create mode 100644 recipes/freetype/freetype_2.3.12.bb

diff --git a/recipes/freetype/freetype-2.3.12/fix-configure.patch b/recipes/freetype/freetype-2.3.12/fix-configure.patch
new file mode 100644
index 0000000..ecd9673
--- /dev/null
+++ b/recipes/freetype/freetype-2.3.12/fix-configure.patch
@@ -0,0 +1,13 @@
+Index: freetype-2.3.6/builds/unix/configure.ac
+===================================================================
+--- freetype-2.3.6.orig/builds/unix/configure.ac
++++ freetype-2.3.6/builds/unix/configure.ac
+@@ -506,8 +506,6 @@ AC_SUBST([FT2_EXTRA_LIBS])
+ AC_SUBST([SYSTEM_ZLIB])
+ 
+ 
+-LT_INIT(win32-dll)
+-
+ AC_SUBST([hardcode_libdir_flag_spec])
+ AC_SUBST([wl])
+ AC_SUBST([build_libtool_libs])
diff --git a/recipes/freetype/freetype-2.3.12/libtool-tag.patch b/recipes/freetype/freetype-2.3.12/libtool-tag.patch
new file mode 100644
index 0000000..2f096cd
--- /dev/null
+++ b/recipes/freetype/freetype-2.3.12/libtool-tag.patch
@@ -0,0 +1,20 @@
+--- freetype-2.3.6/builds/unix/unix-cc.in	
++++ freetype-2.3.6/builds/unix/unix-cc.in	
+@@ -88,7 +88,7 @@ 
+ #
+ #
+ CCraw := $(CC)
+-CC    := $(LIBTOOL) --mode=compile $(CCraw)
++CC    := $(LIBTOOL) --tag=CC --mode=compile $(CCraw)
+ 
+ # Linker flags.
+ #
+@@ -105,7 +105,7 @@ 
+ 
+ # Library linking
+ #
+-LINK_LIBRARY = $(LIBTOOL) --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
++LINK_LIBRARY = $(LIBTOOL) --tag=CC --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
+                           -rpath $(libdir) -version-info $(version_info) \
+                           $(LDFLAGS) -no-undefined \
+                           # -export-symbols $(EXPORTS_LIST)
diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
new file mode 100644
index 0000000..de9ff29
--- /dev/null
+++ b/recipes/freetype/freetype_2.3.12.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Freetype font rendering library"
+SECTION = "libs"
+LICENSE = "freetype"
+PR = "r0"
+
+SRC_URI = "\
+  ${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
+  file://no-hardcode.patch;patch=1 \
+  file://fix-configure.patch;patch=1 \
+  file://libtool-tag.patch;patch=1 \
+"
+S = "${WORKDIR}/freetype-${PV}"
+
+SRC_URI[md5sum] = "e974a82e5939be8e05ee65f07275d7c5"
+SRC_URI[sha256sum] = "3b96438f016a62b676c1d2089c00ca777f710d19f6aefa66ccf068d360db3e92"
+
+inherit autotools pkgconfig binconfig
+
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+EXTRA_OECONF = "--without-zlib"
+
+do_configure() {
+	cd builds/unix
+	libtoolize --force --copy
+	gnu-configize --force
+	aclocal -I .
+	autoconf
+	cd ${S}
+	oe_runconf
+}
+
+do_compile_prepend() {
+	${BUILD_CC} -o objs/apinames src/tools/apinames.c
+}
+
+BBCLASSEXTEND = "native"
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${bindir}"
-- 
1.7.0.1



