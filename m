Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA6DC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:56:09 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.38330.1747605368512309564
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 14:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aerT0Dxh;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c2ada8264aso1625538fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747605368; x=1748210168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbvlsHkf6BrEnc/z/xR16uq7TvfIo7JZwg90zDDvND0=;
        b=aerT0DxheI5nwhxvOzb+ZUgVvV+KdO53rcBtzHQL/B6eTB6UT4M/Z1qR+EnHhoOojb
         TwUljHtPI2smJe1/hLRp3ABtVgmpye9WC4UtyJweV/PXPvrqDEAkHQDZpXsQNT9xGLO/
         1jjMHlVriYhwAVfIcC5/rZJvwfwqHrxub592jU1Ll4GuJZ+ErDm7O1R2x45uiAnN8AMF
         iD+Ek49gfOPoS2A2jBw7aQvsVgEgRgj/nYnc0AKBYHwaKl+jW4qpBfFAzW5YDaFX+X1c
         j7kA5G81Da7dtM6AXFFwcwDW0jgvZDVP2bbNpsfhQEF/WIKM0u6lnYoMROxBeluB9Ld5
         emEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605368; x=1748210168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbvlsHkf6BrEnc/z/xR16uq7TvfIo7JZwg90zDDvND0=;
        b=JLvDL/4XfDOpxVVgIJZhhpZiD6cmF/E6x9bE0dvhkKCpV9YydoFbVO2xZTg8TxJ6X7
         vWkHk8dcVz/ZBj/StslaGry05V2l9BH+MnXDPgOKN3loM890RNxkTDylFf/WNdfXb+VM
         E/NiRVYN0qV3DZgEGwIFEE1SNGy/xASa58jWKS9zgQ5I3xhZqziaQTtjJQIYKH/Bc/hh
         mZguh5cKLX1rnWPPHYUk2aT8MIlPMYseAFwJckH4dyRUyO/Q/tpGRo4haW+r+FTAfJRR
         r7QmNEOBB6Ll5YNEhwIKByc5wZz21ZOhogcghNdOOy5YfvaWyl7YAEdeYA6CiWFPilo1
         WCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtTmBgiHbNK2kekkxLOYP2FyfgwgsrhZ3OOBbbaK8OjmpEhwENrkK2EuksxRtz0nropsrodtOJE8FWBXvNZ4Ftz60=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzdlPN2nFDIR8R5Jood/rNrc30Z/OpiBoYx9qer8W+/W8etxnX
	elTusfn2Krxqfg2TdWneu0ALZbLYakJUISvPxUZrJjsiYBJL9vBEriUIML/zLVVaFwMNp5iIa/f
	aGGFTayA1R1+XuhBHRGuSgyCBbdjsMhI=
X-Gm-Gg: ASbGncsGpuoUcqRxvzVZse6ik30WLabL24l9zsHx5oEOyt3ieDTV6LCTFQQZ8ATITvU
	8sCAbt/khY+LMLiYDRAL7YS5+Nyer7JDBJOIcMpDOu2rY6fhngUmY5YqyRW4Y2zrsnVisM+4GY7
	APqQWS/4TWAJRt4SedhtNE7eKiO5fW1gGk
X-Google-Smtp-Source: AGHT+IGv5W6HbPaCQLNPY2cH3xpu2D5NKwVWaTZt2oxp7rkOirUlQ2p5ZclipTmVDU2Ndqa/ZXnT/ZrNh0a6L7hW82Q=
X-Received: by 2002:a05:6870:8989:b0:2d6:667c:511f with SMTP id
 586e51a60fabf-2e3c1c2e2e7mr6491393fac.9.1747605367569; Sun, 18 May 2025
 14:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250508063335.1498917-1-leon.anavi@konsulko.com> <CAMSfU+66CD4OPMjf4ofm1UEDY4TqSsrdppaeOg-qCYBCPVf2yw@mail.gmail.com>
In-Reply-To: <CAMSfU+66CD4OPMjf4ofm1UEDY4TqSsrdppaeOg-qCYBCPVf2yw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:55:41 -0700
X-Gm-Features: AX0GCFv2ZwI-7xSIGnKxVtTWKiFMdfcBpklPk_DLCw3I-Qn1TwWX97OlSYr71N8
Message-ID: <CAMKF1sqs3n66kb-qbM+22PLPNGf6qFNEjgbX6m7YVnnVGKTLnw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-pillow-heif: Add recipe
To: yoann.congal@smile.fr
Cc: leon.anavi@konsulko.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 21:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117465

On Sun, May 18, 2025 at 2:03=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
>
>
> Le jeu. 8 mai 2025 =C3=A0 08:33, Leon Anavi via lists.openembedded.org <l=
eon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :
>>
>> Add recipe for release 0.22.0:
>>
>> - Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
>>   security limit of libheif for the image size.
>> - libx265 library was updated to the latest 4.1 version.
>> - libheif was updated from the 1.19.5 to 1.19.7 version.
>> - AVIF format marked as deprecated and pending for the removal.
>>
>> This work was sponsored by GOVCERT.LU.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>
>
> Hello,
>
> This recipe triggers build failures when doing a meta-python world build =
: libheif is in meta-multimedia but meta-python does not depend on meta-mul=
timedia.
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/ste=
ps/41/logs/stdio (line 74)
>
> Maybe this recipe should be moved to meta-multimedia?
>
> NB: meta-multimedia does depends on meta-python
>

Seems good to me. Please send a patch

> Regards,
>>
>> ---
>>  ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++++
>>  .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
>>  2 files changed, 76 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow-h=
eif/0001-setup.py-support-cross-compiling.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow-h=
eif_0.22.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif/000=
1-setup.py-support-cross-compiling.patch b/meta-python/recipes-devtools/pyt=
hon/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
>> new file mode 100644
>> index 0000000000..66cf7a9244
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup=
.py-support-cross-compiling.patch
>> @@ -0,0 +1,56 @@
>> +From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Mon, 5 May 2025 16:08:37 +0000
>> +Subject: [PATCH] setup.py: support cross compiling
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + setup.py | 19 +++++++++++--------
>> + 1 file changed, 11 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/setup.py b/setup.py
>> +index 68945e4..67566e8 100644
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
>> +                     self._add_directory(library_dirs, match.group(1))
>> +
>> +         # include, rpath, if set as environment variables
>> +-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
>> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDI=
R"):
>> +             if k in os.environ:
>> +                 for d in os.environ[k].split(os.path.pathsep):
>> +                     self._add_directory(include_dirs, d)
>> +
>> +-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
>> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDI=
R"):
>> +             if k in os.environ:
>> +                 for d in os.environ[k].split(os.path.pathsep):
>> +                     self._add_directory(library_dirs, d)
>> +@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
>> +             self._update_extension("_pillow_heif", ["heif"], extra_com=
pile_args=3D["-O3", "-Werror"])
>> +         else:  # let's assume it's some kind of linux
>> +             # this old code waiting for refactoring, when time comes.
>> +-            self._add_directory(include_dirs, "/usr/local/include")
>> +-            self._add_directory(include_dirs, "/usr/include")
>> +-            self._add_directory(library_dirs, "/usr/local/lib")
>> +-            self._add_directory(library_dirs, "/usr/lib64")
>> +-            self._add_directory(library_dirs, "/usr/lib")
>> +-            self._add_directory(library_dirs, "/lib")
>> ++            include_os_path =3D os.environ.get("STAGING_INCDIR")
>> ++            if include_os_path:
>> ++                for path in include_os_path.split(os.pathsep):
>> ++                    self._add_directory(include_dirs, path)
>> ++
>> ++            lib_os_path =3D os.environ.get("STAGING_LIBDIR")
>> ++            if lib_os_path:
>> ++                for path in lib_os_path.split(os.pathsep):
>> ++                    self._add_directory(library_dirs, path)
>> +
>> +             self._update_extension("_pillow_heif", ["heif"], extra_com=
pile_args=3D["-O3", "-Werror"])
>> +
>> +--
>> +2.39.5
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif_0.2=
2.0.bb b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
>> new file mode 100644
>> index 0000000000..7f5dfac702
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
>> @@ -0,0 +1,20 @@
>> +DESCRIPTION =3D "Python interface for libheif library"
>> +HOMEPAGE =3D "https://github.com/bigcat88/pillow_heif"
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db6c07a92aed67c33bc346748=
d7c7e991"
>> +
>> +# While this item does not require it, it depends on libheif which does
>> +LICENSE_FLAGS =3D "commercial"
>> +
>> +PYPI_PACKAGE =3D "pillow_heif"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
>> +SRC_URI[sha256sum] =3D "61d473929340d3073722f6316b7fbbdb11132faa6bac024=
2328e8436cc55b39a"
>> +
>> +DEPENDS +=3D "libheif"
>> +
>> +RDEPENDS:${PN} +=3D "python3-pillow"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.39.5
>>
>>
>>
>>
>
>
> --
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117464): https://lists.openembedded.org/g/openembedde=
d-devel/message/117464
> Mute This Topic: https://lists.openembedded.org/mt/112783025/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

