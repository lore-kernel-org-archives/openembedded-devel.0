Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9C0C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 03:21:55 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.24105.1658719308086459422
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=asGVLt52;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id q16so9201669pgq.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 20:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hzsshDmeykg9/SXMT0Q5KkKwOcUVQMoq/p2Y2f0c+n4=;
        b=asGVLt52GNxG/zejpynw4vLelDcwJcDeHgwqgk7ViUHIHhp3L8n/6ii3lqAzK5j7pW
         D/QVK5axiBtttbNYgZ6HaVyQiaPGE8vk2sLmJ5t6tLeg9gWP3St2zNDcPH8RVUEgcnrb
         qhDzLlMi9s/Ns0S0Tb9HNQtKBCyVN5Q580uX4pMt/sbPrQk1ggyTWkCDalB/3NG81Wro
         6m/DVBf3nl2zVAJgi1LD39bg5UssYPoaq4WsATVJFy4XqhLMj8iI7e0Rh9j82EQOua+/
         JbGsq3X5h9ncLyxawbE4tii+n9aXNnCKEK+XIKYrc++jGSEism07EvAyVfngmwujmPyP
         Gf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hzsshDmeykg9/SXMT0Q5KkKwOcUVQMoq/p2Y2f0c+n4=;
        b=PW1xyStfN12WCBa2aqYv/QOi8Wid56+sPbQEa/ubSfcTAIUoEVYX08I+MhF8gOlyek
         ipcsFcXc50U3bJO29Ai30I7h49WuFJM3Ius858Kt1psF4Lk8n++Ro8wB51sbL5AOQdZR
         u0CBB2EM9CuDepYx16IMe9E97KA2g4arz3jZ/th3aiR6h4HZ8AwL4mpjY8S9/6AIvi0k
         29yG4OQk7mXEST3cX+DXxQGlte3ZcHFrhOp9dQUrJunK3vmFC8yMDedhgMeJUOc2lgve
         9KIivJh6EuQFz3MGulIagRNIrAlkijp3HMo0YxEGFF0L6qZOY4K10dRulJ3zP0mt0JPS
         W64Q==
X-Gm-Message-State: AJIora8g9zSKaOHAkotIh4ONaenzKXb9ykbkt6hLM8Y2lBG2ZbEyzvSj
	NgQlox2TirKHzPY7odjBD3cmRdsXHywghh5k764=
X-Google-Smtp-Source: 
 AGRyM1tkf1987KD3t1jtZs/39ETJ8O72Roonng6l9Y+IqYU9S8xn3wglXlpjpdlkdJ5N3QTXG1Wzvju4GhoS9v2Q+FY=
X-Received: by 2002:a63:224d:0:b0:41a:e146:a8dc with SMTP id
 t13-20020a63224d000000b0041ae146a8dcmr5497366pgm.272.1658719307300; Sun, 24
 Jul 2022 20:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
 <CABF_=yh7frbvHSe=+EokH+AuU5p7GRSN4+Kb_-qn__1HqyFu_Q@mail.gmail.com>
 <CAMKF1soLr20bKVyC4008rtTSRAK+ehjTADwhMdMRpY7NkJxAmg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soLr20bKVyC4008rtTSRAK+ehjTADwhMdMRpY7NkJxAmg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 24 Jul 2022 20:21:36 -0700
Message-ID: 
 <CANx9H-DOmascgaTnU=983dVXdixSjEQmDJNro1Zq+KbQBtK-bg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] Add runtime dependencies for
 python3-supervisor
To: Khem Raj <raj.khem@gmail.com>
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
 =?UTF-8?Q?Martin_Gro=C3=9Fhauser?= <mgrosshauser@gmx.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018081b05e498afc1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 03:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97967

--00000000000018081b05e498afc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 7:01 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jul 24, 2022 at 3:31 PM Jan Vermaete <jan.vermaete@gmail.com>
> wrote:
> >
> > Hi,
> >
> > Could it be it should be '${PYTHON_PN}-setuptools-native' iso
> '${PYTHON_PN}-setuptools' ?
>
> rdep on a native package wont be a good thing.
> >
> > Br
> >
> > On Fri, Jul 22, 2022 at 9:39 PM Martin Gro=C3=9Fhauser <mgrosshauser@gm=
x.net>
> wrote:
> >>
> >> Running supervisord without these fails with import errors. smtpd migh=
t
> look strange, but provides required asynchat.py.
> >> ---
> >>   .../recipes-devtools/python/python3-supervisor_4.2.4.bb      | 5
> +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-supervisor_4.2.4.bb b/meta-python/recipes-devtools/python/
> python3-supervisor_4.2.4.bb
> >> index fdd8a76cf..7da29e39b 100644
> >> --- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
> >> @@ -13,6 +13,11 @@ PYPI_PACKAGE =3D "supervisor"
> >>   inherit pypi systemd setuptools3
> >>   RDEPENDS:${PN} =3D "\
> >>       ${PYTHON_PN}-meld3 \
> >> +    ${PYTHON_PN}-io \
> >> +    ${PYTHON_PN}-xmlrpc \
> >> +    ${PYTHON_PN}-resource \
> >> +    ${PYTHON_PN}-setuptools \
> >> +    ${PYTHON_PN}-smtpd \
> >>   "


FWIW, we don=E2=80=99t need to carry the ${PYTHON_PN} if the version no lon=
ger
supports python 2.

>
> >>
> >>   SRC_URI +=3D "file://supervisord.conf \
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97966):
> https://lists.openembedded.org/g/openembedded-devel/message/97966
> Mute This Topic: https://lists.openembedded.org/mt/92555239/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000018081b05e498afc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 24, 2022 at 7:01 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Sun, Jul 24, 2022 at 3:31 PM Jan Vermaete &lt;<a =
href=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank">jan.vermaete@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Could it be it should be &#39;${PYTHON_PN}-setuptools-native&#39; iso=
=C2=A0 &#39;${PYTHON_PN}-setuptools&#39; ?<br>
<br>
rdep on a native package wont be a good thing.<br>
&gt;<br>
&gt; Br<br>
&gt;<br>
&gt; On Fri, Jul 22, 2022 at 9:39 PM Martin Gro=C3=9Fhauser &lt;<a href=3D"=
mailto:mgrosshauser@gmx.net" target=3D"_blank">mgrosshauser@gmx.net</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; Running supervisord without these fails with import errors. smtpd =
might look strange, but provides required asynchat.py.<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-=
supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-superviso=
r_4.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
supervisor_4.2.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-supervisor_4.2.4.bb</a><br>
&gt;&gt; index fdd8a76cf..7da29e39b 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-supervi=
sor_4.2.4.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-supervisor_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-supervi=
sor_4.2.4.bb</a><br>
&gt;&gt; @@ -13,6 +13,11 @@ PYPI_PACKAGE =3D &quot;supervisor&quot;<br>
&gt;&gt;=C2=A0 =C2=A0inherit pypi systemd setuptools3<br>
&gt;&gt;=C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-meld3 \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-io \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-xmlrpc \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-resource \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \<br>
&gt;&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-smtpd \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">FWIW, we don=E2=80=99t need to carry the ${PYTHON_PN} if the ver=
sion no longer supports python 2.</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI +=3D &quot;file://supervisord.conf \<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97966): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97966" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97966</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92555239/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
92555239/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000018081b05e498afc1--

