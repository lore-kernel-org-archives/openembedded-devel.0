Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 237EF61844
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:33:18 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ34e-00015J-Lg by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:33:19 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ34e-0000gm-Ij; Sat, 28 Sep 2013 23:33:16 +0100
Date: Sat, 28 Sep 2013 23:33:16 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <20130928223316.GC14909@novatech.datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] maliit: Import maliit recipes from meta-oe
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
X-List-Received-Date: Sat, 28 Sep 2013 22:33:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Seems my git send-email skills got rusty.

This should have had a meta-qt5 prefix and and cover-letter containing
something like this:

These recipes offer the maliit virtual keyboard for qt5.

The recipes origin from meta-oe and have been adapted to the new git
repo, new packaging and some upstream changes. Details are listed in
the individual commits. Pull from:

git://github.com:Stefan-Schmidt/meta-qt5.git maliit5

regards
Stefan Schmidt

On Sat, 2013-09-28 at 23:25, Stefan Schmidt wrote:
> Imported from rev 13ae5105ee30410136beeae66ec41ee4a8a2e2b0
> 
> This is the first step to move these recipes over to qt5.
> ---
>  ...INSTALL_PRF-to-allow-the-build-with-opene.patch | 34 ++++++++
>  ...LUGIN_PATH-to-allow-openembedded-to-build.patch | 34 ++++++++
>  ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch | 23 ++++++
>  .../maliit-framework-qt5/maliit-server.desktop     |  6 ++
>  recipes-qt/maliit/maliit-framework-qt5_git.bb      | 96 ++++++++++++++++++++++
>  recipes-qt/maliit/maliit-plugins-qt5_git.bb        | 33 ++++++++
>  6 files changed, 226 insertions(+)
>  create mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
>  create mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
>  create mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
>  create mode 100644 recipes-qt/maliit/maliit-framework-qt5/maliit-server.desktop
>  create mode 100644 recipes-qt/maliit/maliit-framework-qt5_git.bb
>  create mode 100644 recipes-qt/maliit/maliit-plugins-qt5_git.bb
> 
> diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
> new file mode 100644
> index 0000000..acd9a57
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
> @@ -0,0 +1,34 @@
> +From 33554f9b3fd493c7e28617fd01466ffa87251f27 Mon Sep 17 00:00:00 2001
> +From: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +Date: Wed, 1 Aug 2012 13:21:51 +0200
> +Subject: [PATCH] Fix MALIIT_INSTALL_PRF to allow the build with openembedded
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +---
> + config.pri |    8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/config.pri b/config.pri
> +index b037b8c..43409f3 100644
> +--- a/config.pri
> ++++ b/config.pri
> +@@ -161,9 +161,11 @@ contains(QT_MAJOR_VERSION, 4) {
> +     QT_WIDGETS = gui widgets
> + }
> + 
> +-MALIIT_INSTALL_PRF = $$[QT_INSTALL_DATA]/mkspecs/features
> +-local-install {
> +-    MALIIT_INSTALL_PRF = $$replace(MALIIT_INSTALL_PRF, $$[QT_INSTALL_PREFIX], $$PREFIX)
> ++isEmpty(MALIIT_INSTALL_PRF) {
> ++    MALIIT_INSTALL_PRF = $$[QT_INSTALL_DATA]/mkspecs/features
> ++    local-install {
> ++        MALIIT_INSTALL_PRF = $$replace(MALIIT_INSTALL_PRF, $$[QT_INSTALL_PREFIX], $$PREFIX)
> ++    }
> + }
> + 
> + defineTest(outputFile) {
> +-- 
> +1.7.9.5
> +
> diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
> new file mode 100644
> index 0000000..830e6de
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
> @@ -0,0 +1,34 @@
> +From fb6acbd2af9ed288c1c4f4200fc73d8d9955486a Mon Sep 17 00:00:00 2001
> +From: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +Date: Wed, 1 Aug 2012 13:33:10 +0200
> +Subject: [PATCH] Fix QT_IM_PLUGIN_PATH to allow openembedded to build Maliit
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +---
> + input-context/input-context.pri |   10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/input-context/input-context.pri b/input-context/input-context.pri
> +index d94e6a3..d460e70 100644
> +--- a/input-context/input-context.pri
> ++++ b/input-context/input-context.pri
> +@@ -25,8 +25,10 @@ for(OPTION,$$list($$lower($$COV_OPTION))){
> + 
> + QMAKE_CLEAN += $$OBJECTS_DIR/*.gcno $$OBJECTS_DIR/*.gcda
> + 
> +-QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
> +-QT_PREFIX = $$[QT_INSTALL_PREFIX]
> +-local-install {
> +-    QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
> ++isEmpty(QT_IM_PLUGIN_PATH) {
> ++    QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
> ++    QT_PREFIX = $$[QT_INSTALL_PREFIX]
> ++    local-install {
> ++        QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
> ++    }
> + }
> +-- 
> +1.7.9.5
> +
> diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
> new file mode 100644
> index 0000000..c2291c6
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
> @@ -0,0 +1,23 @@
> +From cc33efdedbec9e9a55e9a0c6756516fd84d42e53 Mon Sep 17 00:00:00 2001
> +From: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +Date: Fri, 1 Mar 2013 11:31:41 +0100
> +Subject: [PATCH] Link to libmaliit-1,0 in inputcontext plugin
> +
> +Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +---
> + .../input-context-plugin/input-context-plugin.pro  |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/input-context/input-context-plugin/input-context-plugin.pro b/input-context/input-context-plugin/input-context-plugin.pro
> +index eefbe93..296e2fa 100644
> +--- a/input-context/input-context-plugin/input-context-plugin.pro
> ++++ b/input-context/input-context-plugin/input-context-plugin.pro
> +@@ -15,3 +15,5 @@ CONFIG += plugin
> +
> + INSTALLS    += target
> + target.path += $$QT_IM_PLUGIN_PATH
> ++
> ++LIBS += -L../../lib -l"maliit-1.0"
> +--
> +1.7.9.5
> +
> diff --git a/recipes-qt/maliit/maliit-framework-qt5/maliit-server.desktop b/recipes-qt/maliit/maliit-framework-qt5/maliit-server.desktop
> new file mode 100644
> index 0000000..24bdf9b
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-framework-qt5/maliit-server.desktop
> @@ -0,0 +1,6 @@
> +[Desktop Entry]
> +Name=Maliit server
> +Exec=/usr/bin/maliit-server
> +Icon=
> +Type=Application
> +Categories=Utility;
> diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> new file mode 100644
> index 0000000..9f67452
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> @@ -0,0 +1,96 @@
> +DESCRIPTION = "A virtual keyboard for touch-screen based user interfaces"
> +HOMEPAGE = "https://wiki.maliit.org/Main_Page"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
> +
> +#inherit autotools qt4x11 gtk-immodules-cache
> +
> +
> +SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
> +    file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
> +    file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
> +    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
> +    file://maliit-server.desktop \
> +"
> +
> +SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
> +PV = "0.92.3+git${SRCPV}"
> +
> +
> +PACKAGES =+ "${PN}-gtk"
> +GTKIMMODULES_PACKAGES = "${PN}-gtk"
> +
> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
> +
> +RRECOMMENDS_${PN} = "maliit-plugins"
> +
> +
> +FILES_${PN} += "\
> +    ${libdir}/maliit/plugins-*/factories/libmaliit-plugins-quick-factory-*.so \
> +    ${libdir}/qt4/plugins/inputmethods/*.so \
> +    ${datadir}/applications/maliit-server.desktop \
> +"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/maliit-framework-tests \
> +    ${libdir}/gtk-*/*/immodules/.debug \
> +    ${libdir}/maliit/plugins-*/factories/.debug \
> +    ${libdir}/qt4/plugins/.debug \
> +    ${libdir}/qt4/plugins/inputmethods/.debug \
> +"
> +
> +FILES_${PN}-dev += "${datadir}/qt4"
> +
> +FILES_${PN}-gtk +="\
> +    ${bindir}/maliit-exampleapp-gtk* \
> +    \
> +    ${libdir}/gtk-*/*/immodules/libim-maliit.so\
> +"
> +
> +EXTRA_QMAKEVARS_PRE = "\
> +    PREFIX=${prefix} \
> +    LIBDIR=${libdir} \
> +    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
> +    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
> +    SCHEMADIR=${sysconfdir}/gconf/schemas \
> +    CONFIG+=disable-gconf \
> +    CONFIG+=disable-gtk-cache-update \
> +    CONFIG+=local-install \
> +    CONFIG+=nosdk \
> +"
> +
> +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
> +
> +do_install_append() {
> +    #Fix absolute paths
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
> +
> +    install -d ${D}${datadir}/applications
> +    install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
> +}
> +
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +# should run online
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +echo "export QT_IM_MODULE=Maliit" >> /etc/xprofile
> +ln -s /usr/share/applications/maliit-server.desktop /etc/xdg/autostart/maliit-server.desktop
> +}
> +
> +pkg_postrm_${PN} () {
> +#!/bin/sh
> +# should run online
> +if [ "x$D" = "x" ]; then
> +    exit 1
> +fi
> +if [ -e "/etc/xprofile" ]; then
> +    sed -i -e "g|export QT_IM_MODULE=Maliit|d" /etc/xprofile
> +fi
> +rm -f /etc/xdg/autostart/maliit-server.desktop
> +}
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
> new file mode 100644
> index 0000000..fdca8c0
> --- /dev/null
> +++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Plugins for a virtual keyboard for touch-screen based user interfaces"
> +HOMEPAGE = "https://wiki.maliit.org/Main_Page"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
> +
> +inherit autotools qt4x11
> +
> +DEPENDS = "maliit-framework-qt5"
> +
> +RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
> +
> +SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
> +
> +SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
> +PV = "0.92.3+git${SRCPV}"
> +
> +EXTRA_QMAKEVARS_PRE = "\
> +    PREFIX=${prefix} \
> +    LIBDIR=${libdir} \
> +    CONFIG+=nodoc \
> +"
> +
> +FILES_${PN} += "\
> +    ${libdir}/maliit \
> +    ${datadir} \
> +"
> +
> +FILES_${PN}-dbg += "${libdir}/maliit/plugins-*/.debug"
> +
> +S= "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
> -- 
> 1.8.4.rc3
> 

