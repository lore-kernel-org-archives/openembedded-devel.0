Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6045560B3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 04:59:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v23so8700216pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 20:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=QlDiIzgDep0KtcnSJ2G/3AclKhnEwdlkQSVL83giR0s=;
	b=C+M6j8hXoqzJLUjQTPSADryS1KlmAJNTj0GEeKBUp343ROZmI19NOCbz6h1ICEhuxe
	nksy+09fOzS55bmMdg2fG7Ah543HxOH1PDCrEsyYkkPQuuBYmJNJdOkSh8g+DFPVSi9O
	kyuPBvTObbpApjJ3hx1LPIdCDS7jlYDkGi7FiHWXj5YE4oQQnxySDtiUA4t596nYNkd9
	KLDDIR28tR7OlWCOi/utVxDOhmm1DZ3w4Fg+NLq5narFWUGwWXHMlEWeRX96lw5trqZo
	Mc38RvK6w8lyuYAIlFVJ0HaQxMnDHwFH1VC7JTgwRTNQnVydOI+ef12lYOZ/Ttc1QAG7
	pHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QlDiIzgDep0KtcnSJ2G/3AclKhnEwdlkQSVL83giR0s=;
	b=ckrtJTfRAZHKnl/cZJcVIwfvVuyA1hycpKlAZ0Vdk9ivChxJFy+iIzFWIJY/BnWQKU
	YMb8ky6HkFrWNQm11lrH/fY3/T4ZED9MV2aRBoRkTS32gLe+vW6HZTvWsaGdoFmt0l+J
	VhufxVQ5A1h19TQHyLJUyAoaJ9k6wdBSX9B5b12GklLtQXG0EBOW0oh9zFITwuSynDhP
	WgRBVTu6WuFK8PRlgWtJ/0/XZRMPPehRjM1glz+/WBPWvHm8aORJGi56LfThV71IfnXc
	40jnS3SOMzOMTp4xBgP9N5zyc8n3rjJBZoJF9by9OQ6YczpkgbRrc075OFARL+I7JSSV
	8TJg==
X-Gm-Message-State: APjAAAUJNGUDIEZkhnVEASs28Xt8gVYODUPdz88sMl9W1fP1I85e8vZl
	VRsSm4YmsJiHEjeeldgqQKDLaJaU
X-Google-Smtp-Source: APXvYqxlDKfQf4eQ1Jx1766SHPJI3RwiVxSjqduKOZbaxDlHgwlwUuyz4j1etuKpY8jovseZIB+TqQ==
X-Received: by 2002:a62:6342:: with SMTP id x63mr24959110pfb.103.1582088341729;
	Tue, 18 Feb 2020 20:59:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:103:47a6:6829:8136?
	([2601:202:4180:a5c0:103:47a6:6829:8136])
	by smtp.gmail.com with ESMTPSA id s18sm655408pgn.34.2020.02.18.20.59.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 20:59:01 -0800 (PST)
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1582084050-88052-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <eee74488-0643-55e2-79b2-a76863fd0612@gmail.com>
Date: Tue, 18 Feb 2020 20:58:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582084050-88052-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] libharu: New recipe
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
X-List-Received-Date: Wed, 19 Feb 2020 04:59:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/18/20 7:47 PM, Zheng Ruoqin wrote:
> libHaru is a library for generating PDF files.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../libharu/libharu-RELEASE_2_3_0_cmake.patch | 45 +++++++++++++++++++
>  .../recipes-support/libharu/libharu_2.3.0.bb  | 24 ++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
>  create mode 100644 meta-oe/recipes-support/libharu/libharu_2.3.0.bb
>
> diff --git a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
> new file mode 100644
> index 000000000..a176f557d
> --- /dev/null
> +++ b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
> @@ -0,0 +1,45 @@
> +Backport from RHEL8.

Missing signed-off-by and Upstream-Status:

For options, please see:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

- armin
> +
> +diff -urp libharu-RELEASE_2_3_0/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/CMakeLists.txt
> +--- libharu-RELEASE_2_3_0/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
> ++++ libharu-RELEASE_2_3_0_cmake/CMakeLists.txt	2017-06-01 15:56:06.533552795 +0700
> +@@ -25,7 +25,7 @@ endif(MSVC)
> + 
> + # information about libharu
> + set(LIBHPDF_MAJOR 2)
> +-set(LIBHPDF_MINOR 2)
> ++set(LIBHPDF_MINOR 3)
> + set(LIBHPDF_PATCH 0)
> + set(LIBHPDF_VERSION ${LIBHPDF_MAJOR}.${LIBHPDF_MINOR}.${LIBHPDF_PATCH})
> + set(LIBHPDF_DESCRIPTION "libHaru is a free, cross platform, open source library for generating PDF files.")
> +@@ -210,9 +210,9 @@ set(
> + install(FILES ${haru_HDRS} DESTINATION include)
> + 
> + # install various files
> +-install(FILES README CHANGES INSTALL DESTINATION .)
> ++install(FILES README CHANGES INSTALL DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
> + if(NOT DEVPAK)
> +-  install(DIRECTORY if DESTINATION .)
> ++  install(DIRECTORY if DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
> + endif(NOT DEVPAK)
> + if(DEVPAK)
> +   install(FILES ${CMAKE_BINARY_DIR}/libharu.DevPackage DESTINATION .)
> +diff -urp libharu-RELEASE_2_3_0/src/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt
> +--- libharu-RELEASE_2_3_0/src/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
> ++++ libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt	2017-06-01 16:08:45.425105746 +0700
> +@@ -90,11 +90,13 @@ if(LIBHPDF_SHARED)
> +   target_link_libraries(${LIBHPDF_NAME} ${ADDITIONAL_LIBRARIES})
> +   if(WIN32 AND NOT CYGWIN)
> +   	set_target_properties(${LIBHPDF_NAME} PROPERTIES DEFINE_SYMBOL HPDF_DLL_MAKE)
> ++  else(WIN32 AND NOT CYGWIN)
> ++  	set_target_properties(${LIBHPDF_NAME} PROPERTIES SOVERSION ${LIBHPDF_VERSION})
> +   endif(WIN32 AND NOT CYGWIN)
> +   install(
> +     TARGETS ${LIBHPDF_NAME}
> +-    ARCHIVE DESTINATION lib
> +-    LIBRARY DESTINATION lib
> ++    ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
> ++    LIBRARY DESTINATION ${LIB_INSTALL_DIR}
> +     RUNTIME DESTINATION bin
> +   )
> + endif(LIBHPDF_SHARED)
> diff --git a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
> new file mode 100644
> index 000000000..359f615ba
> --- /dev/null
> +++ b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "free PDF library"
> +HOMEPAGE = "http://libharu.org"
> +DESCRIPTION = "libHaru is a library for generating PDF files. \
> +               It is free, open source, written in ANSI C and cross platform. "
> +
> +LICENSE = "Zlib"
> +LIC_FILES_CHKSUM = "file://README;md5=3ee6bc1f64d9cc7907f44840c8e50cb1"
> +
> +SRC_URI = "https://github.com/libharu/${BPN}/archive/RELEASE_${@d.getVar('PV').replace('.','_')}.tar.gz \
> +           file://libharu-RELEASE_2_3_0_cmake.patch \
> +	   "
> +
> +SRC_URI[md5sum] = "4f916aa49c3069b3a10850013c507460"
> +SRC_URI[sha256sum] = "8f9e68cc5d5f7d53d1bc61a1ed876add1faf4f91070dbc360d8b259f46d9a4d2"
> +
> +S = "${WORKDIR}/${BPN}-RELEASE_${@d.getVar('PV').replace('.','_')}"
> +
> +inherit cmake
> +DEPENDS += "libpng zlib"
> +
> +do_install_append() {
> +     mkdir -p ${D}/${datadir}/libharu
> +     mv ${D}/libharu ${D}/${datadir}
> +}


