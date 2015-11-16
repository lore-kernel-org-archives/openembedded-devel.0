Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DB03E7702B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 22:23:08 +0000 (UTC)
Received: by wmec201 with SMTP id c201so200105732wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lLUILAXK7PJSDjclC48piNDjY9R2oeUQ1Gj+W2UmHUc=;
	b=kaHpebwtiIj66zlouhyYkyS2lKk+rAvdFda5Fc+W1Z1o8QfQU6k1hsACGSvESAErW6
	9itKPcs4CqDsTYjc+q3B1ER6yNuEdJv3R2Zdqylllgsn91xrkiNdNu3AwLkDDgDr9hp0
	B5tL5L3LuI4gHBf52R9GMxLWlftBs+mhIODmkDiszetYQmMBBfIXxLmmy7MFBMfLJExG
	qV4ZC5M6MLMWrKf9cOujcsUJ43UC/LcMFPq0NvY/wm9vehfXMRpwJNr9vjYlaMMW8uhp
	cOGEKEN2a3WpL8wmAe6SeRZOzTr1iY5Uf8ib4o3pL5U2Er5z9ecx+58NpkOGMakXHTG1
	Dlgw==
X-Received: by 10.28.184.134 with SMTP id i128mr23100452wmf.12.1447712588738; 
	Mon, 16 Nov 2015 14:23:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh4sm36559732wjb.33.2015.11.16.14.23.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 14:23:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 22:23:23 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151116212323.GE2240@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-4-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447271300-4153-4-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 03/17] modemmanager: Add PACKAGECONFIGs
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
X-List-Received-Date: Mon, 16 Nov 2015 22:23:11 -0000
X-Groupsio-MsgNum: 58676
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline

--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 08:48:06PM +0100, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../modemmanager/modemmanager_1.4.12.bb                 | 17 +++++++++++=
+++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.1=
2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> index db7a28d..b1768ca 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  inherit gnomebase gettext systemd
> =20
> -DEPENDS =3D "glib-2.0 libmbim libqmi (>=3D1.12.4) polkit libgudev dbus-g=
lib"
> +DEPENDS =3D "glib-2.0 libgudev dbus-glib"=20
> =20
>  SRC_URI =3D "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"
>  SRC_URI[md5sum] =3D "66cc7266b15525cb366253e6639fc564"
> @@ -17,6 +17,21 @@ SRC_URI[sha256sum] =3D "7ef5035375a953b285a742591df0a6=
5fd442f4641ce4d8f4392a41d6d6
> =20
>  S =3D "${WORKDIR}/ModemManager-${PV}"
> =20
> +# If you need a different configuration for modemmanager, add a statement
> +# similar to the following example to your local.conf or distro config
> +# PACKAGECONFIG_remove_pn-modemmanager =3D "polkit"
> +PACKAGECONFIG ??=3D "mbim qmi polkit"
> +
> +EXTRA_OECONF =3D " \
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsyst=
emunitdir=3D${systemd_unitdir}/system/', '', d)} \
> +"

I've changed this to PACKAGECONFIG when cherry-picking to master-next

> +PACKAGECONFIG[polkit] =3D "--with-polkit=3Dyes,--with-polkit=3Dno,polkit"
> +# Support WWAN modems and devices which speak the Mobile Interface Broad=
band Model (MBIM) protocol.
> +PACKAGECONFIG[mbim] =3D "--with-mbim,--enable-mbim=3Dno,libmbim,libmbim"
> +# Support WWAN modems and devices which speak the Qualcomm MSM Interface=
 (QMI) protocol.
> +PACKAGECONFIG[qmi] =3D "--with-qmi,--without-qmi,libqmi (>=3D1.12.4),lib=
qmi (>=3D1.12.4)"
> +
> +
>  FILES_${PN} +=3D " \
>      ${datadir}/icons \
>      ${datadir}/polkit-1 \
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKSUoACgkQN1Ujt2V2gBxipwCfZgepKTS3iCsf9ZeVlRDIlbT9
84wAn0Zlu83ROQtPXQpitaqycZ7q01a+
=E75y
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
