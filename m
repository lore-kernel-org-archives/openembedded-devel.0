Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 207BD65D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:15:14 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so2890307eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eFghyMzHCRo8TMTcPvmT0u7IluJ+6X78BQmG306Fv3M=;
	b=ikwGqfa87avBKZr3W3Yqat+FwrNbq2IvT720VywXxB98M8rhfUMpEGh7LAxlI7/G7f
	XN5nVnh4GpYNgGI/yQuuA+OOacCdG8SBc3SC3VxWtomIldheKp846hU6DXWrFHIQVJ23
	cJIa6FzQhBYBn3zGYOMRrYjMYM2iRKIdYC7pjfWqpz4aEI0zfonmRyPsqrlCHd5D87fr
	H6vkB5OM/zxess5SLg/ot0xI4Om1N+UqKy4aelpZNKezvvqrr5qAoNJeDNqS3GdT3Jsn
	Oyf3ubun+x0QK9Gcofcq65oLCB2UeScuGesK088EAuthKCRd9KsNSWy+v4QWPlTuzhC0
	K0DA==
X-Received: by 10.14.211.133 with SMTP id w5mr2476379eeo.5.1397985315617;
	Sun, 20 Apr 2014 02:15:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm92918316eex.31.2014.04.20.02.15.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:15:14 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:15:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091519.GU2486@jama>
References: <1397181013-2452-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397181013-2452-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2] bonnie++: update to version 1.03e
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
X-List-Received-Date: Sun, 20 Apr 2014 09:15:16 -0000
X-Groupsio-MsgNum: 49302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E75mJrUy8lRi9cGN"
Content-Disposition: inline

--E75mJrUy8lRi9cGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 09:50:13AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Merged, thanks.
>=20
> Changes:
> * use BPN in the file name in SRC_URI.
> * install binaries in bindir and sbindir instead of base_bindir and base_=
sbindir.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../{bonnie++_1.03c.bb =3D> bonnie++_1.03e.bb}       |   22 +++++++++---=
--------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>  rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03c.bb =3D> bonnie++=
_1.03e.bb} (48%)
>=20
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> similarity index 48%
> rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> index bff0d72..828d762 100644
> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> @@ -1,13 +1,14 @@
>  SUMMARY =3D "Tests large file IO and creation/deletion of small files"
>  HOMEPAGE =3D "http://www.coker.com.au/bonnie++/"
> +SECTION =3D "benchmark/tests"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150=
ae9cc3ee0"
> =20
> -SRC_URI =3D "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
> +SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
>             file://gcc-4.3-fixes.patch \
>  "
> -SRC_URI[md5sum] =3D "77a1ba78f37bdd7f024b67e1e36ad151"
> -SRC_URI[sha256sum] =3D "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac8=
9396043b49612a26"
> +SRC_URI[md5sum] =3D "750aa5b5051263a99c6c195888c74968"
> +SRC_URI[sha256sum] =3D "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876=
df8721f01ba2e2cb"
> =20
>  inherit autotools
> =20
> @@ -17,16 +18,13 @@ EXES =3D "bonnie++ zcav"
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =20
>  do_install () {
> -    install -d ${D}/bin
> -    install -d ${D}/sbin
> -    install -m 0755 ${EXES} ${D}/sbin
> -    install -m 0755 ${SCRIPTS} ${D}/bin
> +    install -d ${D}/${bindir}
> +    install -d ${D}/${sbindir}
> +    install -m 0755 ${EXES} ${D}/${sbindir}
> +    install -m 0755 ${SCRIPTS} ${D}/${bindir}
>  }
> =20
>  PACKAGES =3D+ "bonnie-scripts"
> =20
> -FILES_${PN} =3D "${base_sbindir}"
> -FILES_bonnie-scripts =3D "${base_bindir}"
> -
> -
> -
> +FILES_${PN} =3D "${sbindir}"
> +FILES_bonnie-scripts =3D "${bindir}"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E75mJrUy8lRi9cGN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkCcACgkQN1Ujt2V2gBwdiACff2zPSIyFONJSLyvEe+58pnLO
j6cAnRL4DzJTOyrjQGCbRttPI7XvfsEI
=gdok
-----END PGP SIGNATURE-----

--E75mJrUy8lRi9cGN--
