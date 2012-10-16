Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TO2RO-0001iz-OB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 10:23:55 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so4340879iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2012 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Iu2YCojBCwRKxy5GJme1GvtefwaMOD4Pg67mdG0sv9M=;
	b=BT55TOahverZk31fzBxX5ke3s3qdw6a+cLe4InrsFWXM2w0GQJoaiPEtJbyH2Gb0+J
	sVnUHuFBb7vBMTejQ/casKXYkHzd4E8IXl9owTj5GZJow3ftsy+LwUQ7C4DpXPiKTnSt
	Q3HFzBz8neEbT99PeawFDGXiBbMnLic3nU7anNSk9WKSVqhodlKRgwV7mv0hN+YO6zEN
	ULcHpSg973tEUHlK4TCdIqVRaMFWBXkCODjdZ5MDSAMXSidH5GGKt2U6cQ5paxx24OO1
	OSkhR4EUAN+1s03Pl4Oq63DLfW7bmltWOG83A5viPAyGPXdr8M9sjB2iZuxc+4UxW1UT
	XNbA==
MIME-Version: 1.0
Received: by 10.50.47.227 with SMTP id g3mr9703819ign.5.1350375037713; Tue, 16
	Oct 2012 01:10:37 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Tue, 16 Oct 2012 01:10:37 -0700 (PDT)
In-Reply-To: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 16 Oct 2012 10:10:37 +0200
Message-ID: <CAGiJk9d6WTiaxG5Y=6MLQ0Wh+C+oXLPFV0h7buB+GtBPhcZfJA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Maliit: Add initial recipes
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
X-List-Received-Date: Tue, 16 Oct 2012 08:23:55 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/2 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 / BSD)
> The inputmethod framework from Qt is used and it supports gtk-immodules.
> It can also be used without dependencies to GTK+ (separate package for GTK+)
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  ...INSTALL_PRF-to-allow-the-build-with-opene.patch |   34 ++++++++
>  ...LUGIN_PATH-to-allow-openembedded-to-build.patch |   34 ++++++++
>  .../recipes-support/maliit/maliit-framework_git.bb |   86 ++++++++++++++++++++
>  .../recipes-support/maliit/maliit-plugins_git.bb   |   34 ++++++++
>  4 files changed, 188 insertions(+)
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-framework_git.bb
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-plugins_git.bb
>
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
> new file mode 100644
> index 0000000..acd9a57
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
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
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
> new file mode 100644
> index 0000000..830e6de
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
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
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> new file mode 100644
> index 0000000..3f50d1b
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> @@ -0,0 +1,86 @@
> +DESCRIPTION = "A virtual keyboard for touch-screen based user interfaces"
> +HOMEPAGE = "https://wiki.maliit.org/Main_Page"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
> +
> +inherit autotools qt4x11
> +
> +
> +SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
> +    file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
> +    file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
> +    "
> +
> +SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
> +PV = "0.92.3+git${SRCPV}"
> +
> +
> +PACKAGES =+ "\
> +    ${PN}-gtk \
> +    "
> +
> +# Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
> +
> +RRECOMMENDS_${PN} = "maliit-plugins"
> +
> +
> +FILES_${PN} += "\
> +    ${libdir}/maliit/plugins-*/factories/libmaliit-plugins-quick-factory-*.so \
> +    ${libdir}/qt4/plugins/inputmethods/*.so \
> +    "
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/maliit-framework-tests \
> +    ${libdir}/gtk-*/*/immodules/.debug \
> +    ${libdir}/maliit/plugins-*/factories/.debug \
> +    ${libdir}/qt4/plugins/.debug \
> +    ${libdir}/qt4/plugins/inputmethods/.debug \
> +    "
> +
> +FILES_${PN}-dev += "${datadir}/qt4"
> +
> +FILES_${PN}-gtk +="\
> +    ${bindir}/maliit-exampleapp-gtk* \
> +    \
> +    ${libdir}/gtk-*/*/immodules/libim-maliit.so\
> +    "
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
> +    "
> +
> +do_install() {
> +    cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> +
> +    #Fix absolute paths
> +    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf
> +    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf
> +}
> +
> +
> +
> +# Update the inputmethod modules in gtk
> +pkg_postinst_${PN}-gtk() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +}
> +
> +pkg_postrm_${PN}-gtk() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +}
> +
> +S= "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> new file mode 100644
> index 0000000..932c0ae
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Plugins for a virtual keyboard for touch-screen based user interfaces"
> +HOMEPAGE = "https://wiki.maliit.org/Main_Page"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
> +
> +inherit autotools qt4x11
> +
> +DEPENDS = "maliit-framework"
> +
> +SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
> +
> +SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
> +PV = "0.92.3+git${SRCPV}"
> +
> +EXTRA_QMAKEVARS_PRE = "\
> +    PREFIX=${prefix} \
> +    LIBDIR=${libdir} \
> +    "
> +
> +FILES_${PN} += "\
> +    ${libdir}/maliit \
> +    ${datadir} \
> +    "
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/maliit/plugins-*/.debug \
> +    "
> +
> +S= "${WORKDIR}/git"
> +
> +do_install() {
> +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> +}
> \ No newline at end of file
> --
> 1.7.9.5
>

Ping,

anything wrong with this patch, or is it just a general "before
release stagnation"?


-- 
Regards
Samuel


