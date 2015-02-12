Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E49F4606E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 18:30:39 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so11968692wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=snHOpVyyx7QfOBDnTX+wkUB5Br/uVg4qkkUM/CCD/Qw=;
	b=wvFICXFeJKiahPkxNeyUywxNtMm5KJAaTzKR3FMmv7JgTgTa2r4qxvt4gUbe8BcUd/
	Bie2J4nL3hDh/dja+Sl8VARS8j0jYd7pPgpCnJl+q4EjHVyDugUk6Hygk8E6DFN7c0dN
	0w0c0CGkclwN5HjOzWj/OZkTQK8vHELw0dOaB51Q8JwDa6kGKS4vCAgzi21ku0Q/olr7
	Bihi9XO0gpYqe0maW5Rr2QcUmRX8vooLLlH68MBNbL37/J79X41SRWCBLH2n8Wru3Apn
	wP2+23ontn2SUSNOuHLRfrNzDeonz3jgJqtY6o5lVI2RNA6hVJqY/aH6drLZypjKJJdU
	XnPQ==
X-Received: by 10.180.74.52 with SMTP id q20mr9751930wiv.0.1423765840400;
	Thu, 12 Feb 2015 10:30:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	di11sm3613730wid.8.2015.02.12.10.30.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 10:30:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 19:30:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212183043.GF2272@jama>
References: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH] mplayer2: Remove blacklist
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
X-List-Received-Date: Thu, 12 Feb 2015 18:30:46 -0000
X-Groupsio-MsgNum: 54213
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2015 at 06:44:07AM -0700, Gary Thomas wrote:
> mplayer2 no longer needs to be blacklisted as OE-core has moved
> to libav_9.16

Please fix following issues before blacklisting it:
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc,
but it isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but
it isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver,
but it isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it
isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19,
but it isn't a build dependency? [build-deps]

> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index 7c04ff1..089aa15 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -13,8 +13,6 @@ RCONFLICTS_${PN} =3D "mplayer"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -PNBLACKLIST[mplayer2] ?=3D "Requires newer libav which has negative D_P"
> -
>  SRC_URI =3D "git://repo.or.cz/mplayer.git \
>      file://0001-configure-don-t-disable-ASS-support-when-explicitly-.pat=
ch \
>  "
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTc8VMACgkQN1Ujt2V2gBzDNACgsJrapWyGFgkbHf2X1APf0Vlh
wmEAn1nkBzAGQKl4V6yMC1xcnYl4vqcy
=KalG
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
