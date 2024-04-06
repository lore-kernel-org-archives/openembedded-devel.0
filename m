Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2DC67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 14:13:29 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.26163.1712412806394932469
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 07:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mClPA4Zh;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso3554489276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712412805; x=1713017605; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yspFh+S+XaCsSjihEquYMMFn7yKSf9Ox/Lisbrg15tI=;
        b=mClPA4Zhk92EmaKUDkcMFxXLGPmLQo5Sy+rf9cNf8eUMB/EGo75m1rX/4eo3aAh7gZ
         cONoUHSjSNapSNi/He4+27P+k4kWTZRcODtxcg3DomaC7XcGq5FIGlLr0hyfVb5QaFdX
         WWWIciqHEYHYV48VKUC4xKoa5v1zw8Y1q5W+AQeVPoRHCwEF8SMJ5pSs4c/iCeBd+oW9
         mHDo0oGa8emtymKVHSNRZqnVhlS15C5S6A0HzAolBbiwyAGqjE9DIDTXvWfVzMviN9zR
         gEMYkz2gjEhJ32r2D9sT/tMgMXOMmg5z03/wBx0DbZTLB0wiD0uEZuL5g5NojLTBnCQF
         i0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712412805; x=1713017605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yspFh+S+XaCsSjihEquYMMFn7yKSf9Ox/Lisbrg15tI=;
        b=HWlqaPMJrASv8g3K4uoIjbWVCpTHVQZ8u+9aKlLSt1Psra5rgs295QuEN4SQBc9kVC
         MJ2YeAuodfYWwv1n+rTs1WSWw2dwwHeoYHub2KfPh3VkOH7RCH9Y6HdEt+b4GlzQN8FW
         Scr286Y2DVChuQhilKgep/EtpLfpW690s/8u0OGMSeYp85dHMPqUVvxJJ7L9gIYvPMci
         glZDG+7D1HrqdEhsd+vTb58Q4cwHq4MzwVkEVIPFdMXjyqZcB6KWEbwiPAq+xLKKRZKo
         434OuyknSvy8n8J8Nz33mQPTJyX2g1k3VAjKPt8Y4pd/BB/V/UCWuFq513m6KKuziJKQ
         Ui2w==
X-Forwarded-Encrypted: i=1; AJvYcCUhQEYRw8HebYUfrCEn7Wuoh7fy1jJoSujezCOJni02E7JXAOG9zvr85chndSMK01FuUsy/W3kQScgevONT5Zd28Pvgi1YjwpXZCz5atrJZeZllUa1pE0Vi1w==
X-Gm-Message-State: AOJu0YzHdXe1PmRmnEFMFJva0pISFxtd7JS+o/sHnfCPdd3FZHQjfMd2
	jIQEfdx5bq02iS9yOPvfvjIxvDNbX9t6dhjYQxD2jMpEF0kK4O9ZcNg/37uEdah3+hv/J4U6LsM
	84BFuf0FoGKbNic6BLWXYS5D8Fks=
X-Google-Smtp-Source: AGHT+IEghw47AEF1vvnhBRcT0AAWJhWaG/H/+SYQmRk3R79QawfrgSJGBjTdtGTyl/GgTROq3XIqrHvaLEdxOCYQ2ZQ=
X-Received: by 2002:a25:ae0a:0:b0:dcc:99b6:830b with SMTP id
 a10-20020a25ae0a000000b00dcc99b6830bmr3879951ybj.19.1712412805183; Sat, 06
 Apr 2024 07:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240405215254.1338168-1-alperyasinak1@gmail.com>
 <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com> <CAGpma=61Z11fO0w_m9dL_+cZeJq4xU3z4X2pgr1b+V=tvwAAaA@mail.gmail.com>
In-Reply-To: <CAGpma=61Z11fO0w_m9dL_+cZeJq4xU3z4X2pgr1b+V=tvwAAaA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 6 Apr 2024 07:13:14 -0700
Message-ID: <CANx9H-Cz8DH3DkKPJh5toZAxKJ9+vmaMYA0Z+Ge+zG++PiV0Vg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: enable ptest and add
 missing runtime dependency
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6418806156e2c09"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 14:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109833

--000000000000f6418806156e2c09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 10:34=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:

> Sorry, I overlooked it. The tests directory was not present in the packag=
e
> downloaded with the default PYPI_SRC_URI value.
>

Unfortunately, many pypi.org tarballs exclude tests. So switching to git
fetcher will make sense in those cases.
Given the =E2=80=9Cxz backdoor=E2=80=9D incident, we might decide to prefer=
 git.

>
> Khem Raj <raj.khem@gmail.com>, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Funu =
yazd=C4=B1:
>
>> On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com=
> wrote:
>> >
>> > * Ptest tested on qemux86-64 and qemuarm64
>> >
>> > * Add ptest into PTESTS_FAST_META_PYTHON
>> >
>> > qemux86-64:
>> >
>> > Testsuite summary
>> > TOTAL: 14
>> > PASS: 14
>> > SKIP: 0
>> > XFAIL: 0
>> > FAIL: 0
>> > XPASS: 0
>> > ERROR: 0
>> > DURATION: 9
>> > END: /usr/lib/python3-bleak/ptest
>> > 2024-04-05T18:44
>> > STOP: ptest-runner
>> > TOTAL: 1 FAIL: 0
>> >
>> > qemuarm64:
>> >
>> > Testsuite summary
>> > TOTAL: 14
>> > PASS: 14
>> > SKIP: 0
>> > XFAIL: 0
>> > FAIL: 0
>> > XPASS: 0
>> > ERROR: 0
>> > DURATION: 8
>> > END: /usr/lib/python3-bleak/ptest
>> > 2024-04-05T21:15
>> > STOP: ptest-runner
>> > TOTAL: 1 FAIL: 0
>> >
>> > Signed-off-by: alperak <alperyasinak1@gmail.com>
>> > ---
>> >  .../ptest-packagelists-meta-python.inc        |  1 +
>> >  .../python/python3-bleak/run-ptest            |  3 ++
>> >  .../python/python3-bleak_0.21.1.bb            | 29 +++++++++++++++---=
-
>> >  3 files changed, 27 insertions(+), 6 deletions(-)
>> >  create mode 100644
>> meta-python/recipes-devtools/python/python3-bleak/run-ptest
>> >
>> > diff --git
>> a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> > index 2f7babe48..63f312b45 100644
>> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> > @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>> >      python3-ansicolors \
>> >      python3-asgiref \
>> >      python3-aspectlib \
>> > +    python3-bleak \
>> >      python3-blinker \
>> >      python3-cachetools \
>> >      python3-cbor2 \
>> > diff --git
>> a/meta-python/recipes-devtools/python/python3-bleak/run-ptest
>> b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
>> > new file mode 100644
>> > index 000000000..8d2017d39
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
>> > @@ -0,0 +1,3 @@
>> > +#!/bin/sh
>> > +
>> > +pytest --automake
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/
>> python3-bleak_0.21.1.bb
>> > index 4a1fafb5d..96f3fcbcf 100644
>> > --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> > @@ -3,14 +3,31 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>> >  LICENSE =3D "MIT"
>> >  LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f66ed7"
>> >
>> > -SRC_URI[sha256sum] =3D
>> "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f"
>> > +SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
>> > +PYPI_SRC_URI =3D "git://
>> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop"
>>
>> why do we need this change if we are not bumping versions ?
>>
>> >
>> > -PYPI_PACKAGE =3D "bleak"
>> > +inherit pypi python_poetry_core ptest
>> >
>> > -inherit pypi python_poetry_core
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +SRC_URI +=3D " \
>> > +       file://run-ptest \
>> > +"
>> > +
>> > +RDEPENDS:${PN}-ptest +=3D " \
>> > +       python3-pytest \
>> > +       python3-pytest-asyncio \
>> > +       python3-unittest-automake-output \
>> > +"
>> > +
>> > +do_install_ptest() {
>> > +       install -d ${D}${PTEST_PATH}/tests
>> > +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> > +}
>> >
>> >  RDEPENDS:${PN} +=3D " \
>> > -    python3-core (>3.7) \
>> > -    python3-async-timeout \
>> > -    python3-dbus-fast \
>> > +       python3-core (>3.7) \
>> > +       python3-async-timeout \
>> > +       python3-dbus-fast \
>> > +       python3-xml \
>> >  "
>> > --
>> > 2.25.1
>> >
>> >
>> >
>> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109831):
> https://lists.openembedded.org/g/openembedded-devel/message/109831
> Mute This Topic: https://lists.openembedded.org/mt/105358066/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f6418806156e2c09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 5, 2024 at 10:34=E2=80=AFPM Alper Ak &lt;<a hre=
f=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><div dir=3D"ltr">Sorry, I overlooked it. The tes=
ts directory was not present in the package downloaded with the default PYP=
I_SRC_URI value.</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Unfortunately, many <a href=3D"http://pypi.org">pypi.org</a> tarballs=
 exclude tests. So switching to git fetcher will make sense in those cases.=
=C2=A0</div><div dir=3D"auto">Given the =E2=80=9Cxz backdoor=E2=80=9D incid=
ent, we might decide to prefer git.</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr">=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Funu yazd=C4=B1:=
<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fri, Apr 5, =
2024 at 2:53=E2=80=AFPM Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.=
com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * Ptest tested on qemux86-64 and qemuarm64<br>
&gt;<br>
&gt; * Add ptest into PTESTS_FAST_META_PYTHON<br>
&gt;<br>
&gt; qemux86-64:<br>
&gt;<br>
&gt; Testsuite summary<br>
&gt; TOTAL: 14<br>
&gt; PASS: 14<br>
&gt; SKIP: 0<br>
&gt; XFAIL: 0<br>
&gt; FAIL: 0<br>
&gt; XPASS: 0<br>
&gt; ERROR: 0<br>
&gt; DURATION: 9<br>
&gt; END: /usr/lib/python3-bleak/ptest<br>
&gt; 2024-04-05T18:44<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; qemuarm64:<br>
&gt;<br>
&gt; Testsuite summary<br>
&gt; TOTAL: 14<br>
&gt; PASS: 14<br>
&gt; SKIP: 0<br>
&gt; XFAIL: 0<br>
&gt; FAIL: 0<br>
&gt; XPASS: 0<br>
&gt; ERROR: 0<br>
&gt; DURATION: 8<br>
&gt; END: /usr/lib/python3-bleak/ptest<br>
&gt; 2024-04-05T21:15<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 .../python/python3-bleak/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-bleak_0.21.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-bleak_0.21.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++++++----<br>
&gt;=C2=A0 3 files changed, 27 insertions(+), 6 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-b=
leak/run-ptest<br>
&gt;<br>
&gt; diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.i=
nc b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; index 2f7babe48..63f312b45 100644<br>
&gt; --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt; @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-ansicolors \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-asgiref \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-aspectlib \<br>
&gt; +=C2=A0 =C2=A0 python3-bleak \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-blinker \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cachetools \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cbor2 \<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-pte=
st b/meta-python/recipes-devtools/python/python3-bleak/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8d2017d39<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +pytest --automake<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.=
21.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1=
.bb</a><br>
&gt; index 4a1fafb5d..96f3fcbcf 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-bl=
eak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.bb=
</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-bl=
eak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.bb=
</a><br>
&gt; @@ -3,14 +3,31 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/hbl=
dh/bleak" rel=3D"noreferrer" target=3D"_blank">https://github.com/hbldh/ble=
ak</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbcbc2069a86cba1b=
5e47253679f66ed7&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;ec4a1a2772fb315b992cbaa1153070c7e26968a5=
2b0e2727035f443a1af5c18f&quot;<br>
&gt; +SRCREV =3D &quot;054b092e19c7a45d5ea07d8948022f54117fe5e8&quot;<br>
&gt; +PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.com/hbldh/bleak=
.git;protocol=3Dhttps;branch=3Ddevelop" rel=3D"noreferrer" target=3D"_blank=
">github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop</a>&quot;<br=
>
<br>
why do we need this change if we are not bumping versions ?<br>
<br>
&gt;<br>
&gt; -PYPI_PACKAGE =3D &quot;bleak&quot;<br>
&gt; +inherit pypi python_poetry_core ptest<br>
&gt;<br>
&gt; -inherit pypi python_poetry_core<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest-asyncio \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/tests/* ${D}${PTEST_PATH}/test=
s/<br>
&gt; +}<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 python3-core (&gt;3.7) \<br>
&gt; -=C2=A0 =C2=A0 python3-async-timeout \<br>
&gt; -=C2=A0 =C2=A0 python3-dbus-fast \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-core (&gt;3.7) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-async-timeout \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-dbus-fast \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-xml \<br>
&gt;=C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><div class=3D"gmail_quote"></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109831): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109831" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109831</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105358066/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105358066/924729</a><br>
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

--000000000000f6418806156e2c09--

