Return-Path: <yann.cardaillac@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6147C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:12:40 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.7078.1745665954388705368
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLl5+2o7;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ycnakajsph@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2673186a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745665954; x=1746270754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NNxH0FQgqoiU25DJXVPmr/z68UYyuNlvIBgFd5y3BtA=;
        b=dLl5+2o7OwwV/VUxkCPQhn4agm5PwAOCkwEB0r6/NaS/qHlzng+HBQZBXYH4AoEdem
         s3OsWG875FpBcWSjgzhpaK7SAmMFShy+71SSCzVKs9Qr0HbsKzt5XfflrIUBRYOJWwoB
         5W0S+aw1PTBvt6ydFS2ilUeElDF667kzpizRrbu5gunduEl1DHweDDpya5M+x/x4go1c
         7Mr2EpbIbiS8VeuX69A6tKteGvxwn2M04EowqHNn069BzCKa1ghqNM2+JlDSvOYdedv+
         bSUr6WB4vALGfQtFNVqHzYp/YOdHG4pe7vo+39kZYZKBI4FGU2JuA1WGUDXVZxz3ReXg
         GR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665954; x=1746270754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNxH0FQgqoiU25DJXVPmr/z68UYyuNlvIBgFd5y3BtA=;
        b=sNKqRNvPhV7Ngz77GQ2Ex/NLjvX1FLTtX1rLg1Xea2JgfG069ZbTERFaOXRH92GGc+
         o8EIBzy0cfAvCwmHcIs3sz8sDBRe3FEKWItRBkic6mZAvxaOBtnAIzUZecdNI9oRnte1
         eZ0N4pX8UBRotYDgM3cf7TJW4ZCmYWwWL/eTvJYD2xtjDc0BmhxeQYr5O/IRYV6y8s1x
         RLss9vn9xju2TiaAZmtyrhYqKQKEY1SaHB8SOZd1QKW59+TkaCZrpMW0uZB8QgJLn+BI
         ZF34C+lhc4qbYcdtIIJvoxDdVAVPeKc2ClIY/4fZ96rhPo7AQk31mu4s3/U79Bqo+YLF
         rupg==
X-Forwarded-Encrypted: i=1; AJvYcCWQQYLXDY6Fg8arfYoGQdTJ6mJyiPA1YfJizEwsJRXMd0ol36y4p3VjP4LHnbfT1f80SskSiI/zv5Any1TcWPKzSek=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwvUDhOHOuCoGuL2dnoPzkNBXaGn87rnEKtLjyZ+31QbpLu18CP
	KKOiVUfEmPfnwJJvbx4Osm8JWyP11U5X41XEocH47XULxkewQcxQr93wdK6Y1Lz5SQaYJw8+CQE
	WQjmroKSMAjRtz8Qbr5xK/fqKTZw=
X-Gm-Gg: ASbGncupB8JUe5EzqFSGucLDFMjhY7DzUZEIroE2BY9b3Mgh0h3yraA4SgLzHwnte5h
	ALzG5EXZzVuSwagv5+t5NFsj/CjZdfzzzRsse+YYbMaowHohorHcKQT8bRgW//6raRBaVzZNcR9
	vP1T/hGAAZdQ74GroZ/XfVdg==
X-Google-Smtp-Source: AGHT+IGfXZ07rPiOzno6kADzGRSh4X6Jl2vjr4U/BkFbCWT5mO/3/B7umWU7b8KaSl+bB1OPPI6wlrVTTl1PDHG+nso=
X-Received: by 2002:a17:90b:254b:b0:305:5f25:fcf8 with SMTP id
 98e67ed59e1d1-309f8d8cd5bmr7997325a91.5.1745665952872; Sat, 26 Apr 2025
 04:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com>
 <6525.1745594031172178467@lists.openembedded.org> <CAMKF1sr_MwfC=dgu5MObrB1S=Xm_kZbWVvO2YooKCNd5qzu+-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sr_MwfC=dgu5MObrB1S=Xm_kZbWVvO2YooKCNd5qzu+-Q@mail.gmail.com>
From: Yann CARDAILLAC Pro <yann.cardaillac@gmail.com>
Date: Sat, 26 Apr 2025 13:12:21 +0200
X-Gm-Features: ATxdqUFcPMwUBKU-0r-0HLU0Y-xzuruTRQ9oAtpCBR7DKDD0f7_EbiiCLaQaLBQ
Message-ID: <CAC3TgAJG=NK2P5nazTiwn2FtV0Q_ExPmgXtNAo-zJX8Szpu9Vg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
To: raj.khem@gmail.com
Cc: fleuryhugo7@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000047c080633ac873d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117141

--000000000000047c080633ac873d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raj Khem,

Sorry to drop in, I've been working on those patches with Hugo.

How are we supposed to do this multi meta contribution?
How do you guys keep things coherent?

Also note that Hugo ran the test on target and there's a few error left
regarding an internal structure of python3-a2wsgi. Hugo don't hesitate to
correct me or to complete.

Uvicorn is running fine as far as we are concern but there might still be
something left.

Bests regards,

Yann CARDAILLAC,


Le ven. 25 avr. 2025 =C3=A0 23:53, Khem Raj via lists.openembedded.org <raj=
.khem=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :

> On Fri, Apr 25, 2025 at 8:13=E2=80=AFAM Hugo via lists.openembedded.org
> <fleuryhugo7=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Added tests and fixed the issue related to ${PYTHON_PN}.
> >
> > Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
> > ---
> >  .../python/python3-uvicorn/run-ptest          |  6 +++
> >  .../python/python3-uvicorn_0.34.2.bb          | 37 +++++++++++++++++++
> >  2 files changed, 43 insertions(+)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-uvicorn_0.34.2.bb
> > diff --git
> a/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> > new file mode 100644
> > index 0000000000..d75b4cd4c9
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> > @@ -0,0 +1,6 @@
> > +#!/bin/sh
> > +
> > +# based on the gunicorn ptest
> > +echo "nameserver 8.8.8.8" >> /etc/resolv.conf
> > +
> > +pytest
> > diff --git a/meta-python/recipes-devtools/python/
> python3-uvicorn_0.34.2.bb b/meta-python/recipes-devtools/python/
> python3-uvicorn_0.34.2.bb
> > new file mode 100644
> > index 0000000000..cd2691a5ee
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY =3D "Lightning-fast ASGI server implementation."
> > +HOMEPAGE =3D "https://www.uvicorn.org/"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D5c778842f66a649636561c423c0eec2e"
> > +
> > +SRC_URI[sha256sum] =3D
> "0e929828f6186353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328"
> > +
> > +inherit pypi python_hatchling python_setuptools_build_meta ptest
> > +
> > +SRC_URI +=3D "file://run-ptest"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +    python3-pytest \
> > +    python3-httptools \
> > +    python3-dotenv \
>
>
> I am seeing
>
> ERROR: Nothing RPROVIDES 'python3-dotenv' (but
>
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-p=
ython/recipes-devtools/python/
> python3-uvicorn_0.34.2.bb
> RDEPENDS on or otherwise requires it)
>
> dotenv module is built via meta-virtualization, so perhaps its better
> to bring it to meta-python perhaps since meta-python does not depend
> on meta-virtualization.
>
>
> > +    python3-httpx \
> > +    python3-pyyaml \
> > +    python3-websockets \
> > +    python3-a2wsgi \
> > +    python3-pytest-mock \
> > +"
> > +
> > +do_install_ptest() {
> > +        install -d ${D}${PTEST_PATH}/tests
> > +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > +
> > +PYPI_PACKAGE =3D "uvicorn"
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +    python3-typing-extensions \
> > +    python3-click \
> > +    python3-h11 \
> > +    python3-anyio \
> > +"
> > +
> > +S =3D "${WORKDIR}/uvicorn-${PV}"
> > --
> > 2.43.0
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117137):
> https://lists.openembedded.org/g/openembedded-devel/message/117137
> Mute This Topic: https://lists.openembedded.org/mt/112415221/9753132
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yann.cardaillac@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000047c080633ac873d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Raj Khem,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Sorry to drop in, I&#39;ve been working on those p=
atches with Hugo.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
How are we supposed to do this multi meta contribution?=C2=A0</div><div dir=
=3D"auto">How do you guys keep things coherent?=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Also note that Hugo ran the test on target an=
d there&#39;s a few error left regarding an internal structure of python3-a=
2wsgi. Hugo don&#39;t hesitate to correct me or to complete.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Uvicorn is running fine as far as we =
are concern but there might still be something left.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Bests regards,=C2=A0</div><div dir=3D"auto"><b=
r></div><div data-smartmail=3D"gmail_signature" dir=3D"auto"><div dir=3D"lt=
r"><div>Yann CARDAILLAC,<br></div><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_at=
tr">Le ven. 25 avr. 2025 =C3=A0 23:53, Khem Raj via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Apr=
 25, 2025 at 8:13=E2=80=AFAM Hugo via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org=
</a><br>
&lt;fleuryhugo7=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Added tests and fixed the issue related to ${PYTHON_PN}.<br>
&gt;<br>
&gt; Signed-off-by: Hugo FLEURY &lt;<a href=3D"mailto:fleuryhugo7@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">fleuryhugo7@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-uvicorn/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-uvicorn_0.34.2.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">python3-uvicorn_0.34.2.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 +++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 43 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-u=
vicorn/run-ptest<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-uvicorn_0.34.2.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-uvicorn_0.34.2.bb</a><br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/run-p=
test b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d75b4cd4c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest<br=
>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +# based on the gunicorn ptest<br>
&gt; +echo &quot;nameserver 8.8.8.8&quot; &gt;&gt; /etc/resolv.conf<br>
&gt; +<br>
&gt; +pytest<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-uvicorn_0.34.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pyt=
hon3-uvicorn_0.34.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-uvicorn_0.34.2.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">python3-uvicorn_0.34.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cd2691a5ee<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uv=
icorn_0.34.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-uv=
icorn_0.34.2.bb</a><br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +SUMMARY =3D &quot;Lightning-fast ASGI server implementation.&quot;<br=
>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.uvicorn.org/" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://www.uvicorn.org/</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D5c778842f66a649636=
561c423c0eec2e&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0e929828f6186353a80b58ea719861d2629d7662=
93b6d19baf086ba31d4f3328&quot;<br>
&gt; +<br>
&gt; +inherit pypi python_hatchling python_setuptools_build_meta ptest<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://run-ptest&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; +=C2=A0 =C2=A0 python3-httptools \<br>
&gt; +=C2=A0 =C2=A0 python3-dotenv \<br>
<br>
<br>
I am seeing<br>
<br>
ERROR: Nothing RPROVIDES &#39;python3-dotenv&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/<a href=3D"http://python3-uvicorn_0.34.2.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python3-uvicorn_0.34.2.bb</a>=
<br>
RDEPENDS on or otherwise requires it)<br>
<br>
dotenv module is built via meta-virtualization, so perhaps its better<br>
to bring it to meta-python perhaps since meta-python does not depend<br>
on meta-virtualization.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 python3-httpx \<br>
&gt; +=C2=A0 =C2=A0 python3-pyyaml \<br>
&gt; +=C2=A0 =C2=A0 python3-websockets \<br>
&gt; +=C2=A0 =C2=A0 python3-a2wsgi \<br>
&gt; +=C2=A0 =C2=A0 python3-pytest-mock \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tes=
ts/<br>
&gt; +}<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;uvicorn&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 python3-typing-extensions \<br>
&gt; +=C2=A0 =C2=A0 python3-click \<br>
&gt; +=C2=A0 =C2=A0 python3-h11 \<br>
&gt; +=C2=A0 =C2=A0 python3-anyio \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/uvicorn-${PV}&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117137): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117137" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/117137</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112415221/975=
3132" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112415221/9753132</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yann.cardaill=
ac@gmail.com" target=3D"_blank" rel=3D"noreferrer">yann.cardaillac@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000047c080633ac873d--

