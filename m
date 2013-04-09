Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPVb1-0008BX-SK
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 12:16:12 +0200
Received: by mail-pb0-f50.google.com with SMTP id jt11so174279pbb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ERTWHBNlFq8dt7TsXJtzpWHPPJ42vRl3kLT8k72hdv4=;
	b=ZhnzI18c0DLhtvKWp45KM08ZCLng37FNueSy/vNLvjL/wiJ0+lzUrH3dXcQy8ofEBn
	Pu56rUeYXfwvy8t5Ccur1oeM7bReNR7RUr9Ga5zeQikpYoYLV8r0KQdYfVEjvLPqQHPW
	mnzdVsld4tXkMNcKE5Xf9yK8cJKcGPgAzzZUuywZ0s7aWOazND01ylIeqyP4puaIp4F5
	zSJPRpFSb24BJ1quBP1H6BhHtSQ3zMHxdf8I1RrKxdPxWP0wiyODsyrV95Gqi1ndLg1I
	DqpZdfBLCkxd7zq4OiYrVc4kIl4/v01VvskkE8XGYQbiFMEzp2bVOVW9vFJ0rPSbFnrs
	e4OQ==
X-Received: by 10.68.134.36 with SMTP id ph4mr1602704pbb.181.1365501531334;
	Tue, 09 Apr 2013 02:58:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t16sm1603932pbs.32.2013.04.09.02.58.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 02:58:50 -0700 (PDT)
Date: Tue, 9 Apr 2013 11:58:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130409095840.GA2474@jama>
References: <1365102349-21426-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1365102349-21426-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] tbb: update to 4.1 Update 3 version from 20130314
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
X-List-Received-Date: Tue, 09 Apr 2013 10:16:15 -0000
X-Groupsio-MsgNum: 43990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 09:05:49PM +0200, Marcin Juszkiewicz wrote:
> ARMv7a support was added

Now it fails on armv5 (qemuarm)
| ../../include/tbb/machine/gcc_armv7.h:39:2: error: #error Threading
Building Blocks ARM port requires an ARMv7-a architecture.
| make[1]: *** [concurrent_hash_map.o] Error 1


>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/tbb/tbb_4.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-sup=
port/tbb/tbb_4.1.bb
> index 2337bdd..48427ee 100644
> --- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
> @@ -6,7 +6,7 @@ DESCRIPTION =3D "Parallelism library for C++ - runtime fi=
les \
>  HOMEPAGE =3D "http://threadingbuildingblocks.org/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2c7f2caf277a3933e3acdf7f89d54=
cc1"
> -PRDATE =3D "20130116"
> +PRDATE =3D "20130314"
>  PR =3D "r${PRDATE}"
> =20
>  SRC_URI =3D "http://threadingbuildingblocks.org/sites/default/files/soft=
ware_releases/source/tbb41_${PRDATE}oss_src.tgz \
> @@ -15,8 +15,8 @@ SRC_URI =3D "http://threadingbuildingblocks.org/sites/d=
efault/files/software_relea
> =20
>  S =3D "${WORKDIR}/tbb41_${PRDATE}oss/"
> =20
> -SRC_URI[md5sum] =3D "3809790e1001a1b32d59c9fee590ee85"
> -SRC_URI[sha256sum] =3D "4ae2c10899e3b6ef2f686013ec5901fc658444ca90178efa=
ca6014b0665c34b6"
> +SRC_URI[md5sum] =3D "ed4af7ccfa122f16cf9920b241633a3a"
> +SRC_URI[sha256sum] =3D "32fd5979971b772caa96d40646cee585ed0070516ba2dbbc=
b1f9b6033d08a92d"
> =20
>  do_compile() {
>      oe_runmake compiler=3Dgcc arch=3D${HOST_ARCH} runtime=3Dcc4
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFj5lAACgkQN1Ujt2V2gBzERwCfS+k2nY3t8uAYzlMDD0lBiYN5
Y/IAnjmpcqYWv1NxR/kRdSJAM8WRSP+u
=XCA8
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
