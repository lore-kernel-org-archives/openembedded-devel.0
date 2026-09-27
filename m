Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6811C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 23:20:34 +0000 (UTC)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47032.1790551233171484324
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 16:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eS59Kj7x;
 spf=pass (domain: gmail.com, ip: 74.125.224.168, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a886c555c5so13153077b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 16:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790551232; cv=none;
        d=google.com; s=arc-20260327;
        b=mle79L9U5FjzstNJ/7huKgZgGX7P9CePXv4DeJl46xK1ajoz9nmcGRjFnxpBWR7+lP
         /W0DKxpmHpb/gCKeFsrlWInb/4Q1WoCBvlE7HdwjRxCRQLJStfNHHAwPAn/Gp/j8dcTp
         O1Re6Q4FBfFUqyz23hDwMcN/vRlntbFibMqtjRIeSCjUugbFCs3nDFZuvyXQuKMtRuvf
         +GF2lRyfXOAnikABuRVwlLPVLIa6396l+0qu4/D4LmCEaaSw1f4jse3+r43dGA5sb0Tw
         ik4ledgXeYADN8p9YK98/Ke7D20bKfvL3u3XTdUva4ph66WKVF01Oh0VGhRRdVteBfBq
         HalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jGkQRyQx7ZLjI+ja+Remu2cpLoWjsR3qYOvvRLGN+B8=;
        fh=B8F3lforaWXqCOLcYLVP4hd84u8I8RwmQUzZM4ZNJEc=;
        b=akeKwObQfosgCAokkEXC1oiQQDWCptMusk3iwLwuBRLxzAeyaMXDFj5KoPMZND7FPz
         DvVFNOUUB2+NsSUVaLIs9a8iDptVJPIe7GGmOU74HGoVFQaZtuwVJOx+rcVtqRNNygsG
         Maa4B4EOtaVc9lY65ghP0qRgT2Lek8uDmjK0+OZcLH/TsyzH0O+oHsHkAZZMLgEr65DL
         +nAhCbG2Hv46lcX8n+l3heZfW8urlR6ppmOSPG/Rm8dk+RJzIA5IkqmX8cBnK5UTqYGI
         dUOWY9Wg0uJX368/4qhntuQQUaD2Mlz9vpMDYE7xdKTPw3bDxAx3HFm07t7d9HG1FPQx
         7Xcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790551232; x=1791156032; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGkQRyQx7ZLjI+ja+Remu2cpLoWjsR3qYOvvRLGN+B8=;
        b=eS59Kj7x1WnbnTDl5DSdkp/46bvp1iuDPnxJOmR7xosFqsorpFI7U+rHuKWPu8JnDS
         40SS3xPtTzYPeWjCqezDt2TAcYf8bMFYEKIRGzUTuSX7SqxGMQghKGsmTHlIg1o0KW6o
         vTK1rjOZQ1HCqLLRy9Ib0MKyUHqjfM5K/7TYz0hHwXh6RSURP9Hyht9TiP6Ls+AEubTy
         vJe9Jz4PemPcCrHi02R2Q18SKJQZCImQuG6mKBhxdx368r0LptS7sz4HJoL8lMkrHsEA
         w+4nirRqIwH5tMiX4DCEFOie61IqUwsUYV/d1dyshMY4GRe8zviHBC8aYCvy2nCK0RgN
         UOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790551232; x=1791156032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jGkQRyQx7ZLjI+ja+Remu2cpLoWjsR3qYOvvRLGN+B8=;
        b=GM2apFdlzjsD4i6xu1tkdyHplK/WHeElwxZK9LLZuTR5xxq1kLGonGfbfqgRPhXT0A
         EfftYkrShglbsgBo/3IV/W/VdeOdDd3hOUnleWqXWn3tS6IMi7FZwRAeDqhA3HvnMZ6H
         bh4ZZDasNvzXaYXdJrxjgEjRegB0MVcdlnEW+cZbk7K2rjO6gjSL1n0W3UFHfPercJtH
         g9G4GBCsP2jEyuQPeN6YFpG3loxVv1ofpk0ZCfkgw3n8tZbgiYhsq+qU306Gd0nS3vhU
         ucdCCI1/qSpAq2h0Az3OYeav0XaK0mMQVv1LfT7Wwap13098A7wbXf9NsbbhMWyS+oUj
         I2zw==
X-Gm-Message-State: AFq9FYJbObdOSBDlRQVIxbfYboUeEX8MdZPCRfHP8jfuubJlpMv8XDkw
	xaT+C2BiwM8AqqEZ+r7yHdKZeSL+ZS1wAdQgIJl/msVujtkIk5xJr3Iu1PgjOdAQI0TMe/42xbN
	6BfLWK8wBOefIe4QQ4LeIphdMzC6dx/KfAQ==
X-Gm-Gg: AYBFou062XdROTBN48cSZaL3RitOtPcH4DmTqWBbQFUqgzEX4GrUbK+iuGRVryw+AEB
	mKOwXNWKg/HmZim3o9e4/7rkqUkE+wfXMzyQRYbbH8Pa8A6Exa+ntFdPgRAWNl2N0sG/5Ozh8na
	YR6+ptI7ZqC1ZoDIsCwfVYqSKf3XS2Y6u2gLgormjaFwZyI/7uGkbbayH0ae8RiZBqAcrTkFvwh
	TwEPWCNS9AIGLxHuPAOVxSLqgL9hCq3DIFpW+/wy8ILpuPzc0uI9OnPtRr9tBF/zxZYi247C3W8
	nVUWTeypwSh+7l7L7Cxs7MIc+9VwCvN+/xREamwvY0NGO5TrsILbzvkER8f1biZ308AlZ7mNkaI
	E2v4QkAYSz7RoNIlDHzR7uRalL3fxLb1dIsqbXval290vPpyWdzuwaJlG3RTdbzcgf1xV/YGmvu
	aViTy3frbGuiBaPH9Rc79zm3y7Vf2uMhNLayytf011BAFClaAozbZyMD2gPLvpiK7D4tuGzuQhE
	/IdInNcZ0c7Ldo7omW3zWstKOnjVn9VbQBvb06x5vTTJWJULmJvBhLGNix2KHmsKdEnQsNgdLBJ
	PXhlVIPQ4qnCGn0zvJTmRuzIbcTLtdkmsn1sm/c1
X-Received: by 2002:a05:690e:c49:b0:675:331d:2600 with SMTP id
 956f58d0204a3-675331d2a20mr1693075d50.46.1790551232069; Sun, 27 Sep 2026
 16:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
 <20260927105002.1832451-27-ankur.tyagi85@gmail.com> <CAMKF1spx5aSzcn3+CGTQuqO-xRhB9QYemo_v_o5+i9xy_2GhUA@mail.gmail.com>
 <CADySD0EepB0Fy7+dt234maqiy9tBdcddC9_Ma9cfiN26QZVyjg@mail.gmail.com>
In-Reply-To: <CADySD0EepB0Fy7+dt234maqiy9tBdcddC9_Ma9cfiN26QZVyjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Sep 2026 16:20:05 -0700
X-Gm-Features: AclHuK80K1kyn1cMLfenIxFCjAGTHksgY6RBQFQunrjHY4qDSSpBu6LkYzEq_yY
Message-ID: <CAMKF1sq+MVmfgWOsLedrDKF2YJ068gQ8=bCECWdJLE1ghZKC5g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 27/35] pocketpy: upgrade 2.1.8 -> 2.2.0
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023c6e4065c7f3210"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 23:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130386

--00000000000023c6e4065c7f3210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:45=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:

> Hello Khem,
>
> I can only repro this error after applying following commit from
> master-next:
>
> https://github.com/openembedded/meta-openembedded/commit/201f3c95cca90220=
7c5f6ad25ca057e803921542
>
> Without the above commit, build succeeds without any QA warnings.
>
> Not sure if that commit is relevant anymore.
>

This was needed for build to avoid buildpaths and tmpdir in output
artifacts.


> cheers
> Ankur
>
> On Mon, Sep 28, 2026 at 8:52=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > This fails to build on AB
> >
> > |
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:
> In function 'time_sleep':
> > |
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9:
> error: implicit declaration of function 'c11_thrd__yield'
> [-Wimplicit-function-declaration]
> > |   112 |         c11_thrd__yield();
> > |       |         ^~~~~~~~~~~~~~~
> >
> >
> > For details see -
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1822/s=
teps/17/logs/stdio
> >
> > On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via lists.openembed=
ded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> Changelog:
> >> https://github.com/pocketpy/pocketpy/releases/tag/v2.2.0
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  .../pocketpy/{pocketpy_2.1.8.bb =3D> pocketpy_2.2.0.bb}           | 2=
 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.8.bb =3D>
> pocketpy_2.2.0.bb} (95%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> similarity index 95%
> >> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> >> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> index 910deba386..e4aca45ae8 100644
> >> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
> >> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.2.0.bb
> >> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
> >>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D224889df377610675315e194ac59276c"
> >>
> >>  SRC_URI =3D "git://
> github.com/pocketpy/pocketpy.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${=
PV}
> <http://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;branch=3Dmain;t=
ag=3Dv$%7BPV%7D>
> "
> >> -SRCREV =3D "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
> >> +SRCREV =3D "6cbece9ebc98c19fa2c189dc6963b421c22c40ae"
> >>
> >>
> >>  inherit cmake
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#130361):
> https://lists.openembedded.org/g/openembedded-devel/message/130361
> >> Mute This Topic: https://lists.openembedded.org/mt/121453680/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000023c6e4065c7f3210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 27,=
 2026 at 1:45=E2=80=AFPM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Khem,<br>
<br>
I can only repro this error after applying following commit from master-nex=
t:<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/commit/201f3c9=
5cca902207c5f6ad25ca057e803921542" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openembedded/meta-openembedded/commit/201f3c95cca902207c5f6=
ad25ca057e803921542</a><br>
<br>
Without the above commit, build succeeds without any QA warnings.<br>
<br>
Not sure if that commit is relevant anymore.<br></blockquote><div><br></div=
><div><span style=3D"background-color:transparent">This was needed for buil=
d to avoid </span>buildpaths<span style=3D"background-color:transparent"> a=
nd tmpdir in output artifacts.</span></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
cheers<br>
Ankur<br>
<br>
On Mon, Sep 28, 2026 at 8:52=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This fails to build on AB<br>
&gt;<br>
&gt; | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-p=
oky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c: In func=
tion &#39;time_sleep&#39;:<br>
&gt; | /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-p=
oky-linux/pocketpy/2.2.0/sources/pocketpy-2.2.0/src/modules/time.c:112:9: e=
rror: implicit declaration of function &#39;c11_thrd__yield&#39; [-Wimplici=
t-function-declaration]<br>
&gt; |=C2=A0 =C2=A0112 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c11_thrd__yield()=
;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~=
~~~~~~~~<br>
&gt;<br>
&gt;<br>
&gt; For details see - <a href=3D"https://autobuilder.yoctoproject.org/valk=
yrie/#/builders/81/builds/1822/steps/17/logs/stdio" rel=3D"noreferrer" targ=
et=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/b=
uilds/1822/steps/17/logs/stdio</a><br>
&gt;<br>
&gt; On Sun, Sep 27, 2026 at 3:51=E2=80=AFAM Ankur Tyagi via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Changelog:<br>
&gt;&gt; <a href=3D"https://github.com/pocketpy/pocketpy/releases/tag/v2.2.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/pocketpy/pocketp=
y/releases/tag/v2.2.0</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gma=
il.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../pocketpy/{<a href=3D"http://pocketpy_2.1.8.bb" rel=3D"no=
referrer" target=3D"_blank">pocketpy_2.1.8.bb</a> =3D&gt; <a href=3D"http:/=
/pocketpy_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-devtools/pocketpy/{<a href=3D"http://=
pocketpy_2.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</=
a> =3D&gt; <a href=3D"http://pocketpy_2.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">pocketpy_2.2.0.bb</a>} (95%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://p=
ocketpy_2.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a=
> b/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy_2.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a><br>
&gt;&gt; similarity index 95%<br>
&gt;&gt; rename from meta-oe/recipes-devtools/pocketpy/<a href=3D"http://po=
cketpy_2.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a>=
<br>
&gt;&gt; rename to meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pock=
etpy_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a><b=
r>
&gt;&gt; index 910deba386..e4aca45ae8 100644<br>
&gt;&gt; --- a/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy=
_2.1.8.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.1.8.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-devtools/pocketpy/<a href=3D"http://pocketpy=
_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pocketpy_2.2.0.bb</a><br>
&gt;&gt; @@ -14,7 +14,7 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D224889df3776=
10675315e194ac59276c&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/pocketp=
y/pocketpy.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"nore=
ferrer" target=3D"_blank">github.com/pocketpy/pocketpy.git;protocol=3Dhttps=
;branch=3Dmain;tag=3Dv${PV}</a>&quot;<br>
&gt;&gt; -SRCREV =3D &quot;a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;6cbece9ebc98c19fa2c189dc6963b421c22c40ae&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit cmake<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#130361): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/130361" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/130361</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1214=
53680/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/121453680/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000023c6e4065c7f3210--

