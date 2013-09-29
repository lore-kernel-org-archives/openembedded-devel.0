Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 277F161EF6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 07:08:42 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1985408eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6Cq9dErgNmqaC84xuYht2bRfpQvgEaZZXGo79YekOxo=;
	b=vczYSAQDMpJ07cYKIZApnNuJT5tfBE/tMEl09V2k20XtMnOOqq7yN5dloviR0Axdiw
	MJpMD8MkZrP2K2Vyv1fVpla7A/RfKGWctVuRnJir6AtiMRUz748/7wdxwh2HRL2DapGI
	guLUUki4Mm/HCEXoRK7uifPRfjwVqiVg4xMgd2iH+MD49ZrgJtMqH7+gSX55xo/U454T
	0A1kyiGb1Kl5Mxpb/8hIBf8/rae489zMevtwNudIy+PRlMKoyJsRysN2y8eLvUk3uIap
	FPo9JpdD5TalxPBOjjFScRMTlDhvRXxRYpzhk+q8v4gKA/N+uQV2fcsfcGUqpEo4OT2H
	xwDQ==
X-Received: by 10.14.174.131 with SMTP id x3mr129350eel.61.1380438524365;
	Sun, 29 Sep 2013 00:08:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm36220782eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Sep 2013 00:08:43 -0700 (PDT)
Date: Sun, 29 Sep 2013 09:08:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130929070845.GC3575@jama>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
	<1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/6] maliit-*-qt5: Adjust MKSPEC path
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
X-List-Received-Date: Sun, 29 Sep 2013 07:08:44 -0000
X-Groupsio-MsgNum: 46385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline

--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2013 at 11:25:17PM +0100, Stefan Schmidt wrote:
> ---
>  recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
>  recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/m=
aliit/maliit-framework-qt5_git.bb
> index 7b336ff..4f2da19 100644
> --- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
> +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> @@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
>      PREFIX=3D${prefix} \
>      LIBDIR=3D${libdir} \
>      QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
> -    MALIIT_INSTALL_PRF=3D${datadir}/qt4/mkspecs/features \
> +    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
>      SCHEMADIR=3D${sysconfdir}/gconf/schemas \
>      CONFIG+=3Ddisable-gconf \
>      CONFIG+=3Ddisable-gtk-cache-update \
> @@ -68,8 +68,9 @@ EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> =20
>  do_install_append() {
>      #Fix absolute paths
> -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/q=
t4/mkspecs/features/maliit-framework.prf
> -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/q=
t4/mkspecs/features/maliit-plugins.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/=
mkspecs/features/maliit-framework.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/=
mkspecs/features/maliit-plugins.prf
> +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/=
mkspecs/features/maliit-defines.prf

Why not use QMAKE_MKSPEC_PATH here as well?

> =20
>      install -d ${D}${datadir}/applications
>      install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/appli=
cations
> diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/mal=
iit/maliit-plugins-qt5_git.bb
> index 9d5b0e2..6b019ef 100644
> --- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
> +++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
> @@ -23,6 +23,7 @@ PV =3D "0.99.0+git${SRCPV}"
> =20
>  EXTRA_QMAKEVARS_PRE =3D "\
>      PREFIX=3D${prefix} \
> +    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
>      LIBDIR=3D${libdir} \
>      CONFIG+=3Dnodoc \
>  "
> --=20
> 1.8.4.rc3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJH0f0ACgkQN1Ujt2V2gBz3rACghLdTHYMMNrd7TJZnVlYQFFwc
cJUAniI1x06x8DtM5ruTwiy5ujjBp2n6
=vGan
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
