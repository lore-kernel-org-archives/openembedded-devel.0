Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9D065D52
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:58:13 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2930023eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tTRYO2b4wJRXKB9QVM8H5ChVhhfCzhxcZWvGauHdmUQ=;
	b=c4RCQ7j6Z9BBheSl8sE8UQTyplMxGYuFLZ9zg3BJ50obvcW5z9Vwn99W8SxYzqDP+y
	UJKCqbeC2/AwL9bIbeBQg8Lxs+sjIywgXfbwwdQsyc6PRHSwRfvRt7j510AsiVoTphXX
	F/9z1nwT9wg5rOu9uZMcohHBNQ/urjHgRod2SBliuFjIetqqdRSM8LiWHz6dujXJdM1l
	QMpvJanP+ZZqvU6cagBMu1SJPrzu3kqIdgnl/RaVX7BMcDeF7L1aeF2GiGQsNxF0q1go
	8hBjEfQmREXIxiYST/dAoVQdhBH0pc1y6ClDb7NsX3mp1nYSAl/ZgOMeHez2Q5bSVoeN
	cdGw==
X-Received: by 10.14.193.201 with SMTP id k49mr38205901een.50.1397995094377;
	Sun, 20 Apr 2014 04:58:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm94022097eep.14.2014.04.20.04.58.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:58:13 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:58:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420115818.GH2486@jama>
References: <20140409173022.GA2661@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140409173022.GA2661@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: [meta-networking] Uprev memcached from upstream
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
X-List-Received-Date: Sun, 20 Apr 2014 11:58:15 -0000
X-Groupsio-MsgNum: 49341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R0KYKl6i9Fj1nV1E"
Content-Disposition: inline

--R0KYKl6i9Fj1nV1E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 01:30:22PM -0400, Amy Fong wrote:
> commit 3d0b80c5667a2c1d8634173948048567d0bc9c36
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Tue Apr 8 14:29:19 2014 -0400
>=20
>     Uprev memcached from upstream

Please remove 1.4.15 in the same commit and send with -M.
>    =20
>     memcached 1.4.15 has some configuration errors:
>     configure:5798: error: cannot run test program while cross compiling
>    =20
>     Uprev has the needed fix for the configuration error and some other f=
ixes.
>    =20
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>=20
> diff --git a/recipes-support/memcached/memcached_1.4.17.bb b/recipes-supp=
ort/memcached/memcached_1.4.17.bb
> new file mode 100644
> index 0000000..906896c
> --- /dev/null
> +++ b/recipes-support/memcached/memcached_1.4.17.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "A high-performance memory object caching system"
> +DESCRIPTION =3D "\
> + Danga Interactive developed memcached to enhance the speed of LiveJourn=
al.com, \
> + a site which was already doing 20 million+ dynamic page views per day f=
or 1 \
> + million users with a bunch of webservers and a bunch of database server=
s. \
> + memcached dropped the database load to almost nothing, yielding faster =
page \
> + load times for users, better resource utilization, and faster access to=
 the \
> + databases on a memcache miss. \
> + . \
> + memcached optimizes specific high-load serving applications that are de=
signed \
> + to take advantage of its versatile no-locking memory access system. Cli=
ents \
> + are available in several different programming languages, to suit the n=
eeds \
> + of the specific application. Traditionally this has been used in mod_pe=
rl \
> + apps to avoid storing large chunks of data in Apache memory, and to sha=
re \
> + this burden across several machines."
> +
> +HOMEPAGE =3D "http://www.danga.com/memcached/"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca0804=
6ff"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "libevent"
> +RDEPENDS +=3D "perl perl-module-posix perl-module-autoloader perl-module=
-tie-hash"
> +
> +SRC_URI =3D "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "46402dfbd7faadf6182283dbbd18b1a6"
> +SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf992=
6a89999d8cdc0458"
> +
> +python __anonymous () {
> +    endianness =3D d.getVar('SITEINFO_ENDIANNESS', True)
> +    if endianness =3D=3D 'le':
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dlittle")
> +    else:
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dbig")
> +}
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "memcached"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +do_install_append() {
> +	install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/=
memcached=20
> +	mkdir -p ${D}/usr/share/memcached/scripts
> +	install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scr=
ipts
> +	install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/sc=
ripts
> +}
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R0KYKl6i9Fj1nV1E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTtloACgkQN1Ujt2V2gBzwjQCeNVsmft63jMYT7WqBHFdzL2LY
VWYAnAqUQqJBAMdPdsWP0xLQn5yb90+d
=Gz9p
-----END PGP SIGNATURE-----

--R0KYKl6i9Fj1nV1E--
