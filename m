Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E113A73AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:33:28 +0000 (UTC)
Received: by pabrd3 with SMTP id rd3so7316620pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Eb8WY8qsMV8Ob1KGAgDdgnVjHirnfS93bfIH5an3LfQ=;
	b=wvtXE+AAJ5JcBK2cjFIqqqgE5c4VkyErZI2WQI5LhvmvWvplyqEJFv7cJhGlFh0Y2l
	pGBXhKYik6fOAJz+GDF6xXCd39C9Z9t8MqvI1b7CY3zREbriXWIB8+PedG265x6K/Gcs
	Jlhmm6Fdze/dxVNhGSrqBLd9ija6xA+sMmUcNPnRo/Tv17vOsQGtyrU8EmleMHzMxSpw
	vGdk6H1zmaWRH4GyqH+1z6wY2ifAWZLvuxwVJQyU5iujLfUyhTNztImMXRIZ2/s3agGK
	aC326NDDL9I+hqj57Dy7sYIidt+vGKQmXg0SN59e0FjoMgl8bu8pqup71XO49ItH+ZH1
	MwIA==
X-Received: by 10.70.42.45 with SMTP id k13mr24022228pdl.43.1426041209545;
	Tue, 10 Mar 2015 19:33:29 -0700 (PDT)
Received: from 10.25.113.106-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150])
	by mx.google.com with ESMTPSA id y7sm3045551pdp.92.2015.03.10.19.33.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 19:33:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=XreWFJy1BhWdvWRZb0ruA8YGxqA9q8-Wi1ec95jQ73FA@mail.gmail.com>
Date: Tue, 10 Mar 2015 19:33:27 -0700
Message-Id: <97CBF441-75FC-4EA6-8665-7A500A2DD83D@gmail.com>
References: <1426038752-29983-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=XreWFJy1BhWdvWRZb0ruA8YGxqA9q8-Wi1ec95jQ73FA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Wed, 11 Mar 2015 02:33:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 10, 2015, at 7:25 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Tue, Mar 10, 2015 at 6:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> CEF is a framework to embed chromium based browsers into other
>> applications
>=20
> Nice to see this show up :-)

its a verbatim copy of a working version. I will send out a v2, but will =
wait for some more feedback if anyone has

>=20
>> Change-Id: I7cb987828837b3aef6e87aa9b9f73a8babe26a06
>> Signed-off-by: pnandyala <Pavan.Nandyala@LntTechservices.com>
>> Signed-off-by: knagabhirava =
<kalyankumar.nagabhirava@lnttechservices.com>
>> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../cef3/01_get_svn_version_from_LASTCHANGE.patch  |  25 ++++
>> recipes-browser/chromium/cef3_280796.bb            | 146 =
+++++++++++++++++++++
>> 2 files changed, 171 insertions(+)
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
>> index 0000000..9834eac
>> --- /dev/null
>> +++ b/recipes-browser/chromium/cef3_280796.bb
>> @@ -0,0 +1,146 @@
>> +DESCRIPTION =3D "Chromium Embedded Framework"
>> +LICENSE =3D "BSD"
>> +
>> +# Based on Chromium dependencies
>> +DEPENDS =3D " \
>> +       xz-native \
>> +       pciutils \
>> +       pulseaudio \
>> +       xextproto \
>> +       pango \
>> +       cairo \
>> +       nss \
>> +       zlib-native \
>> +       cups \
>> +       ninja-native \
>> +       gconf \
>> +       libexif \
>> +       libxkbcommon \
>> +       fontconfig \
>> +       libdrm \
>> +       virtual/egl \
>> +       virtual/libgles2 \
>> +       "
>=20
> Is there a logic to this sorting order?

Not really, we could sort them though

>=20
>> +RDEPENDS_${PN} =3D " \
>> +       pango \
>> +       cairo \
>> +       fontconfig \
>> +       pciutils \
>> +       pulseaudio \
>> +       freetype \
>> +       fontconfig-utils \
>> +        "
>=20
> Same comment here.

consistent with above=20

>=20
>> +#Generic Fonts are needed
>> +
>> +COMPATIBLE_MACHINE =3D "(-)"
>> +COMPATIBLE_MACHINE_i586 =3D "(.*)"
>> +COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
>> +COMPATIBLE_MACHINE_armv6 =3D "(.*)"
>> +COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>> +
>> +SRC_URI =3D =
"http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${=
PV}.tar.xz"
>> +SRC_URI =
+=3D"git://github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsu=
ffix=3Dsrc/cef;branch=3Daura;name=3Dcef"
>> +SRC_URI =
+=3D"git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3D=
src/ui/ozone/platform/egl;branch=3Dmaster;name=3Degl"
>> +SRC_URI =
+=3D"git://chromium.googlesource.com/chromium/tools/depot_tools.git;protoc=
ol=3Dhttps;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools"
>> +SRC_URI +=3D"file://01_get_svn_version_from_LASTCHANGE.patch"
>> +
>> +SRCREV =3D "${AUTOREV}"
>> +SRCREV_cef ?=3D "${AUTOREV}"
>> +SRCREV_egl =3D "${AUTOREV}"
>=20
> Are AUTOREV versions allowed?

hmmm good catch.

>=20
>> +SRCREV_FORMAT =3D "default_cef_egl_tools"
>> +S =3D "${WORKDIR}/chromium_rev_${PV}"
>> +
>> +do_fetch[vardeps] +=3D "SRCREV_FORMAT SRCREV_cef SRCREV_egl =
SRCREV_tools"
>> +
>> +SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
>> +SRC_URI[sha256sum] =3D =
"f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
>> +
>> +export CHROMIUM_BUILD_TYPE=3D"Release"
>> +
>> +GYP_ARCH_DEFINES_armv7a =3D " target_arch=3Darm arm_float_abi=3Dhard"
>> +GYP_ARCH_DEFINES_i586 =3D " target_arch=3Dia32"
>=20
> Should there be a default GYP_ARCH_DEFINES for the other
> COMPATIBLE_MACHINEs, x86-64 and armv6?

No. They matched 1 to 1 IIRC

>=20
>> +export GYP_GENERATORS=3D"ninja"
>> +export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
>> +export GYP_DEFINES=3D"${GYP_ARCH_DEFINES} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>> +
>> +inherit gettext
>> +
>> +do_configure() {
>> +    # LD workaround taken from meta-browser
>> +    # replace LD with CXX, to workaround a possible gyp issue?
>> +    export PATH=3D${WORKDIR}/depot_tools:"$PATH"
>> +    LD=3D"${CXX}" export LD
>> +    CC=3D"${CC}" export CC
>> +    CXX=3D"${CXX}" export CXX
>> +    CC_host=3D"gcc" export CC_host
>> +    CXX_host=3D"g++" export CXX_host
>> +    # End of LD Workaround
>> +
>> +    #-----------------------
>> +    # Configure and build cef
>> +    #------------------------
>=20
> Confusing comment. If you build in the configure task, what happens
> below in the compile task?

yes will have to change

>=20
>> +    cd cef
>> +    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../
>> +    cd -
>> +}
>> +
>> +# Workaround to disable qa_configure
>> +do_qa_configure() {
>> +    echo "do_qa_configure"
>> +}
>> +
>> +do_compile() {
>> +    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
>> +}
>> +
>> +do_install() {
>> +   install -d ${D}${bindir}
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple =
${D}${bindir}
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
>> +   install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat =
${D}${bindir}
>> +   fi
>=20
> Dubious indenting=E2=80=A6
>=20

right


>> +   install -d ${D}${libdir}
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${libdir}
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so" ]; then
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so =
${D}${libdir}
>> +   fi
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so" ]; =
then
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so =
${D}${libdir}
>> +   fi
>> +   install -d ${D}${bindir}/chrome
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak" ]; =
then
>> +   install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak ${D}${bindir}/chrome
>> +   fi
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak" ]; =
then
>> +   install -m 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak ${D}${bindir}/chrome
>> +   fi
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak" ]; =
then
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak =
${D}${bindir}/chrome
>> +   fi
>> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak" ]; then
>> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak =
${D}${bindir}/chrome
>> +   fi
>=20
> What are .pak files? Do they need to be installed as executable?

they are resource files. They can be 0644

>=20
>> +   install -d ${D}${bindir}/chrome/locales
>> +   install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/locales/en-US.pak =
${D}${bindir}/chrome/locales
>> +   # take care of libraries naming (versions)
>> +    cd ${D}${libdir}
>> +    for library in $(find -type f -name '*.so'); do
>> +         startDir=3D"$(pwd)"
>> +          cd "$(dirname "$library")"
>> +          rm -f "$library.0.0.1"
>> +          mv "$library" "$library.0.0.1"
>> +          ln -sf "$library.0.0.1" "$library.0.0"
>> +          ln -sf "$library.0.0" "$library.0"
>> +          ln -sf "$library.0" "$library"
>=20
> This only works correctly if sonames are given when the libraries are =
linked=E2=80=A6

yes thats the expectation

>=20
>> +        cd "$startDir"
>> +    done
>> +
>> +}
>> +
>> +INSANE_SKIP_${PN} =3D "dev-so ldflags"
>> +FILES_SOLIBSDEV =3D ""
>=20
> See above. If sonames are correct then there should be no need to
> force the .so symlinks into the runtime package.

yes this should go.



