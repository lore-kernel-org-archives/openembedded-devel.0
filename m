Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895D6D59D69
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:01:36 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.28352.1732564891102147591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 12:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fpVyI8l9;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2965e10da1bso2456519fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732564890; x=1733169690; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVqNXxap5Qv95FML8boEIjyV0WwroQkC/YIfmLfIDrc=;
        b=fpVyI8l9wWllq2S1Zd7zEa3Abb/gs89nLuPf8TNeYetb1Afm06KZ3Huf56R8DAfcJY
         ZrZe/MB0AYlF08/bn9fhJj75rfLxnNcFiDqBcvd32+7KahwAy+D0RSa72pvygMn6c8S1
         9LC4F7pCgeNVoP9G1tlceIoO6I5CI2bcghVFGzhKGh5aRN7Z+3fXw6/sb5vuuNCAe7J2
         GFX0+JFGk6xbO9/E85Q8ioCKQrrOR32bjM71VqermLfAYs7iplRSGCqoYAyHIZNn7k/d
         vP+kBnQW9+9TK0uIGkGZwMWAl6t2ZYcNjOqUezEPgSQMUOPUavohu+nhD8cnQqNmH36F
         e6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564890; x=1733169690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVqNXxap5Qv95FML8boEIjyV0WwroQkC/YIfmLfIDrc=;
        b=QBUGdcdJcK73JndbinOuEIG998g5Ysv/j2INc+TZyNVQBCd8TJVSjLOyRW93HaauOo
         av6MXThaqeh7yeRmxN94xfjr7SYlDPhIbLGZ0H6L/9zXUnpV6agyW0OCjaOY+oqrfcoG
         D/+RVTmx104xUd8slgPswDg8h+3ZpGnp4NkTHruF5AjZ8DCvUYAXVbv2qgF3CcxbtskW
         jFSI/XvjkhGK3XxvE9Ev35Ptgpn1JrLljXQuNhSmCBo1NVX0LmxQLCqvCggJEUWvMVOR
         9B8UJgbqXqQ1TkgpeX/GFhpHI3t/+FMfx5UIMZbn6g9ol8W1Qu2zpz+a76H8txhw+gro
         X8kA==
X-Gm-Message-State: AOJu0YzwEp1YHOlKcJNZy+j3G1naPizYE9YljX+8bTU2CvRS6LKItU2F
	MNq4xw97RirwoRFCjcScdpZTQfw39dw5Xs7ypzR78TQuYeNxMq0w4UGgKwJx7AFJY+/kzh2X0y5
	G5uRpnPotED/zQ602hU7dSg+Ffy+l4zBn
X-Gm-Gg: ASbGncvatIDNqzi8ua2E6ljSLEYqErbshJWQmTD2j2s6LZFLCrN+ozrc65mZDN/oF5y
	EXDe4MIDrGSL796HEH0p4+6qOh7kpAw==
X-Google-Smtp-Source: AGHT+IHmQqjFaI/dOruztnoOlnXMknDWrNXncWDV0gVVm19978168GgEkKJA5eQKYDL8dsxcJolRZReACrg+q8xrjM4=
X-Received: by 2002:a05:6871:580e:b0:296:4be1:1d58 with SMTP id
 586e51a60fabf-29720e7b041mr12327477fac.40.1732564890002; Mon, 25 Nov 2024
 12:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
 <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com> <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com>
In-Reply-To: <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Mon, 25 Nov 2024 15:01:18 -0500
Message-ID: <CABTo8gCDkLNOXFXaAw-PyYE6uUJbXcCDGKjpYK_MhXv5_47qRw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 20:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114050

I've updated my DISTRO_FEATURES to have ld-is-lld and will let you
know what I find.

On Mon, Nov 25, 2024 at 2:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. <schonm@gmail.com> wrote:
> >
> > Khem,
> >
> > I have TOOLCHAIN =3D "clang" in my local.conf file and was not seeing
> > this error.  Is this perhaps riscv specific?
>
> I think you will also need ld-is-lld in DISTRO_FEATURES to reproduce
> it. It possible its RISCV specific but I think
> first thing is to get LLD linker going for build it and see if you can
> reproduce it too.
>
> >
> > I ask because I built core-image-minimal-xfce with raspberry PI 5
> > target as an arm 64 build.
> >
> > Thanks,
> > Jason.
> >
> > On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > with lld linker I see errors like
> > >
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSetIOEr=
rorHandler
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >    |
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAddConn=
ectionWatch
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >    |
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceConnect=
ionNumber
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >    |
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceProcess=
Messages
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >    |
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> > > IceSetShutdownNegotiation
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >    |
> > >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCloseCo=
nnection
> > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > --no-allow-shlib-undefined)
> > >
> > > On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembedded.=
org
> > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4u=
i-4.19.4
> > > >
> > > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > > ---
> > > >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb}   =
| 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb =3D=
> libxfce4ui_4.19.4.bb} (92%)
> > > >
> > > > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb=
 b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > similarity index 92%
> > > > rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > index e53d01d00..ce711eb36 100644
> > > > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}=
"
> > > >
> > > >  # TODO: Check if 0001-... can go
> > > >  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-short=
cuts.xml-fix.patch"
> > > > -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568c8022=
c31604348f9edadb02f227"
> > > > +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40ad662=
00cc3c055ab7156d718796"
> > > >
> > > >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
> > > >  EXTRA_OECONF +=3D "--disable-vala"
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#114040): https://lists.openembedded.org/g/opene=
mbedded-devel/message/114040
> > > > Mute This Topic: https://lists.openembedded.org/mt/109772240/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

