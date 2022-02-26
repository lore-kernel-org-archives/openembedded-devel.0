Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F5FC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 18:36:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.1590.1645900559322505565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CfmaGfe4;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id lw4so17010101ejb.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tl2KTrIgDRMXAl2QgbjhWqSOBZp+yN2yAUtnpQV5AGk=;
        b=CfmaGfe47nNUalwO878T5ajVH3LOdaC3IJKTvFNsKVndMMDZuVA0IismkyxIeHMvQB
         3QTTnxIUQCzHZ8E5hrzKkYvQei3uuJEUXFh0QFYQuUEVQeSN3xKHJTQYSBjfa5q0orh5
         OxtTNiXaVfnp7BjfCgunDV78ZGbVmi7pxaQgV2h9o8W2xurCNu5ZT2PrV9lYsUiCYThW
         XYOOjEm7ZyLyY/fLy2Hm+Qskp9AShlMOx7nqkIPgdF0gnijjq1Zn41E1pPz1jVMfN1pG
         wpcEfmU2XE5qAgqMV2zGQIq5D8FaxyQMZmuI07u0RvCk6Vay8ypkN7LUdzwCvf3hhUy0
         bGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tl2KTrIgDRMXAl2QgbjhWqSOBZp+yN2yAUtnpQV5AGk=;
        b=CdBmtZMnGybzGkG8seAIQ4D3sGUq3mBrhZf8DcL6sPely7m33LHHFn++63t43xFsjp
         G2lxywd1AeHXgkzkHEAHVVM5oEejLWdR/A3IWZcZBaXiKo3soWV5UYbi3egLqUyAYw+o
         48bN6QEZCFHOyUw6e+oJQkITUR3vw8JA9TqRBKtWmVRvplaLCKDH7oL/mD2pg+H7xJb3
         6DReXTz9NkmlWZ93atz37WgZIPyVfhVJXVeEol9s+S+GtGtgqTDh404u4lOZEYd7Yz8e
         k9P9qmWDNtBSWlCV0LUZSx704p1EbI+vCIlVjcYHq1VfwC8VUZZ/RFn5prNbtjKy8q3N
         M7mA==
X-Gm-Message-State: AOAM5326Pod9lCGhhYojnp3YGhAhcaChbouKZYte/Ja5cHgNjJbg+MgE
	qf+n4nz1j++tEatrBYm3iX7Ifmaubp3B/9gBti3q07iS9TM=
X-Google-Smtp-Source: 
 ABdhPJy90CVyj5RaIwBNvtF/wwoSYfLJdEYpXZxfpAzBzBqkpGE1wyDJg83avMs32KobDpOirNw4zkSYJ/C7287ea1U=
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr10192598eji.404.1645900557685; Sat, 26
 Feb 2022 10:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20220226041103.1398748-1-tim.orling@konsulko.com>
 <CAMKF1sqtNuo0O63HGrvx8duSFptS+kM=9gOuwuFhmnrj+=v3zw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqtNuo0O63HGrvx8duSFptS+kM=9gOuwuFhmnrj+=v3zw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Feb 2022 10:35:46 -0800
Message-ID: 
 <CANx9H-Ag9mVciNq2Ruaivep7Jemzvh35F-5KetGeHReDWWDi8w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twofish: drop recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000013952405d8f016bf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 18:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95551

--00000000000013952405d8f016bf
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 26, 2022 at 12:20 AM Khem Raj <raj.khem@gmail.com> wrote:

> it appears in dependencies of one another recipe in meta-python
>
> ERROR: Nothing RPROVIDES 'python3-twofish' (but
>
> /mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/python/
> python3-pyjks_20.0.0.bb
> RDEPENDS on or otherwise requires it


ok. Perhaps we can find a way to modify upstream to be able to build a
wheel.
My first guess is to change
"from distutils.core import setup, Extension"
To either use setuptools or the vendored setuptoools._distutils

This will probably turn into the next super pattern to build these old code
bases.


>
On Fri, Feb 25, 2022 at 8:11 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > The code has not been touched since 2013 and does not build with
> > bdist_wheel. If you depend upon this recipe, please work with upstream
> > to update the package to PEP-517 packaging.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  ...ng-return-statements-in-module-stubs.patch | 38 -------------------
> >  .../python/python3-twofish_0.3.0.bb           | 15 --------
> >  2 files changed, 53 deletions(-)
> >  delete mode 100644
> meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> >  delete mode 100644 meta-python/recipes-devtools/python/
> python3-twofish_0.3.0.bb
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> > deleted file mode 100644
> > index c25b2457e2..0000000000
> > ---
> a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From 5704610f4b3aed5210e9c5b7c05ff8b5b2364c9c Mon Sep 17 00:00:00 2001
> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> > -Date: Mon, 12 Aug 2019 08:18:21 +0000
> > -Subject: [PATCH] Fix missing return statements in module stubs
> > -
> > -* fixes build with -Werror=return-type
> > -  twofish.c: In function 'init_twofish':
> > -  twofish.c:45:1: error: control reaches end of non-void function
> [-Werror=return-type]
> > -     45 | PyMODINIT_FUNC init_twofish(void) { }
> > -        | ^~~~~~~~~~~~~~
> > -  twofish.c: In function 'PyInit__twofish':
> > -  twofish.c:46:1: error: control reaches end of non-void function
> [-Werror=return-type]
> > -     46 | PyMODINIT_FUNC PyInit__twofish(void) { }
> > -        | ^~~~~~~~~~~~~~
> > -  cc1: some warnings being treated as errors
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > -
> > -Upstream-Status: Submitted [
> https://github.com/keybase/python-twofish/pull/6]
> > ----
> > - twofish.c | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/twofish.c b/twofish.c
> > -index e324c34..d4487d8 100644
> > ---- a/twofish.c
> > -+++ b/twofish.c
> > -@@ -42,5 +42,5 @@ DL_EXPORT(void) exp_Twofish_decrypt(Twofish_key *
> xkey, uint8_t c[16], uint8_t p
> > - We need a stub init_twofish function so the module will link as a
> proper module.
> > - Do not import _twofish from python; it will not work since _twofish is
> not a *real* module
> > - */
> > --PyMODINIT_FUNC init_twofish(void) { }
> > --PyMODINIT_FUNC PyInit__twofish(void) { }
> > -+PyMODINIT_FUNC init_twofish(void) { return NULL; }
> > -+PyMODINIT_FUNC PyInit__twofish(void) { return NULL; }
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-python/recipes-devtools/python/
> python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/
> python3-twofish_0.3.0.bb
> > deleted file mode 100644
> > index 94fb71090e..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
> > -DESCRIPTION = "Bindings for the Twofish implementation by Niels
> Ferguson\
> > - libtwofish-dev."
> > -HOMEPAGE = "http://github.com/keybase/python-twofish"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
> > -
> > -SRC_URI +=
> "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
> > -
> > -SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
> > -SRC_URI[sha256sum] =
> "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
> > -
> > -inherit pypi setuptools3
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95537):
> https://lists.openembedded.org/g/openembedded-devel/message/95537
> > Mute This Topic: https://lists.openembedded.org/mt/89404719/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000013952405d8f016bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 26, 2022 at 12:20 AM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">it appears=
 in dependencies of one another recipe in meta-python<br>
<br>
ERROR: Nothing RPROVIDES &#39;python3-twofish&#39; (but<br>
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/py=
thon/<a href=3D"http://python3-pyjks_20.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-pyjks_20.0.0.bb</a><br>
RDEPENDS on or otherwise requires it</blockquote><div><br></div><div>ok. Pe=
rhaps we can find a way to modify upstream to be able to build a wheel.</di=
v><div>My first guess is to change=C2=A0</div><div>&quot;<span class=3D"gma=
il-pl-k" style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:12px;white-space:pre">from</span><span style=3D"color:rgb(36,4=
1,47);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Con=
solas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre;=
background-color:rgb(255,248,197)"> </span><span class=3D"gmail-pl-s1" styl=
e=3D"box-sizing:border-box;color:rgb(36,41,47);font-family:ui-monospace,SFM=
ono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,=
monospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl-token" st=
yle=3D"box-sizing:border-box">distutils</span></span><span style=3D"color:r=
gb(36,41,47);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Me=
nlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-spa=
ce:pre;background-color:rgb(255,248,197)">.</span><span class=3D"gmail-pl-s=
1" style=3D"box-sizing:border-box;color:rgb(36,41,47);font-family:ui-monosp=
ace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono=
&quot;,monospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl-to=
ken" style=3D"box-sizing:border-box">core</span></span><span style=3D"color=
:rgb(36,41,47);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,=
Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-s=
pace:pre;background-color:rgb(255,248,197)"> </span><span class=3D"gmail-pl=
-k" style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:12px;white-space:pre">import</span><span style=3D"color:rgb(36,41,4=
7);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consol=
as,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre;bac=
kground-color:rgb(255,248,197)"> </span><span class=3D"gmail-pl-s1" style=
=3D"box-sizing:border-box;color:rgb(36,41,47);font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:12px;white-space:pre"><span class=3D"gmail-pl-token" sty=
le=3D"box-sizing:border-box">setup</span></span><span style=3D"color:rgb(36=
,41,47);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pr=
e;background-color:rgb(255,248,197)">, </span><span class=3D"gmail-pl-v" st=
yle=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;=
SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-siz=
e:12px;white-space:pre"><span class=3D"gmail-pl-token" style=3D"box-sizing:=
border-box">Extension&quot;</span></span></div><div>To either use setuptool=
s or the vendored setuptoools._distutils=C2=A0</div><div><br></div><div>Thi=
s will probably turn into the next super pattern to build these old code ba=
ses.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
On Fri, Feb 25, 2022 at 8:11 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The code has not been touched since 2013 and does not build with<br>
&gt; bdist_wheel. If you depend upon this recipe, please work with upstream=
<br>
&gt; to update the package to PEP-517 packaging.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ng-return-statements-in-module-stubs.patch | 38 -------------=
------<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-twofish_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-twofish_0.3.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 --------<br>
&gt;=C2=A0 2 files changed, 53 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-t=
wofish/0001-Fix-missing-return-statements-in-module-stubs.patch<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-twofish_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-twofish_0.3.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-twofish/0001-=
Fix-missing-return-statements-in-module-stubs.patch b/meta-python/recipes-d=
evtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module=
-stubs.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c25b2457e2..0000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-mis=
sing-return-statements-in-module-stubs.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,38 +0,0 @@<br>
&gt; -From 5704610f4b3aed5210e9c5b7c05ff8b5b2364c9c Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 12 Aug 2019 08:18:21 +0000<br>
&gt; -Subject: [PATCH] Fix missing return statements in module stubs<br>
&gt; -<br>
&gt; -* fixes build with -Werror=3Dreturn-type<br>
&gt; -=C2=A0 twofish.c: In function &#39;init_twofish&#39;:<br>
&gt; -=C2=A0 twofish.c:45:1: error: control reaches end of non-void functio=
n [-Werror=3Dreturn-type]<br>
&gt; -=C2=A0 =C2=A0 =C2=A045 | PyMODINIT_FUNC init_twofish(void) { }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~<br>
&gt; -=C2=A0 twofish.c: In function &#39;PyInit__twofish&#39;:<br>
&gt; -=C2=A0 twofish.c:46:1: error: control reaches end of non-void functio=
n [-Werror=3Dreturn-type]<br>
&gt; -=C2=A0 =C2=A0 =C2=A046 | PyMODINIT_FUNC PyInit__twofish(void) { }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~<br>
&gt; -=C2=A0 cc1: some warnings being treated as errors<br>
&gt; -<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/keybase/pyt=
hon-twofish/pull/6" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/keybase/python-twofish/pull/6</a>]<br>
&gt; ----<br>
&gt; - twofish.c | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/twofish.c b/twofish.c<br>
&gt; -index e324c34..d4487d8 100644<br>
&gt; ---- a/twofish.c<br>
&gt; -+++ b/twofish.c<br>
&gt; -@@ -42,5 +42,5 @@ DL_EXPORT(void) exp_Twofish_decrypt(Twofish_key * x=
key, uint8_t c[16], uint8_t p<br>
&gt; - We need a stub init_twofish function so the module will link as a pr=
oper module.<br>
&gt; - Do not import _twofish from python; it will not work since _twofish =
is not a *real* module<br>
&gt; - */<br>
&gt; --PyMODINIT_FUNC init_twofish(void) { }<br>
&gt; --PyMODINIT_FUNC PyInit__twofish(void) { }<br>
&gt; -+PyMODINIT_FUNC init_twofish(void) { return NULL; }<br>
&gt; -+PyMODINIT_FUNC PyInit__twofish(void) { return NULL; }<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-twofish_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-twofish=
_0.3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-twofish_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-twofish_0=
.3.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 94fb71090e..0000000000<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-tw=
ofish_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-twofish_0.3.0.=
bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,15 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Bindings for the Twofish implementation by Niels Fe=
rguson&quot;<br>
&gt; -DESCRIPTION =3D &quot;Bindings for the Twofish implementation by Niel=
s Ferguson\<br>
&gt; - libtwofish-dev.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://github.com/keybase/python-twofis=
h" rel=3D"noreferrer" target=3D"_blank">http://github.com/keybase/python-tw=
ofish</a>&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D33a63abf6d7567b1689d8=
ce69f00e43b&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://0001-Fix-missing-return-statements-in-modul=
e-stubs.patch&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;d7d22f16dc4ffa0e3ae2200654033abe&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b09d8bb50d33b23ff34cafb1f9209f858f752935=
c6a5c901efb92a41acb830fa&quot;<br>
&gt; -<br>
&gt; -inherit pypi setuptools3<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95537): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95537" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95537</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89404719=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89404719/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000013952405d8f016bf--

