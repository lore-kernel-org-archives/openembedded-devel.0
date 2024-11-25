Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6450D59D6A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:23:36 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.28610.1732566212220953330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 12:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2WPbZRj;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2969dc28d9eso2993938fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 12:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732566211; x=1733171011; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvdulfizQIAWH/PydaSIxG5rN8CMnWq/uhZzFNGmJec=;
        b=H2WPbZRj+ohTuG9RcMxn9f9D1/x4nBdqyleKxrpiVsCVBq1+lGfsvESFRO/1/PB7x9
         SHKMJ0Spy3prm/8pjZ9ToZdfpG58uxw40sloYRjM+MCXkvGY0tkV2N6orMaQQilfbC1S
         9SkPCJ5H759QmKzgY+idQcBdr+/AKPQX/4OsJ5NFzteYc1ImJesvDrgG62uybYCF0Eb1
         T0GumER0VidHAYwuozoPNfkWy/XZTfejFL53xbxQ7KU12IOUzEJTnNmJDm1dkbmDtk7N
         2ymEVBO0bZ4/QI6mewHKzC5kIZITmVEhenQSpumwmDOdmjYv1GvBXULUaov7BD4UpJhj
         dSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732566211; x=1733171011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvdulfizQIAWH/PydaSIxG5rN8CMnWq/uhZzFNGmJec=;
        b=tN6lJ0slOduOvheRvOLeNX4tXUW0k8yXPB7Rjxsf0F4NTfhnaKVMupncbztYXJp7fa
         4WEG2ov2xmIePS3U3wJ1N4ADQjVVRDEwBi1wHZSDIg/ozgdey8t3KcvK/cQkgf6q0Ezr
         WNYNaGqutFJPZYoD7M0Y+oT5iupmm9sCYQAnbQNqrX5W8O/0ftBKjMDTKSRBGJubTjDg
         ofrXVUx7aXzad28r3cFURFAQA23cWL65xFp1mUyfD12xFIVagyPb+z90l50dYl8bnuxc
         Eakq8EFLZzUQPFqRC5pdtII4nTaOBJwj3NNOljaZhz5a4ozvEg38rJxeqqDopxypnOfX
         pEQg==
X-Gm-Message-State: AOJu0Ywi7Fql4hT/iMcu/V57ghtOA93X/8lWN2tk3FXdciOlU0E3MpO6
	1gsXNnTCyUJrLsuXvoY4oayiJO7HQuuq3LhgVQDCdEJyGR3Xk7VKEY5BRtK2NbXmwcNmPpGpdEI
	FAGPJQhcubDuiHo79exOYSK/qWWjvIHSg0Wg=
X-Gm-Gg: ASbGncsWFIcXsWVNALYhgSMOcHSfMNCF72OV9yK0UzQK/JL5dtmOwqVsj+KBLX+tqnj
	9cLNLi132xysh1pc6Ysb6msV4jCRsFA==
X-Google-Smtp-Source: AGHT+IH9IlFxgAsXS4xqq/p3xcwSyPI6NGH6UXGCA70cRQdMValt5XhlWXEi5utPyONFSqFf1GhuSmSlQXxPuYaPtd0=
X-Received: by 2002:a05:6871:42cf:b0:288:a00e:92dc with SMTP id
 586e51a60fabf-29720aeae06mr14039197fac.2.1732566209940; Mon, 25 Nov 2024
 12:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
 <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
 <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com> <CABTo8gCDkLNOXFXaAw-PyYE6uUJbXcCDGKjpYK_MhXv5_47qRw@mail.gmail.com>
In-Reply-To: <CABTo8gCDkLNOXFXaAw-PyYE6uUJbXcCDGKjpYK_MhXv5_47qRw@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Mon, 25 Nov 2024 15:23:19 -0500
Message-ID: <CABTo8gArNyLyWx0d9-=F0HXaHEU0Qpya1WrtFO7ex6130S_ViQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 20:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114051

Khem,

I'm still not seeing the problem on an Arm target.  So I will move to
a riscv target to see if I can at least reproduce what you are seeing.

I did  find this which provides a work around.  Although I'm also open
to just dropping the update.

https://bugs.gentoo.org/924321

I'll let you know what I see with the riscv build.

Thanks,
Jason

On Mon, Nov 25, 2024 at 3:01=E2=80=AFPM J. S. <schonm@gmail.com> wrote:
>
> I've updated my DISTRO_FEATURES to have ld-is-lld and will let you
> know what I find.
>
> On Mon, Nov 25, 2024 at 2:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. <schonm@gmail.com> wrote=
:
> > >
> > > Khem,
> > >
> > > I have TOOLCHAIN =3D "clang" in my local.conf file and was not seeing
> > > this error.  Is this perhaps riscv specific?
> >
> > I think you will also need ld-is-lld in DISTRO_FEATURES to reproduce
> > it. It possible its RISCV specific but I think
> > first thing is to get LLD linker going for build it and see if you can
> > reproduce it too.
> >
> > >
> > > I ask because I built core-image-minimal-xfce with raspberry PI 5
> > > target as an arm 64 build.
> > >
> > > Thanks,
> > > Jason.
> > >
> > > On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > >
> > > > with lld linker I see errors like
> > > >
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSetIO=
ErrorHandler
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >    |
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAddCo=
nnectionWatch
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >    |
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceConne=
ctionNumber
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >    |
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceProce=
ssMessages
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >    |
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> > > > IceSetShutdownNegotiation
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >    |
> > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceClose=
Connection
> > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > --no-allow-shlib-undefined)
> > > >
> > > > On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembedde=
d.org
> > > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce=
4ui-4.19.4
> > > > >
> > > > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > > > ---
> > > > >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb} =
  | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb =
=3D> libxfce4ui_4.19.4.bb} (92%)
> > > > >
> > > > > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.=
bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > > similarity index 92%
> > > > > rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.b=
b
> > > > > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > > index e53d01d00..ce711eb36 100644
> > > > > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > > > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURE=
S}"
> > > > >
> > > > >  # TODO: Check if 0001-... can go
> > > > >  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-sho=
rtcuts.xml-fix.patch"
> > > > > -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568c80=
22c31604348f9edadb02f227"
> > > > > +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40ad6=
6200cc3c055ab7156d718796"
> > > > >
> > > > >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
> > > > >  EXTRA_OECONF +=3D "--disable-vala"
> > > > > --
> > > > > 2.43.0
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#114040): https://lists.openembedded.org/g/ope=
nembedded-devel/message/114040
> > > > > Mute This Topic: https://lists.openembedded.org/mt/109772240/1997=
914
> > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/=
unsub [raj.khem@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >

