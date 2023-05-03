Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67028C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 03:08:57 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.10520.1683083335374396335
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 20:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qHO0uVWO;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-55b7630a736so6541107b3.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683083334; x=1685675334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O/0wt/+Z79TdZG5TnCgmou0Z8CK4JFKaS2CVSpDvMME=;
        b=qHO0uVWOtV3ChaOQZn8SHMMIWkQA01y3/35kvWTCavDDjTbXqwLc1lPsOOL3RpCqYG
         YbJUbFWvHA7C60VK9KN3GwJ826HqU52imqGmkYsacns4DkCHmxE5zZMkXFO3jAsev6ID
         tkNREr+KyOeOfio3XDK2FUlBTUdnJO7X7qCuuI/HeIuhjZvbpxdmHnAJ0IKMuwXCvVnC
         4lDXo9YpcD8m0vU2+njYFFl692ou6+tpbAc99WFtBNyhLHl3ElyebLSI4Bo5gtTthDxN
         Pn+cpkDhK7Da899pZqXHS5v0B7L5/VD5Cyxf/KdTgtVS8TH5doZHehLIA7gnvwWnBwLQ
         D2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683083334; x=1685675334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/0wt/+Z79TdZG5TnCgmou0Z8CK4JFKaS2CVSpDvMME=;
        b=hxxIr/JWygQiCw91U7TBX240bi+sK0V9LX71iOA2ZPTTpuPNy79u67CjYTKuCoSQt2
         Km4Fc4TaGfts6xq0I1P8Qr+21GrAHVtVAEiTbuEV/o6m3XWcpDPaOfFLB4QuNtiXJ9H8
         Ikoc2/H9o4G5VlSIbHV6e9cX29pe7EvO7l+f0MYjmsHSXMu5HK/M6Kjm87J7jyEC/+6Y
         wr2bIKSvKdyoymVz1enZmJESlL7ZUU2hv1Ilb39shgFVWLW5loQWqm+CNvl0iMogU74M
         AyQqS5yD52KRfekiKI40CafgNWqlIgnurgrdeGyRRnGPxZYHzE6BdR4M+KzOlLVBI6aa
         5WpQ==
X-Gm-Message-State: AC+VfDxstKyTH84MUSP672Hwo6JmDaMUMpUGlbWMjgH9ER0uGnl4GY7v
	Wj9Mb36eX8tU56pf1iB1j1YqP7XH6PM/pmEHIOM=
X-Google-Smtp-Source: ACHHUZ58o4hO6OyH7874gx1FiUSxZSNfh4NSknOl1q4ZHmNqwNx2seOoSIDLUyxCsYCnE9AVg7YB9HiMdqdx4A1wuE0=
X-Received: by 2002:a81:6685:0:b0:54f:bec1:c106 with SMTP id
 a127-20020a816685000000b0054fbec1c106mr18157365ywc.45.1683083332868; Tue, 02
 May 2023 20:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com>
 <20230502165005.880470-2-tgamblin@baylibre.com> <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
 <CAMKF1sp_P098oaCBZvuhsUtPBgUmMaF30-fdrzaZfOWRRsz0XA@mail.gmail.com> <CAMKF1srjJhgwReg=N-YKs3No1Em7yztqr7eY1N-s7ySN=diVSg@mail.gmail.com>
In-Reply-To: <CAMKF1srjJhgwReg=N-YKs3No1Em7yztqr7eY1N-s7ySN=diVSg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 2 May 2023 20:08:41 -0700
Message-ID: <CANx9H-DqMAjcNzi=+9N+6tDREoAQXwku0wPRXLFEqm-EsDFoRQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: multipart/alternative; boundary="0000000000002edff605fac160b0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 03:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102284

--0000000000002edff605fac160b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 3:01 PM Khem Raj <raj.khem@gmail.com> wrote:

> nm cleaned tmpdir it builds and runs ok
>
> On Tue, May 2, 2023 at 2:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > ah nm, I needed your patches for oe-core as well which upgrades
> > hatchling to 1.14.x but it still fails to build let me see what could
> > be going on.
> >
> > On Tue, May 2, 2023 at 2:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > I think it needs python3-hatchling or native variant of this. It fail=
s
> to build
> > >
> > > | ERROR Missing dependencies:
> > > |       hatchling>=3D1.14
> > >
> > > On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@bayli=
bre.com>
> wrote:
> > > >
> > > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > > ---
> > > >  .../python/python3-platformdirs/run-ptest     |  3 ++
> > > >  .../python/python3-platformdirs_3.5.0.bb      | 35
> +++++++++++++++++++
> > > >  2 files changed, 38 insertions(+)
> > > >  create mode 100644
> meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> > > >  create mode 100644 meta-python/recipes-devtools/python/
> python3-platformdirs_3.5.0.bb
> > > >
> > > > diff --git
> a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> > > > new file mode 100644
> > > > index 000000000..b63c4de0d
> > > > --- /dev/null
> > > > +++
> b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> > > > @@ -0,0 +1,3 @@
> > > > +#!/bin/sh
> > > > +
> > > > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e
> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -=
e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=
=3D=3D"SKIP" ||
> $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pri=
nt}}'| awk
> '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"=
XFAIL" ||
> $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > > > diff --git a/meta-python/recipes-devtools/python/
> python3-platformdirs_3.5.0.bb b/meta-python/recipes-devtools/python/
> python3-platformdirs_3.5.0.bb
> > > > new file mode 100644
> > > > index 000000000..b5ff369d0
> > > > --- /dev/null
> > > > +++ b/meta-python/recipes-devtools/python/
> python3-platformdirs_3.5.0.bb
> > > > @@ -0,0 +1,35 @@
> > > > +SUMMARY =3D "A small Python module for determining appropriate
> platform-specific dirs"
> > > > +HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
> > > > +LICENSE =3D "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d17a"
> > > > +
> > > > +SRC_URI =3D " \
> > > > +    git://
> github.com/platformdirs/platformdirs.git;branch=3Dmain;protocol=3Dhttps \
> > > > +    file://run-ptest \
> > > > +"
> > > > +
> > > > +SRCREV ?=3D "dcb56802714f5570236c86d03773ff881be6e39f"
> > > > +SRC_URI[sha256sum] =3D
> "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
> > > > +
> > > > +inherit python_setuptools_build_meta ptest


https://github.com/platformdirs/platformdirs/blob/a57f88b67210f26587d06ee77=
cbd0aea89e45cf9/pyproject.toml#L2

Seems like this should =E2=80=9Cinherit python_hatchling=E2=80=9D instead o=
f
python_setuptools_build_meta
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/python_hatchling=
.bbclass


> > > > +
> > > > +DEPENDS +=3D " \
> > > > +    python3-hatch-vcs-native \
> > > > +    python3-setuptools-scm-native \
> > > > +    python3-toml-native \
> > > > +"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +RDEPENDS:${PN}-ptest +=3D " \
> > > > +    ${PYTHON_PN}-appdirs \
> > > > +    ${PYTHON_PN}-pytest \
> > > > +    ${PYTHON_PN}-pytest-mock \
> > > > +"
> > > > +
> > > > +do_install_ptest() {
> > > > +        install -d ${D}${PTEST_PATH}/Tests
> > > > +        cp -rf ${S}/tests ${D}${PTEST_PATH}/
> > > > +}
> > > > +
> > > > +BBCLASSEXTEND =3D "native"
> > > > --
> > > > 2.40.0
> > > >
> > > >
> > > >
> > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102282):
> https://lists.openembedded.org/g/openembedded-devel/message/102282
> Mute This Topic: https://lists.openembedded.org/mt/98643291/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002edff605fac160b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 2, 2023 at 3:01 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">nm cleaned tmpdir it builds and runs ok<br>
<br>
On Tue, May 2, 2023 at 2:57=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ah nm, I needed your patches for oe-core as well which upgrades<br>
&gt; hatchling to 1.14.x but it still fails to build let me see what could<=
br>
&gt; be going on.<br>
&gt;<br>
&gt; On Tue, May 2, 2023 at 2:46=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I think it needs python3-hatchling or native variant of this. It =
fails to build<br>
&gt; &gt;<br>
&gt; &gt; | ERROR Missing dependencies:<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0hatchling&gt;=3D1.14<br>
&gt; &gt;<br>
&gt; &gt; On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin=
@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../python/python3-platformdirs/run-ptest=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 ++<br>
&gt; &gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-platformdirs_3.5.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-platformdirs_3.5.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 | 35 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 38 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python=
/python3-platformdirs/run-ptest<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python=
/<a href=3D"http://python3-platformdirs_3.5.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-platformdirs_3.5.0.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-pla=
tformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformd=
irs/run-ptest<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000..b63c4de0d<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-python/recipes-devtools/python/python3-platformdi=
rs/run-ptest<br>
&gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
&gt; &gt; &gt; +#!/bin/sh<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &=
#39;s/\[...%\]//g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAI=
LED/FAIL/g&#39;|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&=
quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; |=
| $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s=
: %s\n&quot;, $NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&=
quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=
=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;pri=
nt $0}else{print}}&#39;<br>
&gt; &gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-platformdirs_3.5.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-platformdirs_3.5.0.bb</a> b/meta-python/recipes-devtools/python/<a =
href=3D"http://python3-platformdirs_3.5.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-platformdirs_3.5.0.bb</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000..b5ff369d0<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-platformdirs_3.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-platformdirs_3.5.0.bb</a><br>
&gt; &gt; &gt; @@ -0,0 +1,35 @@<br>
&gt; &gt; &gt; +SUMMARY =3D &quot;A small Python module for determining app=
ropriate platform-specific dirs&quot;<br>
&gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/platformdi=
rs/platformdirs" rel=3D"noreferrer" target=3D"_blank">https://github.com/pl=
atformdirs/platformdirs</a>&quot;<br>
&gt; &gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dea4f5a41454=
746a9ed111e3d8723d17a&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI =3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/platformdi=
rs/platformdirs.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/platformdirs/platformdirs.git;branch=3Dmain;protoc=
ol=3Dhttps</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRCREV ?=3D &quot;dcb56802714f5570236c86d03773ff881be6e39f&=
quot;<br>
&gt; &gt; &gt; +SRC_URI[sha256sum] =3D &quot;7954a68d0ba23558d753f73437c55f=
89027cf8f5108c19844d4b82e5af396335&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit python_setuptools_build_meta ptest</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"https://github.co=
m/platformdirs/platformdirs/blob/a57f88b67210f26587d06ee77cbd0aea89e45cf9/p=
yproject.toml#L2">https://github.com/platformdirs/platformdirs/blob/a57f88b=
67210f26587d06ee77cbd0aea89e45cf9/pyproject.toml#L2</a></div><br></div><div=
 dir=3D"auto">Seems like this should =E2=80=9Cinherit python_hatchling=E2=
=80=9D instead of python_setuptools_build_meta</div><div dir=3D"auto"><div>=
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-recipe/pytho=
n_hatchling.bbclass">https://git.yoctoproject.org/poky/tree/meta/classes-re=
cipe/python_hatchling.bbclass</a></div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"au=
to"><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +DEPENDS +=3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 python3-hatch-vcs-native \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 python3-setuptools-scm-native \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 python3-toml-native \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-appdirs \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-pytest-mock \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +do_install_ptest() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/Te=
sts<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests ${D}${PTEST_P=
ATH}/<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.40.0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102282): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102282" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102282</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98643291/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98643291/924729</a><br>
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

--0000000000002edff605fac160b0--

