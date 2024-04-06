Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2347EC67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 18:06:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.40655.1712426783868815502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 11:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAn39h+M;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a226f8e44aso2153333a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712426783; x=1713031583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iLQuC9q+11/HpyNKKIBfCEn3fFQwW/ZtMLOHu6q0wkY=;
        b=ZAn39h+MKHMmpd8C56YxISs9hDIav1joMR+N9LBEwqZ9uv9dslWviK+KwWc9VX2fKX
         dGehiWGHcjeNvUpP51PWKOvGbYCrv2BCo/b0KrBfeYbK+mG1lzAdCm/Tgdez4xT4th15
         yp+Iev7ZOB8LuXu7iGNYk6S7+/Uk3X6TEq8wgNQj6Rr4RdDPtj3Xm0Z/Yw38eMoigv26
         DKGtrhCWp+WSka6GhmvVbNLQllRcdEWrV6TN8CkZdHvAop9Yw4HcXj40N/XZvR1gL/Zs
         ID6EOe0GGzSRlc7EJe1Orcue/31AY0OMdbGb+uCyWs2pNAMIzbDRqORipwFZzxYUhBos
         Y8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712426783; x=1713031583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLQuC9q+11/HpyNKKIBfCEn3fFQwW/ZtMLOHu6q0wkY=;
        b=kMfWDQpDh31e7DW5ERQHvL5fMCSeW5Ip/vGnKrhUWg0Z4Cvj0kdS++fvawEeKVBtaY
         7/9Tnd2omp4l1aHwAilACejbjKUHoW4lmnPU6uDe8BcoKb90QjS3iT/2CL8oU+zFKFWN
         swvVrkXvXVEkATNO7h5i98WrK3SqKmfdCaquavWPuGEaUzio0lAqg0wyDMKkDH8OCE33
         V64lf1wbWpoVQJuZYy4EeR53NdGxz9p7JwtKkIGBVt8ly9E3nRFlQxWytFF7v++0MzUx
         LquttabUcarcfCLottyPbiEZgCs/05a7Y1Uv7uhrk3vu5Pcg1O4u9d/P9s6CLwbxalJd
         D9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV4VQbkARdAvonrAX4EgATWXuWZpDOelKtkMBFX4mwDXdeLBgoLyxjpOFdg4zbcRsVT71R76ExAr9p+3+vyoP+A+CFIvqeddPHAnGIsb90+R7xVIKreWNdZw==
X-Gm-Message-State: AOJu0YxUZH7C7iCgpCp8H5Ukfn4NnV8HNm7tkpQny0bSLtlI6y+eCmGd
	fKZ+/iyHWO3NFtZuIGlCD0pxGRV7+mofDI1deIJN5v1I1kg1v19HSghu4yxM6s+N3YcismtlgJi
	f2hH83BARZOOJzUWEJHbuSjZ61XQ=
X-Google-Smtp-Source: AGHT+IFK5+AYl8ef7PoCG83pyjsTJVZ/07c48L9I4KgfiaPjFs1JD7XVE6OUeLGVkahMvL/rhnZMGO+0Ju/r+9vTx6I=
X-Received: by 2002:a17:90a:a38a:b0:2a2:7693:399e with SMTP id
 x10-20020a17090aa38a00b002a27693399emr3829821pjp.4.1712426782788; Sat, 06 Apr
 2024 11:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240405215254.1338168-1-alperyasinak1@gmail.com>
 <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com>
 <CAGpma=61Z11fO0w_m9dL_+cZeJq4xU3z4X2pgr1b+V=tvwAAaA@mail.gmail.com>
 <CANx9H-Cz8DH3DkKPJh5toZAxKJ9+vmaMYA0Z+Ge+zG++PiV0Vg@mail.gmail.com> <CAMKF1sqxK0y1NT-WAvLbUty5DTc42XXqd3+wmL3vmbp5PucXaw@mail.gmail.com>
In-Reply-To: <CAMKF1sqxK0y1NT-WAvLbUty5DTc42XXqd3+wmL3vmbp5PucXaw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 6 Apr 2024 21:06:11 +0300
Message-ID: <CAGpma=7Gdwnw=AjMT9kmhyj4fU_Q44Qotgi5ji0=X5m726A04Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: enable ptest and add
 missing runtime dependency
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017942a0615716e9b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 18:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109836

--00000000000017942a0615716e9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hmm ok. So is this SRCREV corresponding to same release ? if so we are
> ok, otherwise perhaps adding +git to SRCREV would
> be appropriate

Yes, it's the same release.


Khem Raj <raj.khem@gmail.com>, 6 Nis 2024 Cmt, 20:48 tarihinde =C5=9Funu ya=
zd=C4=B1:

> On Sat, Apr 6, 2024 at 7:13=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> >
> >
> > On Fri, Apr 5, 2024 at 10:34=E2=80=AFPM Alper Ak <alperyasinak1@gmail.c=
om>
> wrote:
> >>
> >> Sorry, I overlooked it. The tests directory was not present in the
> package downloaded with the default PYPI_SRC_URI value.
> >
> >
> > Unfortunately, many pypi.org tarballs exclude tests. So switching to
> git fetcher will make sense in those cases.
>
> Hmm ok. So is this SRCREV corresponding to same release ? if so we are
> ok, otherwise perhaps adding +git to SRCREV would
> be appropriate
>
> > Given the =E2=80=9Cxz backdoor=E2=80=9D incident, we might decide to pr=
efer git.
>
> Nah, that would not mitigate it
>
> >>
> >>
> >> Khem Raj <raj.khem@gmail.com>, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Fu=
nu
> yazd=C4=B1:
> >>>
> >>> On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak <alperyasinak1@gmail.=
com>
> wrote:
> >>> >
> >>> > * Ptest tested on qemux86-64 and qemuarm64
> >>> >
> >>> > * Add ptest into PTESTS_FAST_META_PYTHON
> >>> >
> >>> > qemux86-64:
> >>> >
> >>> > Testsuite summary
> >>> > TOTAL: 14
> >>> > PASS: 14
> >>> > SKIP: 0
> >>> > XFAIL: 0
> >>> > FAIL: 0
> >>> > XPASS: 0
> >>> > ERROR: 0
> >>> > DURATION: 9
> >>> > END: /usr/lib/python3-bleak/ptest
> >>> > 2024-04-05T18:44
> >>> > STOP: ptest-runner
> >>> > TOTAL: 1 FAIL: 0
> >>> >
> >>> > qemuarm64:
> >>> >
> >>> > Testsuite summary
> >>> > TOTAL: 14
> >>> > PASS: 14
> >>> > SKIP: 0
> >>> > XFAIL: 0
> >>> > FAIL: 0
> >>> > XPASS: 0
> >>> > ERROR: 0
> >>> > DURATION: 8
> >>> > END: /usr/lib/python3-bleak/ptest
> >>> > 2024-04-05T21:15
> >>> > STOP: ptest-runner
> >>> > TOTAL: 1 FAIL: 0
> >>> >
> >>> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> >>> > ---
> >>> >  .../ptest-packagelists-meta-python.inc        |  1 +
> >>> >  .../python/python3-bleak/run-ptest            |  3 ++
> >>> >  .../python/python3-bleak_0.21.1.bb            | 29
> +++++++++++++++----
> >>> >  3 files changed, 27 insertions(+), 6 deletions(-)
> >>> >  create mode 100644
> meta-python/recipes-devtools/python/python3-bleak/run-ptest
> >>> >
> >>> > diff --git
> a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >>> > index 2f7babe48..63f312b45 100644
> >>> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >>> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >>> > @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D "\
> >>> >      python3-ansicolors \
> >>> >      python3-asgiref \
> >>> >      python3-aspectlib \
> >>> > +    python3-bleak \
> >>> >      python3-blinker \
> >>> >      python3-cachetools \
> >>> >      python3-cbor2 \
> >>> > diff --git
> a/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> >>> > new file mode 100644
> >>> > index 000000000..8d2017d39
> >>> > --- /dev/null
> >>> > +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> >>> > @@ -0,0 +1,3 @@
> >>> > +#!/bin/sh
> >>> > +
> >>> > +pytest --automake
> >>> > diff --git a/meta-python/recipes-devtools/python/
> python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/
> python3-bleak_0.21.1.bb
> >>> > index 4a1fafb5d..96f3fcbcf 100644
> >>> > --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> >>> > +++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> >>> > @@ -3,14 +3,31 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
> >>> >  LICENSE =3D "MIT"
> >>> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f66ed7"
> >>> >
> >>> > -SRC_URI[sha256sum] =3D
> "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f"
> >>> > +SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
> >>> > +PYPI_SRC_URI =3D "git://
> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop"
> >>>
> >>> why do we need this change if we are not bumping versions ?
> >>>
> >>> >
> >>> > -PYPI_PACKAGE =3D "bleak"
> >>> > +inherit pypi python_poetry_core ptest
> >>> >
> >>> > -inherit pypi python_poetry_core
> >>> > +S =3D "${WORKDIR}/git"
> >>> > +
> >>> > +SRC_URI +=3D " \
> >>> > +       file://run-ptest \
> >>> > +"
> >>> > +
> >>> > +RDEPENDS:${PN}-ptest +=3D " \
> >>> > +       python3-pytest \
> >>> > +       python3-pytest-asyncio \
> >>> > +       python3-unittest-automake-output \
> >>> > +"
> >>> > +
> >>> > +do_install_ptest() {
> >>> > +       install -d ${D}${PTEST_PATH}/tests
> >>> > +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >>> > +}
> >>> >
> >>> >  RDEPENDS:${PN} +=3D " \
> >>> > -    python3-core (>3.7) \
> >>> > -    python3-async-timeout \
> >>> > -    python3-dbus-fast \
> >>> > +       python3-core (>3.7) \
> >>> > +       python3-async-timeout \
> >>> > +       python3-dbus-fast \
> >>> > +       python3-xml \
> >>> >  "
> >>> > --
> >>> > 2.25.1
> >>> >
> >>> >
> >>> >
> >>> >
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#109831):
> https://lists.openembedded.org/g/openembedded-devel/message/109831
> >> Mute This Topic: https://lists.openembedded.org/mt/105358066/924729
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [ticotimo@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000017942a0615716e9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Hmm ok. So is this SRCREV corresponding to same relea=
se ? if so we are<br>&gt; ok, otherwise perhaps adding +git to SRCREV would=
<br>&gt; be appropriate<br><br>Yes, it&#39;s the same release.</div><br><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 6 Nis=
 2024 Cmt, 20:48 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, Apr 6, 2024 at 7:13=E2=80=AFAM Tim=
 Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotim=
o@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Apr 5, 2024 at 10:34=E2=80=AFPM Alper Ak &lt;<a href=3D"mailto=
:alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; Sorry, I overlooked it. The tests directory was not present in the=
 package downloaded with the default PYPI_SRC_URI value.<br>
&gt;<br>
&gt;<br>
&gt; Unfortunately, many <a href=3D"http://pypi.org" rel=3D"noreferrer" tar=
get=3D"_blank">pypi.org</a> tarballs exclude tests. So switching to git fet=
cher will make sense in those cases.<br>
<br>
Hmm ok. So is this SRCREV corresponding to same release ? if so we are<br>
ok, otherwise perhaps adding +git to SRCREV would<br>
be appropriate<br>
<br>
&gt; Given the =E2=80=9Cxz backdoor=E2=80=9D incident, we might decide to p=
refer git.<br>
<br>
Nah, that would not mitigate it<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Funu ya=
zd=C4=B1:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak &lt;<a href=3D=
"mailto:alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; * Ptest tested on qemux86-64 and qemuarm64<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; * Add ptest into PTESTS_FAST_META_PYTHON<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; qemux86-64:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Testsuite summary<br>
&gt;&gt;&gt; &gt; TOTAL: 14<br>
&gt;&gt;&gt; &gt; PASS: 14<br>
&gt;&gt;&gt; &gt; SKIP: 0<br>
&gt;&gt;&gt; &gt; XFAIL: 0<br>
&gt;&gt;&gt; &gt; FAIL: 0<br>
&gt;&gt;&gt; &gt; XPASS: 0<br>
&gt;&gt;&gt; &gt; ERROR: 0<br>
&gt;&gt;&gt; &gt; DURATION: 9<br>
&gt;&gt;&gt; &gt; END: /usr/lib/python3-bleak/ptest<br>
&gt;&gt;&gt; &gt; 2024-04-05T18:44<br>
&gt;&gt;&gt; &gt; STOP: ptest-runner<br>
&gt;&gt;&gt; &gt; TOTAL: 1 FAIL: 0<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; qemuarm64:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Testsuite summary<br>
&gt;&gt;&gt; &gt; TOTAL: 14<br>
&gt;&gt;&gt; &gt; PASS: 14<br>
&gt;&gt;&gt; &gt; SKIP: 0<br>
&gt;&gt;&gt; &gt; XFAIL: 0<br>
&gt;&gt;&gt; &gt; FAIL: 0<br>
&gt;&gt;&gt; &gt; XPASS: 0<br>
&gt;&gt;&gt; &gt; ERROR: 0<br>
&gt;&gt;&gt; &gt; DURATION: 8<br>
&gt;&gt;&gt; &gt; END: /usr/lib/python3-bleak/ptest<br>
&gt;&gt;&gt; &gt; 2024-04-05T21:15<br>
&gt;&gt;&gt; &gt; STOP: ptest-runner<br>
&gt;&gt;&gt; &gt; TOTAL: 1 FAIL: 0<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak=
1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 .../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;&gt; &gt;=C2=A0 .../python/python3-bleak/run-ptest=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-bleak_0.21.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++++++----<br>
&gt;&gt;&gt; &gt;=C2=A0 3 files changed, 27 insertions(+), 6 deletions(-)<b=
r>
&gt;&gt;&gt; &gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/pyt=
hon/python3-bleak/run-ptest<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/meta-python/conf/include/ptest-packagelists-=
meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.i=
nc<br>
&gt;&gt;&gt; &gt; index 2f7babe48..63f312b45 100644<br>
&gt;&gt;&gt; &gt; --- a/meta-python/conf/include/ptest-packagelists-meta-py=
thon.inc<br>
&gt;&gt;&gt; &gt; +++ b/meta-python/conf/include/ptest-packagelists-meta-py=
thon.inc<br>
&gt;&gt;&gt; &gt; @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-ansicolors \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-asgiref \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-aspectlib \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 python3-bleak \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-blinker \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-cachetools \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-cbor2 \<br>
&gt;&gt;&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-=
bleak/run-ptest b/meta-python/recipes-devtools/python/python3-bleak/run-pte=
st<br>
&gt;&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt;&gt; &gt; index 000000000..8d2017d39<br>
&gt;&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt;&gt; &gt; +++ b/meta-python/recipes-devtools/python/python3-bleak/r=
un-ptest<br>
&gt;&gt;&gt; &gt; @@ -0,0 +1,3 @@<br>
&gt;&gt;&gt; &gt; +#!/bin/sh<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; +pytest --automake<br>
&gt;&gt;&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-bleak_0.21.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-bleak_0.21.1.bb</a><br>
&gt;&gt;&gt; &gt; index 4a1fafb5d..96f3fcbcf 100644<br>
&gt;&gt;&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bl=
eak_0.21.1.bb</a><br>
&gt;&gt;&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bl=
eak_0.21.1.bb</a><br>
&gt;&gt;&gt; &gt; @@ -3,14 +3,31 @@ HOMEPAGE =3D &quot;<a href=3D"https://g=
ithub.com/hbldh/bleak" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/hbldh/bleak</a>&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbcb=
c2069a86cba1b5e47253679f66ed7&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;ec4a1a2772fb315b992cbaa1153=
070c7e26968a52b0e2727035f443a1af5c18f&quot;<br>
&gt;&gt;&gt; &gt; +SRCREV =3D &quot;054b092e19c7a45d5ea07d8948022f54117fe5e=
8&quot;<br>
&gt;&gt;&gt; &gt; +PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop=
</a>&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; why do we need this change if we are not bumping versions ?<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -PYPI_PACKAGE =3D &quot;bleak&quot;<br>
&gt;&gt;&gt; &gt; +inherit pypi python_poetry_core ptest<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -inherit pypi python_poetry_core<br>
&gt;&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;&gt;&gt; &gt; +&quot;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest-asyncio \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-out=
put \<br>
&gt;&gt;&gt; &gt; +&quot;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; +do_install_ptest() {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/=
tests<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/tests/* ${D}${PTE=
ST_PATH}/tests/<br>
&gt;&gt;&gt; &gt; +}<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 RDEPENDS:${PN} +=3D &quot; \<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 python3-core (&gt;3.7) \<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 python3-async-timeout \<br>
&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 python3-dbus-fast \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-core (&gt;3.7) \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-async-timeout \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-dbus-fast \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-xml \<br>
&gt;&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; 2.25.1<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#109831): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/109831" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/109831</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1053=
58066/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/105358066/924729</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.=
com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000017942a0615716e9b--

