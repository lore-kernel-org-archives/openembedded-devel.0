Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE94D74955
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 01:33:49 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.4808.1730252019830918612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 18:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIlqD0he;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e605ffe10cso3664001b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 18:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730252019; x=1730856819; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LEERqNFGntHUDryy0ONcz1RvwdFJLQht63tYGzOsUw=;
        b=EIlqD0hejy0qo9HNZpWCt+CEUDcTE0zV1Ub/zJBXq/IBEHvmyFm33trpHQLxWB/99l
         /8WoUzgoEAFnEwZPMb2XusGg2Wv5Xtxfvw0ZTKjdyNs7ugqE4x4OVJq7CYuAbuaWmIAr
         mV3qS3F8+akLlq5TsFir335b2gkkmv1ir+cOcpLlF3o/v1qTpwmEeFPLkJTm7ez/0gBN
         WXCnmGQFypmR2o5OORvRaZQE615ra3yMjGa0flk8uSiSwD9Wnv+tzics0zlSeUdUzKgv
         ij6OGnu+PuLY6H4ARPk52RVz++RBZp91VzA4VwRg7jyFBt5EYK4ysUnD3u9Lrsmo1+rn
         tmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730252019; x=1730856819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LEERqNFGntHUDryy0ONcz1RvwdFJLQht63tYGzOsUw=;
        b=tNFMMzsXG7O5F0qNh1XG4qbconjzD9AnW2d9iBmrLx0+AWS5pj2y3YJN24ulgfIavi
         wBdP3d7mGZ53qGmF7P4Q1mG7X9Vv4DSXco4YMIod9HQHBfMX3uGQEKVvh7BnT9SmttGv
         JwzjgkGeltuiQdX/5y70I+1DSl/3z3U2+ivFZ7LFAOqW1YlO3cpJ45MGVpvl6tj/3I6y
         kK/cDgc1pEUAzoX+PWuP+YmZ1By7Sdbb75lgHmA3f3qYbR7yjC1zRaqZlosVuqqLrVwA
         gq2Vg0GiDirzjHT+qLWn/QpIpmemXEvUyjEGHp19zMaZ9e4hDMjF7w4/UWahO4AP+lSh
         YlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0wb4c+2WAjj6T4Fu6Y2WO6YWH2+88H8X6Pgc4bVu6u6/iPUAdN9PVR4r/7gfIL4upMWHeETBUsZkO88N3Q3ggTxo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5fJMhxM8ajoy1z5okxM1VK7hbj/sbW4h6QXOik96zdsSStAWQ
	7utOc0mD3hrKXdIrTb7LHq1uz6t3rpycBIaI7YGqiunZMR1A0GKcO/xwuLhLFC1vBuXIduD/n2b
	fWKlI+Z4R8q7kkDgFvEqM6BXc4kN6pkYc
X-Google-Smtp-Source: AGHT+IHSmcGvLsWMO9ooV8swH+QsaKWQlx9KxlZ4Ht9adsX8LwDgQEEbmKkuHkFw9qHYHj9uPlHLshsVsp8JKPd8F+4=
X-Received: by 2002:a05:6808:13c9:b0:3e6:147d:f33 with SMTP id
 5614622812f47-3e6384a635bmr13201718b6e.40.1730252019003; Tue, 29 Oct 2024
 18:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241028112450.2793248-1-max.oss.09@gmail.com>
 <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com> <CAMKF1srnqVmyuX+PTVAJUWXyN5QZJjc_6JqWy+SNHBpo+LC-tA@mail.gmail.com>
In-Reply-To: <CAMKF1srnqVmyuX+PTVAJUWXyN5QZJjc_6JqWy+SNHBpo+LC-tA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2024 18:33:12 -0700
Message-ID: <CAMKF1srFVBeLFv99OKbThkepdGv+pE4Op0gbX4HdtMeXW=ok=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
To: brgl@bgdev.pl
Cc: max.oss.09@gmail.com, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 01:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113339

On Tue, Oct 29, 2024 at 6:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Bart,
>
> On Mon, Oct 28, 2024 at 12:21=E2=80=AFPM Bartosz Golaszewski via
> lists.openembedded.org <brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
> >
> > On Mon, Oct 28, 2024 at 12:26=E2=80=AFPM Max Krummenacher via
> > lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > In my setup a build fails with
> > >
> > > | checking for gobject-introspection... configure: error: gobject-int=
rospection-1.0 is not installed
> > > | NOTE: The following config.log files may provide further informatio=
n.
> > > | NOTE: /var/home/krm/build/oe-core_master/build/tmp/work/cortexa55-t=
dx-linux/libgpiod/2.2/build/config.log
> > > | ERROR: configure failed
> > >
> > > From config.log this seems to be related to glib-2.0 not found:
> > >
> > > | configure:22484: $PKG_CONFIG --exists --print-errors "gobject-intro=
spection-1.0"
> > > | Package glib-2.0 was not found in the pkg-config search path.
> > > | Perhaps you should add the directory containing `glib-2.0.pc'
> > > | to the PKG_CONFIG_PATH environment variable
> > > | Package 'glib-2.0', required by 'gobject-introspection-1.0', not fo=
und
> > > | configure:22487: $? =3D 1
> > > | configure:22491: error: gobject-introspection-1.0 is not installed
> > >
> > > Note that glib-2.0.pc is present in recipes-sysroot-native but not
> > > in recipes-sysroot.
> > >
> > > Adding glib-2.0 to depends allows successful build of libgpiod 2.
> > >
> > > Fixes: 117d09ce43c7 ("libgpiod: update to v2.2")
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > I'm unsure if that is the correct fix.
> > > I would have expected that if gobject-introspection-1.0.pc depends
> > > on glib-2.0 to be present, then the inherit of gobject-introspection
> > > would have done the needful.
> > > However I'm not really familiar with gobject-introspection in the
> > > first place.
> > >
> > > Max
> > >
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-=
oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > index b55da72f7b7f..3d9758e27af7 100644
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> > >      file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a=
1e9a20f \
> > >  "
> > >
> > > +DEPENDS +=3D "glib-2.0"
> > > +
> >
> > Pulling in the entire GLib for everything in this recipe is definitely
> > a wrong answer. I'm travelling and have limited time right now but I
> > will take a look on Thursday or Friday. I did test disabling
> > introspection though so I'm surprised to see this.
> >
>
> There is a problem with this when --enable-introspection is used
> without ptests being in distro features
> the reason it works with ptests on is that it enables 'test'
> packageconfig which brings in glib-2.0 dependency
> however if we build without 'ptest' DISTRO_FEATURE it will fail to
> configure like below
>
>    configure:22490: checking for gobject-introspection
>    configure:22499: $PKG_CONFIG --exists --print-errors
> "gobject-introspection-1.0"
>    Package glib-2.0 was not found in the pkg-config search path.
>    Perhaps you should add the directory containing `glib-2.0.pc'
>    to the PKG_CONFIG_PATH environment variable
>    Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
>    configure:22502: $? =3D 1
>    configure:22506: error: gobject-introspection-1.0 is not installed
>
> The check inconfigure,ac is using GOBJECT_INTROSPECTION_CHECK macro
> which is expanding to this
> check I guess.
>
> It seems that glib-2.0 is a hard dep for gobject-introspection so it
> might be better to add it in bbclass itself.

Forgot to mention that I will apply this patch since some devs have
reported this so they can keep chugging
along, we can unbolt it when we have a proper fix.

>
> > Bart
> >
> > >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> > >
> > >  SRC_URI +=3D "file://gpio-manager.init"
> > > --
> > > 2.42.0
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113265): https://lists.openembedded.org/g/openembed=
ded-devel/message/113265
> > Mute This Topic: https://lists.openembedded.org/mt/109255084/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

