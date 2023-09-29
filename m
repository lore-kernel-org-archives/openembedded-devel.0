Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3297CE743E1
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 04:44:13 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.11105.1695962650887028325
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 21:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMNWOJKP;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1e106eb414cso778254fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 21:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695962650; x=1696567450; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03gRIYJWMx4VUR/d3lYtxLi4eTI2WxcMwyQgcLDKrlg=;
        b=BMNWOJKPRN6/gxj+jru1gBLiUVsMEJMGFGHJfJNq8BxNsStKPpEFlpomUuyEH23G27
         zzUbjLpjcnsyNR2Ja1RE9jNdvts6GyJ4Y4k3m0j+TR6PCuT2yb+4rKnGiBfbdPKPS6bm
         zQR7sqF1SWGN3q4xtBqk9FTTipL1eDQ3iJJlSJgbZY+9HrDfImryYXjIIZIm5E4vJwDc
         nWkvlC4QSs8hM53dwy2KJlvo+6qEO8IIwZkc9LenFpUXSp1MSMFAvrbVqFOH7slVLOZR
         GCXYzh6JUgulMh/K4o92BknmJyNvfs3iAcBIK/uhYugWLinUUy27a6z8bS8uE/eP1GfP
         LDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695962650; x=1696567450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03gRIYJWMx4VUR/d3lYtxLi4eTI2WxcMwyQgcLDKrlg=;
        b=nJroL/S7ogBk5U8Yw3v5ct1Whcf/XfhqYAW1fpFroRRQSa1RnMu5M/WCJjWyvZAoiL
         rJIDjGB7X5zs+t74tlRtHUscOJsLR+rh0OhVc4sze7kgD+ZW2UHl6bEQEu4uVqsJC/M2
         IR9SwtIdE+DZ39J2y44Qqy5m/CBYy5BFllYqbVkHLac0v8vvXAozy210BpegD92/3+Z9
         ntuT9ozFmdzqAOGP+hsFo1E25jQBeqQmINVRrTlJ6NZr6E5Nza4PbFRPlHHjKEyCSzit
         KsCWZvhW3gmZfBIpwMp5xT18zTdOc1Pu1H43DmsQksLanaSZ+r/mvGbMRBgpq6XYg0fy
         sB/Q==
X-Gm-Message-State: AOJu0YwltlUCPxDrN7Tk7S/dZfdQYxF5riNlEAz2jF9Gahdcxx8Da8lk
	id/BmcOJuHIts32NtjYaj+l4+mRsCuRPbywPEZ4=
X-Google-Smtp-Source: AGHT+IFx9HGOfQnupn4HAU4FmF25aLckfjpgVa4naltAlEnTCaqWDpKgyhgobLMAyqKMVVYJFBei2oUVf+4uUnbAXJo=
X-Received: by 2002:a05:6870:d24e:b0:1d6:c780:8b59 with SMTP id
 h14-20020a056870d24e00b001d6c7808b59mr3110551oac.53.1695962650025; Thu, 28
 Sep 2023 21:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
 <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
 <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
 <CAATN8PUmx4gek6TM1PX-wydDxmRKz7RZHSGMAKRVOfLAyig6-A@mail.gmail.com> <CA+KKcbmi9-0cAYdjP3fdRcfzJQj2uDJWeFSZV7H++RmO6e7khg@mail.gmail.com>
In-Reply-To: <CA+KKcbmi9-0cAYdjP3fdRcfzJQj2uDJWeFSZV7H++RmO6e7khg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 21:43:43 -0700
Message-ID: <CAMKF1spR-2ypWwRhw36pgwwqoZkLnHsi6d6iUkF2H68s-QB2Cw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Federico Pietro Briata <federicobriata@gmail.com>
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Andrea Reali <andrea.reali@cnhind.com>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 04:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105232

fails to build on AB
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3186/step=
s/14/logs/stdio

On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata
<federicobriata@gmail.com> wrote:
>
> thanks guys,
> we'll test it and give you a feedback very soon.
> best regards
> Federico
>
>
> Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna <costamagna.gianfranco@=
gmail.com> ha scritto:
>>
>> The functionality works already.
>> The idea is to avoid many files with custom cpu code, and try to use per=
f native functions to get pc/sp and so on. But I did test, coredumps are co=
rrectly sent as well as context files.
>>
>> G.
>>
>> On Thu, Sep 28, 2023, 18:30 Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
>>> <costamagna.gianfranco@gmail.com> wrote:
>>> >
>>> > hello, sure looks perfect to me!
>>> > btw you will also need this one to build properly on some architectur=
e
>>> > https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190
>>>
>>> OK
>>>
>>> >
>>> > I'm polishing up the work, testing, and will try to update upstream P=
R.
>>> >
>>> > But please note, this is a never-tested and highly experimental dlt f=
eature nobody is using right now.
>>> > (and it's a new binary, so won't affect the normal dlt usage)
>>>
>>> This does not generate confidence. If you want this to be testing-only
>>> then mark the patches RFC so
>>> we can understand the intentions.
>>>
>>> >
>>> > Expect new commits soon :)
>>>
>>> sure
>>>
>>> >
>>> > G.
>>> >
>>> > On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com>=
 wrote:
>>> >>
>>> >> I have staged it with some modified commit msg summary please check
>>> >> master-next and see if it looks ok.
>>> >>
>>> >> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
>>> >> <costamagna.gianfranco@gmail.com> wrote:
>>> >> >
>>> >> > Make sure also without systemd enabled as default, the tools can b=
e built and installed,
>>> >> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examp=
les and dlt-console.
>>> >> > They have stub functionalities when systemd is not default, but th=
ey can still be used with
>>> >> > limited functionalities
>>> >> >
>>> >> > Reported-By: Federico Briata <federicobriata@gmail.com>
>>> >> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
>>> >> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.i=
t>
>>> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>> >> > ---
>>> >> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++-=
-----
>>> >> >  1 file changed, 7 insertions(+), 6 deletions(-)
>>> >> >
>>> >> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.1=
0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>>> >> > index 33fae0619..3811772a7 100644
>>> >> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>>> >> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>>> >> > @@ -22,12 +22,13 @@ SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb42=
71044f"
>>> >> >
>>> >> >  S =3D "${WORKDIR}/git"
>>> >> >
>>> >> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor d=
lt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
>>> >> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
>>> >> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-c=
onsole \
>>> >> >   udp-connection dlt-system dlt-filetransfer "
>>> >> >  # dlt-dbus
>>> >> >
>>> >> >  # General options
>>> >> > -PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_=
DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
>>> >> > +PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_=
DLT_EXAMPLES=3DOFF"
>>> >> >
>>> >> >  # Linux options
>>> >> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3D=
OFF -DWITH_DLT_SYSTEM=3DOFF,systemd"
>>> >> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D "-DWITH_UDP_=
CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
>>> >> >
>>> >> >  # Command line options
>>> >> >  PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_=
SYSTEM=3DOFF"
>>> >> > -PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DL=
T_ADAPTOR=3DOFF,,dlt-daemon-systemd"
>>> >> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3D=
ON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd"
>>> >> > -PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-=
DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd"
>>> >> > +PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DL=
T_ADAPTOR=3DOFF"
>>> >> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3D=
ON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
>>> >> > +PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-=
DWITH_DLT_ADAPTOR_UDP=3DOFF"
>>> >> >  PACKAGECONFIG[dlt-filetransfer] =3D "-DWITH_DLT_FILETRANSFER=3DON=
,-DWITH_DLT_FILETRANSFER=3DOFF"
>>> >> > -PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DL=
T_CONSOLE=3DOFF,,dlt-daemon-systemd"
>>> >> > +PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DL=
T_CONSOLE=3DOFF"
>>> >> >
>>> >> >  inherit autotools gettext cmake pkgconfig systemd
>>> >> >
>>> >> > --
>>> >> > 2.34.1
>>> >> >
>>> >> >
>>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >> > Links: You receive all messages sent to this group.
>>> >> > View/Reply Online (#105219): https://lists.openembedded.org/g/open=
embedded-devel/message/105219
>>> >> > Mute This Topic: https://lists.openembedded.org/mt/101634559/19979=
14
>>> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/u=
nsub [raj.khem@gmail.com]
>>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >> >

