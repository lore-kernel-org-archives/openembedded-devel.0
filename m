Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0B89A7E97C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 18:07:26 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id x4so3247020qtq.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mwiRXGBxjY1clSVVYx0VMnFoeA3fi90E9pC8XESj+qg=;
	b=VW0uIcF3M5F5pafKyoPwtxZCxrjyWxUWRzgC+e5BKP6quZxysqgGtkF2sDczpjzXOK
	LqSkGKK0p+/IgbvjMB19m3QYl0bbxye0QkQSKl6+GLDGwCMw1u6NJV3q8zMTxZ8LFnPY
	WRqxvm5JLKroH9r9PTbgR20YMl/4wBiGxJgU+XJJNXemvSeJOEFGumhKvraBARjKt5pN
	uFeCHb19vr8aCcC4MTImzkmqaMd5jkkoUDUMI8TClw9TFRWssWQqvEpfT7tDq+2OPPoj
	zw1fjARguqwJRmTfLTLDAsj7lifpVVd4+EVhy3uBHDEIDSLc28DB4YNflPSBXPG9pjBr
	A7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mwiRXGBxjY1clSVVYx0VMnFoeA3fi90E9pC8XESj+qg=;
	b=uVX5qADivK0//uPsgYoN54SR645AddqZIWPYKFNa2l++hBO2RnJ+9cu/taoGI/p6Uj
	XkvyrDsxhHFqJtnHA7ADqv0jktQwUKZSt09q57RH7l2/EOXKbrpCN34s5JF1883R3XvL
	8ZipRkduDNiPKiOJdv+CdR8fiH22vOxW3QTzNZ4IYBErXBQyzdtvqoz2hRkVbo6qdW1T
	cHzU6UwusOahTCHQutxkdbtJl2DqSzuI0dT8SCrgbr70Wgv9mrx1FiJe/BJTYNTfkvLw
	pqX2XQHHTJKnc/Os9bLJnrWjO4qam/RRD7v9eDxdaNxRWBeHtVoIkwTONgQxZIfOSPGJ
	b55A==
X-Gm-Message-State: APjAAAXGNVZiLK7yQSydZlIchLd7+bB0u8nLb0/EkQigr0SjLYPYdfw0
	7WHxtZ7/KEdPHP8YusDY5Hoce5ngzlQqqo9eitY=
X-Google-Smtp-Source: APXvYqwL4TlqILV2jPPTjiy8OGniwEPdbK/vdCMiS3s9wGmC6ngPGtdXlMvptq1RjxlRVzzAOYaXaiXckx/wa2PYs/U=
X-Received: by 2002:ac8:1103:: with SMTP id c3mr4514068qtj.88.1568398047676;
	Fri, 13 Sep 2019 11:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <1568386232-11750-1-git-send-email-trevor.gamblin@windriver.com>
In-Reply-To: <1568386232-11750-1-git-send-email-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 11:07:14 -0700
Message-ID: <CAMKF1soz9VikjDpvQvN3NbJ5-k+HLiZKmKV1g9f3TUPP-SUbyA@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] openjpeg: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Fri, 13 Sep 2019 18:07:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this has some breakages

https://errors.yoctoproject.org/Errors/Details/270229/


On Fri, Sep 13, 2019 at 7:50 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
> from upstream.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  ...ke-files-are-installed-at-common-location.patch | 37 ++++++++--------=
------
>  .../{openjpeg_2.3.0.bb =3D> openjpeg_2.3.1.bb}       |  2 +-
>  2 files changed, 15 insertions(+), 24 deletions(-)
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb =3D> openjpe=
g_2.3.1.bb} (91%)
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake=
-files-are-installed-at-common-location.patch b/meta-oe/recipes-graphics/op=
enjpeg/openjpeg/0001-Ensure-cmake-files-are-installed-at-common-location.pa=
tch
> index 5c5fe64..dab2d7d 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-=
are-installed-at-common-location.patch
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Ensure-cmake-files-=
are-installed-at-common-location.patch
> @@ -1,27 +1,18 @@
> -From fe491c0919f5adc8d626cb98c5ec19d0b99dfe20 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Thu, 27 Sep 2018 23:45:04 +0200
> -Subject: [PATCH] Ensure cmake files are installed at common location
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> +From 1f15a8e565976036aaf9f29322f477d52f8a5cdd Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Fri, 13 Sep 2019 10:11:08 -0400
> +Subject: [PATCH] openjpeg: Ensure cmake files are installed at common lo=
cation
>
> -* Otherwise recent poppler is not able to find them
> -* Include path needs adjustment with this change
> -
> -Upstream-Status: Inappropriate [Configuration]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
>   CMakeLists.txt                | 2 +-
>   cmake/OpenJPEGConfig.cmake.in | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index ff70a06f..23d2fac4 100644
> +index 3ea2424a..fc1978da 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -150,7 +150,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
> +@@ -151,7 +151,7 @@ if(NOT OPENJPEG_INSTALL_PACKAGE_DIR)
>     # We could install *.cmake files in share/ however those files contai=
ns
>     # hardcoded path to libraries on a multi-arch system (fedora/debian) =
those
>     # path will be different (lib/i386-linux-gnu vs lib/x86_64-linux-gnu)
> @@ -31,18 +22,18 @@ index ff70a06f..23d2fac4 100644
>
>   if (APPLE)
>  diff --git a/cmake/OpenJPEGConfig.cmake.in b/cmake/OpenJPEGConfig.cmake.=
in
> -index b20294ca..6a2f4baf 100644
> +index 2925108a..f2541c8b 100644
>  --- a/cmake/OpenJPEGConfig.cmake.in
>  +++ b/cmake/OpenJPEGConfig.cmake.in
> -@@ -26,7 +26,7 @@ get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_=
FILE}" PATH)
> - if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
> -   # This is an install tree
> -   include(${SELF_DIR}/OpenJPEGTargets.cmake)
> --  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../@OPEN=
JPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> +@@ -32,7 +32,7 @@ if(EXISTS ${SELF_DIR}/OpenJPEGTargets.cmake)
> +   set(INC_DIR "@CMAKE_INSTALL_PREFIX@/@OPENJPEG_INSTALL_INCLUDE_DIR@")
> +   file(RELATIVE_PATH PKG_TO_INC_RPATH "${PKG_DIR}" "${INC_DIR}")
> +
> +-  get_filename_component(OPENJPEG_INCLUDE_DIRS "${SELF_DIR}/${PKG_TO_IN=
C_RPATH}" ABSOLUTE)
>  +  get_filename_component(OPENJPEG_INCLUDE_ROOT "${SELF_DIR}/../../../@O=
PENJPEG_INSTALL_INCLUDE_DIR@" ABSOLUTE)
> -   set(OPENJPEG_INCLUDE_DIRS ${OPENJPEG_INCLUDE_ROOT})
>
>   else()
> +   if(EXISTS ${SELF_DIR}/OpenJPEGExports.cmake)
>  --
> -2.14.4
> +2.17.1
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> similarity index 91%
> rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> index d30ff48..3312df7 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D " \
>      file://0001-Ensure-cmake-files-are-installed-at-common-location.patc=
h \
>      file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.pat=
ch \
>  "
> -SRCREV =3D "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
> +SRCREV =3D "57096325457f96d8cd07bd3af04fe81d7a2ba788"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

