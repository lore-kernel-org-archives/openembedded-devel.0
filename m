Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShzH4-0001vA-Ax
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 10:31:26 +0200
Received: by wibhn14 with SMTP id hn14so463146wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 01:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4uh98Y0N1UTKhdIvihsXTSeyT3tWL6DA0dEof5VWjJA=;
	b=clftgUXNX3yF7w0vZqdx/eGOPwDP3lQ6ndj3G5l809WVAvNvPAy+gX0sSI0JKHQqYo
	yVVAGRFTnpm/ZKcg3PYGKyhJ7QmWKJC/DVGGBOKUkpr1kr5xmmUgYHSk0jH0fs8WJLAP
	ccsavM+0xmtHa+n5FbAWcaEqfMDjWoQ12BbTJx+CEyudk/+9bh/yBnd7CRCwERI+1WG/
	MQXHxoBJwpo5Lj5tYe0hK+HawoqTyvJRsVIcZgKGuPgmMdRLq5sFQXAqiy9LGqcyNr4U
	lNNgUsydOhqfu4aS83RF+0iluBv1GSzJxzb2ge5tulTd5BF0DeoVpUXMoRr8UHZpgqMA
	97bg==
Received: by 10.180.99.195 with SMTP id es3mr2779481wib.12.1340353239437;
	Fri, 22 Jun 2012 01:20:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm3872383wib.0.2012.06.22.01.20.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 01:20:38 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:20:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120622082038.GM9352@jama.jama.net>
References: <1340352411-20305-1-git-send-email-gizero@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1340352411-20305-1-git-send-email-gizero@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libmodbus: update to 3.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 08:31:26 -0000
X-Groupsio-MsgNum: 39353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xtx0sNU5lZ46KfgK"
Content-Disposition: inline

--xtx0sNU5lZ46KfgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 10:06:51AM +0200, Andrea Galbusera wrote:
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   16 --------------=
--
>  .../recipes-extended/libmodbus/libmodbus_3.0.3.bb  |   16 ++++++++++++++=
++
>  2 files changed, 16 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb

Please use -M when sending patches like this, so it's easier for review.

Also when you're at it, you can simplify URL like this:
s%libmodbus/libmodbus-${PV}%${BPN}/${BP}%

Cheers,

>=20
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> deleted file mode 100644
> index 03b7fcc..0000000
> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "A Modbus library"
> -DESCRIPTION =3D "libmodbus is a C library designed to provide a fast and=
 robust \
> -implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeB=
SD, \
> -QNX and Windows."
> -HOMEPAGE =3D "http://www.libmodbus.org/"
> -SECTION =3D "libs"
> -
> -LICENSE =3D "LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
> -
> -SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-${=
PV}.tar.gz"
> -
> -inherit autotools pkgconfig
> -
> -SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
> -SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e1220=
4229361c029f2615"
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
> new file mode 100644
> index 0000000..e6dde2c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A Modbus library"
> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast and=
 robust \
> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeB=
SD, \
> +QNX and Windows."
> +HOMEPAGE =3D "http://www.libmodbus.org/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +
> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-${=
PV}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] =3D "b5042d833c6c132e6fb2551af133a342"
> +SRC_URI[sha256sum] =3D "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec953=
db5bb91158ab8677"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xtx0sNU5lZ46KfgK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/kKtYACgkQN1Ujt2V2gBxIGgCgsbLlkh9NzBKk+RbRDtW6myQy
nb0AoKDPQANonWNLqfTXnxalUAf1vBAU
=nxIk
-----END PGP SIGNATURE-----

--xtx0sNU5lZ46KfgK--
