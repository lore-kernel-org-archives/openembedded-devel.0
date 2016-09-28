Return-Path: <ruben.de.smet@rubdos.be>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 19:32:42 UTC
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id C6AF06AC00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 19:32:42 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 9CD0E3FCC9;
	Wed, 28 Sep 2016 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1475090820;
	bh=8vysMUVcbckP4Yc+yowKUIFpFC6Wz5FIqO7E8DYY1dc=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=gAwhloSuEuC2JyRHdYOplhsSNloQn7Dim9kBDKkSAAYT+083C2ZCvMWx7bDPGzSx8
	gsgR5mQuxXttGwx3i4t4ZGZPo1i4jCB2c4T45gfRqSMtdkj0n6Sej5+wYDB2HPVpNo
	xhjIGlFIE4da7xZJfCrIEGEypeEwZ0VP7Bj4k0Hw=
To: openembedded-devel@lists.openembedded.org
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
Date: Wed, 28 Sep 2016 21:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2016 19:32:43 -0000
X-Groupsio-MsgNum: 63339
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xFkxrNSQoAhbDAqRiCKD6Cl77bMOE917T"

--xFkxrNSQoAhbDAqRiCKD6Cl77bMOE917T
Content-Type: multipart/mixed; boundary="W5ARFpv0HqAamRxtCrtGa43FgapSLhbEQ";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Message-ID: <75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for
 version 3.6.0
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
In-Reply-To: <20160822143457.6378-1-ruben.de.smet@rubdos.be>

--W5ARFpv0HqAamRxtCrtGa43FgapSLhbEQ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

Any chance these things could get merged? Would be for both upstream and
krogoth.

They do depend on my

 pypi: update the base pypi url to use the package info without
requiring the hash

backport.

Ruben

On 08/22/2016 04:34 PM, Ruben De Smet wrote:
> A Python library for Apache Cassandra
>=20
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  .../python/python-cassandra-driver.inc              | 21 +++++++++++++=
++++++++
>  .../python/python3-cassandra-driver_3.6.0.bb        | 16 +++++++++++++=
+++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-cassandr=
a-driver.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-cassand=
ra-driver_3.6.0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-cassandra-drive=
r.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> new file mode 100644
> index 0000000..d3e4cf6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "DataStax Python Driver for Apache Cassandra"
> +DESCRIPTION =3D "A modern, feature-rich and highly-tunable Python clie=
nt \
> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) usi=
ng \
> +exclusively Cassandra's binary protocol and Cassandra Query Language v=
3."
> +HOMEPAGE =3D "https://github.com/datastax/python-driver"
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e2646=
8ba93"
> +SRCNAME =3D "cassandra-driver"
> +
> +SRC_URI[md5sum] =3D "756a3b235c5766c3072ed62e1083c9ef"
> +SRC_URI[sha256sum] =3D "049c8a871e49052c7b72fddb6569f1bfe738bbfea0a562=
eeeb5404abeff015ab"
> +
> +DISTUTILS_BUILD_ARGS +=3D " \
> +    --no-libev \
> +"
> +DISTUTILS_INSTALL_ARGS +=3D " \
> +    --no-libev \
> +"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driv=
er_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-drive=
r_3.6.0.bb
> new file mode 100644
> index 0000000..65fd2c0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.=
0.bb
> @@ -0,0 +1,16 @@
> +inherit setuptools3
> +require python-cassandra-driver.inc
> +
> +RDEPENDS_${PN} +=3D "\
> +    python3-cython \
> +    python3-multiprocessing \
> +    python3-six \
> +    python3-json \
> +    libevent \
> +"
> +RDEPENDS_${PN}_class-native =3D ""
> +
> +DEPENDS_${PN} +=3D "\
> +    python3-setuptools \
> +    python3-cython \
> +"
>=20



--W5ARFpv0HqAamRxtCrtGa43FgapSLhbEQ--

--xFkxrNSQoAhbDAqRiCKD6Cl77bMOE917T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJX7Bl/GRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BDwMAgAtSL164OJbdrqonCO366nzU84QvhZzIwc27WBKkkFuJNqNhr0USU3
9IbH9LS9lwG6d6RbE2/6GbfBstQ08JEbwEqCU34hi+0ByJroPL0yLzS0NYuM774b
dWZvqvEgaaMlYxIQUqY+697AvIG8BDHM/+0xtHQyv4/uoPadtrJS6clPVigTXto6
NsR1i3w0fwdl0o6gKv4Fy+4RtHoF08bFAjtVfd+eW2Mhz8vFl9EkCiPuILSpQO0W
i4Xie4bI8b7GjfXw07JJspbZCPGMOLrrlclv/ztgqlWUAQ08hXr0N0sTjszqFh8B
0fZ0wakrP+uYF6nf/sJ3N+tg30rtwz7qCQ==
=SHMi
-----END PGP SIGNATURE-----

--xFkxrNSQoAhbDAqRiCKD6Cl77bMOE917T--
