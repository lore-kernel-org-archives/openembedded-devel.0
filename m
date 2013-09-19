Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id BAC076158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:33 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so4124500eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jrpncqfBYUMakp7UUjXWjmq/jwl5e5W6lKEDExWG4w0=;
	b=knDdHivIHYY4gMqGXt5Gi5+dCmGw4JK8qpgn5k46M/cw9CPGqpCpAE5e2I/N7Zi4Pn
	9AXzTU4/BQhc/w7aMW7+XUCYfMYNxFIgXHhbU5kvAW6SQIZL/38x0ZbX/t2mNtw6WGAG
	zb0k9RG5ic9edZtcO/G62bLmzfPjkDTNt4wKfwZird9OW/CPD0XDsvvdsEP0IyUrihz/
	J4W3ZA9U1Kz7iq+4lgRaboWBweZEvq/uolMdwOfsnJGQrQW4w7qsL0LHM/mBY0zLzBh5
	rmJ4nTQ9++6EFQVaAtAfEN0A31Mi+W1C0oa+y6swIGxF6MOn+BLNnuLih+YREUWkSiva
	czoQ==
X-Received: by 10.15.10.5 with SMTP id f5mr1786970eet.87.1379592575221;
	Thu, 19 Sep 2013 05:09:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm10829488eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:09:34 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:11:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919121112.GD18414@jama>
References: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCHv5] libsoc: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2013 12:09:34 -0000
X-Groupsio-MsgNum: 46249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline

--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 11:15:32PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>=20
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ---
>  v4 -> v5
>  - Moved RDEPENDS to below do_install
>=20
>  v3 -> v4
>  - Added libgcc in RDEPENDS
>=20
>  v2 -> v3
>  - Removed DEPENDS on libgcc
>  - Removed autogen.sh pre-configure as was unneeded
>=20
>  v1 -> v2
>  -added signed-off-by

Merged, thanks

>=20
>  meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>=20
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb b/meta-oe/recip=
es-support/libsoc/libsoc_0.3.bb
> new file mode 100644
> index 0000000..1bf2782
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "libsoc is a C library for interfacing with common SoC perip=
herals through generic kernel interfaces"
> +HOMEPAGE =3D "https://github.com/jackmitch/libsoc"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De0bfebea12a718922225ba987b212=
6a5"
> +
> +inherit autotools
> +
> +SRCREV =3D "0764ee52b590d5ccb4bd4698f0011496b536ed70"
> +SRC_URI =3D "git://github.com/jackmitch/libsoc.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} =3D "libgcc"
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66eAACgkQN1Ujt2V2gByZTwCguTeOoDC8DO1gX2dGmkPJp5Ke
fekAn3PUBHq8x7VBruFkZxaGGEj6ZaW0
=dJVs
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
