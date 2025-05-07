Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A8DC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:35:25 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.3422.1746642914990498880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 11:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTlABfUP;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-604ad6c4d3dso99754eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746642914; x=1747247714; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No/StqQM0ZLl/gJWmCrjOHNk+kdKZcyGmW8zbwpXm2I=;
        b=PTlABfUPiU1YTmE2LnsoLT+ghA6KFALE23s6QR/qUJkyKiAt8CpU15AgrlV7tMAmzs
         Nymin9yumLEBJtc/cM5DX2OaSwAmpd0hdg7eVvGqE0+wUYor73kbH6TSui8V5283sthV
         qL6HyY9VbC/5Yd1EMXma8tDllVqiv6sR3rSO/nvyLQhxhGKTQXhpkcz5oJTAUxhEgz4r
         8swjzaDIDaZclui4PAvVxZ/e+jMiIatwkNwU5ZKEyJSO69rwDtSdJtkDq+M6xTHVi4wx
         DFylQtuzQ+6IjRpJhmNttcRm9TsSc74Nhl847N2VypEOhRTEq5DMDykFoJNB+9xfkebw
         WubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746642914; x=1747247714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No/StqQM0ZLl/gJWmCrjOHNk+kdKZcyGmW8zbwpXm2I=;
        b=OvZ+kPYxr6qpoELZJkBazwrfYyuaZ5u+SYCNOfJ179oosfbbtqhB/JxYdsRb5t9LlY
         PJB9tDGvceg8+E23M5aySuukbrIudBl8KtlOUZ9oeX8nx6u5bhiEFgSmnjEst95CT4XH
         pME9uQL6UoaiY8VRZQmkLggaOXt+awHAR5trp4hoKVGDPifJC8iBq7LnytVx594egO+s
         AzKDt3a7rIvOKsI/UFGub/99gaHz7fq+wDWpONerwlQDVyU6W9LWUE393puEi4ZvO4zZ
         FcooWTDYbzAYT8LnEGDT6CEaS6FbL/B2wnZec2wTMhPuFZLSfpwgFrL3/bRfvU9GARZx
         nhDQ==
X-Gm-Message-State: AOJu0YzJNplrKWmn6AWZ59IhkEdXQZoFRb5v/3G85i34HeCrPW+MHQga
	fVF58CQD/1bhJjdVAKzQQqzKqZLYHoyVbVpxke0jwgkQFGHdPidlFe70WuXG0ja5hztOj+qwsFW
	hF20L3F+m2b1hn5zzrjLacSMwemQ=
X-Gm-Gg: ASbGncuj2MzrIE4eifjrg2UfzKmn56DMDYOSrS+B8iKWwW4xj4F1i+KwJi4BHMoJoKA
	1ok19f+hC0C2ZaHP1rckkkykEJ1zAppEiUZ73jrYSt6VYsXWH96COWx+iPo6NsmrbTGv6s3LbqN
	FtbhrGWe8Rwd87TPHtwGb08cbzNoEphhMdr4oliFEfu81lrzyY/g==
X-Google-Smtp-Source: AGHT+IFIlYIDE7DgWKy1sCBpWING3lRzn1F3hR+wA/QviB4Zzh3kgOOZzxAqGInXAxLmpfX/2Xezruvo5/xtG/gKt74=
X-Received: by 2002:a05:6820:20d:b0:603:f820:7be4 with SMTP id
 006d021491bc7-608339b8d78mr330775eaf.8.1746642914033; Wed, 07 May 2025
 11:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250507115001.3365087-1-leon.anavi@konsulko.com>
In-Reply-To: <20250507115001.3365087-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 May 2025 11:34:46 -0700
X-Gm-Features: ATxdqUEVJXMQrJuWdYf14v0bJ8Iu9e0xR82ttajlROuOUciP2BFk8bF_byL0Ioc
Message-ID: <CAMKF1sorK4CiMo=re4z69aeknYofCTgbCOzN-QzMRbxBmMMA4g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pillow-heif: Add recipe
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 18:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117360

On Wed, May 7, 2025 at 4:50=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Add recipe for release 0.22.0:
>
> - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
>   security limit of libheif for the image size.
> - libx265 library was updated to the latest 4.1 version.
> - libheif was updated from the 1.19.5 to 1.19.7 version.
> - AVIF format marked as deprecated and pending for the removal.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++++
>  .../python/python3-pillow-heif_0.22.0.bb      | 17 ++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow-he=
if/0001-setup.py-support-cross-compiling.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow-he=
if_0.22.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif/0001=
-setup.py-support-cross-compiling.patch b/meta-python/recipes-devtools/pyth=
on/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
> new file mode 100644
> index 0000000000..66cf7a9244
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.=
py-support-cross-compiling.patch
> @@ -0,0 +1,56 @@
> +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 5 May 2025 16:08:37 +0000
> +Subject: [PATCH] setup.py: support cross compiling
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setup.py | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 68945e4..67566e8 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
> +                     self._add_directory(library_dirs, match.group(1))
> +
> +         # include, rpath, if set as environment variables
> +-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR=
"):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     self._add_directory(include_dirs, d)
> +
> +-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR=
"):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     self._add_directory(library_dirs, d)
> +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
> +             self._update_extension("_pillow_heif", ["heif"], extra_comp=
ile_args=3D["-O3", "-Werror"])
> +         else:  # let's assume it's some kind of linux
> +             # this old code waiting for refactoring, when time comes.
> +-            self._add_directory(include_dirs, "/usr/local/include")
> +-            self._add_directory(include_dirs, "/usr/include")
> +-            self._add_directory(library_dirs, "/usr/local/lib")
> +-            self._add_directory(library_dirs, "/usr/lib64")
> +-            self._add_directory(library_dirs, "/usr/lib")
> +-            self._add_directory(library_dirs, "/lib")
> ++            include_os_path =3D os.environ.get("STAGING_INCDIR")
> ++            if include_os_path:
> ++                for path in include_os_path.split(os.pathsep):
> ++                    self._add_directory(include_dirs, path)
> ++
> ++            lib_os_path =3D os.environ.get("STAGING_LIBDIR")
> ++            if lib_os_path:
> ++                for path in lib_os_path.split(os.pathsep):
> ++                    self._add_directory(library_dirs, path)
> +
> +             self._update_extension("_pillow_heif", ["heif"], extra_comp=
ile_args=3D["-O3", "-Werror"])
> +
> +--
> +2.39.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif_0.22=
.0.bb b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
> new file mode 100644
> index 0000000000..34eaab92b9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Python interface for libheif library"
> +HOMEPAGE =3D "https://github.com/bigcat88/pillow_heif"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db6c07a92aed67c33bc346748d=
7c7e991"
> +
> +PYPI_PACKAGE =3D "pillow_heif"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
> +SRC_URI[sha256sum] =3D "61d473929340d3073722f6316b7fbbdb11132faa6bac0242=
328e8436cc55b39a"
> +
> +DEPENDS +=3D "libheif"

libheif has a commercial license and I think we should reflect that
here as well. Otherwise, it will be trying to build it
but it will not if the user's distro does not enable this license.


> +
> +RDEPENDS:${PN} +=3D "python3-pillow"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117358): https://lists.openembedded.org/g/openembedde=
d-devel/message/117358
> Mute This Topic: https://lists.openembedded.org/mt/112666250/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

