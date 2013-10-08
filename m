Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id BB7C46CBAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:20:40 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so4311708eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ogdz/WW/apbB/y9nxOf6D6dwBQnUDXvg9PxW9VYfxG0=;
	b=Wf+ituRVQozuhL3xrcOa8PvgQmeZbnSOsMJCE7mhl8SII2WXyYM+a/yP3DGNbC3nq0
	JKDWtlbllF9VpEATBxcnYvXYs3ClmnM/6OpmjOYw4mqWwXLWMusSg3NHJ1WrreeAO55y
	npkveWZolwmzo8bO33A141SyLozFno90VE4HWXQhu3DYW7/aeUsKe2HHxlAr4Z3a8GaV
	t4Jvax9AibvRWI119wIFVzLcawM7JA60hpsQkhQagsPLfdVgCL9LjF+yMDzD+lqeRCxG
	zLubEPgDFmovGhvb/SO0HUPVzlh5kww09oGHnAcAsMz1vpx3/LNMyPRD1aziT3fuUecI
	3MZA==
X-Received: by 10.14.210.8 with SMTP id t8mr5452816eeo.39.1381267242231;
	Tue, 08 Oct 2013 14:20:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm80390315eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 14:20:41 -0700 (PDT)
Date: Tue, 8 Oct 2013 23:20:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131008212041.GF2872@jama>
References: <1380561400-574-1-git-send-email-eu@felipetonello.com>
	<20131004142146.GJ6240@jama>
	<CAGrhNMyaauXyRX1+XUhq64_Sddc+3whLd3=sHGW0_k-NO0wf8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGrhNMyaauXyRX1+XUhq64_Sddc+3whLd3=sHGW0_k-NO0wf8Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] ofono: libqofono: Added libqofono recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 21:20:41 -0000
X-Groupsio-MsgNum: 46565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 02:03:33PM -0700, Felipe Tonello wrote:
> Hi Martin,
>=20
> On Fri, Oct 4, 2013 at 7:21 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Mon, Sep 30, 2013 at 10:16:40AM -0700, Felipe F. Tonello wrote:
> >> From: "Felipe F. Tonello" <eu@felipetonello.com>
> >>
> >> libqofono is a Qt library for oFono that provides easy to use Qt libra=
ry and
> >> QML components to use oFono.
> >>
> >> OBS: This recipe provides the Qt4 support only, but the library also w=
orks
> >> with Qt5.
> >>
> >> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> >> ---
> >>  meta-oe/recipes-qt/libqofono/libqofono_0.4.bb | 88 ++++++++++++++++++=
+++++++++
> >>  1 file changed, 88 insertions(+)
> >>  create mode 100644 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
> >>
> >> diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/r=
ecipes-qt/libqofono/libqofono_0.4.bb
> >> new file mode 100644
> >> index 0000000..7c34db2
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
> >> @@ -0,0 +1,88 @@
> >> +DESCRIPTION =3D "Qt Library for oFono"
> >> +HOMEPAGE =3D "https://github.com/nemomobile/libqofono"
> >> +LICENSE =3D "Apache-2.0"
> >> +LIC_FILES_CHKSUM =3D "file://README;endline=3D3;md5=3D8a15bce3921d123=
8d9a9f23828612947"
> >> +
> >> +SECTION =3D "qt/lib"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +inherit qt4x11 pkgconfig
> >> +
> >> +RDEPENDS_${PN} =3D "ofono"
> >> +RDEPENDS_${PN}-plugin =3D "${PN}"
> >> +
> >> +PROVIDES +=3D "${PN}-plugin"
> >> +
> >> +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg ${PN}-test"
> >> +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> >> +
> >> +BRANCH =3D "master"
> >> +TAG =3D "${PV}"
> >> +
> >> +SRC_URI =3D " \
> >> +  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH};tag=3D${TA=
G} \
> >> +"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> >> +PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/QOfono"
> >> +
> >> +FILES_${PN} =3D " \
> >> +  ${libdir}/libqofono${SOLIBS} \
> >> +"
> >> +
> >> +FILES_${PN}-dev =3D " \
> >> +  ${includedir}/qofono/* \
> >> +  ${includedir}/qofono/dbus/* \
> >> +  ${libdir}/libqofono${SOLIBSDEV} \
> >> +  ${libdir}/libqofono.prl \
> >> +  ${libdir}/pkgconfig/qofono.pc \
> >> +  ${datadir}/qt4/mkspecs/features/qofono.prf \
> >> +"
> >> +
> >> +FILES_${PN}-plugin =3D " \
> >> +  ${PLUGINS_TARGET}/qmldir \
> >> +  ${PLUGINS_TARGET}/lib*.so \
> >> +"
> >> +
> >> +FILES_${PN}-plugin-dbg =3D " \
> >> +  ${PLUGINS_TARGET}/.debug \
> >> +"
> >> +
> >> +FILES_${PN}-test =3D " \
> >> +  /opt/ofonotest/bin/ofonotest \
> >> +  /opt/ofonotest/qml/ofonotest \
> >> +  ${libdir}/libqofono/tests/tst_qofonotest \
> >> +"
> >> +
> >> +FILES_${PN}-dbg +=3D " \
> >> +  /opt/ofonotest/bin/.debug \
> >> +  ${libdir}/libqofono/tests/.debug \
> >> +"
> >> +
> >> +EXTRA_QMAKEVARS_PRE =3D " \
> >> +  PREFIX=3D${prefix} \
> >> +"
> >> +
> >> +do_configure_prepend() {
> >> +  # Hack *.pro variables
> >> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],$=
{QT_IMPORTS_DIR},g' '{}' ';'
> >> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_PREFIX\],$$=
INSTALL_ROOT$$PREFIX,g' '{}' ';'
> >> +}
> >> +
> >> +do_install() {
> >> +  cd ${S} && (INSTALL_ROOT=3D${D} oe_runmake install)
> >> +
> >> +  cd ${D}/${datadir}/qt4/mkspecs/features
> >> +
> >> +  sed -i -e '/DEPENDPATH.*/d' qofono.prf
> >> +  sed -i -e '/INCLUDEPATH.*/d' qofono.prf
> >> +  sed -i -e '/LIBS.*/d' qofono.prf
> >> +
> >> +  # to make it work with the SDK
> >> +  echo 'DEPENDPATH +=3D $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
> >> +  echo 'INCLUDEPATH +=3D $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.p=
rf
> >> +  echo 'LIBS +=3D -lqofono' >> qofono.prf
> >> +}
> >
> > It's trying to install in root, do you know why?
>=20
> Maybe because you are using dash. This recipe doesn't work in dash,
> you can fix it just by removing the INSTALL_ROOT=3D${D} on the same line
> as the make command. Just add export INSTALL_ROOT=3D${D} one line above.
>=20
> If you want I can fix it, or you can.. I don't mind.

Ah right, I'm using dash on jenkins slave to catch such issues :)

I'll fix it, because it's faster for me to amend commit than fetching
new one from patchwork and squashing it, thanks.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJUdykACgkQN1Ujt2V2gBxsUwCgsNxboGeh7lt9lqUufv6siQqs
rVIAnRwoPzjEw0wHxL2QUH8JilBRZXpx
=ewDW
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
