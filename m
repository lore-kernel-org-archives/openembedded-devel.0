Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2140C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:57:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.33421.1744289837994734133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g+xhqXV8;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c090fc7adso886248e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744289836; x=1744894636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKCpirjFtJeBkdsvsnz9Lgcwu+AyYmAzsKDj32xuW/w=;
        b=g+xhqXV8cdus/FQ/jejBN+JkzERxEsiY88ICxTSxQi0XWHTKdbobxP9pcsBAGSv0S2
         k+y0Ue921kVNvXpSGbetFuiRMig6r9CxoQB+lGimJrPzOgYyxtvp3Qwk26FVdXzdtm4j
         EV72MtZtf2S4GpcapwP0X7gQ00NMo2WfoeGlxD6ooMiPRwvRbgrPaYm1Rp829ZS+LHSj
         v6CRJL9Dfroh4Vd2Dqn2+SRcCcMS8p/1C24eda/7xhRBxbh8wPd2ylZ3cmdNGL4BqMN1
         bbgihcELOqR4fFUHq33C/tMxurDhgbkq7CQo8CQtEwIXUDOVgHOzeLFK/G06yry4cZpj
         GP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289836; x=1744894636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKCpirjFtJeBkdsvsnz9Lgcwu+AyYmAzsKDj32xuW/w=;
        b=wHN2OmEnylX0xAR6pOfo87MQwCbHLL9/sH9s9ZERA/wziYe2VRWkC1UnHFMKqW5yjO
         cJZW2CCI3W0HSDZ6x6X2T9vue3cyk9dboOrK7aLUy93guu9u9H02KdtESo22VWfrnzrz
         3GlzGQzoRF6FMFskRUBANn0l60vnc7Ni3xPPz8Hm03OTnv3vsW/Vm1B2H7inHxzH5snf
         vn2OKJ5qToc0MmSREOUm1ARdpwmCOMJ0d0z6q5+JWVU0RFVMAH8Ej8ufU0nI1tz2KrwH
         Pp1H6QqZFZ0TBqbxwU3QjKgHAth/e/DUywUa5+jbXPGCMu3u05UxJ2cGs7v3lLtEOgU0
         69zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF7V0YIP/Y6Dhs71dBVn2brz76KF/1L9IiPgU0e2fKb9pt/X3lQ+jduXToxqWqmAmbkuRxvgzv50wCI8U0QObM3K4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuKWsbzr2FEZ+eAKVc0ZZvh7vA+EBWTDAennuLycYTzwUKD9xE
	hkR6fQZKwViAJ2xoY9DOUmGdoS9qdOvGiNGb28+paLxknsw0FLieIKwLcuGKwCRrWHJElR2bN2j
	fpliHjqbIwNEMLkCSNt8HZP+RQLA=
X-Gm-Gg: ASbGncvh/Ml0DUVGD+F0bFVCP80PTFSI6xR8/y4NcT0wRvNZCqAWTKStfiTeNycL+dM
	879WkvuwnGxlWZbwb8R3Imw88S7lYP/hWEUa38RZWnWK7SWfz1OGIETfUkRWjzi/rurMbqfjPlK
	cTnwxGf8818GsymWmXksgGEwij
X-Google-Smtp-Source: AGHT+IErVN+c/STo+Rt75Du+Lf+dz+71oJ1G6IDnkRuAGXwFsO5rDpiEe+UwNaGUOSfTw8/uT63AMhHrtzg3XoEkF8U=
X-Received: by 2002:a05:6512:118b:b0:54a:cbfb:b647 with SMTP id
 2adb3069b0e04-54d3c62efadmr705513e87.37.1744289835866; Thu, 10 Apr 2025
 05:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
 <1744017431-22217-26-git-send-email-wangmy@fujitsu.com> <CA+chaQfPYDyFGk2sm1HhzZAN2XmX888+b-QzwyF4tK0g=UR8zA@mail.gmail.com>
 <CAMKF1spK1fJ=Yp9JVib2xgGshTbGTq-30_78Liy+p9txfRvtZw@mail.gmail.com>
In-Reply-To: <CAMKF1spK1fJ=Yp9JVib2xgGshTbGTq-30_78Liy+p9txfRvtZw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Apr 2025 14:57:03 +0200
X-Gm-Features: ATxdqUEpDHMJGm_ZhdtcVqh55i6Y19HntBCXrR8tCtAkQHIWTXKK0gPyGwSehCE
Message-ID: <CA+chaQe1HkhuThYOz+VcMNCwe=keuxnbV+HGCWzGDWUMrt6Yjg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/30] python3-snagboot: upgrade 2.2 -> 2.3
To: Khem Raj <raj.khem@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 12:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116767

Ah it fails only with walnascar which is missing setuptools upgrade in oe-c=
ore:
d2b9b8cb7f python3-setuptools: upgrade 76.0.0 -> 78.1.0
which relaxed some of these license checks e.g.
https://github.com/pypa/setuptools/pull/4899 from v77.0.3

backporting newer setuptools to walnascar fixes the build, but if it's
not acceptable, then maybe reverting this snagboot upgrade from
walnascar might be easier (I don't have a preference for me it was
just new build failure in world build)


On Wed, Apr 9, 2025 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 9, 2025 at 5:41=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > With this update applied I'm seeing build failures like:
> >
> > ValueError: invalid pyproject.toml config: `project.license`.
> > configuration error: `project.license` must be valid exactly by one
>
> Interestingly, I do not see this on ubuntu 20.04 + buildtools and
> debian12 based builders.
>
> > definition (2 matches found):
> >
> >     - keys:
> >         'file': {type: string}
> >       required: ['file']
> >     - keys:
> >         'text': {type: string}
> >       required: ['text']
> >
> > DESCRIPTION:
> >     `Project license <https://peps.python.org/pep-0621/#license>`_.
> >
> > GIVEN VALUE:
> >     "GPL-2.0-only"
> >
> > OFFENDING RULE: 'oneOf'
> >
> > DEFINITION:
> >     {
> >         "oneOf": [
> >             {
> >                 "properties": {
> >                     "file": {
> >                         "type": "string",
> >                         "$$description": [
> >                             "Relative path to the file (UTF-8) which
> > contains the license for the",
> >                             "project."
> >                         ]
> >                     }
> >                 },
> >                 "required": [
> >                     "file"
> >                 ]
> >             },
> >             {
> >                 "properties": {
> >                     "text": {
> >                         "type": "string",
> >                         "$$description": [
> >                             "The license of the project whose meaning
> > is that of the",
> >                             "`License field from the core metadata",
> >
> > "<https://packaging.python.org/specifications/core-metadata/#license>`_=
."
> >                         ]
> >                     }
> >                 },
> >                 "required": [
> >                     "text"
> >                 ]
> >             }
> >         ]
> >     }
> >
> > license was changed in
> > https://github.com/bootlin/snagboot/commit/a648d6dc554f631ba34a6cfeab8c=
19725bb3816b
> >
> > It doesn't fail for you?
> >
> > On Mon, Apr 7, 2025 at 11:18=E2=80=AFAM wangmy via lists.openembedded.o=
rg
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../python/{python3-snagboot_2.2.bb =3D> python3-snagboot_2.3.bb} | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-python/recipes-devtools/python/{python3-snagboot_2.2.bb =
=3D> python3-snagboot_2.3.bb} (86%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.2=
.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > > similarity index 86%
> > > rename from meta-python/recipes-devtools/python/python3-snagboot_2.2.=
bb
> > > rename to meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > > index 07b9a5208c..dc57dfc105 100644
> > > --- a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > > @@ -3,7 +3,7 @@ SUMMARY =3D "Snagboot intends to be an open-source re=
placement vendor-specific too
> > >  LICENSE =3D "GPL-2.0-only"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> > >
> > > -SRC_URI[sha256sum] =3D "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7cd=
5d5dcd875d2c333e8b08"
> > > +SRC_URI[sha256sum] =3D "c6a97ea0c83a2d7eea639741b2f667c75e95d50278ee=
b6a8adbce5d1a7cf65fa"
> > >
> > >  inherit pypi python_setuptools_build_meta
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116739): https://lists.openembedded.org/g/openembed=
ded-devel/message/116739
> > Mute This Topic: https://lists.openembedded.org/mt/112129288/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

