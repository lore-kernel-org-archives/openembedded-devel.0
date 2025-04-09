Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F4FC369A4
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:10:53 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.9554.1744207853038365922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLV8uEpj;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-601ad30bc0cso490486eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207852; x=1744812652; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlqZEFuOaa8f5lGFXj1l+o+mMLzdF/SunejI/7YjAbA=;
        b=JLV8uEpjjvMgKXVcpcMEGA632JUz9Bhg9pTPj847HxFmPWCEHuy5a9kBJcJO2PIh56
         oe+g7dxzphtjy+R6yXGg8hKuW8cqXZRmaWKIz37iZz5HzEc+5GYt7WuC3N3hAyRdkgC0
         HXdob08ZmQxlwVTcMJgch5RWabrmRl233BlWSdPoGD41NFtePcrSSX0FNlXTAloBXdqz
         Wqqtv7kMokdYWmVhWlQV/fsYQHb4jfuPBLYu6REju3Azxshc/Qt/OIEXUa+I371R/HlG
         qp8LYNazcD6xFB/dr8xST8EHu+00wO3sKSSZZ8f96yf3MZfs3C2Cy3qvRZo5WE6w7nDo
         wGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207852; x=1744812652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlqZEFuOaa8f5lGFXj1l+o+mMLzdF/SunejI/7YjAbA=;
        b=Nbn/hiohXTXjqDOq6AQsckFyeZyTFD0APxwoM1O4gnY0I7hTRDp26RugHqpzCz5O5R
         WBllVUFrg/4TiVi/FjndIDprS+CBEIwWVCtWc4EzkEZrPy/7In0MKp5uiefQqh+q2gIX
         xoALSYjav+dAiYHgbiNF+OlP2OuV9kvIZ8WBzHbS0nhdCmvnDEuNBov81+hv7opM715b
         TI9QCZkTm/8Jg0bTW4qQvdI6cMVusbktVtB75a30Eps626mZ2GyZ0tT7g18FmzNQJU3g
         mbVgCi+Cwp9SEQF1NIjZtoyMbRbPVTsczybfrwT5RVlhmHHaFxARu845E8y7aJcwAJ1l
         yp4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWsHIm/FkxgyO9u6gsa/MwNTHMTtb3ahY34bVFiZj/ulFN94ug4z67zp+xDpLwP6Y0z/W4ozTvCyYgrOGmjlsQqxY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgTAKnLOI9Jox2WmFgYXf54vh2HAwpmAJ1el5g+40hQ6mKCtu0
	z0Yq/Grln0aZXKO/haLhYFhaauTqJvXbBkwb2uqFDpAKAU8CHLBmBKvvmjy2tdubmCaGVQaFqs5
	+zwmV58XNC+50751lRLnYUKOcUOw=
X-Gm-Gg: ASbGncsSKc/387zPAazBOqGIsIAJ6Gzkr+5nHlzoYIcIhSsZuBYTlkXAOtTMG3/+JNf
	l0ZRB08GMLjQ5CHVSUK3x2VisLU0StV4BpEKaOmLIubp+/fZDevk+yMSTnuTYsjBZtfBbtnzotQ
	CFEMrK7eLqDOyQTM7SxcKRbw==
X-Google-Smtp-Source: AGHT+IGfzga/TUl5GUuIPFIG65Adf24Yil+DmmyRvbe45T3OD3JkNf7tOH/aGCpY5jbVMgSEyu2mSwnhrvCeqiRvW0c=
X-Received: by 2002:a4a:edc4:0:b0:600:5673:69ef with SMTP id
 006d021491bc7-6045cb7cea0mr1813106eaf.1.1744207851812; Wed, 09 Apr 2025
 07:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
 <1744017431-22217-26-git-send-email-wangmy@fujitsu.com> <CA+chaQfPYDyFGk2sm1HhzZAN2XmX888+b-QzwyF4tK0g=UR8zA@mail.gmail.com>
In-Reply-To: <CA+chaQfPYDyFGk2sm1HhzZAN2XmX888+b-QzwyF4tK0g=UR8zA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Apr 2025 07:10:25 -0700
X-Gm-Features: ATxdqUH70yJahcFwEjzC7mSNlzZoAPxu4v95zpJdBHlCfmWn54UbtcoPT2uSaqk
Message-ID: <CAMKF1spK1fJ=Yp9JVib2xgGshTbGTq-30_78Liy+p9txfRvtZw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/30] python3-snagboot: upgrade 2.2 -> 2.3
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 14:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116742

On Wed, Apr 9, 2025 at 5:41=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> With this update applied I'm seeing build failures like:
>
> ValueError: invalid pyproject.toml config: `project.license`.
> configuration error: `project.license` must be valid exactly by one

Interestingly, I do not see this on ubuntu 20.04 + buildtools and
debian12 based builders.

> definition (2 matches found):
>
>     - keys:
>         'file': {type: string}
>       required: ['file']
>     - keys:
>         'text': {type: string}
>       required: ['text']
>
> DESCRIPTION:
>     `Project license <https://peps.python.org/pep-0621/#license>`_.
>
> GIVEN VALUE:
>     "GPL-2.0-only"
>
> OFFENDING RULE: 'oneOf'
>
> DEFINITION:
>     {
>         "oneOf": [
>             {
>                 "properties": {
>                     "file": {
>                         "type": "string",
>                         "$$description": [
>                             "Relative path to the file (UTF-8) which
> contains the license for the",
>                             "project."
>                         ]
>                     }
>                 },
>                 "required": [
>                     "file"
>                 ]
>             },
>             {
>                 "properties": {
>                     "text": {
>                         "type": "string",
>                         "$$description": [
>                             "The license of the project whose meaning
> is that of the",
>                             "`License field from the core metadata",
>
> "<https://packaging.python.org/specifications/core-metadata/#license>`_."
>                         ]
>                     }
>                 },
>                 "required": [
>                     "text"
>                 ]
>             }
>         ]
>     }
>
> license was changed in
> https://github.com/bootlin/snagboot/commit/a648d6dc554f631ba34a6cfeab8c19=
725bb3816b
>
> It doesn't fail for you?
>
> On Mon, Apr 7, 2025 at 11:18=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../python/{python3-snagboot_2.2.bb =3D> python3-snagboot_2.3.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-snagboot_2.2.bb =
=3D> python3-snagboot_2.3.bb} (86%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.2.b=
b b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > similarity index 86%
> > rename from meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> > rename to meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > index 07b9a5208c..dc57dfc105 100644
> > --- a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
> > @@ -3,7 +3,7 @@ SUMMARY =3D "Snagboot intends to be an open-source repl=
acement vendor-specific too
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >
> > -SRC_URI[sha256sum] =3D "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7cd5d=
5dcd875d2c333e8b08"
> > +SRC_URI[sha256sum] =3D "c6a97ea0c83a2d7eea639741b2f667c75e95d50278eeb6=
a8adbce5d1a7cf65fa"
> >
> >  inherit pypi python_setuptools_build_meta
> >
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116739): https://lists.openembedded.org/g/openembedde=
d-devel/message/116739
> Mute This Topic: https://lists.openembedded.org/mt/112129288/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

