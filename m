Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id E037A60144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:35:40 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so702332lbd.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kOS/7IG0rHBYmf0XCRMcxw/fj1+y8wcNCMXA6gHhrq0=;
	b=Rx2yfxpGVeXU89cLoAI4S9JYYMlbQVXsCZE74+nECiRDvcUZuXqsNHvbw1z4Od0N0b
	YgXi1lnmhZw0NL2twUryw7efIOICaUZdreZweGSQf/065XJjkkpy4IFcmhTvj/y3IU3t
	Cct9OFAuLYLwkvHRa37nbvLE5guBrjFyfn+4RsTenVxxozB+0XVsBDLIJg+ydblj6qtL
	l3zd5+wNuPi7vRhs8oaH2Foux2GvRCEEYz0iEWb1p9GIJcKOB1gyRZLwZQoT4qBOBXDW
	iqgx6siUMHq2YzQ4PcJ5OYQ85DWJ+QfwTFOX034/FWPa5e2uKf2HbxicsOH1MHkvvR9b
	W/rg==
X-Received: by 10.152.236.43 with SMTP id ur11mr3342501lac.74.1408005340181;
	Thu, 14 Aug 2014 01:35:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ue8sm2710512lac.31.2014.08.14.01.35.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 01:35:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 10:36:16 +0200
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140814083615.GC14848@jama>
References: <1408002845-30625-1-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1408002845-30625-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] rabbitmq-c: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 08:35:44 -0000
X-Groupsio-MsgNum: 51673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnqofTe3AZPmi90i"
Content-Disposition: inline

--RnqofTe3AZPmi90i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 09:54:05AM +0200, Maciej Borzecki wrote:
> rabbitmq-c is a C library providing an implementation of AMQP client for
> use with v2.0+ of the RabbitMQ broker
>=20
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.=
5.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb =
b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> new file mode 100644
> index 0000000..5a02c99
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "A C-language AMQP client library for use with v2.0+ of =
the RabbitMQ broker"

I did few more modifications when cherry-picking to master-next.

> +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd=
5c980b583f53"

Dropped ${S} as LIC_FILES_CHKSUM are by default relative to ${S}

> +LICENSE =3D "MIT"
> +


> +SRC_URI =3D "https://github.com/alanxz/rabbitmq-c/releases/download/v${P=
V}/rabbitmq-c-${PV}.tar.gz"

rabbitmq-c -> ${BPN}
rabbitmq-c-${PV} -> ${BP}

> +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8deb6"
> +SRC_URI[sha256sum] =3D "53702ea2ab809af0f923e387458e2cad191d9549f5041003=
5fe82ce5e6ccc4fa"
> +
> +DEPENDS =3D "popt openssl"
> +
> +EXTRA_OECONF =3D "--disable-examples --enable-tools --disable-docs"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGE_BEFORE_PN +=3D "${PN}-tools"
> +FILES_${PN}-tools =3D "${bindir}"
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnqofTe3AZPmi90i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPsdP8ACgkQN1Ujt2V2gBwXRgCgtDHXfuOJcSVtjFGXPsPdGzag
3i8An3JluwoE1iFPze02mL+/QYPpH7ty
=an8e
-----END PGP SIGNATURE-----

--RnqofTe3AZPmi90i--
