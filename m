Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30459D41170
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 11:00:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32999.1768474836096925152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 03:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bklbfJHz;
 spf=pass (domain: konsulko.com, ip: 209.85.216.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso452643a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768474835; x=1769079635; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r/2ppPYBCGZAnFxT0Yb4In6tbWW3iSOWoHFbFPHjE3A=;
        b=bklbfJHzlF/EjGRgIK/skRzK9vLr62i+hyooWH+yxhH6EjgBcYTCqarCoTArhIFbBN
         Baajoh0HDTu97H5POPy5L/c7AeE6w9BbTJWqAdVSiBYaVRP4Zw1c/p6SIBWq2doG++vH
         0KHc/szY9u5NZHFF9Qj57NJQwR/bAwhxr0FKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768474835; x=1769079635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/2ppPYBCGZAnFxT0Yb4In6tbWW3iSOWoHFbFPHjE3A=;
        b=nLpmYPIF45R6iR5yTJSTdx+Ubco+bteCVisEs5wJ1OwAG4tAU3QtFALl1ttWJZAup5
         uakN5ZShCVB31owWBQ5FqdN9MzxkJGax+ir6nNCUZTXYZAilqhA26t9AD3QqnQnLDOWy
         KsgbucwPOGgNT2Q04FRRtx0lveEHbSrB+LjMfNizz/o1blhs1tOV7x+TEdZB0AdM7zMl
         9DdRP43y6rtWO/SjAexT9XEw7vhz1ML+DNto7HtOvaHCcs4whBBYcx01RYPp/ADn+vxG
         72H1wxHuGcSk3eynyYKjFRWvDsFRPQ0FqUAOcc/PJAndO2Gv7wtEabUcE6pJ9qqwrGCk
         t5ow==
X-Gm-Message-State: AOJu0YxltGUrHnlqI44YeNS3+bhi26eWxvSohxlFKaRqLrtGzRsZ3JNJ
	rrxLW+NM+2rtd+qmXyzmbDe/QTvsiR5SUPXBygLqli3zkq5YvSjxz35CKYGwSLK9xpbGP1phpRZ
	SHIiCZ9brzCn9GPJXFDpdDFvn+MIIya5KOOuoEHBcgg==
X-Gm-Gg: AY/fxX7tytUY+KVNXyh+bbmY2DG9+M+Z86rvamxrJWerdT53GOYoahF2VeyjGosRWAy
	920Hn6rAiU/5lwTufhiC59U0t3dBClWUJrJXJMOwhdRZbFNvTOrsoF7EEQDJXzn9kU3FDqXyLFa
	FR74XMBeKTTOBA3TPWJBjAabDfNkk0TodUMNEF1kjfJdExVW71/pdnizGqU8WuJQjjVPWzKumK3
	RLiQJPt9uEDN2joLDZLbmxpeRslgn5Owi+sPsnsHVL3DhS3NT4RxgDFLQO5/uDFXcmUYw==
X-Received: by 2002:a17:90b:180f:b0:34c:fe57:2793 with SMTP id
 98e67ed59e1d1-3510911d14bmr6080928a91.20.1768474834085; Thu, 15 Jan 2026
 03:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
 <20260113103421.3568307-5-leon.anavi@konsulko.com> <769a4be8-60f5-4e81-8223-39fe410f6759@gmail.com>
In-Reply-To: <769a4be8-60f5-4e81-8223-39fe410f6759@gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 15 Jan 2026 13:00:22 +0200
X-Gm-Features: AZwV_QiDLyn6oCzZEycXuvoIZ-wvIbBmllz10yN9PD0XY6qNvvH-jC3tVwlBFmg
Message-ID: <CALtQ3O1M6OoircX+3BokVLK4CDwK=hEG6par3sP-LX6fNACY4g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-libevdev: Upgrade 0.12 -> 0.13.1
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000047b78c06486b226d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 11:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123503

--00000000000047b78c06486b226d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

On Tue, Jan 13, 2026 at 2:36=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> Small simplification: if you inherit the ptest-python-ptest[1] class
> instead of ptest, it takes care of all other test boilerplate (test
> installation, run-ptest creation, RDEPENDS...)
>
> Though I wouldn't submit a v2 because of this - but for next time it
> might be useful.
>

Thanks for the recommendation! Noted down. It sounds like a very practical
approach and I will definitely apply it the next time I am working on
ptests.

Thanks, Leon


>
> [1]:
>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/p=
test-python-pytest.bbclass
>
> On 1/13/26 11:34, Leon Anavi via lists.openembedded.org wrote:
> > Add ptest and upgrade to release 0.13.1:
> >
> > - pyproject.toml: add pytest as dev dependency
> > - Import Self from type_checking if needed to be compat with 3.9
> > - CI: run pytest via uv
> > - CI: test against multiple python versions
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../python/python3-libevdev/run-ptest          |  3 +++
> >  ...vdev_0.12.bb =3D> python3-libevdev_0.13.1.bb} | 18 ++++++++++++++++=
--
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> >  rename meta-python/recipes-devtools/python/{python3-libevdev_0.12.bb
> =3D> python3-libevdev_0.13.1.bb} (52%)
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> > new file mode 100644
> > index 0000000000..8d2017d39c
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake
> > diff --git a/meta-python/recipes-devtools/python/
> python3-libevdev_0.12.bb b/meta-python/recipes-devtools/python/
> python3-libevdev_0.13.1.bb
> > similarity index 52%
> > rename from meta-python/recipes-devtools/python/python3-libevdev_0.12.b=
b
> > rename to meta-python/recipes-devtools/python/python3-libevdev_0.13.1.b=
b
> > index cabcfd8df6..1c8a99eb33 100644
> > --- a/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
> > +++ b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
> > @@ -5,13 +5,27 @@ SECTION =3D "devel/python"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd94c10c546b419eddc6296157ec=
40747"
> >
> > -SRC_URI[sha256sum] =3D
> "02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08"
> > +SRC_URI[sha256sum] =3D
> "dc3369cd1401767b9ecb1117cd6b73faba9038e3bd9e1695a710a9e9d9415e8d"
> >
> > -inherit pypi setuptools3
> > +inherit pypi python_hatchling ptest
> >
> >  PYPI_PACKAGE =3D "libevdev"
> >
> > +SRC_URI +=3D " \
> > +    file://run-ptest \
> > +"
> > +
> >  RDEPENDS:${PN} +=3D " \
> >      libevdev \
> >      python3-ctypes \
> >  "
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +    python3-pytest \
> > +"
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/test
> > +    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
> > +}
> > +
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123434):
> https://lists.openembedded.org/g/openembedded-devel/message/123434
> > Mute This Topic: https://lists.openembedded.org/mt/117241112/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Leon Anavi
Software Engineer
Mob : +359 88 527 7901
konsulko.com

--00000000000047b78c06486b226d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Gyorgy,</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Jan 13, 2026 at 2:36=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:sk=
andigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Small simplification: if you inhe=
rit the ptest-python-ptest[1] class<br>
instead of ptest, it takes care of all other test boilerplate (test<br>
installation, run-ptest creation, RDEPENDS...)<br>
<br>
Though I wouldn&#39;t submit a v2 because of this - but for next time it<br=
>
might be useful.<br></blockquote><div><br></div><div>Thanks for the recomme=
ndation! Noted down. It sounds like a very practical approach and I will de=
finitely apply it the next time I am working on ptests.<br><br>Thanks, Leon=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1]:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/classes=
-recipe/ptest-python-pytest.bbclass" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ptes=
t-python-pytest.bbclass</a><br>
<br>
On 1/13/26 11:34, Leon Anavi via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Add ptest and upgrade to release 0.13.1:<br>
&gt;<br>
&gt; - pyproject.toml: add pytest as dev dependency<br>
&gt; - Import Self from type_checking if needed to be compat with 3.9<br>
&gt; - CI: run pytest via uv<br>
&gt; - CI: test against multiple python versions<br>
&gt;<br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-libevdev/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 ...<a href=3D"http://vdev_0.12.bb" rel=3D"noreferrer" target=3D"=
_blank">vdev_0.12.bb</a> =3D&gt; <a href=3D"http://python3-libevdev_0.13.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-libevdev_0.13.1.bb</a>} | =
18 ++++++++++++++++--<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-l=
ibevdev/run-ptest<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-libevdev_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevd=
ev_0.12.bb</a> =3D&gt; <a href=3D"http://python3-libevdev_0.13.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-libevdev_0.13.1.bb</a>} (52%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-libevdev/run-=
ptest b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8d2017d39c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest<b=
r>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +pytest --automake<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-libevdev_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevde=
v_0.12.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-libevdev_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevde=
v_0.13.1.bb</a><br>
&gt; similarity index 52%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-libevdev_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevdev=
_0.12.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-libevdev_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevdev=
_0.13.1.bb</a><br>
&gt; index cabcfd8df6..1c8a99eb33 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-li=
bevdev_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevdev_0.12.=
bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-li=
bevdev_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-libevdev_0.1=
3.1.bb</a><br>
&gt; @@ -5,13 +5,27 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd94c10c546b419ed=
dc6296157ec40747&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;02e952632ec6c249cbb9c66f6fa00012ea448b06=
606c77cd139133bc2fe46b08&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;dc3369cd1401767b9ecb1117cd6b73faba9038e3=
bd9e1695a710a9e9d9415e8d&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit pypi setuptools3<br>
&gt; +inherit pypi python_hatchling ptest<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;libevdev&quot;<br>
&gt;=C2=A0 <br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libevdev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-ctypes \<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
&gt; +=C2=A0 =C2=A0 cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/<br>
&gt; +}<br>
&gt; +<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#123434): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/123434" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/123434</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11724111=
2/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117241112/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Leon Anavi</div><div>Software Engineer</div=
><div>Mob : +359 88 527 7901</div><div><a href=3D"http://konsulko.com" targ=
et=3D"_blank">konsulko.com</a></div></div></div></div>

--00000000000047b78c06486b226d--

