Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF76608BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 16:21:38 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so4105889wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L+ritzsRaAR/A2KNug7ptxIV+aBZO6AkIIyN1On5jTY=;
	b=kUzd4jv5FlY2uLhUiyfrWu5twEzqI7MnpQ1osgiXHj4D4VkXeEdImnIm9fLV3b6R8J
	tZ01nGFYiJVQc9yMgWYU6tYZYQuPctQrG0sL+xeFE0D88iaiTDmFFIUN+P2ZzYdPLXHR
	MDEy6seh52qixmgPV8vSKTIdZavYUbfaBCel+AMTLQwwLR/kdvn7H/FqZL8epxSDduQm
	7LWZUXMRY15d+pMYDQ09PAAgzpkI44gp4bnPLBt0Ps0M4eTJLZogaNMdd9sntfknrtzr
	GNtqzUe2ieRto5jjApBGRnmuycAxfRKVVa+XKWKgnUw2H2dSs694u7d55Dpa7dhsOtXu
	0xrA==
X-Received: by 10.180.104.199 with SMTP id gg7mr6881375wib.41.1413994898889;
	Wed, 22 Oct 2014 09:21:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bi7sm2437724wib.17.2014.10.22.09.21.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Oct 2014 09:21:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Oct 2014 18:21:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141022162140.GJ2455@jama>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] add CUnit test suite
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
X-List-Received-Date: Wed, 22 Oct 2014 16:21:45 -0000
X-Groupsio-MsgNum: 52599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W4pDZ/VvazBYHhxQ"
Content-Disposition: inline

--W4pDZ/VvazBYHhxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2014 at 11:49:05AM -0400, Mike Holmes wrote:
> Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> ---
>  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
>=20
> diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/reci=
pes-devtools/cunit/cunit_2.1-3.bb
> new file mode 100644
> index 0000000..e869852
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "CUnit is a C framework for unit testing. Test output su=
pports comandline and GUI reults reporting"
> +HOMEPAGE =3D "http://cunit.sourceforge.net"
> +LICENSE =3D "LGPL-2.0"
> +SECTION =3D "libs"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7734aa853b85d6f935466f081490d=
dbb"
> +
> +S =3D "${WORKDIR}/CUnit-${PV}"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/=
CUnit-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "b5f1a9f6093869c070c6e4a9450cc10c"
> +SRC_URI[sha256sum] =3D "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249=
a464efa49a40f214"
> +
> +inherit autotools-brokensep
> +
> +EXTRA_OECONF =3D "--enable-debug --enable-memtrace --enable-automated --=
enable-basic --enable-console"
> +
> +FILES_${PN}-doc +=3D "${prefix}/doc"

Why doesn't it use ${datadir}/doc =3D=3D ${docdir} as everything else?

> +FILES_${PN}-dev +=3D "${datadir}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W4pDZ/VvazBYHhxQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRH2ZQACgkQN1Ujt2V2gBylLQCgiiDHoeplbz/tpoHwBdkOSvks
qF0AnjudaK/Dl/du5SII9kBuxVnHIkYD
=DM0g
-----END PGP SIGNATURE-----

--W4pDZ/VvazBYHhxQ--
