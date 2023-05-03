Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC841C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:52:09 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.18358.1683118325803205784
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 05:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=WYsFpAC5;
 spf=pass (domain: baylibre.com, ip: 209.85.160.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-192814aa343so1679106fac.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683118325; x=1685710325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYDRyliigXwYfwVTb50xDG5baA3tAiGLhIKxAkd6Ap0=;
        b=WYsFpAC5BSlRhWrM2wOHWoZF81v6KSPI41zlMhBH05ktwBdsqxd17Go01WlsSeUd51
         LRm4Kf/QuaUBTriluUzWvv4KbppS9RP33VO/cPoZWI0M7o4WmVlRwOPRp9zStc1GuGfE
         gBPyaQkXqylmIogjFOo+U+c+ruQHflPFadj8kbQvYBSs88KaUsou56QFPnL0Xisczbiq
         9AafXJi86lw53S38R2l9SoF6rqyWz5dz0VTXzV+1SScOUwaCarRE8grYPbzgFtOo5Xrs
         PrhLcd4pMgCp16KMzz1ZshHOuhymUSYOW0G9F5v3iiuBuJKy5bh1kfsvTBoNq0GCyT+s
         g79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118325; x=1685710325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYDRyliigXwYfwVTb50xDG5baA3tAiGLhIKxAkd6Ap0=;
        b=HqtWC94qUnR43UCHIA2AvW2acmJ+91nft0nW+rWdWTOKVqvrJm+3m49Tq57M7yUJvp
         w8TCBLy2YHRfuqojfidfpi3ah8d72tUi2ztsEUfCvHbRCFqJGaqt/37fap3NLZ196Twx
         An4H2+fSEqCAY+GJeEpd/q0TStW/ni6NNmmei81INc+pUByzsWl5dE0cG6FBCHiqcl0O
         TbRTYwti5v0oMjPQkVvw6coHMoEjy2+Yfluwk9B9F6uQF3MvsCi94wrk3EqYt8r352i0
         ekG+dgCgktH/iejUUlmDIs5KXpPVjKx2PfbRs8Vgm8zKvbN5jYSSO+Xd4Nnuw6K2f5BV
         pSPQ==
X-Gm-Message-State: AC+VfDzHAUdAG080b7Ikd5gQUpzkCy3IWwXv+mwVgXjUdJaqcUwhxv7O
	5ws1Qh4ruwEd3xOZZQBAts0Zp/Dkv1C5JgLdDFbvxWBuIiqFMiZk
X-Google-Smtp-Source: ACHHUZ5LzyPSPipvcCpUhMHWquEFGm1kEBCUQVD92rwQj6ORTbafQ6uozzHW7n+u/ydKSKLGZ3f96ZrNUxIt1/t3YMw=
X-Received: by 2002:a05:6870:93d5:b0:188:fcf:35d9 with SMTP id
 c21-20020a05687093d500b001880fcf35d9mr9614967oal.43.1683118325134; Wed, 03
 May 2023 05:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com>
 <20230502165005.880470-2-tgamblin@baylibre.com> <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
 <CAMKF1sp_P098oaCBZvuhsUtPBgUmMaF30-fdrzaZfOWRRsz0XA@mail.gmail.com>
 <CAMKF1srjJhgwReg=N-YKs3No1Em7yztqr7eY1N-s7ySN=diVSg@mail.gmail.com> <CANx9H-DqMAjcNzi=+9N+6tDREoAQXwku0wPRXLFEqm-EsDFoRQ@mail.gmail.com>
In-Reply-To: <CANx9H-DqMAjcNzi=+9N+6tDREoAQXwku0wPRXLFEqm-EsDFoRQ@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 3 May 2023 08:51:54 -0400
Message-ID: <CAJN8jxGNEwWOGD2ekkRzPTVqD+vJTfYjo7QUrwa68rxTen3Z9A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2971005fac985d1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102285

--000000000000e2971005fac985d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 11:08=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:

>
>
> On Tue, May 2, 2023 at 3:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> nm cleaned tmpdir it builds and runs ok
>>
>> On Tue, May 2, 2023 at 2:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>> >
>> > ah nm, I needed your patches for oe-core as well which upgrades
>> > hatchling to 1.14.x but it still fails to build let me see what could
>> > be going on.
>> >
>> > On Tue, May 2, 2023 at 2:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
>> > >
>> > > I think it needs python3-hatchling or native variant of this. It
>> fails to build
>> > >
>> > > | ERROR Missing dependencies:
>> > > |       hatchling>=3D1.14
>> > >
>> > > On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@bayl=
ibre.com>
>> wrote:
>> > > >
>> > > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> > > > ---
>> > > >  .../python/python3-platformdirs/run-ptest     |  3 ++
>> > > >  .../python/python3-platformdirs_3.5.0.bb      | 35
>> +++++++++++++++++++
>> > > >  2 files changed, 38 insertions(+)
>> > > >  create mode 100644
>> meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
>> > > >  create mode 100644 meta-python/recipes-devtools/python/
>> python3-platformdirs_3.5.0.bb
>> > > >
>> > > > diff --git
>> a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
>> b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
>> > > > new file mode 100644
>> > > > index 000000000..b63c4de0d
>> > > > --- /dev/null
>> > > > +++
>> b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
>> > > > @@ -0,0 +1,3 @@
>> > > > +#!/bin/sh
>> > > > +
>> > > > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e
>> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed =
-e
>> 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=
=3D=3D"SKIP" ||
>> $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pr=
int}}'| awk
>> '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D=
"XFAIL" ||
>> $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
>> > > > diff --git a/meta-python/recipes-devtools/python/
>> python3-platformdirs_3.5.0.bb b/meta-python/recipes-devtools/python/
>> python3-platformdirs_3.5.0.bb
>> > > > new file mode 100644
>> > > > index 000000000..b5ff369d0
>> > > > --- /dev/null
>> > > > +++ b/meta-python/recipes-devtools/python/
>> python3-platformdirs_3.5.0.bb
>> > > > @@ -0,0 +1,35 @@
>> > > > +SUMMARY =3D "A small Python module for determining appropriate
>> platform-specific dirs"
>> > > > +HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
>> > > > +LICENSE =3D "BSD-3-Clause"
>> > > > +LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d17a"
>> > > > +
>> > > > +SRC_URI =3D " \
>> > > > +    git://
>> github.com/platformdirs/platformdirs.git;branch=3Dmain;protocol=3Dhttps =
\
>> > > > +    file://run-ptest \
>> > > > +"
>> > > > +
>> > > > +SRCREV ?=3D "dcb56802714f5570236c86d03773ff881be6e39f"
>> > > > +SRC_URI[sha256sum] =3D
>> "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
>> > > > +
>> > > > +inherit python_setuptools_build_meta ptest
>
>
>
> https://github.com/platformdirs/platformdirs/blob/a57f88b67210f26587d06ee=
77cbd0aea89e45cf9/pyproject.toml#L2
>
> Seems like this should =E2=80=9Cinherit python_hatchling=E2=80=9D instead=
 of
> python_setuptools_build_meta
>
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/python_hatchli=
ng.bbclass
>

I've tested it with both now and no difference seems apparent on the build
side. I'll resend with python_hatchling instead of
python_setuptools_build_meta to make sure hatchling is more explicit in the
dependencies.

>
>
>> > > > +
>> > > > +DEPENDS +=3D " \
>> > > > +    python3-hatch-vcs-native \
>> > > > +    python3-setuptools-scm-native \
>> > > > +    python3-toml-native \
>> > > > +"
>> > > > +
>> > > > +S =3D "${WORKDIR}/git"
>> > > > +
>> > > > +RDEPENDS:${PN}-ptest +=3D " \
>> > > > +    ${PYTHON_PN}-appdirs \
>> > > > +    ${PYTHON_PN}-pytest \
>> > > > +    ${PYTHON_PN}-pytest-mock \
>> > > > +"
>> > > > +
>> > > > +do_install_ptest() {
>> > > > +        install -d ${D}${PTEST_PATH}/Tests
>> > > > +        cp -rf ${S}/tests ${D}${PTEST_PATH}/
>> > > > +}
>> > > > +
>> > > > +BBCLASSEXTEND =3D "native"
>> > > > --
>> > > > 2.40.0
>> > > >
>> > > >
>> > > >
>> > > >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#102282):
>> https://lists.openembedded.org/g/openembedded-devel/message/102282
>> Mute This Topic: https://lists.openembedded.org/mt/98643291/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000e2971005fac985d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2, 2023 at 11:08=E2=80=AF=
PM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, May 2, 2023 at 3:01 PM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">nm cleaned tmpdir i=
t builds and runs ok<br>
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
yproject.toml#L2" target=3D"_blank">https://github.com/platformdirs/platfor=
mdirs/blob/a57f88b67210f26587d06ee77cbd0aea89e45cf9/pyproject.toml#L2</a></=
div><br></div><div dir=3D"auto">Seems like this should =E2=80=9Cinherit pyt=
hon_hatchling=E2=80=9D instead of python_setuptools_build_meta</div><div di=
r=3D"auto"><div><a href=3D"https://git.yoctoproject.org/poky/tree/meta/clas=
ses-recipe/python_hatchling.bbclass" target=3D"_blank">https://git.yoctopro=
ject.org/poky/tree/meta/classes-recipe/python_hatchling.bbclass</a></div></=
div></div></div></blockquote><div><br></div><div>I&#39;ve tested it with bo=
th now and no difference seems apparent on the build side. I&#39;ll resend =
with python_hatchling instead of python_setuptools_build_meta to make sure =
hatchling is more explicit in the dependencies.<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" dir=
=3D"auto"><br>
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
</blockquote></div></div>

--000000000000e2971005fac985d1--

