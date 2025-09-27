Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0008FCAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 00:32:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3039.1758933143004803689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 17:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBo0b/eG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5821dec0408so580011e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 17:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758933141; x=1759537941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHzEQ4DbL9yINc6efA/XkDpi/ma1Zjh06PJI5bMcUJE=;
        b=XBo0b/eGRXaICQmPg5GgYzy8uCNAzKS0f2doqlqQGa1RYbtOMGOVaJ0i8myQPpz+P8
         UrK7bjd3+JXCiAOiOmEplO7NWAtWEKjuRIk3bFpq2laQQMwB73jplkDUMXwe2U9Anp+I
         aKrjbCPcdyYULbGG9S1CKvfzQND0kJ2GnLcIGf30+4Ai4Hv1zidKYvW/+oY9JI8iQiGo
         agc97x/iTxfvPgRQ/0myI8yVSOZ9CZeMRRKhv96UsNTlQz3cJYPyX82hGdW5j9STv2mc
         EnH9tf0GaJgPZkBy0bgF1HVmtBoKCXnC8iVyyOpb12Tlud1D39V5pcRh9j8NwurdW4nW
         Xc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758933141; x=1759537941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHzEQ4DbL9yINc6efA/XkDpi/ma1Zjh06PJI5bMcUJE=;
        b=wywGrBds0UiXn2+Y2VhvV77/x82WUb8uDU27B89g+50nUFjenhTRn0yC4+IqUx3DU9
         6bpu5d/48EHlqK8+3obSKbSPzHJn4XoZkYTRGY1qHH7ChrZe8HU++EZqWZEuLFjk1Iuy
         LgTzoNlP7F7vKw0xO/Xi2kmnY3avlH6qoPSAu0l6z4n3rO/SAX/Op6CcQ6re9vMnDRds
         UoOh5g5A4WsPTMTsYQVA3rCEgmjXHn4baUyg525AE95VYvzT38xxOzpUqv8fGDDcILaT
         GFIYZsyZS6P2SGZ9HNnwRpjO9r90bE/RvFLFn+9aF/aPj9AKWp7DPGXYzzKr2x+sAgFD
         eStQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXGzcgCDYE5RFMvCfRYTkJj/kKRh7frYH/FnJKj4Z2LdkWtUY2e/s52L3YcWyGjs8ZHcAMCERR2HoAlOEz3hcFu38=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3OQ6o6iyy9aVAwvIBOMC9hpzT+6ZZzu91S/IRYISVdSbM2JCO
	Wvl81cHd/hX8RNC9iamohpdHnEEzR8mgaM22d7L1rsuhiaLJQk/8tEWDWRrad+0FarMO13dT9n+
	15ygVUQ542Cu4H+VV6tATLWlajtZ7N0E=
X-Gm-Gg: ASbGnctYFXLxm2ku4akzt8FMzM0Jft/kcqDgFlZpw+cjFbp66sHKiPJ9mmYc+2rj5x5
	tFRwalXPsuUXCIMaGMuVS0n6ciXOV7h4d/B14e+a33UzJbserSQzzKXYeBJwF7cMbRGobgTtn+p
	hibgprPOswENiQsZJFBITT5LvDdgM54733fLuOMSPomQoq1RUuVFxWf8fZntDzEpeBavUHvhkPQ
	d0hWdobhN32B41IktsjKFcpHtzPQTQfOzsjTM9ZL4mmRjCggD8=
X-Google-Smtp-Source: AGHT+IFFdlJqPgGsi2ug06uQYH4ucLhZtrWA5y0fOmD2HohiUcYdKzdsvHOXektMrxMVkPd1hBcim7H/DjbPrIs8GCw=
X-Received: by 2002:a05:6512:b0a:b0:57e:9865:d68a with SMTP id
 2adb3069b0e04-582d3e8295bmr3039488e87.52.1758933140776; Fri, 26 Sep 2025
 17:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
 <aa332d23-cdd4-4b05-a0da-6163941bc83f@gmail.com> <9F7AF82D-E0DC-43C7-9FB1-E81BAB3E24A5@arm.com>
In-Reply-To: <9F7AF82D-E0DC-43C7-9FB1-E81BAB3E24A5@arm.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Sep 2025 17:32:09 -0700
X-Gm-Features: AS18NWD3a5feu8rRDE7ZUQLeEgT_rEmoyeCMnnzIM31O-r6jGbbNs7_TYhmS6ig
Message-ID: <CANx9H-AB1=5DWrVQhqam5Jjy9=EMf2Upe-pccdtzqA-Y2gLisw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v4 1/6] python3-frozenlist: support reproducibility
To: ross.burton@arm.com
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000a32fa063fbd890e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 00:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119946

--0000000000000a32fa063fbd890e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 12:51=E2=80=AFPM Ross Burton via lists.openembedded=
.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Ooh I knew I remembered the frozenlist name from somewhere.
>
> FWIW, there=E2=80=99s an upstream ticket for this issue:
> https://github.com/aio-libs/frozenlist/issues/577.  And I filed
> https://github.com/aio-libs/yarl/issues/1551 which is related.
>
> Ross
>
> > On 26 Sep 2025, at 18:10, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On 9/26/25 1:19 AM, hongxu via lists.openembedded.org wrote:
> >> In order to make the generated library be reproducible, build wheel
> >> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> >> option -fdebug-prefix-map could work as expected


Thank you!

>
> >> Note: To support reproducibility, it also requires oe-core commit [1]
> to be merged
> >> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D61d98d12eca1c=
7bdf3b7387a820c83d3b8fad965
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>  .../0001-build-wheel-in-place.patch           | 31 ++++++++++++++++++=
+
> >>  .../python/python3-frozenlist_1.7.0.bb        |  3 ++
> >>  2 files changed, 34 insertions(+)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel-i=
n-place.patch
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel=
-in-place.patch
> b/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel=
-in-place.patch
> >> new file mode 100644
> >> index 0000000000..84f81da775
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel=
-in-place.patch
> >> @@ -0,0 +1,31 @@
> >> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 200=
1
> >> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Date: Wed, 17 Sep 2025 15:41:09 +0800
> >> +Subject: [PATCH] build wheel in place
> >> +
> >> +In order to make the generated library be reproducible, build wheel
> >> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain'=
s
> >> +option -fdebug-prefix-map could work as expected
> >> +
> >> +Upstream-Status: Pending


I agree with Khem. This is worth submitting upstream. Also, I would
STRONGLY advise we stop using =E2=80=9CPending=E2=80=9D. Let us do the work=
 to do an MVP
submission upstream and point to that. ANY kind of messaging upstream is a
step towards the right direction. The reason is we actually tend to never
follow through and submit. This will begin to bite us with the new world of
CRA.

>
> >
> > This is worth submitting upstream.
> >
> >> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +---
> >> + packaging/pep517_backend/_backend.py | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/packaging/pep517_backend/_backend.py
> b/packaging/pep517_backend/_backend.py
> >> +index 61cad34..d5d839e 100644
> >> +--- a/packaging/pep517_backend/_backend.py
> >> ++++ b/packaging/pep517_backend/_backend.py
> >> +@@ -316,7 +316,7 @@ def build_wheel(
> >> +     """
> >> +     with maybe_prebuild_c_extensions(
> >> +             line_trace_cython_when_unset=3DFalse,
> >> +-            build_inplace=3DFalse,
> >> ++            build_inplace=3DTrue,
> >> +             config_settings=3Dconfig_settings,
> >> +     ):
> >> +         return _setuptools_build_wheel(
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-frozenlist_1.7.0.bb b/meta-python/recipes-devtools/python/
> python3-frozenlist_1.7.0.bb
> >> index 7d813a026c..d832494c82 100644
> >> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> >> @@ -7,6 +7,9 @@ SRC_URI[sha256sum] =3D
> "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb
> >>    inherit pypi python_setuptools_build_meta cython
> >>  +SRC_URI +=3D " \
> >> +    file://0001-build-wheel-in-place.patch \
> >> +"
> >>  DEPENDS +=3D " \
> >>      python3-expandvars-native \
> >>  "
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119938):
> https://lists.openembedded.org/g/openembedded-devel/message/119938
> Mute This Topic: https://lists.openembedded.org/mt/115445260/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000a32fa063fbd890e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 26, 2025 at 12:51=E2=80=AFP=
M Ross Burton via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.=
org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
">Ooh I knew I remembered the frozenlist name from somewhere.<br>
<br>
FWIW, there=E2=80=99s an upstream ticket for this issue: <a href=3D"https:/=
/github.com/aio-libs/frozenlist/issues/577" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/aio-libs/frozenlist/issues/577</a>.=C2=A0 And I fi=
led <a href=3D"https://github.com/aio-libs/yarl/issues/1551" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/aio-libs/yarl/issues/1551</a> whi=
ch is related.<br>
<br>
Ross<br>
<br>
&gt; On 26 Sep 2025, at 18:10, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 9/26/25 1:19 AM, hongxu via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt;&gt; In order to make the generated library be reproducible, build whee=
l<br>
&gt;&gt; in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolcha=
in&#39;s<br>
&gt;&gt; option -fdebug-prefix-map could work as expected</blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thank you!</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
&gt;&gt; Note: To support reproducibility, it also requires oe-core commit =
[1] to be merged<br>
&gt;&gt; [1] <a href=3D"https://git.openembedded.org/openembedded-core/comm=
it/?id=3D61d98d12eca1c7bdf3b7387a820c83d3b8fad965" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D61=
d98d12eca1c7bdf3b7387a820c83d3b8fad965</a><br>
&gt;&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriv=
er.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../0001-build-wheel-in-place.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 31 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-frozenlist_1.7.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-frozenlist_1.7.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;&gt;=C2=A0 2 files changed, 34 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-frozenlist/0001-build-wheel-in-place.patch<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-frozenlis=
t/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/pyt=
hon3-frozenlist/0001-build-wheel-in-place.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..84f81da775<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-frozenlist/0001-=
build-wheel-in-place.patch<br>
&gt;&gt; @@ -0,0 +1,31 @@<br>
&gt;&gt; +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 17 Sep 2025 15:41:09 +0800<br>
&gt;&gt; +Subject: [PATCH] build wheel in place<br>
&gt;&gt; +<br>
&gt;&gt; +In order to make the generated library be reproducible, build whe=
el<br>
&gt;&gt; +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolch=
ain&#39;s<br>
&gt;&gt; +option -fdebug-prefix-map could work as expected<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending</blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I agree with Khem. This is worth submitting upstream. Als=
o, I would STRONGLY advise we stop using =E2=80=9CPending=E2=80=9D. Let us =
do the work to do an MVP submission upstream and point to that. ANY kind of=
 messaging upstream=C2=A0is a step towards the right direction. The reason =
is we actually tend to never follow through and submit. This will begin to =
bite us with the new world of CRA.</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt; <br>
&gt; This is worth submitting upstream.<br>
&gt; <br>
&gt;&gt; +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windri=
ver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + packaging/pep517_backend/_backend.py | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep=
517_backend/_backend.py<br>
&gt;&gt; +index 61cad34..d5d839e 100644<br>
&gt;&gt; +--- a/packaging/pep517_backend/_backend.py<br>
&gt;&gt; ++++ b/packaging/pep517_backend/_backend.py<br>
&gt;&gt; +@@ -316,7 +316,7 @@ def build_wheel(<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0with maybe_prebuild_c_extensions(<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line_trace_cython=
_when_unset=3DFalse,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_inplace=3DFalse,=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_inplace=3DTrue,<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_settings=
=3Dconfig_settings,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _setuptools_build_wheel(=
<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-frozenlist_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
frozenlist_1.7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-frozenlist_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-frozenlist_1.7.0.bb</a><br>
&gt;&gt; index 7d813a026c..d832494c82 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-frozenlist_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-frozenl=
ist_1.7.0.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-frozenlist_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-frozenl=
ist_1.7.0.bb</a><br>
&gt;&gt; @@ -7,6 +7,9 @@ SRC_URI[sha256sum] =3D &quot;2e310d81923c2437ea867=
0467121cc3e9b0f76d3043cc1d2331d56c7fb<br>
&gt;&gt;=C2=A0 =C2=A0 inherit pypi python_setuptools_build_meta cython<br>
&gt;&gt;=C2=A0 +SRC_URI +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0001-build-wheel-in-place.patch \<br>
&gt;&gt; +&quot;<br>
&gt;&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-expandvars-native \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119938): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119938" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119938</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115445260/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/115445260/924729</a><br>
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

--0000000000000a32fa063fbd890e--

