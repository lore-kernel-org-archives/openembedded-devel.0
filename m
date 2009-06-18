Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHJwz-0007Si-Hs
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 17:54:53 +0200
Received: (qmail 26476 invoked by uid 107); 18 Jun 2009 15:44:18 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 18 Jun 2009 17:44:18 +0200
Message-ID: <4A3A60D2.506@epfl.ch>
Date: Thu, 18 Jun 2009 17:44:18 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20090603151754.GI26065@smtp.west.cox.net>	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-12-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-13-git-send-email-ihar.hrachyshka@gmail.com>
In-Reply-To: <1244043442-3868-13-git-send-email-ihar.hrachyshka@gmail.com>
Subject: Re: [PATCH 12/12] task-qte-toolchain: added mkspecs and new qt4-tools-sdk recipe
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
X-List-Received-Date: Thu, 18 Jun 2009 15:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> Added mkspecs, qt4-tools to toolchain tasks (now meta-toolchain-qte
> works ok).
> 
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  recipes/qt4/qt4-tools-sdk_4.5.1.bb       |   72 ++++++++++++++++++++++++++++++
>  recipes/tasks/task-qte-toolchain-host.bb |    2 +
>  2 files changed, 74 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/qt4/qt4-tools-sdk_4.5.1.bb
> 
> diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
> new file mode 100644
> index 0000000..db919fd
> --- /dev/null
> +++ b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
> @@ -0,0 +1,72 @@
> +DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> +DEPENDS = "zlib-native dbus-native"
> +SECTION = "libs"
> +HOMEPAGE = "http://www.trolltech.com"
> +PRIORITY = "optional"
> +LICENSE = "GPL"
> +
> +inherit sdk
> +
> +SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
> +           file://configure-lflags.patch;patch=1 \
> +           file://qt-config.patch;patch=1 \
> +           file://g++.conf \
> +           file://linux.conf"
> +S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
> +
> +# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
> +EXTRA_OECONF = "-prefix ${prefix} \
> +                -qt-libjpeg -qt-gif -system-zlib \
> +                -no-libjpeg -no-libpng \
> +                -no-accessibility \
> +                -no-cups \
> +                -no-exceptions  \
> +                -no-nas-sound \
> +                -no-nis \
> +                -verbose -release -fast -static \
> +                -qt3support \
> +                -I${STAGING_DIR_NATIVE}/usr/include \
> +                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
> +                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
> +
> +# yank default -e, otherwise we get the following error:
> +# moc_qbuffer.cpp: No such file or directory
> +EXTRA_OEMAKE = " "
> +
> +do_configure() {
> +   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
> +}
> +
> +TOBUILD = "\
> +  src/tools/bootstrap \
> +  src/tools/moc \
> +  src/corelib \
> +  src/sql \
> +  src/dbus \
> +  src/qt3support \
> +  src/xml \
> +  src/tools/uic \
> +  src/tools/rcc \
> +  src/network \
> +  src/gui \
> +  src/tools/uic3 \
> +  tools/linguist/lrelease \
> +  tools/linguist/lupdate \
> +  tools/qdbus \
> +"
> +
> +do_compile() {
> +    for i in ${TOBUILD}; do
> +        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
> +    done
> +}
> +
> +do_stage() {
> +    install -d ${STAGING_BINDIR_NATIVE}/
> +    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2

Why it qmake renamed to qmake2 ? I know it's its version (current is 
2.0a), but this makes the fail the FindQt4 module in cmake (which 
heavily relies on qmake !). See below:

FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 PATHS

Having it named qmake4, just like the other qt tools below should allow 
this cmake module to find it.

> +    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
> +        install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
> +    done
> +}
> +
> +
> diff --git a/recipes/tasks/task-qte-toolchain-host.bb b/recipes/tasks/task-qte-toolchain-host.bb
> index 2a9b652..02c95a3 100644
> --- a/recipes/tasks/task-qte-toolchain-host.bb
> +++ b/recipes/tasks/task-qte-toolchain-host.bb
> @@ -3,3 +3,5 @@ require task-sdk-host.bb
>  DESCRIPTION = "Host packages for Qt Embedded SDK"
>  LICENSE = "MIT"
>  ALLOW_EMPTY = "1"
> +
> +RDEPENDS_${PN} += "qt4-tools-sdk"


-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


