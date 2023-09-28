Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6256AE732F5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 16:58:49 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.18674.1695920325901487037
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 09:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4jNbgrf;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso11585707b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695920325; x=1696525125; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0F17Qgohn0+JtWGNpA/hpa5Co7QB1jwjxhiTbh0894I=;
        b=P4jNbgrffDxi7q8EcWoV6sWSxddUSq3kszd/EJ1Rrtqn3ID3VmOTW81fZDJ4scGdG6
         CSXLAFVqIfmnhNNN0Ukt6xtA+zy1i1MdlBG2aG3edm/4gghkfP7WBIew+iph2ZXbTJtU
         hgDl7qCk2AKtIVrh5aqpaSKTxigA+hwH3WZeEc248G5ui1GwIbGYaxdWsP3msI2sqtVj
         31eIhm4Zuncv8pPsZVrMFC9sBdPuSgfQ0aZJpxNp9KEr+POZTXc5BNoROfaXTnGzP6eA
         HgJ+RSy3dK1O5Mkdh7iyDtNDmbezLMwG3IXYor7ngildqVxwbWiW22R0M0y4tqzW9s9M
         6qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695920325; x=1696525125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F17Qgohn0+JtWGNpA/hpa5Co7QB1jwjxhiTbh0894I=;
        b=t7i5g9fVETGg+Q6T9qqAeQ7/mkQUcjCp+qTLfyaecdkmv7yDuLq+Rf4wBC9bXOvM0N
         b+X2cgoXCT6lnJmbelRBGdrtm8AZnXO+OIsuZHRjM8IezwwDWPT+ovqrRXfBuUnwWmds
         1ZoVHw7AOz8ZHRIblJI0NP8AtdTWRUThz7W0ydIFp0EvDZ+i6LRCc4uxWzqMEu82l05U
         mpEwAPIrGlPTaWAOmAmjWzNzFs0AD48T18WLTJ/Gm0qDyGT/AA3KKgP7VHNEKx+9k48T
         j0A8bf7a0rGO7uziiWx+F/WdU+8Jm4TieViRPt6DFmX2EJ0gtxIt3mOQGRsjcFG8Y2nN
         XH0A==
X-Gm-Message-State: AOJu0YyRvI8PFmabFv+Jm4AZ7BjjyZDZ/klUtHvoA2fEln36RHCEzlu5
	OlCuain3+Nd7wMpswJ5bZqxIB1CULmPrbOtDEM0=
X-Google-Smtp-Source: AGHT+IF4zoeq9/iRwG4avR96J/RsdUqNnWWHkHj/xyJywgxGjKti3s6eNj6l3Y41SYpB2UvhrvhtLzQfklwDCNd2U0U=
X-Received: by 2002:a05:6a20:6a0b:b0:154:fb34:5f09 with SMTP id
 p11-20020a056a206a0b00b00154fb345f09mr2103047pzk.15.1695920325185; Thu, 28
 Sep 2023 09:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
 <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com> <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
In-Reply-To: <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 28 Sep 2023 18:58:31 +0200
Message-ID: <CAATN8PUmx4gek6TM1PX-wydDxmRKz7RZHSGMAKRVOfLAyig6-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Federico Briata <federicobriata@gmail.com>, 
	Andrea Reali <andrea.reali@cnhind.com>, Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="0000000000008cd7e506066e3851"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 16:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105229

--0000000000008cd7e506066e3851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The functionality works already.
The idea is to avoid many files with custom cpu code, and try to use perf
native functions to get pc/sp and so on. But I did test, coredumps are
correctly sent as well as context files.

G.

On Thu, Sep 28, 2023, 18:30 Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > hello, sure looks perfect to me!
> > btw you will also need this one to build properly on some architecture
> > https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190
>
> OK
>
> >
> > I'm polishing up the work, testing, and will try to update upstream PR.
> >
> > But please note, this is a never-tested and highly experimental dlt
> feature nobody is using right now.
> > (and it's a new binary, so won't affect the normal dlt usage)
>
> This does not generate confidence. If you want this to be testing-only
> then mark the patches RFC so
> we can understand the intentions.
>
> >
> > Expect new commits soon :)
>
> sure
>
> >
> > G.
> >
> > On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> I have staged it with some modified commit msg summary please check
> >> master-next and see if it looks ok.
> >>
> >> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
> >> <costamagna.gianfranco@gmail.com> wrote:
> >> >
> >> > Make sure also without systemd enabled as default, the tools can be
> built and installed,
> >> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-example=
s
> and dlt-console.
> >> > They have stub functionalities when systemd is not default, but they
> can still be used with
> >> > limited functionalities
> >> >
> >> > Reported-By: Federico Briata <federicobriata@gmail.com>
> >> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
> >> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> >> > ---
> >> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13
> +++++++------
> >> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.10.bb
> >> > index 33fae0619..3811772a7 100644
> >> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> >> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> >> > @@ -22,12 +22,13 @@ SRCREV =3D
> "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
> >> >
> >> >  S =3D "${WORKDIR}/git"
> >> >
> >> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'system=
d',
> ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor
> dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
> >> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'system=
d',
> ' systemd systemd-watchdog systemd-journal ', '', d)} \
> >> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp
> dlt-console \
> >> >   udp-connection dlt-system dlt-filetransfer "
> >> >  # dlt-dbus
> >> >
> >> >  # General options
> >> > -PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
> >> > +PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF"
> >> >
> >> >  # Linux options
> >> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOF=
F
> -DWITH_DLT_SYSTEM=3DOFF,systemd"
> >> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D
> "-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
> >> >
> >> >  # Command line options
> >> >  PACKAGECONFIG[dlt-system] =3D
> "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3DOFF"
> >> > -PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd"
> >> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon=
-systemd"
> >> > -PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-sys=
temd"
> >> > +PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF"
> >> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
> >> > +PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF"
> >> >  PACKAGECONFIG[dlt-filetransfer] =3D
> "-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF"
> >> > -PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd"
> >> > +PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF"
> >> >
> >> >  inherit autotools gettext cmake pkgconfig systemd
> >> >
> >> > --
> >> > 2.34.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#105219):
> https://lists.openembedded.org/g/openembedded-devel/message/105219
> >> > Mute This Topic: https://lists.openembedded.org/mt/101634559/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--0000000000008cd7e506066e3851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The functionality works already.<div dir=3D"auto">The ide=
a is to avoid many files with custom cpu code, and try to use perf native f=
unctions to get pc/sp and so on. But I did test, coredumps are correctly se=
nt as well as context files.=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">G.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Sep 28, 2023, 18:30 Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianf=
ranco Costamagna<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; hello, sure looks perfect to me!<br>
&gt; btw you will also need this one to build properly on some architecture=
<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe/list/?series=
=3D17190" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork=
.yoctoproject.org/project/oe/list/?series=3D17190</a><br>
<br>
OK<br>
<br>
&gt;<br>
&gt; I&#39;m polishing up the work, testing, and will try to update upstrea=
m PR.<br>
&gt;<br>
&gt; But please note, this is a never-tested and highly experimental dlt fe=
ature nobody is using right now.<br>
&gt; (and it&#39;s a new binary, so won&#39;t affect the normal dlt usage)<=
br>
<br>
This does not generate confidence. If you want this to be testing-only<br>
then mark the patches RFC so<br>
we can understand the intentions.<br>
<br>
&gt;<br>
&gt; Expect new commits soon :)<br>
<br>
sure<br>
<br>
&gt;<br>
&gt; G.<br>
&gt;<br>
&gt; On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I have staged it with some modified commit msg summary please chec=
k<br>
&gt;&gt; master-next and see if it looks ok.<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco<br>
&gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Make sure also without systemd enabled as default, the tools =
can be built and installed,<br>
&gt;&gt; &gt; such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-=
examples and dlt-console.<br>
&gt;&gt; &gt; They have stub functionalities when systemd is not default, b=
ut they can still be used with<br>
&gt;&gt; &gt; limited functionalities<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Reported-By: Federico Briata &lt;<a href=3D"mailto:federicobr=
iata@gmail.com" target=3D"_blank" rel=3D"noreferrer">federicobriata@gmail.c=
om</a>&gt;<br>
&gt;&gt; &gt; Reported-By: Andrea Reali &lt;<a href=3D"mailto:andrea.reali@=
cnhind.com" target=3D"_blank" rel=3D"noreferrer">andrea.reali@cnhind.com</a=
>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:co=
stamagnagianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagn=
agianfranco@yahoo.it</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:lo=
cutusofborg@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@=
debian.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../dlt-daemon/<a href=3D"http://dlt-daemon_2.18.10.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++------<=
br>
&gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"h=
ttp://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">dlt-daemon_2.18.10.bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=
=3D"http://dlt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">dlt-daemon_2.18.10.bb</a><br>
&gt;&gt; &gt; index 33fae0619..3811772a7 100644<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://d=
lt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-d=
aemon_2.18.10.bb</a><br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://d=
lt-daemon_2.18.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-d=
aemon_2.18.10.bb</a><br>
&gt;&gt; &gt; @@ -22,12 +22,13 @@ SRCREV =3D &quot;0f2d4cfffada6f8448a2cb27=
995b38eb4271044f&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-jour=
nal dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console =
&#39;, &#39;&#39;, d)} \<br>
&gt;&gt; &gt; +PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-jour=
nal &#39;, &#39;&#39;, d)} \<br>
&gt;&gt; &gt; + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp =
dlt-console \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0udp-connection dlt-system dlt-filetransfer &quot;=
<br>
&gt;&gt; &gt;=C2=A0 # dlt-dbus<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 # General options<br>
&gt;&gt; &gt; -PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DLT_EXAMPLES=3D=
ON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DLT_EXAMPLES=3D=
ON,-DWITH_DLT_EXAMPLES=3DOFF&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 # Linux options<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;-DWITH_SYSTEMD=3DON,-D=
WITH_SYSTEMD=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd&quot;<br>
&gt;&gt; &gt; @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D &quot;-=
DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 # Command line options<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-system] =3D &quot;-DWITH_DLT_SYSTEM=
=3DON,-DWITH_DLT_SYSTEM=3DOFF&quot;<br>
&gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT_ADAPTOR=3DON=
,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWITH_DLT_ADAPTO=
R_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt; &gt; -PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH_DLT_ADAPTOR_=
UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT_ADAPTOR=3DON=
,-DWITH_DLT_ADAPTOR=3DOFF&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWITH_DLT_ADAPTO=
R_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH_DLT_ADAPTOR_=
UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF&quot;<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[dlt-filetransfer] =3D &quot;-DWITH_DLT_FI=
LETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF&quot;<br>
&gt;&gt; &gt; -PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT_CONSOLE=3DON=
,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT_CONSOLE=3DON=
,-DWITH_DLT_CONSOLE=3DOFF&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 inherit autotools gettext cmake pkgconfig systemd<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.34.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#105219): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/message/105219" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/mes=
sage/105219</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/101634559/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/mt/101634559/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-deve=
l+owner@lists.openembedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.co=
m</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000008cd7e506066e3851--

