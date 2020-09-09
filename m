Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.9224.1599641115430033084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=bKUyPt3S;
 spf=pass (domain: blade-group.com, ip: 209.85.210.50, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f50.google.com with SMTP id c10so1601384otm.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMN8nCgjDTZUfqMgqMdz+RjlOOXHCfnnb/2ZiCrvb6o=;
        b=bKUyPt3SATg9FDmecXluK8z/pfSkR/FMtEKtayXP1g//GTG9WLlVAtuOzVTVWXX8df
         cIlqpQjanfI7yNuJsl4DKj+qPumOl2SLKX4ax6N9NgaltZ9WC72S3gnriUpP5AJRsUNf
         YzKl8Cdsm1It224M/f1fPrfuEdT0fsQUV6FUIVURMkm6tccbpwkpMOH/IP0QHVtwHkxD
         zcyxBr8o8I+uSgitbi8U6YEFf0bQ4QEKyo8NFdWrhkAT1SHYzywUty31sYNs2pLnBJcL
         ruEKpB6mEs415PTG2D7voclg5VXwXC7JecbAaczaxq0wg6FQwwLshiEUoAT6JKgwpm+3
         /qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMN8nCgjDTZUfqMgqMdz+RjlOOXHCfnnb/2ZiCrvb6o=;
        b=boLYBt+goxt1wJbdzRPEdRmlxe5crGh9Kl+VyT3gKArp0do7yc2gq5QF/tAa+ZuKTD
         0+GvyFLVb+zfMoyxc4G7DIjaanbACFvb5/0pbBHsfqfFT9mPzRpT2Bn7SiVLR304apqg
         GikVjTYBJ9bqrHo1wUH0Up2OGzmwtUJjf9YsjvgRJMhfOCcsgz9xrPZIuCgLazTfk96I
         4c3UoyDXNRjCv2IwI3f+Nnwir8l6orKVklYspGmVbwKzgOjv9opdxgEROl9XJA5Gl/DS
         tCfgkIfNyU83zssHMpbgxq856Pz6KZF6trKgB74nqthUMkqZCbqkRCzb/xNd22B7s54W
         XvRg==
X-Gm-Message-State: AOAM530XThG+uNV0hjkjThcQC3afBAiWHr2UBxWBesith5I+2KTz05jH
	QbNg5fidxp36M88IWcCj9oQvkr0fkP2wp/36Wr9gQA==
X-Google-Smtp-Source: ABdhPJzYxZzsMMWs1PGWOj4qHSosAif7YdboblJj++qbhy7ZcEgWRMFOSeEPeyYDmbo2TElassG+XLkR89x0zfoBFeE=
X-Received: by 2002:a05:6830:138c:: with SMTP id d12mr2269565otq.288.1599641114749;
 Wed, 09 Sep 2020 01:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084154.178795-1-yann@blade-group.com> <163310FD7A955869.2635@lists.openembedded.org>
In-Reply-To: <163310FD7A955869.2635@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 9 Sep 2020 10:45:00 +0200
Message-ID: <CA+4=imbP3unc65f0OTR76gbmwm_AdUg6m13_vxDpErr41+HG4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] New terminal emulator: st 0.8.4
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="00000000000069ce4b05aedd7820"

--00000000000069ce4b05aedd7820
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry this patch should not be in this series, resending

Le mer. 9 sept. 2020 =C3=A0 10:42, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :

> From: Yann Dirson <yann@blade-group.com>
>
> Can be used as a replacement for matchbox-terminal, with much less
> dependencies (does not need gtk and vte), and supports "-e" flag.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb
>
> diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> new file mode 100644
> index 000000000..7d7c20e46
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> @@ -0,0 +1,28 @@
> +SECTION =3D "shadow"
> +LICENSE =3D "MIT-X"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D04c3ca13a702147c62db90f556c5=
b3ca"
> +SRC_URI =3D " \
> + http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
> +"
> +
> +inherit pkgconfig
> +
> +SRC_URI[sha256sum] =3D
> "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
> +
> +DEPENDS +=3D "libx11 libxft fontconfig"
> +
> +RDEPENDS_${PN} +=3D "libx11-locale"
> +
> +do_compile() {
> +    make INCS=3D'-I. `pkg-config --cflags x11 fontconfig xft`' LIBS=3D'=
-lm
> -lutil `pkg-config --libs x11 fontconfig xft`'
> +}
> +
> +# don't use "make install" which builds terminfo, already in
> +# ncurses-terminfo (and requires ncurses-native for "tic")
> +
> +do_install() {
> +    mkdir -p ${D}${bindir}
> +    install -m755 ${B}/st ${D}${bindir}/
> +}
> +
> +RRECOMMENDS_${PN} +=3D "ncurses-terminfo"
> --
> 2.28.0
>
>=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000069ce4b05aedd7820
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry this patch should not be in this series, resending<b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Le=C2=A0mer. 9 sept. 2020 =C3=A0=C2=A010:42, Yann Dirson via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;yann.dirson=3D=
<a href=3D"mailto:blade-group.com@lists.openembedded.org">blade-group.com@l=
ists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Yann Dirson &lt;<a href=3D"mailto:y=
ann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
<br>
Can be used as a replacement for matchbox-terminal, with much less<br>
dependencies (does not need gtk and vte), and supports &quot;-e&quot; flag=
.<br>
<br>
Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" tar=
get=3D"_blank">yann@blade-group.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> | 28 +++++++++++++++++++=
<br>
=C2=A01 file changed, 28 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/suckless/<a href=3D"http=
://st_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><br>
<br>
diff --git a/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.=
bb" rel=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a> b/meta-oe/recipes-=
graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=3D"noreferrer" target=
=3D"_blank">st_0.8.4.bb</a><br>
new file mode 100644<br>
index 000000000..7d7c20e46<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/suckless/<a href=3D"http://st_0.8.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">st_0.8.4.bb</a><br>
@@ -0,0 +1,28 @@<br>
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
+DEPENDS +=3D &quot;libx11 libxft fontconfig&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;libx11-locale&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 make INCS=3D&#39;-I. `pkg-config --cflags x11 fontconfig xf=
t`&#39; LIBS=3D&#39;-lm -lutil `pkg-config --libs x11 fontconfig xft`&#39;<=
br>
+}<br>
+<br>
+# don&#39;t use &quot;make install&quot; which builds terminfo, already i=
n<br>
+# ncurses-terminfo (and requires ncurses-native for &quot;tic&quot;)<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${bindir}<br>
+=C2=A0 =C2=A0 install -m755 ${B}/st ${D}${bindir}/<br>
+}<br>
+<br>
+RRECOMMENDS_${PN} +=3D &quot;ncurses-terminfo&quot;<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div>

--00000000000069ce4b05aedd7820--
