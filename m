Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0C2EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 19:47:19 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.4062.1690228033178499813
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 12:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=llSgF7SG;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-57045429f76so56268617b3.0
        for <Openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 12:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690228032; x=1690832832;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwEIZzldFOD9IlYFHNF949rGWe4cpDUv98LUY2RZZl0=;
        b=llSgF7SGxEe5+lCdyzarwEyC1RKpmMATneksWyHLGEGvYKxcxgodQv8mgPkNEuftM8
         VvzoymaOmsQvHD56aXTCZgfIrooOqg3Fwr/FB/sWflvxgdYCjc6eTdO3TG3PTNYv1KlU
         gBMVJ4E8Mw1wD3PmCtt9CjfMJZr+wQxtERGMI1X2ytB2AoF6s2Xct4yJzBWxXJCXW2xc
         UzjQ6+VvlwUWDGjBmITNqYZZmu42cufpapFdSaeSgG9bPHtbAYBlg0ugCyx45MhHA4Ch
         RqOyF4TYCjVNBIwFOmEk+hi8LvbZu8muQIWGMrJ8Gexkz+9cG1ngPBK4d2UwDEtUQNBU
         E5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690228032; x=1690832832;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwEIZzldFOD9IlYFHNF949rGWe4cpDUv98LUY2RZZl0=;
        b=V3BpFJS950C+1MYfRLVJGOVVlvWKyINgaqRQX5ClyOxKu1LofgL7kTw75nJFwUYlhX
         eYmpHcpE20j9rw1zku58KlTwSgBM/WnD0KC0e36YCkLXspYA1W3oPF60QNNUEKo1f7h0
         L1ISaZ2jBf1oon7uxqWUA8XLiUUXRUNz22ZMZXqtJ8SC9/nne1ds/+GqEBtTT4gzVQtD
         Z46F6eUcg84lTTMvLuwQ++S5oyarc+OKmjQ5rcK2II5LnOVL5S6IWLI/adGlM3XqYQnh
         UWBA8hZBzT0OP3d/tsix5B4jV6n3VV2tLeuX6BF8rU+YRUJO1aAKkTfQMtSeoYAzH/ex
         FIuA==
X-Gm-Message-State: ABy/qLYyTMRbOO26Gf4AZt+yoG/QwqZ77d4/0nGcx4b72cF1hhg5hQNy
	8D6QV0phWThOArh8ILmSK5aNmDrWOwFDLHq+Mpo=
X-Google-Smtp-Source: APBJJlEscRRspcWlRsLqVzPBAI/n9WEZPTz1BPQ07RiZN59g9FdrjigAzw0o+QfBvPXWNSY4U6Khk2b+K8y6d4yT6x4=
X-Received: by 2002:a0d:df4a:0:b0:583:7b48:ed8f with SMTP id
 i71-20020a0ddf4a000000b005837b48ed8fmr8570507ywe.9.1690228031962; Mon, 24 Jul
 2023 12:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230724165848.3294-1-tgamblin@baylibre.com> <1774E3E404BBDB64.23395@lists.openembedded.org>
 <ZL7RZRDe0Zpx7fQS@ravine.members.linode.com>
In-Reply-To: <ZL7RZRDe0Zpx7fQS@ravine.members.linode.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 24 Jul 2023 12:47:01 -0700
Message-ID: <CANx9H-Dai=1oHzoegfPsfztBUP8JaSsaJ6COwbhOW02qZ83N_w@mail.gmail.com>
Subject: Re: [oe] python3-mypy, python3-mypy-extensions: remove
To: Justin Bronder <jsbronder@cold-front.org>, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006f44fa060140e151"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 19:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104003

--0000000000006f44fa060140e151
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 12:30 PM Justin Bronder <jsbronder@cold-front.org>
wrote:

> On 24/07/23 15:18 -0400, Justin Bronder wrote:
> > On 24/07/23 12:58 -0400, Trevor Gamblin wrote:
> > > While attempting to upgrade mypy and mypy-extensions, it was discover=
ed
> > > that it depends on new modules, some of which have no maintenance pla=
n
> > > in place, e.g.: https://pypi.org/project/types-typed-ast/
> >
> > That dependency has been dropped upstream as part of removing support
> for python
> > 3.7 [1].  If there's other other problematic recipes, I think it'd be
> beneficial
> > to have a type checker for python available.
> >
> > 1.
> https://github.com/python/mypy/commit/2edaf35ec1f91c139dfe1930b1b0d1e1cac=
59599
>
> 1.5 looks like it'll be released soon.  If there's interested in keeping
> mypy
> around, I'll volunteer to try to package it then.
>
> https://github.com/python/mypy/issues/15588
>

That=E2=80=99s much appreciated. We can hold off on the deletion then. Plen=
ty of
whack-a-mole to go yet.


> >
> >
> > >
> > > Since this is something we want to avoid adding to the ecosystem and
> > > mypy isn't a dependency for anything else in meta-python, remove the
> > > recipes.
> > >
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ---
> > > v2 removes the recipes from the packagegroup as well.
> > >
> > >  .../packagegroups/packagegroup-meta-python.bb |  2 --
> > >  .../python/python3-mypy-extensions_0.4.3.bb   | 12 ----------
> > >  .../python/python3-mypy_0.971.bb              | 23
> -------------------
> > >  3 files changed, 37 deletions(-)
> > >  delete mode 100644 meta-python/recipes-devtools/python/
> python3-mypy-extensions_0.4.3.bb
> > >  delete mode 100644 meta-python/recipes-devtools/python/
> python3-mypy_0.971.bb
> > >
> > > diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > index b23d24c6d4..c12d475047 100644
> > > --- a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > +++ b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > @@ -245,8 +245,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
> > >      python3-msk \
> > >      python3-msm \
> > >      python3-multidict \
> > > -    python3-mypy \
> > > -    python3-mypy-extensions \
> > >      python3-natsort \
> > >      python3-netaddr \
> > >      python3-netifaces \
> > > diff --git a/meta-python/recipes-devtools/python/
> python3-mypy-extensions_0.4.3.bb b/meta-python/recipes-devtools/python/
> python3-mypy-extensions_0.4.3.bb
> > > deleted file mode 100644
> > > index 83ac5362d6..0000000000
> > > --- a/meta-python/recipes-devtools/python/
> python3-mypy-extensions_0.4.3.bb
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -SUMMARY =3D "Experimental type system extensions for programs checke=
d
> with the mypy typechecker"
> > > -HOMEPAGE =3D "https://github.com/python/mypy_extensions"
> > > -LICENSE =3D "MIT"
> > > -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D0fe3219e2470a78c0d1837019b8b426e"
> > > -
> > > -PYPI_PACKAGE =3D "mypy_extensions"
> > > -
> > > -inherit pypi setuptools3
> > > -
> > > -SRC_URI[sha256sum] =3D
> "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
> > > -
> > > -BBCLASSEXTEND =3D "native"
> > > diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.b=
b
> b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
> > > deleted file mode 100644
> > > index 31fcb06c9e..0000000000
> > > --- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
> > > +++ /dev/null
> > > @@ -1,23 +0,0 @@
> > > -SUMMARY =3D "Optional static typing for Python 3 and 2 (PEP 484)"
> > > -HOMEPAGE =3D "https://github.com/python/mypy"
> > > -LICENSE =3D "MIT & Python-2.0"
> > > -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D6ba8ec528da02073b7e1f4124c0f836f"
> > > -
> > > -PYPI_PACKAGE =3D "mypy"
> > > -
> > > -inherit pypi python_setuptools_build_meta
> > > -
> > > -SRC_URI[sha256sum] =3D
> "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
> > > -
> > > -BBCLASSEXTEND =3D "native"
> > > -
> > > -RDEPENDS:${PN} +=3D " \
> > > -    ${PYTHON_PN}-mypy-extensions \
> > > -    ${PYTHON_PN}-typed-ast \
> > > -    ${PYTHON_PN}-typing-extensions \
> > > -    ${PYTHON_PN}-json \
> > > -    ${PYTHON_PN}-compression \
> > > -    ${PYTHON_PN}-pprint \
> > > -    ${PYTHON_PN}-difflib \
> > > -    ${PYTHON_PN}-toml \
> > > -"
> > > --
> > > 2.41.0
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Justin Bronder
>
> >
> >
> >
>
>
> --
> Justin Bronder
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104001):
> https://lists.openembedded.org/g/openembedded-devel/message/104001
> Mute This Topic: https://lists.openembedded.org/mt/100336398/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006f44fa060140e151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 24, 2023 at 12:30 PM Justin Bronder &lt;<a href=
=3D"mailto:jsbronder@cold-front.org">jsbronder@cold-front.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 24/07/23 15:18 -0400, Justin B=
ronder wrote:<br>
&gt; On 24/07/23 12:58 -0400, Trevor Gamblin wrote:<br>
&gt; &gt; While attempting to upgrade mypy and mypy-extensions, it was disc=
overed<br>
&gt; &gt; that it depends on new modules, some of which have no maintenance=
 plan<br>
&gt; &gt; in place, e.g.: <a href=3D"https://pypi.org/project/types-typed-a=
st/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/types-ty=
ped-ast/</a><br>
&gt; <br>
&gt; That dependency has been dropped upstream as part of removing support =
for python<br>
&gt; 3.7 [1].=C2=A0 If there&#39;s other other problematic recipes, I think=
 it&#39;d be beneficial<br>
&gt; to have a type checker for python available.<br>
&gt; <br>
&gt; 1. <a href=3D"https://github.com/python/mypy/commit/2edaf35ec1f91c139d=
fe1930b1b0d1e1cac59599" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/python/mypy/commit/2edaf35ec1f91c139dfe1930b1b0d1e1cac59599</a><br>
<br>
1.5 looks like it&#39;ll be released soon.=C2=A0 If there&#39;s interested =
in keeping mypy<br>
around, I&#39;ll volunteer to try to package it then.<br>
<br>
<a href=3D"https://github.com/python/mypy/issues/15588" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/python/mypy/issues/15588</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s m=
uch appreciated. We can hold off on the deletion then. Plenty of whack-a-mo=
le to go yet.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Since this is something we want to avoid adding to the ecosystem =
and<br>
&gt; &gt; mypy isn&#39;t a dependency for anything else in meta-python, rem=
ove the<br>
&gt; &gt; recipes.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bayl=
ibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2 removes the recipes from the packagegroup as well.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-meta-pytho=
n.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> =
|=C2=A0 2 --<br>
&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-mypy-extensions_0.4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy-extensions_0.4.3.bb</=
a>=C2=A0 =C2=A0| 12 ----------<br>
&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-mypy_0.971.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-mypy_0.971.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 -------------------<br>
&gt; &gt;=C2=A0 3 files changed, 37 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-mypy-extensions_0.4.3.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-mypy-extensions_0.4.3.bb</a><br>
&gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-mypy_0.971.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-mypy_0.971.bb</a><br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"ht=
tp://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">pack=
agegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a hre=
f=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blan=
k">packagegroup-meta-python.bb</a><br>
&gt; &gt; index b23d24c6d4..c12d475047 100644<br>
&gt; &gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegrou=
p-meta-python.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegrou=
p-meta-python.bb</a><br>
&gt; &gt; @@ -245,8 +245,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;=
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-msk \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-msm \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-multidict \<br>
&gt; &gt; -=C2=A0 =C2=A0 python3-mypy \<br>
&gt; &gt; -=C2=A0 =C2=A0 python3-mypy-extensions \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-natsort \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-netaddr \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-netifaces \<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-mypy-extensions_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-mypy-extensions_0.4.3.bb</a> b/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-mypy-extensions_0.4.3.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-mypy-extensions_0.4.3.bb</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 83ac5362d6..0000000000<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-mypy-extensions_0.4.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-m=
ypy-extensions_0.4.3.bb</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,12 +0,0 @@<br>
&gt; &gt; -SUMMARY =3D &quot;Experimental type system extensions for progra=
ms checked with the mypy typechecker&quot;<br>
&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/mypy_ext=
ensions" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/myp=
y_extensions</a>&quot;<br>
&gt; &gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0fe3219e2470a78c=
0d1837019b8b426e&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -PYPI_PACKAGE =3D &quot;mypy_extensions&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -inherit pypi setuptools3<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;2d82818f5bb3e369420cb3c4060a7970edb=
a416647068eb4c5343488a6c604a8&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-mypy_0.971.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_=
0.971.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-mypy_0.971.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_0.971.bb=
</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 31fcb06c9e..0000000000<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-mypy_0.971.bb" rel=3D"noreferrer" target=3D"_blank">python3-mypy_0.971.b=
b</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,23 +0,0 @@<br>
&gt; &gt; -SUMMARY =3D &quot;Optional static typing for Python 3 and 2 (PEP=
 484)&quot;<br>
&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/mypy" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/python/mypy</a>&quot;=
<br>
&gt; &gt; -LICENSE =3D &quot;MIT &amp; Python-2.0&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6ba8ec528da02073=
b7e1f4124c0f836f&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -PYPI_PACKAGE =3D &quot;mypy&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -inherit pypi python_setuptools_build_meta<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;40b0f21484238269ae6a57200c807d80deb=
c6459d444c0489a102d7c6a75fa56&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -RDEPENDS:${PN} +=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-mypy-extensions \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-typed-ast \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-typing-extensions \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-json \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-compression \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pprint \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-difflib \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-toml \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -- <br>
&gt; &gt; 2.41.0<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Justin Bronder<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Justin Bronder<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104001): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104001" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104001</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100336398/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100336398/924729</a><br>
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

--0000000000006f44fa060140e151--

