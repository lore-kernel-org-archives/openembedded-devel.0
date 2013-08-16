Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D8A596B563
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 07:19:01 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so774124eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tZ7+h96j/McwKyScPIo8ttb5xWXHKKY7CAvI3/+jeAA=;
	b=y/y+xIysp7cEPWTGkXNwbEfo9TU21m2dLTfJBE+HlwXyKMfgh7K0kUXTWGGkYKbf3+
	kxdx+H6PrqmYSceOFJq8xF00TY8ZLlZhbz/RavnRnmUifuvKokwNcY9XTzkHHqHliAjK
	K6PjbLmAfiYjFbgj8XkKdiikuem8SkiBDJ2pnNdGSDBMCuUz2E5iAgV3pLE32IN/pZmb
	UtHUmUdeEMdkuRyg+TD7BGxw60IPwneFAK86rLh/3Z2114ZorQ9/Oqm5aaZwe9Pzorub
	+3nj2QTcR9DF0mR0A8odEBhB8BaVRaY6yFnqEXobAMeTzAuuC9jIAJiMeVr9VKzyf/72
	VBqA==
X-Received: by 10.14.113.137 with SMTP id a9mr252154eeh.3.1376637542121;
	Fri, 16 Aug 2013 00:19:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm439257eeb.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 16 Aug 2013 00:19:01 -0700 (PDT)
Date: Fri, 16 Aug 2013 09:19:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130816071954.GG17945@jama>
References: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: joe.macdonald@windriver.com
Subject: Re: [PATCH meta-networking] quagga: two fixes
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
X-List-Received-Date: Fri, 16 Aug 2013 07:19:03 -0000
X-Groupsio-MsgNum: 45762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5CFHAhYDCN3kIKuu"
Content-Disposition: inline

--5CFHAhYDCN3kIKuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 10:23:59AM +0800, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. quagga should depend on iproute2, since ip from busybox is not suffici=
ent
> 2. fix a typOS(should chmod, not chown)

As you care about quagga, can you please fix:
quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped
in a particular package.

?

Thanks

>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index f5489c6..89b9f7a 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -5,7 +5,7 @@ Unix platforms, particularly FreeBSD, Linux, Solaris and =
NetBSD. \
>  Quagga is a fork of GNU Zebra which was developed by Kunihiro \
>  Ishiguro. The Quagga tree aims to build a more involved community \
>  around Quagga than the current centralised model of GNU Zebra."
> -HOMEPAGE =3D "http://www.quagga.net/"
> +HOMEPAGE =3D "http://www.nongnu.org/quagga/"
>  SECTION =3D "network"
>  LICENSE =3D "GPL-2.0 & LGPL-2.0"
>  DEPENDS =3D "readline ncurses perl-native"
> @@ -17,6 +17,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
> =20
>  INC_PR =3D "r2"
> =20
> +# the "ip" command from busybox is not sufficient (flush by protocol flu=
shes all routes)
> +RDEPENDS_${PN} +=3D "iproute2"
> +
>  QUAGGASUBDIR =3D ""
>  # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
>  # versions and leave it empty for recent versions.
> @@ -128,11 +131,11 @@ pkg_postinst_${PN} () {
>      if [ "x$D" !=3D "x" ] ; then
>          exit 1
>      fi
> -    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch =
${sysconfdir}/quagga/$f.conf; done
> +    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do =
touch ${sysconfdir}/quagga/$f.conf; done
>      chown quagga:quaggavty ${sysconfdir}/quagga
>      chown quagga:quagga ${sysconfdir}/quagga/*.conf
>      chmod 750 ${sysconfdir}/quagga
> -    chown 640 ${sysconfdir}/quagga/*.conf
> +    chmod 640 ${sysconfdir}/quagga/*.conf
>      if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>          ${sysconfdir}/init.d/populate-volatile.sh update
>      fi
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5CFHAhYDCN3kIKuu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIN0poACgkQN1Ujt2V2gByMgwCfWKhGsOsQi/VBnnis9n6MBwEQ
wX8AoKwmF6HApeWOK1NdKhrYirEzprpJ
=lnp1
-----END PGP SIGNATURE-----

--5CFHAhYDCN3kIKuu--
