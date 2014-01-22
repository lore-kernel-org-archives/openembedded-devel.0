Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id B377E6E76D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 19:09:48 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so5181747eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wd9cNjmb7E2feq375frv0/1k2RuQe4zmKw66SC3Y5Uk=;
	b=LqSG26GuI3ezp0OkcXoCu4BWDU2HQae1AN42XtA3C5bDQT5Swun5Zl1RS1M+vlNqYO
	hD7uZLypHNn1mcODar/8zi2YPLIt3p2rkrZ1vJPKPcOClkc5+34XLgxko6cud7FJqh69
	dRu4Ag7/hpPkKKNmkiipyonzMvLlMZPyeTu14JOeAjLqBPkDnBMB69WP8OP/smMLF1sL
	cZEr9Gfoc/dtHz9ZQIBKJIDIKbfE2MVOvhomuu9EsFUc9aQxfFhNjdnQoEaGMClQHAmt
	rNdQpjka5YUkURDBWwMZ1fGXP9nGk5gILQC3EytY4K66cjekqOX53P1E18ezY+RnyNux
	3R1g==
X-Received: by 10.14.109.137 with SMTP id s9mr3300249eeg.6.1390417789123;
	Wed, 22 Jan 2014 11:09:49 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm30502474een.13.2014.01.22.11.09.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 11:09:48 -0800 (PST)
Date: Wed, 22 Jan 2014 20:09:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140122190949.GX4100@jama>
References: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
	<52E0029D.2000507@felipetonello.com>
	<52E01481.6080300@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <52E01481.6080300@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.46, add recipe for qte
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
X-List-Received-Date: Wed, 22 Jan 2014 19:09:50 -0000
X-Groupsio-MsgNum: 47891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSOv3uy5xJSQbCk1"
Content-Disposition: inline

--aSOv3uy5xJSQbCk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 07:57:05PM +0100, Andreas Oberritter wrote:
> Hello Felipe,
>=20
> On 22.01.2014 18:40, Felipe Ferreri Tonello wrote:
> > Hi Andreas,
> >=20
> > On 01/20/2014 07:08 AM, Andreas Oberritter wrote:
> >> * Use _git version suffix, because it really is a Git recipe.
> >> * Create an inc file to be shared between qt4x11 and qt4e.
> >> * Use CONFIG+=3Dnotests, because CONFIG+=3Dnotest has no effect now.
> >> * Reorder some variables according to style guide.
> >> * Remove unneeded PROVIDES for ${PN}-plugin, which is already listed
> >>    in PACKAGES.
> >> * Hardcode branch to master, because no other branch exists upstream.
> >> * Simplify do_install.
> >>
> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> ---
> >>   .../{libconnman-qt_1.0.7.bb =3D> libconnman-qt.inc}  | 61
> >> +++++++++-------------
> >>   .../recipes-qt/libconnman-qt/libconnman-qt_git.bb  |  3 ++
> >>   .../recipes-qt/libconnman-qt/libconnman-qte_git.bb |  3 ++
> >>   3 files changed, 30 insertions(+), 37 deletions(-)
> >>   rename meta-oe/recipes-qt/libconnman-qt/{libconnman-qt_1.0.7.bb =3D>
> >> libconnman-qt.inc} (65%)
> >>   create mode 100644
> >> meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
> >>   create mode 100644
> >> meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
> >>
> >> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> >> b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> >> similarity index 65%
> >> rename from meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> >> rename to meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> >> index 2288c4f..e4f68db 100644
> >> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
> >> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> >> @@ -1,66 +1,53 @@
> >>   DESCRIPTION =3D "Qt Library for ConnMan"
> >>   HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> >> +SECTION =3D "qt/lib"
> >>   LICENSE =3D "Apache-2.0"
> >>   LIC_FILES_CHKSUM =3D
> >> "file://libconnman-qt/clockmodel.h;endline=3D8;md5=3Dea9f724050803f15d=
2d900ce3c5dac88"
> >>
> >> +SRCREV =3D "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
> >> +PV =3D "1.0.46+git${SRCPV}"
> >>
> >> -SECTION =3D "qt/lib"
> >> -
> >> -
> >> -inherit qt4x11 pkgconfig
> >> -
> >> -RDEPENDS_${PN} =3D "connman"
> >> -RDEPENDS_${PN}-plugin =3D "${PN}"
> >> -
> >> -PROVIDES +=3D "${PN}-plugin"
> >> -
> >> -PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> >> -RRECOMMENDS_${PN} =3D "${PN}-plugin"
> >> -
> >> -BRANCH =3D "master"
> >> -SRCREV =3D "6a5e4f981112a90a8c19d82bd671da389d2af993"
> >> -
> >> -SRC_URI =3D " \
> >> -    git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH} \
> >> -"
> >> +SRC_URI =3D "git://github.com/nemomobile/libconnman-qt.git;branch=3Dm=
aster"
> >>
> >>   S =3D "${WORKDIR}/git"
> >>
> >> -QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> >> -# the plugin target needs to be the same as 'target.path' and
> >> 'qmldir.path' in ${S}/plugin/plugin.pro
> >> -PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/Connman"
> >> +inherit pkgconfig
> >>
> >> -EXTRA_QMAKEVARS_PRE =3D " \
> >> -    CONFIG+=3Dnotest \
> >> -"
> >> +EXTRA_QMAKEVARS_PRE =3D "CONFIG+=3Dnotests"
> >>
> >>   do_configure_prepend() {
> >>       # Hack *.pro variables
> >>       find ${S}/plugin/*.pro -exec sed -i -e
> >> 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
> >>   }
> >> -
> >>   do_install() {
> >> -    export INSTALL_ROOT=3D${D}
> >> -    oe_runmake install
> >> +    oe_runmake install INSTALL_ROOT=3D${D}
> >=20
> > Are you sure this works with dash? Because the reason why I did the
> > previous was to work in dash as well.
>=20
> It's shell-agnostic, because the variable gets interpreted by make.

It should be, but I remember it too, it was failing in jenkins job on
server with dash, I'll confirm when it fails.

> >>   }
> >>
> >> +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> >> +
> >> +RDEPENDS_${PN} =3D "connman"
> >> +RDEPENDS_${PN}-plugin =3D "${PN}"
> >> +
> >> +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> >> +
> >>   FILES_${PN} =3D " \
> >> -    ${libdir}/libconnman-qt4${SOLIBS} \
> >> +    ${libdir}/libconnman-qt*${SOLIBS} \
> >>   "
> >> -
> >>   FILES_${PN}-dev =3D " \
> >> -    ${includedir}/connman-qt/* \
> >> -    ${libdir}/libconnman-qt4${SOLIBSDEV} \
> >> -    ${libdir}/libconnman-qt4.prl \
> >> -    ${libdir}/pkgconfig/connman-qt4.pc \
> >> -    ${libdir}/connman-qt4.pc \
> >> +    ${includedir}/connman-qt*/* \
> >> +    ${libdir}/libconnman-qt*${SOLIBSDEV} \
> >> +    ${libdir}/libconnman-qt*.prl \
> >> +    ${libdir}/pkgconfig/connman-qt*.pc \
> >> +    ${libdir}/connman-qt*.pc \
> >>   "
> >> -
> >>   FILES_${PN}-plugin =3D " \
> >>       ${PLUGINS_TARGET}/qmldir \
> >>       ${PLUGINS_TARGET}/lib*.so \
> >>   "
> >> -
> >>   FILES_${PN}-plugin-dbg =3D " \
> >>       ${PLUGINS_TARGET}/.debug \
> >>       ${PLUGINS_TARGET}/.debug/* \
> >>   "
> >> +
> >> +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> >=20
> > Doesn't Qt4 Embedded uses ${libdir}/qte/imports?
>=20
> You're probably right (qtopia). I'll verify and post v2.
>=20
> I tested this recipe with Qt4/X11 and Qt5 (not submitted yet, overrides
> QT_IMPORTS_DIR), but Qt4/Embedded apparently went by the board.
>=20
> Regards,
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aSOv3uy5xJSQbCk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLgF30ACgkQN1Ujt2V2gBwy0ACdFxVgFVcHeCJw9zUcDYNfan/O
TQAAnjoa6EDjk01jTfAN2iiiItt0eYcx
=mdkg
-----END PGP SIGNATURE-----

--aSOv3uy5xJSQbCk1--
