Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.3758.1599812874096428945
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 01:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=atf+GyCH;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id w2so3613394wmi.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fE1teQ14tpzToHxWSMfGXWpHBwddQ+JeSBNdxA7+6lc=;
        b=atf+GyCHp9SrOtE/PG/Nn0sschb2WYO5/cpoBbQOAkL8sJ5TUZ3v3Mh9iohMt8jZJU
         rs5+kFtZ4m36pufnd6FfCr4Hy7kKIWcdzqU0KAbc2+r/SbIU51TZ2h0VY9HiMwg6kMnz
         8i7+LJGHvo6X772EYu4Y1+gGkbN9vnl9Lyu0Q3Tx1S/u5KQ1sOr5HCX3m7pI31UhX/o7
         4q284vESF7nvPih/JF18IhLa3rs8hIk1MXHntVoEqt6c9pu2Srq1XAlCW+PlpV7hPqy4
         Rnqs7QCoq+ewEXZTwA+7ND0railJP8FSfVQpWrMdx5pPFds7EZ3+qM19ltm4L073Zg2X
         9ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fE1teQ14tpzToHxWSMfGXWpHBwddQ+JeSBNdxA7+6lc=;
        b=EfwnYRQ3/VZhTFIKKkJltRBUGva70li7mob/qQUmiSPo913Zdzu7FfMZoMgeM8PVOc
         lk6yPy8/lRrG3XnBbh9tskArK4IeHRXHTZ9Od+7YXvaL0aMSwkGd0sRVwwfoF+rRZM/w
         4/HTTGGUzhNGyovwknjxsLKQxPawXqxFxnByAVqbpRl6R0Zi7fU8Po5pWV/7wsOHuBZv
         Fxo5wj9Yy6Xd7CTiztNGfsAmHYLptxxIWna3o1CFgawHHhQfp5KNYgAVwk3VkamNhARo
         gobYWV/J7E9muaGTXVNrngTYxTzicfoEpj3xzSmTgaPXGHM98bJOLLbrQiv76X+mNzQH
         9Shw==
X-Gm-Message-State: AOAM532i06HLAJuTZgA/43pJHE9eP5phuxO+QcAoE8wps0PcCh6ijJmV
	v4WM3a9t0KdkI8p+pMrFGB9Msknj7O3yL0dsJfM=
X-Google-Smtp-Source: ABdhPJweTQbawlB16FsOliLs63V4peT3IbqTIeFtQXO0EOrMGKvEzqEe7RArgutosAjnIEBiN1n9DiahDSlk+QRBJKQ=
X-Received: by 2002:a1c:99c7:: with SMTP id b190mr1012683wme.44.1599812872402;
 Fri, 11 Sep 2020 01:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <1599831015-15643-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1599831015-15643-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "nefethael" <vincent.prince.fr@gmail.com>
Date: Fri, 11 Sep 2020 10:27:41 +0200
Message-ID: <CAB2nKc9MULnmivFDy6DmgfKCq4V44pjMpq2eC-iwk+c3pYGyJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] zeromq: upgrade 4.3.2 -> 4.3.3
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Note that this release fixes CVE-2020-15166.

Best regards,
Vincent

Le ven. 11 sept. 2020 =C3=A0 03:30, zangrc <zangrc.fnst@cn.fujitsu.com> a =
=
=C3=A9crit :
>
> Refresh the following patch:
> 0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...void-host-specific-path-to-libsodium.patch | 19 +++++++++++++------
>  .../{zeromq_4.3.2.bb =3D> zeromq_4.3.3.bb}      |  4 ++--
>  2 files changed, 15 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb =3D> zeromq=
_4.3.3.bb} (87%)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-t=
xt-Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivi=
ty/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.p=
atch
> index eb3dee4d3..3b0300c8a 100644
> --- a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoi=
d-host-specific-path-to-libsodium.patch
> +++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoi=
d-host-specific-path-to-libsodium.patch
> @@ -1,6 +1,7 @@
> +From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon Sep 17 00:00:00 2001
>  From: Niko Mauno <niko.mauno@vaisala.com>
> -Date: Wed Apr 22 09:00:00 2020 +0300
> -Subject: CMakeLists.txt: Avoid host-specific path to libsodium
> +Date: Wed, 22 Apr 2020 09:00:00 +0300
> +Subject: [PATCH] CMakeLists.txt: Avoid host-specific path to libsodium
>
>  Avoid propagating full build host specific path to generated
>  ZeroMQTargets.cmake when building with libsodium, which changes the
> @@ -17,10 +18,16 @@ Upstream-Status: Pending
>
>  Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e92141d..d0775c1 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -1210,7 +1210,7 @@
> -   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LI=
BS_INIT})
> +@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)
> +   endif()
>
>     if(SODIUM_FOUND)
>  -    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
> @@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>       # On Solaris, libsodium depends on libssp
>       if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
>         target_link_libraries(libzmq ssp)
> -@@ -1240,7 +1240,7 @@
> -   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_TH=
READ_LIBS_INIT})
> +@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)
> +   endif()
>
>     if(SODIUM_FOUND)
>  -    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-=
oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
> similarity index 87%
> rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
> rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
> index 02a4c04fd..a10500475 100644
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
> @@ -10,8 +10,8 @@ SRC_URI =3D "http://github.com/zeromq/libzmq/releases/=
download/v${PV}/zeromq-${PV}
>      file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.pa=
tch \
>      file://run-ptest \
>  "
> -SRC_URI[md5sum] =3D "2047e917c2cc93505e2579bcba67a573"
> -SRC_URI[sha256sum] =3D "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c=
33c5378e22740f763"
> +SRC_URI[md5sum] =3D "78acc277d95e10812d71b2b3c3c3c9a9"
> +SRC_URI[sha256sum] =3D "9d9285db37ae942ed0780c016da87060497877af45094ff=
9e1a1ca736e3875a2"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases"
>
> --
> 2.25.1
>
>
>
>=20
