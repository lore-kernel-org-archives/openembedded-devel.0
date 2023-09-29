Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA122E743ED
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 05:24:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.11442.1695965072896509918
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 22:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8tigDIL;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690fa0eea3cso12363159b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 22:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695965072; x=1696569872; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ebo++zFXX7d+qOkrMv7kyX0WiE+/2VVMxgiXqoYIGco=;
        b=N8tigDILcXh/lk2JSTcnLv0DntaGjjpuuzSJSVgnGZJ2OfEYHl6xvYJ7zi3gqAZwY4
         iwaqK6GOqBzjt/m3uQ8CBNIhl3oNU6Sbm2ZTCDlMqVBeuxfDusV2GcQzLGfD1zeKQDHI
         N1Uqj7COnwtjB+SNTIBLI3JyMGFTPx2btS6LsQ8xmqKbwPg6s69TcYzsItz+XER8ijUX
         FwKN/y/sUzm1W7Vq1y/3KtWqGPALLkh1nIKTUBD6Xh7CE3PzQbErAc3M9sEhQeTAUSkj
         +WB3/IxJJZ3eqJeCBaKoWemjgyMtOhu9Vp/+Gtalnp4DEHoqdNZ8zi6NHJC1xKSXTJhZ
         /38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965072; x=1696569872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ebo++zFXX7d+qOkrMv7kyX0WiE+/2VVMxgiXqoYIGco=;
        b=P4bZQgN5Ba0g2zr7x2Z1NLxVyFyF9SroBTVVW9ssELHS7k365giVnEEj0UQ2h8gfAv
         S9IsF+ZovHn/xNK7O/xFNxOZbxRCMoy6NmhOoo14joc6od3nF7nRH8zl3abam8Cdpv6/
         EChHMgf9VPUWQ3UmM95nVyx+U2lQJ27ZYZitYZ3d8+if8OKkI8m7RN1K78gfmwvuRl0/
         vTUjSPZG15Fec0BQB0j4+e8J4EzrvymzRGvnyYrsNcwSyJbfdIy842EtTIjxQFNwpSo4
         vcFHIlUmBJ5NQCoLx+UevJgjs6xox/Ef7jY4atmiEdIY5yMhwUxqCcsi9gjPEuBe/Tzw
         oyGA==
X-Gm-Message-State: AOJu0YxJA/wZFMg3ahvxTdwX5e0gfN6gw1YIi/+hiMAPlDo36vO7fZ0Y
	umOORD7JLJ31m40NVNQnTk1t3rJLDwL7E1dAAnQ=
X-Google-Smtp-Source: AGHT+IFUKqVH2vYTs81paxmniVMcSDznvwfW2idAjbdS7XhZbJ6keA71Q7z7UpEq7yQPtu70KC6+e6uAaRkcBpGUsg4=
X-Received: by 2002:a05:6a20:96cc:b0:143:f4dd:dfae with SMTP id
 hq12-20020a056a2096cc00b00143f4dddfaemr2653319pzc.43.1695965072123; Thu, 28
 Sep 2023 22:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
 <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
 <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
 <CAATN8PUmx4gek6TM1PX-wydDxmRKz7RZHSGMAKRVOfLAyig6-A@mail.gmail.com>
 <CA+KKcbmi9-0cAYdjP3fdRcfzJQj2uDJWeFSZV7H++RmO6e7khg@mail.gmail.com> <CAMKF1spR-2ypWwRhw36pgwwqoZkLnHsi6d6iUkF2H68s-QB2Cw@mail.gmail.com>
In-Reply-To: <CAMKF1spR-2ypWwRhw36pgwwqoZkLnHsi6d6iUkF2H68s-QB2Cw@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Fri, 29 Sep 2023 07:24:19 +0200
Message-ID: <CAATN8PWUQgu=-KF7K_7HMVKBT69O=6f65eVGsTWe+YEcU5h_ew@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Khem Raj <raj.khem@gmail.com>
Cc: Federico Pietro Briata <federicobriata@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Andrea Reali <andrea.reali@cnhind.com>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000acec39060678a3ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 05:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105233

--000000000000acec39060678a3ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, the additional fix is already on patchwork!

On Fri, Sep 29, 2023, 06:44 Khem Raj <raj.khem@gmail.com> wrote:

> fails to build on AB
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3186/st=
eps/14/logs/stdio
>
> On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata
> <federicobriata@gmail.com> wrote:
> >
> > thanks guys,
> > we'll test it and give you a feedback very soon.
> > best regards
> > Federico
> >
> >
> > Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> ha scritto:
> >>
> >> The functionality works already.
> >> The idea is to avoid many files with custom cpu code, and try to use
> perf native functions to get pc/sp and so on. But I did test, coredumps a=
re
> correctly sent as well as context files.
> >>
> >> G.
> >>
> >> On Thu, Sep 28, 2023, 18:30 Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
> >>> <costamagna.gianfranco@gmail.com> wrote:
> >>> >
> >>> > hello, sure looks perfect to me!
> >>> > btw you will also need this one to build properly on some
> architecture
> >>> > https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190
> >>>
> >>> OK
> >>>
> >>> >
> >>> > I'm polishing up the work, testing, and will try to update upstream
> PR.
> >>> >
> >>> > But please note, this is a never-tested and highly experimental dlt
> feature nobody is using right now.
> >>> > (and it's a new binary, so won't affect the normal dlt usage)
> >>>
> >>> This does not generate confidence. If you want this to be testing-onl=
y
> >>> then mark the patches RFC so
> >>> we can understand the intentions.
> >>>
> >>> >
> >>> > Expect new commits soon :)
> >>>
> >>> sure
> >>>
> >>> >
> >>> > G.
> >>> >
> >>> > On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.co=
m> wrote:
> >>> >>
> >>> >> I have staged it with some modified commit msg summary please chec=
k
> >>> >> master-next and see if it looks ok.
> >>> >>
> >>> >> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
> >>> >> <costamagna.gianfranco@gmail.com> wrote:
> >>> >> >
> >>> >> > Make sure also without systemd enabled as default, the tools can
> be built and installed,
> >>> >> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp,
> dlt-examples and dlt-console.
> >>> >> > They have stub functionalities when systemd is not default, but
> they can still be used with
> >>> >> > limited functionalities
> >>> >> >
> >>> >> > Reported-By: Federico Briata <federicobriata@gmail.com>
> >>> >> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
> >>> >> > Signed-off-by: Gianfranco Costamagna <
> costamagnagianfranco@yahoo.it>
> >>> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> >>> >> > ---
> >>> >> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13
> +++++++------
> >>> >> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >>> >> >
> >>> >> > diff --git a/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb
> >>> >> > index 33fae0619..3811772a7 100644
> >>> >> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> >>> >> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> >>> >> > @@ -22,12 +22,13 @@ SRCREV =3D
> "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
> >>> >> >
> >>> >> >  S =3D "${WORKDIR}/git"
> >>> >> >
> >>> >> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples
> dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
> >>> >> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
> >>> >> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp
> dlt-console \
> >>> >> >   udp-connection dlt-system dlt-filetransfer "
> >>> >> >  # dlt-dbus
> >>> >> >
> >>> >> >  # General options
> >>> >> > -PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
> >>> >> > +PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF"
> >>> >> >
> >>> >> >  # Linux options
> >>> >> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=
=3DOFF
> -DWITH_DLT_SYSTEM=3DOFF,systemd"
> >>> >> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D
> "-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
> >>> >> >
> >>> >> >  # Command line options
> >>> >> >  PACKAGECONFIG[dlt-system] =3D
> "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3DOFF"
> >>> >> > -PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd"
> >>> >> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon=
-systemd"
> >>> >> > -PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-sys=
temd"
> >>> >> > +PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF"
> >>> >> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
> >>> >> > +PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF"
> >>> >> >  PACKAGECONFIG[dlt-filetransfer] =3D
> "-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF"
> >>> >> > -PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd"
> >>> >> > +PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF"
> >>> >> >
> >>> >> >  inherit autotools gettext cmake pkgconfig systemd
> >>> >> >
> >>> >> > --
> >>> >> > 2.34.1
> >>> >> >
> >>> >> >
> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> >> > Links: You receive all messages sent to this group.
> >>> >> > View/Reply Online (#105219):
> https://lists.openembedded.org/g/openembedded-devel/message/105219
> >>> >> > Mute This Topic:
> https://lists.openembedded.org/mt/101634559/1997914
> >>> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> >> >
>

--000000000000acec39060678a3ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello, the additional fix is already on patchwork!=C2=A0<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Sep 29, 2023, 06:44 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">fails to build on AB<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/3186/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3186/ste=
ps/14/logs/stdio</a><br>
<br>
On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata<br>
&lt;<a href=3D"mailto:federicobriata@gmail.com" target=3D"_blank" rel=3D"no=
referrer">federicobriata@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; thanks guys,<br>
&gt; we&#39;ll test it and give you a feedback very soon.<br>
&gt; best regards<br>
&gt; Federico<br>
&gt;<br>
&gt;<br>
&gt; Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna &lt;<a href=3D"mailt=
o:costamagna.gianfranco@gmail.com" target=3D"_blank" rel=3D"noreferrer">cos=
tamagna.gianfranco@gmail.com</a>&gt; ha scritto:<br>
&gt;&gt;<br>
&gt;&gt; The functionality works already.<br>
&gt;&gt; The idea is to avoid many files with custom cpu code, and try to u=
se perf native functions to get pc/sp and so on. But I did test, coredumps =
are correctly sent as well as context files.<br>
&gt;&gt;<br>
&gt;&gt; G.<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 28, 2023, 18:30 Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna<=
br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; hello, sure looks perfect to me!<br>
&gt;&gt;&gt; &gt; btw you will also need this one to build properly on some=
 architecture<br>
&gt;&gt;&gt; &gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe/=
list/?series=3D17190" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://patchwork.yoctoproject.org/project/oe/list/?series=3D17190</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; OK<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I&#39;m polishing up the work, testing, and will try to u=
pdate upstream PR.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; But please note, this is a never-tested and highly experi=
mental dlt feature nobody is using right now.<br>
&gt;&gt;&gt; &gt; (and it&#39;s a new binary, so won&#39;t affect the norma=
l dlt usage)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This does not generate confidence. If you want this to be test=
ing-only<br>
&gt;&gt;&gt; then mark the patches RFC so<br>
&gt;&gt;&gt; we can understand the intentions.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Expect new commits soon :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; sure<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; G.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.=
khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; I have staged it with some modified commit msg summar=
y please check<br>
&gt;&gt;&gt; &gt;&gt; master-next and see if it looks ok.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco<br=
>
&gt;&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Make sure also without systemd enabled as defaul=
t, the tools can be built and installed,<br>
&gt;&gt;&gt; &gt;&gt; &gt; such as dlt-adaptor, dlt-adaptor-stdin, dlt-adap=
tor-udp, dlt-examples and dlt-console.<br>
&gt;&gt;&gt; &gt;&gt; &gt; They have stub functionalities when systemd is n=
ot default, but they can still be used with<br>
&gt;&gt;&gt; &gt;&gt; &gt; limited functionalities<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Reported-By: Federico Briata &lt;<a href=3D"mail=
to:federicobriata@gmail.com" target=3D"_blank" rel=3D"noreferrer">federicob=
riata@gmail.com</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Reported-By: Andrea Reali &lt;<a href=3D"mailto:=
andrea.reali@cnhind.com" target=3D"_blank" rel=3D"noreferrer">andrea.reali@=
cnhind.com</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=
=3D"mailto:costamagnagianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferr=
er">costamagnagianfranco@yahoo.it</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=
=3D"mailto:locutusofborg@debian.org" target=3D"_blank" rel=3D"noreferrer">l=
ocutusofborg@debian.org</a>&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 .../dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.=
18.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++=
+++++------<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletio=
ns(-)<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/dlt-daemon=
/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">dlt-daemon_2.18.10.bb</a> b/meta-oe/recipes-extended/dlt-dae=
mon/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; index 33fae0619..3811772a7 100644<br>
&gt;&gt;&gt; &gt;&gt; &gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a hre=
f=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a hre=
f=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; @@ -22,12 +22,13 @@ SRCREV =3D &quot;0f2d4cfffad=
a6f8448a2cb27995b38eb4271044f&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&=
#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog=
 systemd-journal dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp=
 dlt-console &#39;, &#39;&#39;, d)} \<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&=
#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog=
 systemd-journal &#39;, &#39;&#39;, d)} \<br>
&gt;&gt;&gt; &gt;&gt; &gt; + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt=
-adaptor-udp dlt-console \<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0udp-connection dlt-system dlt-filetr=
ansfer &quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # dlt-dbus<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # General options<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DL=
T_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DL=
T_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # Linux options<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;-DWITH_SY=
STEMD=3DON,-DWITH_SYSTEMD=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection=
] =3D &quot;-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # Command line options<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-system] =3D &quot;-DWITH=
_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT=
_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWI=
TH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-system=
d&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH=
_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd&quot=
;<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT=
_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWI=
TH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH=
_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-filetransfer] =3D &quot;=
-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT=
_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT=
_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF&quot;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 inherit autotools gettext cmake pkgconfig =
systemd<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt;&gt; &gt; 2.34.1<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br=
>
&gt;&gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent to this gro=
up.<br>
&gt;&gt;&gt; &gt;&gt; &gt; View/Reply Online (#105219): <a href=3D"https://=
lists.openembedded.org/g/openembedded-devel/message/105219" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembed=
ded-devel/message/105219</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openem=
bedded.org/mt/101634559/1997914" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/mt/101634559/1997914</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-deve=
l%2Bowner@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">open=
embedded-devel+owner@lists.openembedded.org</a><br>
&gt;&gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedd=
ed.org/g/openembedded-devel/unsub" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.=
khem@gmail.com</a>]<br>
&gt;&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br=
>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div>

--000000000000acec39060678a3ff--

