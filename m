Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.2385.1609812447522759462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 18:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G6bICbFX;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id v126so25289333qkd.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 18:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y5fFG4uVOSsVIG+2hxhnYGSBsnqBTbXF/cWHHqURIQ8=;
        b=G6bICbFXnQOF+IYnWuV0vpRI5pqjYI8oAVPLVGZeOwn/W86485KWu8Z8oRNwT+AnY2
         FvNHPlsQnK5eaHP6XsJMJJQoG1VOX6KsswQI3XiNi3R+Su+YkoPiy2mpurAP2FLheMuQ
         DqzDbY2iZ9E0yIfoWqGrVwUmNr32DVVvlA+K5e5IfEw1JKlSztSFebkwHDxl9Oakc1sX
         nON0VeNb+NrlxqZwYjTp0VFpwhi6SMCte/hulgLhrVWhWe/mSw5pNB2dQv8xV28+RT39
         Urj0b6ntJAtwc4sNM8qGIkLNn5HN7DGlMZKLbZZIkqkGMHtaeI2t7SJ6xL0vqWzLt98+
         3lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y5fFG4uVOSsVIG+2hxhnYGSBsnqBTbXF/cWHHqURIQ8=;
        b=c+ENSWkocB1L8XE3e+ch8kj0V01QkJk1N7Y1BEyRUamsVZdK4m6Fm50EgGfQb1Ig2Z
         cSZJMojQit0PU68hHLs8D1A06o//PbPaRalF18qt7dNf4WqRZOQ7u4MvVKRGTGzr8nV8
         zvr/iCOpI/1qakYeq639eiNbY9lGnuDp8YU73jPUrZYOsByHW/Tta4APNCDugRXuL+2o
         Mc0wQmkY7rbTNqzfSYdJEIiHYBDQOFIJPYwldVo0qNSIKGv+XwewYBXtA1uDZ9RuFlrL
         GIkz3EkzBra1SL/6+92VJvAWddSnAiFfIZYdiSnm4KO0lBcCpg2/t7aFua41B3fUjydq
         amlA==
X-Gm-Message-State: AOAM533Tj1KLOTOz8/jGcXaj1EvQuE9+z1H+k+wHvtp8dbPsK44DHsA8
	A0n9YxoCzJBA+sAcp3K/XwLC+H+W7tU+CqiQ4Uw=
X-Google-Smtp-Source: ABdhPJyUuTs8vNwXO87qNA+KQPhhTAlejl+c3VCHFXV/ps7Dw/wlG8J3TqWVDSUtU4iZ4TLuCH/CLhPdmMQFaBBfPx0=
X-Received: by 2002:a37:88c2:: with SMTP id k185mr59647484qkd.474.1609812446595;
 Mon, 04 Jan 2021 18:07:26 -0800 (PST)
MIME-Version: 1.0
References: <1608278860-111600-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1608278860-111600-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 4 Jan 2021 18:07:01 -0800
Message-ID: <CAMKF1sr+JqTfqs2KvSvfzQahPHmCA0JBySkGvNebxJQyHuqKjA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] poppler: upgrade 20.11.0 -> 20.12.1
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this error

https://errors.yoctoproject.org/Errors/Details/540475/

On Fri, Dec 18, 2020 at 12:09 AM zhengruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Refresh the following patch:
> 0001-Do-not-overwrite-all-our-build-flags.patch
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...1-Do-not-overwrite-all-our-build-flags.patch | 17 ++++++++++-------
>  .../{poppler_20.11.0.bb =3D> poppler_20.12.1.bb}  |  2 +-
>  2 files changed, 11 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-support/poppler/{poppler_20.11.0.bb =3D> poppler=
_20.12.1.bb} (96%)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwri=
te-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001=
-Do-not-overwrite-all-our-build-flags.patch
> index 05e0abede..afb0b5df0 100644
> --- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-=
our-build-flags.patch
> +++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-=
our-build-flags.patch
> @@ -15,12 +15,12 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gm=
ail.com>
>
>  --- a/cmake/modules/PopplerMacros.cmake
>  +++ b/cmake/modules/PopplerMacros.cmake
> -@@ -123,14 +123,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
> +@@ -104,14 +104,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
>     set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
> -
> +
>     set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
> --  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -D_DEFAULT_SOURCE")
> -+  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
> +-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -fno-operator-names -D_DEFAULT_SOURCE")
> ++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -fno-operator-names -D_DEFAULT_SOURCE ${_save_cxxflags}")
>     set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
>     set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
>     set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-=
schedule-insns -fno-inline ${_save_cxxflags}")
> @@ -32,16 +32,16 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gm=
ail.com>
>     set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
>     set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
>     set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-=
schedule-insns -fno-inline ${_save_cflags}")
> -@@ -167,7 +167,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
> +@@ -149,7 +149,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
>     set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
> -
> +
>     set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
>  -  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -D_DEFAULT_SOURCE")
>  +  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -=
fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
>     set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
>     set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
>     # clang does not support -fno-reorder-blocks -fno-schedule-insns, so=
 do not use -O2
> -@@ -175,7 +175,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
> +@@ -157,7 +157,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
>     set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags=
}")
>     set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage =
-fprofile-arcs ${_save_cxxflags}")
>     set(_save_cflags "${CMAKE_C_FLAGS}")
> @@ -50,3 +50,6 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
>     set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
>     set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
>     # clang does not support -fno-reorder-blocks -fno-schedule-insns, so=
 do not use -O2
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/poppler/poppler_20.11.0.bb b/meta-o=
e/recipes-support/poppler/poppler_20.12.1.bb
> similarity index 96%
> rename from meta-oe/recipes-support/poppler/poppler_20.11.0.bb
> rename to meta-oe/recipes-support/poppler/poppler_20.12.1.bb
> index 729923d40..87a57523f 100644
> --- a/meta-oe/recipes-support/poppler/poppler_20.11.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_20.12.1.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.xz=
 \
>             file://0001-Do-not-overwrite-all-our-build-flags.patch \
>             file://basename-include.patch \
>             "
> -SRC_URI[sha256sum] =3D "021557074516492375c2bb4226a413aad431159e9177f9f=
14dff4159d2723b14"
> +SRC_URI[sha256sum] =3D "d0aa2586c0a4296c775f0d2045f28bb95a694113fc995f9=
5350faa12930f7b35"
>
>  DEPENDS =3D "fontconfig zlib cairo lcms glib-2.0"
>
> --
> 2.25.1
>
>
>
>
>=20
>
