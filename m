Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3524AD0D7BF
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:37:51 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.15045.1728661060892373018
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUNmcRm/;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e5d0a80db4so1109572eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728661060; x=1729265860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xbImiYi0IsdpP7GrTtjEIpjRD+lvSwc6O0izySuDgI=;
        b=ZUNmcRm/mUGtJdQYlKBcvmtxXcYPcbBUsyNuHbh5PKj4KPpCldyycodj4yMa7hiwAz
         4Yc0lc/qtwduwspNQDcGCxNqoPKoUGflaCzZg/tgKivLhFetW3zhwdPThMbWBwkQFu+G
         f4L/zzY7/ytfQZ3cd/rxSiy9SZevaBqDg4+iJQeQL+SLDfznLb89T4fFbf9enbHNgVHC
         4POb84jM3J5Y6pITqsh7hKff2T2fCR6tI09DlE8ptJya/+PG7J1TErLivuDO97v+4dui
         bpnkFq9+hfNG8lajsNEl0PzXvJNcS0MoKRndJhEIr+OlXX54zbm9z0y3Xmz00D8BtR1k
         PDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661060; x=1729265860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xbImiYi0IsdpP7GrTtjEIpjRD+lvSwc6O0izySuDgI=;
        b=lNaiJDIIl3lgBQn94dCOu1YwBBQP/qnWLqW/NS5Xbo4vNJOy1Rq/VrOoqo4wNOUoo/
         LZTZtKMX2DTMapiZ+/AGa8uDMx6GVliozzPoPJp+zYlfeqiRezzlgQBmqQ454oS4VnjL
         0C0JvU6rituBiCWWOIcONhHjyJuMROi++iEBI6evEGUXi4wHnsoYsU0dU+P+Nk8yDa+Y
         y2myStC3dpiFLTq4nD3WpnKOOYvnAOecAMqxLJqUTl5ABr2EJ4Wm83C9zh+j0+7KknOn
         DMVjHi0VdCvy1lYNXbJvlZpQWju/tIXjCYv64THFBmuiB/w8YdwAY4p/Kk3HBCjdWzSv
         jt8Q==
X-Gm-Message-State: AOJu0YwRFegmqhwSvrpcQoGqxNinZoTA1eFhTepBpBp33CBDmGdO16ny
	UzaoYmyRUN/mOTMNY+n2P1+r0Z95N55ssM2GERStwsnARBfoNQaG1eZNBt/AkDqaXz1zdpz28aY
	VqzFXj9oNWOuz9hhN/u8YwsC8Sfo=
X-Google-Smtp-Source: AGHT+IEI6bzhnKN84lkPgkYpOdv1aozqP8SwAw+XayLNIZxYaDJmOl3QPn/WswR976Xrjyw3deyAiP1d1XiNfaXZqIQ=
X-Received: by 2002:a05:6870:71d2:b0:287:a53:935a with SMTP id
 586e51a60fabf-2886dd72846mr2835689fac.13.1728661059926; Fri, 11 Oct 2024
 08:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241011151023.1516957-1-yoann.congal@smile.fr>
 <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com> <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com>
In-Reply-To: <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2024 08:37:13 -0700
Message-ID: <CAMKF1sqTxHSL3yhb0Y486YDB56jgsRj-Y9WhpOCYXomV1CKEhg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112810

On Fri, Oct 11, 2024 at 8:34=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
>
>
> Le ven. 11 oct. 2024 =C3=A0 17:15, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>>
>> On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via
>> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
>> wrote:
>> >
>> > From: Yoann Congal <yoann.congal@smile.fr>
>> >
>> > gimptool can be used in GIMP plugin compilation. It would make more
>> > sense as a native tool. It also contains the sysroot path which break
>> > build with buildpaths QA error. Remove it from target packages.
>> >
>> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> > ---
>> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome=
/recipes-gimp/gimp/gimp_2.10.38.bb
>> > index a17e03b103..8755af94a9 100644
>> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> > @@ -70,6 +70,13 @@ do_compile:prepend() {
>> >      export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -na=
me 'gegl-*'`
>> >  }
>> >
>> > +do_install:append:class-target() {
>> > +    # gimptool can be used in GIMP plugin compilation. It would make =
more sense
>> > +    # as a native tool. It also contains the sysroot path which break=
 build
>> > +    # with buildpaths QA error. Remove it from target packages.
>> > +    rm ${D}/${bindir}/gimptool-2.0
>> > +}
>>
>> it does mean we can't build plugins in a usecase where an on-device
>> SDK is being used, even though it is a rare usecase.
>> Can we explore a way to omit the sysroot from being emitted into the
>> target version of gimptool ?
>
>
> Sure!
>
> Right now, Host CC is embedded in the target binary as a last-resort defa=
ult to make gimptool output a reasonable CC for gimp plugins compilation.
> I don't see how to provide a good value to put there unless I can get the=
 CC that will be used in the target SDK? (I don't think I can)
>

Perhaps replacing instances of SYSROOT with target exec_prefix in CC
emitted to binary would be a workable solution.

> What do you think about removing this last-resort default with a patch? T=
hat would make gimptool dependent on a correct CC being provided to it (but=
 the target SDK should already do that)
>
>>
>> > +
>> >  FILES:${PN}  +=3D "${datadir}/metainfo"
>> >
>> >  RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#112807): https://lists.openembedded.org/g/openembe=
dded-devel/message/112807
>> > Mute This Topic: https://lists.openembedded.org/mt/108950447/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert

