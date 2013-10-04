Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3B92860FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:21:39 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1793605eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pQucTBA+qRB0RmrZ9GUxfoCxpnCq4ypPp0k/8UDutyQ=;
	b=MzPPPx/s1XPNdL5J+NNnYyB8wq5rI5hyeNNzf1oSJ7rz2f5r5TdnL0OCK6PegRRf9Y
	4+L+Q7rUc+VtO8+l4RYLHSNMsqLD/tpXoglk5GR6VRUP7fyG2brK7L0qCSsOFBcCAyid
	0Ze+YVMBS9243Tt5TP1FqjeZQXh7qVjTBYvXqn4uGH1HKAdOmUX+LE208uMVHsLOLRaf
	hAqmbD20KXE28JLapYBWCDdRfmNqBBPk9/Z8a1j5e4sd2svg4D6/TyfkOno7ZDAx8RdC
	nw3HGfJ/OcvUJaRazVS+Zw+PxiaQF2fIc/XfizxmlOFX2pqOpPU010cfYumaGdAeSiqp
	0Eww==
X-Received: by 10.14.194.131 with SMTP id m3mr22159218een.45.1380896500417;
	Fri, 04 Oct 2013 07:21:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm28581512eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 07:21:39 -0700 (PDT)
Date: Fri, 4 Oct 2013 16:21:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131004142146.GJ6240@jama>
References: <1380561400-574-1-git-send-email-eu@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <1380561400-574-1-git-send-email-eu@felipetonello.com>
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
X-List-Received-Date: Fri, 04 Oct 2013 14:21:40 -0000
X-Groupsio-MsgNum: 46446
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Content-Disposition: inline

--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2013 at 10:16:40AM -0700, Felipe F. Tonello wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>=20
> libqofono is a Qt library for oFono that provides easy to use Qt library =
and
> QML components to use oFono.
>=20
> OBS: This recipe provides the Qt4 support only, but the library also works
> with Qt5.
>=20
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  meta-oe/recipes-qt/libqofono/libqofono_0.4.bb | 88 +++++++++++++++++++++=
++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
>=20
> diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/reci=
pes-qt/libqofono/libqofono_0.4.bb
> new file mode 100644
> index 0000000..7c34db2
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
> @@ -0,0 +1,88 @@
> +DESCRIPTION =3D "Qt Library for oFono"
> +HOMEPAGE =3D "https://github.com/nemomobile/libqofono"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://README;endline=3D3;md5=3D8a15bce3921d1238d9=
a9f23828612947"
> +
> +SECTION =3D "qt/lib"
> +
> +PR =3D "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +RDEPENDS_${PN} =3D "ofono"
> +RDEPENDS_${PN}-plugin =3D "${PN}"
> +
> +PROVIDES +=3D "${PN}-plugin"
> +
> +PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg ${PN}-test"
> +RRECOMMENDS_${PN} =3D "${PN}-plugin"
> +
> +BRANCH =3D "master"
> +TAG =3D "${PV}"
> +
> +SRC_URI =3D " \
> +  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH};tag=3D${TAG} \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> +PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/QOfono"
> +
> +FILES_${PN} =3D " \
> +  ${libdir}/libqofono${SOLIBS} \
> +"
> +
> +FILES_${PN}-dev =3D " \
> +  ${includedir}/qofono/* \
> +  ${includedir}/qofono/dbus/* \
> +  ${libdir}/libqofono${SOLIBSDEV} \
> +  ${libdir}/libqofono.prl \
> +  ${libdir}/pkgconfig/qofono.pc \
> +  ${datadir}/qt4/mkspecs/features/qofono.prf \
> +"
> +
> +FILES_${PN}-plugin =3D " \
> +  ${PLUGINS_TARGET}/qmldir \
> +  ${PLUGINS_TARGET}/lib*.so \
> +"
> +
> +FILES_${PN}-plugin-dbg =3D " \
> +  ${PLUGINS_TARGET}/.debug \
> +"
> +
> +FILES_${PN}-test =3D " \
> +  /opt/ofonotest/bin/ofonotest \
> +  /opt/ofonotest/qml/ofonotest \
> +  ${libdir}/libqofono/tests/tst_qofonotest \
> +"
> +
> +FILES_${PN}-dbg +=3D " \
> +  /opt/ofonotest/bin/.debug \
> +  ${libdir}/libqofono/tests/.debug \
> +"
> +
> +EXTRA_QMAKEVARS_PRE =3D " \
> +  PREFIX=3D${prefix} \
> +"
> +
> +do_configure_prepend() {
> +  # Hack *.pro variables
> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT=
_IMPORTS_DIR},g' '{}' ';'
> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_PREFIX\],$$INS=
TALL_ROOT$$PREFIX,g' '{}' ';'
> +}
> +
> +do_install() {
> +  cd ${S} && (INSTALL_ROOT=3D${D} oe_runmake install)
> +
> +  cd ${D}/${datadir}/qt4/mkspecs/features
> +
> +  sed -i -e '/DEPENDPATH.*/d' qofono.prf
> +  sed -i -e '/INCLUDEPATH.*/d' qofono.prf
> +  sed -i -e '/LIBS.*/d' qofono.prf
> +
> +  # to make it work with the SDK
> +  echo 'DEPENDPATH +=3D $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
> +  echo 'INCLUDEPATH +=3D $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
> +  echo 'LIBS +=3D -lqofono' >> qofono.prf
> +}

It's trying to install in root, do you know why?

NOTE: recipe libqofono-0.4-r0: task do_install: Started
ERROR: Function failed: do_install (log file is located at /home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libqof=
ono/0.4-r0/temp/log.do_install.3606)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libqofono/0.4-r0/temp/log.do=
_install.3606
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 8 install
| cd src/ && make -f Makefile install
| make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libqofono/0.4-r0/git/src'
| Makefile:1096: warning: overriding commands for target `install_target'
| Makefile:1074: warning: ignoring old commands for target `install_target'
| Makefile:1108: warning: overriding commands for target `uninstall_target'
| Makefile:1086: warning: ignoring old commands for target `uninstall_targe=
t'
| install -m 755 -p "libqofono.so.0.1.0" "/usr/lib/libqofono.so.0.1.0"
| install -m 644 -p /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/libqofono/0.4-r0/git/src/qofono.prf /usr/shar=
e/qt4/mkspecs/features/
| mkdir: cannot create directory `/usr/include/qofono/': Permission denied
| make[1]: *** [install_headers] Error 1
| make[1]: *** Waiting for unfinished jobs....
| mkdir: cannot create directory `/usr/include/qofono': Permission denied
| make[1]: *** [install_dbusheaders] Error 1
| mkdir: cannot create directory `/usr/include/qofono': Permission denied
| make[1]: *** [install_xmlfiles] Error 1
| install: cannot create regular file `/usr/lib/libqofono.so.0.1.0': Permis=
sion denied
| make[1]: [install_target] Error 1 (ignored)
| echo --strip-unneeded "/usr/lib/libqofono.so.0.1.0"
| install: cannot create regular file `/usr/share/qt4/mkspecs/features/qofo=
no.prf': Permission denied
| make[1]: [install_qtconfig] Error 1 (ignored)
| --strip-unneeded /usr/lib/libqofono.so.0.1.0
| ln -f -s "libqofono.so.0.1.0" "/usr/lib/libqofono.so"
| ln: failed to create symbolic link `/usr/lib/libqofono.so': Permission de=
nied
| make[1]: [install_target] Error 1 (ignored)
| ln -f -s "libqofono.so.0.1.0" "/usr/lib/libqofono.so.0"
| ln: failed to create symbolic link `/usr/lib/libqofono.so.0': Permission =
denied
| make[1]: [install_target] Error 1 (ignored)
| ln -f -s "libqofono.so.0.1.0" "/usr/lib/libqofono.so.0.1"
| ln: failed to create symbolic link `/usr/lib/libqofono.so.0.1': Permissio=
n denied
| make[1]: [install_target] Error 1 (ignored)
| install -m 644 -p "libqofono.prl" "/usr/lib/libqofono.prl"
| install: cannot create regular file `/usr/lib/libqofono.prl': Permission =
denied
| make[1]: [install_target] Error 1 (ignored)
| install -m 644 -p "pkgconfig/qofono.pc" "/usr/lib/pkgconfig/qofono.pc"
| install: cannot create regular file `/usr/lib/pkgconfig/qofono.pc': Permi=
ssion denied
| make[1]: [install_target] Error 1 (ignored)
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libqofono/0.4-r0/git/src'
| make: *** [sub-src-install_subtargets-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libq=
ofono/0.4-r0/temp/log.do_install.3606)
NOTE: recipe libqofono-0.4-r0: task do_install: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOzvoACgkQN1Ujt2V2gBwolQCffZZ7MAW71fy9Hzb5zmUfmh0H
yq4An3kNJryDHNl8hGpffncXmwiHkidB
=BnGO
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
