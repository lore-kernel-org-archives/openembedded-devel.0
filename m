Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.14504.1599903302085213123
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 02:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2lpZq5V;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id z22so16646587ejl.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=epuDZylyzAbZQKH4Mlm92BCZL7VRu11oLmKLvxeNPcI=;
        b=M2lpZq5VNHmQgNyP5ovlf5UU1xKNrUZOK1I62WTyKNGwT08/7eV7lsU1ksyUWBOqBc
         MnzrIC5vVQbdK1v2A+9cil767yuVkFTOTb5dLdXpm0czKQcLpc+AuZFbg57lmfxP6Ry1
         kd4hLcpp4EBXxPI1Y4RPwxKddMAyemnluK1L2XqjGK0uA2E9LPId1rWYBqkuF/ncZ5jx
         oBZQ8pfRmu/WXnIi7ftVqSmVkp3KOaY2uIH9e0nASNq2/2tO0oOqLsBRB7Nmop4jUrlS
         oae3u4oyJdPrzIfnEXnmb9ciKM+f2PL5QgxftlcZrtxzkJ9UGLO9HyFkCFQCBJusTkf3
         a+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=epuDZylyzAbZQKH4Mlm92BCZL7VRu11oLmKLvxeNPcI=;
        b=pqcrHPKa0L2blBUoeosIaRFLGP4st5i8s0mlr/9yceHxPcFNExVBd4w/9DSJ6L9a7U
         l9UfU6Rn3ETwEp7exRmH1Fi6cYCol2NeJc1Gu/IuSvMp7/944E4YyyMJrj9cQo8qDloB
         MGTtJ4ZHr0CfY/WiQkdx+16OfEF2aRoXwVluRE9jpH2A/KY20iq56Mc7c5L81uj7vidu
         OW92SiR/gE/+ooHHCOY4015u02WPBWwyuSGvKBbDqG1UAZwztPiRiYFq1H4hAr8rJob+
         wVzH4/X/f1dRQzBbzrUP+Nhq8PXplX25eCDRHjwwiIRt9QrfXSJ+3+D2a+0ru8yjiEcI
         FWLg==
X-Gm-Message-State: AOAM533ApijoJsk0LLL8DoP/bOv3zx7RSrcL12Pzw/WIB7IcQUG45eEe
	3dCA7+l6AM7Ywmyw1PsQZDW0Kmf2x+harI1oNqo=
X-Google-Smtp-Source: ABdhPJx3WtBS4cK4P/zQjuVn1r0Bh44E5K1tYQnCp4iuhpzLaRqJATPbkL6TKYl6kuvWyR8r2Qd4Eb+KNyUKeR3l5Ls=
X-Received: by 2002:a17:907:444f:: with SMTP id on23mr5322165ejb.392.1599903299294;
 Sat, 12 Sep 2020 02:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200903121411.3017527-1-yann@blade-group.com> <20200903121411.3017527-2-yann@blade-group.com>
In-Reply-To: <20200903121411.3017527-2-yann@blade-group.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 12 Sep 2020 11:34:48 +0200
Message-ID: <CA+chaQdv+PCxy-qwBJp8A1tEoPkUXRqJX8+5OifA303-KWm-Ag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch v2 1/1] New terminal emulator: st 0.8.4
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000d457f305af1a8357"

--000000000000d457f305af1a8357
Content-Type: text/plain; charset="UTF-8"

This is missing x11 in REQUIRED_DISTRO_FEATURES and the inherit, will send
patch shortly.

On Thu, Sep 3, 2020 at 2:15 PM Yann Dirson <yann.dirson@blade-group.com>
wrote:

> From: Yann Dirson <yann@blade-group.com>
>
> Can be used as a replacement for matchbox-terminal, with much less
> dependencies (does not need gtk and vte), and supports "-e" flag.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 25 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 55d623d95..d67b2fb69 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -455,6 +455,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
>      openbox \
>      packagegroup-fonts-truetype \
>      qrencode \
> +    st \
>      takao-fonts \
>      leptonica \
>      libvncserver \
> diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> new file mode 100644
> index 000000000..1f4961cb2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> @@ -0,0 +1,25 @@
> +SECTION = "shadow"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=04c3ca13a702147c62db90f556c5b3ca"
> +SRC_URI = " \
> + http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
> +"
> +
> +inherit pkgconfig
> +
> +SRC_URI[sha256sum] =
> "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
> +
> +DEPENDS += "libx11 libxft fontconfig ncurses-native"
> +
> +RDEPENDS_${PN} += "libx11-locale"
> +
> +do_compile() {
> +    make INCS='-I. `pkg-config --cflags x11 fontconfig xft`' LIBS='-lm
> -lutil `pkg-config --libs x11 fontconfig xft`'
> +}
> +do_install() {
> +    make install DESTDIR=${D} PREFIX=/usr TERMINFO=${D}${datadir}/terminfo
> +}
> +
> +FILES_${PN} += " \
> +  ${datadir}/terminfo \
> +"
> --
> 2.28.0
>
> 
>

--000000000000d457f305af1a8357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is missing x11 in REQUIRED_DISTRO_FEATURES and the in=
herit, will send patch shortly.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Sep 3, 2020 at 2:15 PM Yann Dirson &=
lt;<a href=3D"mailto:yann.dirson@blade-group.com">yann.dirson@blade-group.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_=
blank">yann@blade-group.com</a>&gt;<br>
<br>
Can be used as a replacement for matchbox-terminal, with much less<br>
dependencies (does not need gtk and vte), and supports &quot;-e&quot; flag=
.<br>
<br>
Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" tar=
get=3D"_blank">yann@blade-group.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"=
noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> | 25 +++++++++++++++++++=
<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/suckless/<a href=3D"http=
://st_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><br>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packageg=
roup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.=
bb</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-=
meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a=
><br>
index 55d623d95..d67b2fb69 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-me=
ta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><=
br>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-me=
ta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><=
br>
@@ -455,6 +455,7 @@ RDEPENDS_packagegroup-meta-oe-graphics =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0openbox \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-fonts-truetype \<br>
=C2=A0 =C2=A0 =C2=A0qrencode \<br>
+=C2=A0 =C2=A0 st \<br>
=C2=A0 =C2=A0 =C2=A0takao-fonts \<br>
=C2=A0 =C2=A0 =C2=A0leptonica \<br>
=C2=A0 =C2=A0 =C2=A0libvncserver \<br>
diff --git a/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.=
bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> b/meta-oe/recipes-=
graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=3D"noreferrer" target=
=3D"_blank">st_0.8.4.bb</a><br>
new file mode 100644<br>
index 000000000..1f4961cb2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><br>
@@ -0,0 +1,25 @@<br>
+SECTION =3D &quot;shadow&quot;<br>
+LICENSE =3D &quot;MIT-X&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D04c3ca13a702147c62db90f55=
6c5b3ca&quot;<br>
+SRC_URI =3D &quot; \<br>
+ <a href=3D"http://dl.suckless.org/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz=
" rel=3D"noreferrer" target=3D"_blank">http://dl.suckless.org/${BPN}/${BPN}=
-${PV}.tar.gz</a> \<br>
+&quot;<br>
+<br>
+inherit pkgconfig<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9=
ebc1780bc6c9a03346a6&quot;<br>
+<br>
+DEPENDS +=3D &quot;libx11 libxft fontconfig ncurses-native&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;libx11-locale&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 make INCS=3D&#39;-I. `pkg-config --cflags x11 fontconfig xf=
t`&#39; LIBS=3D&#39;-lm -lutil `pkg-config --libs x11 fontconfig xft`&#39;<=
br>
+}<br>
+do_install() {<br>
+=C2=A0 =C2=A0 make install DESTDIR=3D${D} PREFIX=3D/usr TERMINFO=3D${D}${=
datadir}/terminfo<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot; \<br>
+=C2=A0 ${datadir}/terminfo \<br>
+&quot;<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div>

--000000000000d457f305af1a8357--
