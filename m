Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.5123.1619261132687653474
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JVVeN3oJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l4so77322687ejc.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qphf+5eYb7uFNNHjI294iYouRhOJLRT6vKSa8579wck=;
        b=JVVeN3oJe96aYQ4MS5SyMUAm99Dr3JgBFpJSKxfXZ6YHx4HrudXPbzoFrMtxYyPEam
         S4MxDS5La5wDZQbALbDdGscJwejIWHUNtAd//x8po7jLXryBOlQ3SAlEupOLYoAYaFbk
         YYkV/zf+CBX9pIBYqfE/YHXbb+FV3RWgY//+R8nbeJZ/fVAIP1Yu9u8YnAD8Wtgvh4b5
         pC5pIz4/NWJmArDUxgD219RENqKjK9ymDeC3zf4P8SFGDc0bTEgz+LbHpoSrbWoX2rFp
         vCfhZNxEoqsz1HhmJy1/IrSZZCnbNTJxLyHsfMFrnoQI9bp/0u1zK2ZyzExa66DnQ4iG
         YS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qphf+5eYb7uFNNHjI294iYouRhOJLRT6vKSa8579wck=;
        b=d0huJb5T0u9lrWA1BLY6vXb0CnDVyAlSpja5euY1S0AHbI+9AFJMBh4rsrTb3g8B9U
         G+SW1jquMNZvleV1IplwMPGSuPsIkfJa6KaNasDu7tdpiQ6j0rhxpgFr2yYxZPKb1JkZ
         VAnTMml4IQ1gj7niU7AiIOX5Rc28wwJWzVETnCtgygDmdeLY5EOffwZ3QguYxC2esrD+
         nNbWguQKJp+CVjoTSWuseQ0nsWhwxJs+UWTbYHuGSnaoe31L0awO4RkxYcU8IDHBqhEH
         KW2D8RaqxymeWLGm+gy4JJocgk+B5GFPl95Vu5cu7eH2mkXcs2WMg80WQvjPEOsQwps2
         V3Zw==
X-Gm-Message-State: AOAM531phcr0NtTQDZ9d+vu2g0mm+vK79kV1MgLR6c9QRVIzw5mtb0jB
	wbAJcUyVHzi5zPsq/86ZHZDSlxlIUn9P7V76MAo=
X-Google-Smtp-Source: ABdhPJzTu9i6thiIex1bLR1VNG4CfCSSwFTU9Y0gHF6YVmFm6v5HAZ4u5+F+kuvnf1qYRQmxu/WgjOVBiO51gnNdQaI=
X-Received: by 2002:a17:906:eb4a:: with SMTP id mc10mr8655797ejb.392.1619261130917;
 Sat, 24 Apr 2021 03:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
In-Reply-To: <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 24 Apr 2021 03:45:19 -0700
Message-ID: <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000081cc3805c0b59cc6"

--00000000000081cc3805c0b59cc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why do you want to build only the daemon?

There are already 4 variants of this recipe in various layers (at least by
what's reported on layerindex):
http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro/recipe=
s-kernel/gator/gator_git.bb?h=3Dmaster
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-c=
ore/gator/gator_git.bb
https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/gator/gat=
or_git.bb
https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtools/gato=
r/gator_git.bb

so sharing some recipe which would suit most of these needs in meta-oe is
definitely welcome, but starting with just a daemon will just complicate
things to these layers.

But I understand that building the kernel modules for wider range of
kernels in different MACHINEs is quite pain (been there:
https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a96cefef=
a49ebf397a383a88f1
and given up shortly after:
https://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfad780fc3=
9fef47d55d4d6e698d
as I don't really use gator, it was just one of many build issues in
'bitbake world' I was looking at).

Regards,

On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:

> Hi,
>
> I have some questions regarding my patch.
>
> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
> >
> > To communicate with the target device, Streamline requires the
> > gator daemon, gatord, to be running on the device.
>
> Is gator the correct name for this package? or would gatord be better?
>
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24 ++++++++++++++++++=
+
> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 +++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644
> meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> >
> > diff --git
> a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> > new file mode 100644
> > index 000000000000..8e59fffa1fc2
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> > @@ -0,0 +1,24 @@
> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 200=
1
> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsig=
ht.tech>
> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
> > +Subject: [PATCH] gator: don't strip debug
> > +
> > +---
> > + daemon/Makefile | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git a/daemon/Makefile b/daemon/Makefile
> > +index ba5f29cfeb10..6807948310f9 100644
> > +--- a/daemon/Makefile
> > ++++ b/daemon/Makefile
> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1
> -d.` \>=3D 5),1)
> > +       CXXFLAGS +=3D -fno-sized-deallocation
> > + endif
> > +
> > +-# -s strips the binary of debug info
> > +-LDFLAGS     +=3D -s
> > + LDLIBS      +=3D -lrt -lm -pthread
> > + TARGET      :=3D $(OBJ_DIR)gatord
> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> > +--
> > +2.25.1
> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> > new file mode 100644
> > index 000000000000..8e15b1ca5fc5
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline
> Performance Analyzer."
> > +
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
>
> Gator git specifies that:
>
> -libsensors source code in daemon/libsensors licensed under
> LGPL-2.1-or-later
> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
> Mini-XML-exception
> -perf_event.h from Linux userspace kernel headers in daemon/k licensed
> under GPL-2.0-only WITH Linux-syscall-note.
>
> I'm not sure how to properly reflect this in the recipe.
>
> Thanks for your help,
> Clement
>
> > +
> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> > +SRC_URI =3D "git://
> github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmaster \
> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> > +         "
> > +
> > +S =3D "${WORKDIR}/git/daemon"
> > +
> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SO=
URCE
> -DETCDIR=3D\"${sysconfdir}\"' \
> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}'
> 'CROSS_COMPILE=3D${TARGET_PREFIX}' \
> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${CC}'
> CXX=3D'${CXX}'"
> > +
> > +do_install() {
> > +       install -d ${D}${sbindir}
> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> > +}
> > --
> > 2.25.1
> >
>
>=20
>
>

--00000000000081cc3805c0b59cc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why do you want to build only the daemon?<div><br></div><d=
iv>There are already 4 variants of this recipe in various layers (at least =
by what&#39;s reported on layerindex):</div><div><a href=3D"http://git.lina=
ro.org/openembedded/meta-linaro.git/tree/meta-linaro/recipes-kernel/gator/g=
ator_git.bb?h=3Dmaster">http://git.linaro.org/openembedded/meta-linaro.git/=
tree/meta-linaro/recipes-kernel/gator/gator_git.bb?h=3Dmaster</a><br></div>=
<div><a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta-=
webos/recipes-core/gator/gator_git.bb">https://github.com/webosose/meta-web=
osose/blob/master/meta-webos/recipes-core/gator/gator_git.bb</a><br></div><=
div><a href=3D"https://github.com/kratsg/meta-l1calo/blob/master/recipes-ke=
rnel/gator/gator_git.bb">https://github.com/kratsg/meta-l1calo/blob/master/=
recipes-kernel/gator/gator_git.bb</a><br></div><div><a href=3D"https://gith=
ub.com/robseb/meta-intelfpga/blob/master/recipes-devtools/gator/gator_git.b=
b">https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtools/ga=
tor/gator_git.bb</a><br></div><div><br></div><div>so sharing some recipe wh=
ich would suit most of these needs in meta-oe is definitely welcome, but st=
arting with just a daemon will just complicate things to these layers.</div=
><div><br></div><div>But I understand that building the kernel modules for =
wider range of kernels in different MACHINEs is quite pain (been there:</di=
v><div><a href=3D"https://github.com/shr-project/meta-webosose/commit/f4674=
ac6fa18a0a96cefefa49ebf397a383a88f1">https://github.com/shr-project/meta-we=
bosose/commit/f4674ac6fa18a0a96cefefa49ebf397a383a88f1</a><br></div><div>an=
d given up shortly after:</div><div><a href=3D"https://github.com/shr-proje=
ct/meta-webosose/commit/d4bc575623dfbfad780fc39fef47d55d4d6e698d">https://g=
ithub.com/shr-project/meta-webosose/commit/d4bc575623dfbfad780fc39fef47d55d=
4d6e698d</a><br></div><div>as I don&#39;t really use gator, it was just one=
 of many build issues in &#39;bitbake world&#39; I was looking at).</div><d=
iv><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9men=
t P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi,<br>
<br>
I have some questions regarding my patch.<br>
<br>
On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailt=
o:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; To communicate with the target device, Streamline requires the<br>
&gt; gator daemon, gatord, to be running on the device.<br>
<br>
Is gator the correct name for this package? or would gatord be better?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cl=
em@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gator/0001-gator-don-t-strip-debug.patch=C2=A0 | 24 +++++++=
++++++++++++<br>
&gt;=C2=A0 meta-oe/recipes-devtools/gator/<a href=3D"http://gator_7.5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a> | 22 ++++++++++++=
+++++<br>
&gt;=C2=A0 2 files changed, 46 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-ga=
tor-don-t-strip-debug.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/gator/<a href=3D"ht=
tp://gator_7.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a=
><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-st=
rip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-str=
ip-debug.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..8e59fffa1fc2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-deb=
ug.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D &lt;cpe@ou=
tsight.tech&gt;<br>
&gt; +Date: Fri, 16 Apr 2021 15:27:16 +0200<br>
&gt; +Subject: [PATCH] gator: don&#39;t strip debug<br>
&gt; +<br>
&gt; +---<br>
&gt; + daemon/Makefile | 2 --<br>
&gt; + 1 file changed, 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/daemon/Makefile b/daemon/Makefile<br>
&gt; +index ba5f29cfeb10..6807948310f9 100644<br>
&gt; +--- a/daemon/Makefile<br>
&gt; ++++ b/daemon/Makefile<br>
&gt; +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 =
-d.` \&gt;=3D 5),1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS +=3D -fno-sized-deallocation<br>
&gt; + endif<br>
&gt; +<br>
&gt; +-# -s strips the binary of debug info<br>
&gt; +-LDFLAGS=C2=A0 =C2=A0 =C2=A0+=3D -s<br>
&gt; + LDLIBS=C2=A0 =C2=A0 =C2=A0 +=3D -lrt -lm -pthread<br>
&gt; + TARGET=C2=A0 =C2=A0 =C2=A0 :=3D $(OBJ_DIR)gatord<br>
&gt; + ESCAPE_EXE=C2=A0 :=3D $(OBJ_DIR)escape/escape<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; diff --git a/meta-oe/recipes-devtools/gator/<a href=3D"http://gator_7=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a> b/meta-oe/=
recipes-devtools/gator/<a href=3D"http://gator_7.5.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">gator_7.5.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000000..8e15b1ca5fc5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/gator/<a href=3D"http://gator_7.5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a><br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +SUMMARY =3D &quot;DS-5 Streamine Gator daemon&quot;<br>
&gt; +DESCRIPTION =3D &quot;Target-side daemon gathering data for ARM Stre=
amline Performance Analyzer.&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263&quot;<br>
&gt; +LICENSE_libsensors =3D &quot;LGPL-2.1-or-later&quot;<br>
<br>
Gator git specifies that:<br>
<br>
-libsensors source code in daemon/libsensors licensed under LGPL-2.1-or-la=
ter<br>
-mxml source code in daemon/mxml licensed under APACHE-2.0 WITH<br>
Mini-XML-exception<br>
-perf_event.h from Linux userspace kernel headers in daemon/k licensed<br>
under GPL-2.0-only WITH Linux-syscall-note.<br>
<br>
I&#39;m not sure how to properly reflect this in the recipe.<br>
<br>
Thanks for your help,<br>
Clement<br>
<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;6088d3533146d7b7c9700b8e396292053240b25f&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ARM-software/ga=
tor.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blan=
k">github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmaster</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gator-don-t-strip-deb=
ug.patch;patchdir=3D.. \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git/daemon&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &quot;&#39;CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_=
DEFAULT_SOURCE -DETCDIR=3D\&quot;${sysconfdir}\&quot;&#39; \<br>
&gt; +=C2=A0 =C2=A0 &#39;LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}&#39; &#39;=
CROSS_COMPILE=3D${TARGET_PREFIX}&#39; \<br>
&gt; +=C2=A0 =C2=A0 &#39;CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtt=
i&#39; CC=3D&#39;${CC}&#39; CXX=3D&#39;${CXX}&#39;&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sbindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/gatord ${D}${sbindir=
}/gatord<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000081cc3805c0b59cc6--
