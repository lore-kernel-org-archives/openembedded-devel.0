Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187EFCAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 00:36:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3078.1758933392158443060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 17:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CTbcVVGc;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57db15eeb11so3411300e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 17:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758933390; x=1759538190; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FyM0N4lvhO8eeGgwjBv6qD1tYkZPaQnlQM/GVwqPK5w=;
        b=CTbcVVGcAJzM0tQ8C7w6k+fXagDF6XLx2FO8XUKRVh1daL1rdmylufdatV746oGu/6
         6Ey16Uz0v8APWl4s/laQ9yhyGA+CU0+ekkyQ4HH0oeX5gWRBs5EdnVZ8gxlfVrSnI9H7
         vyhiP1DOxRnaujN4DOqmmR0FUEzbeGVUnv7z/W9dByn3Gf6lYqqfRGOT7GhGigH2oFps
         FFLa02ol6M4DBPBlRt1z/1vLYmEFMikj+PukGc2kbevaeSciGQWNKWDJvDABLa7YGb1b
         k70nMWpr6p8ID/0bVSkooPzYJ20Lqjf0KyFacs4+ccRagertcvHO9NkWh0l361+4ePqM
         1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758933390; x=1759538190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyM0N4lvhO8eeGgwjBv6qD1tYkZPaQnlQM/GVwqPK5w=;
        b=PBH5tCHhXbwU1D2SNzSbyh9z83M4FUthRBijrs2rkW2vDrQSERftxLl+LoRHCPxG0i
         RWQKAkM18yeJ8+i9gD20DBUn3esCYiKuEqipAl4GE5S4R9dmh+auVWXOxYgnfJBiTxG+
         CKbfkKOdIc+3DA9VNF3tpS6UwuyYWKNTa2A5Ap9mz8aa2DniUMfOEuZYj6g7Wq7jk2eq
         m4wLOcfRuLlpVEuGLUIWuYPaqYDdfQoYLm9RY0V1V6yEMUs3+iYx1WimJKCc7j2NAhlp
         YNRSTEgClLB0NRXgs0mX+ewJIzAwblbXfAJ0H8ApOVYvqnmykEAbekAoyOdkW0aSWeNl
         mH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjk/WFKXfg3uuxLsqbvKgj0BOGyxWDFfc1DvsJIBQdqDJOXij3fHhRja3g1ThYNYnMtieiLhvQjXWHf6N70atITLQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyURGnOvpmK9NSfdnaG4tWSFsEWdJE8ndJ33Nvi9f/T15ENS6pk
	iMQZtZ9k5CkrzuNep7qFec4Px8xmQhBNRgwfg7sYXAMNwDl8YJHzC40mCcJl0NYvucZFkBwo1s0
	ZsCNvmARAFkyJuxwLSXcXl4nIqcywhb4=
X-Gm-Gg: ASbGncuKjU+hn0zPNt1xagwXK5o4XYgu4rr187/wB6rk45KKXVitb8gtE64WkgKIPJF
	s35r1m39wQL9jU3cy6ASXi+oQEhli/VSBZUoTkN/M0AxtoiMWn/qhj9zxtJdmzMOoHu/CazcTY9
	MOQLfKc2fNTqLqa73fe3DqDQPzUZI3GZtO0fFjSS0MB3hQhZrZjxbF+zd9M6Kgr8K+UTi1dTnoe
	envPeSsQtZKne/Zh8KXLzjqYEBnPwZMHnOgitij
X-Google-Smtp-Source: AGHT+IEMysQfGw7a5KOhg7tKFHoaM0hXZY6B9a1717K7RGUxzuf0yD18YOU3uO+bpIRLVK0cuPqGE15wkDlbCQqAsMY=
X-Received: by 2002:a05:6512:2249:b0:55f:4ac2:a597 with SMTP id
 2adb3069b0e04-582d092daa7mr3032987e87.7.1758933389894; Fri, 26 Sep 2025
 17:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
 <20250926081914.3127272-3-hongxu.jia@windriver.com> <daffd0b4-b729-4db7-b120-f79a832789d7@gmail.com>
In-Reply-To: <daffd0b4-b729-4db7-b120-f79a832789d7@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Sep 2025 17:36:18 -0700
X-Gm-Features: AS18NWDJtwCXlw0QZiGvP-uzJC1auVd8gLjV9ARDOr8YQFFa6zaKzLIDGgG_4PU
Message-ID: <CANx9H-BeOtDTnUSHTiCjXtDRRTC5N5818pZajpLLdU=ZmwQ_EQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v4 3/6] python3-yarl: support reproducibility
To: raj.khem@gmail.com
Cc: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e3682c063fbd97c9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 00:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119947

--000000000000e3682c063fbd97c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 10:12=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On 9/26/25 1:19 AM, hongxu via lists.openembedded.org wrote:
> > In order to make the generated library be reproducible, build wheel
> > in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> > option -fdebug-prefix-map could work as expected
> >
> > Note: To support reproducible, it also requires oe-core commit [1] to b=
e
> merged
> >
> > [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D61d98d12eca1c=
7bdf3b7387a820c83d3b8fad965
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   .../0001-build-wheel-in-place.patch           | 31 ++++++++++++++++++=
+
> >   .../python/python3-yarl_1.20.1.bb             |  4 +++
> >   2 files changed, 35 insertions(+)
> >   create mode 100644
> meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-plac=
e.patch
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-pl=
ace.patch
> b/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-pl=
ace.patch
> > new file mode 100644
> > index 0000000000..84f81da775
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-pl=
ace.patch
> > @@ -0,0 +1,31 @@
> > +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Wed, 17 Sep 2025 15:41:09 +0800
> > +Subject: [PATCH] build wheel in place
> > +
> > +In order to make the generated library be reproducible, build wheel
> > +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> > +option -fdebug-prefix-map could work as expected
> > +
> > +Upstream-Status: Pending
>
> same here, please submit it upstream


Agreed. See my comments in the other thread. Pending is just another way of
saying =E2=80=9Cnever=E2=80=9D.

>
>
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + packaging/pep517_backend/_backend.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/packaging/pep517_backend/_backend.py
> b/packaging/pep517_backend/_backend.py
> > +index 61cad34..d5d839e 100644
> > +--- a/packaging/pep517_backend/_backend.py
> > ++++ b/packaging/pep517_backend/_backend.py
> > +@@ -316,7 +316,7 @@ def build_wheel(
> > +     """
> > +     with maybe_prebuild_c_extensions(
> > +             line_trace_cython_when_unset=3DFalse,
> > +-            build_inplace=3DFalse,
> > ++            build_inplace=3DTrue,
> > +             config_settings=3Dconfig_settings,
> > +     ):
> > +         return _setuptools_build_wheel(
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> > index bbf9e3d782..6eedcf0f82 100644
> > --- a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> > @@ -9,6 +9,10 @@ PYPI_PACKAGE =3D "yarl"
> >
> >   inherit pypi ptest-python-pytest python_setuptools_build_meta cython
> >
> > +SRC_URI +=3D " \
> > +    file://0001-build-wheel-in-place.patch \
> > +"
> > +
> >   DEPENDS +=3D " \
> >       python3-expandvars-native \
> >   "
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119936):
> https://lists.openembedded.org/g/openembedded-devel/message/119936
> Mute This Topic: https://lists.openembedded.org/mt/115445262/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e3682c063fbd97c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 26, 2025 at 10:12=E2=80=AFA=
M Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<br>
<br>
On 9/26/25 1:19 AM, hongxu via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; In order to make the generated library be reproducible, build wheel<br=
>
&gt; in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain&#=
39;s<br>
&gt; option -fdebug-prefix-map could work as expected<br>
&gt; <br>
&gt; Note: To support reproducible, it also requires oe-core commit [1] to =
be merged<br>
&gt; <br>
&gt; [1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3D61d98d12eca1c7bdf3b7387a820c83d3b8fad965" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D61d98d=
12eca1c7bdf3b7387a820c83d3b8fad965</a><br>
&gt; <br>
&gt; Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.c=
om" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../0001-build-wheel-in-place.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-yarl_1.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-yarl_1.20.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++<br>
&gt;=C2=A0 =C2=A02 files changed, 35 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/python/pyt=
hon3-yarl/0001-build-wheel-in-place.patch<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-bui=
ld-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-yarl/=
0001-build-wheel-in-place.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..84f81da775<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-yarl/0001-build-whee=
l-in-place.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +Date: Wed, 17 Sep 2025 15:41:09 +0800<br>
&gt; +Subject: [PATCH] build wheel in place<br>
&gt; +<br>
&gt; +In order to make the generated library be reproducible, build wheel<b=
r>
&gt; +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain&=
#39;s<br>
&gt; +option -fdebug-prefix-map could work as expected<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
same here, please submit it upstream</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Agreed. See my comments in the other thread. Pending is=
 just another way of saying =E2=80=9Cnever=E2=80=9D.</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
<br>
&gt; +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + packaging/pep517_backend/_backend.py | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_=
backend/_backend.py<br>
&gt; +index 61cad34..d5d839e 100644<br>
&gt; +--- a/packaging/pep517_backend/_backend.py<br>
&gt; ++++ b/packaging/pep517_backend/_backend.py<br>
&gt; +@@ -316,7 +316,7 @@ def build_wheel(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0with maybe_prebuild_c_extensions(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line_trace_cython_whe=
n_unset=3DFalse,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_inplace=3DFalse,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_inplace=3DTrue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_settings=3Dcon=
fig_settings,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return _setuptools_build_wheel(<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-yarl_1.20.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.20=
.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-y=
arl_1.20.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.20.1.bb<=
/a><br>
&gt; index bbf9e3d782..6eedcf0f82 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ya=
rl_1.20.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.20.1.bb</=
a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ya=
rl_1.20.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-yarl_1.20.1.bb</=
a><br>
&gt; @@ -9,6 +9,10 @@ PYPI_PACKAGE =3D &quot;yarl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit pypi ptest-python-pytest python_setuptools_build_m=
eta cython<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://0001-build-wheel-in-place.patch \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-expandvars-native \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119936): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119936" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119936</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115445262/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/115445262/924729</a><br>
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

--000000000000e3682c063fbd97c9--

