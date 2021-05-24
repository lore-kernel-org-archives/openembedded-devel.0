Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.25943.1621873767669848687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 09:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=a0xz7nKi;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id h16so32661742edr.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DMDtMcFukTQwnEq+JTlOO3cQsKvkNuiNk/H3PtUIfeU=;
        b=a0xz7nKiO/SrXM2+N0znVQ2Zm00mzSXvUKb655nfegpl/8v49WsX2wnAZF7Kjx8SqR
         dlcvvJNPpCuMcpiwBopZ667MOr3CBwJJ4a5kS6FeltCtd61cMuVRJo1kD07nRaTqcLnf
         xPi4Bfylg5/CM/tBgtZNLesvnHIi7LXjtGlg+IEZ0Tc67Q9tnIn5CHAvbYGrrm3Elvxw
         kBsxgoHx9Yonb+k/jw2mSAdNU15NG9qOXmJCoHX3ebpK/zusr7QpvGbn0paE8MfgOCHK
         AQ6uOlRiVVtc8LalBN0uIFfyO4r7ye7JAzd2FFdfpJ1zi0p6M1WCe8wCCbsCglYZQIiq
         fl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DMDtMcFukTQwnEq+JTlOO3cQsKvkNuiNk/H3PtUIfeU=;
        b=l2LjSb1OmKAGs/rH3mP3ZjT9g08fa3xSkpQjFki+UbrZt2W01u7nsJqrCZVC6ERWYH
         Lt3C6ccVk8Y09F2iiNfHZ+QTEKKBK3WKtXPAkuth31HhfVlZ5hIHQgeolA4eCfloZlbO
         BZEwHvH/G9Ne/HewKQYDEjpygrIp8suIAc/dLn8icg+oHRss02pDGvHfeOptuT3rvYEQ
         a4Zo48fjs5Nlr8HVPzOocwhmINsjLY5iL+AB1IIZRplwkanUAHhmQgRLbL3moYcPxnmT
         vSZkzH5ErpddJnFrFx1oh0URw/kGBj/hsg9i/GNKA/Yio33Ffldo6gF5LOAm9fZy+5rB
         i0lg==
X-Gm-Message-State: AOAM531BUb7i2Bs0zYM8/EbYZN0ohbLvUTMyb9SgF8TYjr/iDOXuWyAt
	ruVyojapNHX2Wbe5eyeZeD9iazeZWh4C1H6xlnh/uA==
X-Google-Smtp-Source: ABdhPJx3y/4aeGG/l4HZvNWM666P5WfgZAdVZ05r/zbdlbZogh3gGrugH3qRXGgRgdZjxOIJgrqz6QOhcWlbBWblzAw=
X-Received: by 2002:a50:bae6:: with SMTP id x93mr26784522ede.48.1621873766032;
 Mon, 24 May 2021 09:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210519060041.9004-1-nicolas.dechesne@linaro.org> <CAMKF1spip2JaKp4EM7mvgYJ-a7joLSmQe6hff8bB_HEtMrx2kw@mail.gmail.com>
In-Reply-To: <CAMKF1spip2JaKp4EM7mvgYJ-a7joLSmQe6hff8bB_HEtMrx2kw@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 24 May 2021 18:29:15 +0200
Message-ID: <CAP71WjwDBLc6MDpb8W4WS6Tcg9VmXrR0GbxV3pXaQGfEOkWXiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b1fa9205c315e9f7"

--000000000000b1fa9205c315e9f7
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 6:37 PM Khem Raj <raj.khem@gmail.com> wrote:

> seeing this failure
>
> https://errors.yoctoproject.org/Errors/Details/584952/


hmm. Sorry about the delay.. Looks like I am not able to reproduce the
error, it builds for me with oe-core only and with:

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "debian-10"
TARGET_SYS           = "arm-oe-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "nodistro"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"

Do you have any idea why it would work for me, and not for you?


>
>
> On Tue, May 18, 2021 at 11:01 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > * Upstream moved to Github, let's use it for SRC_URI
> > * COPYING file was changed, but with no impact on license
> > * sysbench includes a copy of luajit project and it's compiled by
> >   default. However the internal copy of luajit won't cross compile
> >   properly, without patching it (it uses 'gcc'). So instead use the
> >   'system' luajit, e.g. the one package from OE (which is what most
> >   distro do anyways)
> > * Does not compile with different built folder. Lua generated files
> >   have things like that:
> > unsigned char
> __/__/__/__/sysbench-1_0_20/src/lua/internal/sysbench_lua[] =
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  ...{sysbench_0.4.12.bb => sysbench_1.0.20.bb} | 21 ++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >  rename meta-oe/recipes-benchmark/sysbench/{sysbench_0.4.12.bb =>
> sysbench_1.0.20.bb} (56%)
> >
> > diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
> b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> > similarity index 56%
> > rename from meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
> > rename to meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> > index 708c71f4f..555477ab0 100644
> > --- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
> > +++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> > @@ -2,16 +2,17 @@ SUMMARY = "System performance benchmark"
> >  HOMEPAGE = "http://github.com/akopytov/sysbench"
> >  SECTION = "console/tests"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> > -inherit autotools
> > +DEPENDS = "luajit"
> >
> > -# The project has moved from Sourceforge to Launchpad, to Github. Use
> the source tarball from
> > -# Launchpad until the next release is available from Github.
> > -SRC_URI = "
> https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz
> <https://launchpad.net/ubuntu/+archive/primary/+files/$%7BBPN%7D_$%7BPV%7D.orig.tar.gz>
> "
> > +inherit autotools pkgconfig
> >
> > -SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
> > -SRC_URI[sha256sum] =
> "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
> > +SRC_URI = "git://github.com/akopytov/${BPN}.git
> <http://github.com/akopytov/$%7BBPN%7D.git>"
> > +
> > +SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
> > +
> > +S = "${WORKDIR}/git"
> >
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile',
> d)}"
> >  PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> > @@ -21,6 +22,12 @@ PACKAGECONFIG[mysql] = "--with-mysql \
> >                          --with-mysql-libs=${STAGING_LIBDIR}, \
> >                          --without-mysql,mysql5"
> >
> > +# the internal luajit won't cross compile
> > +EXTRA_OECONF += "--with-system-luajit"
> > +
> > +# lua.h generated files are bogus when using B != S
> > +B = "${S}"
> > +
> >  do_configure_prepend() {
> >      touch ${S}/NEWS ${S}/AUTHORS
> >  }
> > --
> > 2.29.2
> >
> >
> > 
> >
>

--000000000000b1fa9205c315e9f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 19, 2021 at 6:37 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">seeing this=
 failure<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/584952/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/584952/</a></blockquote><div><br></div><div>hmm. Sorry about the delay.. =
Looks like I am not able to reproduce the error, it builds for me with oe-c=
ore only and with:</div><div><br></div>Build Configuration:<br>BB_VERSION =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.51.0&quot;<br>BUILD_SYS =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>NATI=
VELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;debian-10&quot;<br>TARGET_SYS =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-oe-linux-gnueabi&quot;<br>MA=
CHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemuarm&quo=
t;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;nod=
istro&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro.0&quo=
t;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7ve vfp th=
umb neon callconvention-hard&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;hard&quot;</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Do you have any idea why it would work for me, a=
nd not for you?=C2=A0<br><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On Tue, May 18, 2021 at 11:01 PM Nicolas Dechesne<br>
&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; * Upstream moved to Github, let&#39;s use it for SRC_URI<br>
&gt; * COPYING file was changed, but with no impact on license<br>
&gt; * sysbench includes a copy of luajit project and it&#39;s compiled by=
<br>
&gt;=C2=A0 =C2=A0default. However the internal copy of luajit won&#39;t cr=
oss compile<br>
&gt;=C2=A0 =C2=A0properly, without patching it (it uses &#39;gcc&#39;). So=
 instead use the<br>
&gt;=C2=A0 =C2=A0&#39;system&#39; luajit, e.g. the one package from OE (wh=
ich is what most<br>
&gt;=C2=A0 =C2=A0distro do anyways)<br>
&gt; * Does not compile with different built folder. Lua generated files<b=
r>
&gt;=C2=A0 =C2=A0have things like that:<br>
&gt; unsigned char __/__/__/__/sysbench-1_0_20/src/lua/internal/sysbench_l=
ua[] =3D<br>
&gt;<br>
&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesn=
e@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...{<a href=3D"http://sysbench_0.4.12.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">sysbench_0.4.12.bb</a> =3D&gt; <a href=3D"http://sysbench_1=
.0.20.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_1.0.20.bb</a>} | 21=
 ++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-benchmark/sysbench/{<a href=3D"http://sy=
sbench_0.4.12.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_0.4.12.bb</=
a> =3D&gt; <a href=3D"http://sysbench_1.0.20.bb" rel=3D"noreferrer" target=
=3D"_blank">sysbench_1.0.20.bb</a>} (56%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sys=
bench_0.4.12.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_0.4.12.bb</a=
> b/meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sysbench_1.0.20.bb=
" rel=3D"noreferrer" target=3D"_blank">sysbench_1.0.20.bb</a><br>
&gt; similarity index 56%<br>
&gt; rename from meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sysb=
ench_0.4.12.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_0.4.12.bb</a>=
<br>
&gt; rename to meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sysben=
ch_1.0.20.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_1.0.20.bb</a><b=
r>
&gt; index 708c71f4f..555477ab0 100644<br>
&gt; --- a/meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sysbench_0=
.4.12.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_0.4.12.bb</a><br>
&gt; +++ b/meta-oe/recipes-benchmark/sysbench/<a href=3D"http://sysbench_1=
.0.20.bb" rel=3D"noreferrer" target=3D"_blank">sysbench_1.0.20.bb</a><br>
&gt; @@ -2,16 +2,17 @@ SUMMARY =3D &quot;System performance benchmark&quot=
;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://github.com/akopytov/sysben=
ch" rel=3D"noreferrer" target=3D"_blank">http://github.com/akopytov/sysbenc=
h</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/tests&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b=
7df079bae19f&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263&quot;<br>
&gt;<br>
&gt; -inherit autotools<br>
&gt; +DEPENDS =3D &quot;luajit&quot;<br>
&gt;<br>
&gt; -# The project has moved from Sourceforge to Launchpad, to Github. Us=
e the source tarball from<br>
&gt; -# Launchpad until the next release is available from Github.<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://launchpad.net/ubuntu/+archive/p=
rimary/+files/$%7BBPN%7D_$%7BPV%7D.orig.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${=
PV}.orig.tar.gz</a>&quot;<br>
&gt; +inherit autotools pkgconfig<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;3a6d54fdd3fe002328e4458206392b9d&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;83fa7464193e012c91254e595a89894d8e35b4a=
38324b52a5974777e3823ea9e&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/akopytov/$%7BBP=
N%7D.git" rel=3D"noreferrer" target=3D"_blank">github.com/akopytov/${BPN}.g=
it</a>&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;ebf1c90da05dea94648165e4f149abc20c979557&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;largefile&#39;, d)}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[largefile] =3D &quot;--enable-largefile,--disable=
-largefile,,&quot;<br>
&gt; @@ -21,6 +22,12 @@ PACKAGECONFIG[mysql] =3D &quot;--with-mysql \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 --with-mysql-libs=3D${STAGING_LIBDIR}, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 --without-mysql,mysql5&quot;<br>
&gt;<br>
&gt; +# the internal luajit won&#39;t cross compile<br>
&gt; +EXTRA_OECONF +=3D &quot;--with-system-luajit&quot;<br>
&gt; +<br>
&gt; +# lua.h generated files are bogus when using B !=3D S<br>
&gt; +B =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_configure_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 touch ${S}/NEWS ${S}/AUTHORS<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000b1fa9205c315e9f7--
