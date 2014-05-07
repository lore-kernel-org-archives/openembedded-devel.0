Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5A86A60196
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 13:11:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1003,1389740400"; d="scan'208";a="50843787"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 07 May 2014 15:11:48 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 7 May 2014 15:11:48 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 7 May 2014 15:11:47 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 May 2014 15:11:56 +0200
Message-ID: <1399468316-20964-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <20140506214124.GD30955@jama>
References: <20140506214124.GD30955@jama>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] tk: cleanup & add PACKAGECONFIG
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
X-List-Received-Date: Wed, 07 May 2014 13:11:51 -0000
Content-Type: text/plain

Changes:
- add PACKAGECONFIG "xft" enables XFontConfig features
- add PACKAGECONFIG "xss" enables XScreenSaver extension
- use ${BPN} and ${PV}
- use ${VER} intermediate variable for readability
- fulfill LIC_FILES_CHKSUM
- remove BINCONFIG_GLOB: inherit binconfig is not present, lib/tkConfig.sh paths are valid
- add SSTATE_SCAN_FILES, like it is done in tcl recipe (OE-Core)

Note: tcl and tk are sharing the same licence, tcl licence file in commited in OE-Core.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb | 44 ++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index d12973c..36a1729 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -1,12 +1,24 @@
 SUMMARY = "Tool Command Language ToolKit Extension"
 HOMEPAGE = "http://tcl.sourceforge.net"
 SECTION = "devel/tcltk"
+
+# http://www.tcl.tk/software/tcltk/license.html
 LICENSE = "tcl"
-LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe"
+LIC_FILES_CHKSUM = "file://../license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../compat/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../doc/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../library/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../macosx/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../tests/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../unix/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../win/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+"
+
 DEPENDS = "tcl virtual/libx11 libxt"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
+    ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
     file://confsearch.diff;striplevel=2 \
     file://non-linux.diff;striplevel=2 \
     file://tklibrary.diff;striplevel=2 \
@@ -16,8 +28,12 @@ SRC_URI = "\
 SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
 SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
 
-S = "${WORKDIR}/tk${PV}/unix"
-LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
+S = "${WORKDIR}/${BPN}${PV}/unix"
+
+# Short version format: "8.6"
+VER = "${@os.path.splitext(d.getVar('PV', True))[0]}"
+
+LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
 inherit autotools
 
 EXTRA_OECONF = "\
@@ -28,27 +44,33 @@ EXTRA_OECONF = "\
 "
 
 do_install_append() {
-    ln -sf libtk8.6.so ${D}${libdir}/libtk8.6.so.0
-    oe_libinstall -so libtk8.6 ${D}${libdir}
-    ln -sf wish8.6 ${D}${bindir}/wish
-	
+    ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
+    oe_libinstall -so libtk${VER} ${D}${libdir}
+    ln -sf wish${VER} ${D}${bindir}/wish
+
     # Even after passing libdir=${libdir} at config, some incorrect dirs are still generated for the multilib build
     if [ "$libdir" != "/usr/lib" ]; then
         # Move files to correct library directory
-        mv ${D}/usr/lib/tk8.6/* ${D}/${libdir}/tk8.6/
+        mv ${D}/usr/lib/tk${VER}/* ${D}/${libdir}/tk${VER}/
         # Remove unneeded/incorrect dir ('usr/lib/')
         rm -rf ${D}/usr/lib
     fi
 }
 
+PACKAGECONFIG ??= "xft"
+PACKAGECONFIG[xft] = "--enable-xft,--disable-xft,xft"
+PACKAGECONFIG[xss] = "--enable-xss,--disable-xss,libxscrnsaver libxext"
+
 PACKAGES =+ "${PN}-lib"
 
-FILES_${PN}-lib = "${libdir}/libtk8.6.so*"
+FILES_${PN}-lib = "${libdir}/libtk${VER}.so*"
 FILES_${PN} += "${libdir}/tk*"
 
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tk-lib"
 RDEPENDS_${PN}_class-native = ""
 
-BINCONFIG_GLOB = "*Config.sh"
 BBCLASSEXTEND = "native"
+
+# Fix the path in sstate
+SSTATE_SCAN_FILES += "*Config.sh"
-- 
1.8.5.4


