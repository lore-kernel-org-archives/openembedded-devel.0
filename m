Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C64BC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 15:04:44 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.587.1744297477265202322
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6cWouME;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c13802133so263848a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744297476; x=1744902276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r20B6pFQ7av8DO8sg6W7JlBnCpp4ucUKjf+JBumu+g=;
        b=i6cWouMEetDBrkJ/FanJLMwjr/L2wu3013Rac4jLqg6uBJZO5xuvnChsm1KhR5EcAW
         MFMqpfC2QYSGZUw35viCMLgWJ4REiVW/9TTPo49h5SWJnA6kgfzR1tkTdrDIqG6FOcjD
         61I4TF37rckI00+/JJiC6V86lCVlba5GjO9VaRYSkzoPAC+m1yDZ16mVW0nu4XPWWCOT
         APFhJP4jzVKFhePLw/GxNj1aHTolJUTOsIWSfzCArfOOIvPO7gXsY6YBIBrtV0cDqayI
         flU51kb3zOsRsGOMwQDFn5kwQYM5Ikibs+L4ctg8lDKNwXI/ztM9I4VyVsgWMamw1Isi
         /S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297476; x=1744902276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r20B6pFQ7av8DO8sg6W7JlBnCpp4ucUKjf+JBumu+g=;
        b=lmjAgzGxZyrT1OKVZyfBpu9SYjPBhtpPX+WZ9oGv31b8eKj0GqTfip5Xt6hUSQe0Ls
         r2SR2MmlJbq40uk77xgzF1J9zN2WQJ3JVvrp7HFWLUReDgkeIcfagpq6Km6tvciTkEGc
         eThLcFT4vBXx6Vzy+hdNz9umm8eUi5YNHSGAwVHGNhwenBeTtdJgzIWJ7Gcw0pvPNevU
         lHZZhwH2gkWZI+xMkCamH0Mi4a/0JhWhYOu5bBkBAubwjVeQWwwv5Zd3zfdjnfwARYJJ
         Byp+E5qIzi21MZp77gHrvULWZl+47ktOtk3p8HsgKaxoBUjVHP/cUCof/NswNX034y3t
         lMBw==
X-Forwarded-Encrypted: i=1; AJvYcCU1QZPrKtkP9mK6Ay47oO95FJSMS5WURjKCe1+zlXrJ520rhmo8886uJ+bYyLLTqqZBrT2hOVa8uuOMOyrm7K+LNHk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwP/s81viLcbV+QCXoGG6wa9IrkI/xpxCv9y7dAZLrlrdicf2p1
	CwTQ76saBfi9qQufQPoHB+QFaGCxMCjer6pjlhIdMK3QqlFsvV4eoHQVFDqowNprvwgukpG/sx7
	1aiKqtQjpbOQKC9KhRadEcBLhAO4=
X-Gm-Gg: ASbGncvV2eYFgObZGybEnLxfsU8RnynIrYBWvbP8L2y+NBXg4/+CUF8eFElmYW6C7j5
	EAKa42o+12k38cR4Tq+Lks5wRCeAS6VkQOpahAl+1YmeUapy1/OUmDd2Uv6LWoxJnIGrl12SR/x
	8u2VvaR4n2Xxscnc1aU1o5vw==
X-Google-Smtp-Source: AGHT+IFXvoPrCnXSqqdqHJeanVJhGxLuGBak/ByMRY6ao7OqcQfv93Tly5zrg7YwPPylk7S7HJpc+eBlddVm/KpS+Us=
X-Received: by 2002:a05:6830:6207:b0:72b:9387:84b2 with SMTP id
 46e09a7af769-72e7bb3e300mr2320438a34.27.1744297476063; Thu, 10 Apr 2025
 08:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
 <1744017431-22217-26-git-send-email-wangmy@fujitsu.com> <CA+chaQfPYDyFGk2sm1HhzZAN2XmX888+b-QzwyF4tK0g=UR8zA@mail.gmail.com>
 <CAMKF1spK1fJ=Yp9JVib2xgGshTbGTq-30_78Liy+p9txfRvtZw@mail.gmail.com> <CA+chaQe1HkhuThYOz+VcMNCwe=keuxnbV+HGCWzGDWUMrt6Yjg@mail.gmail.com>
In-Reply-To: <CA+chaQe1HkhuThYOz+VcMNCwe=keuxnbV+HGCWzGDWUMrt6Yjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 08:04:10 -0700
X-Gm-Features: ATxdqUH1lQHBR2DC79bokGzgvrMI-7yHYIxuncQNB7EItMaVu4eh8PXQCFuJj_U
Message-ID: <CAMKF1srw91v3hu8DaEn73hTaZn2EbwzyL3UbMDCcuXBjAWHU0w@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/30] python3-snagboot: upgrade 2.2 -> 2.3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 15:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116771

On Thu, Apr 10, 2025 at 5:57=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Ah it fails only with walnascar which is missing setuptools upgrade in oe=
-core:
> d2b9b8cb7f python3-setuptools: upgrade 76.0.0 -> 78.1.0
> which relaxed some of these license checks e.g.
> https://github.com/pypa/setuptools/pull/4899 from v77.0.3
>
> backporting newer setuptools to walnascar fixes the build, but if it's
> not acceptable, then maybe reverting this snagboot upgrade from
> walnascar might be easier (I don't have a preference for me it was
> just new build failure in world build)

yeah revert is good, my walnascar build still used master of oe-core :(

>
>
> On Wed, Apr 9, 2025 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > On Wed, Apr 9, 2025 at 5:41=E2=80=AFAM Martin Jansa via lists.openembed=
ded.org
> > <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > With this update applied I'm seeing build failures like:
> > >
> > > ValueError: invalid pyproject.toml config: `project.license`.
> > > configuration error: `project.license` must be valid exactly by one
> >
> > Interestingly, I do not see this on ubuntu 20.04 + buildtools and
> > debian12 based builders.
> >
> > > definition (2 matches found):
> > >
> > >     - keys:
> > >         'file': {type: string}
> > >       required: ['file']
> > >     - keys:
> > >         'text': {type: string}
> > >       required: ['text']
> > >
> > > DESCRIPTION:
> > >     `Project license <https://peps.python.org/pep-0621/#license>`_.
> > >
> > > GIVEN VALUE:
> > >     "GPL-2.0-only"
> > >
> > > OFFENDING RULE: 'oneOf'
> > >
> > > DEFINITION:
> > >     {
> > >         "oneOf": [
> > >             {
> > >                 "properties": {
> > >                     "file": {
> > >                         "type": "string",
> > >                         "$$description": [
> > >                             "Relative path to the file (UTF-8) which
> > > contains the license for the",
> > >                             "project."
> > >                         ]
> > >                     }
> > >                 },
> > >                 "required": [
> > >                     "file"
> > >                 ]
> > >             },
> > >             {
> > >                 "properties": {
> > >                     "text": {
> > >                         "type": "string",
> > >                         "$$description": [
> > >                             "The license of the project whose meaning
> > > is that of the",
> > >                             "`License field from the core metadata",
> > >
> > > "<https://packaging.python.org/specifications/core-metadata/#license>=
`_."
> > >                         ]
> > >                     }
> > >                 },
> > >                 "required": [
> > >                     "text"
> > >                 ]
> > >             }
> > >         ]
> > >     }
> > >
> > > license was changed in
> > > https://github.com/bootlin/snagboot/commit/a648d6dc554f631ba34a6cfeab=
8c19725bb3816b
> > >
> > > It doesn't fail for you?
> > >
> > > On Mon, Apr 7, 2025 at 11:18=E2=80=AFAM wangmy via lists.openembedded=
.org
> > > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > > >
> > > > From: Wang Mingyu <wangmy@fujitsu.com>
> > > >
> > > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > > ---
> > > >  .../python/{python3-snagboot_2.2.bb =3D> python3-snagboot_2.3.bb} =
| 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta-python/recipes-devtools/python/{python3-snagboot_2.2.b=
b =3D> python3-snagboot_2.3.bb} (86%)
> > > >
> > > > diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2=
.2.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > > > similarity index 86%
> > > > rename from meta-python/recipes-devtools/python/python3-snagboot_2.=
2.bb
> > > > rename to meta-python/recipes-devtools/python/python3-snagboot_2.3.=
bb
> > > > index 07b9a5208c..dc57dfc105 100644
> > > > --- a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> > > > +++ b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > > > @@ -3,7 +3,7 @@ SUMMARY =3D "Snagboot intends to be an open-source =
replacement vendor-specific too
> > > >  LICENSE =3D "GPL-2.0-only"
> > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263"
> > > >
> > > > -SRC_URI[sha256sum] =3D "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7=
cd5d5dcd875d2c333e8b08"
> > > > +SRC_URI[sha256sum] =3D "c6a97ea0c83a2d7eea639741b2f667c75e95d50278=
eeb6a8adbce5d1a7cf65fa"
> > > >
> > > >  inherit pypi python_setuptools_build_meta
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#116739): https://lists.openembedded.org/g/openemb=
edded-devel/message/116739
> > > Mute This Topic: https://lists.openembedded.org/mt/112129288/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

