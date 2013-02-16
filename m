Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6msn-0005XL-P9
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 19:53:19 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so2181175eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 10:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CKZOL3k7w0sn1qaPRrTsWPAstGI1ig5bnUy5AIQCZzM=;
	b=L2l3u6LmJyhQYEInJR5RjZoibGJIiuFoSkHuuORTq6WSrVGVgLangQnodB+oIz/Tat
	GYeTGCEIpeXsBWPrkkVmJ/tJJcj+RZv+l0yImfzOYdUnjSXx7pOOGv0lrbgQdvhh4UZ1
	jZiHnjuuVciC0u6avmzF1yIbcMwHp3juOVh4VJjVkOEp/hKvgE+j5txwTpqo+G/AI7QI
	+4pyFVtfFvSZM9/Ahvh/D//wDeFFYz5e0LcmRjBBINwgCk7yDi4THZtIEtcKzkT89qc/
	O4Uqkl7DTv/YGjBZxSHTgb7JDAva45uNUqFpvuOvdUIEbgKEp7bn2s75H9+GAjaxU1Ib
	o5ug==
X-Received: by 10.14.1.130 with SMTP id 2mr23248891eed.15.1361039824600;
	Sat, 16 Feb 2013 10:37:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q42sm80461663eem.14.2013.02.16.10.37.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 10:37:04 -0800 (PST)
Date: Sat, 16 Feb 2013 19:37:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216183711.GA3300@jama>
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
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
X-List-Received-Date: Sat, 16 Feb 2013 18:53:23 -0000
X-Groupsio-MsgNum: 43204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opqKFQYYH8F8WaoB"
Content-Disposition: inline

--opqKFQYYH8F8WaoB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 09:25:53AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> This recipe provides the Qt library and QML plugins for connman.

Fails in do_install (possibly issue with dash)

ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/temp/=
log.do_install.20933
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 8 MAKEFLAGS=3D install
| cd libconnman-qt/ && make -f Makefile install
| make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/libconn=
man-qt'
| install -m 755 -p "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0=
=2E3.0"
| install: cannot create regular file `/usr/lib/libconnman-qt4.so.0.3.0': P=
ermission denied
| make[1]: [install_target] Error 1 (ignored)
| ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so"
| ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so': Permissi=
on denied
| make[1]: [install_target] Error 1 (ignored)
| ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0"
| ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0': Permis=
sion denied
| make[1]: [install_target] Error 1 (ignored)
| ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0.3"
| ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0.3': Perm=
ission denied
| make[1]: [install_target] Error 1 (ignored)
| install -m 644 -p "libconnman-qt4.prl" "/usr/lib/libconnman-qt4.prl"
| install: cannot create regular file `/usr/lib/libconnman-qt4.prl': Permis=
sion denied
| make[1]: [install_target] Error 1 (ignored)
| install -m 644 -p "connman-qt4.pc" "/usr/lib/connman-qt4.pc"
| install: cannot create regular file `/usr/lib/connman-qt4.pc': Permission=
 denied
| make[1]: [install_target] Error 1 (ignored)
| mkdir: cannot create directory `/usr/include/connman-qt/': Permission den=
ied
| make[1]: *** [install_headers] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/libconnm=
an-qt'
| make: *** [sub-libconnman-qt-install_subtargets-ordered] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_install (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/=
temp/log.do_install.20933 for further information)
NOTE: recipe libconnman-qt-0.4.0-r0: task do_install: Failed

COmplete log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30215_060633.log/

>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
>  .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++=
++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-a=
dded-flags-to-disable-qml-plugin-and-test-program-t.patch
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.=
bb
>=20
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-fl=
ags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/lib=
connmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-pr=
ogram-t.patch
> new file mode 100644
> index 0000000..6ec084d
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-=
disable-qml-plugin-and-test-program-t.patch
> @@ -0,0 +1,37 @@
> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> +Date: Mon, 7 Jan 2013 17:13:22 -0800
> +Subject: [PATCH] added flags to disable qml plugin and test program to
> + compile
> +
> +This is usefull when there is no need to compile test program and qml pl=
ugin.
> +
> +Upstream-Status: Accepted
> +
> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> +---
> + connman-qt.pro |   11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/connman-qt.pro b/connman-qt.pro
> +index 7d9ec99..425c41f 100644
> +--- a/connman-qt.pro
> ++++ b/connman-qt.pro
> +@@ -1,4 +1,13 @@
> + TEMPLATE =3D subdirs
> +-SUBDIRS +=3D libconnman-qt test plugin
> ++SUBDIRS +=3D libconnman-qt
> + CONFIG +=3D ordered
> +=20
> ++# CONFIG flag to disable test program
> ++!notest {
> ++    SUBDIRS +=3D test
> ++}
> ++
> ++# CONFIG flag to disable qml plugin
> ++!noplugin {
> ++    SUBDIRS +=3D plugin
> ++}
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/me=
ta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> new file mode 100644
> index 0000000..2c33b49
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> @@ -0,0 +1,69 @@
> +DESCRIPTION =3D "Qt Library for ConnMan"
> +HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://libconnman-qt/clockmodel.h;endline=3D8;md5=
=3Dea9f724050803f15d2d900ce3c5dac88"
> +
> +SECTION =3D "qt/lib"
> +
> +PR =3D "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +RDEPENDS_${PN} =3D "connman"
> +RDEPENDS_${PN}-plugin =3D "${PN}"
> +
> +PROVIDES +=3D "${PN}-plugin"
> +
> +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> +
> +# this is for users to bbappend this recipe and change it
> +BRANCH =3D "master"
> +TAG =3D "${PV}"
> +SRCREV =3D "${AUTOREV}"
> +
> +SRC_URI =3D " \
> +  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH};tag=3D${TAG} \
> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch=
 \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> +# the plugin target needs to be the same as 'target.path' and 'qmldir.pa=
th' in ${S}/plugin/plugin.pro
> +PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/Connman"
> +
> +FILES_${PN} =3D " \
> +  ${libdir}/libconnman-qt4${SOLIBS} \
> +"
> +
> +FILES_${PN}-dev =3D " \
> +  ${includedir}/connman-qt/* \
> +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> +  ${libdir}/libconnman-qt4.prl \
> +  ${libdir}/pkgconfig/connman-qt4.pc \
> +  ${libdir}/connman-qt4.pc \
> +"
> +
> +FILES_${PN}-plugin =3D " \
> +  ${PLUGINS_TARGET}/qmldir \
> +  ${PLUGINS_TARGET}/lib*.so \
> +"
> +
> +FILES_${PN}-plugin-dbg =3D " \
> +  ${PLUGINS_TARGET}/.debug \
> +  ${PLUGINS_TARGET}/.debug/* \
> +"
> +
> +EXTRA_QMAKEVARS_PRE =3D " \
> +  CONFIG+=3Dnotest \
> +"
> +
> +do_configure_prepend() {
> +  # Hack *.pro variables
> +  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${Q=
T_IMPORTS_DIR},g' '{}' ';'
> +}
> +
> +do_install() {
> +  cd ${S} && (INSTALL_ROOT=3D${D} oe_runmake install)
> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opqKFQYYH8F8WaoB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEf0dcACgkQN1Ujt2V2gByLuwCZAfi4S/1f3J/itH4RnR47u9ue
J4QAnRWPPkQn28ftTAA1s6T5kYro0iU3
=bZqb
-----END PGP SIGNATURE-----

--opqKFQYYH8F8WaoB--
