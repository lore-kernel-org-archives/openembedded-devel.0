Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0680E606D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:50:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jul 2016 04:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="137741848"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 04:50:43 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:50:37 +0300
Message-Id: <1468324237-13346-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-networking][PATCH] augeas: Move from oe-core
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
X-List-Received-Date: Tue, 12 Jul 2016 11:50:46 -0000

augeas is being removed from oe-core as nothing there uses or tests
it. Move the recipe to meta-networking where the only meta-oe reverse
dependency (netcf) lives.

Also upgrade to 1.5.0: no recipe changes needed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-networking/recipes-support/augeas/augeas.inc  | 30 ++++++++++++++++++++++
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++++
 .../augeas/add-missing-argz-conditional.patch      | 20 +++++++++++++++
 .../augeas/augeas/sepbuildfix.patch                | 22 ++++++++++++++++
 .../recipes-support/augeas/augeas_1.5.0.bb         |  4 +++
 5 files changed, 106 insertions(+)
 create mode 100644 meta-networking/recipes-support/augeas/augeas.inc
 create mode 100644 meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
 create mode 100644 meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
 create mode 100644 meta-networking/recipes-support/augeas/augeas_1.5.0.bb

diff --git a/meta-networking/recipes-support/augeas/augeas.inc b/meta-networking/recipes-support/augeas/augeas.inc
new file mode 100644
index 0000000..23d12ca
--- /dev/null
+++ b/meta-networking/recipes-support/augeas/augeas.inc
@@ -0,0 +1,30 @@
+SUMMARY = "Augeas configuration API"
+HOMEPAGE = "http://augeas.net/"
+BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
+           file://add-missing-argz-conditional.patch \
+           file://sepbuildfix.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+          "
+
+DEPENDS = "readline libxml2"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-lenses lib${BPN}"
+
+FILES_${PN}-lenses = "${datadir}/augeas/lenses"
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
+
+RDEPENDS_lib${BPN} += "${PN}-lenses"
+RRECOMMENDS_lib${BPN} += "${PN}"
+
+LEAD_SONAME = "libaugeas.so"
+
+do_install_append() {
+	rm -fr ${D}${datadir}/vim
+}
diff --git a/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..9a19876
--- /dev/null
+++ b/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: augeas-1.2.0/gnulib/lib/Makefile.am
+===================================================================
+--- augeas-1.2.0.orig/gnulib/lib/Makefile.am
++++ augeas-1.2.0/gnulib/lib/Makefile.am
+@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch b/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
new file mode 100644
index 0000000..abbdbaa
--- /dev/null
+++ b/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
@@ -0,0 +1,20 @@
+Add missing GL_GENERATE_ARGZ_H conditional
+
+- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: augeas-1.0.0/configure.ac
+===================================================================
+--- augeas-1.0.0.orig/configure.ac
++++ augeas-1.0.0/configure.ac
+@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
+ 
+ AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
+ 
++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
++
+ dnl --enable-debug=(yes|no)
+ AC_ARG_ENABLE([debug],
+               [AC_HELP_STRING([--enable-debug=no/yes],
diff --git a/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
new file mode 100644
index 0000000..b82a3ee
--- /dev/null
+++ b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
@@ -0,0 +1,22 @@
+Ensure that builds in separate builddirs (${B} != ${S}) correctly install the 
+lenses files.
+
+Upstream-Status: Pending
+
+RP 2013/4/17
+
+Index: augeas-1.0.0/Makefile.am
+===================================================================
+--- augeas-1.0.0.orig/Makefile.am	2012-11-02 15:20:11.000000000 +0000
++++ augeas-1.0.0/Makefile.am	2013-04-17 10:36:24.033400125 +0000
+@@ -5,8 +5,8 @@
+ lensdir=$(datadir)/augeas/lenses/dist
+ lenstestdir=$(datadir)/augeas/lenses/dist/tests
+ 
+-dist_lens_DATA=$(wildcard lenses/*.aug)
+-dist_lenstest_DATA=$(wildcard lenses/tests/*.aug)
++dist_lens_DATA=$(wildcard $(top_srcdir)/lenses/*.aug)
++dist_lenstest_DATA=$(wildcard $(top_srcdir)lenses/tests/*.aug)
+ 
+ EXTRA_DIST=augeas.spec build/aux/move-if-change Makefile.am HACKING
+ 
diff --git a/meta-networking/recipes-support/augeas/augeas_1.5.0.bb b/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
new file mode 100644
index 0000000..c4f62e7
--- /dev/null
+++ b/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
@@ -0,0 +1,4 @@
+require augeas.inc
+
+SRC_URI[md5sum] = "01190e455c513124a2dae29a1182c113"
+SRC_URI[sha256sum] = "223bb6e6fe3e9e92277dafd5d34e623733eb969a72a382998d204feab253f73f"
-- 
2.1.4


