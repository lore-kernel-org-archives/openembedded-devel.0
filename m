Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 430D871E61
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:11:38 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2444495pdj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lFp8KduV1mCcus26z+vboj0iv43xS2nt+dtDmM5AaSI=;
	b=R11Ji/ll9TR51y09CJ+71uRRULKhoCUk6lwcQl8YtPpOZGi/qGFP+XmATvLL+Z6drs
	MquiJczSXoPnbtIUc7VM+CL/VqzpyM47WBMZwf4mfQjvaIG07E9H0tLM63gmuhqJukom
	OdJWWSOEJVGY5Clc55F4UdNRojleJH9ESTIWIcMDtjCOOHKog9rhJ+KPK7Cdxb/j4UoX
	N7wsW+OzaKri2PqJZG0DqMKyS1Wc5XVX8LImRZo1ZecGIANH2e0NIlWd25UQIUerDB6y
	cKZ8LTGq/2mJobKRurygM6LVI2n1ud0GNU2Lw46A4IJP3pKMv+EpCYmQqyJROnX1esjL
	c/aA==
MIME-Version: 1.0
X-Received: by 10.66.124.137 with SMTP id mi9mr5361859pab.144.1423152700301;
	Thu, 05 Feb 2015 08:11:40 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Thu, 5 Feb 2015 08:11:40 -0800 (PST)
In-Reply-To: <CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
Date: Thu, 5 Feb 2015 17:11:40 +0100
Message-ID: <CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Thu, 05 Feb 2015 16:11:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2015 at 4:18 PM, Raphael Philipe <rapphil@gmail.com> wrote:
> Hi
>
> I tried your recipe and got a QA error:
> ERROR: QA Issue: qt5-creator: The compile log indicates that host
> include and/or library paths were used.
>          Please check the log
> '/home/rapphil/work/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-=
poky-linux-gnueabi/qt5-creator/3.3.0-r0/temp/log.do_compile'
> for more information. [compile-host-path]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/rapphil/work/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-p=
oky-linux-gnueabi/qt5-creator/3.3.0-r0/temp/log.do_package_qa.903
> ERROR: Task 10 (/home/rapphil/work/fsl-community-bsp/sources/meta-qt5/rec=
ipes-qt/qt5/qt5-creator_3.3.0.bb,
> do_package_qa) failed with exit code '1'
>
> For instance, this was my build config:
>
> Build Configuration:
> BB_VERSION        =3D "1.25.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-14.04"
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> MACHINE           =3D "wandboard-solo"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.7"
> TUNE_FEATURES     =3D "arm armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "(nobranch):d8f0011c23a6b8441323974acc70b08c81cfefb=
d"
> meta-oe
> meta-multimedia
> meta-ruby         =3D "(nobranch):9c926ef2d463e643fb0dc87f6535a12e35d039a=
b"
> meta-fsl-arm      =3D "(nobranch):95e0861135ffa5f42828d9419788b3db9946861=
f"
> meta-fsl-arm-extra =3D "(nobranch):9c3dc2a63f637319d877e8fecba3ed7197f44d=
43"
> meta-fsl-demos    =3D "(nobranch):2f6972264d194417610a9c43217c8f972da43e4=
8"
> meta-qt5          =3D "master-next:c835fc7acc5e0b9e3da9903f3f59e3ead86c8a=
8d"
>
> Regards,
> Raphael Silva.
>
>
> On Tue, Jan 27, 2015 at 3:53 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> * this is the first version which dropped qt4 support
>> * rename recipe to avoid conflicts with meta-oe's qt-creator
>> * Desktop file was based on [1]
>>
>> [1] http://pkgs.fedoraproject.org/cgit/qt-creator.git/tree/qtcreator.des=
ktop
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  ...t-creator-to-build-on-arm-aarch32-and-aar.patch | 94 +++++++++++++++=
+++++++
>>  recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    | 10 +++
>>  recipes-qt/qt5/qt5-creator_3.3.0.bb                | 87 +++++++++++++++=
+++++
>>  3 files changed, 191 insertions(+)
>>  create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator=
-to-build-on-arm-aarch32-and-aar.patch
>>  create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
>>  create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb
>>
>> diff --git a/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-bui=
ld-on-arm-aarch32-and-aar.patch b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow=
-qt-creator-to-build-on-arm-aarch32-and-aar.patch
>> new file mode 100644
>> index 0000000..3ed8bc4
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-a=
rm-aarch32-and-aar.patch
>> @@ -0,0 +1,94 @@
>> +From 748174788b318c6316e6d41ce323306120223e02 Mon Sep 17 00:00:00 2001
>> +From: Greg Nietsky <gregory@distrotech.co.za>
>> +Date: Tue, 4 Mar 2014 11:33:40 +0200
>> +Subject: [PATCH 1/2] Fix: Allow qt-creator to build on arm aarch32 and =
aarch64
>> +
>> +Botan is imported hardwired for x86 this small patch allows it
>> +too operate on arm other platforms could be added.
>> +
>> +Task-number: QTCREATORBUG-8107
>> +Change-Id: Iddea28f21c9fa1afd2fdd5d16a44e6c96a516a7a
>> +---
>> + src/libs/3rdparty/botan/botan.cpp | 16 +++++++++++++++-
>> + src/libs/3rdparty/botan/botan.h   |  2 ++
>> + 2 files changed, 17 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/bota=
n/botan.cpp
>> +index b7a9ddf..c5b9826 100644
>> +--- a/src/libs/3rdparty/botan/botan.cpp
>> ++++ b/src/libs/3rdparty/botan/botan.cpp
>> +@@ -1101,6 +1101,8 @@ class Montgomery_Exponentiator : public Modular_E=
xponentiator
>> +
>> + #if (BOTAN_MP_WORD_BITS !=3D 32)
>> +    #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS =3D=3D=
 32
>> ++#elif !defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
>> ++typedef Botan::u64bit dword;
>> + #endif
>> +
>> + #ifdef Q_OS_UNIX
>> +@@ -1118,6 +1120,7 @@ extern "C" {
>> + */
>> + inline word word_madd2(word a, word b, word* c)
>> +    {
>> ++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
>> +    asm(
>> +       ASM("mull %[b]")
>> +       ASM("addl %[c],%[a]")
>> +@@ -1127,6 +1130,11 @@ inline word word_madd2(word a, word b, word* c)
>> +       : "0"(a), "1"(b), [c]"g"(*c) : "cc");
>> +
>> +    return a;
>> ++#else
>> ++   dword z =3D (dword)a * b + *c;
>> ++   *c =3D (word)(z >> BOTAN_MP_WORD_BITS);
>> ++   return (word)z;
>> ++#endif
>> +    }
>> +
>> + /*
>> +@@ -1134,6 +1142,7 @@ inline word word_madd2(word a, word b, word* c)
>> + */
>> + inline word word_madd3(word a, word b, word c, word* d)
>> +    {
>> ++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
>> +    asm(
>> +       ASM("mull %[b]")
>> +
>> +@@ -1147,6 +1156,11 @@ inline word word_madd3(word a, word b, word c, w=
ord* d)
>> +       : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
>> +
>> +    return a;
>> ++#else
>> ++   dword z =3D (dword)a * b + c + *d;
>> ++   *d =3D (word)(z >> BOTAN_MP_WORD_BITS);
>> ++   return (word)z;
>> ++#endif
>> +    }
>> +
>> + }
>> +@@ -2315,7 +2329,7 @@ namespace Botan {
>> +
>> + extern "C" {
>> +
>> +-#ifdef Q_OS_UNIX
>> ++#if defined(Q_OS_UNIX) && defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
>> + /*
>> + * Helper Macros for x86 Assembly
>> + */
>> +diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/=
botan.h
>> +index 2981d2c..1c8d828 100644
>> +--- a/src/libs/3rdparty/botan/botan.h
>> ++++ b/src/libs/3rdparty/botan/botan.h
>> +@@ -82,7 +82,9 @@
>> + #endif
>> +
>> + #define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
>> ++#if !defined(__arm__) && !defined(__aarch64__)
>> + #define BOTAN_TARGET_CPU_IS_X86_FAMILY
>> ++#endif
>> + #define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
>> +
>> + #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
>> +--
>> +1.8.3.1
>> +
>> diff --git a/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in b/recipes-q=
t/qt5/qt5-creator/qtcreator.desktop.in
>> new file mode 100644
>> index 0000000..64f7c6b
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
>> @@ -0,0 +1,10 @@
>> +[Desktop Entry]
>> +Type=3DApplication
>> +Exec=3Dsh -c "PATH=3D$PATH:@QT5_QMAKE@ qtcreator %F"
>> +Name=3DQt Creator
>> +GenericName=3DC++ IDE for developing Qt applications
>> +X-KDE-StartupNotify=3Dtrue
>> +Icon=3DQtProject-qtcreator
>> +Terminal=3Dfalse
>> +Categories=3DDevelopment;IDE;Qt;
>> +MimeType=3Dtext/x-c++src;text/x-c++hdr;text/x-xsrc;application/x-design=
er;application/vnd.nokia.qt.qmakeprofile;application/vnd.nokia.xml.qt.resou=
rce;
>> diff --git a/recipes-qt/qt5/qt5-creator_3.3.0.bb b/recipes-qt/qt5/qt5-cr=
eator_3.3.0.bb
>> new file mode 100644
>> index 0000000..76f9982
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qt5-creator_3.3.0.bb
>> @@ -0,0 +1,87 @@
>> +SUMMARY =3D "Qt Creator is a new cross-platform Qt IDE"
>> +
>> +# Note:
>> +# The toolchain auto detection does not work completely yet. To compile=
/debug
>> +# open menu 'Tools/Options and select 'Build & Run'. In tab 'Kits' sele=
ct 'Desktop'
>> +# 'Compiler/Manage...' and add local gcc'. At 'Debugger' select
>> +# 'System GDB at /usr/bin/gdb.
>> +
>> +HOMEPAGE =3D "https://qt-project.org/"
>> +LICENSE =3D "LGPLv2.1 | GPLv3"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://LGPL_EXCEPTION.TXT;md5=3Deb6c371255e1262c55ae9b652a90b528 \
>> +    file://LICENSE.LGPLv21;md5=3D243b725d71bb5df4a1e5920b344b86ad \
>> +    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
>> +"
>> +
>> +inherit qmake5
>> +
>> +DEPENDS =3D "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdecla=
rative qttools qttools-native qtsvg"
>> +
>> +SRC_URI =3D " \
>> +    http://download.qt.io/official_releases/qtcreator/3.3/${PV}/qt-crea=
tor-opensource-src-${PV}.tar.gz \
>> +    file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.pa=
tch \
>> +    file://qtcreator.desktop.in \
>> +"
>> +SRC_URI[md5sum] =3D "5e33988908282c779f2e6e4dca2bba3e"
>> +SRC_URI[sha256sum] =3D "27a5c8815fab95f959134047f8315686de4de6f99b0bedf=
d46b5dedae390525a"
>> +
>> +S =3D "${WORKDIR}/qt-creator-opensource-src-${PV}"
>> +
>> +EXTRA_QMAKEVARS_PRE +=3D "IDE_LIBRARY_BASENAME=3D${baselib}/${QT_DIR_NA=
ME}"
>> +
>> +do_configure_prepend() {
>> +    # causes gcc infinite loop with 4.9.x for arm targets similar to
>> +    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61033
>> +    export DO_NOT_BUILD_QMLDESIGNER=3D1
>> +}
>> +
>> +do_configure_append() {
>> +    # Find native tools
>> +    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}/${Q=
T_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
>> +    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}/${QT_DI=
R_NAME}/qdoc:g' ${B}/Makefile
>> +
>> +    # see qtbase-native.inc
>> +    # sed -i 's:QT_INSTALL_DOCS=3D${docdir}:QT_INSTALL_DOCS=3D${STAGING=
_DATADIR_NATIVE}/${QT_DIR_NAME}/doc:g' ${B}/Makefile
>> +}
>> +
>> +do_compile_append() {
>> +    # build docs
>> +    #oe_runmake docs_online
>> +}
>> +
>> +do_install() {
>> +    oe_runmake install INSTALL_ROOT=3D${D}${prefix}
>> +    oe_runmake install_inst_qch_docs INSTALL_ROOT=3D${D}${prefix}
>> +    # install desktop and ensure that qt-creator finds qmake
>> +    install -d ${D}${datadir}/applications
>> +    install -m 0644 ${WORKDIR}/qtcreator.desktop.in ${D}${datadir}/appl=
ications/qtcreator.desktop
>> +    sed -i 's:@QT5_QMAKE@:${bindir}/${QT_DIR_NAME}:g' ${D}${datadir}/ap=
plications/qtcreator.desktop
>> +}
>> +
>> +FILES_${PN} +=3D " \
>> +    ${datadir}/qtcreator \
>> +    ${datadir}/icons \
>> +    ${libdir}/${QT_DIR_NAME}/qtcreator \
>> +"
>> +FILES_${PN}-dbg +=3D " \
>> +    ${libdir}/${QT_DIR_NAME}/qtcreator/.debug \
>> +    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/.debug \
>> +    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
>> +"
>> +
>> +FILES_${PN}-dev +=3D " \
>> +    ${libdir}/${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
>> +"
>> +
>> +RDEPENDS_${PN} +=3D "perl"
>> +RCONFLICTS_${PN} =3D "qt-creator"
>> +
>> +# To give best user experience out of the box..
>> +RRECOMMENDS_${PN} +=3D " \
>> +    packagegroup-qt5-toolchain-target \
>> +    binutils \
>> +    ccache \
>> +    gcc-symlinks \
>> +    gdb \
>> +"
>> --
>> 1.8.3.1
>>
Can you send me log.do_compile so I can see what the culprit is.

Andreas

