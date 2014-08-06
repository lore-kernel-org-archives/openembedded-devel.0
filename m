Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BD41D70998
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 10:23:32 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so8601031wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TGP3l8hxrn7FatFpNTXls4d+R4mrTGu3uHKiyxW2EYo=;
	b=oIarHK6H359S0SnCSsiWATnMIL9L/yvWF5ym7rhRn87mLwdU6eE7skZvXCo/3TZXg6
	OjELVBFsclyJXyOYOdoNu53hVjh8PPqMVPOgQgmFOATuiFiNuUcVQY6HJw+ujFeqMrZ5
	27DZp1FS1JuJDhO60RyaFvuX92vOxetqGGJ30eyF4X5R8Xu/yZ3XIFCXOFIz2dtTgGXD
	D8+xHpEpziTYg6G1Lx+0+ZkTCYA1KI3WgQDMa3xH3Nk+TzRNXUmnhsjxb/KwPhkCOISP
	KKe1OfYSA6cD3ch1Fg5rfRV5eunh5fx7XID/WwSmGIuTcFVJ8KdRWH3RB6nKJ4Ggt4S8
	3EJQ==
X-Received: by 10.180.75.49 with SMTP id z17mr14630208wiv.80.1407320613338;
	Wed, 06 Aug 2014 03:23:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	es9sm1436639wjd.1.2014.08.06.03.23.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 03:23:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 12:24:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806102402.GF14848@jama>
References: <1404822759-25699-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1404822759-25699-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-browser][PATCH] firefox: workaround for freetype-config breakage
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
X-List-Received-Date: Wed, 06 Aug 2014 10:23:34 -0000
X-Groupsio-MsgNum: 51439
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ULyIDA2m8JTe+TiX"
Content-Disposition: inline

--ULyIDA2m8JTe+TiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 02:32:39PM +0200, Koen Kooi wrote:
> All binconfig scripts in OE-core have been disabled, leading to -I/usr/in=
clude/freetype2 disappearing from C(PP)FLAGS. Add it in manually as a worka=
round, mozilla autotools are a maze and not easily fixed.

I've merged this one.

Thanks

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  recipes-mozilla/firefox/firefox_10.0.11esr.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozi=
lla/firefox/firefox_10.0.11esr.bb
> index 1a1178c..98da1a4 100644
> --- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
> +++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
> @@ -85,6 +85,7 @@ inherit mozilla
>  EXTRA_OEMAKE =3D "installdir=3D${libdir}/${PN}"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> +TARGET_CC_ARCH +=3D " -I${STAGING_INCDIR}/freetype2"
> =20
>  do_install() {
>  	oe_runmake DESTDIR=3D"${D}" destdir=3D"${D}" install
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ULyIDA2m8JTe+TiX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPiAkIACgkQN1Ujt2V2gBxPUwCZAT4Jc1ZklKxPMzaIFyqzJCSq
XWUAn2Jt4DstiJ/uXTPzZ/yLN7jDLWR+
=svXF
-----END PGP SIGNATURE-----

--ULyIDA2m8JTe+TiX--
