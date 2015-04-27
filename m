Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAA465CD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:37:50 +0000 (UTC)
Received: by pdea3 with SMTP id a3so141840247pde.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4kuM8+11boMenFCrB5kaApMSQuWDnt0CPmAJy8QIbVI=;
	b=lx1MUBOUK+FKxDSiVLH6pwCO8wc+NmlxW0arvDV+csNJ4KZFT/0Z8KdP8N1e1eIkWS
	rPou+SlplFhoWxdl1GoZGld2xEO/99JTdY9s3qJtMw49H81mdwEIriWOFhR/VfGBMTzh
	r+jkUHQNbe8SpjWD+LGqBOd8vsNCgYvwIuuEDhSFV5IAp79BoG4b5TpeRdd6kt6Fl3LK
	QJXfriBqsFf1cer+PpsuOtCXJZxoBbfGRd5K9qdmgep7d7id6dQdq3/SwCgDv5D4jF7U
	C8yEUUQLk5DNzGfGVwje+YNsvgXAQmNDGHsGe0DKZTTmpkQoWTqNLGloA9pogJplh2Cl
	tQiw==
X-Received: by 10.70.90.231 with SMTP id bz7mr25662359pdb.15.1430170672238;
	Mon, 27 Apr 2015 14:37:52 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:8901:4653:e92:c56a?
	([2601:9:500:ece:8901:4653:e92:c56a])
	by mx.google.com with ESMTPSA id ym6sm7787937pac.32.2015.04.27.14.37.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 14:37:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
Date: Mon, 27 Apr 2015 14:37:50 -0700
Message-Id: <DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 21:37:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 27, 2015, at 1:33 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Looks like some regressions may have crept back relative previous
> versions of the patch?
>=20
>  - dubious indent in do_install()
>  - .pak files being installed as executables
>  - dev-so INSANE_SKIP shouldn't be requied
>=20

Thanks for bringing it up. I will send a followup to fix it =
incrementally.

>=20
> On Mon, Apr 27, 2015 at 9:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> CEF is a framework to embed chromium based browsers into other
>> applications
>>=20
>> Change-Id: Ieabae43042101331f67cf6e673391f6fe320561f
>> Signed-off-by: pnandyala <Pavan.Nandyala@LntTechservices.com>
>> Signed-off-by: knagabhirava =
<kalyankumar.nagabhirava@lnttechservices.com>
>> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../cef3/01_get_svn_version_from_LASTCHANGE.patch  |  25 ++
>> recipes-browser/chromium/cef3_280796.bb            |  50 ++++
>> recipes-browser/chromium/chromium.inc              | 251 =
+++++++--------------
>> recipes-browser/chromium/chromium_40.0.2214.91.bb  | 163 =
+++++++++++++
>> 4 files changed, 320 insertions(+), 169 deletions(-)
>> create mode 100644 =
recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>> create mode 100644 recipes-browser/chromium/cef3_280796.bb
>>=20
>> diff --git =
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch =
b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>> new file mode 100644
>> index 0000000..61f88b4
>> --- /dev/null
>> +++ =
b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>> @@ -0,0 +1,25 @@
>> +diff --git a/cef/tools/make_version_header.py =
b/cef/tools/make_version_header.py
>> +index 84d49f5..395c2cf 100644
>> +--- a/cef/tools/make_version_header.py
>> ++++ b/cef/tools/make_version_header.py
>> +@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version, =
cef_version, cpp_header_dir):
>> +       revision =3D svn.get_revision()
>> +     elif git.is_checkout('.'):
>> +       revision =3D git.get_svn_revision()
>> ++    elif os.path.isfile("../build/util/LASTCHANGE"):
>> ++      revision =3D =
open("../build/util/LASTCHANGE").read().split("=3D")[1].strip()
>> +     else:
>> +       raise Exception('Not a valid checkout')
>> +
>> +diff --git a/cef/tools/revision.py b/cef/tools/revision.py
>> +index 1d94602..eb89e3b 100644
>> +--- a/cef/tools/revision.py
>> ++++ b/cef/tools/revision.py
>> +@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
>> +   sys.stdout.write(svn.get_revision())
>> + elif os.path.exists(os.path.join('.', '.git')):
>> +   sys.stdout.write(git.get_svn_revision())
>> ++elif os.path.isfile("../build/util/LASTCHANGE"):
>> ++  revision =3D =
open("../build/util/LASTCHANGE").read().split("=3D")[1].strip()
>> + else:
>> +   raise Exception('Not a valid checkout')
>> diff --git a/recipes-browser/chromium/cef3_280796.bb =
b/recipes-browser/chromium/cef3_280796.bb
>> new file mode 100644
>> index 0000000..9ca5810
>> --- /dev/null
>> +++ b/recipes-browser/chromium/cef3_280796.bb
>> @@ -0,0 +1,50 @@
>> +DESCRIPTION =3D "Chromium Embedded Framework"
>> +
>> +include chromium.inc
>> +
>> +RDEPENDS_${PN} +=3D "pango cairo fontconfig pciutils pulseaudio =
freetype fontconfig-utils"
>> +
>> +SRCREV_tools =3D "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
>> +SRCREV_cef =3D "bbad53dfca9f98dddcb31a590410fece0a4f0234"
>> +SRCREV_egl =3D "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
>> +SRCREV_FORMAT =3D "cef_egl_tools"
>> +
>> +SRC_URI =3D =
"http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${=
PV}.tar.xz \
>> +           =
git://github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsuffix=3D=
src/cef;branch=3Daura;name=3Dcef \
>> +           =
git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3Dsrc/u=
i/ozone/platform/egl;branch=3Dmaster;name=3Degl \
>> +           =
git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=3D=
https;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools \
>> +           file://01_get_svn_version_from_LASTCHANGE.patch \
>> +         "
>> +SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
>> +SRC_URI[sha256sum] =3D =
"f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
>> +
>> +S =3D "${WORKDIR}/chromium_rev_${PV}"
>> +
>> +do_fetch[vardeps] +=3D "SRCREV_FORMAT SRCREV_cef SRCREV_egl =
SRCREV_tools"
>> +
>> +GYP_ARCH_DEFINES_armv7a =3D " target_arch=3Darm arm_float_abi=3Dhard"
>> +GYP_ARCH_DEFINES_i586 =3D " target_arch=3Dia32"
>> +
>> +export GYP_GENERATORS=3D"ninja"
>> +export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
>> +export GYP_DEFINES=3D"${GYP_ARCH_DEFINES} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>> +
>> +do_configure_append() {
>> +       export PATH=3D${WORKDIR}/depot_tools:"$PATH"
>> +       # End of LD Workaround
>> +       #-----------------------
>> +       # Configure cef
>> +       #------------------------
>> +       cd cef
>> +       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../
>> +       cd -
>> +}
>> +
>> +# Workaround to disable qa_configure
>> +do_qa_configure() {
>> +       echo "do_qa_configure"
>> +}
>> +
>> +do_compile() {
>> +       ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
>> +}
>> diff --git a/recipes-browser/chromium/chromium.inc =
b/recipes-browser/chromium/chromium.inc
>> index ad976f9..96d16fa 100644
>> --- a/recipes-browser/chromium/chromium.inc
>> +++ b/recipes-browser/chromium/chromium.inc
>> @@ -1,114 +1,14 @@
>> -# Recipe files have to perform the following tasks after including =
this file:
>> -# 1) Add patches to SRC_URI. Version specific patches should be =
contained in a
>> -#    "chromium-XX" subdirectory, where XX is the major version. =
There are also
>> -#    patches that are shared amongst versions but may one day no =
longer be
>> -#    needed (like unistd2.patch). These do not belong in such a =
subdirectory,
>> -#    but still need to be explicitely be added. Do NOT add =
ozone-wayland patches
>> -#    to SRC_URI here!
>> -# 2) Add md5sum and sha256sum hashes of the tarball.
>> -# 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES =
variable.
>> -#    The rule with the chromium-XX subdirectory also applies here.
>> -# 4) Set the OZONE_WAYLAND_GIT_BRANCH and OZONE_WAYLAND_GIT_SRCREV =
values.
>> -# 5) Optionally, set values for these variables:
>> -#    * OZONE_WAYLAND_PATCH_FILE_GLOB
>> -#    * CHROMIUM_X11_DEPENDS
>> -#    * CHROMIUM_X11_GYP_DEFINES
>> -#    * CHROMIUM_WAYLAND_DEPENDS
>> -#    * CHROMIUM_WAYLAND_GYP_DEFINES
>> -
>> -DESCRIPTION =3D "Chromium browser"
>> LICENSE =3D "BSD"
>> -DEPENDS =3D "xz-native pciutils pulseaudio cairo nss zlib-native =
libav libgnome-keyring cups ninja-native gconf libexif pango libdrm"
>> -SRC_URI =3D "\
>> -        =
http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
>> -        file://include.gypi \
>> -        file://oe-defaults.gypi \
>> -        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', =
'file://component-build.gypi', '', d)} \
>> -        file://google-chrome \
>> -        file://google-chrome.desktop \
>> -"
>> -
>> -# PACKAGECONFIG explanations:
>> -#
>> -# * use-egl : Without this packageconfig, the Chromium build will =
use GLX for creating an OpenGL context in X11,
>> -#             and regular OpenGL for painting operations. Neither =
are desirable on embedded platforms. With this
>> -#             packageconfig, EGL and OpenGL ES 2.x are used instead. =
On by default.
>> -#
>> -# * disable-api-keys-info-bar : This disables the info bar that =
warns: "Google API keys are missing". With some
>> -#                               builds, missing API keys are =
considered OK, so the bar needs to go.
>> -#                               Off by default.
>> -#
>> -# * component-build : Enables component build mode. By default, all =
of Chromium (with the exception of FFmpeg)
>> -#                     is linked into one big binary. The linker step =
requires at least 8 GB RAM. Component mode
>> -#                     was created to facilitate development and =
testing, since with it, there is not one big
>> -#                     binary; instead, each component is linked to a =
separate shared object.
>> -#                     Use component mode for development, testing, =
and in case the build machine is not a 64-bit
>> -#                     one, or has less than 8 GB RAM. Off by =
default.
>> -#
>> -# * ignore-lost-context : There is a flaw in the HTML Canvas =
specification. When the canvas' backing store is
>> -#                         some kind of hardware resource like an =
OpenGL texture, this resource might get lost.
>> -#                         In case of OpenGL textures, this happens =
when the OpenGL context gets lost. The canvas
>> -#                         should then be repainted, but nothing in =
the Canvas standard reflects that.
>> -#                         This packageconfig is to be used if the =
underlying OpenGL (ES) drivers do not lose
>> -#                         the context, or if losing the context is =
considered okay (note that canvas contents can
>> -#                         vanish then). Off by default.
>> -#
>> -# * impl-side-painting : This is a new painting mechanism. Still in =
development stages, it can improve performance.
>> -#                        See =
http://www.chromium.org/developers/design-documents/impl-side-painting =
for more.
>> -#                        Off by default.
>> -
>> -# conditionally add ozone-wayland and its patches to the Chromium =
sources
>> -
>> -ENABLE_X11 =3D "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', =
d)}"
>> -# only enable Wayland if X11 isn't already enabled
>> -ENABLE_WAYLAND =3D "${@base_contains('DISTRO_FEATURES', 'x11', '0', =
\
>> -                     base_contains('DISTRO_FEATURES', 'wayland', =
'1', \
>> -                     '0', d),d)}"
>> -
>> -# variable for extra ozone-wayland patches, typically extended by =
BSP layer .bbappends
>> -# IMPORTANT: do not simply add extra ozone-wayland patches to the =
SRC_URI in a
>> -# .bbappend, since the base ozone-wayland patches need to be applied =
first (see below)
>> -
>> -OZONE_WAYLAND_EXTRA_PATCHES =3D " "
>> -
>> -OZONE_WAYLAND_GIT_DESTSUFFIX =3D "ozone-wayland-git"
>> -OZONE_WAYLAND_GIT_BRANCH =3D ""
>> -OZONE_WAYLAND_GIT_SRCREV =3D ""
>> -SRC_URI +=3D "${@base_conditional('ENABLE_WAYLAND', '1', =
'git://github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GIT=
_DESTSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_GI=
T_SRCREV}', '', d)}"
>> -OZONE_WAYLAND_PATCH_FILE_GLOB =3D "*.patch"
>> -
>> -do_unpack[postfuncs] +=3D "${@base_conditional('ENABLE_WAYLAND', =
'1', 'copy_ozone_wayland_files', '', d)}"
>> -do_patch[prefuncs] +=3D "${@base_conditional('ENABLE_WAYLAND', '1', =
'add_ozone_wayland_patches', '', d)}"
>> -
>> -copy_ozone_wayland_files() {
>> -       # ozone-wayland sources must be placed in an "ozone"
>> -       # subdirectory in ${S} in order for the .gyp build
>> -       # scripts to work
>> -       cp -r ${WORKDIR}/ozone-wayland-git ${S}/ozone
>> -}
>> -
>> -python add_ozone_wayland_patches() {
>> -    import glob
>> -    srcdir =3D d.getVar('S', True)
>> -    # find all ozone-wayland patches and add them to SRC_URI
>> -    upstream_patches_dir =3D srcdir + "/ozone/patches"
>> -    upstream_patches =3D glob.glob(upstream_patches_dir + "/" + =
d.getVar('OZONE_WAYLAND_PATCH_FILE_GLOB', True))
>> -    upstream_patches.sort()
>> -    for upstream_patch in upstream_patches:
>> -        d.appendVar('SRC_URI', ' file://' + upstream_patch)
>> -    # then, add the extra patches to SRC_URI order matters;
>> -    # extra patches may depend on the base ozone-wayland ones
>> -    d.appendVar('SRC_URI', ' ' + =
d.getVar('OZONE_WAYLAND_EXTRA_PATCHES'))
>> -}
>> -
>> +DEPENDS =3D "xz-native pciutils pulseaudio cairo nss zlib-native =
libav cups ninja-native gconf libexif pango libdrm"
>>=20
>> -# include.gypi exists only for armv6 and armv7a and there isn't =
something like COMPATIBLE_ARCH afaik
>> COMPATIBLE_MACHINE =3D "(-)"
>> COMPATIBLE_MACHINE_i586 =3D "(.*)"
>> COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
>> COMPATIBLE_MACHINE_armv6 =3D "(.*)"
>> COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>>=20
>> +export CHROMIUM_BUILD_TYPE=3D"Release"
>> +
>> inherit gettext
>>=20
>> PACKAGECONFIG ??=3D "use-egl"
>> @@ -117,43 +17,7 @@ PACKAGECONFIG ??=3D "use-egl"
>> # automatically and silently fall back to GLX
>> PACKAGECONFIG[use-egl] =3D ",,virtual/egl virtual/libgles2"
>>=20
>> -EXTRA_OEGYP =3D  " \
>> -       -Dangle_use_commit_id=3D0 \
>> -       -Dclang=3D0 \
>> -       -Dhost_clang=3D0 \
>> -       -Ddisable_fatal_linker_warnings=3D1 \
>> -       ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', =
'-Dlinux_use_gold_binary=3D0', d)} \
>> -       ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', =
'-Dlinux_use_gold_flags=3D0', d)} \
>> -       -I ${WORKDIR}/oe-defaults.gypi \
>> -       -I ${WORKDIR}/include.gypi \
>> -       ${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I =
${WORKDIR}/component-build.gypi', '', d)} \
>> -       -f ninja \
>> -"
>> -ARMFPABI_armv7a =3D "${@bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', 'arm_float_abi=3Dhard', 'arm_float_abi=3Dsoftfp', =
d)}"
>> -
>> -CHROMIUM_EXTRA_ARGS ?=3D " \
>> -       ${@bb.utils.contains('PACKAGECONFIG', 'use-egl', =
'--use-gl=3Degl', '', d)} \
>> -       ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', =
'--gpu-no-context-lost', '', d)} \
>> -       ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', =
'--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
>> -"
>> -
>> -GYP_DEFINES =3D "${ARMFPABI} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>> -
>> -# These are present as their own variables, since they have changed =
between versions
>> -# a few times in the past already; making them variables makes it =
easier to handle that
>> -CHROMIUM_X11_DEPENDS =3D "xextproto gtk+ libxi libxss"
>> -CHROMIUM_X11_GYP_DEFINES =3D ""
>> -CHROMIUM_WAYLAND_DEPENDS =3D "wayland libxkbcommon"
>> -CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 =
chromeos=3D0 use_ozone=3D1"
>> -
>> -python() {
>> -    if d.getVar('ENABLE_X11', True) =3D=3D '1':
>> -        d.appendVar('DEPENDS', ' %s ' % =
d.getVar('CHROMIUM_X11_DEPENDS', True))
>> -        d.appendVar('GYP_DEFINES', ' %s ' % =
d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
>> -    if d.getVar('ENABLE_WAYLAND', True) =3D=3D '1':
>> -        d.appendVar('DEPENDS', ' %s ' % =
d.getVar('CHROMIUM_WAYLAND_DEPENDS', True))
>> -        d.appendVar('GYP_DEFINES', ' %s ' % =
d.getVar('CHROMIUM_WAYLAND_GYP_DEFINES', True))
>> -}
>> +GYP_DEFINES +=3D "${ARMFPABI} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>>=20
>> do_configure() {
>>        cd ${S}
>> @@ -164,54 +28,103 @@ do_configure() {
>>        CXX=3D"${CXX}" export CXX
>>        CC_host=3D"${BUILD_CC}" export CC_host
>>        CXX_host=3D"${BUILD_CXX}" export CXX_host
>> -       build/gyp_chromium --depth=3D. ${EXTRA_OEGYP}
>> -}
>> -
>> -do_compile() {
>> -       # build with ninja
>> -       ninja -C ${S}/out/Release chrome chrome_sandbox
>> }
>>=20
>> do_install() {
>>        install -d ${D}${bindir}
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
>> +       install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple =
${D}${bindir}
>> +       fi
>> +       if [ -f "${WORKDIR}/google-chrome" ]; then
>>        install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
>> -
>> -       # Add extra command line arguments to google-chrome script by =
modifying
>> -       # the dummy "CHROME_EXTRA_ARGS" line
>> -       sed -i =
"s/^CHROME_EXTRA_ARGS=3D\"\"/CHROME_EXTRA_ARGS=3D\"${CHROMIUM_EXTRA_ARGS}\=
"/" ${D}${bindir}/google-chrome
>> -
>> +       fi
>>        install -d ${D}${datadir}/applications
>> +       if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
>>        install -m 0644 ${WORKDIR}/google-chrome.desktop =
${D}${datadir}/applications/
>> +       fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
>> +       install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat =
${D}${bindir}
>> +       fi
>> +       install -d ${D}${libdir}
>> +        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libcef.so" ]; then
>> +       install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${libdir}
>> +        fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so" ]; =
then
>> +       install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so =
${D}${libdir}
>> +       fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so" ]; =
then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so ${D}${libdir}
>> +       fi
>> +       install -d ${D}${bindir}/chrome
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
>> +       install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome =
${D}${bindir}/chrome/chrome
>> +       fi
>> +
>> +       #Chromium *.pak files
>>=20
>> -       install -d ${D}${bindir}/chrome/
>> -       install -m 0755 ${S}/out/Release/chrome =
${D}${bindir}/chrome/chrome
>> -       install -m 0644 ${S}/out/Release/resources.pak =
${D}${bindir}/chrome/
>> -       install -m 0644 ${S}/out/Release/icudtl.dat =
${D}${bindir}/chrome/
>> -       install -m 0644 ${S}/out/Release/content_resources.pak =
${D}${bindir}/chrome/
>> -       install -m 0644 ${S}/out/Release/keyboard_resources.pak =
${D}${bindir}/chrome/
>> -       install -m 0644 ${S}/out/Release/chrome_100_percent.pak =
${D}${bindir}/chrome/
>> -       install -m 0644 ${S}/out/Release/product_logo_48.png =
${D}${bindir}/chrome/
>> -       install -m 0755 ${S}/out/Release/libffmpegsumo.so =
${D}${bindir}/chrome/
>> -
>> -       # Always adding this libdir (not just with component builds), =
because the
>> -       # LD_LIBRARY_PATH line in the google-chromium script refers =
to it
>> -       install -d ${D}${libdir}/chrome/
>> -       if [ -n "${@bb.utils.contains('PACKAGECONFIG', =
'component-build', 'component-build', '', d)}" ]; then
>> -               install -m 0755 ${S}/out/Release/lib/*.so =
${D}${libdir}/chrome/
>> +       if [ -f =
"${B}/out/${CHROMIUM_BUILD_TYPE}/content_resources.pak" ]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/content_resources.pak =
${D}${bindir}/chrome
>> +       fi
>> +       if [ -f =
"${B}/out/${CHROMIUM_BUILD_TYPE}/keyboard_resources.pak" ]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/keyboard_resources.pak =
${D}${bindir}/chrome
>> +       fi
>> +       if [ -f =
"${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_100_percent.pak" ]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_100_percent.pak =
${D}${bindir}/chrome
>>        fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png" =
]; then
>> +       install -m 0644 =
${S}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png =
${D}${bindir}/chrome/
>> +       fi
>> +
>> +       # CEF *.pak files
>> +
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak" =
]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak ${D}${bindir}/chrome
>> +       fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak" =
]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak ${D}${bindir}/chrome
>> +       fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak" =
]; then
>> +       install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak ${D}${bindir}/chrome
>> +       fi
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak" ]; then
>> +       install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak =
${D}${bindir}/chrome
>> +       fi
>> +       install -d ${D}${bindir}/chrome/locales
>> +       install -m 0644 =
${B}/out/${CHROMIUM_BUILD_TYPE}/locales/en-US.pak =
${D}${bindir}/chrome/locales
>> +
>>=20
>>        install -d ${D}${sbindir}
>> -       install -m 4755 ${S}/out/Release/chrome_sandbox =
${D}${sbindir}/chrome-devel-sandbox
>> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; =
then
>> +       install -m 4755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox =
${D}${sbindir}/chrome-devel-sandbox
>> +       fi
>> +
>> +       # take care of yocto-way libraries naming (versions)
>> +       cd ${D}${libdir}
>> +       for library in $(find -type f -name '*.so'); do
>> +         startDir=3D"$(pwd)"
>> +          cd "$(dirname "$library")"
>> +          rm -f "$library.0.0.1"
>> +          mv "$library" "$library.0.0.1"
>> +          ln -sf "$library.0.0.1" "$library.0.0"
>> +          ln -sf "$library.0.0" "$library.0"
>> +          ln -sf "$library.0" "$library"
>> +        cd "$startDir"
>> +    done
>>=20
>> -       install -d ${D}${bindir}/chrome/locales/
>> -       install -m 0644 ${S}/out/Release/locales/en-US.pak =
${D}${bindir}/chrome/locales
>> }
>>=20
>> +
>> FILES_${PN} =3D "${bindir}/chrome/ ${bindir}/google-chrome =
${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
>> FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ =
${libdir}/chrome/.debug/"
>>=20
>> PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>>=20
>> +INSANE_SKIP_${PN} =3D "dev-so ldflags"
>> +FILES_SOLIBSDEV =3D ""
>> +FILES_${PN} +=3D "${bindir} ${bindir}/chrome/ ${libdir}"
>> +FILES_${PN} +=3D "${bindir}/chrome/*.pak"
>> +FILES_${PN} +=3D "${bindir}/chrome/locales/*.pak"
>> +FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ ${libdir}/.debug/"
>>=20
>>=20
>>=20
>> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb =
b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> index d0ff07d..3a5108e 100644
>> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> @@ -1,4 +1,82 @@
>> +# Recipe files have to perform the following tasks after including =
this file:
>> +# 1) Add patches to SRC_URI. Version specific patches should be =
contained in a
>> +#    "chromium-XX" subdirectory, where XX is the major version. =
There are also
>> +#    patches that are shared amongst versions but may one day no =
longer be
>> +#    needed (like unistd2.patch). These do not belong in such a =
subdirectory,
>> +#    but still need to be explicitely be added. Do NOT add =
ozone-wayland patches
>> +#    to SRC_URI here!
>> +# 2) Add md5sum and sha256sum hashes of the tarball.
>> +# 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES =
variable.
>> +#    The rule with the chromium-XX subdirectory also applies here.
>> +# 4) Set the OZONE_WAYLAND_GIT_BRANCH and OZONE_WAYLAND_GIT_SRCREV =
values.
>> +# 5) Optionally, set values for these variables:
>> +#    * OZONE_WAYLAND_PATCH_FILE_GLOB
>> +#    * CHROMIUM_X11_DEPENDS
>> +#    * CHROMIUM_X11_GYP_DEFINES
>> +#    * CHROMIUM_WAYLAND_DEPENDS
>> +#    * CHROMIUM_WAYLAND_GYP_DEFINES
>> +
>> +DESCRIPTION =3D "Chromium browser"
>> +DEPENDS +=3D "libgnome-keyring"
>> include chromium.inc
>> +SRC_URI =3D "\
>> +        =
http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
>> +        file://include.gypi \
>> +        file://oe-defaults.gypi \
>> +        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', =
'file://component-build.gypi', '', d)} \
>> +        file://google-chrome \
>> +        file://google-chrome.desktop \
>> +"
>> +#
>> +# * use-egl : Without this packageconfig, the Chromium build will =
use GLX for creating an OpenGL context in X11,
>> +#             and regular OpenGL for painting operations. Neither =
are desirable on embedded platforms. With this
>> +#             packageconfig, EGL and OpenGL ES 2.x are used instead. =
On by default.
>> +#
>> +# * disable-api-keys-info-bar : This disables the info bar that =
warns: "Google API keys are missing". With some
>> +#                               builds, missing API keys are =
considered OK, so the bar needs to go.
>> +#                               Off by default.
>> +#
>> +# * component-build : Enables component build mode. By default, all =
of Chromium (with the exception of FFmpeg)
>> +#                     is linked into one big binary. The linker step =
requires at least 8 GB RAM. Component mode
>> +#                     was created to facilitate development and =
testing, since with it, there is not one big
>> +#                     binary; instead, each component is linked to a =
separate shared object.
>> +#                     Use component mode for development, testing, =
and in case the build machine is not a 64-bit
>> +#                     one, or has less than 8 GB RAM. Off by =
default.
>> +#
>> +# * ignore-lost-context : There is a flaw in the HTML Canvas =
specification. When the canvas' backing store is
>> +#                         some kind of hardware resource like an =
OpenGL texture, this resource might get lost.
>> +#                         In case of OpenGL textures, this happens =
when the OpenGL context gets lost. The canvas
>> +#                         should then be repainted, but nothing in =
the Canvas standard reflects that.
>> +#                         This packageconfig is to be used if the =
underlying OpenGL (ES) drivers do not lose
>> +#                         the context, or if losing the context is =
considered okay (note that canvas contents can
>> +#                         vanish then). Off by default.
>> +#
>> +# * impl-side-painting : This is a new painting mechanism. Still in =
development stages, it can improve performance.
>> +#                        See =
http://www.chromium.org/developers/design-documents/impl-side-painting =
for more.
>> +#                        Off by default.
>> +
>> +# conditionally add ozone-wayland and its patches to the Chromium =
sources
>> +
>> +ENABLE_X11 =3D "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', =
d)}"
>> +# only enable Wayland if X11 isn't already enabled
>> +ENABLE_WAYLAND =3D "${@base_contains('DISTRO_FEATURES', 'x11', '0', =
\
>> +                     base_contains('DISTRO_FEATURES', 'wayland', =
'1', \
>> +                     '0', d),d)}"
>> +
>> +# variable for extra ozone-wayland patches, typically extended by =
BSP layer .bbappends
>> +# IMPORTANT: do not simply add extra ozone-wayland patches to the =
SRC_URI in a
>> +# .bbappend, since the base ozone-wayland patches need to be applied =
first (see below)
>> +
>> +OZONE_WAYLAND_EXTRA_PATCHES =3D " "
>> +
>> +OZONE_WAYLAND_GIT_DESTSUFFIX =3D "ozone-wayland-git"
>> +OZONE_WAYLAND_GIT_BRANCH =3D ""
>> +OZONE_WAYLAND_GIT_SRCREV =3D ""
>> +SRC_URI +=3D "${@base_conditional('ENABLE_WAYLAND', '1', =
'git://github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GIT=
_DESTSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_GI=
T_SRCREV}', '', d)}"
>> +OZONE_WAYLAND_PATCH_FILE_GLOB =3D "*.patch"
>> +
>> +do_unpack[postfuncs] +=3D "${@base_conditional('ENABLE_WAYLAND', =
'1', 'copy_ozone_wayland_files', '', d)}"
>> +do_patch[prefuncs] +=3D "${@base_conditional('ENABLE_WAYLAND', '1', =
'add_ozone_wayland_patches', '', d)}"
>>=20
>> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D537e0b52077bf0a616d0a0c8a79bc9d5"
>> SRC_URI +=3D "\
>> @@ -30,3 +108,88 @@ python() {
>>         if bb.utils.contains('PACKAGECONFIG', 'component-build', =
True, False, d):
>>             bb.fatal("Chromium 40 Wayland version cannot be built in =
component-mode")
>> }
>> +
>> +copy_ozone_wayland_files() {
>> +       # ozone-wayland sources must be placed in an "ozone"
>> +       # subdirectory in ${S} in order for the .gyp build
>> +       # scripts to work
>> +       cp -r ${WORKDIR}/ozone-wayland-git ${S}/ozone
>> +}
>> +
>> +python add_ozone_wayland_patches() {
>> +    import glob
>> +    srcdir =3D d.getVar('S', True)
>> +    # find all ozone-wayland patches and add them to SRC_URI
>> +    upstream_patches_dir =3D srcdir + "/ozone/patches"
>> +    upstream_patches =3D glob.glob(upstream_patches_dir + "/" + =
d.getVar('OZONE_WAYLAND_PATCH_FILE_GLOB', True))
>> +    upstream_patches.sort()
>> +    for upstream_patch in upstream_patches:
>> +        d.appendVar('SRC_URI', ' file://' + upstream_patch)
>> +    # then, add the extra patches to SRC_URI order matters;
>> +    # extra patches may depend on the base ozone-wayland ones
>> +    d.appendVar('SRC_URI', ' ' + =
d.getVar('OZONE_WAYLAND_EXTRA_PATCHES'))
>> +}
>> +
>> +EXTRA_OEGYP =3D  " \
>> +       -Dangle_use_commit_id=3D0 \
>> +       -Dclang=3D0 \
>> +       -Dhost_clang=3D0 \
>> +       -Ddisable_fatal_linker_warnings=3D1 \
>> +       ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', =
'-Dlinux_use_gold_binary=3D0', d)} \
>> +       ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', =
'-Dlinux_use_gold_flags=3D0', d)} \
>> +       -I ${WORKDIR}/oe-defaults.gypi \
>> +       -I ${WORKDIR}/include.gypi \
>> +       ${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I =
${WORKDIR}/component-build.gypi', '', d)} \
>> +       -f ninja \
>> +"
>> +ARMFPABI_armv7a =3D "${@bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', 'arm_float_abi=3Dhard', 'arm_float_abi=3Dsoftfp', =
d)}"
>> +
>> +CHROMIUM_EXTRA_ARGS ?=3D " \
>> +       ${@bb.utils.contains('PACKAGECONFIG', 'use-egl', =
'--use-gl=3Degl', '', d)} \
>> +       ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', =
'--gpu-no-context-lost', '', d)} \
>> +       ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', =
'--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
>> +"
>> +
>> +GYP_DEFINES +=3D "${ARMFPABI} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>> +
>> +# These are present as their own variables, since they have changed =
between versions
>> +# a few times in the past already; making them variables makes it =
easier to handle that
>> +CHROMIUM_X11_DEPENDS =3D "xextproto gtk+ libxi libxss"
>> +CHROMIUM_X11_GYP_DEFINES =3D ""
>> +CHROMIUM_WAYLAND_DEPENDS =3D "wayland libxkbcommon"
>> +CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 =
chromeos=3D0 use_ozone=3D1"
>> +
>> +python() {
>> +    if d.getVar('ENABLE_X11', True) =3D=3D '1':
>> +        d.appendVar('DEPENDS', ' %s ' % =
d.getVar('CHROMIUM_X11_DEPENDS', True))
>> +        d.appendVar('GYP_DEFINES', ' %s ' % =
d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
>> +    if d.getVar('ENABLE_WAYLAND', True) =3D=3D '1':
>> +        d.appendVar('DEPENDS', ' %s ' % =
d.getVar('CHROMIUM_WAYLAND_DEPENDS', True))
>> +        d.appendVar('GYP_DEFINES', ' %s ' % =
d.getVar('CHROMIUM_WAYLAND_GYP_DEFINES', True))
>> +}
>> +
>> +do_configure_append() {
>> +
>> +       build/gyp_chromium --depth=3D. ${EXTRA_OEGYP}
>> +
>> +}
>> +
>> +do_compile() {
>> +        # build with ninja
>> +        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} chrome =
chrome_sandbox
>> +}
>> +
>> +
>> +do_install_append() {
>> +
>> +       # Add extra command line arguments to google-chrome script by =
modifying
>> +        # the dummy "CHROME_EXTRA_ARGS" line
>> +        sed -i =
"s/^CHROME_EXTRA_ARGS=3D\"\"/CHROME_EXTRA_ARGS=3D\"${CHROMIUM_EXTRA_ARGS}\=
"/" ${D}${bindir}/google-chrome
>> +
>> +       # Always adding this libdir (not just with component builds), =
because the
>> +        # LD_LIBRARY_PATH line in the google-chromium script refers =
to it
>> +        install -d ${D}${libdir}/chrome/
>> +        if [ -n "${@bb.utils.contains('PACKAGECONFIG', =
'component-build', 'component-build', '', d)}" ]; then
>> +                install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so ${D}${libdir}/chrome/
>> +        fi
>> +}
>> --
>> 2.1.4
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


