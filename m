Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 08842607FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:19:33 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2820789eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oDI2EMRbRuJCXV2I9yJeZUrvSKYkuVObXwXt3HxVJoI=;
	b=WXN5Bb0kzye/Lr76J5AJblUKr6p50nhSsGKMnenV1x7L/TXrnh7DQQRPxHqIslwWKk
	+3ZgoyXC1mjmQVnqaXl2CFu/1DI9IfykjRsXDAMB8uN9gfQko0VUZoTxR++N26TGx4fs
	avDinTstYdO1RpiLN6Yd66pY8ipIoEcIztb5ysc3BsW/Wad+xBv7Alr5ZaUNrmRwcXtx
	ZBrP8JA76rVYZwK68wvpMTGqSZiaJA89YIlRZCIqInzdISJO7Getapj+Ryf25EpvhFHr
	w5Li9gV+71oB4T4c1vHEzedIOXxQSWSFSIEDgu5FuSN1ctausRMTAaGNnrLqWdoiDUeh
	XLLg==
X-Received: by 10.14.198.197 with SMTP id v45mr37573788een.9.1397985574535;
	Sun, 20 Apr 2014 02:19:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm92949237eeq.33.2014.04.20.02.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:19:33 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:19:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091938.GB2486@jama>
References: <1397484867-4582-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
In-Reply-To: <1397484867-4582-1-git-send-email-ferlandm@sonatest.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCHv2] autobahn: fix 'Missing sha256 SRC_URI checksum'
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
X-List-Received-Date: Sun, 20 Apr 2014 09:19:34 -0000
X-Groupsio-MsgNum: 49309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vgqGEEhIUeLzQgKp"
Content-Disposition: inline

--vgqGEEhIUeLzQgKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 10:14:27AM -0400, Marc Ferland wrote:
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>

Merged thanks

> ---
>  meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/m=
eta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> index a1e8c5f..ac775c4 100644
> --- a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> +++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D " file://autobahn/__init__.py;beginl=
ine=3D1;endline=3D17;md5=3D1fde
> =20
>  SRC_URI =3D "https://pypi.python.org/packages/source/a/autobahn/autobahn=
-${PV}.zip"
>  SRC_URI[md5sum] =3D "160429e7fb043940e79aa7f4ebbab57a"
> +SRC_URI[sha256sum] =3D "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b=
26d6014bb9e6373e"
> =20
>  S =3D "${WORKDIR}/autobahn-${PV}"
> =20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vgqGEEhIUeLzQgKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkSoACgkQN1Ujt2V2gBz/UgCeI8YBhD1kr5fCTqqaWuROGBq7
8IsAnijW8ZXkRkrjKNCiSZ/EqIMo1CZi
=f/9J
-----END PGP SIGNATURE-----

--vgqGEEhIUeLzQgKp--
