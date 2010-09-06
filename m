Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OsTMU-0007Nb-AN
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 06:31:31 +0200
Received: by pxi11 with SMTP id 11so930229pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 21:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=f+xgGuJqyDf0B/Uea0OujRiPEFkIyn2HQRqb+QYEuHk=;
	b=Q9YB08LnTIM+rL/XDgyGthZ/xYd3JtJbfE/y6n+XsvAU28+44OV1VykBLAcjo7k/p7
	Zd27A3yaN8XP1uDIE+l8rcSvtEq2cccqCaeBB7B3exHzSXAi1CWzpOkmVAl6OizRB3kG
	rKVb6xufuP/OcYHkM5ipYkx3nrGChzKvth2tA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=cY25vU241TrCuCaxcMX/87uudA87Oi+pjf9ItIJB+RcJ4PY1Nf6NFYbhHHPSMFXoMo
	sCGBRSs/Oeo/nmD5it4sVE5urwHLTJDMccsLDP1j1bJJLqtV3aSjWifP4R+bd9k8qq49
	7MEroSN44x6hRvrVs0n4Cp3TyN+31p1sPFK9E=
Received: by 10.114.72.1 with SMTP id u1mr2508152waa.175.1283747438512;
	Sun, 05 Sep 2010 21:30:38 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	x9sm10407282waj.15.2010.09.05.21.30.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 21:30:37 -0700 (PDT)
Message-ID: <4C846E68.3000004@gmail.com>
Date: Mon, 06 Sep 2010 14:00:32 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] mupdf_git.bb: add recipe.
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
X-List-Received-Date: Mon, 06 Sep 2010 04:31:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/mupdf/files/wintitle.patch |   15 +++++++++
 recipes/mupdf/mupdf_git.bb         |   60 ++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mupdf/files/wintitle.patch
 create mode 100644 recipes/mupdf/mupdf_git.bb

diff --git a/recipes/mupdf/files/wintitle.patch b/recipes/mupdf/files/wintitle.patch
new file mode 100644
index 0000000..dbcf834
--- /dev/null
+++ b/recipes/mupdf/files/wintitle.patch
@@ -0,0 +1,15 @@
+Upstream: http://bugs.ghostscript.com/show_bug.cgi?id=691577
+Status: pending
+
+diff --git a/apps/x11_main.c b/apps/x11_main.c
+index 395f9fd..c045863 100644
+--- a/apps/x11_main.c
++++ b/apps/x11_main.c
+@@ -198,6 +198,7 @@ void wincursor(pdfapp_t *app, int curs)
+
+ void wintitle(pdfapp_t *app, char *s)
+ {
++    XStoreName(xdpy, xwin, s);
+ #ifdef X_HAVE_UTF8_STRING
+     Xutf8SetWMProperties(xdpy, xwin, s, s, nil, 0, nil, nil, nil);
+ #else
diff --git a/recipes/mupdf/mupdf_git.bb b/recipes/mupdf/mupdf_git.bb
new file mode 100644
index 0000000..ddec287
--- /dev/null
+++ b/recipes/mupdf/mupdf_git.bb
@@ -0,0 +1,60 @@
+DESCRIPTION = "A lightweight PDF viewer and toolkit written in portable C."
+HOMEPAGE = "http://www.mupdf.com"
+SECTION = "x11/applications"
+LICENSE = "GPLv3"
+
+SRCREV = "8147dd7fe7107de60f2c7de3bcd78e0048c26241"
+PV = "0.7+gitr${SRCPV}"
+PR = "r0"
+
+DEPENDS = "openjpeg-native jbig2dec-native jpeg-native freetype-native libpng-native openjpeg jbig2dec jpeg zlib virtual/libx11 libxext freetype"
+
+SRC_URI = "git://mupdf.com/repos/mupdf.git;protocol=http \
+		file://wintitle.patch"
+
+S = "${WORKDIR}/git"
+
+PACKAGES =+ "${PN}-tools ${PN}-tools-doc "
+FILES_${PN}-tools = "${bindir}/pdfclean ${bindir}/pdfdraw ${bindir}/pdfshow \
+                     ${bindir}/pdfextract ${bindir}/pdfinfo"
+FILES_${PN}-tools-doc = "${mandir}/man1/pdfclean.1 ${mandir}/man1/pdfdraw.1 \
+                         ${mandir}/man1/pdfshow.1"
+
+# mupdf crashes when built with -ggdb3
+# http://bugs.ghostscript.com/show_bug.cgi?id=691578
+FULL_OPTIMIZATION := "${@oe_filter_out('-ggdb3', '${FULL_OPTIMIZATION}', d)}"
+
+do_configure() {
+    # we don't include CJK fonts to make binary more slim
+    # comment out following two lines if you need support for CJK
+    sed -i 's:^\t\$.GENDIR./font_cjk.c::g' ${S}/Makefile
+    echo "CFLAGS += -DNOCJK" >> ${S}/Makerules
+}
+
+do_compile() {
+    # mupdf uses couple of tools for code generation during build process
+    # so we need to compile them first with host compiler
+    unset CFLAGS LDFLAGS
+    export PKG_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/pkgconfig
+    oe_runmake build=release build/release
+    oe_runmake build=release build/release/cmapdump LD="${BUILD_CC} -L${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE}" CC=${BUILD_CC}
+    oe_runmake build=release build/release/fontdump LD="${BUILD_CC} -L${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE}" CC=${BUILD_CC}
+
+    export PKG_CONFIG_PATH=${STAGING_LIBDIR}/pkgconfig
+    # ...and then we fire 'make', feeding proper
+    # cross-compilation flags through Makerules file
+    echo "CFLAGS += ${CFLAGS}" >> ${S}/Makerules
+    echo "LDFLAGS += ${LDFLAGS}" >> ${S}/Makerules
+    oe_runmake build=release LD="${CC}"
+}
+
+do_install() {
+    oe_runmake install build=release prefix="${D}/usr"
+    install -d ${D}/${datadir}/applications
+    install -d ${D}/${datadir}/pixmaps
+    install -d ${D}/${mandir}/man1
+    install -m 0644 ${S}/debian/mupdf.xpm ${D}/${datadir}/pixmaps/
+    install -m 0644 ${S}/debian/mupdf.desktop ${D}/${datadir}/applications/
+    install -m 0644 ${S}/debian/*.1 ${D}/${mandir}/man1/
+}
+
-- 
1.7.1



