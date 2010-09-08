Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OtJ5J-0007Cs-6g
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 13:45:04 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OtJ4a-0007Q7-2v from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 04:44:16 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 13:44:14 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 16:43:51 +0500
Message-Id: <1283946231-29039-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 08 Sep 2010 11:44:14.0603 (UTC)
	FILETIME=[29683DB0:01CB4F4B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] glib-1.2: merged native and non-native recipes
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
X-List-Received-Date: Wed, 08 Sep 2010 11:45:05 -0000

* removed the glib-1.2-native_1.2.10.bb file
* added NATIVE_INSTALL_WORKS = "1"
* added BBCLASSEXTEND = "native"
* converted do_stage of native recipe to do_install_virtclass-native in the combined recipe
* added DEPENDS_virtclass-native = "" to avoid dependencies loops
* added gettext in inherit because it was needed by the native recipes
* bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/glib-1.2/glib-1.2-native_1.2.10.bb |   49 ----------------------------
 recipes/glib-1.2/glib-1.2_1.2.10.bb        |   20 ++++++++++-
 2 files changed, 18 insertions(+), 51 deletions(-)

diff --git a/recipes/glib-1.2/glib-1.2-native_1.2.10.bb b/recipes/glib-1.2/glib-1.2-native_1.2.10.bb
deleted file mode 100644
index d00e9a1..0000000
--- a/recipes/glib-1.2/glib-1.2-native_1.2.10.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-PR = "r0"
-LICENSE = "LGPL"
-DESCRIPTION = "GLib 1.2 is a deprecated libray to \
-provide support for old glib 1.2 based applications"
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = ""
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glib-1.2-${PV}"
-
-EXTRA_OECONF = "--disable-debug"
-
-SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v1.2/glib-${PV}.tar.gz \
-           file://glibconfig-sysdefs.h \
-           file://depcomp \
-           file://glib-reconf-fix;apply=yes \
-           file://posix-conf-changes;apply=yes \
-           file://gcc-3.4-pretty_function;apply=yes"
-
-
-S = "${WORKDIR}/glib-${PV}"
-
-inherit autotools pkgconfig native gettext
-
-acpaths = ""
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
-	install -m 0644 ${WORKDIR}/depcomp .
-	rm -f ltconfig acinclude.m4 libtool ltmain.sh
-}
-
-
-do_stage () {
-	oe_libinstall -so libglib ${STAGING_LIBDIR}
-	oe_libinstall -so -C gmodule libgmodule ${STAGING_LIBDIR}
-	oe_libinstall -so -C gthread libgthread ${STAGING_LIBDIR}
-	autotools_stage_includes
-	install -d ${STAGING_INCDIR}/glib-1.2
-	install -m 0755 ${S}/glibconfig.h ${STAGING_INCDIR}/glib-1.2/glibconfig.h
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/glib.m4 ${STAGING_DATADIR}/aclocal/glib-1.2.m4
-}
-
-do_install () {
-	:
-}
-
-SRC_URI[md5sum] = "6fe30dad87c77b91b632def29dd69ef9"
-SRC_URI[sha256sum] = "6e1ce7eedae713b11db82f11434d455d8a1379f783a79812cd2e05fc024a8d9f"
diff --git a/recipes/glib-1.2/glib-1.2_1.2.10.bb b/recipes/glib-1.2/glib-1.2_1.2.10.bb
index 72ee826..67266d4 100644
--- a/recipes/glib-1.2/glib-1.2_1.2.10.bb
+++ b/recipes/glib-1.2/glib-1.2_1.2.10.bb
@@ -4,7 +4,8 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "glib-1.2-native"
-PR = "r4"
+DEPENDS_virtclass-native = ""
+PR = "r5"
 
 LEAD_SONAME = "libglib-1.2.*"
 
@@ -22,7 +23,7 @@ SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v1.2/glib-${PV}.tar.gz \
 
 S = "${WORKDIR}/glib-${PV}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig gettext
 
 acpaths = ""
 do_configure_prepend () {
@@ -31,6 +32,17 @@ do_configure_prepend () {
 	rm -f ltconfig acinclude.m4 libtool ltmain.sh
 }
 
+do_install_virtclass-native () {
+        oe_libinstall -so libglib ${D}${libdir}
+        oe_libinstall -so -C gmodule libgmodule ${D}${libdir}
+        oe_libinstall -so -C gthread libgthread ${D}${libdir}
+        autotools_do_install
+        install -d ${D}${includedir}/glib-1.2
+        install -m 0644 glibconfig.h glib.h ${D}${includedir}/glib-1.2/
+        install -d ${D}${datadir}/aclocal
+        install -m 0644 ${S}/glib.m4 ${D}${datadir}/aclocal/glib-1.2.m4
+}
+
 do_install_append () {
 	install -d ${D}${includedir}/glib-1.2
 	install -m 0644 glibconfig.h glib.h ${D}${includedir}/glib-1.2/
@@ -42,3 +54,7 @@ FILES_${PN}-dev += "${libdir}/glib/include/glibconfig.h"
 
 SRC_URI[md5sum] = "6fe30dad87c77b91b632def29dd69ef9"
 SRC_URI[sha256sum] = "6e1ce7eedae713b11db82f11434d455d8a1379f783a79812cd2e05fc024a8d9f"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



