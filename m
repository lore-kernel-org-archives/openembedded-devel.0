Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B39C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 13:46:10 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.11115.1721137566480847420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 06:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G7MWwOhy;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25e31d0a753so2263809fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721137566; x=1721742366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=odbWSVQRGWMiLoIJw2QFQRIBsVMxhzBvs2A6yy09U3Q=;
        b=G7MWwOhyXo6upzHlDAZY3GGiLIZQstZJkjy1eO+HTb26n3ifk3449v/YR5yBbvvb6A
         wnt535OdU/rsOrtfWBcLYDWar/VXwO56OipOJvJgN0icxvAFA9HG5rsYmioyd/xJdIm1
         s8Apiz7gqC71BgeiG9TbuFeLO4xs5+d5WLMlySsii/1bbJt9wogQVh7ifv3KlyuWGuLL
         3ZQ7d8tERAXd4vL4Oi047RIQRbDrMkZljwXC3O3BY0OLF1xcRFknxeWN1uzqmzUU8aNc
         jF5ErZWGCatKNx4MCFV2dWf2+gjbu337KFEmywEACytCJLue8F+GThSHV37sYVF2YT8q
         wzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137566; x=1721742366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odbWSVQRGWMiLoIJw2QFQRIBsVMxhzBvs2A6yy09U3Q=;
        b=pLjJHIbh7fg2XXiea0ZjD/SQCYZUEwFE4bL3q7C27hxsttENZ2WodVHEqoSM/YSNpG
         3NOTCnniCq2qRULM8fFrFRkhysZMGK0ZCnRVV60LsjBFnsq7bWIL1jcnxIJPLM43N/0W
         TzcHYqJWphDOWwiARX95/rUBwdxCqfDZRh3/UugbPzX7iPKgxg3eEIzo3NSOmnMpw3wb
         XxI2/S9ZeA3ALnfQijSHfIY5vVR81vXF0Jvef4taYMkiEwGhP/xBXK98KT66sIIQXH9b
         sKzjltFLzxh6JthelwAT8XALFjBVImlvPaJmIvzKFoHzoCs/tI4Q5gN8itXIC3qfi7yG
         nmdQ==
X-Gm-Message-State: AOJu0YwPPwmbMHdfvb/F6sGaB5hfrpIhRIK5yVA0XE+GhGDZdPYbKhxC
	VmaaBRQ1sU5ECiJCVi8+b/Vtir18Rp5YsX+n+7SkpGiv2lEh+nbhI13r8tg4/dPHq0emZgHPGFD
	UlW+5ob3MUAITw5rpFON8+GLBPNc=
X-Google-Smtp-Source: AGHT+IExsKiMgQHGFZu4d9TreaASC7QvIANGiKidBIv5M+NiQTvsG1baDqCY/pkYvrkABqrW22ZoGjx2QtYXUraGB/4=
X-Received: by 2002:a05:6870:390b:b0:25e:1cde:f5c6 with SMTP id
 586e51a60fabf-260bdfefa63mr1726265fac.53.1721137565591; Tue, 16 Jul 2024
 06:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240715121744.18888-1-ceggers@arri.de> <CAMKF1sp+OV9U8SbRqR=CvR8vxS0dsgCfWqp3ShGr5w2AcuG2-Q@mail.gmail.com>
 <2532679.XAFRqVoOGU@n9w6sw14>
In-Reply-To: <2532679.XAFRqVoOGU@n9w6sw14>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2024 06:45:54 -0700
Message-ID: <CAMKF1spu4fha8UzWVVU-dFQ84TsXHKKCfJxsQGHFnJgnxXAQPw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000034f265061d5d9150"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 13:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111375

--00000000000034f265061d5d9150
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:

> On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> > On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via
> lists.openembedded.org
> > <ceggers=3Darri.de@lists.openembedded.org> wrote:
> >
> > > Based on proposal send previously here:
> > > https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> > >
> > > This recipe depends on meta-clang, so should it be added to that laye=
r?
> > >
> > > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work yet=
.
> > > Although I have installed nativesdk-clang (via CLANGSDK =3D "1") and
> > > nativesdk-include-what-you-use packages, the C++ standard headers are
> > > not found:
> > >
> > > include-what-you-use
> > >
> --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-m=
usleabi
> > > impl/Fdt.cpp
> > > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> > >     9 | #include <cerrno>
> > >       |          ^~~~~~~~
> > >
> > > As iwyu uses Clang and I have no experience working with it, this is
> > > probably only a beginner mistake. Can Clang use the C++ headers
> provided
> > > by libstdc++, or do I need to install further packages?
> > >
> >
> > It can but it seems your SDK install might be missing any c++ runtime s=
o
> > check a simple program that includes say <iostream> header and try
> > compiling it
> My SDK definitely contains std:: C++ headers for target and nativesdk. Bu=
t
> the
> libstdc++ C++ headers are installed in GCC specific locations:
>
> /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/
>
> /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/=
include/c++/13.3.0
>
> How can Clang know that the C++ headers are located in the (GCC specific)
> c++/13.3.0
> sub directory?


Try adding -stdlib=3Dlibstdc++ on clang cmdline

>
>
>
> >
> >
> > > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > > ---
> > >  .../include-what-you-use_git.bb               | 22
> +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >  create mode 100644 meta-oe/recipes-devtools/include-what-you-use/
> > > include-what-you-use_git.bb
> > >
> > > diff --git a/meta-oe/recipes-devtools/include-what-you-use/
> > > include-what-you-use_git.bb
> > > b/meta-oe/recipes-devtools/include-what-you-use/
> > > include-what-you-use_git.bb
> > > new file mode 100644
> > > index 000000000000..e7df6a834a34
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/include-what-you-use/
> > > include-what-you-use_git.bb
> > > @@ -0,0 +1,22 @@
> > > +LICENSE =3D "NCSA"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a0ef3108c88 \
> > > +
> > >
> file://iwyu-check-license-header.py;md5=3D7bdb749831163fbe9232b3cb7186116=
f"
> > > +
> > > +SRC_URI =3D "git://
> > >
> github.com/include-what-you-use/include-what-you-use.git;protocol=3Dhttps=
;branch=3Dclang_18
> > > "
> > > +
> > > +PV =3D "0.22+git${SRCPV}"
> > > +SRCREV =3D "377eaef70cdda47368939f4d9beabfabe3f628f0"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +DEPENDS =3D "clang"
> >
> >
> > This means it needs to use clang as library to link to is that what it
> > required or does it need clang as static compiler to build this package
> in
> > which case you can do so by using TOOLCHAIN =3D =E2=80=9Cclang=E2=80=9D=
 in recipe
> I think that it builds fine with the GCC toolchain, at least it doesn't
> complain during build. Finally it links against libclang-cpp.so.18.1 and
> libLLVM.so.18.1, so using "DEPENDS" sounds correct for me.
>
> Although I haven't configured Clang to provide also llvm (as described he=
re
> https://github.com/kraj/meta-clang?tab=3Dreadme-ov-file#providing-llvm),
> there is a nativesdk-clang-libllvm package after building nativesdk-clang=
.
> >
> >
> > > +
> > > +inherit cmake python3native
> > > +
> > > +EXTRA_OECMAKE:append:class-nativesdk =3D " \
> > > +       -DCMAKE_SKIP_RPATH:BOOL=3DON \
> > > +       "
> > > +
> > > +FILES:${PN} +=3D "${datadir}/${BPN}"
> > > +
> > > +BBCLASSEXTEND =3D "nativesdk"
> > > --
> > > 2.44.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#111360):
> > > https://lists.openembedded.org/g/openembedded-devel/message/111360
> > > Mute This Topic: https://lists.openembedded.org/mt/107229738/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [
> > > raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
> >
>
>
>
>
>

--00000000000034f265061d5d9150
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers &l=
t;<a href=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Monday, 15 July 2024, 16:18:14 CEST, Kh=
em Raj wrote:<br>
&gt; On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a><br>
&gt; &lt;ceggers=3D<a href=3D"mailto:arri.de@lists.openembedded.org" target=
=3D"_blank">arri.de@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Based on proposal send previously here:<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/yocto/topic/recipe_fo=
r/83279588" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject=
.org/g/yocto/topic/recipe_for/83279588</a><br>
&gt; &gt;<br>
&gt; &gt; This recipe depends on meta-clang, so should it be added to that =
layer?<br>
&gt; &gt;<br>
&gt; &gt; Unfortunately the &#39;include-what-you-use&#39; (iwyu) tool does=
n&#39;t work yet.<br>
&gt; &gt; Although I have installed nativesdk-clang (via CLANGSDK =3D &quot=
;1&quot;) and<br>
&gt; &gt; nativesdk-include-what-you-use packages, the C++ standard headers=
 are<br>
&gt; &gt; not found:<br>
&gt; &gt;<br>
&gt; &gt; include-what-you-use<br>
&gt; &gt; --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky=
-linux-musleabi<br>
&gt; &gt; impl/Fdt.cpp<br>
&gt; &gt; impl/Fdt.cpp:9:10: fatal error: &#39;cerrno&#39; file not found<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A09 | #include &lt;cerrno&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~=
~~~~~<br>
&gt; &gt;<br>
&gt; &gt; As iwyu uses Clang and I have no experience working with it, this=
 is<br>
&gt; &gt; probably only a beginner mistake. Can Clang use the C++ headers p=
rovided<br>
&gt; &gt; by libstdc++, or do I need to install further packages?<br>
&gt; &gt;<br>
&gt; <br>
&gt; It can but it seems your SDK install might be missing any c++ runtime =
so<br>
&gt; check a simple program that includes say &lt;iostream&gt; header and t=
ry<br>
&gt; compiling it<br>
My SDK definitely contains std:: C++ headers for target and nativesdk. But =
the<br>
libstdc++ C++ headers are installed in GCC specific locations:<br>
<br>
/opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/<br>
/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/in=
clude/c++/13.3.0<br>
<br>
How can Clang know that the C++ headers are located in the (GCC specific) c=
++/13.3.0<br>
sub directory?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Tr=
y adding -stdlib=3Dlibstdc++ on clang cmdline=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; Signed-off-by: Christian Eggers &lt;<a href=3D"mailto:ceggers@arr=
i.de" target=3D"_blank">ceggers@arri.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../<a href=3D"http://include-what-you-use_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">include-what-you-use_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 22 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/include-what-yo=
u-use/<br>
&gt; &gt; <a href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">include-what-you-use_git.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/include-what-you-use/<br>
&gt; &gt; <a href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">include-what-you-use_git.bb</a><br>
&gt; &gt; b/meta-oe/recipes-devtools/include-what-you-use/<br>
&gt; &gt; <a href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">include-what-you-use_git.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..e7df6a834a34<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/include-what-you-use/<br>
&gt; &gt; <a href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">include-what-you-use_git.bb</a><br>
&gt; &gt; @@ -0,0 +1,22 @@<br>
&gt; &gt; +LICENSE =3D &quot;NCSA&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a0ef3108c88 \=
<br>
&gt; &gt; +<br>
&gt; &gt; file://iwyu-check-license-header.py;md5=3D7bdb749831163fbe9232b3c=
b7186116f&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://github.com/include-what-you-use/include-what-yo=
u-use.git;protocol=3Dhttps;branch=3Dclang_18" rel=3D"noreferrer" target=3D"=
_blank">github.com/include-what-you-use/include-what-you-use.git;protocol=
=3Dhttps;branch=3Dclang_18</a><br>
&gt; &gt; &quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PV =3D &quot;0.22+git${SRCPV}&quot;<br>
&gt; &gt; +SRCREV =3D &quot;377eaef70cdda47368939f4d9beabfabe3f628f0&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS =3D &quot;clang&quot;<br>
&gt; <br>
&gt; <br>
&gt; This means it needs to use clang as library to link to is that what it=
<br>
&gt; required or does it need clang as static compiler to build this packag=
e in<br>
&gt; which case you can do so by using TOOLCHAIN =3D =E2=80=9Cclang=E2=80=
=9D in recipe<br>
I think that it builds fine with the GCC toolchain, at least it doesn&#39;t=
<br>
complain during build. Finally it links against libclang-cpp.so.18.1 and <b=
r>
libLLVM.so.18.1, so using &quot;DEPENDS&quot; sounds correct for me.<br>
<br>
Although I haven&#39;t configured Clang to provide also llvm (as described =
here<br>
<a href=3D"https://github.com/kraj/meta-clang?tab=3Dreadme-ov-file#providin=
g-llvm" rel=3D"noreferrer" target=3D"_blank">https://github.com/kraj/meta-c=
lang?tab=3Dreadme-ov-file#providing-llvm</a>),<br>
there is a nativesdk-clang-libllvm package after building nativesdk-clang.<=
br>
&gt; <br>
&gt; <br>
&gt; &gt; +<br>
&gt; &gt; +inherit cmake python3native<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OECMAKE:append:class-nativesdk =3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_SKIP_RPATH:BOOL=3DON \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} +=3D &quot;${datadir}/${BPN}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.44.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#111360):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/111360" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/111360</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107=
229738/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/107229738/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000034f265061d5d9150--

