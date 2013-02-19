Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bkP-0002Ad-1W
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:11:57 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so3076497pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 16:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dfaAxH5YaR9iU1+2JzqwxghQJGmwWhJRFK6LONfX9K4=;
	b=d9SOmPZcpiU+l77yLJ+9UPQWX/Mn/SUq/fQPTQum/9y3KyIS8o2KitGe38xxkfc97E
	6FPwdD1J+vv5zcaFhanMtqozPVA+3r27ulHs0bRgBDwKBn1nKNyR8AQ+ZkosszoGVLc0
	ijsXtISXs9mpYTk2PibXyGI5Mqr6rYzkoIZVPcEsAZMbW5rNYvFN9H17Q38/sEsWopIE
	SMklRJmOwhd1z5GsRG4s2HbPKPsY5OSc4siFRsgBvjjkvWEGRrQ7riEvGzkgdi0ucokX
	3F9i2tYsvnSm/dqZ4eqmx22gilOXYj9MQEj0sgA7ksSsyANVeAT68knCfSOCBadBCa56
	RfnQ==
X-Received: by 10.68.25.138 with SMTP id c10mr35185159pbg.133.1361235343833;
	Mon, 18 Feb 2013 16:55:43 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm105379904paw.16.2013.02.18.16.55.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 16:55:42 -0800 (PST)
Date: Tue, 19 Feb 2013 01:55:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219005544.GM3300@jama>
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
	<20130216183711.GA3300@jama> <512274F6.4090002@felipetonello.com>
	<20130218192559.GI3300@jama>
MIME-Version: 1.0
In-Reply-To: <20130218192559.GI3300@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 19 Feb 2013 01:11:57 -0000
X-List-Received-Date: Tue, 19 Feb 2013 01:11:57 -0000
X-Groupsio-MsgNum: 43230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zFmACHHOtkGZvEBq"
Content-Disposition: inline

--zFmACHHOtkGZvEBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 08:25:59PM +0100, Martin Jansa wrote:
> On Mon, Feb 18, 2013 at 10:37:42AM -0800, Felipe Ferreri Tonello wrote:
> > Hi Martin,
> >=20
> > On 02/16/2013 10:37 AM, Martin Jansa wrote:
> > > On Mon, Feb 11, 2013 at 09:25:53AM -0800, eu@felipetonello.com wrote:
> > >> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> > >>
> > >> This recipe provides the Qt library and QML plugins for connman.
> > >
> > > Fails in do_install (possibly issue with dash)
> > >
> > > ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0=
/temp/log.do_install.20933
> > > Log data follows:
> > > | DEBUG: Executing shell function do_install
> > > | NOTE: make -j 8 MAKEFLAGS=3D install
> > > | cd libconnman-qt/ && make -f Makefile install
> > > | make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/l=
ibconnman-qt'
> > > | install -m 755 -p "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt=
4.so.0.3.0"
> > > | install: cannot create regular file `/usr/lib/libconnman-qt4.so.0.3=
=2E0': Permission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so"
> > > | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so': Pe=
rmission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0"
> > > | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0': =
Permission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0.3"
> > > | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0.3'=
: Permission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | install -m 644 -p "libconnman-qt4.prl" "/usr/lib/libconnman-qt4.prl"
> > > | install: cannot create regular file `/usr/lib/libconnman-qt4.prl': =
Permission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | install -m 644 -p "connman-qt4.pc" "/usr/lib/connman-qt4.pc"
> > > | install: cannot create regular file `/usr/lib/connman-qt4.pc': Perm=
ission denied
> > > | make[1]: [install_target] Error 1 (ignored)
> > > | mkdir: cannot create directory `/usr/include/connman-qt/': Permissi=
on denied
> > > | make[1]: *** [install_headers] Error 1
> > > | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-=
core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/li=
bconnman-qt'
> > > | make: *** [sub-libconnman-qt-install_subtargets-ordered] Error 2
> > > | ERROR: oe_runmake failed
> > > | ERROR: Function failed: do_install (see /home/jenkins/oe/shr-core-b=
ranches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4=
=2E0-r0/temp/log.do_install.20933 for further information)
> > > NOTE: recipe libconnman-qt-0.4.0-r0: task do_install: Failed
> > >
> > > COmplete log:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130215_060633.log/
> >=20
> > It seems that the INSTALL_ROOT wasn't set to ${D}.
> >=20
> > Can I have the run.do_install log?
>=20
> I've already removed tmp-eglibc and now new world build is running, but
> I had the same issue with nodejs when build machine is using dash
>=20
> http://git.openembedded.org/meta-openembedded/commit/?id=3D4128325a4c87bc=
de6ac6ffe5dbf5d6d057ee4804
>=20
> If it fails again, I'll use this for test first, and only if it does not
> help I'll send you run.do_install.

Merged with that export and 2 small modifications (see commit message)

Thanks!

>=20
> Cheers,
>=20
> >=20
> > Felipe
> >=20
> > >
> > >>
> > >> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > >> ---
> > >>   ...-to-disable-qml-plugin-and-test-program-t.patch |   37 ++++++++=
+++
> > >>   .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++=
++++++++++++
> > >>   2 files changed, 106 insertions(+)
> > >>   create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/=
0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> > >>   create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_=
0.4.0.bb
> > >>
> > >> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-add=
ed-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-q=
t/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-te=
st-program-t.patch
> > >> new file mode 100644
> > >> index 0000000..6ec084d
> > >> --- /dev/null
> > >> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flag=
s-to-disable-qml-plugin-and-test-program-t.patch
> > >> @@ -0,0 +1,37 @@
> > >> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2=
001
> > >> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> > >> +Date: Mon, 7 Jan 2013 17:13:22 -0800
> > >> +Subject: [PATCH] added flags to disable qml plugin and test program=
 to
> > >> + compile
> > >> +
> > >> +This is usefull when there is no need to compile test program and q=
ml plugin.
> > >> +
> > >> +Upstream-Status: Accepted
> > >> +
> > >> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> > >> +---
> > >> + connman-qt.pro |   11 ++++++++++-
> > >> + 1 file changed, 10 insertions(+), 1 deletion(-)
> > >> +
> > >> +diff --git a/connman-qt.pro b/connman-qt.pro
> > >> +index 7d9ec99..425c41f 100644
> > >> +--- a/connman-qt.pro
> > >> ++++ b/connman-qt.pro
> > >> +@@ -1,4 +1,13 @@
> > >> + TEMPLATE =3D subdirs
> > >> +-SUBDIRS +=3D libconnman-qt test plugin
> > >> ++SUBDIRS +=3D libconnman-qt
> > >> + CONFIG +=3D ordered
> > >> +
> > >> ++# CONFIG flag to disable test program
> > >> ++!notest {
> > >> ++    SUBDIRS +=3D test
> > >> ++}
> > >> ++
> > >> ++# CONFIG flag to disable qml plugin
> > >> ++!noplugin {
> > >> ++    SUBDIRS +=3D plugin
> > >> ++}
> > >> +--
> > >> +1.7.9.5
> > >> +
> > >> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb=
 b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> > >> new file mode 100644
> > >> index 0000000..2c33b49
> > >> --- /dev/null
> > >> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> > >> @@ -0,0 +1,69 @@
> > >> +DESCRIPTION =3D "Qt Library for ConnMan"
> > >> +HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> > >> +LICENSE =3D "Apache-2.0"
> > >> +LIC_FILES_CHKSUM =3D "file://libconnman-qt/clockmodel.h;endline=3D8=
;md5=3Dea9f724050803f15d2d900ce3c5dac88"
> > >> +
> > >> +SECTION =3D "qt/lib"
> > >> +
> > >> +PR =3D "r0"
> > >> +
> > >> +inherit qt4x11 pkgconfig
> > >> +
> > >> +RDEPENDS_${PN} =3D "connman"
> > >> +RDEPENDS_${PN}-plugin =3D "${PN}"
> > >> +
> > >> +PROVIDES +=3D "${PN}-plugin"
> > >> +
> > >> +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> > >> +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> > >> +
> > >> +# this is for users to bbappend this recipe and change it
> > >> +BRANCH =3D "master"
> > >> +TAG =3D "${PV}"
> > >> +SRCREV =3D "${AUTOREV}"
> > >> +
> > >> +SRC_URI =3D " \
> > >> +  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH};tag=3D${=
TAG} \
> > >> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.=
patch \
> > >> +"
> > >> +
> > >> +S =3D "${WORKDIR}/git"
> > >> +
> > >> +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> > >> +# the plugin target needs to be the same as 'target.path' and 'qmld=
ir.path' in ${S}/plugin/plugin.pro
> > >> +PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/Connman"
> > >> +
> > >> +FILES_${PN} =3D " \
> > >> +  ${libdir}/libconnman-qt4${SOLIBS} \
> > >> +"
> > >> +
> > >> +FILES_${PN}-dev =3D " \
> > >> +  ${includedir}/connman-qt/* \
> > >> +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> > >> +  ${libdir}/libconnman-qt4.prl \
> > >> +  ${libdir}/pkgconfig/connman-qt4.pc \
> > >> +  ${libdir}/connman-qt4.pc \
> > >> +"
> > >> +
> > >> +FILES_${PN}-plugin =3D " \
> > >> +  ${PLUGINS_TARGET}/qmldir \
> > >> +  ${PLUGINS_TARGET}/lib*.so \
> > >> +"
> > >> +
> > >> +FILES_${PN}-plugin-dbg =3D " \
> > >> +  ${PLUGINS_TARGET}/.debug \
> > >> +  ${PLUGINS_TARGET}/.debug/* \
> > >> +"
> > >> +
> > >> +EXTRA_QMAKEVARS_PRE =3D " \
> > >> +  CONFIG+=3Dnotest \
> > >> +"
> > >> +
> > >> +do_configure_prepend() {
> > >> +  # Hack *.pro variables
> > >> +  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\=
],${QT_IMPORTS_DIR},g' '{}' ';'
> > >> +}
> > >> +
> > >> +do_install() {
> > >> +  cd ${S} && (INSTALL_ROOT=3D${D} oe_runmake install)
> > >> +}
> > >> --
> > >> 1.7.9.5
> > >>
> > >>
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> > >
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zFmACHHOtkGZvEBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEizZAACgkQN1Ujt2V2gBwdWACfYE5e4jGTqqmIdbmOaX9vopcv
D0oAn3GuQ6JvBikpMbfmgV8oyRdass7B
=z3YV
-----END PGP SIGNATURE-----

--zFmACHHOtkGZvEBq--
