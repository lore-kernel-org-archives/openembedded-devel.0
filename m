Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 174826C4F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 00:16:45 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id e5so7664242qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2018 16:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HtqqotCAXqGPMbGXyS19FGO7DOhxmDh2JqAdBuS8iLo=;
	b=eLH4ZsfGcgBTzACWL9JrrJ9cSx+2TaDzdriQOjtLW98RdTjPgkT2gpiBErYW24jVK0
	G+k3jkEQEyJnsQ4QJq3mBej5QhFSC9k0nxQlSq6oYyXzQzNO+GsR7ragtXQAbRk8Z69t
	c8bEOqT2vDzFbywcZ2ZljOleFR2QnNWCzm+NKH3GRakiBpFqaK5U84MLj1kevuk00oDt
	Fy8BLwhTg0vTUjA2i3TD9gSJ+3Bbb2GHIUDIUM7znfLkRCnx9/10htm1PT5LbPBLTkUq
	acfjHWUUCWa6q6ESWvcJL0bDvc7bvJhr3JgXz/9C0VZCTqT046JhHoZr+UVzErBXo/ZS
	q6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HtqqotCAXqGPMbGXyS19FGO7DOhxmDh2JqAdBuS8iLo=;
	b=hqQBIRldpssbda3mbxSylDvGgvj9qtlkGTINfqg4MHC4/5XmxRCd55OsXR2MKRLz5K
	HDyKMi0Rb2O4DnMNAtKtLSQ0KQK8cjJjMH67aUmW3WSqUSNt+2U5rMHecbN1b5DcBasV
	Un37NUOAsSEm4PqWsYXq1aac0ZinETngGa0GccQd1HF0D1j2jdL35dPIcqbqxZaS0Omr
	q6NOTRmVSOLqxGYa59RfqPH2XSBAeWaHDMQ5orZHRTCyuuzned+/ppad7+QiQewCvUWQ
	BxK1bqhRSqvTxPq1efi1xF17v8Ea1nUcEBh6bMuNIjEodyiaoqXmROsR2o5QqxEvGeTv
	hfAw==
X-Gm-Message-State: AJcUukcE37QPI090Vpx7PxvIGnmIFYSyc/iv73TyTtcuIMMkNGFSgPq3
	g09Fi1QlCrkTt5qB447EqCQx1XzNbMGN5rWj5vg=
X-Google-Smtp-Source: AFSGD/UmsyVO6i5S5xDmf1fNcwjtl/NS35FIrPsECG4ebE7SbjNDEXTHlBDc8S5A46sLj/6NETcNWmcCOcHikWwQCaU=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr4429193qtf.196.1545437806599; 
	Fri, 21 Dec 2018 16:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<20181003192455.24921-2-schnitzeltony@gmail.com>
In-Reply-To: <20181003192455.24921-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Dec 2018 16:16:20 -0800
Message-ID: <CAMKF1spmLtb3TZn8UD8B=KDW6Y5mfnuMAc6tMbZado_XidGauw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/8] openjpeg: cmake fixes to prepare update of poppler
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
X-List-Received-Date: Sat, 22 Dec 2018 00:16:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

We applied this patch but its causing regression for mutlilib builds
as reported here

https://github.com/openembedded/meta-openembedded/issues/103

Can you take a look

On Wed, Oct 3, 2018 at 12:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * Move *,cmake from ${libdir}/cmake to ${libdir}/cmake/<name-and-version>
>   That is standard location cmake files are installed.
> * Do not export executables - they will not be found in dependant's sysro=
ot
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...ke-files-are-installed-at-common-location.patch | 48 ++++++++++++++++=
++++++
>  ...cmake-to-export-binaries-they-don-t-make-.patch | 31 ++++++++++++++
>  .../recipes-graphics/openjpeg/openjpeg_2.3.0.bb    | 10 ++---
>  3 files changed, 84 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensur=
e-cmake-files-are-installed-at-common-location.patch
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-no=
t-ask-cmake-to-export-binaries-they-don-t-make-.patch
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake=
-files-are-installed-at-common-location.patch b/meta-oe/recipes-graphics/op=
enjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.pa=
tch
> new file mode 100644
> index 000000000..5c5fe64f2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-=
are-installed-at-common-location.patch
> @@ -0,0 +1,48 @@
> +From fe491c0919f5adc8d626cb98c5ec19d0b99dfe20 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 27 Sep 2018 23:45:04 +0200
> +Subject: [PATCH] Ensure cmake files are installed at common location
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* Otherwise recent poppler is not able to find them
> +* Include path needs adjustment with this change
> +
> +Upstream-Status: Inappropriate [Configuration]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + CMakeLists.txt                | 2 +-
> + cmake/OpenJPEGConfig.cmake.in | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ff70a06f..23d2fac4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -150,7 +150,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
> +   # We could install *.cmake files in share/ however those files contai=
ns
> +   # hardcoded path to libraries on a multi-arch system (fedora/debian) =
those
> +   # path will be different (lib/i386-linux-gnu vs lib/x86_64-linux-gnu)
> +-  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/${OPENJ=
PEG_INSTALL_SUBDIR}")
> ++  set(OPENJPEG_INSTALL_PACKAGE_DIR "${OPENJPEG_INSTALL_LIB_DIR}/cmake/$=
{OPENJPEG_INSTALL_SUBDIR}")
> + endif()
> +
> + if (APPLE)
> +diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.=
in
> +index b20294ca..6a2f4baf 100644
> +--- a/cmake/OpenJPEGConfig.cmake.in
> ++++ b/cmake/OpenJPEGConfig.cmake.in
> +@@ -26,7 +26,7 @@ get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_=
FILE}" PATH)
> + if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
> +   # This is an install tree
> +   include(${SELF_DIR}/OpenJPEGTargets.cmake)
> +-  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../@OPEN=
JPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> ++  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../../@O=
PENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> +   set(OPENJPEG_INCLUDE_DIRS ${OPENJPEG_INCLUDE_ROOT})
> +
> + else()
> +--
> +2.14.4
> +
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-c=
make-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics/o=
penjpeg/openjpeg/0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.=
patch
> new file mode 100644
> index 000000000..0ba13cf88
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to=
-export-binaries-they-don-t-make-.patch
> @@ -0,0 +1,31 @@
> +From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Fri, 28 Sep 2018 00:38:50 +0200
> +Subject: [PATCH] Do not ask cmake to export binaries - they don't make i=
t
> + dependants sysroots
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + src/bin/jp2/CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
> +index 4324c36d..2c11fe02 100644
> +--- a/src/bin/jp2/CMakeLists.txt
> ++++ b/src/bin/jp2/CMakeLists.txt
> +@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
> +   endif()
> +   # Install exe
> +   install(TARGETS ${exe}
> +-    EXPORT OpenJPEGTargets
> +     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
> +   )
> +   if(OPJ_USE_DSYMUTIL)
> +--
> +2.14.4
> +
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> index d5d06206d..c50d55e4b 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840=
d7babaade1303e7f108c"
>
>  DEPENDS =3D "libpng tiff lcms zlib"
>
> -SRC_URI =3D "git://github.com/uclouvain/openjpeg.git"
> +SRC_URI =3D " \
> +    git://github.com/uclouvain/openjpeg.git \
> +    file://0001-Ensure-cmake-files-are-installed-at-common-location.patc=
h \
> +    file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.pat=
ch \
> +"
>  SRCREV =3D "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
> -
> -# standard path for *.cmake
> -EXTRA_OECMAKE +=3D "-DOPENJPEG_INSTALL_PACKAGE_DIR=3D${baselib}/cmake \
> -                  -DOPENJPEG_INSTALL_LIB_DIR:PATH=3D${libdir}"
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

