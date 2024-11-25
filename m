Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111DD59D67
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 19:41:26 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.27850.1732563682062809880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 11:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4NZoHUW;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71d3e506981so965084a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732563681; x=1733168481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyS6TfeIy+pWZBTneWEEQW9sBkM3zTVI8Vo+4eupUAM=;
        b=B4NZoHUWsjrJqxxq9ST45o487hWf14ek6Ovv8QM4gMjrLbVuC2y5sfWIN1LLnAzcir
         OL+SVE6D+wi50+UhV+l5Li88sKlszwVEsxO8F0mP8rukwgwW9syjb9oniIdbBAv9nDmc
         +R8zryXwJduqYSJPi30jszMDrHOZ5PHh/HSTH3/fGkDTYO/VvHCToThU0C2iYAX5Nj2q
         O1RdwganMc4xUpLlpUNl4vpbd69I4orPRx0CLObGm+SjoARGf/+Ly8A00DQqNjDF0+q/
         4CmM/vJGs9mt0v3nQCKe3yeOzNQqD8YKQaQsmj5gEOTB8GayCpKK8+m/6WdgIEOXh1Vb
         Zv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732563681; x=1733168481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyS6TfeIy+pWZBTneWEEQW9sBkM3zTVI8Vo+4eupUAM=;
        b=qBRjx2G/TWicYMQsqVVHiirOsprL/lBbKokChDLphWnwyUWetDaaJA7QKUOm6/Nf+/
         +/Jjk27+OTZS25gWYAOltZ7yWkYO98eQzYRxnje/BKmgMfQ9rkRwTywIG6iNly6iwg8Z
         ma6VCWFOUMMZdCQUBFCEWM6IEe15JITOJ32FXUZRgphFgNVXOYmqQHgFYRhSQ3SU+mIf
         nB8W9uNV1ofEJiLJj4WgQiwEdwaIhOWvvKA78NdIKPMIDkHXUSlfPKVsjipmwuYBBduq
         BP6V7lhGZ52E1VbRevCf2Lp4gjclI9un29gJDzTx049ywIMmLg7i1LFEjmA6Hg2rjGmg
         KtgQ==
X-Gm-Message-State: AOJu0YzoGrFHKslsfjWGRZlBfafw3Bt0xMqcPNAWL17kjscBAQ/IBVD0
	CFRSN8df4ZvHBG9uOvI+1poaGgo34/8x/75cngPuCOLhh7EMtvAbvOygTu8sbd1YpKeE2B+At/p
	gIivA11eddOvquICIAgg/fUSnxls=
X-Gm-Gg: ASbGncuiEbYN/5iFrVE+5lMUR34SbL7/qNYniczvtb0cdk4iAHojWP0GaFaYqHyJBY9
	ONMHqkBXX24kHzm7poDyTnmZyphItcw==
X-Google-Smtp-Source: AGHT+IEnGnOq8WBvv8cFKqOrgdvZdq9Qdd6iOi3+f2PeXUDyBRNbc1XpSlbMXyfCPFpRrjuLNDS2tyRIYPTwUZ4GVLk=
X-Received: by 2002:a05:6830:390c:b0:718:65f3:6b3e with SMTP id
 46e09a7af769-71c04ba3090mr13556720a34.15.1732563681299; Mon, 25 Nov 2024
 11:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com> <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
In-Reply-To: <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 11:40:55 -0800
Message-ID: <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: "J. S." <schonm@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 19:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114049

On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. <schonm@gmail.com> wrote:
>
> Khem,
>
> I have TOOLCHAIN =3D "clang" in my local.conf file and was not seeing
> this error.  Is this perhaps riscv specific?

I think you will also need ld-is-lld in DISTRO_FEATURES to reproduce
it. It possible its RISCV specific but I think
first thing is to get LLD linker going for build it and see if you can
reproduce it too.

>
> I ask because I built core-image-minimal-xfce with raspberry PI 5
> target as an arm 64 build.
>
> Thanks,
> Jason.
>
> On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > with lld linker I see errors like
> >
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSetIOErro=
rHandler
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >    |
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAddConnec=
tionWatch
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >    |
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceConnectio=
nNumber
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >    |
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceProcessMe=
ssages
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >    |
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> > IceSetShutdownNegotiation
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >    |
> >    | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCloseConn=
ection
> >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > --no-allow-shlib-undefined)
> >
> > On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembedded.or=
g
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-=
4.19.4
> > >
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > ---
> > >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb}   | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb =3D> =
libxfce4ui_4.19.4.bb} (92%)
> > >
> > > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb b=
/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > similarity index 92%
> > > rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > index e53d01d00..ce711eb36 100644
> > > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> > >
> > >  # TODO: Check if 0001-... can go
> > >  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcu=
ts.xml-fix.patch"
> > > -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568c8022c3=
1604348f9edadb02f227"
> > > +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40ad66200=
cc3c055ab7156d718796"
> > >
> > >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
> > >  EXTRA_OECONF +=3D "--disable-vala"
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#114040): https://lists.openembedded.org/g/openemb=
edded-devel/message/114040
> > > Mute This Topic: https://lists.openembedded.org/mt/109772240/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

