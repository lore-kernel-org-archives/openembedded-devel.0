Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id E4B6B6E9B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:50:39 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id d10so2695915eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1S7yv3zerVLfrm5S6O7FASEgb+aO1EbLujnSvzTcO3I=;
	b=vwEu0jkzJq/ZVQ88ly8EnDvxhBL65BGnLa4HFIwak9K1UOacpFGGatnjrdU2Aa9Thy
	/sGtH33dds7CXpeTUF2GNWmu7RzyIVseC5N23DHa+QYVPuXqBUlMl+xpUKebEoimcc5o
	5VZsbh2589kCw5/NpgiYzLHwydcQcqwY3DjAdlKU7EQcWLvUM2WsbeXqs7a6lmY35Wl8
	6NppCIW0uFZjWI/B+3MvpDtrJuNxw8SGsf0Y6gTtwEZ5VbAJ1WZa7N+HD+S4iBdUu5in
	MCZORUGxiu4WgOvj2A1+LVjm4dVVHSY+yRAvYOVLVzoRIsw9AqItLA+vGYaoRMgtYXey
	DsOA==
X-Received: by 10.14.183.132 with SMTP id q4mr296038eem.91.1391241040540;
	Fri, 31 Jan 2014 23:50:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	k41sm35934489een.19.2014.01.31.23.50.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:50:39 -0800 (PST)
Date: Sat, 1 Feb 2014 08:50:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140201075048.GB3718@jama>
References: <20140128143329.GK3718@jama>
	<1390923283-17138-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1390923283-17138-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] libconnman-qt: fix linking and packaging with Qt4/Embedded
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
X-List-Received-Date: Sat, 01 Feb 2014 07:50:40 -0000
X-Groupsio-MsgNum: 48017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p//XFgTqeVWI1epd"
Content-Disposition: inline

--p//XFgTqeVWI1epd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2014 at 04:34:43PM +0100, Andreas Oberritter wrote:
> * Don't overwrite EXTRA_QMAKEVARS_PRE, because qt4e.bbclass uses
>   it to pass on QT_LIBINFX.
> * Generalize QT_IMPORTS_DIR to make it valid for qte.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe=
/recipes-qt/libconnman-qt/libconnman-qt.inc
> index e4f68db..77e70e8 100644
> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> @@ -12,7 +12,7 @@ S =3D "${WORKDIR}/git"
> =20
>  inherit pkgconfig
> =20
> -EXTRA_QMAKEVARS_PRE =3D "CONFIG+=3Dnotests"
> +EXTRA_QMAKEVARS_PRE +=3D "CONFIG+=3Dnotests"
> =20
>  do_configure_prepend() {
>      # Hack *.pro variables
> @@ -48,6 +48,6 @@ FILES_${PN}-plugin-dbg =3D " \
>      ${PLUGINS_TARGET}/.debug/* \
>  "
> =20
> -QT_IMPORTS_DIR =3D "${libdir}/qt4/imports"
> +QT_IMPORTS_DIR =3D "${libdir}/${QT_DIR_NAME}/imports"
>  # the plugin target needs to be the same as 'target.path' and 'qmldir.pa=
th' in ${S}/plugin/plugin.pro
>  PLUGINS_TARGET =3D "${QT_IMPORTS_DIR}/MeeGo/Connman"

Can qte version install files in sysroot with different names? Currently
they conflict with qt version:

NOTE: recipe libconnman-qt-1.0.46+gitAUTOINC+ddbeaf72b4-r0: task do_populat=
e_sysroot: Started
NOTE: recipe libconnman-qt-1.0.46+gitAUTOINC+ddbeaf72b4-r0: task do_package=
: Started
WARNING: The recipe libconnman-qt is trying to install files into a shared =
area when those files already exist. Those files and their manifest locatio=
n are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libconnman-qt4.so.1.0.46
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libconnman-qt4.so
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libconnman-qt4.so.1
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libconnman-qt4.so.1.0
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libconnman-qt4.prl
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/connman-qt4.pc
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/pkgconfig/connman-qt4.pc
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/networkmanager.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/networktechnology.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/networkservice.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/commondbustypes.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/connmannetworkproxyfactory.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/clockmodel.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/useragent.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/sessionagent.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/networksession.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/connman-qt/counter.h
   Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
Please verify which package should provide the above files.

> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p//XFgTqeVWI1epd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLsp1gACgkQN1Ujt2V2gByOCACeIs6v8LD/+g2v4f466IzQrQIq
3zcAoI0nJ25UUtc3O6l8UgTAL811LULE
=BeDg
-----END PGP SIGNATURE-----

--p//XFgTqeVWI1epd--
