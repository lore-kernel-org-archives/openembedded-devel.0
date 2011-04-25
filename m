Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@zemeckis>) id 1QERai-0005Gy-4h
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:37:04 +0200
Received: from zemeckis ([10.115.0.50]) by mail.mikrofyn.com with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 25 Apr 2011 21:38:17 +0200
Received: by zemeckis (Postfix, from userid 1000)
	id A9EA620029; Mon, 25 Apr 2011 21:34:48 +0200 (CEST)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 21:34:48 +0200
Message-Id: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 25 Apr 2011 19:38:17.0031 (UTC)
	FILETIME=[53031570:01CC0380]
Subject: [PATCH] wvstreams: Cleaned up recipe.
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
X-List-Received-Date: Mon, 25 Apr 2011 19:37:04 -0000

* Corrected license.
* Added dbus support.
* Made PAM-support conditional.
---
 recipes/wvstreams/wvstreams_4.6.1.bb |   21 +++++++--------------
 1 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/recipes/wvstreams/wvstreams_4.6.1.bb b/recipes/wvstreams/wvstreams_4.6.1.bb
index 53249d4..8453e08 100644
--- a/recipes/wvstreams/wvstreams_4.6.1.bb
+++ b/recipes/wvstreams/wvstreams_4.6.1.bb
@@ -1,9 +1,10 @@
 HOMEPAGE = "http://alumnit.ca/wiki/index.php?page=WvStreams"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
 DESCRIPTION = "WvStreams is a network programming library in C++"
-DEPENDS = "zlib openssl (>= 0.9.8)"
+DEPENDS = "zlib openssl dbus"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 	file://0001-Fixed-missing-header-includes.patch \
@@ -13,13 +14,10 @@ inherit autotools pkgconfig
 
 LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
-# dbus detection currently broken in configure.ac; remember to add "dbus (>= 1.2.14)" to DEPENDS  when fixed
-EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-dbus"
+EXTRA_OECONF = " --without-tcl --without-qt --with-dbus"
+EXTRA_OECONF += ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}
 
-PACKAGES_prepend = "libuniconf libuniconf-dbg "
-PACKAGES_prepend = "uniconfd uniconfd-dbg "
-PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
-PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "
+PACKAGES += "libuniconf libuniconf-dbg uniconfd uniconfd-dbg libwvstreams-base libwvstreams-base-dbg libwvstreams-extras libwvstreams-extras-dbg"
 
 FILES_libuniconf     = "${libdir}/libuniconf.so.*"
 FILES_libuniconf-dbg = "${libdir}/.debug/libuniconf.so.*"
@@ -35,10 +33,5 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 
 PARALLEL_MAKE = ""
 
-do_configure() {
-        autoreconf
-        oe_runconf
-}
-
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
-- 
1.7.1



