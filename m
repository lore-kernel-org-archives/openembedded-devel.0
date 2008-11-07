Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Kyauy-0005Cu-Mm
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Nov 2008 00:39:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D1C3F1405348
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Nov 2008 00:03:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeWE3+eZtduP
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Nov 2008 00:03:43 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 99A2C1422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Nov 2008 00:03:43 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 08 Nov 2008 00:05:01 +0100
Message-Id: <1226099101.6034.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: [patch review] bitbake.conf: Introduce STAGING_BINDIR_CROSS_BASEPKG
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
X-List-Received-Date: Fri, 07 Nov 2008 23:39:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo core developers.

Please approve or comment following patch of bitbake.conf.

It introduces STAGING_BINDIR_CROSS_BASEPKG pointing to
STAGING_BINDIR_CROSS of base packages and adds it to PATH (after
STAGING_BINDIR_CROSS).

It fixes highly base package cross bindir lookup while compiling highly
optimized packages. Actually it's mplayer and sdl-config lookup.

Note that similar patch adding highly optimized pkgconfig dir to
PKG_CONFIG_PATH may be needed in future.

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4273152..678062a 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -245,6 +245,7 @@ STAGING_DIR = "${TMPDIR}/staging"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_bindir}"
 STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${layout_bindir}/${MULTIMACH_HOST_SYS}"
+STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${layout_bindir}/${BASEPKG_TARGET_SYS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_libdir}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_includedir}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_sysconfdir}"
@@ -337,7 +338,7 @@ EXTRA_IMAGEDEPENDS = ""
 
 CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
 CROSS_DATADIR = "${CROSS_DIR}/share"
-PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${layout_sbindir}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/bin:${STAGING_DIR_NATIVE}${layout_base_sbindir}:${STAGING_DIR_NATIVE}${layout_base_bindir}:"
+PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${layout_sbindir}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/bin:${STAGING_DIR_NATIVE}${layout_base_sbindir}:${STAGING_DIR_NATIVE}${layout_base_bindir}:"
 export PATH
 
 ##################################################################



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



