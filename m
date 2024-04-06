Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCA9CD128A
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 05:35:06 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.5816.1712381696637330415
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 22:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RfbnwlQh;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso2121704a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 22:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712381696; x=1712986496; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFGonZDiphaaPyID3yAvSUVZc6/L674D+wtutnqVxy0=;
        b=RfbnwlQhw6M0WDig43ZqI7qAJVb9Gcs6ZboDmLVl7l6Ysha3Pif10yZHXVAAWDB6RM
         cT9FEfDsbGg4FnoZ0lPuSBoRBVIoc2KhxfGm/FzNTDeFLv4NlTSyNHEqeb+vPCdue6tc
         Po6TvYYh9PRpMMnfvUfZ6nyKCBvVMmhoMUHMF0uiYqYhh1mIJ88YXkGuvoqZmt/uPEL5
         Uab5Z3xUNOdZgTKU4KBzMd+fLt/Qu+Rmg8Yyt9/Qh8o4zCtgktDcBf3Sd6SzhXSG6a22
         OD2Q7KDf2YF/iQTzhxOteGH1DkmSN1PplooyZDKsTDG5Oc8uUid/AY9AvqKzhWmUZQWv
         6WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712381696; x=1712986496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFGonZDiphaaPyID3yAvSUVZc6/L674D+wtutnqVxy0=;
        b=mpX4FCd/Gn9srQCUkd6TZ9VkH1e9gvGaME0WdFb/stLKLXztejscyyKfTbUcGyTWnO
         wh1JC4379dTwKek2u4wYrovRPvDPoJYO9bf+zqIFRfQb/7pYGYCVVlK4gRBFAyQ4eaOw
         DmOuq+dI0PFr3v8PhCQQwYpyLcwpgo4Z+HsV+5iOoBC2xFK7Hk8hK5nh5LsOSQ5NCgDx
         T05EoaL0Xu8nLy7G6o9jRuKrI6q+wza43XgwkpBxyxCgO/xxVNnkN6/QaDXZISiW4kvm
         x+uF7GPkvdtv+Dc6LUEL5EcQe9mCuYqSf/wYBEEjQftQisnDGfk8sJ8F++vxsB9bET33
         l8zg==
X-Gm-Message-State: AOJu0YxYZXlnbTD8gTlYZJgcNyLj4Ze2jbyf5kjN56xXfK6BpOju05t7
	0jkhkV4WOIA7JJtryMDnPWdFo91s4lbbAGsy34LbSt+uQUK3kkObuIRO4xNXlNJeWUwDzAuR//1
	oGnrdZGZps1NfPk8QdUSY02o1Dvg=
X-Google-Smtp-Source: AGHT+IFfrfmjeSGLeSpkPdUNU00ZY0bdlwYQAlF5s1QArcX1P9Nq+QpPBAtlmlKvHA7efdh6SQgULtq4c/Z3NprdciE=
X-Received: by 2002:a05:6a20:3d95:b0:1a5:6a72:af54 with SMTP id
 s21-20020a056a203d9500b001a56a72af54mr4157415pzi.45.1712381695758; Fri, 05
 Apr 2024 22:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240405215254.1338168-1-alperyasinak1@gmail.com> <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com>
In-Reply-To: <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sat, 6 Apr 2024 08:34:44 +0300
Message-ID: <CAGpma=61Z11fO0w_m9dL_+cZeJq4xU3z4X2pgr1b+V=tvwAAaA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: enable ptest and add
 missing runtime dependency
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b21ec0061566eedd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 05:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109831

--000000000000b21ec0061566eedd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I overlooked it. The tests directory was not present in the package
downloaded with the default PYPI_SRC_URI value.

Khem Raj <raj.khem@gmail.com>, 6 Nis 2024 Cmt, 01:46 tarihinde =C5=9Funu ya=
zd=C4=B1:

> On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
> >
> > * Ptest tested on qemux86-64 and qemuarm64
> >
> > * Add ptest into PTESTS_FAST_META_PYTHON
> >
> > qemux86-64:
> >
> > Testsuite summary
> > TOTAL: 14
> > PASS: 14
> > SKIP: 0
> > XFAIL: 0
> > FAIL: 0
> > XPASS: 0
> > ERROR: 0
> > DURATION: 9
> > END: /usr/lib/python3-bleak/ptest
> > 2024-04-05T18:44
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > qemuarm64:
> >
> > Testsuite summary
> > TOTAL: 14
> > PASS: 14
> > SKIP: 0
> > XFAIL: 0
> > FAIL: 0
> > XPASS: 0
> > ERROR: 0
> > DURATION: 8
> > END: /usr/lib/python3-bleak/ptest
> > 2024-04-05T21:15
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../ptest-packagelists-meta-python.inc        |  1 +
> >  .../python/python3-bleak/run-ptest            |  3 ++
> >  .../python/python3-bleak_0.21.1.bb            | 29 +++++++++++++++----
> >  3 files changed, 27 insertions(+), 6 deletions(-)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-bleak/run-ptest
> >
> > diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.in=
c
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > index 2f7babe48..63f312b45 100644
> > --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> > @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D "\
> >      python3-ansicolors \
> >      python3-asgiref \
> >      python3-aspectlib \
> > +    python3-bleak \
> >      python3-blinker \
> >      python3-cachetools \
> >      python3-cbor2 \
> > diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-ptes=
t
> b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> > new file mode 100644
> > index 000000000..8d2017d39
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake
> > diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.b=
b
> b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> > index 4a1fafb5d..96f3fcbcf 100644
> > --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> > @@ -3,14 +3,31 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f=
66ed7"
> >
> > -SRC_URI[sha256sum] =3D
> "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f"
> > +SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
> > +PYPI_SRC_URI =3D "git://
> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop"
>
> why do we need this change if we are not bumping versions ?
>
> >
> > -PYPI_PACKAGE =3D "bleak"
> > +inherit pypi python_poetry_core ptest
> >
> > -inherit pypi python_poetry_core
> > +S =3D "${WORKDIR}/git"
> > +
> > +SRC_URI +=3D " \
> > +       file://run-ptest \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +       python3-pytest \
> > +       python3-pytest-asyncio \
> > +       python3-unittest-automake-output \
> > +"
> > +
> > +do_install_ptest() {
> > +       install -d ${D}${PTEST_PATH}/tests
> > +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> >
> >  RDEPENDS:${PN} +=3D " \
> > -    python3-core (>3.7) \
> > -    python3-async-timeout \
> > -    python3-dbus-fast \
> > +       python3-core (>3.7) \
> > +       python3-async-timeout \
> > +       python3-dbus-fast \
> > +       python3-xml \
> >  "
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109828):
> https://lists.openembedded.org/g/openembedded-devel/message/109828
> > Mute This Topic: https://lists.openembedded.org/mt/105358066/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b21ec0061566eedd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I overlooked it. The tests directory was not presen=
t in the package downloaded with the default PYPI_SRC_URI value.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 6 Nis 2=
024 Cmt, 01:46 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alp=
er Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"_blank">alpe=
ryasinak1@gmail.com</a>&gt; wrote:<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109828): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109828" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/109828</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10535806=
6/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105358066/1997914</a><br>
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

--000000000000b21ec0061566eedd--

