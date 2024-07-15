Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E92C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:18:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.39021.1721053106393850875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=df9tlUaA;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25e076f79d5so2180136fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721053105; x=1721657905; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WlQ+cjACI8XPcnnG79lO5wYptGBQG1N31eh/IFQ3wI=;
        b=df9tlUaA2n2gWsUZ495Nh4zQO3IuIcPDBRNoyVukjiHBMlsCegItw5o833Jxhi+lIa
         ShyCKGTait3u4o/2jX4GNJMTKn9zBr/Wxanp0GY/xPzjCl/dhHKJMNgg0OeCVtD7zjmk
         5ljaLuBNRosljuKHhhS8keTMtpqN+y6IZ3bAu75SlTrle/HGJ9ShgnKiE/kJ9Lh3NhyB
         0+yE/pgbnbPgNeD8g8N9Hp5FjjxW+GR0+qJVjGHiNec/DSwUi8N2+AXpS9w+rjzSPmsL
         ukX2242I0gPY8GB6uFtB4pZnLikHeSYbAyiAx4n7/MQPMLBNZCJ8ajz+EKIaYtHJmg1+
         CXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721053105; x=1721657905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WlQ+cjACI8XPcnnG79lO5wYptGBQG1N31eh/IFQ3wI=;
        b=K+nTopZEIuak8g1ngn2YuwmQWCjk0fmkgzJlgOMYTfxJANoUvSemRJ7ucPdEbl3pN/
         mCwxeooUjLD3TE7d9PYPDX0UhvSBYQt9ur5mvPxHPRqci+ouwDJRoDsWU+8Ec8RXp8NH
         SuUHrep/LhT5Ox0PimQOEXjNRGLlE+x0XY1BTBabOlTvvLGxv9heoD7wrl0JW0b2TGUY
         JJUJYIwMCIKcyLTXaI4iqZ5AD46A7g+E5BQvefSBP1u/V/cCaD6I6J4kTZoooQIN6m8O
         xTdwfZeItqxTKJCLbZJ1QDA/bSzRRq8D5owHozVf1fcmpnjSx+aD1GAYYBbq+AT1kjlA
         0z7A==
X-Gm-Message-State: AOJu0YzOTgAzCD2NLVgfHEE3z85qTia6V9SVrtCvKHTp2G9WzoX44+Dc
	bV2KiAwDxxuSRCyFxCq4K904mRj+3v9vrKz2Hc0pVU9gMyWQvrTAt9mvgr5zDO2bwZbZ0yF+4dk
	a3EApJupkxEvIxo3KDnzGs8HThmc0F5+E
X-Google-Smtp-Source: AGHT+IElHA2kBV4uY5QHMzpEWy+g4V45q5u8Bpds4hSV7QPetnQg2c3djOMw5e19JzlpWWZ0FyuztVCejjITL5f4HFs=
X-Received: by 2002:a05:6871:54c:b0:25e:1ca6:6d09 with SMTP id
 586e51a60fabf-25eae76455amr16625336fac.8.1721053105440; Mon, 15 Jul 2024
 07:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240715121744.18888-1-ceggers@arri.de>
In-Reply-To: <20240715121744.18888-1-ceggers@arri.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jul 2024 07:18:14 -0700
Message-ID: <CAMKF1sp+OV9U8SbRqR=CvR8vxS0dsgCfWqp3ShGr5w2AcuG2-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
To: ceggers@arri.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd4e5b061d49e67d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 14:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111361

--000000000000fd4e5b061d49e67d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via lists.openembe=
dded.org
<ceggers=3Darri.de@lists.openembedded.org> wrote:

> Based on proposal send previously here:
> https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
>
> This recipe depends on meta-clang, so should it be added to that layer?
>
> Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work yet.
> Although I have installed nativesdk-clang (via CLANGSDK =3D "1") and
> nativesdk-include-what-you-use packages, the C++ standard headers are
> not found:
>
> include-what-you-use
> --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-m=
usleabi
> impl/Fdt.cpp
> impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
>     9 | #include <cerrno>
>       |          ^~~~~~~~
>
> As iwyu uses Clang and I have no experience working with it, this is
> probably only a beginner mistake. Can Clang use the C++ headers provided
> by libstdc++, or do I need to install further packages?
>

It can but it seems your SDK install might be missing any c++ runtime so
check a simple program that includes say <iostream> header and try
compiling it


> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  .../include-what-you-use_git.bb               | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/include-what-you-use/
> include-what-you-use_git.bb
>
> diff --git a/meta-oe/recipes-devtools/include-what-you-use/
> include-what-you-use_git.bb
> b/meta-oe/recipes-devtools/include-what-you-use/
> include-what-you-use_git.bb
> new file mode 100644
> index 000000000000..e7df6a834a34
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/include-what-you-use/
> include-what-you-use_git.bb
> @@ -0,0 +1,22 @@
> +LICENSE =3D "NCSA"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a0ef3108c88 \
> +
> file://iwyu-check-license-header.py;md5=3D7bdb749831163fbe9232b3cb7186116=
f"
> +
> +SRC_URI =3D "git://
> github.com/include-what-you-use/include-what-you-use.git;protocol=3Dhttps=
;branch=3Dclang_18
> "
> +
> +PV =3D "0.22+git${SRCPV}"
> +SRCREV =3D "377eaef70cdda47368939f4d9beabfabe3f628f0"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "clang"


This means it needs to use clang as library to link to is that what it
required or does it need clang as static compiler to build this package in
which case you can do so by using TOOLCHAIN =3D =E2=80=9Cclang=E2=80=9D in =
recipe


> +
> +inherit cmake python3native
> +
> +EXTRA_OECMAKE:append:class-nativesdk =3D " \
> +       -DCMAKE_SKIP_RPATH:BOOL=3DON \
> +       "
> +
> +FILES:${PN} +=3D "${datadir}/${BPN}"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --
> 2.44.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111360):
> https://lists.openembedded.org/g/openembedded-devel/message/111360
> Mute This Topic: https://lists.openembedded.org/mt/107229738/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fd4e5b061d49e67d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
ceggers=3D<a href=3D"mailto:arri.de@lists.openembedded.org">arri.de@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Base=
d on proposal send previously here:<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yoc=
to/topic/recipe_for/83279588</a><br>
<br>
This recipe depends on meta-clang, so should it be added to that layer?<br>
<br>
Unfortunately the &#39;include-what-you-use&#39; (iwyu) tool doesn&#39;t wo=
rk yet.<br>
Although I have installed nativesdk-clang (via CLANGSDK =3D &quot;1&quot;) =
and<br>
nativesdk-include-what-you-use packages, the C++ standard headers are<br>
not found:<br>
<br>
include-what-you-use --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon=
-vfpv4-poky-linux-musleabi impl/Fdt.cpp<br>
impl/Fdt.cpp:9:10: fatal error: &#39;cerrno&#39; file not found<br>
=C2=A0 =C2=A0 9 | #include &lt;cerrno&gt;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
<br>
As iwyu uses Clang and I have no experience working with it, this is<br>
probably only a beginner mistake. Can Clang use the C++ headers provided<br=
>
by libstdc++, or do I need to install further packages?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It can but it se=
ems your SDK install might be missing any c++ runtime so check a simple pro=
gram that includes say &lt;iostream&gt; header and try compiling it=C2=A0</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Christian Eggers &lt;<a href=3D"mailto:ceggers@arri.de" targ=
et=3D"_blank">ceggers@arri.de</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">include-what-you-use_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/include-what-you-use/<a h=
ref=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">include-what-you-use_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/include-what-you-use/<a href=3D"http:=
//include-what-you-use_git.bb" rel=3D"noreferrer" target=3D"_blank">include=
-what-you-use_git.bb</a> b/meta-oe/recipes-devtools/include-what-you-use/<a=
 href=3D"http://include-what-you-use_git.bb" rel=3D"noreferrer" target=3D"_=
blank">include-what-you-use_git.bb</a><br>
new file mode 100644<br>
index 000000000000..e7df6a834a34<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/include-what-you-use/<a href=3D"http://inclu=
de-what-you-use_git.bb" rel=3D"noreferrer" target=3D"_blank">include-what-y=
ou-use_git.bb</a><br>
@@ -0,0 +1,22 @@<br>
+LICENSE =3D &quot;NCSA&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a=
0ef3108c88 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://iwyu-check-license-header.py;md5=3D7bdb749831163fbe9232b3cb7186116f&quot=
;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/include-what-you-use/=
include-what-you-use.git;protocol=3Dhttps;branch=3Dclang_18" rel=3D"norefer=
rer" target=3D"_blank">github.com/include-what-you-use/include-what-you-use=
.git;protocol=3Dhttps;branch=3Dclang_18</a>&quot;<br>
+<br>
+PV =3D &quot;0.22+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;377eaef70cdda47368939f4d9beabfabe3f628f0&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS =3D &quot;clang&quot;</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">This means it needs to use clang as library to link to is tha=
t what it required or does it need clang as static compiler to build this p=
ackage in which case you can do so by using TOOLCHAIN =3D =E2=80=9Cclang=E2=
=80=9D in recipe=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
+<br>
+inherit cmake python3native<br>
+<br>
+EXTRA_OECMAKE:append:class-nativesdk =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_SKIP_RPATH:BOOL=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}/${BPN}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
-- <br>
2.44.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111360): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111360" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111360</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107229738/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107229738/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fd4e5b061d49e67d--

