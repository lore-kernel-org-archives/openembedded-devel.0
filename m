Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyRo-0007tu-8v
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:39:40 +0100
Received: by mail-pd0-f177.google.com with SMTP id y14so1525248pdi.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Soa7MIN8FpsXsOZ+ZVWtn2msqT4/yTQp4fG1MOYKyPM=;
	b=v2DlOz7fTMrwKF4jsmZRZvZAUcYhQEAmdAieBh6/lfu4r70Y7NgpDTAox9X03QynD0
	bVcWUuYdiBwy55/6Ff7HeLiCLZ/Vh9AmO/RdfQVgkklmEnL55C2pRvN6w0AnO+9W4jVh
	3kpOInxdg51Hvm1TagxXhitD4HibqULko/QuYBlBgZ6umxw6QC45V66A58v+2Y+7n/ft
	aRnQoIAtxn9zjQ2Ik2CMVSqpwDF8CeuVuoc1uWJhZYqowLgWbmxv26BHy8HW7GsGhYcE
	fdS3FNZCtXs2BjYuKruUz3gd9o/iErdgNkN+Z8wBuuGLJha+dlWtvz/Jiosjryp+3RBr
	2CAw==
X-Received: by 10.66.165.34 with SMTP id yv2mr2266531pab.35.1363944166082;
	Fri, 22 Mar 2013 02:22:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ce16sm2301148pac.5.2013.03.22.02.22.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:22:45 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:22:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092244.GM3219@jama>
References: <1363295158-21771-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1363295158-21771-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] luajit: Fix build with SSTATE enabled
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
X-List-Received-Date: Fri, 22 Mar 2013 09:40:02 -0000
X-Groupsio-MsgNum: 43654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c8UbHMnQwI7BF+TB"
Content-Disposition: inline

--c8UbHMnQwI7BF+TB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 02:05:58PM -0700, Khem Raj wrote:
> luajit does not honor standard CC variables
> so when its built from shared state it does
> not compile because --sysroot is wrong.

Applied, thanks!

>=20
> This patch fixes the problem by passing
> the TOOLCHAIN_OPTONS to appropriate flags
> so that it gets the correct sysroot value
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb b/meta-oe/re=
cipes-devtools/luajit/luajit_2.0.0.bb
> index 70cefa8..a7f96f8 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D9511885992e4=
900014e3b13ca6372b7d"
>  HOMEPAGE =3D "http://luajit.org"
> =20
>  DEPENDS +=3D "lua5.1"
> -PR =3D "r1"
> +PR =3D "r2"
>  SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
>             file://disable_lj_vm_foldarith_for_spe.patch \
>            "
> @@ -20,7 +20,7 @@ do_configure_prepend() {
>  	sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
>  }
> =20
> -EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX}'
> +EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} TARGET_CFLAGS=3D"${TOOLCHAIN_OP=
TIONS}" TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" TARGET_SHLDFLAGS=3D"${TOOLC=
HAIN_OPTIONS}"'
>  EXTRA_OEMAKE_append_powerpc =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
>  EXTRA_OEMAKE_append_x86-64 =3D ' HOST_CC=3D"${BUILD_CC}"'
>  EXTRA_OEMAKE_append_i586 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c8UbHMnQwI7BF+TB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIuQACgkQN1Ujt2V2gBxTbwCeJnKN7/wTqdLX9EK0KLTvu1c0
iVkAoLCSxEf4hQxmKPsT4pYgAQccpEQj
=DJuc
-----END PGP SIGNATURE-----

--c8UbHMnQwI7BF+TB--
