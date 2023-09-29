Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A058E71D32
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:22:38 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.17029.1695993752125812738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1Kkx7bk;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1bba7717d3bso7143086fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695993751; x=1696598551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq4YuQ6tVXG8CD5E2lrQCzbaoladHTVKD6j0YaMVNW0=;
        b=Y1Kkx7bkdiN0v33bsFDoAOYGloKruRNrXyeXbDGP3oWV5epcrrDPW3EU5vsqe3R9we
         1GuRVachSTMYi2pZd8nAUUxlKkbNynN7iVTDLmUI5DXdml8xi5k8saseUe5I3nrujPBV
         RrAZvFRq55qf/etX99iKvuQe59i9HAAYhr/c9TtWhOZUftIMRNunJn4XeV7phhD3lWtc
         45y824gR/NHBJEbOtthmGN+l1K3p72NtlPC3aKWxjvIpcttGtCVFPIQJRNY0Nd1CiL1W
         udEQ5RkwGWPmbF2DFgBVbm4JcxLRoOfRiIF7Cj2dHWZTOchirQhMmUdRgy376AVWFkef
         okuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695993751; x=1696598551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq4YuQ6tVXG8CD5E2lrQCzbaoladHTVKD6j0YaMVNW0=;
        b=mRj8qtrtlYKa94PRzwWprtgPJRWNZQG0Li3Epc5PNub7q4UQHR9fy3QvjrSYwPQYHj
         7qn39R8I/gYCYl0oVHGDiUDFBi30RK7fOdZZ6jcE+mV/Z2uCV+7O0Pt+I4e00taEzCst
         IYvNAaIeJ8HEcomFUVY3fMxx2ytq0ykD+3047K4Kou3nczpd/7S6ovdGEnBAS7ES2C7t
         BPiS0UzraCSfkNBjsNawz00epAAtWyo7ea+Ct4vcNzYH3LN1Wpsn299N7Ytk7wAobhFY
         VIoYEHKGXbbcBQOicGhEfCS0KCG8uLqGO1Uv5CmCYxPOtajDCKbQK6DSsUVyoeLWv76p
         5Kvw==
X-Gm-Message-State: AOJu0YwR4fKpEaSsFV6Vj3hmJtRdbK9uJY6rw3MFFh9K/m+C/oQ067K+
	tWLSxz21H/xLTqwtUV5xpTNGGYOe+MROQsE04hk=
X-Google-Smtp-Source: AGHT+IHPJSSTs02DDbX1Ap5EcvUMgdo5mJJT7hYgK/U/exQ3wYwX1k/+vf88uuZhfsHO5zmEFKEWFaXzejSBFJWMBo4=
X-Received: by 2002:a05:6870:418c:b0:1d5:cdf7:bd95 with SMTP id
 y12-20020a056870418c00b001d5cdf7bd95mr4399992oac.16.1695993751148; Fri, 29
 Sep 2023 06:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
 <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
 <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
 <CAATN8PUmx4gek6TM1PX-wydDxmRKz7RZHSGMAKRVOfLAyig6-A@mail.gmail.com>
 <CA+KKcbmi9-0cAYdjP3fdRcfzJQj2uDJWeFSZV7H++RmO6e7khg@mail.gmail.com>
 <CAMKF1spR-2ypWwRhw36pgwwqoZkLnHsi6d6iUkF2H68s-QB2Cw@mail.gmail.com> <CAATN8PWUQgu=-KF7K_7HMVKBT69O=6f65eVGsTWe+YEcU5h_ew@mail.gmail.com>
In-Reply-To: <CAATN8PWUQgu=-KF7K_7HMVKBT69O=6f65eVGsTWe+YEcU5h_ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Sep 2023 06:22:05 -0700
Message-ID: <CAMKF1spTc26bCt0+5B1T2JGuhCKcCB_+vBZEL-UMuHdGQ35fFA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Federico Pietro Briata <federicobriata@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Andrea Reali <andrea.reali@cnhind.com>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105241

thanks, do we still need the arm fix? it would be good if you resend
the whole series as v2 and so on.

On Thu, Sep 28, 2023 at 10:24=E2=80=AFPM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> Hello, the additional fix is already on patchwork!
>
> On Fri, Sep 29, 2023, 06:44 Khem Raj <raj.khem@gmail.com> wrote:
>>
>> fails to build on AB
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3186/s=
teps/14/logs/stdio
>>
>> On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata
>> <federicobriata@gmail.com> wrote:
>> >
>> > thanks guys,
>> > we'll test it and give you a feedback very soon.
>> > best regards
>> > Federico
>> >
>> >
>> > Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna <costamagna.gianfran=
co@gmail.com> ha scritto:
>> >>
>> >> The functionality works already.
>> >> The idea is to avoid many files with custom cpu code, and try to use =
perf native functions to get pc/sp and so on. But I did test, coredumps are=
 correctly sent as well as context files.
>> >>
>> >> G.
>> >>
>> >> On Thu, Sep 28, 2023, 18:30 Khem Raj <raj.khem@gmail.com> wrote:
>> >>>
>> >>> On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
>> >>> <costamagna.gianfranco@gmail.com> wrote:
>> >>> >
>> >>> > hello, sure looks perfect to me!
>> >>> > btw you will also need this one to build properly on some architec=
ture
>> >>> > https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190
>> >>>
>> >>> OK
>> >>>
>> >>> >
>> >>> > I'm polishing up the work, testing, and will try to update upstrea=
m PR.
>> >>> >
>> >>> > But please note, this is a never-tested and highly experimental dl=
t feature nobody is using right now.
>> >>> > (and it's a new binary, so won't affect the normal dlt usage)
>> >>>
>> >>> This does not generate confidence. If you want this to be testing-on=
ly
>> >>> then mark the patches RFC so
>> >>> we can understand the intentions.
>> >>>
>> >>> >
>> >>> > Expect new commits soon :)
>> >>>
>> >>> sure
>> >>>
>> >>> >
>> >>> > G.
>> >>> >
>> >>> > On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.c=
om> wrote:
>> >>> >>
>> >>> >> I have staged it with some modified commit msg summary please che=
ck
>> >>> >> master-next and see if it looks ok.
>> >>> >>
>> >>> >> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
>> >>> >> <costamagna.gianfranco@gmail.com> wrote:
>> >>> >> >
>> >>> >> > Make sure also without systemd enabled as default, the tools ca=
n be built and installed,
>> >>> >> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-ex=
amples and dlt-console.
>> >>> >> > They have stub functionalities when systemd is not default, but=
 they can still be used with
>> >>> >> > limited functionalities
>> >>> >> >
>> >>> >> > Reported-By: Federico Briata <federicobriata@gmail.com>
>> >>> >> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
>> >>> >> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yaho=
o.it>
>> >>> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> >>> >> > ---
>> >>> >> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++=
++------
>> >>> >> >  1 file changed, 7 insertions(+), 6 deletions(-)
>> >>> >> >
>> >>> >> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.1=
8.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> >>> >> > index 33fae0619..3811772a7 100644
>> >>> >> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> >>> >> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> >>> >> > @@ -22,12 +22,13 @@ SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38e=
b4271044f"
>> >>> >> >
>> >>> >> >  S =3D "${WORKDIR}/git"
>> >>> >> >
>> >>> >> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adapto=
r dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
>> >>> >> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
>> >>> >> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dl=
t-console \
>> >>> >> >   udp-connection dlt-system dlt-filetransfer "
>> >>> >> >  # dlt-dbus
>> >>> >> >
>> >>> >> >  # General options
>> >>> >> > -PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWI=
TH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
>> >>> >> > +PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWI=
TH_DLT_EXAMPLES=3DOFF"
>> >>> >> >
>> >>> >> >  # Linux options
>> >>> >> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=
=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd"
>> >>> >> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D "-DWITH_U=
DP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
>> >>> >> >
>> >>> >> >  # Command line options
>> >>> >> >  PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_D=
LT_SYSTEM=3DOFF"
>> >>> >> > -PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH=
_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd"
>> >>> >> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=
=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd"
>> >>> >> > -PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DO=
N,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd"
>> >>> >> > +PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH=
_DLT_ADAPTOR=3DOFF"
>> >>> >> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=
=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
>> >>> >> > +PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DO=
N,-DWITH_DLT_ADAPTOR_UDP=3DOFF"
>> >>> >> >  PACKAGECONFIG[dlt-filetransfer] =3D "-DWITH_DLT_FILETRANSFER=
=3DON,-DWITH_DLT_FILETRANSFER=3DOFF"
>> >>> >> > -PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH=
_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd"
>> >>> >> > +PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH=
_DLT_CONSOLE=3DOFF"
>> >>> >> >
>> >>> >> >  inherit autotools gettext cmake pkgconfig systemd
>> >>> >> >
>> >>> >> > --
>> >>> >> > 2.34.1
>> >>> >> >
>> >>> >> >
>> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>> >> > Links: You receive all messages sent to this group.
>> >>> >> > View/Reply Online (#105219): https://lists.openembedded.org/g/o=
penembedded-devel/message/105219
>> >>> >> > Mute This Topic: https://lists.openembedded.org/mt/101634559/19=
97914
>> >>> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-deve=
l/unsub [raj.khem@gmail.com]
>> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>> >> >

