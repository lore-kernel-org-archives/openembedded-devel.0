Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316EAC83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:33:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8917.1693380809761368613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RZw1pCVE;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c3df710bdso4164667f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380808; x=1693985608; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXa7tz2+pLQZy1xVxGYvnyKpd2pd0BsrTZjJIXNj5vg=;
        b=RZw1pCVEpr5WLff2lyN+J5wFeTCMf2RYuisCJ2n0t8WIi9xeSQK2UGq+7qvQAp7Rna
         8a0k4dYqi9v86wnjlQiSsG1J2ANpFwI4cZv/uhD7uqEZmlfVZYOxDQIVtT3Hu3daMHET
         B/WWmTjMIs5KZwQbdvt3PZ6DiOYa8fl0wQNpyT/Rc8OHXL2K3TO051CJN4dYCB1CDGy2
         KPoAiVM0wEC+q7Jls15iDyBmkMDhkZcBl03zvCSRLtInGEj+b170PSLGbHGaFwY9d6G6
         DnPp4Re/GsIQmVx9Jl0k+EQrQlYPgEAV9mHJ/lpgRDX0jW2bzt0BwHV6tmxpoP1NLqMb
         6Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380808; x=1693985608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXa7tz2+pLQZy1xVxGYvnyKpd2pd0BsrTZjJIXNj5vg=;
        b=XAJE6yG3c4qRJoAz4wJE07c1LV7VLg0a3/od3x7yvr9D/km0FHWlX6YG9h0V9TFD3a
         JGHgsa0DWROvUuX3snzvJFMzq2H80CFCL/aF9IRFNQnhldP7xeZ3sx9msA3kC71a0ybE
         IF9VFgVYgeEEnyt1EwEYSlb+hUunddxUDIFDsPYDYy9dQ+GMlb9cgYXiKQhRIkKzeksD
         HDUq6UZCprOHh6migkgaQLKFgF2OQTzHXpH5qXPW+31iqEHk+M5bj8UJ4uES/l0O2Xj+
         OsgaNPOLfhV6bxJ5v7RODWVh66Wl4d84dxhdz24XtIeJH2qdVXZ5jv0PI1Jm4MhoM89D
         Sg5g==
X-Gm-Message-State: AOJu0YzU7A8nFUy0RNw2C8KBfL6JK9K9iP6vkoeMQ3LUm/RDNrkPDZou
	6n21RbV+DK7i28uHyaTxhY2/JDOU2MlduWLC9mM=
X-Google-Smtp-Source: AGHT+IEflnZWpgrImZ7LxjJ+S92sC8z7Ck6nVIki37D43KbG8Xqh115O3FjEsIGHlrXJJUmDrbgMpGLd7iNpfFBw3wo=
X-Received: by 2002:adf:dc81:0:b0:318:c108:67b0 with SMTP id
 r1-20020adfdc81000000b00318c10867b0mr961279wrj.48.1693380808016; Wed, 30 Aug
 2023 00:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com> <CAMKF1sriZM2ykf_b4Yfn+ZnQ1G7-LU-Fp+4_WY45T4ch3sv83w@mail.gmail.com>
In-Reply-To: <CAMKF1sriZM2ykf_b4Yfn+ZnQ1G7-LU-Fp+4_WY45T4ch3sv83w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:33:04 +0200
Message-ID: <CA+chaQd8qGX8g4PSKJo0N3O=n9J08kc_6NR0GKg2jXxV6e8rKQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libfaketime: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Content-Type: multipart/alternative; boundary="0000000000008807e406041ef1ae"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104656

--0000000000008807e406041ef1ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can we name the lib${PN} package differently, e.g. libfaketime? With
multilib the package name is ridiculous lib32-liblib32-libfaketime:

ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA Issue: non
-dev/-dbg/nativesdk- package lib32-liblib32-libfaketime contains symlink
.so '/usr/lib32/faketime/libfaketime.so' [dev-so]

On Sat, Aug 19, 2023 at 8:39=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> fails to build with clang
> https://errors.yoctoproject.org/Errors/Details/732361/
>
> On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak
> <tymoteusz.burak@3mdeb.com> wrote:
> >
> > This commit adds the libfaketime library recipe, which provides time
> > manipulation capabilities for testing and debugging purposes.
> libfaketime allows
> > developers to modify the system time reported to applications, aiding i=
n
> scenarios
> > where accurate time emulation is required.
> >
> > GitHub Repository: https://github.com/wolfcw/libfaketime
> >
> > Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> > ---
> >  .../libfaketime/libfaketime_0.9.10.bb         | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 meta-oe/recipes-test/libfaketime/
> libfaketime_0.9.10.bb
> >
> > diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> > new file mode 100644
> > index 000000000000..f26e5b0db872
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> > @@ -0,0 +1,34 @@
> > +DESCRIPTION =3D "A library for faking the system time in user-space
> programs"
> > +SECTION =3D "libs"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> > +
> > +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
> > +SRC_URI =3D "\
> > +    git://
> git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=3Dhttps \
> > +    "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE +=3D "\
> > +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
> > +    "
> > +
> > +do_configure[noexec] =3D "1"
> > +do_compile () {
> > +    oe_runmake
> > +}
> > +do_install () {
> > +    install -d ${D}${libdir}/faketime
> > +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> > +    install -d ${D}${bindir}
> > +    install -m 0755 src/faketime ${D}${bindir}
> > +}
> > +
> > +PACKAGES =3D+ "lib${PN}"
> > +
> > +FILES:${PN} =3D "${bindir}/faketime"
> > +FILES:lib${PN} =3D "${libdir}/faketime/*"
> > +
> > +INSANE_SKIP:${PN} +=3D "dev-so"
> > +INSANE_SKIP:lib${PN} +=3D "dev-so"
> > --
> > 2.41.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104494):
> https://lists.openembedded.org/g/openembedded-devel/message/104494
> Mute This Topic: https://lists.openembedded.org/mt/100817966/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008807e406041ef1ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we name the lib${PN} package differently, e.g. libfake=
time? With multilib the package name is ridiculous lib32-liblib32-libfaketi=
me:<div><br></div><div>ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA=
 Issue: non -dev/-dbg/nativesdk- package lib32-liblib32-libfaketime contain=
s symlink .so &#39;/usr/lib32/faketime/libfaketime.so&#39; [dev-so]<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, Aug 19, 2023 at 8:39=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">fails to build with clang<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/732361/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/732361/</a><br>
<br>
On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak<br>
&lt;<a href=3D"mailto:tymoteusz.burak@3mdeb.com" target=3D"_blank">tymoteus=
z.burak@3mdeb.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This commit adds the libfaketime library recipe, which provides time<b=
r>
&gt; manipulation capabilities for testing and debugging purposes. libfaket=
ime allows<br>
&gt; developers to modify the system time reported to applications, aiding =
in scenarios<br>
&gt; where accurate time emulation is required.<br>
&gt;<br>
&gt; GitHub Repository: <a href=3D"https://github.com/wolfcw/libfaketime" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/wolfcw/libfaketime</=
a><br>
&gt;<br>
&gt; Signed-off-by: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3=
mdeb.com" target=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libfaketime/<a href=3D"http://libfaketime_0.9.10.bb" rel=3D"=
noreferrer" target=3D"_blank">libfaketime_0.9.10.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 34 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 34 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-test/libfaketime/<a href=3D"h=
ttp://libfaketime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketi=
me_0.9.10.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-test/libfaketime/<a href=3D"http://libfak=
etime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.bb=
</a> b/meta-oe/recipes-test/libfaketime/<a href=3D"http://libfaketime_0.9.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000000..f26e5b0db872<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-test/libfaketime/<a href=3D"http://libfaketime_0=
.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.bb</a><br=
>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +DESCRIPTION =3D &quot;A library for faking the system time in user-sp=
ace programs&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;d475b925943ad404c6c728ac868dc73949e7281c&quot;<br>
&gt; +SRC_URI =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://git@github.com/wolfcw/libfaketi=
me.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=3Dhttps</=
a> \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 EXTRA_FLAGS=3D&#39;-Wno-error=3Dnonnull-compare&#39; \<=
br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +do_configure[noexec] =3D &quot;1&quot;<br>
&gt; +do_compile () {<br>
&gt; +=C2=A0 =C2=A0 oe_runmake<br>
&gt; +}<br>
&gt; +do_install () {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/faketime<br>
&gt; +=C2=A0 =C2=A0 oe_libinstall -C src libfaketime ${D}${libdir}/faketime=
<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 src/faketime ${D}${bindir}<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;lib${PN}&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} =3D &quot;${bindir}/faketime&quot;<br>
&gt; +FILES:lib${PN} =3D &quot;${libdir}/faketime/*&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;dev-so&quot;<br>
&gt; +INSANE_SKIP:lib${PN} +=3D &quot;dev-so&quot;<br>
&gt; --<br>
&gt; 2.41.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104494): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104494" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104494</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100817966/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100817966/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008807e406041ef1ae--

