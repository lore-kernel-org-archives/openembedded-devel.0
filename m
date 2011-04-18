Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBloo-0007Fg-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:35 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=KfiSVEsZRrkFFp/jfUEG627KNfKUMFLJu4YLyFByfTU=;
	b=atNWsNRNm6ES9bxTqiNek9rPLfa1qXjKa4xfMUtRm3M42/YmDeUAmZAgXwYHkdrOHR
	d/MQvSEYaiF1M9rKLpLpI07dC9dS+KGkiePzVFaqtZtsA8ABTuhC8schAk8gQBMeeaEk
	JfRJmfpp7zugP8LX+31BA16TDGdryO6UyuZB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=p3e93b+KtGyXrGhdLpX6tyF5rnnRMz5C+HvzYL7ySBTcK0I0uTtFLjQyQ3WBRqmPyn
	JJHWoNDnKFzCBpefN6CVi+5IDl3JYojDSLOSgqSx/fgzcEk+Gi7NVSs5oSiIs2oonMeS
	5pT2vgInwmpDP6ZPITqEi4zEuRzagDyy4w5M4=
Received: by 10.223.159.134 with SMTP id j6mr4745622fax.74.1303122856088;
	Mon, 18 Apr 2011 03:34:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j18sm1624007faa.18.2011.04.18.03.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:34:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:34:14 +0200
Message-Id: <fc04fe74edfe5a681ed1ee5e0458e085573f9177.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/13] libdrm: upgrade to 2.4.25
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
X-List-Received-Date: Mon, 18 Apr 2011 10:36:35 -0000

* difference to oe-core version is different packaging and glamo/uclibc patches

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../drm/libdrm-2.4.24/installtests.patch           |   43 -----------------
 .../{libdrm-2.4.24 => libdrm-2.4.25}/glamo.patch   |    0
 .../drm/libdrm-2.4.25/installtests.patch           |   49 ++++++++++++++++++++
 .../drm/{libdrm_2.4.24.bb => libdrm_2.4.25.bb}     |    6 +--
 4 files changed, 51 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
 rename meta-oe/recipes-graphics/drm/{libdrm-2.4.24 => libdrm-2.4.25}/glamo.patch (100%)
 create mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
 rename meta-oe/recipes-graphics/drm/{libdrm_2.4.24.bb => libdrm_2.4.25.bb} (91%)

diff --git a/meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch b/meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
deleted file mode 100644
index 9d6a168..0000000
--- a/meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Index: libdrm-2.4.7/tests/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/Makefile.am	2009-04-09 20:16:35.000000000 +0100
-+++ libdrm-2.4.7/tests/Makefile.am	2009-04-17 12:35:14.000000000 +0100
-@@ -6,10 +6,11 @@
-
- LDADD = $(top_builddir)/libdrm.la
-
--check_PROGRAMS = \
-+bin_PROGRAMS = \
- 	dristat \
- 	drmstat
-
-+check_PROGRAMS =
- SUBDIRS =
-
- if HAVE_LIBKMS
-Index: libdrm-2.4.7/tests/modeprint/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/modeprint/Makefile.am	2009-02-17 19:52:37.000000000 +0000
-+++ libdrm-2.4.7/tests/modeprint/Makefile.am	2009-04-17 12:35:32.000000000 +0100
-@@ -3,7 +3,7 @@
- 	-I$(top_srcdir)/libdrm/intel/ \
- 	-I$(top_srcdir)/libdrm
-
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modeprint
-
- modeprint_SOURCES = \
-Index: libdrm-2.4.7/tests/modetest/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/modetest/Makefile.am	2009-02-17 19:52:37.000000000 +0000
-+++ libdrm-2.4.7/tests/modetest/Makefile.am	2009-04-17 12:35:42.000000000 +0100
-@@ -4,7 +4,7 @@
- 	-I$(top_srcdir)/libdrm \
- 	$(CAIRO_CFLAGS)
-
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modetest
-
- modetest_SOURCES = \
diff --git a/meta-oe/recipes-graphics/drm/libdrm-2.4.24/glamo.patch b/meta-oe/recipes-graphics/drm/libdrm-2.4.25/glamo.patch
similarity index 100%
rename from meta-oe/recipes-graphics/drm/libdrm-2.4.24/glamo.patch
rename to meta-oe/recipes-graphics/drm/libdrm-2.4.25/glamo.patch
diff --git a/meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch b/meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
new file mode 100644
index 0000000..2704ee6
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
@@ -0,0 +1,49 @@
+tests: also install tests app
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index bf1987f..d909e19 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -6,10 +6,11 @@ AM_CPPFLAGS = \
+ 
+ LDADD = $(top_builddir)/libdrm.la
+ 
+-check_PROGRAMS = \
++bin_PROGRAMS = \
+ 	dristat \
+ 	drmstat
+ 
++check_PROGRAMS =
+ SUBDIRS = modeprint
+ 
+ if HAVE_LIBKMS
+diff --git a/tests/modeprint/Makefile.am b/tests/modeprint/Makefile.am
+index c4862ac..7db76ea 100644
+--- a/tests/modeprint/Makefile.am
++++ b/tests/modeprint/Makefile.am
+@@ -2,7 +2,7 @@ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include/drm \
+ 	-I$(top_srcdir)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modeprint
+ 
+ modeprint_SOURCES = \
+diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
+index 2191242..1d2c1b0 100644
+--- a/tests/modetest/Makefile.am
++++ b/tests/modetest/Makefile.am
+@@ -4,7 +4,7 @@ AM_CFLAGS = \
+ 	-I$(top_srcdir) \
+ 	$(CAIRO_CFLAGS)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modetest
+ 
+ modetest_SOURCES = \
diff --git a/meta-oe/recipes-graphics/drm/libdrm_2.4.24.bb b/meta-oe/recipes-graphics/drm/libdrm_2.4.25.bb
similarity index 91%
rename from meta-oe/recipes-graphics/drm/libdrm_2.4.24.bb
rename to meta-oe/recipes-graphics/drm/libdrm_2.4.25.bb
index 0a2365e..4ffdcac 100644
--- a/meta-oe/recipes-graphics/drm/libdrm_2.4.24.bb
+++ b/meta-oe/recipes-graphics/drm/libdrm_2.4.25.bb
@@ -24,13 +24,11 @@ LEAD_SONAME = "libdrm.so"
 EXTRA_OECONF_append = " ${@base_contains('MACHINE_FEATURES', 'x86', '', '--disable-intel --disable-radeon',d)}"
 EXTRA_OECONF_append_shr = " --enable-glamo-experimental-api"
 
-PR = "r8"
-
 SRC_URI += "file://installtests.patch"
 SRC_URI += "file://glamo.patch"
 
-SRC_URI[md5sum] = "8d802bf3b368f9fac0d7d17516a9436f"
-SRC_URI[sha256sum] = "c7012381f64458af9f291d913309448aac7dd23a28dc86c6970e4bf38effb6a5"
+SRC_URI[md5sum] = "f53dc4c72109b17908e4113c3b8addfe"
+SRC_URI[sha256sum] = "51f99a815a18876977991bbc6f190607791d25a6e47a3269880ce7679dbd0e9f"
 
 do_compile_prepend_libc-uclibc() {
 	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
-- 
1.7.5.rc1



