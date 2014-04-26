Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id E707265DD8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:37:26 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so3719676eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bDrUXflLAa+KSgnWO/HeqZ3PqLjJOHaqzJSycRx1Ho0=;
	b=COUteyreGpMGmG1QmrsFmhhtk3cjjEvbNLvcoI+I5EZOw1EF5Qw4c/euUJ55Vv2Y0D
	zLUI/Silzs/5k0TPkM1GwYNp1acFxxGnnOZV5W4IgrjdaBfwvSQr69VhUmybNd7bIOfG
	sRBbY0GhXkMGBMP90GTcWXUN0sfg++/vPtpiNtQ3vFAWGSEaYtVT7L17FhZBaZZ3Nlsu
	MmrvOficiwcSnY9QyfmhnKoWoM10bDwwtU7N8+Iw46AYBsWNMKx8oQi/z/0AuaXncccb
	E2vEhfQEvTH9z04MRdM8jdHgpqXHpfU6xgm2cjEE1M6wgPRhaURZ+cApDulcWp6hc8JT
	SpgA==
X-Received: by 10.14.99.68 with SMTP id w44mr54776eef.82.1398551847100;
	Sat, 26 Apr 2014 15:37:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm36707769eep.12.2014.04.26.15.37.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 15:37:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 27 Apr 2014 00:37:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140426223737.GC2486@jama>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
	<1398544484-27299-7-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1398544484-27299-7-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 07/21] bonnie++, lmbench, obex-data-server, samba, sg3-utils: Do not do out-of-tree builds
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
X-List-Received-Date: Sat, 26 Apr 2014 22:37:27 -0000
X-Groupsio-MsgNum: 49542
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PC9bQVTfFuJ+mkID"
Content-Disposition: inline

--PC9bQVTfFuJ+mkID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2014 at 01:34:30PM -0700, Khem Raj wrote:
> These recipes are not ready yet
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb          |    2 +-
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb         |    2 +-
>  meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb |    2 +-
>  meta-oe/recipes-connectivity/samba/samba.inc                |    2 +-
>  meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb         |    5 +++--
>  5 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe=
/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> index 828d762..f8a23d7 100644
> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${=
PV}.tgz \
>  SRC_URI[md5sum] =3D "750aa5b5051263a99c6c195888c74968"
>  SRC_URI[sha256sum] =3D "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876=
df8721f01ba2e2cb"
> =20
> -inherit autotools
> +inherit autotools-brokensep
> =20
>  SCRIPTS =3D "bon_csv2html bon_csv2txt"
>  EXES =3D "bonnie++ zcav"
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 267f75e..41db150 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b \
>                      file://COPYING-2;md5=3D8e9aee2ccc75d61d107e43794a25c=
df9"
> =20
> -inherit autotools
> +inherit autotools-brokensep
> =20
>  PR =3D "r2"
> =20
> diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb =
b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> index e781985..f12941e 100644
> --- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> +++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "http://tadas.dailyda.com/software/obex-data-=
server-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "961ca5db6fe9c97024e133cc6203cc4d"
>  SRC_URI[sha256sum] =3D "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142ad=
c448268d3920094f"
> =20
> -inherit autotools
> +inherit autotools-brokensep
> =20
>  FILES_${PN} +=3D "${datadir}/dbus-1/"
> =20
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index 59c6712..39fc814 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -12,7 +12,7 @@ SRC_URI =3D "http://samba.org/samba/ftp/stable/samba-${=
PV}.tar.gz \
> =20
>  S =3D "${WORKDIR}/samba-${PV}/source"
> =20
> -inherit autotools update-rc.d
> +inherit autotools-brokensep update-rc.d
> =20
>  SAMBAMMAP =3D "no"
>  SAMBAMMAP_libc-glibc =3D "yes"
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb b/meta-o=
e/recipes-support/sg3-utils/sg3-utils_1.38.bb
> index beee36c..fd11ce8 100644
> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
> @@ -8,10 +8,11 @@ SECTION =3D "console/admin"
>  LICENSE =3D "GPLv2+ & BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df90da7fc52172599dbf082d7620f1=
8ca"
> =20
> -SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
> +SRC_URI =3D "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
> +          "

Please drop this ^

>  SRC_URI[md5sum] =3D "e532a3d6648c422347f6d84cac469263"
>  SRC_URI[sha256sum] =3D "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5=
d7c12ce652ba38f1"
> =20
> -inherit autotools
> +inherit autotools-brokensep
> =20
>  S =3D "${WORKDIR}/sg3_utils-${PV}"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PC9bQVTfFuJ+mkID
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNcNTEACgkQN1Ujt2V2gBwCSACglutHySaNMbm6e9tRyNj36zVf
sbYAoK6jGrHjExn2If52aV6y0EGdecto
=0xNf
-----END PGP SIGNATURE-----

--PC9bQVTfFuJ+mkID--
