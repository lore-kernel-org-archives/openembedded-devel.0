Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4CD609BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:20:08 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so1010803lab.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=BpsLaoYGuT75gQtoHWrILjKy5UvhTD7JLC0xZv6MO+Y=;
	b=mD5YH9L9xVZs7Upx5P/mxAs2WgDveFkC1Ud4Zp4XxykAe+9fXE2NC66P9ovHBxZMlz
	HWC7eKgAGcAZ02rZsNqvBdO7nFs40wPCURc8Z8Ov6bC2VuoDu74icXswiqkZc1wrfF+4
	5eMaE47jT4RKze3qO4fQ8mQ0BNkHs0dUFzoXbmY+YuhXNTUAimWN8yew4oNWa/uUQpa9
	QM48YBDl12RUOXrVQQkeMrgY/NNndZKY4DvkGSl3SdOoFt7whiZAhijb3zVDay8J6RV6
	qOJaZIAtgVU5DYICK8PJ4WACbERqN6IXwKhnuiAHvdc+pqpy9Zm0eKD95pVpHFnuvJJM
	+QnQ==
X-Received: by 10.152.29.230 with SMTP id n6mr5151528lah.29.1408022407111;
	Thu, 14 Aug 2014 06:20:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g5sm3106911lae.29.2014.08.14.06.20.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 06:20:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 15:20:43 +0200
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140814132043.GJ14848@jama>
MIME-Version: 1.0
In-Reply-To: <1408007481-8390-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] rabbitmq-c: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 13:20:12 -0000
X-Groupsio-MsgNum: 51692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VzV6c7pmyfq9zC4X"
Content-Disposition: inline

--VzV6c7pmyfq9zC4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 11:11:21AM +0200, Maciej Borzecki wrote:
> rabbitmq-c is a C library providing an implementation of AMQP client for
> use with v2.0+ of the RabbitMQ broker
>=20
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>

Thank you!

There is one more issue which needs to be fixed before this is merged.

collectd is probably autodetecting rabbitmq-c and fails when detected.

Would you please add PACKAGECONFIG in collectd to disable it by default?
CCing few people who recently touched collectd, maybe someone will
choose to upgrade it instead.

|
/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/co=
llectd/5.2.2-r0/collectd-5.2.2/src/amqp.c:417:5:
error: 'amqp_set_sockfd' is deprecated (declared at
/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/amq=
p.h:1030)
[-Werror=3Ddeprecated-declarations]
|      amqp_set_sockfd (conf->connection, sockfd);
|      ^


> ---
>=20
> Notes:
>     Disabled documentation, incorporated fixes from Martin Jansa
>=20
>  .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.=
5.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb =
b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> new file mode 100644
> index 0000000..23b5013
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "A C-language AMQP client library for use with v2.0+ of =
the RabbitMQ broker"
> +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980=
b583f53"
> +LICENSE =3D "MIT"
> +
> +SRC_URI =3D "https://github.com/alanxz/${BPN}/releases/download/v${PV}/$=
{BP}.tar.gz"
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
> \ No newline at end of file
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VzV6c7pmyfq9zC4X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPst6sACgkQN1Ujt2V2gBzh4wCeNZhaaa5MqNmsWrzXQZ2u0H5/
TKkAn1tJECX8+iX3PRKsNluApDSQk4Ci
=LU/X
-----END PGP SIGNATURE-----

--VzV6c7pmyfq9zC4X--
