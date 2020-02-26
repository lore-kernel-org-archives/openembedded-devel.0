Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A23861851
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 06:24:43 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l21so1476232qtr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 22:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DLLtck2A4jguol84jYvv1Ffzmqicgvk2Y28KugfXql4=;
	b=MKHzwbJBg3fsr/DCp9Y4ZuL81exVqCPCyeNqkU3ibyBm8bGTCdMt5qJ9CJ5HDCSwGv
	RMCBQnVha/EOUj+kJkp/kqHeOaOT+FbO1a9yveF85RZb6mte9WHZEDBr/fKBAPcaRJ0a
	xQ2y3oz7ajpBFFnVbYMaLYZcVYFJaWXYGpqjWHXqpZcjL42uh34ogWCEjh3PGSW6d86v
	geKDD+i98jv938tWOsTeyln6QwCxSDqCuqp7I4A+A64Thezek5e6sEgPHEuGsZGD5st5
	thL7WjjhmNH4mOo3QZ5HHkOMNmAQOEaG7QGLmHKjxnvkM6dcVXEJBddkRcAX/dBsEJ0N
	tcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DLLtck2A4jguol84jYvv1Ffzmqicgvk2Y28KugfXql4=;
	b=mixawD9kPwpzu3FJKoSva1kfKA/orNZdilZ1UgbbOwRDa1VO+G8ArClwhchPxjS/2V
	HZlxqmrMyKRe2dPdJ6pJdYft418VL6xbIgSGoy+FZ77C0p86enQmNvpluPZFYYXU1f/I
	f348MKSv7gidxVrsTj4dsTqunoLJN//I/yFCV14pFiz8F4e4s18srovNGVGmspVvRIrc
	LTDY7CF1HhvRYTaoP15HEkE301VLIk0DrINwnY3ZoFJjFEAX4i/goYKIvHpj1GTpYn39
	pPh3ZNfsXM8Ci1kOOhLv2Uik/XWebDPaZt8Gj66mT+HBA82cZS4ozRvuV9q2Ismf4r2s
	fEjw==
X-Gm-Message-State: APjAAAUHSKoaw5PstJI7Tc2aPeAFwLMNHVu6uj23GzryUQQriJfIJREA
	+UXJaS0M5bcVbVxRi/n8TXlwBUrAdSDD+PIZMrUhnAT4i3Y=
X-Google-Smtp-Source: APXvYqyd3wW0OrFaIX5lY4I8lk3MUt3HgZtkKLu5gX9nL52Z1gCXoe/nrTcKZW0gcu29M5vtNKPpU3HDtdGRl6RF89k=
X-Received: by 2002:ac8:709:: with SMTP id g9mr3386107qth.293.1582698284175;
	Tue, 25 Feb 2020 22:24:44 -0800 (PST)
MIME-Version: 1.0
References: <1582104095-88658-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1582104095-88658-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2020 22:24:18 -0800
Message-ID: <CAMKF1sr4t2oXTMBCQAUva4LvLZCWnUnx3HhZ=UBuoeyPGqnbxQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libharu: New recipe
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
X-List-Received-Date: Wed, 26 Feb 2020 06:24:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 1:23 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> libHaru is a library for generating PDF files.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../libharu/libharu-RELEASE_2_3_0_cmake.patch      | 52 ++++++++++++++++++++++
>  meta-oe/recipes-support/libharu/libharu_2.3.0.bb   | 24 ++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
>  create mode 100644 meta-oe/recipes-support/libharu/libharu_2.3.0.bb
>
> diff --git a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
> new file mode 100644
> index 0000000..332be1b
> --- /dev/null
> +++ b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
> @@ -0,0 +1,52 @@
> +Backport from Fedora Project.
> +https://src.fedoraproject.org/rpms/libharu
> +
> +Fix the install destination of some files.
> +
> +Upstream-Status: inappropriate
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +
> +diff -urp libharu-RELEASE_2_3_0/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/CMakeLists.txt
> +--- libharu-RELEASE_2_3_0/CMakeLists.txt       2013-10-30 20:11:59.000000000 +0700
> ++++ libharu-RELEASE_2_3_0_cmake/CMakeLists.txt 2017-06-01 15:56:06.533552795 +0700
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
> +--- libharu-RELEASE_2_3_0/src/CMakeLists.txt   2013-10-30 20:11:59.000000000 +0700
> ++++ libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt     2017-06-01 16:08:45.425105746 +0700
> +@@ -90,11 +90,13 @@ if(LIBHPDF_SHARED)
> +   target_link_libraries(${LIBHPDF_NAME} ${ADDITIONAL_LIBRARIES})
> +   if(WIN32 AND NOT CYGWIN)
> +       set_target_properties(${LIBHPDF_NAME} PROPERTIES DEFINE_SYMBOL HPDF_DLL_MAKE)
> ++  else(WIN32 AND NOT CYGWIN)
> ++      set_target_properties(${LIBHPDF_NAME} PROPERTIES SOVERSION ${LIBHPDF_VERSION})
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
> index 0000000..359f615
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

Please use a hardcoded SRCREV or release in SRC_URI, archives are
known to change
under the rug.

WARNING: libharu-2.3.0-r0 do_package_qa: QA Issue: libharu: SRC_URI
uses unstable GitHub archives [src-uri-bad]



> +           file://libharu-RELEASE_2_3_0_cmake.patch \
> +          "
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
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

