Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id DFEDF6EF8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:18:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,694,1389740400"; d="scan'208";a="43008814"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Mar 2014 12:19:00 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 20 Mar 2014 12:18:59 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 20 Mar 2014 12:18:59 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Mar 2014 12:11:44 +0100
Message-ID: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] terminus-font: add new recipe for version 4.38
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
X-List-Received-Date: Thu, 20 Mar 2014 11:19:01 -0000
Content-Type: text/plain

This is a dual recipe, it provides:
- console fonts (PSF v1 & v2 formats)
- X11 fonts (PCF format)

X11 font are generated when DISTRO_FEATURES contains 'x11'.
Use PACKAGECONFIG to configure.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../terminus-font/terminus-font_4.38.bb            | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
new file mode 100644
index 0000000..eba6fd6
--- /dev/null
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Terminus fonts packages (console and X11)"
+DESCRIPTION = "Terminus Font is a clean, fixed width bitmap font, designed for \
+               long (8 and more hours per day) work with computers."
+HOMEPAGE = "http://terminus-font.sourceforge.net/"
+AUTHOR = "Dimitar Zhekov"
+SECTION = "fonts"
+
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
+
+DEPENDS = "perl-native-runtime gzip-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
+SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5eed97b7"
+
+inherit allarch fontcache
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = ""
+
+# Don't use font cache mecanism for console packages
+FONT_PACKAGES = "${@base_contains('PACKAGECONFIG', 'x11', '${PN}-pcf', '', d)}"
+
+# Hand made configure script. Don't need oe_runconf
+do_configure() {
+	chmod +x ${S}/configure
+	${S}/configure --prefix=${prefix} \
+		--psfdir=${datadir}/consolefonts \
+		--acmdir=${datadir}/consoletrans \
+		--x11dir=${datadir}/fonts/terminus
+}
+
+do_compile() {
+	oe_runmake DESTDIR=${D} psf txt ${@base_contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install-psf install-acm ${@base_contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
+}
+
+PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
+FILES_${PN}-consolefonts = "${datadir}/consolefonts"
+FILES_${PN}-consoletrans = "${datadir}/consoletrans"
+FILES_${PN}-pcf = "${datadir}/fonts/terminus"
-- 
1.8.5.4


