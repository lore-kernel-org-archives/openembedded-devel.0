Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdPPy-0003zf-Bv
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 May 2013 20:30:30 +0200
Received: by mail-pd0-f178.google.com with SMTP id w10so1033952pde.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2013 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1O4avn1zwMHGix9UrPtG7s/gi34c0QQ9RN6WFpGsu9M=;
	b=EtSucs3UpynAoFhQsfF3iDKkN6GxD+NV2BicSReUnIxwbmBmwwqmedzUtjfU9E5Z4E
	XTmLH3bjkheaJfxIu0dn3lfVg8/uPuCF0lfRnfo1tzBnvqBID2m139sReYSawfc/GVa3
	z9V8f8BmcqaI7dBvw36O8FZiLym11JTCLWh8eKGCdPrg0L0LxAQuBCPJgRin0dbJPQ5d
	NUVJHKGgG198GovvoT2ylUTnipAIuLKy3xKY12GTpAGrAa5HtoFBxnpRE3M0thPzAH4m
	njSx08ZksC/HJF9G2HDCTJtl+8SctupHebtIPNG7dhVJjk4sUvg3wlCsube6OVVPTH3a
	yZmA==
X-Received: by 10.66.248.40 with SMTP id yj8mr49319613pac.95.1368814317662;
	Fri, 17 May 2013 11:11:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zs12sm2511371pab.0.2013.05.17.11.11.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 11:11:56 -0700 (PDT)
Date: Fri, 17 May 2013 20:11:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130517181159.GL24809@jama.dyndns-home.com>
References: <1368230662-18958-1-git-send-email-eu@felipetonello.com>
	<18040337.siUQ0VeMS8@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <18040337.siUQ0VeMS8@localhost.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] connman: updated libconnman-qt to 1.0.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 18:30:35 -0000
X-Groupsio-MsgNum: 44765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSyhVCl2eeZHT0Rn"
Content-Disposition: inline

--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 10:55:25AM -0700, Felipe Ferreri Tonello wrote:
> On Friday, May 10, 2013 05:04:22 PM you wrote:
> > From: "Felipe F. Tonello" <eu@felipetonello.com>
> >=20
> > This new recipe version requires the changes in this patch:
> > http://www.mail-archive.com/openembedded-core@lists.openembedded.org/ms=
g3814
> > 8.html
> >=20
> > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > ---
> >  ...-to-disable-qml-plugin-and-test-program-t.patch | 37 ------------
> >  .../libconnman-qt/libconnman-qt_0.4.0.bb           | 69
> > ---------------------- .../libconnman-qt/libconnman-qt_1.0.7.bb        =
   |
> > 67 +++++++++++++++++++++ 3 files changed, 67 insertions(+), 106
> > deletions(-)
> >  delete mode 100644
> > meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disa=
ble-
> > qml-plugin-and-test-program-t.patch delete mode 100644
> > meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb create mode 100=
644
> > meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> >=20
> > diff --git
> > a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-di=
sabl
> > e-qml-plugin-and-test-program-t.patch
> > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-di=
sabl
> > e-qml-plugin-and-test-program-t.patch deleted file mode 100644
> > index 6ec084d..0000000
> > ---
> > a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-di=
sabl
> > e-qml-plugin-and-test-program-t.patch +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> > -From: "Felipe F. Tonello" <ftonello@cercacor.com>
> > -Date: Mon, 7 Jan 2013 17:13:22 -0800
> > -Subject: [PATCH] added flags to disable qml plugin and test program to
> > - compile
> > -
> > -This is usefull when there is no need to compile test program and qml
> > plugin. -
> > -Upstream-Status: Accepted
> > -
> > -Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > ----
> > - connman-qt.pro |   11 ++++++++++-
> > - 1 file changed, 10 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/connman-qt.pro b/connman-qt.pro
> > -index 7d9ec99..425c41f 100644
> > ---- a/connman-qt.pro
> > -+++ b/connman-qt.pro
> > -@@ -1,4 +1,13 @@
> > - TEMPLATE =3D subdirs
> > --SUBDIRS +=3D libconnman-qt test plugin
> > -+SUBDIRS +=3D libconnman-qt
> > - CONFIG +=3D ordered
> > -
> > -+# CONFIG flag to disable test program
> > -+!notest {
> > -+    SUBDIRS +=3D test
> > -+}
> > -+
> > -+# CONFIG flag to disable qml plugin
> > -+!noplugin {
> > -+    SUBDIRS +=3D plugin
> > -+}
> > ---
> > -1.7.9.5
> > -
> > diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb deleted file =
mode
> > 100644
> > index 50c149f..0000000
> > --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> > +++ /dev/null
> > @@ -1,69 +0,0 @@
> > -DESCRIPTION =3D "Qt Library for ConnMan"
> > -HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> > -LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D
> > "file://libconnman-qt/clockmodel.h;endline=3D8;md5=3Dea9f724050803f15d2=
d900ce3c
> > 5dac88" -
> > -SECTION =3D "qt/lib"
> > -
> > -PR =3D "r0"
> > -
> > -inherit qt4x11 pkgconfig
> > -
> > -RDEPENDS_${PN} =3D "connman"
> > -RDEPENDS_${PN}-plugin =3D "${PN}"
> > -
> > -PROVIDES +=3D "${PN}-plugin"
> > -
> > -PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> > -RRECOMMENDS_${PN} =3D "${PN}-plugin"
> > -
> > -BRANCH =3D "master"
> > -# this matches 0.4.0 tag
> > -SRCREV =3D "3af5bd38d82255942f582398160a5d3354346ca3"
> > -
> > -SRC_URI =3D " \
> > -    git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH} \
> > -    file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.p=
atch
> > \ -"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> > -# the plugin target needs to be the same as 'target.path' and 'qmldir.=
path'
> > in ${S}/plugin/plugin.pro -PLUGINS_TARGET =3D
> > "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > -
> > -EXTRA_QMAKEVARS_PRE =3D " \
> > -    CONFIG+=3Dnotest \
> > -"
> > -
> > -do_configure_prepend() {
> > -    # Hack *.pro variables
> > -    find ${S}/plugin/*.pro -exec sed -i -e
> > 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' -}
> > -
> > -do_install() {
> > -    export INSTALL_ROOT=3D${D}
> > -    oe_runmake install
> > -}
> > -
> > -FILES_${PN} =3D " \
> > -    ${libdir}/libconnman-qt4${SOLIBS} \
> > -"
> > -
> > -FILES_${PN}-dev =3D " \
> > -    ${includedir}/connman-qt/* \
> > -    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > -    ${libdir}/libconnman-qt4.prl \
> > -    ${libdir}/pkgconfig/connman-qt4.pc \
> > -    ${libdir}/connman-qt4.pc \
> > -"
> > -
> > -FILES_${PN}-plugin =3D " \
> > -    ${PLUGINS_TARGET}/qmldir \
> > -    ${PLUGINS_TARGET}/lib*.so \
> > -"
> > -
> > -FILES_${PN}-plugin-dbg =3D " \
> > -    ${PLUGINS_TARGET}/.debug \
> > -    ${PLUGINS_TARGET}/.debug/* \
> > -"
> > diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> > b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb new file mode
> > 100644
> > index 0000000..65a2731
> > --- /dev/null
> > +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> > @@ -0,0 +1,67 @@
> > +DESCRIPTION =3D "Qt Library for ConnMan"
> > +HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
> > "file://libconnman-qt/clockmodel.h;endline=3D8;md5=3Dea9f724050803f15d2=
d900ce3c
> > 5dac88" +
> > +SECTION =3D "qt/lib"
> > +
> > +PR =3D "r0"
> > +
> > +inherit qt4x11 pkgconfig
> > +
> > +RDEPENDS_${PN} =3D "connman"
> > +RDEPENDS_${PN}-plugin =3D "${PN}"
> > +
> > +PROVIDES +=3D "${PN}-plugin"
> > +
> > +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> > +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> > +
> > +BRANCH =3D "master"
> > +SRCREV =3D "6a5e4f981112a90a8c19d82bd671da389d2af993"
> > +
> > +SRC_URI =3D " \
> > +    git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH} \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> > +# the plugin target needs to be the same as 'target.path' and 'qmldir.=
path'
> > in ${S}/plugin/plugin.pro +PLUGINS_TARGET =3D
> > "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > +
> > +EXTRA_QMAKEVARS_PRE =3D " \
> > +    CONFIG+=3Dnotest \
> > +"
> > +
> > +do_configure_prepend() {
> > +    # Hack *.pro variables
> > +    find ${S}/plugin/*.pro -exec sed -i -e
> > 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' +}
> > +
> > +do_install() {
> > +    export INSTALL_ROOT=3D${D}
> > +    oe_runmake install
> > +}
> > +
> > +FILES_${PN} =3D " \
> > +    ${libdir}/libconnman-qt4${SOLIBS} \
> > +"
> > +
> > +FILES_${PN}-dev =3D " \
> > +    ${includedir}/connman-qt/* \
> > +    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > +    ${libdir}/libconnman-qt4.prl \
> > +    ${libdir}/pkgconfig/connman-qt4.pc \
> > +    ${libdir}/connman-qt4.pc \
> > +"
> > +
> > +FILES_${PN}-plugin =3D " \
> > +    ${PLUGINS_TARGET}/qmldir \
> > +    ${PLUGINS_TARGET}/lib*.so \
> > +"
> > +
> > +FILES_${PN}-plugin-dbg =3D " \
> > +    ${PLUGINS_TARGET}/.debug \
> > +    ${PLUGINS_TARGET}/.debug/* \
> > +"
>=20
> ping?

It was failing to build in last 3 world builds, you can see logs here:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-May/045588.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGWcu8ACgkQN1Ujt2V2gByC5wCgioNQ2FknQ3dsUC6slNAUwa3u
wDIAnA2Uw0OlPWrZmfCo+vE2BfxgHwm0
=hlFD
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--
