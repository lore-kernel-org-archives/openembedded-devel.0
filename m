Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA3C978CEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:40:18 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v8-v6so11552488oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RV9uRCIXSqmAq9dRyKOKvdUHuvVjLNNOVGSv5Ce3V7s=;
	b=lPx1e9+W/vj65+gRQtp8GEs6avlRGgwvyZCR8NuMwari9GzuUNOxjnjovtnnhBRewj
	s9Bs2tTuEYT6RYhuCh56k4JTQScHVLMXtovC8z+PS9SPEZnOYvr8688cacQpnFcv2hLN
	owcGV2kKvYYaJCeXIXzN690BsA3MeKGXFqkyPz5RDZRXLu7Th9/scfHMU4YpY7XHKaGn
	Mkon2aWqXSyWpjgAFavUck0pV1bpWCohwzYkF934Ybn56Ctzycf5H7bh5qbWqY/sR/at
	/PE1/dEdutcqxzSxlDx3yX4siyd4e4C/H8+ewO2JpurGEmXrSWaOyGxUKwPWyGL2Bpp+
	zYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RV9uRCIXSqmAq9dRyKOKvdUHuvVjLNNOVGSv5Ce3V7s=;
	b=H8Km3WoNNRy5PGzHPIpc8NpwHOa57eT1BBCLCkNg2B3bwz4ZnMa48GhA7CiL3osiaC
	g0hrIGpN1ucSwVpNxhHkOBdnly3luYVdP7U//lEV3K4MRqdZ9x/FKleznrrnMptPi9+I
	MwMIPGBdp3VC7DVUxLbXnWLzi1eDkAN0p/upsFkYuVGKaSJR1ix5on9EcbLk15K9qMTP
	5zW814/1XpkBLoYvkir6R1gObBK4lgG0cpuwdBzHxMb+khHjx9IFE6TjwoIniz6cibRK
	Rh7EVvJOAYRntMNBxUX7SyjJapFCdZ99wPkLwjorMRtr7ngXPHPVMuxbCFWmasScOwdj
	+/Hg==
X-Gm-Message-State: AOUpUlHBanEhOEjm1lGhcmRttldLlaZdC7JD8NxlLI4k+bx672v0OA9h
	l4Ua0otcVWFn7Wc7BeITZYG1hGyo
X-Google-Smtp-Source: AAOMgpfsIO+C3V7uxJaqgCp+JLi2CIij64NjegCtiOMnlg6ifFpq6ExsK7hL4J2a/m9HKBaisoufag==
X-Received: by 2002:aca:5841:: with SMTP id
	m62-v6mr8869512oib.346.1532727619481; 
	Fri, 27 Jul 2018 14:40:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9e0:3a49:ede8:663?
	([2601:202:4180:c33:9e0:3a49:ede8:663])
	by smtp.gmail.com with ESMTPSA id
	e204-v6sm7265231oif.21.2018.07.27.14.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 14:40:18 -0700 (PDT)
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	openembedded-devel@lists.openembedded.org
References: <20180727202524.31873-1-dv@pseudoterminal.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e12d30b6-bd70-9499-181f-3e17e6f9d57b@gmail.com>
Date: Fri, 27 Jul 2018 14:40:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727202524.31873-1-dv@pseudoterminal.org>
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
X-List-Received-Date: Fri, 27 Jul 2018 21:40:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/27/2018 01:25 PM, Carlos Rafael Giani wrote:
> libopenmpt is a cross-platform C++ and C library to decode tracked music
> files ("modules", like the .mod .xm .s3m .it formats) into raw PCM audio.
> It is based on the player code of OpenMPT module tracker.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
> ---
>  .../libopenmpt/files/run-ptest                |   9 ++
>  .../libopenmpt/libopenmpt_0.3.10.bb           | 104 ++++++++++++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
>  create mode 100644 meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest b/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
> new file mode 100644
> index 000000000..84981b22c
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/files/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +./libopenmpttest >/dev/null 2>&1
> +
> +if [ $? -eq 0 ]; then
> +   echo "PASS: libopenmpttest"
> +else
> +   echo "FAIL: libopenmpttest"
> +fi
> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
> new file mode 100644
> index 000000000..dddf80407
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
> @@ -0,0 +1,104 @@
> +SUMMARY = "C and C++ cross-platform library for decoding tracked music files (modules)"
> +DESCRIPTION = "libopenmpt is a cross-platform C++ and C library to decode tracked \
> +music files (modules) into a raw PCM audio stream. It also comes with openmpt123, a \
> +cross-platform command-line or terminal based module file player, and libopenmpt_modplug, \
> +a wrapper around libopenmpt that provides an interface that is ABI compatile with \
> +libmodplug. libopenmpt is based on the player code of the OpenMPT project."
> +HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
> +SECTION = "libs"
> +
> +DEPENDS = "virtual/libiconv"
> +
> +RDEPENDS_${PN}_libc-glibc = " \
> +    glibc-gconv-cp1252 \
> +    glibc-gconv-ibm437 \
> +    glibc-gconv-iso8859-1 \
> +    glibc-gconv-iso8859-15 \
The style seems to be a bit off. Please check
https://www.openembedded.org/wiki/Styleguide
- armin
> +"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e804150573f149befef6c07e173f20c3"
> +
> +SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
> +           file://run-ptest \
> +          "
> +SRC_URI[md5sum] = "66bbc6fbb5f27a554cb145d805e9ef9d"
> +SRC_URI[sha256sum] = "14a137b8d1a20e1b6a5e67cbc9467ab7e5e4e67d5aa38a247afc825685c53939"
> +
> +S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
> +
> +inherit autotools pkgconfig ptest
> +
> +PACKAGECONFIG ??= " \
> +    libopenmpt-modplug openmpt123 \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +    flac mpg123 ogg sndfile vorbis vorbisfile zlib \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
> +"
> +
> +# libopenmpt_modplug is a library that wraps libopenmpt calls into
> +# functions that are ABI compatible with libmodplug. This allows for
> +# using modplug headers and linking against libopenmpt_modplug
> +# instead of against the original libmodplug library.
> +# NOTE: The wrapper is compatible to the ABI from libmodplug version
> +# 0.8.8 and newer.
> +PACKAGECONFIG[libopenmpt-modplug] = "--enable-libopenmpt_modplug,--disable-libopenmpt_modplug"
> +PACKAGECONFIG[openmpt123]         = "--enable-openmpt123,--disable-openmpt123"
> +PACKAGECONFIG[tests]              = "--enable-tests,--disable-tests"
> +
> +# These packageconfigs affect openmpt123
> +PACKAGECONFIG[flac]               = "--with-flac,--without-flac,flac"
> +PACKAGECONFIG[mpg123]             = "--with-mpg123,--without-mpg123,mpg123"
> +PACKAGECONFIG[ogg]                = "--with-ogg,--without-ogg,libogg"
> +PACKAGECONFIG[portaudio]          = "--with-portaudio,--without-portaudio,portaudio-v19"
> +PACKAGECONFIG[pulseaudio]         = "--with-pulseaudio,--without-pulseaudio,pulseaudio"
> +PACKAGECONFIG[sdl]                = "--with-sdl,--without-sdl,virtual/libsdl"
> +PACKAGECONFIG[sdl2]               = "--with-sdl2,--without-sdl2,virtual/libsdl2"
> +PACKAGECONFIG[sndfile]            = "--with-sndfile,--without-sndfile,libsndfile1"
> +PACKAGECONFIG[vorbis]             = "--with-vorbis,--without-vorbis,libvorbis"
> +PACKAGECONFIG[vorbisfile]         = "--with-vorbisfile,--without-vorbisfile,libvorbis"
> +PACKAGECONFIG[zlib]               = "--with-zlib,--without-zlib,zlib"
> +
> +# --disable-libmodplug is necessary, since otherwise we'd
> +# have a collision with the libmodplug package, because of the
> +# libmodplug.so file. (libmodplug.so from libopenmpt isintended
> +# to be used as a drop-in replacement, and according to the
> +# documentation, is not complete.)
> +EXTRA_OECONF += " \
> +    --disable-doxygen-doc \
> +    --disable-examples \
> +    --disable-libmodplug \
> +    --without-portaudiocpp \
> +"
> +
> +# Since version 0.3, libopenmpt uses SemVer 2.0.0 versioning.
> +# The SemVer versioning scheme is incompatible with Debian/Ubuntu
> +# package version names.
> +DEBIAN_NOAUTONAME_${PN} = "1"
> +DEBIAN_NOAUTONAME_${PN}-modplug = "1"
> +
> +PACKAGES =+ "${PN}-modplug ${PN}-openmpt123 ${PN}-openmpt123-doc"
> +FILES_${PN}-modplug = "${libdir}/libopenmpt_modplug.so.*"
> +FILES_${PN}-openmpt123 = "${bindir}/openmpt123"
> +FILES_${PN}-openmpt123-doc = "${mandir}/man1/openmpt123*"
> +
> +do_compile_ptest() {
> +    oe_runmake ${PARALLEL_MAKE} libopenmpttest
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    install -m 0755 ${B}/libopenmpttest ${D}${PTEST_PATH}
> +    install -m 0644 ${S}/test/test.mptm ${D}${PTEST_PATH}/test
> +    install -m 0644 ${S}/test/test.s3m ${D}${PTEST_PATH}/test
> +    install -m 0644 ${S}/test/test.xm ${D}${PTEST_PATH}/test
> +
> +    install -d ${D}${PTEST_PATH}/libopenmpt
> +    install -m 0644 ${S}/libopenmpt/libopenmpt_version.mk ${D}${PTEST_PATH}/libopenmpt
> +}
> +
> +python __anonymous() {
> +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> +    if ("sdl" in packageconfig) and ("sdl2" in packageconfig):
> +        bb.error("sdl and sdl2 packageconfigs cannot be both enabled")
> +}


