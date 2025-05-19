Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B978BC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 14:34:34 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.52654.1747665271674274405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 07:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIh6dkLE;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2da3c572a0bso1770068fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747665271; x=1748270071; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=siZvljukhP3yIQ0vtdT++Obu0XdIDTHqZ3UUYtEBv2c=;
        b=KIh6dkLEBBgB3V9GsXLwnW6y+dyZYZH0l1kheg7G+XHB3O6vmzyF/fbty/l1orRDlF
         +i1SxtZkiZf95cvRmTPUsPVnziGyZBh8/e878Sl5tJKdzZBNJy+Ca1FD3sVG2k4+9r2l
         nMUbJ3ghyP8dYskXdQ4sw2oKUZiJYEaucwItNcb1zvMpJrouQ7kILFapWOI0bbwV+zXr
         1p8Vg+QWTcs5VpQiyNPtKJazHgPqQXITNGolp/5ko5ap/cGUkJG01L4IJVCJZzm9usI9
         9UjJKuncTRFMVRgtz4XF1eqXtG2UQKXZIKXl2Yuhbo15redRy/7vFtIeLiiww3VlDg/B
         bUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665271; x=1748270071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siZvljukhP3yIQ0vtdT++Obu0XdIDTHqZ3UUYtEBv2c=;
        b=PBQYTFEHBMx2GLB/X2pMP0zo/SjLeQAkqhRrL63sRDgTdf3gQAuUR1reWezxPcsEGC
         tVkXpgM51l5TbU79fcRDtO63GyVVcSJQSmvRt6a5v88K997RJ2yrSyLVGw74A6TaN+ui
         d0MoJVPZPVuTOikJOgsiSwCYXsbDmioB0qEPpI22dWkBwVCHhEKqn3vmQyk6w+ohWcpb
         1u+GVtBHBy1tdZzi2u/hy1SMY2EevowrWlFe0ndE6tN2aMIURUmLLVPpiRDu0sYsjFQI
         d+ZZ6ZZ3BMKhzeCXMVtf17nR02gkKFcKq1E8OlSg7F8bRhoi3B2dtINyeigMNYJVnRgB
         jbaQ==
X-Gm-Message-State: AOJu0Yx6xmzNrt32fW6DEVNU+7S+z1hmM+OHGyEgUaE3J4jy4dWdJVPE
	iNNyfrtJ7XVilN3DRqYHUZTpbOrTRzuuBvvv6g5tuEu2bAexmzUJ2iL0KvYNAHq5h2FB9EVFRR/
	xgGUApLJii6P9XLF0QU5grin20k5sUJw=
X-Gm-Gg: ASbGncukjhgkn5BGFUQEl+IzH4DNn7FQK4uG83YwOuKfGfMXY777m0VSMD45wcNkO3l
	y4ODVNFwqyoEuJXglHk1xRKVfSwH5M0COtTev8lpxE8R19BGXH5nT4ykA0Edm48Tf/FjdwzXjsb
	ozkkXS0VsboLpoVYnIz30geXL5OSiLRiXIckgavtKBij5vvNVzyposEqODwqWOWA6dNg==
X-Google-Smtp-Source: AGHT+IEKaJIq3rkOeZCutCxciGk/5bpLCsByLxbs/3+DjKnUvue8zwzlJzlnxOJlISl0OQSBBCEMMMBFqcFoF6CINY0=
X-Received: by 2002:a05:6870:891e:b0:2c7:6ad3:fe56 with SMTP id
 586e51a60fabf-2e3c1c253a7mr7875670fac.15.1747665270694; Mon, 19 May 2025
 07:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250518173309.3600728-1-raj.khem@gmail.com> <1840E09C179AB46A.6581@lists.openembedded.org>
 <CA+chaQekOt515auBiqy88AnyuYi+rmZ=ZBm1_Ez_kpv03PGMMA@mail.gmail.com>
In-Reply-To: <CA+chaQekOt515auBiqy88AnyuYi+rmZ=ZBm1_Ez_kpv03PGMMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 May 2025 07:34:19 -0700
X-Gm-Features: AX0GCFuAjfqupd8lhNlRjs5g7qS6qH2h9-s88K-OOBxIGJqeSZIt-RuhrfV66DM
Message-ID: <CAMKF1spi1LeaV5Au71UThy56BpWcXzSu7==wEiTGypp58ggCTg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-pandas: Upgrade to 2.2.3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5665f06357e073c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 14:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117478

--000000000000a5665f06357e073c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:59=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> On Mon, May 19, 2025 at 10:33=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hi,
> >
> > with this update I'm seeing:
> > ERROR: QA Issue: File
> >
> /usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-aarch=
64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
> > in package python3-pandas-src contains reference to TMPDIR
> > [buildpaths]
> >
> > Have you seen it as well or is it something specific to my setup?
>
> http://errors.yoctoproject.org/Errors/Details/855166/
>
> it's from:
> # grep core2
> /OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.2.3/package=
/usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-x86_64-=
linux-gnu.so.p/pandas/_libs/sparse.pyx.c
> #warning
> "/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.2.3/pandas=
-2.2.3/pandas/_libs/sparse.pyx:286:15:
> : __weakref__ is unsupported in the Limited API when running on Python
> <3.9."
> #pragma
> message("/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.2.=
3/pandas-2.2.3/pandas/_libs/sparse.pyx:286:15:
> : __weakref__ is unsupported in the Limited API when running on Python
> <3.9.")
>

I did not perhaps see it yet but it looks to be that we need to edit out
WORKDIR is it processed by cython

>
>
> >
> > On Sun, May 18, 2025 at 7:33=E2=80=AFPM Khem Raj via lists.openembedded=
.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > Fixes build with cython >=3D3.1
> > > Drop patch to pin numpy to 1.x
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...ion-to-specify-numpy-header-location.patch |  5 ----
> > >  ...Downgrade-numpy-version-needs-to-1.x.patch | 27 -----------------=
--
> > >  ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----
> > >  ...andas_2.2.2.bb =3D> python3-pandas_2.2.3.bb} |  3 +--
> > >  4 files changed, 4 insertions(+), 42 deletions(-)
> > >  delete mode 100644
> meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Do=
wngrade-numpy-version-needs-to-1.x.patch
> > >  rename meta-python/recipes-devtools/python/{python3-pandas_2.2.2.bb
> =3D> python3-pandas_2.2.3.bb} (87%)
> > >
> > > diff --git
> a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-=
to-specify-numpy-header-location.patch
> b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-=
to-specify-numpy-header-location.patch
> > > index 87023a24ec..e83576eb62 100644
> > > ---
> a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-=
to-specify-numpy-header-location.patch
> > > +++
> b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-=
to-specify-numpy-header-location.patch
> > > @@ -25,15 +25,10 @@ Signed-off-by: Gyorgy Sarvari <
> skandigraun@gmail.com>
> > >   2 files changed, 11 insertions(+), 3 deletions(-)
> > >   create mode 100644 meson.options
> > >
> > > -diff --git a/meson.options b/meson.options
> > > -new file mode 100644
> > > -index 0000000000..3d3a18d145
> > >  --- /dev/null
> > >  +++ b/meson.options
> > >  @@ -0,0 +1 @@
> > >  +option('numpy_inc_dir', type : 'string', description : 'The absolut=
e
> path to the numpy headers')
> > > -diff --git a/pandas/meson.build b/pandas/meson.build
> > > -index 435103a..a08c77a 100644
> > >  --- a/pandas/meson.build
> > >  +++ b/pandas/meson.build
> > >  @@ -3,17 +3,24 @@ incdir_numpy =3D run_command(py,
> > > diff --git
> a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
Downgrade-numpy-version-needs-to-1.x.patch
> b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
Downgrade-numpy-version-needs-to-1.x.patch
> > > deleted file mode 100644
> > > index b0ef8ce00c..0000000000
> > > ---
> a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
Downgrade-numpy-version-needs-to-1.x.patch
> > > +++ /dev/null
> > > @@ -1,27 +0,0 @@
> > > -From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:00 20=
01
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Sat, 24 Aug 2024 10:21:43 -0700
> > > -Subject: [PATCH] pyproject.toml: Downgrade numpy version needs to 1.=
x
> > > -
> > > -Drop it when numpy is upgraded to 2.x or newer in core
> > > -
> > > -Upstream-Status: Inappropriate [OE workaround]
> > > -
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - pyproject.toml | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/pyproject.toml b/pyproject.toml
> > > -index 5158d60..d3daa78 100644
> > > ---- a/pyproject.toml
> > > -+++ b/pyproject.toml
> > > -@@ -8,7 +8,7 @@ requires =3D [
> > > -     "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml
> and asv.conf.json
> > > -     # Force numpy higher than 2.0rc1, so that built wheels are
> compatible
> > > -     # with both numpy 1 and 2
> > > --    "numpy>=3D2.0.0rc1",
> > > -+    "numpy>=3D1.24.0",
> > > -     "versioneer[toml]"
> > > - ]
> > > -
> > > diff --git
> a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
don-t-pin-dependency-versions.patch
> b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
don-t-pin-dependency-versions.patch
> > > index f60f43a5b0..950f25303f 100644
> > > ---
> a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
don-t-pin-dependency-versions.patch
> > > +++
> b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-=
don-t-pin-dependency-versions.patch
> > > @@ -14,8 +14,6 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.co=
m
> >
> > >   pyproject.toml | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > -diff --git a/pyproject.toml b/pyproject.toml
> > > -index db9f055799..5158d60f59 100644
> > >  --- a/pyproject.toml
> > >  +++ b/pyproject.toml
> > >  @@ -2,10 +2,10 @@
> > > @@ -27,11 +25,8 @@ index db9f055799..5158d60f59 100644
> > >  +    "meson-python>=3D0.13.1",
> > >  +    "meson>=3D1.2.1",
> > >       "wheel",
> > > --    "Cython=3D=3D3.0.5",  # Note: sync with setup.py, environment.y=
ml
> and asv.conf.json
> > > +-    "Cython~=3D3.0.5",  # Note: sync with setup.py, environment.yml
> and asv.conf.json
> > >  +    "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml
> and asv.conf.json
> > > -     # Force numpy higher than 2.0rc1, so that built wheels are
> compatible
> > > +     # Force numpy higher than 2.0, so that built wheels are
> compatible
> > >       # with both numpy 1 and 2
> > > -     "numpy>=3D2.0.0rc1",
> > > ---
> > > -2.39.2
> > > -
> > > +     "numpy>=3D2.0",
> > > diff --git a/meta-python/recipes-devtools/python/
> python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/
> python3-pandas_2.2.3.bb
> > > similarity index 87%
> > > rename from meta-python/recipes-devtools/python/
> python3-pandas_2.2.2.bb
> > > rename to meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> > > index b956f5ca2f..3e41e4aa6f 100644
> > > --- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> > > @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dcb819092901ddb13a7d0a4f5e05f098a"
> > >
> > >  SRC_URI +=3D " \
> > >
> file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
> > > -
> file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
> > >              "
> > >
> > >  SRC_URI:append:class-target =3D "
> file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
> > >
> > > -SRC_URI[sha256sum] =3D
> "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
> > > +SRC_URI[sha256sum] =3D
> "4f18ba62b61d7e192368b84517265a99b4d7ee8912f8708660fb4a366cc82667"
> > >
> > >  inherit pkgconfig pypi python_mesonpy cython
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117474):
> https://lists.openembedded.org/g/openembedded-devel/message/117474
> > Mute This Topic: https://lists.openembedded.org/mt/113179377/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a5665f06357e073c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, May 19, 2025 at 1:59=E2=80=AFAM=
 Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, May =
19, 2025 at 10:33=E2=80=AFAM Martin Jansa via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; with this update I&#39;m seeing:<br>
&gt; ERROR: QA Issue: File<br>
&gt; /usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-aa=
rch64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c<br>
&gt; in package python3-pandas-src contains reference to TMPDIR<br>
&gt; [buildpaths]<br>
&gt;<br>
&gt; Have you seen it as well or is it something specific to my setup?<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/855166/" rel=3D"no=
referrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/8=
55166/</a><br>
<br>
it&#39;s from:<br>
# grep core2 /OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.=
2.3/package/usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-=
313-x86_64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c<br>
#warning &quot;/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/=
2.2.3/pandas-2.2.3/pandas/_libs/sparse.pyx:286:15:<br>
: __weakref__ is unsupported in the Limited API when running on Python<br>
&lt;3.9.&quot;<br>
#pragma message(&quot;/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-=
pandas/2.2.3/pandas-2.2.3/pandas/_libs/sparse.pyx:286:15:<br>
: __weakref__ is unsupported in the Limited API when running on Python<br>
&lt;3.9.&quot;)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I did not perhap=
s see it yet but it looks to be that we need to edit out WORKDIR is it proc=
essed by cython=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt;<br>
&gt; On Sun, May 18, 2025 at 7:33=E2=80=AFPM Khem Raj via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&gt; &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Fixes build with cython &gt;=3D3.1<br>
&gt; &gt; Drop patch to pin numpy to 1.x<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...ion-to-specify-numpy-header-location.patch |=C2=A0 5 ---=
-<br>
&gt; &gt;=C2=A0 ...Downgrade-numpy-version-needs-to-1.x.patch | 27 --------=
-----------<br>
&gt; &gt;=C2=A0 ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----=
<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://andas_2.2.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">andas_2.2.2.bb</a> =3D&gt; <a href=3D"http://python3-pandas_=
2.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pandas_2.2.3.bb</a>}=
 |=C2=A0 3 +--<br>
&gt; &gt;=C2=A0 4 files changed, 4 insertions(+), 42 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pyth=
on3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch<b=
r>
&gt; &gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http=
://python3-pandas_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pa=
ndas_2.2.2.bb</a> =3D&gt; <a href=3D"http://python3-pandas_2.2.3.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pandas_2.2.3.bb</a>} (87%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-pandas/0=
001-BLD-add-option-to-specify-numpy-header-location.patch b/meta-python/rec=
ipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-he=
ader-location.patch<br>
&gt; &gt; index 87023a24ec..e83576eb62 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD=
-add-option-to-specify-numpy-header-location.patch<br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD=
-add-option-to-specify-numpy-header-location.patch<br>
&gt; &gt; @@ -25,15 +25,10 @@ Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"=
mailto:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&g=
t;<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 11 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meson.options<br>
&gt; &gt;<br>
&gt; &gt; -diff --git a/meson.options b/meson.options<br>
&gt; &gt; -new file mode 100644<br>
&gt; &gt; -index 0000000000..3d3a18d145<br>
&gt; &gt;=C2=A0 --- /dev/null<br>
&gt; &gt;=C2=A0 +++ b/meson.options<br>
&gt; &gt;=C2=A0 @@ -0,0 +1 @@<br>
&gt; &gt;=C2=A0 +option(&#39;numpy_inc_dir&#39;, type : &#39;string&#39;, d=
escription : &#39;The absolute path to the numpy headers&#39;)<br>
&gt; &gt; -diff --git a/pandas/meson.build b/pandas/meson.build<br>
&gt; &gt; -index 435103a..a08c77a 100644<br>
&gt; &gt;=C2=A0 --- a/pandas/meson.build<br>
&gt; &gt;=C2=A0 +++ b/pandas/meson.build<br>
&gt; &gt;=C2=A0 @@ -3,17 +3,24 @@ incdir_numpy =3D run_command(py,<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-pandas/0=
001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch b/meta-python=
/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy=
-version-needs-to-1.x.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index b0ef8ce00c..0000000000<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyp=
roject.toml-Downgrade-numpy-version-needs-to-1.x.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,27 +0,0 @@<br>
&gt; &gt; -From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; -Date: Sat, 24 Aug 2024 10:21:43 -0700<br>
&gt; &gt; -Subject: [PATCH] pyproject.toml: Downgrade numpy version needs t=
o 1.x<br>
&gt; &gt; -<br>
&gt; &gt; -Drop it when numpy is upgraded to 2.x or newer in core<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Inappropriate [OE workaround]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - pyproject.toml | 2 +-<br>
&gt; &gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; &gt; -index 5158d60..d3daa78 100644<br>
&gt; &gt; ---- a/pyproject.toml<br>
&gt; &gt; -+++ b/pyproject.toml<br>
&gt; &gt; -@@ -8,7 +8,7 @@ requires =3D [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&quot;Cython&gt;=3D3.0.5&quot;,=C2=A0 # Note=
: sync with setup.py, environment.yml and asv.conf.json<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Force numpy higher than 2.0rc1, so that bu=
ilt wheels are compatible<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# with both numpy 1 and 2<br>
&gt; &gt; --=C2=A0 =C2=A0 &quot;numpy&gt;=3D2.0.0rc1&quot;,<br>
&gt; &gt; -+=C2=A0 =C2=A0 &quot;numpy&gt;=3D1.24.0&quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&quot;versioneer[toml]&quot;<br>
&gt; &gt; - ]<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-pandas/0=
001-pyproject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipe=
s-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-v=
ersions.patch<br>
&gt; &gt; index f60f43a5b0..950f25303f 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyp=
roject.toml-don-t-pin-dependency-versions.patch<br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyp=
roject.toml-don-t-pin-dependency-versions.patch<br>
&gt; &gt; @@ -14,8 +14,6 @@ Signed-off-by: Trevor Gamblin &lt;<a href=3D"ma=
ilto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;=
<br>
&gt; &gt;=C2=A0 =C2=A0pyproject.toml | 6 +++---<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; -diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; &gt; -index db9f055799..5158d60f59 100644<br>
&gt; &gt;=C2=A0 --- a/pyproject.toml<br>
&gt; &gt;=C2=A0 +++ b/pyproject.toml<br>
&gt; &gt;=C2=A0 @@ -2,10 +2,10 @@<br>
&gt; &gt; @@ -27,11 +25,8 @@ index db9f055799..5158d60f59 100644<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 &quot;meson-python&gt;=3D0.13.1&quot;,<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 &quot;meson&gt;=3D1.2.1&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;wheel&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 &quot;Cython=3D=3D3.0.5&quot;,=C2=A0 # Note: sync=
 with setup.py, environment.yml and asv.conf.json<br>
&gt; &gt; +-=C2=A0 =C2=A0 &quot;Cython~=3D3.0.5&quot;,=C2=A0 # Note: sync w=
ith setup.py, environment.yml and asv.conf.json<br>
&gt; &gt;=C2=A0 +=C2=A0 =C2=A0 &quot;Cython&gt;=3D3.0.5&quot;,=C2=A0 # Note=
: sync with setup.py, environment.yml and asv.conf.json<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Force numpy higher than 2.0rc1, so that bu=
ilt wheels are compatible<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Force numpy higher than 2.0, so that built=
 wheels are compatible<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# with both numpy 1 and 2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0&quot;numpy&gt;=3D2.0.0rc1&quot;,<br>
&gt; &gt; ---<br>
&gt; &gt; -2.39.2<br>
&gt; &gt; -<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;numpy&gt;=3D2.0&quot;,<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pandas_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pan=
das_2.2.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-pandas_2.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pandas_=
2.2.3.bb</a><br>
&gt; &gt; similarity index 87%<br>
&gt; &gt; rename from meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-pandas_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pand=
as_2.2.2.bb</a><br>
&gt; &gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-pandas_2.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pandas=
_2.2.3.bb</a><br>
&gt; &gt; index b956f5ca2f..3e41e4aa6f 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pandas_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pandas_2.2=
.2.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pandas_2.2.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pandas_2.2=
.3.bb</a><br>
&gt; &gt; @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=
=3Dcb819092901ddb13a7d0a4f5e05f098a&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pypro=
ject.toml-don-t-pin-dependency-versions.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pyproject.=
toml-Downgrade-numpy-version-needs-to-1.x.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI:append:class-target =3D &quot; file://0001-BLD-add-=
option-to-specify-numpy-header-location.patch &quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;9e79019aba43cb4fda9e4d983f8e88ca037=
3adbb697ae9c6c43093218de28b54&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;4f18ba62b61d7e192368b84517265a99b4d=
7ee8912f8708660fb4a366cc82667&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit pkgconfig pypi python_mesonpy cython<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#117474): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/117474" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/117474</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11317937=
7/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/113179377/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a5665f06357e073c--

