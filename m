Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQX2Z-0006cO-CK
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 06:56:19 +0200
Received: by wgbdq10 with SMTP id dq10so2983072wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 21:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tO1x2JJKgDppiNq8AOs6tAErGVmj0SfBcSUjsLx+kP0=;
	b=UVc1anzmnNDtCECTOF6BOf4c8p4TyIYAPdAlafnYGe4KfxwFlyrOE/SE85PRvts8c1
	0YJi0KLa1LV9o+ec3EtisG6TjUoD/Dg2w2XcSyPMdhX0F4iuHkVcvS3PhOGZUuSSkuX0
	BwO+p9d5DAiTRU8ulaWeIjUff6qEA/PJJPyYn6uVuQPS8QlxWqaQyf518lvRbs864/RG
	f+W7JWaHG8nPr8HH55ODNznX2lqTgl7ZAbb+CVJi6j8BWoRXMk2L6ZWwJraxPf4Y7DX8
	isqIDQTPC9EOc2tKPM36kSAL9JRiVqdQ9C8M4u77BCyPa/HZAWCZ5c7aBkJgi02OU6Pn
	mQ+g==
Received: by 10.216.134.41 with SMTP id r41mr5469681wei.13.1336193191774;
	Fri, 04 May 2012 21:46:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm4215302wib.9.2012.05.04.21.46.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 21:46:29 -0700 (PDT)
Date: Sat, 5 May 2012 06:46:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120505044633.GG3163@jama.jama.net>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1336166708-14019-1-git-send-email-gizero@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Sat, 05 May 2012 04:56:19 -0000
X-Groupsio-MsgNum: 38578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline

--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 11:25:08PM +0200, Andrea Galbusera wrote:
> * based on recipe by Radoslav Kolev which was in classic
> * updated to latest released version 3.0.2
> * also provide an _git version with up-to-date SRCREV and
> DEFAULT_PREFERENCE =3D "-1"
> * common part factorized as libmodbus.inc
>=20
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  meta-oe/recipes-extended/libmodbus/libmodbus.inc   |   13 +++++++++++++
>  .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |    8 ++++++++
>  .../recipes-extended/libmodbus/libmodbus_git.bb    |   13 +++++++++++++
>  3 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>  create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
>=20
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/r=
ecipes-extended/libmodbus/libmodbus.inc
> new file mode 100644
> index 0000000..8e0e011
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "A Modbus library"
> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast and=
 robust \
> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeB=
SD, \
> +QNX and Windows."
> +HOMEPAGE =3D "http://www.libmodbus.org/"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"

you can drop this field too.

> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +
> +INC_PR =3D "r0"
> +
> +inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> new file mode 100644
> index 0000000..7a99f72
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> @@ -0,0 +1,8 @@
> +require libmodbus.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-${=
PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
> +SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e1220=
4229361c029f2615"
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb b/meta-o=
e/recipes-extended/libmodbus/libmodbus_git.bb
> new file mode 100644
> index 0000000..793a9d6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
> @@ -0,0 +1,13 @@
> +require libmodbus.inc
> +
> +SRCREV =3D "23dd803f3f2b7be668408fa938e8d665249b4fba"
> +
> +PV =3D "3.0.2+gitr${SRCPV}"
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoco=
l=3Dgit"
> +S =3D "${WORKDIR}/git"
> +
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

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+ksKkACgkQN1Ujt2V2gBwPwgCfe/k7tAmTLdWM33wXk8IteQdw
cqAAoI4CtPBP8mRy0PCm3+05FbSxVOrF
=dY4i
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--
