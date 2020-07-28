Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16630.1595955094781733571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 09:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bPqODrEf;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a15so18960206wrh.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GE6xBTSoLuQwvFWyMDZ8G9+rQpvzr++EgIbAAdsoskM=;
        b=bPqODrEfXQW0gxzACled68qje2wxEiVPd2WiA6DQhVAGdxWmrAic4eTEkKei/u2Icq
         qM7lWZYPvasO4A8ScOED3jY0K6FSyDLjuh2qIgGoMshu5P82Amc3QBXx0skGIFZzFwuG
         Hx9nvaq3w9rHy7h2NzIQ2fnJ2mgJQtQtBF5NJqd5AKW5QXrT8y1lccxyz76kJ1DV7Tih
         SvHPHJ2L/W681hG9Z2cSoLscxdYac7xH3FRYVrFCmvX17IieA6eFvKjNEvHXgVPe9Zas
         oZZYVIVJelobe9xVWxr28lVM57GtPzgdEGuG/g8W8l+JpQ4lBtTugCbWdEHYSdrc2ig0
         gXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GE6xBTSoLuQwvFWyMDZ8G9+rQpvzr++EgIbAAdsoskM=;
        b=odnkZMgKQ5w806nLE0o851iOMp29ec6FOXrjueXWO/oS8V7NTwTZQZzXlc+J+7ySBa
         mgscMYEXuF2L6wu10ENRE9nh8eIcYzKXFOcHmW8lXJBI5pgdcL1pxFA4SeZRko7ZH4dV
         wwVAz/BPfbLP4Ryt44HfFc4CHpoQebMjMMr7WWpZBrF4JJw3lYls8enTR1lcaL/sSRma
         LyDbR2tcTYFxWh0as1ekF+LfYOTlJrX2NFGW007qir5VHdLjVJeB5QO23PVEegFP29RP
         clX5EQTbrgzjqNs0gJZjV/QD+IvpoGKP3XU4YlSbxrgKjpl8jY9HXwtQIasX34dyOupo
         fAZw==
X-Gm-Message-State: AOAM531SwvCYjiecgiivI2Su8+THh/M3DKdtw0sbvF4DwL6FrzWJMEN8
	SWA0JEvzJdpyFd+0TcZ6t1+7O9S6aWaCUqLxpbU=
X-Google-Smtp-Source: ABdhPJzj28tW2CY5s1Ac37cZGixgBBuIqmNWlwQBK8fEoFnYGlNYBSBWr1/GkIurnYNjPdOkRKE8O9gosSVcXojDMuk=
X-Received: by 2002:adf:8b1a:: with SMTP id n26mr27509366wra.182.1595955093363;
 Tue, 28 Jul 2020 09:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200727080116.1984-1-costamagnagianfranco@yahoo.it> <CAMKF1spYrGh7QWc+=tBZKegu7AY8UJFdLedphuxyf4zGcy9yNA@mail.gmail.com>
In-Reply-To: <CAMKF1spYrGh7QWc+=tBZKegu7AY8UJFdLedphuxyf4zGcy9yNA@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Tue, 28 Jul 2020 18:51:20 +0200
Message-ID: <CAATN8PVyY8QznTn9ziRk9pncvFO20C1XWO+MiH7VCYVzX7H-BQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="0000000000006ae06c05ab8340e8"

--0000000000006ae06c05ab8340e8
Content-Type: text/plain; charset="UTF-8"

oops, the websocketpp file shouldn't have been there, that version doesn't
even exist!

Submitted sorry

G.

Il giorno mar 28 lug 2020 alle ore 17:35 Khem Raj <raj.khem@gmail.com> ha
scritto:

> Hi Gianfranco
>
> Please separate this into two different patches and fix websocketpp as
> it fails also remove the old version when you upgrade
>
> https://errors.yoctoproject.org/Errors/Details/425408/
>
> On Mon, Jul 27, 2020 at 1:01 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  ...rs_6.1.6.bb => vboxguestdrivers_6.1.12.bb} |  4 +-
> >  .../websocketpp/websocketpp_0.8.3.bb          | 38 +++++++++++++++++++
> >  2 files changed, 40 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} (95%)
> >  create mode 100644 meta-oe/recipes-support/websocketpp/
> websocketpp_0.8.3.bb
> >
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.12.bb
> > similarity index 95%
> > rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.6.bb
> > rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.12.bb
> > index 89b1ee11e..dfa15da2d 100644
> > --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.12.bb
> > @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
> >  SRC_URI = "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
> >      file://Makefile.utils \
> >  "
> > -SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
> > -SRC_URI[sha256sum] =
> "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
> > +SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
> > +SRC_URI[sha256sum] =
> "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
> >
> >  S = "${WORKDIR}/vbox_module"
> >
> > diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
> b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
> > new file mode 100644
> > index 000000000..79a5ac5c4
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
> > @@ -0,0 +1,38 @@
> > +SUMMARY = "C++/Boost Asio based websocket client/server library."
> > +SECTION = "libs/network"
> > +HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
> > +
> > +DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl
> boost zlib', '', d)} "
> > +
> > +SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
> > +           file://0001-cmake-Use-GNUInstallDirs.patch \
> > +           file://855.patch \
> > +           file://857.patch \
> > +           file://0001-Correct-clang-compiler-flags.patch \
> > +          "
> > +
> > +EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
> > +
> > +# this is an header only library, do not depend on the main package
> > +RDEPENDS_${PN}-dev = ""
> > +
> > +# to add this package to an SDK, since it isn't a reverse-dependency of
> anything, just use something like this:
> > +# TOOLCHAIN_TARGET_TASK_append = " websocketpp-dev"
> > +
> > +# tag 0.8.2
> > +SRCREV= "56123c87598f8b1dd471be83ca841ceae07f95ba"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +PACKAGES =+ "${PN}-examples"
> > +
> > +FILES_${PN}-examples = "${docdir}"
> > +
> > +do_install_append() {
> > +       install -d ${D}${docdir}/${BPN}
> > +       cp -R ${S}/examples ${D}${docdir}/${BPN}
> > +}
> > --
> > 2.17.1
> >
> > 
>

--0000000000006ae06c05ab8340e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>oops, the websocketpp file shouldn&#39;t have been th=
ere, that version doesn&#39;t even exist!</div><div><br></div><div>Submitte=
d sorry</div><div><br></div><div>G.<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 28 lug 2020 alle=
 ore 17:35 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Gianfranco<br>
<br>
Please separate this into two different patches and fix websocketpp as<br>
it fails also remove the old version when you upgrade<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/425408/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/425408/</a><br>
<br>
On Mon, Jul 27, 2020 at 1:01 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">c=
ostamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt=
;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://rs_6.1.6.bb" rel=3D"noreferrer" target=3D"=
_blank">rs_6.1.6.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_6.1.12.b=
b" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.12.bb</a>} |=
=C2=A0 4 +-<br>
&gt;=C2=A0 .../websocketpp/<a href=3D"http://websocketpp_0.8.3.bb" rel=3D"=
noreferrer" target=3D"_blank">websocketpp_0.8.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 | 38 +++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 40 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"htt=
p://vboxguestdrivers_6.1.6.bb" rel=3D"noreferrer" target=3D"_blank">vboxgue=
stdrivers_6.1.6.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_6.1.12.bb=
" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.12.bb</a>} (95%=
)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/websocketpp/<a href=
=3D"http://websocketpp_0.8.3.bb" rel=3D"noreferrer" target=3D"_blank">webs=
ocketpp_0.8.3.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http=
://vboxguestdrivers_6.1.6.bb" rel=3D"noreferrer" target=3D"_blank">vboxgues=
tdrivers_6.1.6.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D=
"http://vboxguestdrivers_6.1.12.bb" rel=3D"noreferrer" target=3D"_blank">vb=
oxguestdrivers_6.1.12.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http:=
//vboxguestdrivers_6.1.6.bb" rel=3D"noreferrer" target=3D"_blank">vboxguest=
drivers_6.1.6.bb</a><br>
&gt; rename to meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://=
vboxguestdrivers_6.1.12.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestd=
rivers_6.1.12.bb</a><br>
&gt; index 89b1ee11e..dfa15da2d 100644<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbox=
guestdrivers_6.1.6.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdriver=
s_6.1.6.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbox=
guestdrivers_6.1.12.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrive=
rs_6.1.12.bb</a><br>
&gt; @@ -14,8 +14,8 @@ VBOX_NAME =3D &quot;VirtualBox-${PV}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://download.virtualbox.org/vir=
tualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://Makefile.utils \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;fe6328d22dfb20ea372daa4b58b12374&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b031c30d770f28c5f884071ad933e8c1f83e65b=
93aaba03a4012077c1d90a54f&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;3c351f7fd6376e0bb3c8489505a9450c&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;05eff0321daa72f6d00fb121a6b4211f3996477=
8823806fa0b7b751667dec362&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/vbox_module&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/websocketpp/<a href=3D"http://we=
bsocketpp_0.8.3.bb" rel=3D"noreferrer" target=3D"_blank">websocketpp_0.8.3.=
bb</a> b/meta-oe/recipes-support/websocketpp/<a href=3D"http://websocketpp_=
0.8.3.bb" rel=3D"noreferrer" target=3D"_blank">websocketpp_0.8.3.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..79a5ac5c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/websocketpp/<a href=3D"http://websocket=
pp_0.8.3.bb" rel=3D"noreferrer" target=3D"_blank">websocketpp_0.8.3.bb</a><=
br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +SUMMARY =3D &quot;C++/Boost Asio based websocket client/server libra=
ry.&quot;<br>
&gt; +SECTION =3D &quot;libs/network&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/zaphoyd/websocketpp=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/zaphoyd/websocket=
pp</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${S}/COPYING;md5=3D4d168d763c111f4=
ffc62249870e4e0ea&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;ptest&#39;, &#39;openssl boost zlib&#39;, &#39;&#39;, d)} &quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/zaphoyd/websock=
etpp.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/=
zaphoyd/websocketpp.git;protocol=3Dhttps</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-Use-GNUIn=
stallDirs.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://855.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://857.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Correct-clang-c=
ompiler-flags.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;ptest&#39;, &#39;-DBUILD_EXAMPLES=3DON -DBUILD_TESTS=3DON&#39;, &#=
39;&#39;, d)} &quot;<br>
&gt; +<br>
&gt; +# this is an header only library, do not depend on the main package<=
br>
&gt; +RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
&gt; +<br>
&gt; +# to add this package to an SDK, since it isn&#39;t a reverse-depend=
ency of anything, just use something like this:<br>
&gt; +# TOOLCHAIN_TARGET_TASK_append =3D &quot; websocketpp-dev&quot;<br>
&gt; +<br>
&gt; +# tag 0.8.2<br>
&gt; +SRCREV=3D &quot;56123c87598f8b1dd471be83ca841ceae07f95ba&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit cmake<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;${PN}-examples&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-examples =3D &quot;${docdir}&quot;<br>
&gt; +<br>
&gt; +do_install_append() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${docdir}/${BPN}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R ${S}/examples ${D}${docdir}/${BPN}<=
br>
&gt; +}<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000006ae06c05ab8340e8--
