Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U8J4b-0001GC-NK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 00:27:40 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so3795642dal.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=uZ9nwuayaloGAEt1eIQQ+9J73DSZN0ssXqFy+PawgE0=;
	b=gHOcGxbToURslzIzBGkoWaLgkX5D+GIsAASp1SUjOKwXRBvJLcpTaJaKjOkOKX5wvd
	wiD7QyojbXEhuIQAs1mrV5a31aUqBdr1g3pZ7/7SkYhSGIrC0lXSDdf1p50r0pOzowTq
	noLGQz7xjyj5xdqCA8Xn6m8BB51UE9foIqNyYRnXr3Fb3OEB9wlJT6ABAxNYtACEnMXo
	foKjXh5TuDHJnxfnAX2vGrjRhHHmQd+dKKjpZwTynL5T1OwVD2E/gJhEuZEB9jeQsrg/
	IggEHMkNP0vIe47TAfq0js73TIOl+zqBHkaLxZNls7QqkvvIfKkVur3vGLcLIKrwQ3ov
	dcbA==
X-Received: by 10.66.7.161 with SMTP id k1mr5045755paa.206.1361401885805;
	Wed, 20 Feb 2013 15:11:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qf7sm23030245pbb.2.2013.02.20.15.11.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 15:11:24 -0800 (PST)
Date: Thu, 21 Feb 2013 00:11:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130220231128.GX3300@jama>
References: <1361387338-6553-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361387338-6553-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] libconnman-qt: fixed directory typo
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
X-List-Received-Date: Wed, 20 Feb 2013 23:27:41 -0000
X-Groupsio-MsgNum: 43271
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hN6rOuQnPQpTmK3E"
Content-Disposition: inline

--hN6rOuQnPQpTmK3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2013 at 11:08:58AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>

Thanks, I'll apply this later today, but next time please send patches
with -M for git to detect renames.

> ---
>  ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
>  .../libconnman-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++=
++++++
>  ...-to-disable-qml-plugin-and-test-program-t.patch |   37 -----------
>  .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 --------------=
------
>  4 files changed, 106 insertions(+), 106 deletions(-)
>  create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-a=
dded-flags-to-disable-qml-plugin-and-test-program-t.patch
>  create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.=
bb
>  delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-a=
dded-flags-to-disable-qml-plugin-and-test-program-t.patch
>  delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.=
bb
>=20
> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-fl=
ags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/lib=
connman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-pr=
ogram-t.patch
> new file mode 100644
> index 0000000..6ec084d
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-=
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
> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb b/me=
ta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> new file mode 100644
> index 0000000..d15d8d7
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
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
> +BRANCH =3D "master"
> +# this matches 0.4.0 tag
> +SRCREV =3D "3af5bd38d82255942f582398160a5d3354346ca3"
> +
> +SRC_URI =3D " \
> +  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH} \
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
> +  export INSTALL_ROOT=3D${D}
> +  oe_runmake install
> +}
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
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-fl=
ags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/lib=
connmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-pr=
ogram-t.patch
> deleted file mode 100644
> index 6ec084d..0000000
> --- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-=
disable-qml-plugin-and-test-program-t.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> -From: "Felipe F. Tonello" <ftonello@cercacor.com>
> -Date: Mon, 7 Jan 2013 17:13:22 -0800
> -Subject: [PATCH] added flags to disable qml plugin and test program to
> - compile
> -
> -This is usefull when there is no need to compile test program and qml pl=
ugin.
> -
> -Upstream-Status: Accepted
> -
> -Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ----
> - connman-qt.pro |   11 ++++++++++-
> - 1 file changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/connman-qt.pro b/connman-qt.pro
> -index 7d9ec99..425c41f 100644
> ---- a/connman-qt.pro
> -+++ b/connman-qt.pro
> -@@ -1,4 +1,13 @@
> - TEMPLATE =3D subdirs
> --SUBDIRS +=3D libconnman-qt test plugin
> -+SUBDIRS +=3D libconnman-qt
> - CONFIG +=3D ordered
> -=20
> -+# CONFIG flag to disable test program
> -+!notest {
> -+    SUBDIRS +=3D test
> -+}
> -+
> -+# CONFIG flag to disable qml plugin
> -+!noplugin {
> -+    SUBDIRS +=3D plugin
> -+}
> ---=20
> -1.7.9.5
> -
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/me=
ta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> deleted file mode 100644
> index d15d8d7..0000000
> --- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -DESCRIPTION =3D "Qt Library for ConnMan"
> -HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://libconnman-qt/clockmodel.h;endline=3D8;md5=
=3Dea9f724050803f15d2d900ce3c5dac88"
> -
> -SECTION =3D "qt/lib"
> -
> -PR =3D "r0"
> -
> -inherit qt4x11 pkgconfig
> -
> -RDEPENDS_${PN} =3D "connman"
> -RDEPENDS_${PN}-plugin =3D "${PN}"
> -
> -PROVIDES +=3D "${PN}-plugin"
> -
> -PACKAGES =3D+ "${PN}-plugin ${PN}-plugin-dbg"
> -RRECOMMENDS_${PN} =3D "${PN}-plugin"
> -
> -BRANCH =3D "master"
> -# this matches 0.4.0 tag
> -SRCREV =3D "3af5bd38d82255942f582398160a5d3354346ca3"
> -
> -SRC_URI =3D " \
> -  git://github.com/nemomobile/${PN}.git;branch=3D${BRANCH} \
> -  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch=
 \
> -"
> -
> -S =3D "${WORKDIR}/git"
> -
> -QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> -# the plugin target needs to be the same as 'target.path' and 'qmldir.pa=
th' in ${S}/plugin/plugin.pro
> -PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/Connman"
> -
> -EXTRA_QMAKEVARS_PRE =3D " \
> -  CONFIG+=3Dnotest \
> -"
> -
> -do_configure_prepend() {
> -  # Hack *.pro variables
> -  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${Q=
T_IMPORTS_DIR},g' '{}' ';'
> -}
> -
> -do_install() {
> -  export INSTALL_ROOT=3D${D}
> -  oe_runmake install
> -}
> -
> -FILES_${PN} =3D " \
> -  ${libdir}/libconnman-qt4${SOLIBS} \
> -"
> -
> -FILES_${PN}-dev =3D " \
> -  ${includedir}/connman-qt/* \
> -  ${libdir}/libconnman-qt4${SOLIBSDEV} \
> -  ${libdir}/libconnman-qt4.prl \
> -  ${libdir}/pkgconfig/connman-qt4.pc \
> -  ${libdir}/connman-qt4.pc \
> -"
> -
> -FILES_${PN}-plugin =3D " \
> -  ${PLUGINS_TARGET}/qmldir \
> -  ${PLUGINS_TARGET}/lib*.so \
> -"
> -
> -FILES_${PN}-plugin-dbg =3D " \
> -  ${PLUGINS_TARGET}/.debug \
> -  ${PLUGINS_TARGET}/.debug/* \
> -"
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

--hN6rOuQnPQpTmK3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlElWCAACgkQN1Ujt2V2gBwgNACeO4+0RYFSoV6L7f7osk+D7L7h
L5kAnjs+W4eqqdxol+3LPZkJKQhzfT5g
=X2fg
-----END PGP SIGNATURE-----

--hN6rOuQnPQpTmK3E--
