Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 256DA78334
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y65so1329609pfd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QuYxCzv2GciWnkbmFpLX7V5MneGFxyM5vHlkjl3hpes=;
	b=dSi73hwaAgdcHkVuxEJB1L6ubaFsNuLdTgXHb5l6cbJ/hF7UsxiAPmwInpgz8F9ELS
	tmYQIiHz+TlAFgNhR/2SV/kKiZ8CfP0XPp+9PFloa6ZUCgm8gTchYwH/fXRCf+7KJ1bc
	TKyFSSW3qwznxwa1urbmd9eKfUpL2yq2+kmF/Uc3ttFBnJGqG6z4hgu4r5WBTzvh0lDq
	pDoBeumlUquGTHTEn5TybqadJLfFoskw1+O1VRCiVOSSKuKs9QLp4gGDXVkYVaVNxb42
	DtEVFWgTrmrB+c2BVvBiyf7laE9OL/iAzZLTkNzX3fXgCmAwvSMgxdlAYBhOyVgq1l9a
	6bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QuYxCzv2GciWnkbmFpLX7V5MneGFxyM5vHlkjl3hpes=;
	b=IkCBJ1L0nxp8xKonXO7FVp2aT/6HLfLonyTqNxAYG0tO4e1mCgZzXnYHgH5XZVhhK3
	Gpa2+/xv0ykfRfl0YLkahtxnJ33ZiTnxVuomEIkk3h8wA9mezazAdUe20anOI1hn7LC0
	rQKMrEmkuhwxGxq/+5O3ExNDqkQqrtlV6dG7bu1JpVWcrk645MdB9boafMX3SZu8QmWx
	KHxmQDP53dm1oCGs14XMdy38e0bPdNCUBmO5WvZjPkZcSQ6242P241R6Fpdcj2HmVl6k
	ZJFwgeNtGLqa5iAlZJVLTbaURp2ue52b80Qzow70kk7XKV/xbSt1c0d3Krk2e/Ad5nKg
	PS+g==
X-Gm-Message-State: AHYfb5gjSGTrTaugIg6h3Zy72QFk1gukA2CMgn5sbhXWAHif2qB7F/NO
	ShMsm6VOxTMHU0j3
X-Received: by 10.98.194.155 with SMTP id w27mr2460530pfk.246.1503772535460;
	Sat, 26 Aug 2017 11:35:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:20 -0700
Message-Id: <20170826183521.34294-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] openipmi: Upgrade to 2.0.24
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:34 -0000

Remove patches which are irrelevant now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openipmi/files/makefile-add-ldflags.patch      | 19 -----
 .../openipmi/files/openipmi-don-t-rm-.libs.patch   | 32 ---------
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch | 81 ++++++----------------
 .../{openipmi_2.0.22.bb => openipmi_2.0.24.bb}     |  9 +--
 4 files changed, 26 insertions(+), 115 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
 rename meta-oe/recipes-support/openipmi/{openipmi_2.0.22.bb => openipmi_2.0.24.bb} (93%)

diff --git a/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch b/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
deleted file mode 100644
index 271c5323f..000000000
--- a/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add LDFLAGS variable to Makefile.am, make sure the extra linker flags can be passed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-diff --git a/swig/perl/Makefile.am b/swig/perl/Makefile.am
-index 2f9ee4c..3a18892 100644
---- a/swig/perl/Makefile.am
-+++ b/swig/perl/Makefile.am
-@@ -20,7 +20,7 @@ OpenIPMI_SRC = OpenIPMI_perl.c
- OpenIPMI_OBJ = OpenIPMI_wrap.lo OpenIPMI_perl.lo
- 
- OpenIPMI.so: $(OpenIPMI_OBJ)
--	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
-+	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version $(LDFLAGS) -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
- 	rm -f OpenIPMI.so
- 	mv .libs/OpenIPMI.so .
- 
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch b/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
deleted file mode 100644
index ee3c66043..000000000
--- a/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bbd51cf010c80322034f7094e2c6a656aa1f17a7 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Fri, 13 Feb 2015 06:55:33 +0000
-Subject: [PATCH] openipmi: don't rm .libs
-
-Don't remove .libs after OpenIPMI.so generated, this may cause
-dummystuff.so fails to link from the second build with error:
-
-* error: .libs/dummystuff.o: No such file or directory
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- swig/perl/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/swig/perl/Makefile.am b/swig/perl/Makefile.am
-index 12a282c..2f9ee4c 100644
---- a/swig/perl/Makefile.am
-+++ b/swig/perl/Makefile.am
-@@ -23,7 +23,6 @@ OpenIPMI.so: $(OpenIPMI_OBJ)
- 	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
- 	rm -f OpenIPMI.so
- 	mv .libs/OpenIPMI.so .
--	rm -rf .libs
- 
- dummystuff.lo: dummystuff.c
- 	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
index 6f16234bc..83485a9e6 100644
--- a/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
+++ b/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
@@ -13,73 +13,38 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  unix/Makefile.am    |    4 ++--
  4 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 00c3d2b..0fa85d7 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -16,7 +16,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
+Index: OpenIPMI-2.0.24/cmdlang/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.24.orig/cmdlang/Makefile.am
++++ OpenIPMI-2.0.24/cmdlang/Makefile.am
+@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.
+ libOpenIPMIcmdlang_la_LIBADD = -lm \
  	$(top_builddir)/utils/libOpenIPMIutils.la \
  	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIcmdlang.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIcmdlang.map
+-libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  bin_PROGRAMS = openipmish
  
-diff --git a/glib/Makefile.am b/glib/Makefile.am
-index 671cae2..eff55f3 100644
---- a/glib/Makefile.am
-+++ b/glib/Makefile.am
-@@ -11,14 +11,14 @@ libOpenIPMIglib_la_SOURCES = glib_os_hnd.c
- libOpenIPMIglib_la_CFLAGS = $(GLIB_CFLAGS) $(AM_CFLAGS)
- libOpenIPMIglib_la_LIBADD = $(GDBM_LIB)
- libOpenIPMIglib_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIglib.map $(GLIB_LIBS) -L$(libdir) \
-+	-Wl,-Map -Wl,libOpenIPMIglib.map $(GLIB_LIBS) \
- 	-rpath $(libdir)
- 
- libOpenIPMIglib12_la_SOURCES = glib_os_hnd.c
- libOpenIPMIglib12_la_CFLAGS = $(GLIB12_CFLAGS) $(AM_CFLAGS)
- libOpenIPMIglib12_la_LIBADD = $(GDBM_LIB)
- libOpenIPMIglib12_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIglib12.map $(GLIB12_LIBS) -L$(libdir) \
-+	-Wl,-Map -Wl,libOpenIPMIglib12.map $(GLIB12_LIBS) \
- 	-rpath $(libdir)
- 
- CLEANFILES = libOpenIPMIglib.map libOpenIPMIglib12.map
-diff --git a/tcl/Makefile.am b/tcl/Makefile.am
-index b702819..282619c 100644
---- a/tcl/Makefile.am
-+++ b/tcl/Makefile.am
-@@ -11,7 +11,7 @@ libOpenIPMItcl_la_SOURCES = tcl_os_hnd.c
- libOpenIPMItcl_la_CFLAGS = $(TCL_CFLAGS) $(AM_CFLAGS)
- libOpenIPMItcl_la_LIBADD = $(GDBM_LIB)
- libOpenIPMItcl_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) -L$(libdir) \
-+	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) \
- 	-rpath $(libdir)
- 
- noinst_PROGRAMS = test_handlers
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index a792147..a108bc6 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+Index: OpenIPMI-2.0.24/unix/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.24.orig/unix/Makefile.am
++++ OpenIPMI-2.0.24/unix/Makefile.am
+@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la li
+ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
  libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIpthread.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIpthread.map
+ 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
+-libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
  libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIposix.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIposix.map
+ 	$(GDBM_LIB) $(RT_LIB)
+-libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  noinst_HEADERS = heap.h
  
--- 
-1.7.1
-
diff --git a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb b/meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
similarity index 93%
rename from meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
rename to meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
index 9f4b0ff26..40395a35c 100644
--- a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
+++ b/meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
@@ -26,19 +26,16 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://fix-symlink-install-error-in-cmdlang.patch \
            file://openipmi-no-openipmigui-man.patch \
            file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
-           file://openipmi-don-t-rm-.libs.patch \
            file://ipmi-init-fix-the-arguments.patch \
-           file://makefile-add-ldflags.patch \
            file://do-not-install-pyc-and-pyo.patch \
            file://include_sys_types.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "
 
-SRC_URI[md5sum] = "9a4e1f6bb073379c494839201ea10aee"
-SRC_URI[sha256sum] = "4988900043c35fcfa9b2bf275d6593904f6429221befb770ba6ecb5502108e55"
-
 S = "${WORKDIR}/OpenIPMI-${PV}"
+SRC_URI[md5sum] = "58f9542cbfcb5fe250b77cf88345e1ec"
+SRC_URI[sha256sum] = "bca39a27071278a8b74610181ede8df51e155e5e9031bc8eaa3699d1720292b4"
 
 inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd
 
@@ -46,7 +43,7 @@ EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
                 --with-python='${STAGING_BINDIR_NATIVE}/python-native/python' \
                 --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
-                --with-glibver=2.0 --with-glib12=no"
+                --with-glibver=2.0"
 
 PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
-- 
2.14.1


