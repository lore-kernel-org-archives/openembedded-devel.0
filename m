Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 65B827072B;
	Sun, 20 Jul 2014 14:31:32 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so3093900wiw.3
	for <multiple recipients>; Sun, 20 Jul 2014 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TmF98NYLpEPamFAYr8YxNXHAGDa1kZOWutn565MqiEo=;
	b=ASpymj5lXAD5dDc5Mjm3HXx1TMsZ7iLp8hUhVs70164bveV1ktGX5oQ1okReTn/Ae5
	Hp8jWOA/2780ZYj7aRyfpIiY2UpIFp5/eLsAHqPI14nUGkGMDEl0jZ+0j5dsup7O3Xho
	qz12NbHQP0NWKW/RY19m2C5NUiiSR3h4MlaQ/1asIlBiPGlsH+a2/KmOlr9ytzghN+DY
	cyZPBNm//qO9D9lcdZyBCFJFv4M2B313BV3q/70Y/VpJWCcGCaJ1oT79udRRRoWklrTF
	KM7BZU9reU7IXYXioaOYCsRph6FnsDg99ZAPAbfqKdDW4JMUWKUerI6GiVSjYPdug0ES
	AHuA==
X-Received: by 10.195.17.164 with SMTP id gf4mr13691544wjd.45.1405866693693;
	Sun, 20 Jul 2014 07:31:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bp9sm30667082wib.7.2014.07.20.07.31.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 07:31:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 16:31:47 +0200
To: openembedded-devel@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140720143147.GA22875@jama>
References: <20140621172446.016A05044A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140621172446.016A05044A@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : mkvtoolnix: fix build with B!=S
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
X-List-Received-Date: Sun, 20 Jul 2014 14:31:37 -0000
X-Groupsio-MsgNum: 51117
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2014 at 05:24:46PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: e510f7547d583e8a93b5aaf786cbbd2ee5bacfdf
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3De510f7547d583e8a93b5aaf786cbbd2ee5bacfdf
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Jun 21 11:05:58 2014 +0200
>=20
> mkvtoolnix: fix build with B!=3DS

This is only part of the fix

now it was failing with:
| checking for libEBML headers version >=3D 1.3.0... internal
| *** The internal version of the libEBML library is supposed to be used,
| *** but it was not found in "lib/libebml". If this is a clone from the
| *** git repository then submodules have to be initialized with the
| *** following two commands:
| ***
| *** git submodule init
| *** git submodule update
| Configure failed. The contents of all config.log files follows to aid deb=
ugging

because it was trying to use internal libebml missing in ${B}

I'll upgrade libebml recipe to required 1.3.0 (from 1.2.2).

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b=
/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
> index 3b8eb32..abb0e95 100644
> --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
> +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
> @@ -26,7 +26,7 @@ EXTRA_OECONF =3D " --with-boost-libdir=3D${STAGING_LIBD=
IR} \
> =20
>  # remove some hardcoded searchpaths
>  do_configure_prepend() {
> -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/inclu=
de:${STAGING_INCDIR}:g ac/ebml.m4
> +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/inclu=
de:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
>  }
> =20
>  # Yeah, no makefile
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPL0tMACgkQN1Ujt2V2gBw6swCcDoXWeToKcvlqnTiikNoWrueD
47cAoIZoqTeRrFVUaapvQZ8SArUtds93
=Btq/
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
