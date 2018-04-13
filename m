Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB6471BA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 08:58:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3D8w2OW015457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2018 01:58:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 01:58:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Fri, 13 Apr 2018 04:57:43 -0400
Message-ID: <1523609863-13079-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-networking] networkmanager: enable gobject introspection
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
X-List-Received-Date: Fri, 13 Apr 2018 08:58:02 -0000
Content-Type: text/plain

While networkmanager upgraded to 1.10.6, it disable
gi which caused network-manager-applet build faulure
...
Couldn't find include 'NM-1.0.gir'
...

Since the networkmanager inherit gobject-introspection,
we should support it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0008-support-gi-work-on-cross-compiling.patch  | 78 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.10.6.bb        |  4 +-
 2 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0008-support-gi-work-on-cross-compiling.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0008-support-gi-work-on-cross-compiling.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0008-support-gi-work-on-cross-compiling.patch
new file mode 100644
index 0000000..6012614
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0008-support-gi-work-on-cross-compiling.patch
@@ -0,0 +1,78 @@
+From 22d424fc33c8d1f56081abe8df24ec30789e901d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 13 Apr 2018 15:59:35 +0800
+Subject: [PATCH] support gi work on cross compiling
+
+For cross compiling:
+
+1. It is incorrect to detect gi at do_configure (build time).
+
+2. Do not use gi to generate doc at do_compile (build time),
+   tweak the macro BUILD_DOCS
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am  | 6 +++---
+ configure.ac | 9 ---------
+ 2 files changed, 3 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 639921d..03db561 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -958,7 +958,7 @@ libnm/libnm.typelib: libnm/libnm.gir
+ INTROSPECTION_GIRS += libnm/NM-1.0.gir
+ endif
+ 
+-if HAVE_INTROSPECTION
++if BUILD_DOCS
+ 
+ libnm_noinst_data = \
+ 	libnm/nm-property-docs.xml \
+@@ -3317,7 +3317,7 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_core_lib_h_pub_mkenums)
+ $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
+ 
+ clients_common_settings_doc_c = clients/common/settings-docs.c
+-if HAVE_INTROSPECTION
++if BUILD_DOCS
+ $(clients_common_settings_doc_c): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
+ 	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
+ DISTCLEANFILES += $(clients_common_settings_doc_c)
+@@ -4361,7 +4361,7 @@ man_nm_settings_xml = \
+ 	man/nm-settings-keyfile.xml \
+ 	man/nm-settings-ifcfg-rh.xml
+ 
+-if HAVE_INTROSPECTION
++if BUILD_DOCS
+ 
+ man/nm-setting%.xml: man/nm-setting%.xsl libnm/nm-setting%-docs.xml
+ 	$(AM_V_GEN) $(XSLTPROC) --output $@ $(xsltproc_flags) $^
+diff --git a/configure.ac b/configure.ac
+index c9d3e56..252608e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1286,19 +1286,10 @@ GTK_DOC_CHECK(1.0)
+ # check if we can build setting property documentation
+ build_docs=no
+ if test -n "$INTROSPECTION_MAKEFILE"; then
+-	# If g-i is installed we know we have python, but we might not have pygobject
+-	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
+-		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
+-	fi
+-
+ 	AC_PATH_PROG(PERL, perl)
+ 	if test -z "$PERL"; then
+ 		AC_MSG_ERROR([--enable-introspection requires perl])
+ 	fi
+-	AC_PATH_PROG(XSLTPROC, xsltproc)
+-	if test -z "$XSLTPROC"; then
+-		AC_MSG_ERROR([--enable-introspection requires xsltproc])
+-	fi
+ 
+ 	have_introspection=yes
+ 	if test "$enable_gtk_doc" = "yes"; then
+-- 
+1.8.3.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index 6538e7b..660ce0a 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManag
            file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
            file://0006-check-for-strndupa-before-using-it.patch \
            file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
+           file://0008-support-gi-work-on-cross-compiling.patch \
            "
 SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
 SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
@@ -44,7 +45,6 @@ EXTRA_OECONF = " \
     --disable-ifcfg-rh \
     --disable-ifnet \
     --disable-ifcfg-suse \
-    --disable-introspection \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
@@ -52,7 +52,7 @@ EXTRA_OECONF = " \
 "
 
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/libnm-util/.libs"
+        export GIR_EXTRA_LIBS_PATH="${B}/libnm-util/.libs:${B}/libnm-glib/.libs/:${B}/libnm/.libs"
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-- 
2.8.1


