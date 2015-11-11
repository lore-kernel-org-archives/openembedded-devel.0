Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB88771A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:56:30 +0000 (UTC)
Received: by wmec201 with SMTP id c201so61988306wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wqlPJy1ElzWwfig/ZqHIpYYtVVTIBdN06y2s6G8X1XU=;
	b=VrhJ/4qwles5vSSydt1FFokzhVtjWfvK9nIc/5B2xD4LP6b4faYrcLGY9b4DLt8c7N
	gHf97i5UTDw5GM7lszjo6SgmWGYpDfRyZHyGp+Rlp47f9MZexPE/cahsIl8wkWO8cN1/
	/ol2Mds9eQt1Ly9t3VUcoOzirnLOiI58DsFjd1Ujah5nr/NaEsR/udC43ehawADYJUfq
	1O64Ee/KULe5n2xTyrXcgzai6fRhRHfBE0A3cpunNYhNeYeVNdJDKfHrG0oiWChLWsQA
	DtUqp4NTAnEZUAeY2gJY830QhptKWOigj4YvYed5+eZ7U92PoaZmtxPl3Nff3noskPci
	/UHg==
X-Received: by 10.28.14.140 with SMTP id 134mr12380457wmo.44.1447271790364;
	Wed, 11 Nov 2015 11:56:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pn6sm6433510wjb.15.2015.11.11.11.56.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:56:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Nov 2015 20:56:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151111195640.GB2564@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-16-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447271300-4153-16-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 15/17] networkmanager: package for adsl plugin
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
X-List-Received-Date: Wed, 11 Nov 2015 19:56:32 -0000
X-Groupsio-MsgNum: 58521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 08:48:18PM +0100, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8 ++=
+++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
6.bb
> index 326ac31..02fe500 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -74,12 +74,18 @@ PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable=
-wifi=3Dno,wireless-tools,wpa-sup
>  PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[netconfig] =3D "--with-netconfig=3Dyes,--with-netconfig=3D=
no"
> =20
> -PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion ${PN}-nmtui ${PN}-nmtui-doc"
> +PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion \
> +  ${PN}-nmtui ${PN}-nmtui-doc \
> +  ${PN}-adsl ${PN}-adsl-staticdev \
> +"
> =20
>  FILES_libnmutil +=3D "${libdir}/libnm-util.so.*"
>  FILES_libnmglib +=3D "${libdir}/libnm-glib.so.*"
>  FILES_libnmglib-vpn +=3D "${libdir}/libnm-glib-vpn.so.*"
> =20
> +FILES_${PN}-adsl =3D "${libdir}/NetworkManager/libnm-device-plugin-adsl.=
so"
> +FILES_${PN}-adsl-staticdev =3D "${libdir}/NetworkManager/libnm-device-pl=
ugin-adsl.la"

Thanks, you don't need separate networkmanager-adsl-staticdev,
libnm-device-plugin-adsl.la should be included in normal PN-dev.

> +
>  FILES_${PN} +=3D " \
>      ${libexecdir} \
>      ${libdir}/pppd/*/nm-pppd-plugin.so \
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

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZDnXcACgkQN1Ujt2V2gBwJ4wCgulik4PshCr70EFZqza8Kp/Ps
ja0AoJlYJFTN4Nh5qqbNO8i+FpCSy0+C
=/cxa
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
