Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4764AC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 15:57:46 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.21916.1721404665055312653
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 08:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5QofHSa;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70388567d24so1048208a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721404664; x=1722009464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWxNKAjhJJV+EMso1ZvpmDon+DyEhZzapIZAfGwdfco=;
        b=e5QofHSak2Dic6m8q/lImSqUBsZei4weVZBOgFE6NeBkZfMF416SjDXPIfluV7Rf/O
         lSZj+wJgY2GM+MrOXhrElS5o3VOj1VGFwFc7GwEdMWB5QfOZ6SlR8Hpq8iPeII1RJgKX
         ViWIT85aH3StebIN0kjEeIbAYr9fvFH7V41My5KaIGGKoCDRFQGHSkbH4W+UXziMs1nj
         5qolWwwqnW3axCE1uNFAc/j467a5wJSVw+pS9EmDzUvXS9iWhUrpAoiDxX2RG6gf+mFo
         W9rs1OmE/gUzxUUMfClpCt296FxGqH/mZk9Mfpn7Sargk9N7ee0OJfZO/13U2f8LNmwq
         hqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721404664; x=1722009464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWxNKAjhJJV+EMso1ZvpmDon+DyEhZzapIZAfGwdfco=;
        b=KPTEI8XzL4JWcCYKCy2tR0JyYXYSCCKBfT5w8YQErLPLpCHZ8PiTzxRFa4njuoEL0o
         DGSl5Bg8ayDPx19ul3KKd0ScW5u1dKJNBv+Hi+upA1kgWO3u6jeLKy4rripgMzcFtMUI
         NiAB42kL2jPXzYV3VyBjYAeiPUmlrAxXVbu94duTo+6+YeWj29f/nNsZTHXHb0Ha6Qz0
         Ow86vhwZ1fuyy9ybGZR6yjQLx4biRE7SuZsj4L5ovwtIIxGuQbHnGxRx3WxDq0QB0A9D
         y59V+21xLLoH79uBwEqTE7r34cwWOKEYn/mYlEJyYEvDxcZxSVM5sDSeV346cEgc5aKi
         8pZQ==
X-Gm-Message-State: AOJu0YzCXPghEj7bOPBPan95OiTl2Vum4+ch/9c26PbjSz5dGPiyZQxo
	jUpBofcl7xdFzD6s4zgLI/hlnWXhsmid/3TW65gf/Nomuw9CUWjJc2KCIivqXxVtRONgMEBQBuw
	J0s4OOHfh7y2LArEPdTTjdpCgszCJtj2k
X-Google-Smtp-Source: AGHT+IFO7SffW+hTHB/YY/kz0dQPD5qVrbUeIkyrF1jF0QMPJIYSMz6rLLt+HKtvgg2qJRkqDAmgJqsh43k2i2zjXmE=
X-Received: by 2002:a05:6870:4723:b0:250:7dba:9501 with SMTP id
 586e51a60fabf-2612169af82mr162909fac.41.1721404664016; Fri, 19 Jul 2024
 08:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240715121744.18888-1-ceggers@arri.de> <4907407.OV4Wx5bFTl@n9w6sw14>
 <CAMKF1srofvxUUgGQqXBCxvLpTSkbK2puFamrL_U7Vmvb+BC6Dw@mail.gmail.com> <3479754.LZWGnKmheA@n9w6sw14>
In-Reply-To: <3479754.LZWGnKmheA@n9w6sw14>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jul 2024 08:57:31 -0700
Message-ID: <CAMKF1spw_7xLOuKRv5+YRL+u4aU6ZhmS1F3Bf17jECL2Hcnu0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000837fd1061d9bc182"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 15:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111418

--000000000000837fd1061d9bc182
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 7:10=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:

> Hi Khem,
>
> sorry for the delay.
>
> On Tuesday, 16 July 2024, 17:42:33 CEST, Khem Raj wrote:
> > On Tue, Jul 16, 2024 at 7:57=E2=80=AFAM Christian Eggers <ceggers@arri.=
de>
> wrote:
> > >
> > > Hi Khem,
> > >
> > >
> > > On Tuesday, 16 July 2024, 15:45:54 CEST, Khem Raj wrote:
> > > > On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers <ceggers@a=
rri.de>
> wrote:
> > > >
> > > > > On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> > > > > > On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via
> > > > > lists.openembedded.org
> > > > > > <ceggers=3Darri.de@lists.openembedded.org> wrote:
> > > > > >
> > > > > > > Based on proposal send previously here:
> > > > > > >
> https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> > > > > > >
> > > > > > > This recipe depends on meta-clang, so should it be added to
> that layer?
> > > > > > >
> > > > > > > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't
> work yet.
> > > > > > > Although I have installed nativesdk-clang (via CLANGSDK =3D "=
1")
> and
> > > > > > > nativesdk-include-what-you-use packages, the C++ standard
> headers are
> > > > > > > not found:
> > > > > > >
> > > > > > > include-what-you-use
> > > > > > >
> > > > >
> --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-m=
usleabi
> > > > > > > impl/Fdt.cpp
> > > > > > > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> > > > > > >     9 | #include <cerrno>
> > > > > > >       |          ^~~~~~~~
> > > > > > >
> > > > > > > As iwyu uses Clang and I have no experience working with it,
> this is
> > > > > > > probably only a beginner mistake. Can Clang use the C++ heade=
rs
> > > > > provided
> > > > > > > by libstdc++, or do I need to install further packages?
> > > > > > >
> > > > > >
> > > > > > It can but it seems your SDK install might be missing any c++
> runtime so
> > > > > > check a simple program that includes say <iostream> header and
> try
> > > > > > compiling it
> > > > > My SDK definitely contains std:: C++ headers for target and
> nativesdk. But
> > > > > the
> > > > > libstdc++ C++ headers are installed in GCC specific locations:
> > > > >
> > > > >
> /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/
> > > > >
> > > > >
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/=
include/c++/13.3.0
> > > > >
> > > > > How can Clang know that the C++ headers are located in the (GCC
> specific)
> > > > > c++/13.3.0
> > > > > sub directory?
> > > >
> > > >
> > > > Try adding -stdlib=3Dlibstdc++ on clang cmdline
> > >
> > > The following seems to work:
> > > include-what-you-use \
> > >     -target arm-poky-linux-musleabi \
> > >     --sysroot
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi \
> > >     -stdlib++-isystem
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/=
include/c++/13.3.0/arm-poky-linux-musleabi
> \
> > >     -stdlib++-isystem
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/=
include/c++/13.3.0
> \
> > >     File.cpp
> > >
> > > Is there a way to make this a little bit handier? I would like to
> avoid hard coding this into my CMake toolchain file.
> > >
> >
> > Hmm so -stdlib=3Dlibstdc++ does not work ?
>
> I cannot reproduce what exactly went wrong, but now the following works
> fine:
>
> include-what-you-use -target arm-poky-linux-musleabi --sysroot
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi
> test.cpp
> include-what-you-use -target x86_64-pokysdk-linux --sysroot
> /opt/orbiter-tiny/5.0.2/sysroots/x86_64-pokysdk-linux test.cpp
>
> So neither '-stdlib=3Dlibstdc++' nor '-stdlib++-isystem' is required anym=
ore.
>
> I was also able to integrate this into a CMake project (built with the
> SDK) by adding the following to my toolchain file:
>
> set(CMAKE_C_INCLUDE_WHAT_YOU_USE
> include-what-you-use;-target;arm-poky-linux-musleabi;--sysroot;$ENV{SDKTA=
RGETSYSROOT})
> set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE
> include-what-you-use;-target;arm-poky-linux-musleabi;--sysroot;$ENV{SDKTA=
RGETSYSROOT})
>
> The IWYU tool states itself as "experimental software", so the output
> better should be interpreted by a human. I've tested with an existing
> code base and got many valuable hints for missing/superfluous
> #include statements. The results are quite good for std:: C/C++
> headers, but other libraries like Boost need further improvements.
>
> Can this recipe be added to meta-clang (due to it's dependencies to
> libclang/libllvm)?
>
>
Yes send a pr to meta-clang

>
>
>
>

--000000000000837fd1061d9bc182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 19, 2024 at 7:10=E2=80=AFAM Christian Eggers &l=
t;<a href=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
sorry for the delay.<br>
<br>
On Tuesday, 16 July 2024, 17:42:33 CEST, Khem Raj wrote:<br>
&gt; On Tue, Jul 16, 2024 at 7:57=E2=80=AFAM Christian Eggers &lt;<a href=
=3D"mailto:ceggers@arri.de" target=3D"_blank">ceggers@arri.de</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tuesday, 16 July 2024, 15:45:54 CEST, Khem Raj wrote:<br>
&gt; &gt; &gt; On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers &lt=
;<a href=3D"mailto:ceggers@arri.de" target=3D"_blank">ceggers@arri.de</a>&g=
t; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian =
Eggers via<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;ceggers=3D<a href=3D"mailto:arri.de@lists.open=
embedded.org" target=3D"_blank">arri.de@lists.openembedded.org</a>&gt; wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Based on proposal send previously here:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/y=
octo/topic/recipe_for/83279588" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This recipe depends on meta-clang, so should =
it be added to that layer?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Unfortunately the &#39;include-what-you-use&#=
39; (iwyu) tool doesn&#39;t work yet.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Although I have installed nativesdk-clang (vi=
a CLANGSDK =3D &quot;1&quot;) and<br>
&gt; &gt; &gt; &gt; &gt; &gt; nativesdk-include-what-you-use packages, the =
C++ standard headers are<br>
&gt; &gt; &gt; &gt; &gt; &gt; not found:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; include-what-you-use<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-=
vfpv4-poky-linux-musleabi<br>
&gt; &gt; &gt; &gt; &gt; &gt; impl/Fdt.cpp<br>
&gt; &gt; &gt; &gt; &gt; &gt; impl/Fdt.cpp:9:10: fatal error: &#39;cerrno&#=
39; file not found<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09 | #include &lt;cerrno&gt=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; As iwyu uses Clang and I have no experience w=
orking with it, this is<br>
&gt; &gt; &gt; &gt; &gt; &gt; probably only a beginner mistake. Can Clang u=
se the C++ headers<br>
&gt; &gt; &gt; &gt; provided<br>
&gt; &gt; &gt; &gt; &gt; &gt; by libstdc++, or do I need to install further=
 packages?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; It can but it seems your SDK install might be miss=
ing any c++ runtime so<br>
&gt; &gt; &gt; &gt; &gt; check a simple program that includes say &lt;iostr=
eam&gt; header and try<br>
&gt; &gt; &gt; &gt; &gt; compiling it<br>
&gt; &gt; &gt; &gt; My SDK definitely contains std:: C++ headers for target=
 and nativesdk. But<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; libstdc++ C++ headers are installed in GCC specific loc=
ations:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/inclu=
de/c++/13.3.0/<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-l=
inux-musleabi/usr/include/c++/13.3.0<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; How can Clang know that the C++ headers are located in =
the (GCC specific)<br>
&gt; &gt; &gt; &gt; c++/13.3.0<br>
&gt; &gt; &gt; &gt; sub directory?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Try adding -stdlib=3Dlibstdc++ on clang cmdline<br>
&gt; &gt;<br>
&gt; &gt; The following seems to work:<br>
&gt; &gt; include-what-you-use \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-target arm-poky-linux-musleabi \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0--sysroot /opt/poky/5.0.2/sysroots/cortexa7t2h=
f-neon-vfpv4-poky-linux-musleabi \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-stdlib++-isystem /opt/poky/5.0.2/sysroots/cor=
texa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/include/c++/13.3.0/arm-poky-li=
nux-musleabi \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-stdlib++-isystem /opt/poky/5.0.2/sysroots/cor=
texa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/include/c++/13.3.0=C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0File.cpp<br>
&gt; &gt;<br>
&gt; &gt; Is there a way to make this a little bit handier? I would like to=
 avoid hard coding this into my CMake toolchain file.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hmm so -stdlib=3Dlibstdc++ does not work ?<br>
<br>
I cannot reproduce what exactly went wrong, but now the following works fin=
e:<br>
<br>
include-what-you-use -target arm-poky-linux-musleabi --sysroot /opt/poky/5.=
0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi test.cpp<br>
include-what-you-use -target x86_64-pokysdk-linux --sysroot /opt/orbiter-ti=
ny/5.0.2/sysroots/x86_64-pokysdk-linux test.cpp<br>
<br>
So neither &#39;-stdlib=3Dlibstdc++&#39; nor &#39;-stdlib++-isystem&#39; is=
 required anymore.<br>
<br>
I was also able to integrate this into a CMake project (built with the SDK)=
 by adding the following to my toolchain file:<br>
<br>
set(CMAKE_C_INCLUDE_WHAT_YOU_USE include-what-you-use;-target;arm-poky-linu=
x-musleabi;--sysroot;$ENV{SDKTARGETSYSROOT})<br>
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE include-what-you-use;-target;arm-poky-li=
nux-musleabi;--sysroot;$ENV{SDKTARGETSYSROOT})<br>
<br>
The IWYU tool states itself as &quot;experimental software&quot;, so the ou=
tput<br>
better should be interpreted by a human. I&#39;ve tested with an existing<b=
r>
code base and got many valuable hints for missing/superfluous<br>
#include statements. The results are quite good for std:: C/C++<br>
headers, but other libraries like Boost need further improvements.<br>
<br>
Can this recipe be added to meta-clang (due to it&#39;s dependencies to lib=
clang/libllvm)?<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes send a pr to=
 meta-clang=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
<br>
</blockquote></div></div>

--000000000000837fd1061d9bc182--

