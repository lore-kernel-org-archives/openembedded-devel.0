Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.14193.1599292191873390243
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 00:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o0Y/s9gg;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id z9so8792389wmk.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdXAUxeuLGCIdrthda9eweTFp7cxRZYHr62iJLKL28g=;
        b=o0Y/s9ggpvcf1CBXq4LfrIoa0tg9VDLIwvm4IbOb3kCQR3OVHRGSME6WQ6/6mWjwZh
         UZQYjI8N8pxAKZgPAwqSWWi9rf7c7S+0NlGL5z8MM/oDB+fM61MnbLK1brLJYoT6C1O1
         rW3400ZQ4Z8WfmyV0aKs/omVMRxoSmKOm/ScqVzvl2nex5s0oPjMWwxXw1fV3wQMaD73
         TUB7U5pTr/vHv4g7LQh5yJQ67Mtdrj6Sbr/5HtFLA5CJoN1I/LnH7eqPwghFB7fJtPYx
         tunVANAMDHSkryRNWRAMZ6WFUhFDemSkcds8bUbIamskl4ngYZu2u43LVNXMEd4cNErW
         A4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdXAUxeuLGCIdrthda9eweTFp7cxRZYHr62iJLKL28g=;
        b=jjYUPquVBhwZP/piyI3i2KuKyMpPLzup1XyzLdnz3BUNROsNBvKiNSbXw56w+53Igu
         /fJ9KTgRIu+YOEGABc9vu5OBEsDVcFfXloranpL3jIFGlrz1Ihit7r1Rs9R1vbjD/2jS
         oF+YkiHC/SdUI6tlUse/mbgTfypKlX/B2xEgLSpZr+9/DfoJXrd0nYkUDAy3wj/jrxxj
         04dunycBVhTiZTPpVjGFnK0P7r+JQh667OzU3YFPQ0S86DCVCCA5opWrjWofcL2eT1Gw
         J69sgeSZax7E1brvRNiXa3MEvamxYaArONpgPRWgQDLpciCRCP3Jo+A17Iq+bwxdrvGE
         YOjg==
X-Gm-Message-State: AOAM533nEpVvwYMb4FjEsmSG6XQr668Pk8B0qOpnfjDzdpWRowqkC+Me
	PvZl6ViOL413kfaccDvOsp+5/nd5Ybm+5tKXhGo=
X-Google-Smtp-Source: ABdhPJwBOUQ6LE0IW2bMXLmLUcVMVdZZyagsYdfj/1fmd0S+Y9pPCaPBTUZ5JwR6XqTsRiocfUIXjTxX1CiaXcbgR7s=
X-Received: by 2002:a1c:4187:: with SMTP id o129mr10899082wma.113.1599292190207;
 Sat, 05 Sep 2020 00:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200904221358.14528-1-costamagnagianfranco@yahoo.it> <CAMKF1spxe83GwPAzSADwf2R2G2q1qLzF8_kC7tp7hc61xaH0-Q@mail.gmail.com>
In-Reply-To: <CAMKF1spxe83GwPAzSADwf2R2G2q1qLzF8_kC7tp7hc61xaH0-Q@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Sat, 5 Sep 2020 09:49:38 +0200
Message-ID: <CAATN8PWj8Qby=C5XcBTQKiNRqe7jHXHnb4LM+83yWco1wSrvnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000e3b22b05ae8c3a9d"

--000000000000e3b22b05ae8c3a9d
Content-Type: text/plain; charset="UTF-8"

This patch is a backport. Resubmitted!

G.

Il giorno sab 5 set 2020 alle ore 03:41 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Fri, Sep 4, 2020 at 3:14 PM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > cherry-pick upstream fix for pkg-config based detection failure
> >
>
> Is this patch reverted upstream? if so please add appropriate
> Upstream-Status field for it in the patch header.
>
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../recipes-extended/brotli/brotli/838.patch  | 47 +++++++++++++++++++
> >  .../{brotli_1.0.7.bb => brotli_1.0.9.bb}      |  7 +--
> >  2 files changed, 51 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
> >  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb =>
> brotli_1.0.9.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch
> b/meta-oe/recipes-extended/brotli/brotli/838.patch
> > new file mode 100644
> > index 000000000..8ecf2e4c9
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
> > @@ -0,0 +1,47 @@
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

--000000000000e3b22b05ae8c3a9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch is a backport. Resubmitted!</div><div><br>=
</div><div>G.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Il giorno sab 5 set 2020 alle ore 03:41 Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Sep 4=
, 2020 at 3:14 PM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">c=
ostamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; cherry-pick upstream fix for pkg-config based detection failure<br>
&gt;<br>
<br>
Is this patch reverted upstream? if so please add appropriate<br>
Upstream-Status field for it in the patch header.<br>
<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt=
;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-extended/brotli/brotli/838.patch=C2=A0 | 47 +++++++=
++++++++++++<br>
&gt;=C2=A0 .../{<a href=3D"http://brotli_1.0.7.bb" rel=3D"noreferrer" targ=
et=3D"_blank">brotli_1.0.7.bb</a> =3D&gt; <a href=3D"http://brotli_1.0.9.bb=
" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 +--<br>
&gt;=C2=A0 2 files changed, 51 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/brotli/brotli/838.p=
atch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotl=
i_1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a> =3D&gt=
; <a href=3D"http://brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">b=
rotli_1.0.9.bb</a>} (81%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-=
oe/recipes-extended/brotli/brotli/838.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8ecf2e4c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/brotli/brotli/838.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Evgenii Kliuchnikov &lt;<a href=3D"mailto:eustas.ru@gmail.com"=
 target=3D"_blank">eustas.ru@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 2 Sep 2020 10:49:49 +0200<br>
&gt; +Subject: [PATCH] Revert &quot;Add runtime linker path to pkg-config =
files (#740)&quot;<br>
&gt; +<br>
&gt; +This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.<br>
&gt; +---<br>
&gt; + scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">libbrotlicommon.pc.in</a> | 2 +-<br>
&gt; + scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferrer" ta=
rget=3D"_blank">libbrotlidec.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; + scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferrer" ta=
rget=3D"_blank">libbrotlienc.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt; + 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D=
"noreferrer" target=3D"_blank">libbrotlicommon.pc.in</a> b/scripts/<a href=
=3D"http://libbrotlicommon.pc.in" rel=3D"noreferrer" target=3D"_blank">lib=
brotlicommon.pc.in</a><br>
&gt; +index 10ca969e..2a8cf7a3 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"norefe=
rrer" target=3D"_blank">libbrotlicommon.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlicommon.pc.in" rel=3D"norefe=
rrer" target=3D"_blank">libbrotlicommon.pc.in</a><br>
&gt; +@@ -7,5 +7,5 @@ Name: libbrotlicommon<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli common dictionary library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlicommon<br>
&gt; ++Libs: -L${libdir} -lbrotlicommon<br>
&gt; + Cflags: -I${includedir}<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"no=
referrer" target=3D"_blank">libbrotlidec.pc.in</a> b/scripts/<a href=3D"htt=
p://libbrotlidec.pc.in" rel=3D"noreferrer" target=3D"_blank">libbrotlidec.p=
c.in</a><br>
&gt; +index e7c3124f..6f8ef2e4 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libbrotlidec.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlidec.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libbrotlidec.pc.in</a><br>
&gt; +@@ -7,6 +7,6 @@ Name: libbrotlidec<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli decoder library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlidec<br>
&gt; ++Libs: -L${libdir} -lbrotlidec<br>
&gt; + Requires.private: libbrotlicommon &gt;=3D 1.0.2<br>
&gt; + Cflags: -I${includedir}<br>
&gt; +diff --git a/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"no=
referrer" target=3D"_blank">libbrotlienc.pc.in</a> b/scripts/<a href=3D"htt=
p://libbrotlienc.pc.in" rel=3D"noreferrer" target=3D"_blank">libbrotlienc.p=
c.in</a><br>
&gt; +index 4dd0811b..2098afe2 100644<br>
&gt; +--- a/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libbrotlienc.pc.in</a><br>
&gt; ++++ b/scripts/<a href=3D"http://libbrotlienc.pc.in" rel=3D"noreferre=
r" target=3D"_blank">libbrotlienc.pc.in</a><br>
&gt; +@@ -7,6 +7,6 @@ Name: libbrotlienc<br>
&gt; + URL: <a href=3D"https://github.com/google/brotli" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/google/brotli</a><br>
&gt; + Description: Brotli encoder library<br>
&gt; + Version: @PACKAGE_VERSION@<br>
&gt; +-Libs: -L${libdir} -R${libdir} -lbrotlienc<br>
&gt; ++Libs: -L${libdir} -lbrotlienc<br>
&gt; + Requires.private: libbrotlicommon &gt;=3D 1.0.2<br>
&gt; + Cflags: -I${includedir}<br>
&gt; diff --git a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli=
_1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a> b/meta-=
oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.bb" rel=3D"norefe=
rrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; similarity index 81%<br>
&gt; rename from meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_=
1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a><br>
&gt; rename to meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.=
0.9.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; index 32f855844..0038ba74d 100644<br>
&gt; --- a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.7.=
bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.=
bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; @@ -6,9 +6,10 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/g=
oogle/brotli/issues" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/google/brotli/issues</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3D941ee9cd16=
09382f946352712a319b4b&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.g=
it" rel=3D"noreferrer" target=3D"_blank">github.com/google/brotli.git</a>&q=
uot;<br>
&gt; -# tag 1.0.7<br>
&gt; -SRCREV=3D &quot;d6d98957ca8ccb1ef45922e978bb10efca0ea541&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.g=
it" rel=3D"noreferrer" target=3D"_blank">github.com/google/brotli.git</a> \=
<br>
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

--000000000000e3b22b05ae8c3a9d--
