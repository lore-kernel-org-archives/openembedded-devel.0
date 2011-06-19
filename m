Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QYDuo-0004jC-R8 for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 11:03:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QYDrR-0001cS-TF for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 11:00:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2011 11:00:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2011 11:00:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 19 Jun 2011 10:57:21 +0200
Message-ID: <itkdlh$801$1@dough.gmane.org>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
	<6b59e5c689dd1963371df90cc749d2f7c5b969da.1308417391.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <6b59e5c689dd1963371df90cc749d2f7c5b969da.1308417391.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] [PATCH 2/3] qmake2: remove qmake2 recipe
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
X-List-Received-Date: Sun, 19 Jun 2011 09:03:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-06-11 20:57, Paul Eggleton wrote:
> This is a leftover from oe-dev and is not needed by anything in meta-oe -
> qmake is being build as part of qt4-tools-native.

I'm going to drop this patch, since we still need it for the target
qmake binary.

regards,

Koen

> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf  |    1 -
>  meta-oe/recipes-qt/qt4/qmake2.inc                  |   69 --------------------
>  meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf  |    1 -
>  meta-oe/recipes-qt/qt4/qmake2_2.10a.bb             |   60 -----------------
>  4 files changed, 0 insertions(+), 131 deletions(-)
>  delete mode 100644 meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
>  delete mode 100644 meta-oe/recipes-qt/qt4/qmake2.inc
>  delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
>  delete mode 100644 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
> 
> diff --git a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
> deleted file mode 100644
> index f58481a..0000000
> --- a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
> +++ /dev/null
> @@ -1 +0,0 @@
> -include(../linux-g++/qmake.conf)
> diff --git a/meta-oe/recipes-qt/qt4/qmake2.inc b/meta-oe/recipes-qt/qt4/qmake2.inc
> deleted file mode 100644
> index f2631b5..0000000
> --- a/meta-oe/recipes-qt/qt4/qmake2.inc
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -DESCRIPTION = "TrollTech Makefile Generator"
> -PRIORITY = "optional"
> -HOMEPAGE = "http://www.trolltech.com"
> -SECTION = "devel"
> -LICENSE = "GPL"
> -PR = "r12"
> -
> -# We call 'moc' during the build 
> -DEPENDS = "qt4-tools-native"
> -
> -QTVER = "qt-embedded-linux-opensource-src-${QTVERSION}"
> -
> -SRC_URI = "ftp://ftp.trolltech.com/qt/source/${QTVER}.tar.bz2 \
> -           file://0001-fix-mkspecs.patch \
> -           file://qt-config.patch \
> -           file://use-lflags-last.patch \
> -           file://linux-oe-qmake.conf"
> -S = "${WORKDIR}/${QTVER}"
> -
> -inherit autotools  
> -
> -CROSSHACK = "true"
> -CROSSHACK_virtclass-native = ""
> -CROSSHACK_virtclass-nativesdk = ""
> -
> -export CROSSHACK
> -export QTDIR = "${S}"
> -EXTRA_OEMAKE = "-e"
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -do_configure() {
> -
> -    # Make sure we regenerate all Makefiles 
> -    find ${S} -name "Makefile" | xargs rm
> -    # Install the OE build templates
> -    for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibceabi-oe-g++
> -    do
> -        install -d ${S}/mkspecs/$template
> -        install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
> -        ln -sf ../linux-g++/qplatformdefs.h ${S}/mkspecs/$template/qplatformdefs.h
> -    done
> -
> -    QMAKESPEC=
> -    PLATFORM=${HOST_OS}-oe-g++
> -    export PLATFORM
> -    export OE_QMAKE_CC="${CC}"
> -    export OE_QMAKE_CFLAGS="${CFLAGS}"
> -    export OE_QMAKE_CXX="${CXX}"
> -    export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti ${CXXFLAGS}"
> -    export OE_QMAKE_LDFLAGS="${LDFLAGS}"
> -    export OE_QMAKE_LINK="${CCLD}"
> -    export OE_QMAKE_AR="${AR}"
> -    export OE_QMAKE_STRIP="${STRIP}"
> -    export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic4"
> -    export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
> -    export QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
> -    export OE_QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
> -    export QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
> -    export OE_QMAKE_QMAKE="${STAGING_BINDIR_NATIVE}/qmake"
> -    export OE_QMAKE_RPATH="-Wl,-rpath-link,"
> -    echo yes | ./configure -prefix ${STAGING_DIR_NATIVE}/qt4 ${EXTRA_OECONF} || die "Configuring qt failed"
> -}
> -
> -do_compile() {
> -    :
> -}
> -
> -FILES_${PN} += "${datadir}/qt4/"
> diff --git a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
> deleted file mode 100644
> index f58481a..0000000
> --- a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
> +++ /dev/null
> @@ -1 +0,0 @@
> -include(../linux-g++/qmake.conf)
> diff --git a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb b/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
> deleted file mode 100644
> index 3602a7f..0000000
> --- a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -QTVERSION="4.4.3"
> -FILESDIR += "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qmake2"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -require ${PN}.inc
> -
> -SRC_URI += "file://qmake-hack.diff"
> -
> -do_install() {
> -    install -d ${D}/${bindir}
> -    install -m 0755 bin/qmake ${D}/${bindir}/qmake2
> -    install -m 0755 bin/qmake ${D}/${bindir}/qmake-qt4
> -    install -d ${D}/${datadir}/qt4
> -    install -d ${D}/${datadir}/qtopia
> -
> -    script="${D}/${datadir}/qtopia/environment-setup"
> -    touch $script
> -    echo 'export QT_DIR_NAME=qtopia' >> $script
> -    echo 'export QT_LIBINFIX=E' >> $script
> -    echo 'export OE_QMAKE_AR=ar' >> $script
> -    echo 'export OE_QMAKE_CC=gcc' >> $script
> -    echo 'export OE_QMAKE_CXX=g++' >> $script
> -    echo 'export OE_QMAKE_LINK=g++' >> $script
> -    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
> -    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qtopia' >> $script
> -    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
> -    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
> -    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
> -    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
> -    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
> -    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
> -    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qtopia/mkspecs/qconfig.pri' >> $script
> -    echo 'export QMAKESPEC=${datadir}/qtopia/mkspecs/linux-g++' >> $script
> -
> -    script="${D}/${datadir}/qt4/environment-setup"
> -    touch $script
> -    echo 'export OE_QMAKE_AR=ar' >> $script
> -    echo 'export OE_QMAKE_CC=gcc' >> $script
> -    echo 'export OE_QMAKE_CXX=g++' >> $script
> -    echo 'export OE_QMAKE_LINK=g++' >> $script
> -    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
> -    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qt4' >> $script
> -    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
> -    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
> -    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
> -    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
> -    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
> -    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
> -    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qt4/mkspecs/qconfig.pri' >> $script
> -    echo 'export QMAKESPEC=${datadir}/qt4/mkspecs/linux-g++' >> $script
> -
> -    chmod 0755 ${D}${datadir}/qt*/environment-setup
> -}
> -
> -FILES_${PN} += "${datadir}/qt*/environment-setup"
> -
> -
> -SRC_URI[md5sum] = "9a639aec44a1e4c70040117183d247a3"
> -SRC_URI[sha256sum] = "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN/bnxMkyGM64RGpERAtVqAJoDlASSWEvn+wk3qoBLCEyefetl8ACeO/k2
Q7HnuLnfxfKxr7wYu9TbhnA=
=QryC
-----END PGP SIGNATURE-----



