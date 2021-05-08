Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7830.1620488404604533099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 08:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kW5hWFkX;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h14-20020a17090aea8eb02901553e1cc649so7064184pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GL47OecEOtaIZsCouckHhnwBHGg5C6AOClQQPqBeeOs=;
        b=kW5hWFkXQbohQslPt/n3bvI4rI1SKY+a5LeJnhkEFU4UTOn7ll/mK6cLcq7joju903
         k7QBMI7Y2T6NCW09yojG3y2zOmuxApMvUkgDsq1a7pR5udPOO1nxuISv29d2oDPakmJ1
         tJQ0nfM7oNtdeYMEumq/JolQqFpKtNq7rKvEmIqXpaPvxOQkfY77fe9BdY16KP7QHO28
         N/mGNzvaEWUcdzT1UWmtRHjcfGIvIwdy8IEW5zp0sF87BfLKxMcHJMi9F+zzyaeErQtW
         cZQsp3WWRAzNn2wqN5VxTc2TjvYJ3mhfgVC54tRw7bbwo6uEMq8G0OvKZrTflW/R9jwx
         LfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GL47OecEOtaIZsCouckHhnwBHGg5C6AOClQQPqBeeOs=;
        b=kG20D+UeHHHwtZS1uXqeUFsyTogCRXwPJZGVVkjg9hApX8y5qWzd76x6gp7QpeaERO
         5xkOkK8Z4L2gAOgzmfjigT6YbmLmJc7En2VzpMi9uDRq+Lf1j4r+BSn1TkISI8aHB6aA
         9G6+USu+h+jyLsf9yFoLdWsxjrfKW2yWr4ubOTd0BusqhsMAHHMPonaFbv9E44JIvKuy
         8sPLM7rmkC2x9y0I4brBO5HbWKjd7OczrErv3Ruo4XL8JGGoiAyPvA+RQNaAr0rk0Fz+
         skZJgC0UkT2e75UYcunPbjVopqOU4pgy2x/pxPYHemkCf5D8Zy0xs3EVWOj4IHfOFJKn
         gYTw==
X-Gm-Message-State: AOAM533pnQTGGT51H0wvgzN7ZDxYqpXYYS7vS/mw/+yHOrIw07FbyXRi
	zwLTFCFUXz/3M+My2dVLVMZYDoXgPQ1t0if2P54=
X-Google-Smtp-Source: ABdhPJx/3bulSZuzmSvvXNMb2ayDZkTctRMJ4WYtN2r8ZKVVygtiJrK+SBuys1DoGfkKDajal5/R+FTAn2PHhbjc69g=
X-Received: by 2002:a17:90a:c716:: with SMTP id o22mr16942467pjt.77.1620488404132;
 Sat, 08 May 2021 08:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142135.2014030-1-raj.khem@gmail.com>
In-Reply-To: <20210508142135.2014030-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 8 May 2021 17:39:53 +0200
Message-ID: <CALbNGRScoFY-hVi11kBZPK3utntZDp3=hiQ_TKqxMd83-X8-qA@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] libmusicbrainz: Rework native and target pieces
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 8, 2021 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Build the native tools via a proper native recipe
> Once done this way we do not need any patches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../files/allow-libdir-override.patch         | 21 ------------
>  .../musicbrainz/libmusicbrainz_git.bb         | 34 +++++--------------
>  2 files changed, 9 insertions(+), 46 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/=
allow-libdir-override.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-l=
ibdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/files=
/allow-libdir-override.patch
> deleted file mode 100644
> index db4d6e8c99..0000000000
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-o=
verride.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  =
We dont
> -easily have a way of determining something that patches ${LIB_SUFFIX} so=
 we'll
> -set LIB_INSTALL_DIR.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> -
> -Index: git/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/CMakeLists.txt
> -+++ git/CMakeLists.txt
> -@@ -36,7 +36,7 @@ FIND_PACKAGE(LibXml2 REQUIRED)
> - SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)=
")
> - SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installatio=
n prefix for executables and object code libraries" FORCE)
> - SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation=
 prefix for user executables" FORCE)
> --SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH =
 "Installation prefix for object code libraries" FORCE)
> -+SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH =
 "Installation prefix for object code libraries")
> - SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Ins=
tallation prefix for C header files" FORCE)
> -
> - CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz5.pc.cmake ${C=
MAKE_CURRENT_BINARY_DIR}/libmusicbrainz5.pc)
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index ca9d94a19c..f5ea36da91 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> @@ -3,38 +3,22 @@ DESCRIPTION =3D "The MusicBrainz client is a library wh=
ich can be built into other
>  HOMEPAGE =3D "http://musicbrainz.org"
>  LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f90=
0982c24"
> -DEPENDS =3D "expat libxml2 libxml2-native neon neon-native"
> +DEPENDS =3D "expat libxml2 libxml2-native neon neon-native libmusicbrain=
z-native"
>
>  PV =3D "5.1.0+git${SRCPV}"
>
> -SRCREV =3D "44c05779dd996035758f5ec426766aeedce29cc3"
> -SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> -           file://allow-libdir-override.patch "
> +SRCREV =3D "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
^ This was not mentioned in description. Is PV still valid?

Cheers

Andreas
