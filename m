Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D929E732E7
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:35:28 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.16426.1695915324649803300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igEEdlqv;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-573c62b3cd2so8292076a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695915324; x=1696520124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3t51TxexFOSM5U2J7t0qraIfk8Bfv33DewCfiQQoGY=;
        b=igEEdlqv+sfFveOBIQO+aCu5XXi2bM/zA5vRpNlG8ujjbltY82JkeoKtgN78ZgneTv
         abeU3K3cp/efTmr2iZslUSMFTscpjoVS1cGBk4g5VQxBmgJWLkGJUKX+MvVo1lArU03T
         t/Y43pB8y/rGqLh8RC1q4xORk+Y5DoJu6u8aCZKxCU0fKPLbUhgImLLvtET+o3kPtTPB
         98nnq+WQegBP2eFXcBj2M3qLD4xqor9sbBWJOLQZWdjiQ8vUJ7sGvnWxfzooVRRUw5rE
         GaOx8OkiUp2eFp9zXN1hHIMtM+6wjuOe5+KShK5ohjjNYqKSP1KGmEoEoddn/xIs3VcR
         KOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695915324; x=1696520124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3t51TxexFOSM5U2J7t0qraIfk8Bfv33DewCfiQQoGY=;
        b=if3aHrrtw2X+sq2OIKuLa/TMtCX0WK6zcNA52AHQ4UqLpnZfKHD6BaGUtmCoX9poUd
         sxLqzUIBlodPT0AV980cHmWfTnfNlrGSSOFBIeJyH6ve5SUolPMkxwmotvUY5IWIp5mX
         uRF5+bdZmNDNGk/L6VFTzk266RsK14vc0VNqrdMVXLV6ZYF1/+83zQRWQHhrmeG48NiN
         qaERqodPDOtxx3WvkoX/TvCqvLRPkurpm7asLp6a0+fAqaurrheRQjLUOnyl6VSMD/0U
         eb7lKjfCsAaxOfktJuGAk3OyEMfVF73OWJS4iCC3+oYwctZRfY8t59t1dVCAqHrkMoIW
         WCqQ==
X-Gm-Message-State: AOJu0YwKYb9enZeCLNj7mXUVZmlVRPb0hvcW9QJdharzmqrHpCriflx7
	XSq9BiOjcRuSeRGnrWNY+71DrCJc53Wiznn3lh3SDm0XgjvYWQ==
X-Google-Smtp-Source: AGHT+IGlABw/kL3M03KrKj0vkwBtVRBYy0IUt9XlL/GNVw0Js71NLI5b8nau04BNgXuaE9fSStV41KinrB4fIPi/G88=
X-Received: by 2002:a17:90a:ce06:b0:268:557e:1848 with SMTP id
 f6-20020a17090ace0600b00268557e1848mr1465901pju.2.1695915323902; Thu, 28 Sep
 2023 08:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it> <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
In-Reply-To: <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 28 Sep 2023 17:35:12 +0200
Message-ID: <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Federico Briata <federicobriata@gmail.com>, 
	Andrea Reali <andrea.reali@cnhind.com>, Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="00000000000073510006066d0e32"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 15:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105227

--00000000000073510006066d0e32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, sure looks perfect to me!
btw you will also need this one to build properly on some architecture
https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190

I'm polishing up the work, testing, and will try to update upstream PR.

But please note, this is a never-tested and highly experimental dlt feature
nobody is using right now.
(and it's a new binary, so won't affect the normal dlt usage)

Expect new commits soon :)

G.

On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> I have staged it with some modified commit msg summary please check
> master-next and see if it looks ok.
>
> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Make sure also without systemd enabled as default, the tools can be
> built and installed,
> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples
> and dlt-console.
> > They have stub functionalities when systemd is not default, but they ca=
n
> still be used with
> > limited functionalities
> >
> > Reported-By: Federico Briata <federicobriata@gmail.com>
> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> > index 33fae0619..3811772a7 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> > @@ -22,12 +22,13 @@ SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044=
f"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
 '
> systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor
> dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
 '
> systemd systemd-watchdog systemd-journal ', '', d)} \
> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-consol=
e
> \
> >   udp-connection dlt-system dlt-filetransfer "
> >  # dlt-dbus
> >
> >  # General options
> > -PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd"
> > +PACKAGECONFIG[dlt-examples] =3D
> "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXAMPLES=3DOFF"
> >
> >  # Linux options
> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF
> -DWITH_DLT_SYSTEM=3DOFF,systemd"
> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D
> "-DWITH_UDP_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D
> >
> >  # Command line options
> >  PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTE=
M=3DOFF"
> > -PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF,,dlt-daemon-systemd"
> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon=
-systemd"
> > -PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-sys=
temd"
> > +PACKAGECONFIG[dlt-adaptor] =3D
> "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=3DOFF"
> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D
> "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF"
> > +PACKAGECONFIG[dlt-adaptor-udp] =3D
> "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT_ADAPTOR_UDP=3DOFF"
> >  PACKAGECONFIG[dlt-filetransfer] =3D
> "-DWITH_DLT_FILETRANSFER=3DON,-DWITH_DLT_FILETRANSFER=3DOFF"
> > -PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-daemon-systemd"
> > +PACKAGECONFIG[dlt-console] =3D
> "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF"
> >
> >  inherit autotools gettext cmake pkgconfig systemd
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105219):
> https://lists.openembedded.org/g/openembedded-devel/message/105219
> > Mute This Topic: https://lists.openembedded.org/mt/101634559/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000073510006066d0e32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hello, sure looks perfect to me!</div><div>btw you wi=
ll also need this one to build properly on some architecture</div><div><a h=
ref=3D"https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190">=
https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190</a></div=
><div><br></div><div>I&#39;m polishing up the work, testing, and will try t=
o update upstream PR.</div><div><br></div><div>But please note, this is a n=
ever-tested and highly experimental dlt feature nobody is using right now.<=
/div><div>(and it&#39;s a new binary, so won&#39;t affect the normal dlt us=
age)</div><div><br></div><div>Expect new commits soon :)</div><div><br></di=
v><div>G.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">I have staged it with =
some modified commit msg summary please check<br>
master-next and see if it looks ok.<br>
<br>
On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">co=
stamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Make sure also without systemd enabled as default, the tools can be bu=
ilt and installed,<br>
&gt; such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples =
and dlt-console.<br>
&gt; They have stub functionalities when systemd is not default, but they c=
an still be used with<br>
&gt; limited functionalities<br>
&gt;<br>
&gt; Reported-By: Federico Briata &lt;<a href=3D"mailto:federicobriata@gmai=
l.com" target=3D"_blank">federicobriata@gmail.com</a>&gt;<br>
&gt; Reported-By: Andrea Reali &lt;<a href=3D"mailto:andrea.reali@cnhind.co=
m" target=3D"_blank">andrea.reali@cnhind.com</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnag=
ianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt;=
<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofbo=
rg@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../dlt-daemon/<a href=3D"http://dlt-daemon_2.18.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++------<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt=
-daemon_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10=
.bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_=
2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a><=
br>
&gt; index 33fae0619..3811772a7 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon=
_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a>=
<br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon=
_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a>=
<br>
&gt; @@ -22,12 +22,13 @@ SRCREV =3D &quot;0f2d4cfffada6f8448a2cb27995b38eb4=
271044f&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-journal dlt-e=
xamples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console &#39;, &#=
39;&#39;, d)} \<br>
&gt; +PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-journal &#39;=
, &#39;&#39;, d)} \<br>
&gt; + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-conso=
le \<br>
&gt;=C2=A0 =C2=A0udp-connection dlt-system dlt-filetransfer &quot;<br>
&gt;=C2=A0 # dlt-dbus<br>
&gt;<br>
&gt;=C2=A0 # General options<br>
&gt; -PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DLT_EXAMPLES=3DON,-DWITH=
_DLT_EXAMPLES=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt; +PACKAGECONFIG[dlt-examples] =3D &quot;-DWITH_DLT_EXAMPLES=3DON,-DWITH=
_DLT_EXAMPLES=3DOFF&quot;<br>
&gt;<br>
&gt;=C2=A0 # Linux options<br>
&gt;=C2=A0 PACKAGECONFIG[systemd] =3D &quot;-DWITH_SYSTEMD=3DON,-DWITH_SYST=
EMD=3DOFF -DWITH_DLT_SYSTEM=3DOFF,systemd&quot;<br>
&gt; @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D &quot;-DWITH_UDP=
_CONNECTION=3DON,-DWITH_UDP_CONNECTION=3D<br>
&gt;<br>
&gt;=C2=A0 # Command line options<br>
&gt;=C2=A0 PACKAGECONFIG[dlt-system] =3D &quot;-DWITH_DLT_SYSTEM=3DON,-DWIT=
H_DLT_SYSTEM=3DOFF&quot;<br>
&gt; -PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT_ADAPTOR=3DON,-DWITH_D=
LT_ADAPTOR=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt; -PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWITH_DLT_ADAPTOR_STDIN=
=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt; -PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH_DLT_ADAPTOR_UDP=3DON,=
-DWITH_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt; +PACKAGECONFIG[dlt-adaptor] =3D &quot;-DWITH_DLT_ADAPTOR=3DON,-DWITH_D=
LT_ADAPTOR=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[dlt-adaptor-stdin] =3D &quot;-DWITH_DLT_ADAPTOR_STDIN=
=3DON,-DWITH_DLT_ADAPTOR_STDIN=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[dlt-adaptor-udp] =3D &quot;-DWITH_DLT_ADAPTOR_UDP=3DON,=
-DWITH_DLT_ADAPTOR_UDP=3DOFF&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[dlt-filetransfer] =3D &quot;-DWITH_DLT_FILETRANSFE=
R=3DON,-DWITH_DLT_FILETRANSFER=3DOFF&quot;<br>
&gt; -PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT_CONSOLE=3DON,-DWITH_D=
LT_CONSOLE=3DOFF,,dlt-daemon-systemd&quot;<br>
&gt; +PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT_CONSOLE=3DON,-DWITH_D=
LT_CONSOLE=3DOFF&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools gettext cmake pkgconfig systemd<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105219): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105219" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105219</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10163455=
9/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101634559/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000073510006066d0e32--

