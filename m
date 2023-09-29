Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC977E71D37
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:53:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.17895.1695995598077760352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J//mdzU+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5859b2eaa67so681487a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695995597; x=1696600397; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZW4g6hLBC41TQlc0KV3xXnx7yCxRiabWI2QM2AfFYA=;
        b=J//mdzU+UdWr1Qx2lx3ZlwABOIvQ1gm/mvEFuISadMP345bwn2Irvb7efGUyziwmpF
         /v6gw1+HNMKt7hMPlKwwEZp66RWCC/POCPGEinPpWu4H6n0/2eH52a5nrZl/DrMLDJaT
         gM7NMepnT6rmzEv4zrjg5VpVLXqFWT/ObCg3bBYHTnQcZM6sdDLUAJMVxt8zov+h2mjW
         2AVRBx4Fsn2iWfDC49GsNflqr0i6SFQOA+q/tP9UpWWUBspkeOV3+gVEjgMoVoSMeTkn
         I1s6usD8O489tLzwoUeCh4KeZyDrFsa7iTiRnBma44Q091qs02V1JNrHRrWmsTYSG1Hc
         Yr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695995597; x=1696600397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZW4g6hLBC41TQlc0KV3xXnx7yCxRiabWI2QM2AfFYA=;
        b=fChTUDwtDjyYzUr+sP294jHB8pbnrXWLVdrjivZTAxEoWea6rb7IC9BMCQt7p22pne
         Tx4fUOwxCs7Epd6te+Vuws55CtjV+guJS/L4XREbXUSQemL9b4SmBXrtE45M4p5Kw2N1
         vYlGJ25aG0BO3M/8woFj4eQITl2/33doxjjK4R06r1GFRkDLbauni/gF/OVc+gsxM1S2
         BoOC0vwXk3yeb32md4O6DF2rUs5VWA1JBaUH/GxnmcapHyejucDZG6WHdfrEEdJW70xK
         V+kMj69MYpBXdplNFI7HPSvLH9DkwPFIHyhR+cwPBmFDrjzKFui0x5KSiVU6K0Twb1Nd
         voVg==
X-Gm-Message-State: AOJu0YyMPVI4KgEs7jeps8zm44cly0W9MS0gnpMTbl1RhEI+XICCXuOi
	EklJxUNRF/bmjP+Cnglpbl5CbCq7cuH+Igyh+fg=
X-Google-Smtp-Source: AGHT+IEEA2v6lTRrhjSy3mvAYtyL05ZwYexg9FACT9Dp8XslxT81m+jsIy1rX4yDopDwNl/uxuulP3XzggIDyFGNa2I=
X-Received: by 2002:a17:90a:be18:b0:268:b682:23da with SMTP id
 a24-20020a17090abe1800b00268b68223damr4120731pjs.34.1695995597210; Fri, 29
 Sep 2023 06:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
 <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
 <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
 <CAATN8PUmx4gek6TM1PX-wydDxmRKz7RZHSGMAKRVOfLAyig6-A@mail.gmail.com>
 <CA+KKcbmi9-0cAYdjP3fdRcfzJQj2uDJWeFSZV7H++RmO6e7khg@mail.gmail.com>
 <CAMKF1spR-2ypWwRhw36pgwwqoZkLnHsi6d6iUkF2H68s-QB2Cw@mail.gmail.com>
 <CAATN8PWUQgu=-KF7K_7HMVKBT69O=6f65eVGsTWe+YEcU5h_ew@mail.gmail.com> <CAMKF1spTc26bCt0+5B1T2JGuhCKcCB_+vBZEL-UMuHdGQ35fFA@mail.gmail.com>
In-Reply-To: <CAMKF1spTc26bCt0+5B1T2JGuhCKcCB_+vBZEL-UMuHdGQ35fFA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Fri, 29 Sep 2023 15:53:04 +0200
Message-ID: <CAATN8PXc1qNTe2aB1M3x=GC1UPZhuH9xY7qf4O7WY_M8vzbk7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Khem Raj <raj.khem@gmail.com>
Cc: Federico Pietro Briata <federicobriata@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Andrea Reali <andrea.reali@cnhind.com>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="0000000000001cd74f06067fbfca"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105246

--0000000000001cd74f06067fbfca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent a new patch serie. For now better keep it disabled as default until
I finish writing the code.

On Fri, Sep 29, 2023, 15:22 Khem Raj <raj.khem@gmail.com> wrote:

> thanks, do we still need the arm fix? it would be good if you resend
> the whole series as v2 and so on.
>
> On Thu, Sep 28, 2023 at 10:24=E2=80=AFPM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Hello, the additional fix is already on patchwork!
> >
> > On Fri, Sep 29, 2023, 06:44 Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> fails to build on AB
> >>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3186/st=
eps/14/logs/stdio
> >>
> >> On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata
> >> <federicobriata@gmail.com> wrote:
> >> >
> >> > thanks guys,
> >> > we'll test it and give you a feedback very soon.
> >> > best regards
> >> > Federico
> >> >
> >> >
> >> > Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> ha scritto:
> >> >>
> >> >> The functionality works already.
> >> >> The idea is to avoid many files with custom cpu code, and try to us=
e
> perf native functions to get pc/sp and so on. But I did test, coredumps a=
re
> correctly sent as well as context files.
> >> >>
> >> >> G.
> >> >>
> >> >> On Thu, Sep 28, 2023, 18:30 Khem Raj <raj.khem@gmail.com> wrote:
> >> >>>
> >> >>> On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
> >> >>> <costamagna.gianfranco@gmail.com> wrote:
> >> >>> >
> >> >>> > hello, sure looks perfect to me!
> >> >>> > btw you will also need this one to build properly on some
> architecture
> >> >>> > https://patchwork.yoctoproject.org/project/oe/list/?series=3D171=
90
> >> >>>
> >> >>> OK
> >> >>>
> >> >>> >
> >> >>> > I'm polishing up the work, testing, and will try to update
> upstream PR.
> >> >>> >
> >> >>> > But please note, this is a never-tested and highly experimental
> dlt feature nobody is using right now.
> >> >>> > (and it's a new binary, so won't affect the normal dlt usage)
> >> >>>
> >> >>> This does not generate confidence. If you want this to be
> testing-only
> >> >>> then mark the patches RFC so
> >> >>> we can understand the intentions.
> >> >>>
> >> >>> >
> >> >>> > Expect new commits soon :)
> >> >>>
> >> >>> sure
> >> >>>
> >> >>> >
> >> >>> > G.
> >> >>> >
> >> >>> > On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail=
.com>
> wrote:
> >> >>> >>
> >> >>> >> I have staged it with some modified commit msg summary please
> check
> >> >>> >> master-next and see if it looks ok.
> >> >>> >>
> >> >>> >> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
> >> >>> >> <costamagna.gianfranco@gmail.com> wrote:
> >> >>> >> >
> >> >>> >> > Make sure also without systemd enabled as default, the tools
> can be built and installed,
> >> >>> >> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp,
> dlt-examples and dlt-console.
> >> >>> >> > They have stub functionalities when systemd is not default,
> but they can still be used with
> >> >>> >> > limited functionalities
> >> >>> >> >
> >> >>> >> > Reported-By: Federico Briata <federicobriata@gmail.com>
> >> >>> >> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
> >> >>> >> > Signed-off-by: Gianfranco Costamagna <
> costamagnagianfranco@yahoo.it>
> >> >>> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.or=
g
> >
> >> >>> >> > ---
> >> >>> >> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13
> +++++++------
> >> >>> >> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >> >>> >> >
> >> >>> >> > diff --git a/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb
> >> >>> >> > index 33fae0619..3811772a7 100644
> >> >>> >> > --- a/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb
> >> >>> >> > +++ b/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb
> >> >>> >> > @@ -22,12 +22,13 @@ SRCREV =3D
> "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
> >> >>> >> >
> >> >>> >> >  S =3D "${WORKDIR}/git"
> >> >>> >> >
> >> >>> >> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples
> dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
> >> >>> >> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
> >> >>> >> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp
> dlt-console \
> >> >>> >> >   udp-connection dlt-system dlt-filetransfer "
> >> >>> >> >  # dlt-dbus
> >> >>> >> >
> >> >>> >> >  # General options
> >> >>> >> > -PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
> >> >>> >> > +PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF"
> >> >>> >> >
> >> >>> >> >  # Linux options
> >> >>> >> >  PACKAGECONFIG[systemd] =3D
> "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd=
"
> >> >>> >> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D
> "-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
> >> >>> >> >
> >> >>> >> >  # Command line options
> >> >>> >> >  PACKAGECONFIG[dlt-system] =3D
> "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3DOFF"
> >> >>> >> > -PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd"
> >> >>> >> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon=
-systemd"
> >> >>> >> > -PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-sys=
temd"
> >> >>> >> > +PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF"
> >> >>> >> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
> >> >>> >> > +PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF"
> >> >>> >> >  PACKAGECONFIG[dlt-filetransfer] =3D
> "-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF"
> >> >>> >> > -PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd"
> >> >>> >> > +PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF"
> >> >>> >> >
> >> >>> >> >  inherit autotools gettext cmake pkgconfig systemd
> >> >>> >> >
> >> >>> >> > --
> >> >>> >> > 2.34.1
> >> >>> >> >
> >> >>> >> >
> >> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>> >> > Links: You receive all messages sent to this group.
> >> >>> >> > View/Reply Online (#105219):
> https://lists.openembedded.org/g/openembedded-devel/message/105219
> >> >>> >> > Mute This Topic:
> https://lists.openembedded.org/mt/101634559/1997914
> >> >>> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> >>> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> >>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>> >> >
>

--0000000000001cd74f06067fbfca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I sent a new patch serie. For now better keep it disabled=
 as default until I finish writing the code.=C2=A0</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 29, 2023, 15:=
22 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">thanks, do we still ne=
ed the arm fix? it would be good if you resend<br>
the whole series as v2 and so on.<br>
<br>
On Thu, Sep 28, 2023 at 10:24=E2=80=AFPM Gianfranco Costamagna<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, the additional fix is already on patchwork!<br>
&gt;<br>
&gt; On Fri, Sep 29, 2023, 06:44 Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; fails to build on AB<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders=
/88/builds/3186/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/88/buil=
ds/3186/steps/14/logs/stdio</a><br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 28, 2023 at 11:57=E2=80=AFAM Federico Pietro Briata<br=
>
&gt;&gt; &lt;<a href=3D"mailto:federicobriata@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">federicobriata@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; thanks guys,<br>
&gt;&gt; &gt; we&#39;ll test it and give you a feedback very soon.<br>
&gt;&gt; &gt; best regards<br>
&gt;&gt; &gt; Federico<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Il gio 28 set 2023, 6:58 PM Gianfranco Costamagna &lt;<a href=
=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" rel=3D"norefe=
rrer">costamagna.gianfranco@gmail.com</a>&gt; ha scritto:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The functionality works already.<br>
&gt;&gt; &gt;&gt; The idea is to avoid many files with custom cpu code, and=
 try to use perf native functions to get pc/sp and so on. But I did test, c=
oredumps are correctly sent as well as context files.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; G.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Sep 28, 2023, 18:30 Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Co=
stamagna<br>
&gt;&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; hello, sure looks perfect to me!<br>
&gt;&gt; &gt;&gt;&gt; &gt; btw you will also need this one to build properl=
y on some architecture<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"https://patchwork.yoctoproject.org/pr=
oject/oe/list/?series=3D17190" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190</a><=
br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; OK<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; I&#39;m polishing up the work, testing, and will=
 try to update upstream PR.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; But please note, this is a never-tested and high=
ly experimental dlt feature nobody is using right now.<br>
&gt;&gt; &gt;&gt;&gt; &gt; (and it&#39;s a new binary, so won&#39;t affect =
the normal dlt usage)<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; This does not generate confidence. If you want this t=
o be testing-only<br>
&gt;&gt; &gt;&gt;&gt; then mark the patches RFC so<br>
&gt;&gt; &gt;&gt;&gt; we can understand the intentions.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; Expect new commits soon :)<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; sure<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; G.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"norefer=
rer">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; I have staged it with some modified commit m=
sg summary please check<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; master-next and see if it looks ok.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gian=
franco<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">costamagna.gianfranco@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Make sure also without systemd enabled =
as default, the tools can be built and installed,<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; such as dlt-adaptor, dlt-adaptor-stdin,=
 dlt-adaptor-udp, dlt-examples and dlt-console.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; They have stub functionalities when sys=
temd is not default, but they can still be used with<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; limited functionalities<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Reported-By: Federico Briata &lt;<a hre=
f=3D"mailto:federicobriata@gmail.com" target=3D"_blank" rel=3D"noreferrer">=
federicobriata@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Reported-By: Andrea Reali &lt;<a href=
=3D"mailto:andrea.reali@cnhind.com" target=3D"_blank" rel=3D"noreferrer">an=
drea.reali@cnhind.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &l=
t;<a href=3D"mailto:costamagnagianfranco@yahoo.it" target=3D"_blank" rel=3D=
"noreferrer">costamagnagianfranco@yahoo.it</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &l=
t;<a href=3D"mailto:locutusofborg@debian.org" target=3D"_blank" rel=3D"nore=
ferrer">locutusofborg@debian.org</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 .../dlt-daemon/<a href=3D"http://=
dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-=
daemon_2.18.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 +++++++------<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), =
6 deletions(-)<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/d=
lt-daemon/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a> b/meta-oe/recipes-extende=
d/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; index 33fae0619..3811772a7 100644<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; --- a/meta-oe/recipes-extended/dlt-daem=
on/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +++ b/meta-oe/recipes-extended/dlt-daem=
on/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; @@ -22,12 +22,13 @@ SRCREV =3D &quot;0f=
2d4cfffada6f8448a2cb27995b38eb4271044f&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<=
br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG ?=3D &quot;${@bb.utils.c=
ontains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd=
-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-ad=
aptor-udp dlt-console &#39;, &#39;&#39;, d)} \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG ?=3D &quot;${@bb.utils.c=
ontains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd=
-watchdog systemd-journal &#39;, &#39;&#39;, d)} \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; + dlt-examples dlt-adaptor dlt-adaptor-=
stdin dlt-adaptor-udp dlt-console \<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0udp-connection dlt-system d=
lt-filetransfer &quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # dlt-dbus<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # General options<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-examples] =3D &quot;=
-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd&quot=
;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-examples] =3D &quot;=
-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # Linux options<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;=
-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd&qu=
ot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-c=
onnection] =3D &quot;-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D<br=
>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 # Command line options<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-system] =3D &qu=
ot;-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor] =3D &quot;-=
DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd&quot;<b=
r>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-stdin] =3D &=
quot;-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daem=
on-systemd&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-udp] =3D &qu=
ot;-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-sys=
temd&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor] =3D &quot;-=
DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-stdin] =3D &=
quot;-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-udp] =3D &qu=
ot;-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-filetransfer] =
=3D &quot;-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF&quot;<=
br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -PACKAGECONFIG[dlt-console] =3D &quot;-=
DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd&quot;<b=
r>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; +PACKAGECONFIG[dlt-console] =3D &quot;-=
DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 inherit autotools gettext cmake p=
kgconfig systemd<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; 2.34.1<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent to=
 this group.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; View/Reply Online (#105219): <a href=3D=
"https://lists.openembedded.org/g/openembedded-devel/message/105219" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-devel/message/105219</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lis=
ts.openembedded.org/mt/101634559/1997914" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://lists.openembedded.org/mt/101634559/1997914</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembe=
dded-devel%2Bowner@lists.openembedded.org" target=3D"_blank" rel=3D"norefer=
rer">openembedded-devel+owner@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.o=
penembedded.org/g/openembedded-devel/unsub" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/unsub<=
/a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"norefer=
rer">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div>

--0000000000001cd74f06067fbfca--

