Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIju-0006N4-9g
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:15:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2706414eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yfjBZXn/V581lezBuQuYCBrVce6Bh+fKHJnAvoZ1VUs=;
	b=CUOv4ccKIkSn9WNVjZEclDyLSbafgsLZQGCe3hlpnm2KmnXZguBwcZTVpiWuv7fqr9
	Q5iqh3Xn+VfIBguCs/O3oeZDpq2tN/muVexg+fKdoB2M7TqJW2JVV8jlGfKMB2hGve8D
	5oJvoaExNTS+W5Xo7r8fLoU4sg0HIkgthQYENSKIGkqzVl53Iut4L5mPpuNn+0xamtjz
	vd7wQr+wCk77c+HSeb0SMyhWeGuutep7/jeyRYPRtGnPrI6t/o5nrVapRlpHSrIr+CwF
	gw21dWMjwXc2DHXxzzKSp9oeXvQlfvF5YvHS0wFYr/Nd6RoAafG8i7xVT+MbedkgjN3w
	ieDw==
Received: by 10.14.3.195 with SMTP id 43mr33746780eeh.36.1355680823300;
	Sun, 16 Dec 2012 10:00:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm23892117eep.1.2012.12.16.10.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 10:00:22 -0800 (PST)
Date: Sun, 16 Dec 2012 19:00:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121216180022.GC3448@jama>
References: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] rng-tools: Fixes for latest OE layouts
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
X-List-Received-Date: Sun, 16 Dec 2012 18:15:08 -0000
X-Groupsio-MsgNum: 42206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline

--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 02:05:48PM -0700, Gary Thomas wrote:
> The current recipe has a few installation errors:
>   * The manipulation of configurable paths drops a '/'
>   * The init script defaults are placed in the wrong file
>   * Finer control over init script start/stop
>   * The default device is non-standard
>=20
> This patch fixes these little nits and makes the package usable again.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-support/rng-tools/files/default  |    3 ++-
>  meta-oe/recipes-support/rng-tools/rng-tools_2.bb |    5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/re=
cipes-support/rng-tools/files/default
> index ab7cd93..7aede9b 100644
> --- a/meta-oe/recipes-support/rng-tools/files/default
> +++ b/meta-oe/recipes-support/rng-tools/files/default
> @@ -1,2 +1,3 @@
>  # Specify rng device
> -RNG_DEVICE=3D/dev/hwrng
> +#RNG_DEVICE=3D/dev/hwrng
> +RNG_DEVICE=3D/dev/urandom
> diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/r=
ecipes-support/rng-tools/rng-tools_2.bb
> index ef753cf..b94854a 100644
> --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> +++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> @@ -15,12 +15,13 @@ inherit autotools update-rc.d
>  do_install_append() {
>          install -d "${D}${sysconfdir}/init.d"
>          install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-too=
ls
> -        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},=
' \
> +        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/=
,' \
>              ${D}${sysconfdir}/init.d/rng-tools
> =20
>          install -d "${D}${sysconfdir}/default"
> -        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
> +        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
>  }
> =20
>  INITSCRIPT_NAME =3D "rng-tools"
>  INITSCRIPT_PARAMS =3D "defaults"
> +INITSCRIPT_PARAMS =3D "start 30 S . stop 30 0 6 1 ."

Why do you add 2nd INITSCRIPT_PARAMS ?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDODDYACgkQN1Ujt2V2gByhAgCaAwVEXn7VMB7BxnUXjhbkMFG7
dWQAmgL8JXpz8IUgv0IjaPkOx5PkdFQn
=QMVu
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
