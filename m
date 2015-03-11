Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0F32973AAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:25:23 +0000 (UTC)
Received: by oifu20 with SMTP id u20so5269849oif.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gpwPzsYtT6VdZsqFdvVLQR6bhCD4wEyI18ZRPU60cBM=;
	b=NbdDHcJ0IAvI4RiD/8OJeUANFwf3oF2jWpvBp1MIMT3Vems3mwPRZ6gSbrPI/rKU9u
	EGyqrb+ttQm4jeHmV5dA8Px0kqWoBQQa8MoqwXUZhyhdVwxzvS/SwdKp7b0ctiDd9mDb
	ZqosVExyjyonvTC1WBO1Gc1AQ4ISfXx0TbPO1k5jNxLUUO+vH+T+HL5VFlbuB3W8doKZ
	5wbJ6AkDzgrZU7oCnR9uJtZHk9Ekk+ob94uX3H3ksGdpU7YNKlVsMu0Gs9Jw+IgEsiAE
	7UVGNkjRW+iWTelaEm1rIhAMCvlc218EFeL2u8paUIImaZaV3bBdj81M4ABXhIzdyO9J
	Z4gw==
MIME-Version: 1.0
X-Received: by 10.202.67.132 with SMTP id q126mr26666029oia.15.1426040724923; 
	Tue, 10 Mar 2015 19:25:24 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Tue, 10 Mar 2015 19:25:24 -0700 (PDT)
In-Reply-To: <1426038752-29983-1-git-send-email-raj.khem@gmail.com>
References: <1426038752-29983-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 10 Mar 2015 19:25:24 -0700
Message-ID: <CAJ86T=XreWFJy1BhWdvWRZb0ruA8YGxqA9q8-Wi1ec95jQ73FA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 11 Mar 2015 02:25:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 6:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> CEF is a framework to embed chromium based browsers into other
> applications

Nice to see this show up :-)

> Change-Id: I7cb987828837b3aef6e87aa9b9f73a8babe26a06
> Signed-off-by: pnandyala <Pavan.Nandyala@LntTechservices.com>
> Signed-off-by: knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../cef3/01_get_svn_version_from_LASTCHANGE.patch  |  25 ++++
>  recipes-browser/chromium/cef3_280796.bb            | 146 +++++++++++++++++++++
>  2 files changed, 171 insertions(+)
>  create mode 100644 recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>  create mode 100644 recipes-browser/chromium/cef3_280796.bb
>
> diff --git a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> new file mode 100644
> index 0000000..61f88b4
> --- /dev/null
> +++ b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> @@ -0,0 +1,25 @@
> +diff --git a/cef/tools/make_version_header.py b/cef/tools/make_version_header.py
> +index 84d49f5..395c2cf 100644
> +--- a/cef/tools/make_version_header.py
> ++++ b/cef/tools/make_version_header.py
> +@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version, cef_version, cpp_header_dir):
> +       revision = svn.get_revision()
> +     elif git.is_checkout('.'):
> +       revision = git.get_svn_revision()
> ++    elif os.path.isfile("../build/util/LASTCHANGE"):
> ++      revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
> +     else:
> +       raise Exception('Not a valid checkout')
> +
> +diff --git a/cef/tools/revision.py b/cef/tools/revision.py
> +index 1d94602..eb89e3b 100644
> +--- a/cef/tools/revision.py
> ++++ b/cef/tools/revision.py
> +@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
> +   sys.stdout.write(svn.get_revision())
> + elif os.path.exists(os.path.join('.', '.git')):
> +   sys.stdout.write(git.get_svn_revision())
> ++elif os.path.isfile("../build/util/LASTCHANGE"):
> ++  revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
> + else:
> +   raise Exception('Not a valid checkout')
> diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
> new file mode 100644
> index 0000000..9834eac
> --- /dev/null
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -0,0 +1,146 @@
> +DESCRIPTION = "Chromium Embedded Framework"
> +LICENSE = "BSD"
> +
> +# Based on Chromium dependencies
> +DEPENDS = " \
> +       xz-native \
> +       pciutils \
> +       pulseaudio \
> +       xextproto \
> +       pango \
> +       cairo \
> +       nss \
> +       zlib-native \
> +       cups \
> +       ninja-native \
> +       gconf \
> +       libexif \
> +       libxkbcommon \
> +       fontconfig \
> +       libdrm \
> +       virtual/egl \
> +       virtual/libgles2 \
> +       "

Is there a logic to this sorting order?

> +RDEPENDS_${PN} = " \
> +       pango \
> +       cairo \
> +       fontconfig \
> +       pciutils \
> +       pulseaudio \
> +       freetype \
> +       fontconfig-utils \
> +        "

Same comment here.

> +#Generic Fonts are needed
> +
> +COMPATIBLE_MACHINE = "(-)"
> +COMPATIBLE_MACHINE_i586 = "(.*)"
> +COMPATIBLE_MACHINE_x86-64 = "(.*)"
> +COMPATIBLE_MACHINE_armv6 = "(.*)"
> +COMPATIBLE_MACHINE_armv7a = "(.*)"
> +
> +SRC_URI = "http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${PV}.tar.xz"
> +SRC_URI +="git://github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=src/cef;branch=aura;name=cef"
> +SRC_URI +="git://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl"
> +SRC_URI +="git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools"
> +SRC_URI +="file://01_get_svn_version_from_LASTCHANGE.patch"
> +
> +SRCREV = "${AUTOREV}"
> +SRCREV_cef ?= "${AUTOREV}"
> +SRCREV_egl = "${AUTOREV}"

Are AUTOREV versions allowed?

> +SRCREV_FORMAT = "default_cef_egl_tools"
> +S = "${WORKDIR}/chromium_rev_${PV}"
> +
> +do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
> +
> +SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
> +SRC_URI[sha256sum] = "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
> +
> +export CHROMIUM_BUILD_TYPE="Release"
> +
> +GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
> +GYP_ARCH_DEFINES_i586 = " target_arch=ia32"

Should there be a default GYP_ARCH_DEFINES for the other
COMPATIBLE_MACHINEs, x86-64 and armv6?

> +export GYP_GENERATORS="ninja"
> +export BUILD_TARGET_ARCH="${TARGET_ARCH}"
> +export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
> +
> +inherit gettext
> +
> +do_configure() {
> +    # LD workaround taken from meta-browser
> +    # replace LD with CXX, to workaround a possible gyp issue?
> +    export PATH=${WORKDIR}/depot_tools:"$PATH"
> +    LD="${CXX}" export LD
> +    CC="${CC}" export CC
> +    CXX="${CXX}" export CXX
> +    CC_host="gcc" export CC_host
> +    CXX_host="g++" export CXX_host
> +    # End of LD Workaround
> +
> +    #-----------------------
> +    # Configure and build cef
> +    #------------------------

Confusing comment. If you build in the configure task, what happens
below in the compile task?

> +    cd cef
> +    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
> +    cd -
> +}
> +
> +# Workaround to disable qa_configure
> +do_qa_configure() {
> +    echo "do_qa_configure"
> +}
> +
> +do_compile() {
> +    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> +}
> +
> +do_install() {
> +   install -d ${D}${bindir}
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindir}
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
> +   install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}
> +   fi

Dubious indenting...

> +   install -d ${D}${libdir}
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${libdir}
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so ${D}${libdir}
> +   fi
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so ${D}${libdir}
> +   fi
> +   install -d ${D}${bindir}/chrome
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak ${D}${bindir}/chrome
> +   fi
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak ${D}${bindir}/chrome
> +   fi
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak ${D}${bindir}/chrome
> +   fi
> +   if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak" ]; then
> +   install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak ${D}${bindir}/chrome
> +   fi

What are .pak files? Do they need to be installed as executable?

> +   install -d ${D}${bindir}/chrome/locales
> +   install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/locales/en-US.pak ${D}${bindir}/chrome/locales
> +   # take care of libraries naming (versions)
> +    cd ${D}${libdir}
> +    for library in $(find -type f -name '*.so'); do
> +         startDir="$(pwd)"
> +          cd "$(dirname "$library")"
> +          rm -f "$library.0.0.1"
> +          mv "$library" "$library.0.0.1"
> +          ln -sf "$library.0.0.1" "$library.0.0"
> +          ln -sf "$library.0.0" "$library.0"
> +          ln -sf "$library.0" "$library"

This only works correctly if sonames are given when the libraries are linked...

> +        cd "$startDir"
> +    done
> +
> +}
> +
> +INSANE_SKIP_${PN} = "dev-so ldflags"
> +FILES_SOLIBSDEV = ""

See above. If sonames are correct then there should be no need to
force the .so symlinks into the runtime package.

> +FILES_${PN} = "${bindir} ${bindir}/chrome/ ${libdir}"
> +FILES_${PN} += "${bindir}/chrome/*.pak"
> +FILES_${PN} += "${bindir}/chrome/locales/*.pak"
> +FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/.debug/"
> +
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

