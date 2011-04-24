Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvorkin@tibbo.com>) id 1QE0Vx-00033J-Ps
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:42:21 +0200
Received: (qmail 16934 invoked by uid 508); 24 Apr 2011 18:45:39 +0400
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 24 Apr 2011 18:45:39 +0400
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2011 18:40:44 +0400
Message-Id: <1303656044-26480-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] newer tremor
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
X-List-Received-Date: Sun, 24 Apr 2011 14:42:22 -0000

Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
---
 recipes/tremor/tremor-lowmem_17931.bb |   22 ++++++++++++++++++++++
 recipes/tremor/tremor/pkgconfig.patch |   22 ----------------------
 recipes/tremor/tremor_17931.bb        |   19 +++++++++++++++++++
 recipes/tremor/tremor_20041119.bb     |   22 ----------------------
 recipes/tremor/tremor_svn.bb          |   17 -----------------
 5 files changed, 41 insertions(+), 61 deletions(-)
 create mode 100644 recipes/tremor/tremor-lowmem_17931.bb
 delete mode 100644 recipes/tremor/tremor/pkgconfig.patch
 create mode 100644 recipes/tremor/tremor_17931.bb
 delete mode 100644 recipes/tremor/tremor_20041119.bb
 delete mode 100644 recipes/tremor/tremor_svn.bb

diff --git a/recipes/tremor/tremor-lowmem_17931.bb b/recipes/tremor/tremor-lowmem_17931.bb
new file mode 100644
index 0000000..018565a
--- /dev/null
+++ b/recipes/tremor/tremor-lowmem_17931.bb
@@ -0,0 +1,22 @@
+SECTION = "libs"
+PRIORITY = "optional"
+RDEPENDS = "libogg"
+DEPENDS = "libogg"
+DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
+LICENSE = "BSD"
+PROVIDES += "libvorbisidec"
+PR = "r2"
+
+# it have bugs
+DEFAULT_PREFERENCE = "-1"
+
+# tremor makes heavy use of non-thumb-compatible inline asm.
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI = "svn://svn.xiph.org/branches/lowmem-branch;module=Tremor;rev=${PV};proto=http"
+
+S = "${WORKDIR}/Tremor"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF=" --enable-shared --disable-rpath  "
diff --git a/recipes/tremor/tremor/pkgconfig.patch b/recipes/tremor/tremor/pkgconfig.patch
deleted file mode 100644
index f864cb8..0000000
--- a/recipes/tremor/tremor/pkgconfig.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- Tremor/configure.in	2006-09-03 01:19:30.000000000 +0200
-+++ Tremor-fixed/configure.in	2006-09-03 12:13:33.339593728 +0200
-@@ -106,4 +106,4 @@
- AC_SUBST(DEBUG)
- AC_SUBST(PROFILE)
- 
--AC_OUTPUT(Makefile)
-+AC_OUTPUT([Makefile vorbisidec.pc])
---- Tremor/vorbisidec.pc.in	1970-01-01 01:00:00.000000000 +0100
-+++ Tremor-fixed/vorbisidec.pc.in	2006-09-03 12:16:38.313473424 +0200
-@@ -0,0 +1,11 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: vorbisidec
-+Description: Vorbis audio decoder
-+Requires:
-+Version: 20041119
-+Libs: -L${libdir} -lvorbisidec
-+Cflags: -I${includedir}
diff --git a/recipes/tremor/tremor_17931.bb b/recipes/tremor/tremor_17931.bb
new file mode 100644
index 0000000..3269a24
--- /dev/null
+++ b/recipes/tremor/tremor_17931.bb
@@ -0,0 +1,19 @@
+SECTION = "libs"
+PRIORITY = "optional"
+RDEPENDS = "libogg"
+DEPENDS = "libogg"
+DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
+LICENSE = "BSD"
+PROVIDES += "libvorbisidec"
+PR = "r2"
+
+# tremor makes heavy use of non-thumb-compatible inline asm.
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=${PV};proto=http"
+
+S = "${WORKDIR}/Tremor"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF=" --enable-shared --disable-rpath  "
diff --git a/recipes/tremor/tremor_20041119.bb b/recipes/tremor/tremor_20041119.bb
deleted file mode 100644
index 42155ab..0000000
--- a/recipes/tremor/tremor_20041119.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "libogg"
-DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
-LICENSE = "BSD"
-SRCDATE = "${PV}"
-PR = "r2"
-
-# tremor makes heavy use of non-thumb-compatible inline asm.
-ARM_INSTRUCTION_SET = "arm"
-
-PROVIDES += "libvorbisidec"
-
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=4573;proto=http \
-	file://pkgconfig.patch"
-
-S = "${WORKDIR}/Tremor"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF=" --enable-shared --disable-rpath  "
-
diff --git a/recipes/tremor/tremor_svn.bb b/recipes/tremor/tremor_svn.bb
deleted file mode 100644
index 751d5f2..0000000
--- a/recipes/tremor/tremor_svn.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "libogg"
-DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
-PV = "1:0.0+svn${SRCDATE}"
-LICENSE = "BSD"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;proto=http"
-
-S = "${WORKDIR}/Tremor"
-
-inherit autotools
-
-EXTRA_OECONF=" --enable-shared --disable-rpath  "
-
-- 
1.7.3.4



