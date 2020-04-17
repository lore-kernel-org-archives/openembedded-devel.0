Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.6684.1587116871935246371
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 02:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: haseeb_ashraf@mentor.com)
IronPort-SDR: 4pH4/UX/Sygm7Uc7+Vc4RZzw/h3sZtI+lSoTY5pFfZs688md3QUOHq2iggNo8gpKU3hTgJXDJx
 +ynnfLLoyuWHGMRwzvHlTE6hCFFITH/Le1UE+x8dyKPzpzrcb9NkuWH1IYXJkyDaZTziXw5zku
 r5Es26D5V6rJYLp5Y6I2CaEvNF07wQffxc7ZqqKyNKebqDwyBDSbn+3LUYBk+RbwpmqQ9u77wH
 SCgp6r8OGcv+YKCUGrIMQSYGc/OkFF+wuqD2T8ScuC83P5V1c22CCLEowTnS7QRf0ZPJSIcmlA
 j0s=
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="47814119"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 17 Apr 2020 01:47:50 -0800
IronPort-SDR: IiDYlPiyP4fRmab0VXzZrCQq2s3Uwzv5QKH9CImKjm7EsNJWX6anmJLiokpDSLi8B1pbuMumHr
 Dm/3JJRpIMJtaTtpaoY82T5SsvDxcvwQ1ng9NUBY3fspCOPAKu5rlgOqrBA+Y4bXbWu3uG3Fsx
 SzhWAXf38G9fLU14DPT9cFxoVdkrqjtFoEQPoh3papyOzsFH0uhpF0+HR4XwgysyChVzG6L5hZ
 TSY5GXjWtcrLpkH8agA4VEUjbEUU6c5aAGkyFU23ev69hbunyNCMafWp67WlCf5c9Q0Bv+L3rH
 fww=
From: "Haseeb Ashraf" <haseeb_ashraf@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] luaposix: add 33.4.0 version recipe which is compatible with lua5.3
Date: Fri, 17 Apr 2020 14:47:17 +0500
Message-ID: <20200417094717.15898-1-Haseeb_Ashraf@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: Haseeb_Ashraf@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Content-Type: text/plain

Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
---
 ...ace-condition-between-test-and-mkdir.patch | 75 +++++++++++++++++++
 .../luaposix/luaposix_33.4.0.bb               | 21 ++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch b/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
new file mode 100644
index 000000000..d8a9e3d2b
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix/0001-fix-avoid-race-condition-between-test-and-mkdir.patch
@@ -0,0 +1,75 @@
+From 4dfca036c96071bd2a2c80ff84719c6d37858373 Mon Sep 17 00:00:00 2001
+From: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
+Date: Fri, 17 Apr 2020 14:36:50 +0500
+Subject: [PATCH 1/1] fix: avoid race condition between test and mkdir
+
+when building in parallel the race condition, when the directory
+is tested for existence and it is created, can break the build
+
+Signed-off-by: Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
+---
+ Makefile.in            | 6 +++---
+ build-aux/rockspecs.mk | 2 +-
+ local.mk               | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 9b51ef3..4722525 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1637,7 +1637,7 @@ distclean-tags:
+ 
+ distdir: $(DISTFILES)
+ 	$(am__remove_distdir)
+-	test -d "$(distdir)" || mkdir "$(distdir)"
++	$(MKDIR_P) "$(distdir)"
+ 	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
+ 	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
+ 	list='$(DISTFILES)'; \
+@@ -1975,7 +1975,7 @@ clean-local:
+ 	rm -f $(posix_submodules)
+ 
+ $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
+-	test -d $(builddir)/doc || mkdir $(builddir)/doc
++	$(MKDIR_P) $(builddir)/doc
+ @HAVE_LDOC_TRUE@	$(LDOC) -c build-aux/config.ld -d $(abs_srcdir)/doc .
+ @HAVE_LDOC_FALSE@	$(MKDIR_P) doc
+ @HAVE_LDOC_FALSE@	touch doc/index.html doc/ldoc.css
+@@ -1983,7 +1983,7 @@ $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
+ doc: $(allhtml)
+ 
+ $(luarocks_config): Makefile.am
+-	@test -d build-aux || mkdir build-aux
++	@$(MKDIR_P) build-aux
+ 	$(AM_V_GEN){						\
+ 	  $(set_LUA_BINDIR);					\
+ 	  echo 'rocks_trees = { "$(abs_srcdir)/luarocks" }';	\
+diff --git a/build-aux/rockspecs.mk b/build-aux/rockspecs.mk
+index ebd1dbf..c8fbdbc 100644
+--- a/build-aux/rockspecs.mk
++++ b/build-aux/rockspecs.mk
+@@ -62,7 +62,7 @@ LUA_INCDIR = `cd $$LUA_BINDIR/../include && pwd`
+ LUA_LIBDIR = `cd $$LUA_BINDIR/../lib && pwd`
+ 
+ $(luarocks_config): Makefile.am
+-	@test -d build-aux || mkdir build-aux
++	@$(MKDIR_P) build-aux
+ 	$(AM_V_GEN){						\
+ 	  $(set_LUA_BINDIR);					\
+ 	  echo 'rocks_trees = { "$(abs_srcdir)/luarocks" }';	\
+diff --git a/local.mk b/local.mk
+index d391ef7..80b22ce 100644
+--- a/local.mk
++++ b/local.mk
+@@ -255,7 +255,7 @@ dist_examples_DATA +=				\
+ allhtml = $(dist_doc_DATA) $(dist_examples_DATA) $(dist_modules_DATA) $(dist_classes_DATA)
+ 
+ $(allhtml): $(EXTRA_ext_posix_posix_la_SOURCES) $(ext_posix_posix_la_SOURCES)
+-	test -d $(builddir)/doc || mkdir $(builddir)/doc
++	$(MKDIR_P) $(builddir)/doc
+ if HAVE_LDOC
+ 	$(LDOC) -c build-aux/config.ld -d $(abs_srcdir)/doc .
+ else
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
new file mode 100644
index 000000000..1bee9fe0b
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "luaposix is a POSIX binding for Lua."
+LICENSE = "MIT"
+HOMEPAGE = "https://github.com/luaposix/luaposix"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7dd2aad04bb7ca212e69127ba8d58f9f"
+
+DEPENDS += "lua-native lua"
+
+SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release \
+           file://0001-fix-avoid-race-condition-between-test-and-mkdir.patch \
+"
+SRCREV = "8e4902ed81c922ed8f76a7ed85be1eaa3fd7e66d"
+S = "${WORKDIR}/git"
+LUA_VERSION = "5.3"
+
+inherit autotools pkgconfig
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' 'luadir=${datadir}/lua/${LUA_VERSION}' 'luaexecdir=${libdir}/lua/${LUA_VERSION}' install
+}
+
+FILES_${PN} = "${datadir}/lua/${LUA_VERSION} ${libdir}/lua/${LUA_VERSION}"
-- 
2.17.1

