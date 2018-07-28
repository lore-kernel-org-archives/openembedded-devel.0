Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E51CE7550F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2018 07:25:59 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id BB552172A;
	Sat, 28 Jul 2018 09:25:59 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <20180727202524.31873-1-dv@pseudoterminal.org>
	<e12d30b6-bd70-9499-181f-3e17e6f9d57b@gmail.com>
	<0f8dae5f-67a5-0ad8-0b7d-2dee258c642c@pseudoterminal.org>
	<CAMKF1soW42HSonbugeaQySX37a5keqpwqcM6hrusrU_h5Z79ng@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <bbb83e8c-665d-84f9-dd17-c838e988184d@pseudoterminal.org>
Date: Sat, 28 Jul 2018 09:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soW42HSonbugeaQySX37a5keqpwqcM6hrusrU_h5Z79ng@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] libopenmpt: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2018 07:26:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ahh right. When I read "style", I focused on the formatting :)

I'll send in a v2, thanks.


On 2018-07-28 09:05, Khem Raj wrote:
> On Fri, Jul 27, 2018 at 11:00 PM Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> Actually, I see nothing wrong with the RDEPENDS_${PN}_libc-glibc block.
>> It fits exactly the description in that style guide. Or what am I missing?
>>
>>
> all R* variables go at the end of file.
>
>> On 2018-07-27 23:40, akuster808 wrote:
>>> On 07/27/2018 01:25 PM, Carlos Rafael Giani wrote:
>>>> libopenmpt is a cross-platform C++ and C library to decode tracked music
>>>> files ("modules", like the .mod .xm .s3m .it formats) into raw PCM audio.
>>>> It is based on the player code of OpenMPT module tracker.
>>>>
>>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
>>>> ---
>>>>    .../libopenmpt/files/run-ptest                |   9 ++
>>>>    .../libopenmpt/libopenmpt_0.3.10.bb           | 104 ++++++++++++++++++
>>>>    2 files changed, 113 insertions(+)
>>>>    create mode 100644 meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
>>>>    create mode 100644 meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
>>>>
>>>> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest b/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
>>>> new file mode 100644
>>>> index 000000000..84981b22c
>>>> --- /dev/null
>>>> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
>>>> @@ -0,0 +1,9 @@
>>>> +#!/bin/sh
>>>> +
>>>> +./libopenmpttest >/dev/null 2>&1
>>>> +
>>>> +if [ $? -eq 0 ]; then
>>>> +   echo "PASS: libopenmpttest"
>>>> +else
>>>> +   echo "FAIL: libopenmpttest"
>>>> +fi
>>>> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
>>>> new file mode 100644
>>>> index 000000000..dddf80407
>>>> --- /dev/null
>>>> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
>>>> @@ -0,0 +1,104 @@
>>>> +SUMMARY = "C and C++ cross-platform library for decoding tracked music files (modules)"
>>>> +DESCRIPTION = "libopenmpt is a cross-platform C++ and C library to decode tracked \
>>>> +music files (modules) into a raw PCM audio stream. It also comes with openmpt123, a \
>>>> +cross-platform command-line or terminal based module file player, and libopenmpt_modplug, \
>>>> +a wrapper around libopenmpt that provides an interface that is ABI compatile with \
>>>> +libmodplug. libopenmpt is based on the player code of the OpenMPT project."
>>>> +HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
>>>> +SECTION = "libs"
>>>> +
>>>> +DEPENDS = "virtual/libiconv"
>>>> +
>>>> +RDEPENDS_${PN}_libc-glibc = " \
>>>> +    glibc-gconv-cp1252 \
>>>> +    glibc-gconv-ibm437 \
>>>> +    glibc-gconv-iso8859-1 \
>>>> +    glibc-gconv-iso8859-15 \
>>> The style seems to be a bit off. Please check
>>> https://www.openembedded.org/wiki/Styleguide
>>> - armin
>>>> +"
>>>> +
>>>> +LICENSE = "BSD-3-Clause"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e804150573f149befef6c07e173f20c3"
>>>> +
>>>> +SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
>>>> +           file://run-ptest \
>>>> +          "
>>>> +SRC_URI[md5sum] = "66bbc6fbb5f27a554cb145d805e9ef9d"
>>>> +SRC_URI[sha256sum] = "14a137b8d1a20e1b6a5e67cbc9467ab7e5e4e67d5aa38a247afc825685c53939"
>>>> +
>>>> +S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
>>>> +
>>>> +inherit autotools pkgconfig ptest
>>>> +
>>>> +PACKAGECONFIG ??= " \
>>>> +    libopenmpt-modplug openmpt123 \
>>>> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>>>> +    flac mpg123 ogg sndfile vorbis vorbisfile zlib \
>>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
>>>> +"
>>>> +
>>>> +# libopenmpt_modplug is a library that wraps libopenmpt calls into
>>>> +# functions that are ABI compatible with libmodplug. This allows for
>>>> +# using modplug headers and linking against libopenmpt_modplug
>>>> +# instead of against the original libmodplug library.
>>>> +# NOTE: The wrapper is compatible to the ABI from libmodplug version
>>>> +# 0.8.8 and newer.
>>>> +PACKAGECONFIG[libopenmpt-modplug] = "--enable-libopenmpt_modplug,--disable-libopenmpt_modplug"
>>>> +PACKAGECONFIG[openmpt123]         = "--enable-openmpt123,--disable-openmpt123"
>>>> +PACKAGECONFIG[tests]              = "--enable-tests,--disable-tests"
>>>> +
>>>> +# These packageconfigs affect openmpt123
>>>> +PACKAGECONFIG[flac]               = "--with-flac,--without-flac,flac"
>>>> +PACKAGECONFIG[mpg123]             = "--with-mpg123,--without-mpg123,mpg123"
>>>> +PACKAGECONFIG[ogg]                = "--with-ogg,--without-ogg,libogg"
>>>> +PACKAGECONFIG[portaudio]          = "--with-portaudio,--without-portaudio,portaudio-v19"
>>>> +PACKAGECONFIG[pulseaudio]         = "--with-pulseaudio,--without-pulseaudio,pulseaudio"
>>>> +PACKAGECONFIG[sdl]                = "--with-sdl,--without-sdl,virtual/libsdl"
>>>> +PACKAGECONFIG[sdl2]               = "--with-sdl2,--without-sdl2,virtual/libsdl2"
>>>> +PACKAGECONFIG[sndfile]            = "--with-sndfile,--without-sndfile,libsndfile1"
>>>> +PACKAGECONFIG[vorbis]             = "--with-vorbis,--without-vorbis,libvorbis"
>>>> +PACKAGECONFIG[vorbisfile]         = "--with-vorbisfile,--without-vorbisfile,libvorbis"
>>>> +PACKAGECONFIG[zlib]               = "--with-zlib,--without-zlib,zlib"
>>>> +
>>>> +# --disable-libmodplug is necessary, since otherwise we'd
>>>> +# have a collision with the libmodplug package, because of the
>>>> +# libmodplug.so file. (libmodplug.so from libopenmpt isintended
>>>> +# to be used as a drop-in replacement, and according to the
>>>> +# documentation, is not complete.)
>>>> +EXTRA_OECONF += " \
>>>> +    --disable-doxygen-doc \
>>>> +    --disable-examples \
>>>> +    --disable-libmodplug \
>>>> +    --without-portaudiocpp \
>>>> +"
>>>> +
>>>> +# Since version 0.3, libopenmpt uses SemVer 2.0.0 versioning.
>>>> +# The SemVer versioning scheme is incompatible with Debian/Ubuntu
>>>> +# package version names.
>>>> +DEBIAN_NOAUTONAME_${PN} = "1"
>>>> +DEBIAN_NOAUTONAME_${PN}-modplug = "1"
>>>> +
>>>> +PACKAGES =+ "${PN}-modplug ${PN}-openmpt123 ${PN}-openmpt123-doc"
>>>> +FILES_${PN}-modplug = "${libdir}/libopenmpt_modplug.so.*"
>>>> +FILES_${PN}-openmpt123 = "${bindir}/openmpt123"
>>>> +FILES_${PN}-openmpt123-doc = "${mandir}/man1/openmpt123*"
>>>> +
>>>> +do_compile_ptest() {
>>>> +    oe_runmake ${PARALLEL_MAKE} libopenmpttest
>>>> +}
>>>> +
>>>> +do_install_ptest() {
>>>> +    install -d ${D}${PTEST_PATH}/test
>>>> +    install -m 0755 ${B}/libopenmpttest ${D}${PTEST_PATH}
>>>> +    install -m 0644 ${S}/test/test.mptm ${D}${PTEST_PATH}/test
>>>> +    install -m 0644 ${S}/test/test.s3m ${D}${PTEST_PATH}/test
>>>> +    install -m 0644 ${S}/test/test.xm ${D}${PTEST_PATH}/test
>>>> +
>>>> +    install -d ${D}${PTEST_PATH}/libopenmpt
>>>> +    install -m 0644 ${S}/libopenmpt/libopenmpt_version.mk ${D}${PTEST_PATH}/libopenmpt
>>>> +}
>>>> +
>>>> +python __anonymous() {
>>>> +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
>>>> +    if ("sdl" in packageconfig) and ("sdl2" in packageconfig):
>>>> +        bb.error("sdl and sdl2 packageconfigs cannot be both enabled")
>>>> +}
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


