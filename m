Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB91C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:14:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.16571.1693408450678915419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IEVu/Ljh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401b5516104so52824385e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693408449; x=1694013249; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4YF2BkPIoi9277gdIMjJn2xbdaf5KJdUI+gEq4ooVc=;
        b=IEVu/Ljhc28CH9lAvLfWE3IsGQPj413OSVAbIPTcNV75Nvmw41YuvXb6b000pANR3r
         b6DpUT2pia1wVB3FwpotA6vt9NL/kZhcJWMwdH+PAoHTG58qUAB4nOgdjtXue4CNb9Av
         TPn3ZYloBMr+1ZVUyZd0SXHWJSySjXSXW4U+6/mVQxDE03i6rNs66w6UT2quBrp0Waok
         RYtvmLAc8UlJhEf9i5xLK5oBtZ/MYpLqDm9I/K2R8JF5e3Qf1VaYn2gwSMAaNbPS8j+/
         NikZWOJlBGJ8YOXF4n7imOqG6lLyns3gy+LaPAaSGWeqeQ19tJkwC8YNMlVIlatlo2v0
         7B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408449; x=1694013249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4YF2BkPIoi9277gdIMjJn2xbdaf5KJdUI+gEq4ooVc=;
        b=cvfQuQ4RIFvngX1x2O+dmra3ma4B8JM3REOlp456Aqyp0gLpsJy9hJMmkaJvNQEE+3
         oWZ9Ms17GvhKARBcuiC36CpB8I6bQt6rqqb24QVfc2kM7ia/H5rsokpQTMcAiSTk8Dyo
         V1Ix+gQEqcNPZYLGVKxSW8cpq+tHBrx1Zx0k6Xjabl0yi9ow4qlPcRdkvNNGRHojgMp5
         VGPjw1xSQAcPe3AGEUCD4Gqp0Kr3y/OwEyoz2yFEa9EMCz3/6Q5l6s0C9muSpZKdScLR
         tmyH5EHyZJFRKZ1JKb+NqqXsBzUIUb452V0+5pb8yLBN61mcf/9HXvVmhCNAK3E/0gn1
         RRCA==
X-Gm-Message-State: AOJu0YwPbrlDJQ07UsRET2ThUijXGMCLAwc8ViZ13OhflCMVrjSxzlAq
	sg+TxuhSsjBD6XLwpA/8z1oB1tAGoFMPb6jhDXU=
X-Google-Smtp-Source: AGHT+IFvUCnFgyK9i13VaEXNE34h/h4gcuX1tH4+6HCjwCaL4SJVc0h2pR7kh88REbYgDCZX/eh1V6sRdE9nCWovTng=
X-Received: by 2002:adf:f3ce:0:b0:31a:ea9f:1aa6 with SMTP id
 g14-20020adff3ce000000b0031aea9f1aa6mr1596941wrp.47.1693408448784; Wed, 30
 Aug 2023 08:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com>
 <CAMKF1sriZM2ykf_b4Yfn+ZnQ1G7-LU-Fp+4_WY45T4ch3sv83w@mail.gmail.com>
 <CA+chaQd8qGX8g4PSKJo0N3O=n9J08kc_6NR0GKg2jXxV6e8rKQ@mail.gmail.com> <CAMKF1sodWqwsR2bzHP6KX=6wtihCbwZTTE_Q3e31gFQF2G7yqQ@mail.gmail.com>
In-Reply-To: <CAMKF1sodWqwsR2bzHP6KX=6wtihCbwZTTE_Q3e31gFQF2G7yqQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 17:13:45 +0200
Message-ID: <CA+chaQfXpU4AmQ8_AHnbAjAq_UDnWZFtFRrWQ9G8H7LcD2jC6A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libfaketime: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Content-Type: multipart/alternative; boundary="0000000000000caead0604256108"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 15:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104669

--0000000000000caead0604256108
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And does it really need to be installed in "${libdir}/faketime"
subdirectory?

If yes, can we at least avoid the symlinks, e.g. with:

FILES:${PN} =3D "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
FILES:${PN}-dev +=3D "${libdir}/faketime/lib*${SOLIBSDEV}"

I'll send RFC patch which fixes the build with mulilib, but I don't use
libfaketime (and I haven't read the discussion on previous versions of this
patch, so sending only as RFC for Tymotheusz to review),

On Wed, Aug 30, 2023 at 4:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Wed, Aug 30, 2023 at 12:33=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com>
> wrote:
> >
> > Can we name the lib${PN} package differently, e.g. libfaketime? With
> multilib the package name is ridiculous lib32-liblib32-libfaketime:
> >
> > ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA Issue: non
> -dev/-dbg/nativesdk- package lib32-liblib32-libfaketime contains symlink
> .so '/usr/lib32/faketime/libfaketime.so' [dev-so]
>
> yes, I think I had that feedback in mind but I forgot to provide it.
> We should be fine to rename lib${PN} -> ${PN}
> >
> > On Sat, Aug 19, 2023 at 8:39=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> fails to build with clang
> >> https://errors.yoctoproject.org/Errors/Details/732361/
> >>
> >> On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak
> >> <tymoteusz.burak@3mdeb.com> wrote:
> >> >
> >> > This commit adds the libfaketime library recipe, which provides time
> >> > manipulation capabilities for testing and debugging purposes.
> libfaketime allows
> >> > developers to modify the system time reported to applications, aidin=
g
> in scenarios
> >> > where accurate time emulation is required.
> >> >
> >> > GitHub Repository: https://github.com/wolfcw/libfaketime
> >> >
> >> > Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> >> > ---
> >> >  .../libfaketime/libfaketime_0.9.10.bb         | 34
> +++++++++++++++++++
> >> >  1 file changed, 34 insertions(+)
> >> >  create mode 100644 meta-oe/recipes-test/libfaketime/
> libfaketime_0.9.10.bb
> >> >
> >> > diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> >> > new file mode 100644
> >> > index 000000000000..f26e5b0db872
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> >> > @@ -0,0 +1,34 @@
> >> > +DESCRIPTION =3D "A library for faking the system time in user-space
> programs"
> >> > +SECTION =3D "libs"
> >> > +LICENSE =3D "GPL-2.0-only"
> >> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >> > +
> >> > +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
> >> > +SRC_URI =3D "\
> >> > +    git://
> git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=3Dhttps \
> >> > +    "
> >> > +
> >> > +S =3D "${WORKDIR}/git"
> >> > +
> >> > +EXTRA_OEMAKE +=3D "\
> >> > +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
> >> > +    "
> >> > +
> >> > +do_configure[noexec] =3D "1"
> >> > +do_compile () {
> >> > +    oe_runmake
> >> > +}
> >> > +do_install () {
> >> > +    install -d ${D}${libdir}/faketime
> >> > +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> >> > +    install -d ${D}${bindir}
> >> > +    install -m 0755 src/faketime ${D}${bindir}
> >> > +}
> >> > +
> >> > +PACKAGES =3D+ "lib${PN}"
> >> > +
> >> > +FILES:${PN} =3D "${bindir}/faketime"
> >> > +FILES:lib${PN} =3D "${libdir}/faketime/*"
> >> > +
> >> > +INSANE_SKIP:${PN} +=3D "dev-so"
> >> > +INSANE_SKIP:lib${PN} +=3D "dev-so"
> >> > --
> >> > 2.41.0
> >> >
> >> >
> >> >
> >> >
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#104494):
> https://lists.openembedded.org/g/openembedded-devel/message/104494
> >> Mute This Topic: https://lists.openembedded.org/mt/100817966/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [Martin.Jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000000caead0604256108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>And does it really need to be installed in=C2=A0&quot=
;${libdir}/faketime&quot; subdirectory?</div><div><br></div><div>If yes, ca=
n we at least avoid the symlinks, e.g. with:</div><div><br></div><div>FILES=
:${PN} =3D &quot;${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}&quot;<=
br>FILES:${PN}-dev +=3D &quot;${libdir}/faketime/lib*${SOLIBSDEV}&quot;</di=
v><div><br></div><div>I&#39;ll send RFC patch which fixes the build with mu=
lilib, but I don&#39;t use libfaketime (and I haven&#39;t read the discussi=
on on previous versions of this patch, so sending only as RFC for Tymotheus=
z to review),</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Aug 30, 2023 at 4:41=E2=80=AFPM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug 30, 2023 a=
t 12:33=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Can we name the lib${PN} package differently, e.g. libfaketime? With m=
ultilib the package name is ridiculous lib32-liblib32-libfaketime:<br>
&gt;<br>
&gt; ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA Issue: non -dev/-=
dbg/nativesdk- package lib32-liblib32-libfaketime contains symlink .so &#39=
;/usr/lib32/faketime/libfaketime.so&#39; [dev-so]<br>
<br>
yes, I think I had that feedback in mind but I forgot to provide it.<br>
We should be fine to rename lib${PN} -&gt; ${PN}<br>
&gt;<br>
&gt; On Sat, Aug 19, 2023 at 8:39=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; fails to build with clang<br>
&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/732361/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/732361/</a><br>
&gt;&gt;<br>
&gt;&gt; On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak<br>
&gt;&gt; &lt;<a href=3D"mailto:tymoteusz.burak@3mdeb.com" target=3D"_blank"=
>tymoteusz.burak@3mdeb.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This commit adds the libfaketime library recipe, which provid=
es time<br>
&gt;&gt; &gt; manipulation capabilities for testing and debugging purposes.=
 libfaketime allows<br>
&gt;&gt; &gt; developers to modify the system time reported to applications=
, aiding in scenarios<br>
&gt;&gt; &gt; where accurate time emulation is required.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; GitHub Repository: <a href=3D"https://github.com/wolfcw/libfa=
ketime" rel=3D"noreferrer" target=3D"_blank">https://github.com/wolfcw/libf=
aketime</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteus=
z.burak@3mdeb.com" target=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../libfaketime/<a href=3D"http://libfaketime_0.9.10.bb=
" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 34 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 34 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-test/libfaketime/<a =
href=3D"http://libfaketime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">=
libfaketime_0.9.10.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-test/libfaketime/<a href=3D"http=
://libfaketime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_=
0.9.10.bb</a> b/meta-oe/recipes-test/libfaketime/<a href=3D"http://libfaket=
ime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.bb</=
a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000000..f26e5b0db872<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-test/libfaketime/<a href=3D"http://libf=
aketime_0.9.10.bb" rel=3D"noreferrer" target=3D"_blank">libfaketime_0.9.10.=
bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,34 @@<br>
&gt;&gt; &gt; +DESCRIPTION =3D &quot;A library for faking the system time i=
n user-space programs&quot;<br>
&gt;&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt;&gt; &gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SRCREV =3D &quot;d475b925943ad404c6c728ac868dc73949e7281c&qu=
ot;<br>
&gt;&gt; &gt; +SRC_URI =3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://git@github.com/wolfcw/=
libfaketime.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=
=3Dhttps</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +EXTRA_OEMAKE +=3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 EXTRA_FLAGS=3D&#39;-Wno-error=3Dnonnull-compar=
e&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +do_configure[noexec] =3D &quot;1&quot;<br>
&gt;&gt; &gt; +do_compile () {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 oe_runmake<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +do_install () {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/faketime<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 oe_libinstall -C src libfaketime ${D}${libdir}=
/faketime<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -m 0755 src/faketime ${D}${bindir}<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +PACKAGES =3D+ &quot;lib${PN}&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +FILES:${PN} =3D &quot;${bindir}/faketime&quot;<br>
&gt;&gt; &gt; +FILES:lib${PN} =3D &quot;${libdir}/faketime/*&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;dev-so&quot;<br>
&gt;&gt; &gt; +INSANE_SKIP:lib${PN} +=3D &quot;dev-so&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.41.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#104494): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/104494" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/104494</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1008=
17966/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/100817966/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000000caead0604256108--

