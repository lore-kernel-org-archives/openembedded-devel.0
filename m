Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 90A39615AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 15:14:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBCFEur2004292;
	Thu, 12 Dec 2013 09:14:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBCFEu6F021863;
	Thu, 12 Dec 2013 09:14:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Dec 2013 09:14:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBCFEudo007303;
	Thu, 12 Dec 2013 09:14:56 -0600
Date: Thu, 12 Dec 2013 10:14:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20131212151455.GU24180@edge>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
	<1385430478-31824-2-git-send-email-denis@denix.org>
	<20131212144002.GE3717@jama> <20131212144502.GT24180@edge>
	<20131212145825.GF3717@jama>
MIME-Version: 1.0
In-Reply-To: <20131212145825.GF3717@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK tools
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
X-List-Received-Date: Thu, 12 Dec 2013 15:14:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 12, 2013 at 03:58:25PM +0100, Martin Jansa wrote:
> On Thu, Dec 12, 2013 at 09:45:02AM -0500, Denys Dmytriyenko wrote:
> > On Thu, Dec 12, 2013 at 03:40:02PM +0100, Martin Jansa wrote:
> > > On Mon, Nov 25, 2013 at 08:47:57PM -0500, Denys Dmytriyenko wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  recipes-qt/qt5/nativesdk-qt5.inc                   |  12 ++
> > > >  recipes-qt/qt5/nativesdk-qtbase.inc                | 193 +++++++++++++++++++++
> > > >  ...ump-path-length-from-256-to-512-character.patch |  29 ++++
> > > >  ...reserve-built-qmake-and-swap-with-native-.patch |  29 ++++
> > > >  recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb           |   7 +
> > > >  5 files changed, 270 insertions(+)
> > > >  create mode 100644 recipes-qt/qt5/nativesdk-qt5.inc
> > > >  create mode 100644 recipes-qt/qt5/nativesdk-qtbase.inc
> > > >  create mode 100644 recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
> > > >  create mode 100644 recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
> > > >  create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
> > > 
> > > nativesdk-qtbase isn't included in FILESPATH and build fails:
> > 
> > Hmm, is this a change in the master oe-core? Putting patches into qtbase/ will 
> > break older builds, but that can be fixed by extending FILESPATH... If I find 
> > time, I'll try to fix it.
> 
> I was testing it with master, but I think that there is only BPN in
> default FILESPATH for a bit longer (i.e. also in dora).
> 
> FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase-${PV}:"
> 
> seems a bit unnecessary here, because it duplicates default BP.
> 
> Why would adding 2 extra files in qtbase-5.1.1 break other builds? It
> seems as reasonable solution to me.

Because those files won't be picked up by default, as it expects them in 
nativesdk-qtbase. Not sure if I had that issue in dora or in dylan. I still 
have some older dylan-based releases I have to support here... Either way, 
should be easy to fix with proper FILESEXTRAPATHS tweak, once I get time :)


> > > NOTE: recipe nativesdk-qtbase-5.1.1-r0: task do_fetch: Started
> > > WARNING: Failed to fetch URL
> > > file://0001-configure-preserve-built-qmake-and-swap-with-native-.patch,
> > > attempting MIRRORS if available
> > > ERROR: Fetcher failure: Unable to find file
> > > file://0001-configure-preserve-built-qmake-and-swap-with-native-.patch
> > > anywhere. The paths that were searched were:
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/nodistro
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/nodistro
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/nodistro
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/nodistro
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/qemux86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/qemux86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemux86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemux86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/qemuall
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/qemuall
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/qemuall
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/qemuall
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/x86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/x86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/x86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/x86-64
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase-5.1.1/
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qtbase/
> > >     /OE/build/oe-core/meta-qt5/recipes-qt/qt5/files/
> > >     /OE/build/oe-core/downloads
> > > ERROR: Function failed: Fetcher failure for URL:
> > > 'file://0001-configure-preserve-built-qmake-and-swap-with-native-.patch'.
> > > Unable to fetch URL from any source.
> > > ERROR: Logfile of failure stored in:
> > > /OE/build/oe-core/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-qtbase/5.1.1-r0/temp/log.do_fetch.21602
> > > 
> > > 
> > > > 
> > > > diff --git a/recipes-qt/qt5/nativesdk-qt5.inc b/recipes-qt/qt5/nativesdk-qt5.inc
> > > > new file mode 100644
> > > > index 0000000..2eb8c14
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/nativesdk-qt5.inc
> > > > @@ -0,0 +1,12 @@
> > > > +inherit nativesdk qmake5_base
> > > > +
> > > > +# we don't want conflicts with qt4
> > > > +OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
> > > > +OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
> > > > +OE_QMAKE_PATH_DATA = "${OE_QMAKE_PATH_QT_DATA}"
> > > > +OE_QMAKE_PATH_BINS = "${OE_QMAKE_PATH_QT_BINS}"
> > > > +OE_QMAKE_PATH_TRANSLATIONS = "${OE_QMAKE_PATH_QT_TRANSLATIONS}"
> > > > +OE_QMAKE_PATH_DOCS = "${OE_QMAKE_PATH_QT_DOCS}"
> > > > +OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
> > > > +OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
> > > > +OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
> > > > diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> > > > new file mode 100644
> > > > index 0000000..8e9a809
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> > > > @@ -0,0 +1,193 @@
> > > > +DESCRIPTION = "SDK version of Qt/[X11|Mac|Embedded]"
> > > > +DEPENDS = "nativesdk-zlib nativesdk-dbus qtbase-native"
> > > > +SECTION = "libs"
> > > > +HOMEPAGE = "http://qt-project.org"
> > > > +
> > > > +QT_MODULE = "qtbase"
> > > > +
> > > > +require nativesdk-qt5.inc
> > > > +
> > > > +# shared with target version
> > > > +SRC_URI += " \
> > > > +    file://0001-Add-linux-oe-g-platform.patch \
> > > > +    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
> > > > +    file://0003-Add-external-hostbindir-option.patch \
> > > > +    file://0004-qt_functions-temporary-remove-isEmpty-check.patch \
> > > > +    file://0006-Allow-building-a-separate-qmake-for-the-target.patch \
> > > > +    file://0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
> > > > +    file://0008-qt_module-Fix-pkgconfig-replacement.patch \
> > > > +    file://0009-qt_module-Fix-paths-in-.prl-files.patch \
> > > > +    file://0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch \
> > > > +    file://0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
> > > > +    file://0013-Disable-mkv8snapshot.patch \
> > > > +    file://0014-enables-tslib-device-to-be-read-from-env-variable.patch \
> > > > +    file://0015-qtbase-allow-build-of-examples.patch \
> > > > +    file://0021-configure-make-pulseaudio-a-configurable-option.patch \
> > > > +    file://0022-configure-make-alsa-a-configurable-option.patch \
> > > > +    file://0023-configure-make-freetype-a-configurable-option.patch \
> > > > +    file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
> > > > +"
> > > > +
> > > > +# specific for nativesdk version
> > > > +SRC_URI += " \
> > > > +    file://0001-Always-build-uic.patch \
> > > > +    file://0001-configure-preserve-built-qmake-and-swap-with-native-.patch \
> > > > +    file://0001-configure-bump-path-length-from-256-to-512-character.patch \
> > > > +"
> > > > +
> > > > +PACKAGES = "${PN}-tools-dbg ${PN}-tools"
> > > > +
> > > > +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> > > > +
> > > > +FILES_${PN}-tools-dbg = " \
> > > > +    ${OE_QMAKE_PATH_BINS}/.debug \
> > > > +"
> > > > +
> > > > +FILES_${PN}-tools = " \
> > > > +    ${OE_QMAKE_PATH_BINS}/* \
> > > > +"
> > > > +
> > > > +QT_CONFIG_FLAGS += " \
> > > > +    -reduce-relocations \
> > > > +    -shared \
> > > > +    -silent \
> > > > +    -no-pch \
> > > > +    -no-rpath \
> > > > +    -pkg-config \
> > > > +    ${EXTRA_OECONF} \
> > > > +"
> > > > +
> > > > +# qtbase is exception, as these are used as install path for sysroots
> > > > +OE_QMAKE_PATH_HOST_DATA = "${libdir}/${QT_DIR_NAME}"
> > > > +OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
> > > > +
> > > > +do_generate_qt_config_file() {
> > > > +    cat > ${QT_CONF_PATH} <<EOF
> > > > +[Paths]
> > > > +Prefix = ${OE_QMAKE_PATH_PREFIX}
> > > > +Headers = ${OE_QMAKE_PATH_HEADERS}
> > > > +Libraries = ${OE_QMAKE_PATH_LIBS}
> > > > +ArchData = ${OE_QMAKE_PATH_ARCHDATA}
> > > > +Data = ${OE_QMAKE_PATH_DATA}
> > > > +Binaries = ${OE_QMAKE_PATH_BINS}
> > > > +LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
> > > > +Plugins = ${OE_QMAKE_PATH_PLUGINS}
> > > > +Imports = ${OE_QMAKE_PATH_IMPORTS}
> > > > +Qml2Imports = ${OE_QMAKE_PATH_QML}
> > > > +Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
> > > > +Documentation = ${OE_QMAKE_PATH_DOCS}
> > > > +Settings = ${OE_QMAKE_PATH_SETTINGS}
> > > > +Examples = ${OE_QMAKE_PATH_EXAMPLES}
> > > > +Tests = ${OE_QMAKE_PATH_TESTS}
> > > > +HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
> > > > +HostData = ${OE_QMAKE_PATH_HOST_DATA}
> > > > +HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
> > > > +HostSpec = ${OE_QMAKESPEC}
> > > > +TartgetSpec = ${OE_XQMAKESPEC}
> > > > +ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
> > > > +Sysroot =
> > > > +EOF
> > > > +}
> > > > +
> > > > +do_generate_qt_config_file_append() {
> > > > +    cat >> ${QT_CONF_PATH} <<EOF
> > > > +
> > > > +[EffectivePaths]
> > > > +Prefix=..
> > > > +EOF
> > > > +}
> > > > +
> > > > +# qtbase is exception, we need to use mkspecs from ${S}
> > > > +QMAKE_MKSPEC_PATH = "${B}"
> > > > +
> > > > +# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
> > > > +export OE_QMAKE_COMPILER
> > > > +export OE_QMAKE_CC
> > > > +export OE_QMAKE_CFLAGS
> > > > +export OE_QMAKE_CXX
> > > > +export OE_QMAKE_CXXFLAGS
> > > > +export OE_QMAKE_LINK
> > > > +export OE_QMAKE_LDFLAGS
> > > > +export OE_QMAKE_AR
> > > > +export OE_QMAKE_STRIP
> > > > +
> > > > +# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
> > > > +OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
> > > > +OE_QMAKE_QMAKE = "bin/qmake"
> > > > +
> > > > +do_configure() {
> > > > +    # we need symlink in path relative to source, because
> > > > +    # EffectivePaths:Prefix is relative to qmake location
> > > > +    # Also, configure expects qmake-native to swap with real one
> > > > +    if [ ! -e ${B}/bin/qmake-native ]; then
> > > > +        mkdir ${B}/bin
> > > > +        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake-native
> > > > +    fi
> > > > +
> > > > +    ${S}/configure -v \
> > > > +        -dont-process \
> > > > +        -opensource -confirm-license \
> > > > +        -sysroot ${STAGING_DIR_NATIVE} \
> > > > +        -no-gcc-sysroot \
> > > > +        -system-zlib \
> > > > +        -no-libjpeg \
> > > > +        -no-libpng \
> > > > +        -no-gif \
> > > > +        -no-accessibility \
> > > > +        -no-cups \
> > > > +        -no-nis \
> > > > +        -no-gui \
> > > > +        -no-qml-debug \
> > > > +        -no-sql-mysql \
> > > > +        -no-sql-sqlite \
> > > > +        -no-opengl \
> > > > +        -no-openssl \
> > > > +        -no-xcb \
> > > > +        -verbose \
> > > > +        -release \
> > > > +        -prefix ${OE_QMAKE_PATH_PREFIX} \
> > > > +        -bindir ${OE_QMAKE_PATH_BINS} \
> > > > +        -libdir ${OE_QMAKE_PATH_LIBS} \
> > > > +        -datadir ${OE_QMAKE_PATH_DATA} \
> > > > +        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
> > > > +        -docdir ${OE_QMAKE_PATH_DOCS} \
> > > > +        -headerdir ${OE_QMAKE_PATH_HEADERS} \
> > > > +        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
> > > > +        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
> > > > +        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
> > > > +        -importdir ${OE_QMAKE_PATH_IMPORTS} \
> > > > +        -qmldir ${OE_QMAKE_PATH_QML} \
> > > > +        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
> > > > +        -testsdir ${OE_QMAKE_PATH_TESTS} \
> > > > +        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
> > > > +        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
> > > > +        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
> > > > +        -no-glib \
> > > > +        -no-iconv \
> > > > +        -silent \
> > > > +        -nomake examples \
> > > > +        -nomake tests \
> > > > +        -nomake libs \
> > > > +        -no-compile-examples \
> > > > +        -no-rpath \
> > > > +        -platform ${OE_QMAKESPEC} \
> > > > +        -xplatform linux-oe-g++ \
> > > > +        ${QT_CONFIG_FLAGS}
> > > > +
> > > > +    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
> > > > +}
> > > > +
> > > > +do_install() {
> > > > +    # Fix install paths for all
> > > > +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> > > > +
> > > > +    # switch back the proper qmake
> > > > +    rm ${B}/bin/qmake
> > > > +    mv ${B}/bin/qmake-real ${B}/bin/qmake
> > > > +
> > > > +    oe_runmake install INSTALL_ROOT=${D}
> > > > +
> > > > +    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
> > > > +    # e.g. qt3d, qtwayland
> > > > +    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> > > > +}
> > > > diff --git a/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
> > > > new file mode 100644
> > > > index 0000000..3b312b6
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
> > > > @@ -0,0 +1,29 @@
> > > > +From 9500744fee36c908d0cb7e034f8c8dd3dd1c4fa4 Mon Sep 17 00:00:00 2001
> > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > +Date: Mon, 11 Nov 2013 20:27:30 -0500
> > > > +Subject: [PATCH] configure: bump path length from 256 to 512 characters
> > > > +
> > > > +Increase the path length that gets hardcoded into generated config.cpp file
> > > > +from 256 to 512 characters, as nativesdk path can be quite long.
> > > > +
> > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > +---
> > > > + configure | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/configure b/configure
> > > > +index 304d30f..a37a587 100755
> > > > +--- a/configure
> > > > ++++ b/configure
> > > > +@@ -3870,7 +3870,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
> > > > + static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
> > > > + 
> > > > + /* Installation Info */
> > > > +-static const char qt_configure_prefix_path_strs[][256 + 12] = {
> > > > ++static const char qt_configure_prefix_path_strs[][512 + 12] = {
> > > > +     "qt_prfxpath=$QT_INSTALL_PREFIX",
> > > > +     "qt_docspath=$QT_INSTALL_DOCS",
> > > > +     "qt_hdrspath=$QT_INSTALL_HEADERS",
> > > > +-- 
> > > > +1.8.3.2
> > > > +
> > > > diff --git a/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
> > > > new file mode 100644
> > > > index 0000000..048eab7
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
> > > > @@ -0,0 +1,29 @@
> > > > +From 6cd7ade28662730e5de89a171501e3902b321ffc Mon Sep 17 00:00:00 2001
> > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > +Date: Mon, 11 Nov 2013 20:22:34 -0500
> > > > +Subject: [PATCH] configure: preserve built qmake and swap with native one
> > > > +
> > > > +Let configure script build the real qmake, but right after it's built, swap
> > > > +it with a native qmake for further internal use, preserving the real one.
> > > > +
> > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > +---
> > > > + configure | 2 ++
> > > > + 1 file changed, 2 insertions(+)
> > > > +
> > > > +diff --git a/configure b/configure
> > > > +index 140c7b4..304d30f 100755
> > > > +--- a/configure
> > > > ++++ b/configure
> > > > +@@ -4104,6 +4104,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> > > > + 
> > > > +     (cd "$outpath/qmake"; "$MAKE") || exit 2
> > > > + fi # Build qmake
> > > > ++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
> > > > ++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
> > > > + 
> > > > + echo "Running configuration tests..."
> > > > + 
> > > > +-- 
> > > > +1.8.3.2
> > > > +
> > > > diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb b/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
> > > > new file mode 100644
> > > > index 0000000..6e4f488
> > > > --- /dev/null
> > > > +++ b/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
> > > > @@ -0,0 +1,7 @@
> > > > +require qt5-${PV}.inc
> > > > +require ${PN}.inc
> > > > +
> > > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase-${PV}:"
> > > > +
> > > > +SRC_URI[md5sum] = "955d1e4da875f3872ef3208f21a757dd"
> > > > +SRC_URI[sha256sum] = "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03b661029a1ffa75c9"
> > > > -- 
> > > > 1.8.3.2
> > > > 
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> > > -- 
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > 
> > 
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



