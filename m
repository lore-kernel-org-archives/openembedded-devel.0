Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99C605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:54:25 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so1819151lbd.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DAwKY+qrBnHv9iyU1gThB6Qs/Fk/75bOpZJpSWXZmOY=;
	b=OwV8++C0rs6emibFOShxzLLNCfiGdnWUDHAKXkL5pkBhL3hMdfVHVJdknfhLSAV99v
	KwKr0HbVRaZ3LTXJ8+leD27QMX7Agtb3xIY6tt8B1z6stwUaXs/iSgqiIia/sah86dNA
	70DYB1rMMm6gEKQC9WHHNtOamAwir8xEIX8tah141fR/I4BL+V7cdfLGOATd2500C/h2
	Zf2cOMoy6LuW+tmPyxeJxNR4twhOrNjj5s9nYsiFkY5BVcEA3ADF7x2cIHnJV4qiCA1Y
	xcDwBmHt9R74Yixl9CkHYA6DSnoEOO12O2m0XWXTalFxDmwznQ2w/kMSZnaP1Gr+S+dZ
	3Fjg==
X-Received: by 10.112.17.41 with SMTP id l9mr2676905lbd.65.1399481665711;
	Wed, 07 May 2014 09:54:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lq20sm3352606lbb.24.2014.05.07.09.54.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:54:24 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 18:54:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140507165446.GG30955@jama>
References: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] xdelta3: add optional lzma support
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
X-List-Received-Date: Wed, 07 May 2014 16:54:26 -0000
X-Groupsio-MsgNum: 49773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 01:43:27PM +0200, Matthieu Crapet wrote:
> Using PACKAGECONFIG. Disabled by default.

It's not disabled by default, it's autodetected by default and that's
not acceptable.

> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/re=
cipes-support/xdelta/xdelta3_3.0.8.bb
> index 16a72ee..f3b4754 100644
> --- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
> +++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
> @@ -13,3 +13,7 @@ SRC_URI[md5sum] =3D "c3ae3286ce4193de8e03d5bcaccf3bc3"
>  SRC_URI[sha256sum] =3D "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff759=
31a7fa78ed3d2e55"
> =20
>  inherit autotools
> +
> +# Optional secondary compression
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[lzma] =3D ",,xz"
> --=20
> 1.8.5.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqZVYACgkQN1Ujt2V2gBzlHwCfXzBqWxl0QRd19kr7AVXK84eN
Rx4An1trvalbDNSTVr0r6ZC1u0HBwSUQ
=9Oqm
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
