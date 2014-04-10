Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2220965DF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:28:18 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2679420eek.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ygf0wCdraLMypWthasWq87tHD+KEglIJqDjNKfcnsRU=;
	b=Bo04go7Ig4vTyvEf8bntcnhGeixlO1svgdFvgRAdzGcfAhwDhL0MTF3PcPqLY5mK13
	HQ708c3YU+hKXPuzQ3FhFKXmBtKm0Q/vGe5VM2+RhE8kGmzEo0F2D52NWnrz3xT5nlA4
	4ux8Yem8cvI/ahP8TJbBJO9MkMZgWRqhZlFzq2KEtUKBXYUMluXuD/P4R92MGBkw/Oau
	XB5UQolmQkYlVVwXXpuJF4yOYV6M4i49cipIfTSrbHFc7GbQJkUy97Uf9cxIiC7EvAew
	sbTCMYc2IxNkdKcmrnxKZ288PEQ8qo6zWHl0TJqr3n8vBuWm8PQ6xGY3lxCdcY69fqi1
	iG2A==
X-Received: by 10.14.214.68 with SMTP id b44mr19403385eep.0.1397118499412;
	Thu, 10 Apr 2014 01:28:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm8199029eef.20.2014.04.10.01.28.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:28:18 -0700 (PDT)
Date: Thu, 10 Apr 2014 10:28:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140410082826.GM2132@jama>
References: <1396938662-31887-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396938662-31887-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] bonnie++: update to version 1.03e
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
X-List-Received-Date: Thu, 10 Apr 2014 08:28:21 -0000
X-Groupsio-MsgNum: 49153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/TUrtqMIkCP4YtJm"
Content-Disposition: inline

--/TUrtqMIkCP4YtJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 02:31:02PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> * use BPN in the file name in SRC_URI.
> * install binaries in bindir and sbindir instead of base_bindir and base_=
sbindir.

Please use -M when sending renames.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   32 --------------=
------
>  meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |   30 ++++++++++++++=
++++
>  2 files changed, 30 insertions(+), 32 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> deleted file mode 100644
> index bff0d72..0000000
> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> -HOMEPAGE =3D "http://www.coker.com.au/bonnie++/"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150=
ae9cc3ee0"
> -
> -SRC_URI =3D "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
> -           file://gcc-4.3-fixes.patch \
> -"
> -SRC_URI[md5sum] =3D "77a1ba78f37bdd7f024b67e1e36ad151"
> -SRC_URI[sha256sum] =3D "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac8=
9396043b49612a26"
> -
> -inherit autotools
> -
> -SCRIPTS =3D "bon_csv2html bon_csv2txt"
> -EXES =3D "bonnie++ zcav"
> -
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -
> -do_install () {
> -    install -d ${D}/bin
> -    install -d ${D}/sbin
> -    install -m 0755 ${EXES} ${D}/sbin
> -    install -m 0755 ${SCRIPTS} ${D}/bin
> -}
> -
> -PACKAGES =3D+ "bonnie-scripts"
> -
> -FILES_${PN} =3D "${base_sbindir}"
> -FILES_bonnie-scripts =3D "${base_bindir}"
> -
> -
> -
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> new file mode 100644
> index 0000000..b986823
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> +HOMEPAGE =3D "http://www.coker.com.au/bonnie++/"
> +SECTION =3D "benchmark/tests"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150=
ae9cc3ee0"
> +
> +SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> +           file://gcc-4.3-fixes.patch \
> +"
> +SRC_URI[md5sum] =3D "750aa5b5051263a99c6c195888c74968"
> +SRC_URI[sha256sum] =3D "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876=
df8721f01ba2e2cb"
> +
> +inherit autotools
> +
> +SCRIPTS =3D "bon_csv2html bon_csv2txt"
> +EXES =3D "bonnie++ zcav"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_install () {
> +	install -d ${D}/${bindir}
> +	install -d ${D}/${sbindir}
> +	install -m 0755 ${EXES} ${D}/${sbindir}
> +	install -m 0755 ${SCRIPTS} ${D}/${bindir}
> +}
> +
> +PACKAGES =3D+ "bonnie-scripts"
> +
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

--/TUrtqMIkCP4YtJm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGVioACgkQN1Ujt2V2gBzl2ACfYB/DPRUOfMJuTCtWgkWFYZsd
fvEAoKF2qevW6YF1FGNBjDo+o2TInS8f
=sPL4
-----END PGP SIGNATURE-----

--/TUrtqMIkCP4YtJm--
