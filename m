Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68844D59D63
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 19:33:06 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.27318.1732563182350679626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 11:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuAt0JdS;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-296994dd3bfso2860793fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732563181; x=1733167981; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqYwXGIeNAz1I60eW1W1YWdidZM+giVVMiQHLdEGRSs=;
        b=PuAt0JdSMkWjErK2G9YGYTEbM5lZmg/tgFjBQITpwupCopOdB9C4CCUWY7zw/f5m+0
         LlYv/9pc4gOkhlz+Kk9qTkNE/arPhMw3AWXJDJl7/LP+u8tdFQjZkp5WpW+i4IPMfd2j
         +UnP3X1CgBvopbAgxZdXBX09P7lM5DCjfCI7NKzBR+2UppO+9Df8Jqap3GPTGcVpOUkS
         7qwX9Mfix5KhEq+mBisk09UFeGZ+e3wu8hcEFYYiYeT3H4q3Yh1YhLLSInyN09nQ52o9
         8tuNoipy/h8GJ7ZVEblLNPJD9rDIChkvE3LLrLy3tDKveO2aBgghWc6SY2yEM9AOPej9
         acpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732563181; x=1733167981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqYwXGIeNAz1I60eW1W1YWdidZM+giVVMiQHLdEGRSs=;
        b=rh7OUL1FYED32AyU75kFO4pKSnRsCwv1gGZvyoZSAEbXPRIZCkgkZ53wV91U4CUtOr
         8qtWk3TpukpzJLdRcwKi3lFTicUeIpJQvReZdnjBETqBbbVtXGj0XKcyW2rJwEYNUyBj
         X8R6ufDOuWDXp8tCInWwGI8+5z3Ewdsh8kh6FvJ+CZdUp1+7NOebEeB4joS7KIqTpvIM
         mdLp4P18iFzAHxSwgpX86wNGTBomi03gNXnOviE+0i9ETSm8MObjiTYVY++NIIk9RqiS
         mYtZoBd55WAog0H4lpt5TD5GVVG/ya8O810LoNeSaxGjraab71djfq3xVvPb7KLPfNJC
         LT/g==
X-Gm-Message-State: AOJu0YyUL25j4ykyGxORYDLTEJo4JzVVdYanK78MymmdSnMOpm7b/x4H
	lsfeHYXZASMkim49uZ9m3sZXvxqKYE9k+pVlZlygtla87NhAD7+TYwgi/CEqZyhQmHPAyX88muL
	ryZ3rLqy2BhhpyFVOEaNCKEJyJ3U=
X-Gm-Gg: ASbGncvaB69Q/Jtwh8cbO3OVOuvtiX0ZCroPYL8qNUj0faNtTINUJ4V4Rsc2otOP8Az
	bSYJ0+E8IlqigIw2PX/y7fe9VYNkmMw==
X-Google-Smtp-Source: AGHT+IE2FBrC0a5IRDuhGvl2qktRHDYItr/hjvelvEFOllA4d6I96/tkjeP6DVfSXPI7YXmBETUpL7e4qotJSSiJ2lA=
X-Received: by 2002:a05:6871:5813:b0:296:a67c:d239 with SMTP id
 586e51a60fabf-29720b9ac87mr10661983fac.12.1732563181231; Mon, 25 Nov 2024
 11:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
In-Reply-To: <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Mon, 25 Nov 2024 14:32:50 -0500
Message-ID: <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 19:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114048

Khem,

I have TOOLCHAIN =3D "clang" in my local.conf file and was not seeing
this error.  Is this perhaps riscv specific?

I ask because I built core-image-minimal-xfce with raspberry PI 5
target as an arm 64 build.

Thanks,
Jason.

On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> with lld linker I see errors like
>
>    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSetIOErrorH=
andler
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>    |
>    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAddConnecti=
onWatch
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>    |
>    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceConnectionN=
umber
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>    |
>    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceProcessMess=
ages
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>    |
>    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceSetShutdownNegotiation
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>    |
>    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCloseConnec=
tion
>    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> --no-allow-shlib-undefined)
>
> On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.=
19.4
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb}   | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb =3D> li=
bxfce4ui_4.19.4.bb} (92%)
> >
> > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb b/m=
eta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > similarity index 92%
> > rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > index e53d01d00..ce711eb36 100644
> > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> >
> >  # TODO: Check if 0001-... can go
> >  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts=
.xml-fix.patch"
> > -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568c8022c316=
04348f9edadb02f227"
> > +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40ad66200cc=
3c055ab7156d718796"
> >
> >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
> >  EXTRA_OECONF +=3D "--disable-vala"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114040): https://lists.openembedded.org/g/openembed=
ded-devel/message/114040
> > Mute This Topic: https://lists.openembedded.org/mt/109772240/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

