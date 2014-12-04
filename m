Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B07BA60670
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:50:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44482406"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 13:47:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB45oaoN012392
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 13:50:36 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Dec 2014 13:50:56 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Dec 2014 13:49:58 +0800
Message-ID: <1417672199-7141-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20141202204504.GF12784@mentor.com>
References: <20141202204504.GF12784@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-networking][PATCH v2] radiusclient-ng: add new recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 05:51:04 -0000
Content-Type: text/plain

RADIUS protocol client library.
It is Portable, easy-to-use and standard compliant library suitable
for developing free and commercial software that need support for a
RADIUS protocol (RFCs 2128 and 2139).

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../Modify-configure.in-and-etc-Makefile.am.patch  | 84 ++++++++++++++++++++++
 .../config-site.radiusclient-ng-0.5.6              |  1 +
 .../radiusclient-ng/radiusclient-ng_0.5.6.bb       | 36 ++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
 create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/config-site.radiusclient-ng-0.5.6
 create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
new file mode 100644
index 0000000..ecc2d74
--- /dev/null
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
@@ -0,0 +1,84 @@
+From 45b97b474ce2d0ad56828db11edde8562bb47a43 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 2 Dec 2014 02:33:53 +0900
+Subject: [PATCH] Modify configure.in and etc/Makefile.am
+
+this patch is from Fedora to fix error:
+"conftest.c:26:9: error: unknown type name 'not'"
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ configure.in             | 6 +++++-
+ etc/Makefile.am          | 9 ++++++---
+ etc/radiusclient.conf.in | 2 +-
+ 3 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 812f640..3a8af99 100644
+--- a/configure.in
++++ b/configure.in
+@@ -29,6 +29,9 @@ AC_SUBST(LIBVERSION)
+ pkgsysconfdir=${sysconfdir}/$PACKAGE
+ AC_SUBST(pkgsysconfdir)
+ 
++pkgdatadir=${datadir}/$PACKAGE
++AC_SUBST(pkgdatadir)
++
+ AC_PROG_LIBTOOL
+ 
+ AC_PROG_CC
+@@ -118,7 +121,8 @@ then
+ 	],
+ 	AC_MSG_RESULT(yes)
+ 	AC_DEFINE(HAVE_STRUCT_UTSNAME_DOMAINNAME),
+-	AC_MSG_RESULT(no)
++	AC_MSG_RESULT(no),
++	AC_MSG_RESULT(assume no),
+ 	)
+ fi
+ 
+diff --git a/etc/Makefile.am b/etc/Makefile.am
+index 39b6975..a3c403f 100644
+--- a/etc/Makefile.am
++++ b/etc/Makefile.am
+@@ -14,9 +14,11 @@ CLEANFILES = *~ radiusclient.conf
+ 
+ sbindir = @sbindir@
+ pkgsysconfdir = @pkgsysconfdir@
+-pkgsysconf_DATA = issue port-id-map radiusclient.conf \
+-	dictionary dictionary.ascend dictionary.compat dictionary.merit \
+-	dictionary.sip
++pkgsysconf_DATA = issue port-id-map radiusclient.conf
++
++pkgdatadir = @pkgdatadir@
++pkgdata_DATA = dictionary dictionary.ascend dictionary.compat \
++	dictionary.merit dictionary.sip
+ 
+ EXTRA_DIST = issue port-id-map dictionary dictionary.ascend \
+ 	dictionary.compat dictionary.merit servers radiusclient.conf.in \
+@@ -25,6 +27,7 @@ EXTRA_DIST = issue port-id-map dictionary dictionary.ascend \
+ radiusclient.conf: radiusclient.conf.in
+ 	sed -e 's|@sbin''dir@|$(sbindir)|g' \
+ 	    -e 's|@pkgsysconf''dir@|$(pkgsysconfdir)|g' \
++	    -e 's|@pkgdata''dir@|$(pkgdatadir)|g' \
+ 	    <$(srcdir)/radiusclient.conf.in >radiusclient.conf
+ 
+ install-data-local: servers
+diff --git a/etc/radiusclient.conf.in b/etc/radiusclient.conf.in
+index 948bc2f..aac9973 100644
+--- a/etc/radiusclient.conf.in
++++ b/etc/radiusclient.conf.in
+@@ -47,7 +47,7 @@ servers		@pkgsysconfdir@/servers
+ 
+ # dictionary of allowed attributes and values
+ # just like in the normal RADIUS distributions
+-dictionary 	@pkgsysconfdir@/dictionary
++dictionary 	@pkgdatadir@/dictionary
+ 
+ # program to call for a RADIUS authenticated login
+ login_radius	@sbindir@/login.radius
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/config-site.radiusclient-ng-0.5.6 b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/config-site.radiusclient-ng-0.5.6
new file mode 100644
index 0000000..a30c144
--- /dev/null
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/config-site.radiusclient-ng-0.5.6
@@ -0,0 +1 @@
+ac_cv_func_uname=no
diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
new file mode 100644
index 0000000..73bbb51
--- /dev/null
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -0,0 +1,36 @@
+SUMMARY = "RADIUS protocol client library"
+DESCRIPTION = "Portable, easy-to-use and standard compliant library suitable \
+for developing free and commercial software that need support for a RADIUS \
+protocol (RFCs 2128 and 2139)."
+HOMEPAGE = "http://sourceforge.net/projects/radiusclient-ng.berlios/"
+SECTION = "Applications/Internet"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/r/${PN}/${PN}_${PV}.orig.tar.gz \
+   file://Modify-configure.in-and-etc-Makefile.am.patch \ 
+   file://config-site.radiusclient-ng-${PV}"
+
+SRC_URI[md5sum] = "6fb7d4d0aefafaee7385831ac46a8e9c"
+SRC_URI[sha256sum] = "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad361ac595f72f09f14"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3e47566c9271b786693d8a08792dbf41"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF += "--disable-static"
+
+do_configure_prepend () {
+    export CONFIG_SITE=./config-site.${P}
+}
+
+do_compile_prepend() {
+    for m in `find . -name "Makefile"` ; do
+        sed -i -e 's:^program_transform_name =.*:program_transform_name =:g' ${m}
+    done
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    rm -f ${D}${libdir}/*.la
+    rm -f ${D}${sbindir}/radexample
+}
-- 
1.8.4.2


