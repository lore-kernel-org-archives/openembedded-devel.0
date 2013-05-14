Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcJ08-0001kv-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 19:27:04 +0200
Received: by mail-pb0-f45.google.com with SMTP id mc8so599549pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/s2MXguRhk0rCuXoOkqSanHtMvBkp6SLpJK+KrkTC5U=;
	b=fVtUyo9OYUjA4IC4TZahKf6zySt1gfDVgcXhyV4VyxPE0AHgrFXIaNJ4CIScWvT6Ua
	WcFnxLa8kcoxMKYlBhtxESy4dPodZkMBZJJQ/Tmq6VF1qDdozO2ASpC049HycwZFi9O3
	2DIM9BHzpA++LWOZznsIuQ1zXS7+/g5FO9AHdLi6GWPNtkgmPCvqUrASzfU6o7adOYkG
	GjT6bssHAYY+0QyNzbiLLgoCVPqckPTc255auJUeVEq9WgMjDTQvl73g1snhWqglmmK0
	s0y1rYtuqo8ZDTCqXqPI6ZJ2E+RUV53FLT6l0tArmyxXQ25V7GPPAeSdXY00++q3GDGb
	KbJg==
X-Received: by 10.68.196.65 with SMTP id ik1mr34027191pbc.194.1368551328576;
	Tue, 14 May 2013 10:08:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	nt2sm18951003pbc.17.2013.05.14.10.08.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 10:08:47 -0700 (PDT)
Date: Tue, 14 May 2013 19:08:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130514170846.GL3187@jama>
References: <1368524307-8274-1-git-send-email-hong-hua.yin@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1368524307-8274-1-git-send-email-hong-hua.yin@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core master] lvm2: add configure option --with-usrlibdir to install shared library in 64-bit systems
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
X-List-Received-Date: Tue, 14 May 2013 17:27:07 -0000
X-Groupsio-MsgNum: 44714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ARLBH93C7pgvpZY"
Content-Disposition: inline

--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2013 at 05:38:27PM +0800, Olivia Yin wrote:
> According to make.tmpl.in, shared lib will be installed under $(usrlibdir)
> install_lib_shared: $(LIB_SHARED)
>         $(INSTALL_PROGRAM) -D $< $(libdir)/$(<F).$(LIB_VERSION)
>         $(INSTALL_DIR) $(usrlibdir)
>         $(LN_S) -f $(USRLIB_RELPATH)$(<F).$(LIB_VERSION) $(usrlibdir)/$(<=
F)
>=20
> But default $(usrlibdir) is $(DESTDIR)${prefix}/lib no matter it is 32-bi=
t or 64-bit system.
> So we need align $(usrlibdir) with $(libdir).

Wrong subject and it was already applied few days ago:
http://git.openembedded.org/meta-openembedded/commit/?id=3Df9f1a63e03d11028=
785cc4beeb19041b15f8dcb0

> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index 157e11b..5de1e3f 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -4,7 +4,7 @@ DEPENDS =3D "udev"
>  LICENSE =3D "GPLv2 & LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f9009=
82c24"
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
> =20
> =20
>  S =3D "${WORKDIR}/LVM2.${PV}"
> @@ -37,3 +37,4 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_libdir}/udev"
>  FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
> =20
> +EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"
> --=20
> 1.7.0.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGSb54ACgkQN1Ujt2V2gBx2vgCgtADLRt0VJGgnQa4De5sOVHNF
RxUAnRCAbj+TzyKvfZB2wIaOJ13vE8pr
=yY2m
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--
