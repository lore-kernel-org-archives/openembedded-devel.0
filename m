Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762DCC001CC
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:09:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.27144.1712862579126661108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RI2emO3R;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a53b331400so86178a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712862578; x=1713467378; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RadSPcr8q6nb86W0UY61YBe1rsUJ4V9f/8wCXkFFnes=;
        b=RI2emO3RAFwAUVfe62Y4Dk7hBLQWgyIoYQuldAxmbRE6uWk2hBkePn/Or1aB0IPZfD
         07N0sPdYtyKDOb8vXDw2Tyxsh9ImCh7fBLq7rxsOHPjIELpgX3KqnQ5B7Hw/dULF7ifR
         pth7aXdkAXJq1hzssBpdXK7PoomLCTDaCec+sRr/ZuDd/YJeqtbGzz6Cz/xK0CmlS6vO
         cFiUfAUHHYK08GjRyJwlvsKbwI5C7saz8O2AfhfNwrZWn4MTpURQUrU/wICaiWq83E6c
         vBdSG1Kmbm1eMw89DFQz6FlxoNcD3o/cOYePaxegDpNfXyO6y1nMFf29Bit0/FVaVnq6
         xE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712862578; x=1713467378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RadSPcr8q6nb86W0UY61YBe1rsUJ4V9f/8wCXkFFnes=;
        b=Y2SpSiCyCZgVW4qZ2UKF4I3tC/2i/sA5CSR/y0MlFpome5kVV0KGUqm8bWQAs4A96b
         8Po1NEqr/RjhLP67GIowyG7u3C3TNXmuhEUBm3c9htEpMd6LuS4ts1RuG17iM45F9gL9
         MOVLtGdSPnCOhUR5MQw3k8oQW4A6Tf5DhL5Qh3lQjpxkXHByLqJSxR2iHOijioBioJNm
         w5CrbdpKKp9IPpHPOcd8EpLa4M5XI3F28+CHai+iiFAvNLUmbw6lqFDdyr/jDBrTz6RB
         Knw1vukogUvJ6Qyh0+JsguWcsGVP4celOBgY661y8S0xpYQfayQdMGS7+0LwVU5wNtf+
         hp2g==
X-Gm-Message-State: AOJu0YxYATpdCc5qD0HE2FrsA8Q+DuWk9/HxMuX4CVrfa3yw7uNGZOet
	zdiBzrRcPvJTY6tReKhAGKakSDE+J30EJqTYPc7mLsd2tN0LHWabc/Wi2Xkf86sZK9icvW6jLwH
	UdbsFUhamZJrsm5/nqBOMHeWhN9s=
X-Google-Smtp-Source: AGHT+IEDvrSpfTvklLeLMSZvbGHtoaUJMUH4Hr/1diKAYiXLQ3NaAZZTSrta+9l5mygrHJPYpqAW71Siv0xE3DL9aWI=
X-Received: by 2002:a17:90a:e20d:b0:2a2:7693:399e with SMTP id
 a13-20020a17090ae20d00b002a27693399emr476424pjz.4.1712862578374; Thu, 11 Apr
 2024 12:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240411112318.167362-1-alperyasinak1@gmail.com> <CAMKF1srk1y01auNxgbKQrTK0NKZ_BKBTQFJeVKQKSM9MgD0NSw@mail.gmail.com>
In-Reply-To: <CAMKF1srk1y01auNxgbKQrTK0NKZ_BKBTQFJeVKQKSM9MgD0NSw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 11 Apr 2024 22:09:27 +0300
Message-ID: <CAGpma=7s2Lki1C=E_7_JzFVWZeMLv9=vo8uhq13eKy3QDd3g8w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flexparser: enable ptest and
 add missing runtime dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008881fd0615d6e51f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 19:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109923

--0000000000008881fd0615d6e51f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're welcome, I'm glad I could help! :)

Khem Raj <raj.khem@gmail.com>, 11 Nis 2024 Per, 20:29 tarihinde =C5=9Funu y=
azd=C4=B1:

> thanks for doing this.
>
> On Thu, Apr 11, 2024 at 4:23=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com=
> wrote:
> >
> > * Ptest and library example tested on qemux86-64 and qemuarm64
> >
> > * Add ptest into PTESTS_FAST_META_PYTHON
> >
> > Ptest result:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > qemux86-64:
> >
> > Testsuite summary
> > TOTAL: 59
> > PASS: 59
> > SKIP: 0
> > XFAIL: 0
> > FAIL: 0
> > XPASS: 0
> > ERROR: 0
> > DURATION: 12
> > END: /usr/lib/python3-flexparser/ptest
> > 2024-04-11T11:06
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > qemuarm64:
> >
> > Testsuite summary
> > TOTAL: 59
> > PASS: 59
> > SKIP: 0
> > XFAIL: 0
> > FAIL: 0
> > XPASS: 0
> > ERROR: 0
> > DURATION: 11
> > END: /usr/lib/python3-flexparser/ptest
> > 2024-04-11T11:09
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../ptest-packagelists-meta-python.inc        |  1 +
> >  .../python/python3-flexparser/run-ptest       |  3 +++
> >  .../python/python3-flexparser_0.3.bb          | 22 ++++++++++++++++++-
> >  3 files changed, 25 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> >
> > diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.in=
c
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > index acb09aaca..6bd48156d 100644
> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > @@ -20,6 +20,7 @@ PTESTS_FAST_META_PYTHON =3D "\
> >      python3-dominate \
> >      python3-execnet \
> >      python3-flexcache \
> > +    python3-flexparser \
> >      python3-freezegun \
> >      python3-geojson \
> >      python3-google-auth-oauthlib \
> > diff --git
> a/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> > new file mode 100644
> > index 000000000..8d2017d39
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake
> > diff --git a/meta-python/recipes-devtools/python/
> python3-flexparser_0.3.bb b/meta-python/recipes-devtools/python/
> python3-flexparser_0.3.bb
> > index fb94235f0..e45175f5a 100644
> > --- a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
> > @@ -6,6 +6,26 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D32f547dac365c355d2cdbcd7ebea9144"
> >  DEPENDS +=3D "python3-setuptools-scm-native"
> >  SRC_URI[sha256sum] =3D
> "692e7524d9e14b2b1231b772b091d7d6296951deb383f5a67bfbd0ecb0b9fa9a"
> >
> > -inherit pypi python_setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta ptest
> >
> >  PYPI_PACKAGE =3D "flexparser"
> > +
> > +SRC_URI +=3D " \
> > +       file://run-ptest \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +       python3-pytest \
> > +       python3-unittest-automake-output \
> > +"
> > +
> > +do_install_ptest() {
> > +       install -d ${D}${PTEST_PATH}/testsuite
> > +       cp -rf ${S}/flexparser/testsuite/* ${D}${PTEST_PATH}/testsuite/
> > +}
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +       python3-compression \
> > +       python3-email \
> > +       python3-logging \
> > +"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109919):
> https://lists.openembedded.org/g/openembedded-devel/message/109919
> > Mute This Topic: https://lists.openembedded.org/mt/105460442/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008881fd0615d6e51f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re welcome, I&#39;m glad I could help! :)<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 1=
1 Nis 2024 Per, 20:29 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">thanks for doing this.<br>
<br>
On Thu, Apr 11, 2024 at 4:23=E2=80=AFAM Alper Ak &lt;<a href=3D"mailto:alpe=
ryasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; * Ptest and library example tested on qemux86-64 and qemuarm64<br>
&gt;<br>
&gt; * Add ptest into PTESTS_FAST_META_PYTHON<br>
&gt;<br>
&gt; Ptest result:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; qemux86-64:<br>
&gt;<br>
&gt; Testsuite summary<br>
&gt; TOTAL: 59<br>
&gt; PASS: 59<br>
&gt; SKIP: 0<br>
&gt; XFAIL: 0<br>
&gt; FAIL: 0<br>
&gt; XPASS: 0<br>
&gt; ERROR: 0<br>
&gt; DURATION: 12<br>
&gt; END: /usr/lib/python3-flexparser/ptest<br>
&gt; 2024-04-11T11:06<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; qemuarm64:<br>
&gt;<br>
&gt; Testsuite summary<br>
&gt; TOTAL: 59<br>
&gt; PASS: 59<br>
&gt; SKIP: 0<br>
&gt; XFAIL: 0<br>
&gt; FAIL: 0<br>
&gt; XPASS: 0<br>
&gt; ERROR: 0<br>
&gt; DURATION: 11<br>
&gt; END: /usr/lib/python3-flexparser/ptest<br>
&gt; 2024-04-11T11:09<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 .../python/python3-flexparser/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-flexparser_0.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-flexparser_0.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 22 ++++++++++++++++++-<br>
&gt;=C2=A0 3 files changed, 25 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-f=
lexparser/run-ptest<br>
&gt;<br>
&gt; diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.i=
nc b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; index acb09aaca..6bd48156d 100644<br>
&gt; --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; @@ -20,6 +20,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-dominate \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-execnet \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-flexcache \<br>
&gt; +=C2=A0 =C2=A0 python3-flexparser \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-freezegun \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-geojson \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-google-auth-oauthlib \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-flexparser/ru=
n-ptest b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest<=
br>
&gt; new file mode 100644<br>
&gt; index 000000000..8d2017d39<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest=
<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +pytest --automake<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-flexparser_0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flexpa=
rser_0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-flexparser_0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flexpa=
rser_0.3.bb</a><br>
&gt; index fb94235f0..e45175f5a 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fl=
exparser_0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flexparser_0.=
3.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fl=
exparser_0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-flexparser_0.=
3.bb</a><br>
&gt; @@ -6,6 +6,26 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D32f54=
7dac365c355d2cdbcd7ebea9144&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;692e7524d9e14b2b1231b772b091d7d6296=
951deb383f5a67bfbd0ecb0b9fa9a&quot;<br>
&gt;<br>
&gt; -inherit pypi python_setuptools_build_meta<br>
&gt; +inherit pypi python_setuptools_build_meta ptest<br>
&gt;<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;flexparser&quot;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/testsuite<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/flexparser/testsuite/* ${D}${P=
TEST_PATH}/testsuite/<br>
&gt; +}<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-compression \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-email \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-logging \<br>
&gt; +&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109919): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109919" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/109919</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10546044=
2/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105460442/1997914</a><br>
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

--0000000000008881fd0615d6e51f--

