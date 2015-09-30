Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0F977066
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 20:17:36 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so3588852wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UMtk4iiuOG4tBuJO5F82c9VzZGUR74b9s/LEaMdsAoQ=;
	b=GUH8UX3IhH94mhT5RNLcAewU6FgBvmaC/aehfC8rnPhdW8vuGd8lQ9n8NkcUbNG0Ds
	UxY/HtcspfFS23ugto9d5TpCCNsAeipdrHZ9hW/IRcePidImJDVFv6nS2Tjglb+grJzT
	c0D/Um4J+P/57UMU8nA9USpPPTxK8pAFpbxHDB66zyUq3bZHVWo+jqREccKivX6/2HX0
	BL40+Z4VxxFuHdcROC4613w0hSjX9wuCJVw8yk/c5YGjymE80cWZqiDpbinpEethuAni
	4iyKNiISIL5SEBoVGkSVY7/qPqpoVscx4RnGJa242C4WhTt97CTGG1+uFJHPqwDSD21x
	xcng==
X-Received: by 10.194.92.166 with SMTP id cn6mr6501244wjb.6.1443644256738;
	Wed, 30 Sep 2015 13:17:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bv2sm2404634wjc.11.2015.09.30.13.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 13:17:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2015 22:18:29 +0200
To: Johannes Pointner <h4nn35.work@gmail.com>
Message-ID: <20150930201829.GF2405@jama>
References: <1443643033-16565-1-git-send-email-johannes.pointner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1443643033-16565-1-git-send-email-johannes.pointner@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [[PATCH][meta-qt5]] maliit-framework-qt5: fixed paths and enabled qt5-inputcontext
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
X-List-Received-Date: Wed, 30 Sep 2015 20:17:40 -0000
X-Groupsio-MsgNum: 57602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline

--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 09:57:13PM +0200, Johannes Pointner wrote:
> *Fixes paths for qt5 and enables qt5-inputcontext.

Please inherit qmake5_paths and use variables from there.

> Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
> ---
>  recipes-qt/maliit/maliit-framework-qt5_git.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/m=
aliit/maliit-framework-qt5_git.bb
> index 975892d..03bd6ed 100644
> --- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
> +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> @@ -20,9 +20,6 @@ GTKIMMODULES_PACKAGES =3D "${PN}-gtk"
> =20
>  DEPENDS =3D "qtdeclarative"
> =20
> -# FIXME: Do we need something like this with qt5?
> -#RDEPENDS_${PN} =3D "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
> -
>  RRECOMMENDS_${PN} =3D "maliit-plugins-qt5"
> =20
>  FILES_${PN} +=3D "\
> @@ -30,10 +27,12 @@ FILES_${PN} +=3D "\
>      ${bindir} \
>      ${datadir}/applications/maliit-server.desktop \
>      ${datadir}/dbus-1 \
> +    ${libdir}/qt5/plugins/platforminputcontexts \
>  "
> =20
>  FILES_${PN}-dbg +=3D "\
>      ${libdir}/maliit-framework-tests \
> +    ${libdir}/qt5/plugins/platforminputcontexts/.debug \
>  "
> =20
>  FILES_${PN}-dev +=3D "\
> @@ -46,7 +45,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
>      PREFIX=3D${prefix} \
>      LIBDIR=3D${libdir} \
>      DATADIR=3D${datadir} \
> -    QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
> +    QT_INSTALL_PLUGINS=3D${libdir}/qt5/plugins \
>      MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
>      SCHEMADIR=3D${sysconfdir}/gconf/schemas \
>      CONFIG+=3Ddisable-gconf \
> @@ -56,14 +55,15 @@ EXTRA_QMAKEVARS_PRE =3D "\
>      CONFIG+=3Dnodoc \
>      CONFIG+=3Dnoxcb \
>      CONFIG+=3Denable-dbus-activation \
> +    CONFIG+=3Dqt5-inputcontext \
>  "
> =20
>  EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> =20
>  do_install_append() {
>      #Fix absolute paths
> -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${Q=
T_DIR_NAME}/mkspecs/features/maliit-framework.prf
> -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${Q=
T_DIR_NAME}/mkspecs/features/maliit-plugins.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${=
QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${=
QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
> =20
>      install -d ${D}${datadir}/applications
>      install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/appli=
cations
> --=20
> 2.6.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYMQ5QACgkQN1Ujt2V2gBwyRQCcDB86thXNCGRzjuTLIaH8VxNb
voMAn3KP0qPiL1nBf1NkkywweNWPgWZe
=8ZHp
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--
