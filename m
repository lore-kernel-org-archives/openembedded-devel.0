Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C8C3C76D96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443708"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:47 +0300
Message-Id: <1442233610-32279-8-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/9] ruby: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc         | 40 ----------------------
 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch | 13 --------
 meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb    | 42 ------------------------
 3 files changed, 95 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby.inc
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
deleted file mode 100644
index ba60191..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "An interpreter of object-oriented scripting language"
-DESCRIPTION = "Ruby is an interpreted scripting language for quick \
-and easy object-oriented programming. It has many features to process \
-text files and to do system management tasks (as in Perl). \
-It is simple, straight-forward, and extensible. \
-"
-HOMEPAGE = "http://www.ruby-lang.org/"
-SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD | GPLv2"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
-    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
-    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=c440adb575ba4e6e2344c2630b6a5584\
-"
-
-DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
-DEPENDS_class-native = "libyaml-native"
-
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-           file://extmk.patch \
-"
-
-S = "${WORKDIR}/ruby-${PV}"
-
-inherit autotools
-
-
-# This snippet lets compiled extensions which rely on external libraries,
-# such as zlib, compile properly.  If we don't do this, then when extmk.rb
-# runs, it uses the native libraries instead of the target libraries, and so
-# none of the linking operations succeed -- which makes extconf.rb think
-# that the libraries aren't available and hence that the extension can't be
-# built.
-
-do_configure_prepend() {
-    sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#; s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk
-    rm -rf ${S}/ruby/
-}
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch b/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
deleted file mode 100644
index 8b68450..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/extmk.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
---- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
-+++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
-@@ -354,8 +354,8 @@
-   $ruby = '$(topdir)/miniruby' + EXEEXT
- end
- $ruby << " -I'$(topdir)'"
-+$ruby << " -I'$(top_srcdir)/lib'"
- unless CROSS_COMPILING
--  $ruby << " -I'$(top_srcdir)/lib'"
-   $ruby << " -I'$(extout)/$(arch)' -I'$(extout)/common'" if $extout
-   $ruby << " -I./- -I'$(top_srcdir)/ext' -rpurelib.rb"
-   ENV["RUBYLIB"] = "-"
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
deleted file mode 100644
index 78c943c..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-require ruby.inc
-
-SRC_URI[md5sum] = "326e99ddc75381c7b50c85f7089f3260"
-SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44"
-
-# it's unknown to configure script, but then passed to extconf.rb
-# maybe it's not really needed as we're hardcoding the result with
-# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
-UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
-
-PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
-PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
-PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
-
-EXTRA_OECONF = "\
-    --disable-versioned-paths \
-    --disable-rpath \
-    --disable-dtrace \
-    --enable-shared \
-    --enable-load-relative \
-"
-
-EXTRA_OEMAKE = " \
-    LIBRUBYARG='-lruby-static' \
-"
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
-
-FILES_${PN} += "${datadir}/rubygems \
-                ${datadir}/ri"
-
-FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
-                    ${libdir}/ruby/*/*/.debug \
-                    ${libdir}/ruby/*/*/*/.debug \
-                    ${libdir}/ruby/*/*/*/*/.debug"
-
-BBCLASSEXTEND = "native"
-- 
2.1.4


