Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.16923.1599307831001812782
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bqfIA0IO;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id z9so9138568wmk.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6cfoNgL9JAzIn7sgzMHBrMVZOC0RbCOc+RUK9vkIz00=;
        b=bqfIA0IOg3QqH2j5bH10PWtgZFXfWYF5nGa+OPUuqa5Jon5F4bzjKZH83VGu6ylPm2
         C3gUQzAzvo9+8UH3Nw+0+93euOCcmRAAtJfVA1b7YpaNsv08BXrIC0lM9mOhhSEPZtLt
         ZwuTSUhTO7XCemb+G9kQt1TDWm/MjTxc/z0oPD5wU6zEA1P+4RmZ6TF+jTK2uIDjAFnm
         Jht1MLI2Zg8Fd709blQu/vTkXYw9texDu82PCt3tZjvY0pWGbU/Lw9yRJ7KJNZ5jzoRs
         9wZ8HVZrSkefQgs5I4ACJ1qQDHUAdmpFhCfbFHjH2M3hxLJ31c61TNrGDrHpTeVTew1l
         qFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6cfoNgL9JAzIn7sgzMHBrMVZOC0RbCOc+RUK9vkIz00=;
        b=CapCuH3Bwa5UT/R19R9DsnfsM+hI2giSDuSGGkS7J8kGkuw80wNpCtl2Y7v4SM7Ux2
         wk9/kcxdcxpQ8AfAsK0E6WbE8eyaZSdUQgkCGFt0d7Qod3XaVPkSuqFogO3OzyyOaNcY
         DnGUybpx4iq10EWsIfhrHw5Ik7VM0Y5NkU2BcoPww7LQVCXIGxppEltc0SiPua3KJ/OP
         G54S/qy9HJhGAAX6D+OlE83JL/0TJ5FuSReKR7ewVErnxjwxSqFw/KWbyfOsZorC1cNj
         0Sg6HUW9SXFutKlygDOjP/0PbSamRBgl0nG2WdZPdIl1T3dJqN+EziB3XeE5rGlWipeH
         Mg/Q==
X-Gm-Message-State: AOAM531M5r7FIuCPRN/qCoqt4uxLk8sSbQAxZOdEPRlAAD34xJjbz+70
	sd354cdLdEaNA2yK0zkikMOschHwH4wfUFeQrPU=
X-Google-Smtp-Source: ABdhPJzRgpktSpeEH8YN9m8B+0d1j5PpHVa6m8/pBPlSfVI/3BYIrRm35DTGDRM/IWIYzEjGaIH9GJnGDHHzXv1GPQ4=
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr11523627wmb.44.1599307829225;
 Sat, 05 Sep 2020 05:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200905074918.23065-1-costamagnagianfranco@yahoo.it> <CAMKF1soiXY_0SqpuFk34o7U+dZ4+5BtqR49jsKnTAuFi6Qj0vQ@mail.gmail.com>
In-Reply-To: <CAMKF1soiXY_0SqpuFk34o7U+dZ4+5BtqR49jsKnTAuFi6Qj0vQ@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Sat, 5 Sep 2020 14:10:17 +0200
Message-ID: <CAATN8PWZR0i4nQ2gvLKYMQ8LBD-CAi4B273Y+0CxoO4ozUietg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="0000000000000c2e3e05ae8fdf8f"

--0000000000000c2e3e05ae8fdf8f
Content-Type: text/plain; charset="UTF-8"

Debased and sent thanks

G.

On Sat, Sep 5, 2020, 09:54 Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 5, 2020 at 12:49 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > cherry-pick upstream fix for pkg-config based detection failure
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../recipes-extended/brotli/brotli/838.patch  | 48 +++++++++++++++++++
> >  .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
> >  2 files changed, 52 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
> >  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb =>
> brotli_1.0.9.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch
> b/meta-oe/recipes-extended/brotli/brotli/838.patch
> > new file mode 100644
> > index 000000000..98b888760
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
> > @@ -0,0 +1,48 @@
> > +Upstream-Status: Backport [https://github.com/google/brotli/pull/838]
>
> I ended up merging your V2, please rebase this on master and resend
> just the delta
>
> > +From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 2001
> > +From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
> > +Date: Wed, 2 Sep 2020 10:49:49 +0200
> > +Subject: [PATCH] Revert "Add runtime linker path to pkg-config files
> (#740)"
> > +
> > +This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
> > +---
> > + scripts/libbrotlicommon.pc.in | 2 +-
> > + scripts/libbrotlidec.pc.in    | 2 +-
> > + scripts/libbrotlienc.pc.in    | 2 +-
> > + 3 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/scripts/libbrotlicommon.pc.in b/scripts/
> libbrotlicommon.pc.in
> > +index 10ca969e..2a8cf7a3 100644
> > +--- a/scripts/libbrotlicommon.pc.in
> > ++++ b/scripts/libbrotlicommon.pc.in
> > +@@ -7,5 +7,5 @@ Name: libbrotlicommon
> > + URL: https://github.com/google/brotli
> > + Description: Brotli common dictionary library
> > + Version: @PACKAGE_VERSION@
> > +-Libs: -L${libdir} -R${libdir} -lbrotlicommon
> > ++Libs: -L${libdir} -lbrotlicommon
> > + Cflags: -I${includedir}
> > +diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
> > +index e7c3124f..6f8ef2e4 100644
> > +--- a/scripts/libbrotlidec.pc.in
> > ++++ b/scripts/libbrotlidec.pc.in
> > +@@ -7,6 +7,6 @@ Name: libbrotlidec
> > + URL: https://github.com/google/brotli
> > + Description: Brotli decoder library
> > + Version: @PACKAGE_VERSION@
> > +-Libs: -L${libdir} -R${libdir} -lbrotlidec
> > ++Libs: -L${libdir} -lbrotlidec
> > + Requires.private: libbrotlicommon >= 1.0.2
> > + Cflags: -I${includedir}
> > +diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
> > +index 4dd0811b..2098afe2 100644
> > +--- a/scripts/libbrotlienc.pc.in
> > ++++ b/scripts/libbrotlienc.pc.in
> > +@@ -7,6 +7,6 @@ Name: libbrotlienc
> > + URL: https://github.com/google/brotli
> > + Description: Brotli encoder library
> > + Version: @PACKAGE_VERSION@
> > +-Libs: -L${libdir} -R${libdir} -lbrotlienc
> > ++Libs: -L${libdir} -lbrotlienc
> > + Requires.private: libbrotlicommon >= 1.0.2
> > + Cflags: -I${includedir}
> > diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > similarity index 81%
> > rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> > rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > index 32f855844..0038ba74d 100644
> > --- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> > +++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > @@ -6,9 +6,10 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
> >
> > -SRC_URI = "git://github.com/google/brotli.git"
> > -# tag 1.0.7
> > -SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
> > +SRC_URI = "git://github.com/google/brotli.git \
> > +           file://838.patch "
> > +# tag 1.0.9
> > +SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
> >  S = "${WORKDIR}/git"
> >
> >  inherit cmake lib_package
> > --
> > 2.17.1
> >
> > 
>

--0000000000000c2e3e05ae8fdf8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Debased and sent thanks<div dir=3D"auto"><br></div><div d=
ir=3D"auto">G.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Sep 5, 2020, 09:54 Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Sat, Sep 5, 2020 at 12:49 AM Gianfranco<b=
r>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; cherry-pick upstream fix for pkg-config based detection failure<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfra=
nco@yahoo.it</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.o=
rg</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-extended/brotli/brotli/838.patch=C2=A0 | 48 +++++++=
++++++++++++<br>
&gt;=C2=A0 .../{<a href=3D"http://brotli_1.0.7.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">brotli_1.0.7.bb</a> =3D&gt; <a href=3D"http://brot=
li_1.0.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.9.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +--<br>
&gt;=C2=A0 2 files changed, 52 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.p=
atch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotl=
i_1.0.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.7.bb=
</a> =3D&gt; <a href=3D"http://brotli_1.0.9.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">brotli_1.0.9.bb</a>} (81%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-=
oe/recipes-extended/brotli/brotli/838.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..98b888760<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/google/brot=
li/pull/838" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github=
.com/google/brotli/pull/838</a>]<br>
<br>
I ended up merging your V2, please rebase this on master and resend<br>
just the delta<br>
<br>
&gt; +From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Evgenii Kliuchnikov &lt;<a href=3D"mailto:eustas.ru@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">eustas.ru@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 2 Sep 2020 10:49:49 +0200<br>
&gt; +Subject: [PATCH] Revert &quot;Add runtime linker path to pkg-config =
files (#740)&quot;<br>
&gt; +<br>
&gt; +This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.<br>
&gt; +---<br>
&gt; + scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"noreferrer =
noreferrer" target=3D"_blank">libbrotlicommon.pc.in</a> | 2 +-<br>
&gt; + scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">libbrotlidec.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; + scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">libbrotlienc.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; + 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libbrotlicommon.pc.in</a> b/scrip=
ts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">libbrotlicommon.pc.in</a><br>
&gt; +index 10ca969e..2a8cf7a3 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">libbrotlicommon.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">libbrotlicommon.pc.in</a><br>
&gt; +@@ -7,5 +7,5 @@ Name: libbrotlicommon<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli common dictionary library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlicommon<br>
&gt; ++Libs: -L${libdir} -lbrotlicommon<br>
&gt; + Cflags: -I${includedir}<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">libbrotlidec.pc.in</a> b/scripts/<a =
href=3D"http://libbrotlidec.pc.in" rel=3D"noreferrer noreferrer" target=3D"=
_blank">libbrotlidec.pc.in</a><br>
&gt; +index e7c3124f..6f8ef2e4 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">libbrotlidec.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">libbrotlidec.pc.in</a><br>
&gt; +@@ -7,6 +7,6 @@ Name: libbrotlidec<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli decoder library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlidec<br>
&gt; ++Libs: -L${libdir} -lbrotlidec<br>
&gt; + Requires.private: libbrotlicommon &gt;=3D 1.0.2<br>
&gt; + Cflags: -I${includedir}<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">libbrotlienc.pc.in</a> b/scripts/<a =
href=3D"http://libbrotlienc.pc.in" rel=3D"noreferrer noreferrer" target=3D"=
_blank">libbrotlienc.pc.in</a><br>
&gt; +index 4dd0811b..2098afe2 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">libbrotlienc.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">libbrotlienc.pc.in</a><br>
&gt; +@@ -7,6 +7,6 @@ Name: libbrotlienc<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli encoder library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlienc<br>
&gt; ++Libs: -L${libdir} -lbrotlienc<br>
&gt; + Requires.private: libbrotlicommon &gt;=3D 1.0.2<br>
&gt; + Cflags: -I${includedir}<br>
&gt; diff --git a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli=
_1.0.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.7.bb<=
/a> b/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; similarity index 81%<br>
&gt; rename from meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_=
1.0.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.7.bb</=
a><br>
&gt; rename to meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.=
0.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.9.bb</a>=
<br>
&gt; index 32f855844..0038ba74d 100644<br>
&gt; --- a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.7.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.7.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; @@ -6,9 +6,10 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/g=
oogle/brotli/issues" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/google/brotli/issues</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3D941ee9cd16=
09382f946352712a319b4b&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.g=
it" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/google/brotl=
i.git</a>&quot;<br>
&gt; -# tag 1.0.7<br>
&gt; -SRCREV=3D &quot;d6d98957ca8ccb1ef45922e978bb10efca0ea541&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.g=
it" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/google/brotl=
i.git</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://838.patch &quot;<br>
&gt; +# tag 1.0.9<br>
&gt; +SRCREV=3D &quot;e61745a6b7add50d380cfd7d3883dd6c62fc2c71&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake lib_package<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000000c2e3e05ae8fdf8f--
