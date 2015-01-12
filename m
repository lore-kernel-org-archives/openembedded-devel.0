Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65F487162E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 14:41:07 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so14983766wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dvdyRSCJyzT7NXISwTaly6hI8q2evNYu27Ax6s35cXc=;
	b=HIGSGwxI46BCGriyaBw6FZkXpJU/gqA32MCTmDGkSs0Q9S/JCTk9uwcP414IcCE34q
	1UYOsuIvUZ+2ad8fWYX/9GWTAR20QPWW8j84ocADj+Twd+RbIlNPzLVIJjoQRijgbwBK
	J9MgvBBz8r4RayXz6IQhzc+mKMkZJBHSYjZWi3YVe5gttAjb9F5bk8z7PL1h8jechbZr
	CDdsPupxXf4jTh9xLNW5wn4FwKkutdZSkKTxtsytnVfiBUVuqab07NHIWHEePqv27wRV
	+nAYoMp9chSadaF5NdNfqOXUw5mhYoC3xHBIYWE6K0reuxHGpI/+UANjTIFg4pqW4h2X
	kdbQ==
X-Received: by 10.194.87.100 with SMTP id w4mr60411564wjz.65.1421073667968;
	Mon, 12 Jan 2015 06:41:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm10484269wib.1.2015.01.12.06.41.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jan 2015 06:41:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Jan 2015 15:41:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150112144108.GD2513@jama>
References: <1421065348-28990-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421065348-28990-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v3] libssh: depends fix
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
X-List-Received-Date: Mon, 12 Jan 2015 14:41:11 -0000
X-Groupsio-MsgNum: 53811
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline

--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2015 at 04:22:28AM -0800, Armin Kuster wrote:
> the default was to build with GSSAPI enabled.
>=20
> V3:
> remove rdepends
>=20
> V2:
> add PACKAGEGROUP to define enable/disable GSSAPI with
> proper depends of krb5

Dropped these extra comments when cherry-picking to master-next (they belon=
g under --- so they aren't part
of commit message).

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/libssh/libssh_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recip=
es-support/libssh/libssh_git.bb
> index d21bdc3..47fb39a 100644
> --- a/meta-oe/recipes-support/libssh/libssh_git.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_git.bb
> @@ -20,6 +20,9 @@ EXTRA_OECMAKE =3D " \
>      -DWITH_ZLIB=3D1 \
>      "
> =20
> +PACKAGECONFIG ??=3D""
> +PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, krb5, "
> +
>  inherit cmake
> =20
>  do_configure_prepend () {
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

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSz3QQACgkQN1Ujt2V2gBya1ACgngE5u44C4+yHziXIAwBkiuBT
xM0AoJ2Yu7tmISDd7kbGKBin7e2OnbTN
=p//E
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
