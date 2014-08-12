Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 31FDB609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:45:01 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so5632732wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3f7+9iEkAJbpQhjF/dNP3H7WBrDUMLqFQCRghpJXn64=;
	b=s9Cp84NvUk2xD9JF3mJnYd+kvhUG/HDi+g8GPa2ongKdXQvPJxxxeSkyIQBQOFVk7l
	MdN/tp7GjHdND3Rb3G3c50uqkOdQz1WMiet5wUlGW/IrBfXk24ka1bn2N8Bj8Gmzi7Rj
	rjks5dvfBQqr3c6AuAb5FPxkt9R3JNpo2bWoK7DdbMXLxhhh2alDlc3B428H/rBJN7Wb
	y3tELF7T95iNS5zGntWwA0ZOsT70yOUJvF5Dw+qB7dV/wO/9rfZiH40zJx6Y2n+fUfD+
	EUxi4OSa8PK0Amix9db3AhyTgcrbRQfN/U/eObkfSWi1u3INo1aXObh7ToMKOx8kMDHg
	/ePg==
X-Received: by 10.194.219.193 with SMTP id pq1mr4709029wjc.5.1407843902839;
	Tue, 12 Aug 2014 04:45:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc3sm55365324wib.9.2014.08.12.04.45.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:45:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:45:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812114538.GJ14848@jama>
References: <1407767636-32624-1-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1407767636-32624-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH] rabbitmq-c: add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 11:45:09 -0000
X-Groupsio-MsgNum: 51616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YBZtlKTDrhBF+VTv"
Content-Disposition: inline

--YBZtlKTDrhBF+VTv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 04:33:56PM +0200, Maciej Borzecki wrote:
> rabbitmq-c is a C library providing an implementation of AMQP client for
> use with v2.0+ of the RabbitMQ broker
>=20
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  .../rabbitmq-c/rabbitmq-c_0.5.0.bb                 | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.=
5.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb =
b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> new file mode 100644
> index 0000000..d8e3189
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A C-language AMQP client library for use with v2.0+ of =
the RabbitMQ broker"
> +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd=
5c980b583f53"
> +LICENSE =3D "MIT"
> +
> +SRC_URI =3D "https://github.com/alanxz/rabbitmq-c/releases/download/v${P=
V}/rabbitmq-c-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8deb6"
> +SRC_URI[sha256sum] =3D "53702ea2ab809af0f923e387458e2cad191d9549f5041003=
5fe82ce5e6ccc4fa"
> +
> +PR =3D "r0"

^ dropped when cherry-picking to master-next

> +
> +S =3D "${WORKDIR}/rabbitmq-c-${PV}"

^ dropped when cherry-picking to master-next

> +
> +EXTRA_OECONF =3D "--disable-examples --enable-tools"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-tools ${PN}"

Why are you dropping -doc, -staticdev, -locale and other default
packages?

PACKAGE_BEFORE_PN +=3D "${PN}-tools"

should be enough, will do in master-next, but please ack

> +
> +DEPENDS =3D "popt openssl"
> +
> +FILES_${PN}-tools =3D "${bindir}"
> \ No newline at end of file
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YBZtlKTDrhBF+VTv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp/mIACgkQN1Ujt2V2gBxwFQCgkdsNwXodu1i+pbe+VXPwQLbi
1wwAoJpW2bxR1OMbFx9H8l4aBVINZB8s
=322J
-----END PGP SIGNATURE-----

--YBZtlKTDrhBF+VTv--
