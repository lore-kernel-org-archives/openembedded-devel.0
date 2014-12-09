Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CE2B2723A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:51:07 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so1509910wgh.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V7j+OdW+yzW9Ru7AGDBrNccPby39lBuNSPiiA7q8dMU=;
	b=mQtIpynFVq9WKnO4oQFZaVUwXZarX/kKCiKYQDOyof1UUQQuWqsGOhlXweMaQokO4S
	2P0XDAjinDYx033eTwph1gnaUB6trMqbEiZtMgEa3/rD4TgNs5BI5DBDFr6N0Pr68fB3
	gelsQCmPeD01cgo0IHsUqHPqs5Oo+g5ItDfCTtw4xO3zyUD7s0k/bnmeRn7uqw04SSej
	ua04vxKcFEalbCUZVv6u0yLXsDcIpH6ObrUSmTxYkUDMo1UtkaYK9Mtj26ulApJiHp8T
	N6KyUCHJJpBiEcZc3/90C9awbUL9hGajNLZaENsK5UTQle4Ad4vak9IFqdSs6iqu24sk
	O9Tw==
X-Received: by 10.180.91.193 with SMTP id cg1mr34360269wib.26.1418147467226;
	Tue, 09 Dec 2014 09:51:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u1sm3909517wif.6.2014.12.09.09.51.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 09:51:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 18:51:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209175107.GP2470@jama>
References: <1417685927-17482-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1417685927-17482-3-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417685927-17482-3-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] libjs-sizzle: Add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 17:51:10 -0000
X-Groupsio-MsgNum: 53247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G+DT6X5ssgZ56VG3"
Content-Disposition: inline

--G+DT6X5ssgZ56VG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 05:38:47PM +0800, Qian Lei wrote:
> libjs-sizzle is a pure-javascript CSS selector engine
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb | 21 +++++++++++++++=
++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
>=20
> diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb b/meta-o=
e/recipes-support/libjs/libjs-sizzle_1.9.3.bb
> new file mode 100644
> index 0000000..d773617
> --- /dev/null
> +++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Pure-JavaScript CSS selector engine"
> +LICENSE =3D "GPLv2+ & MIT & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://usr/share/doc/libjs-sizzle/copyright;md5=3D=
9b35efb1635ff8f06d1984376b06ee5a"
> +
> +SRC_URI =3D "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/=
${BPN}_${PV}-1_all.deb;subdir=3D${BP}"
> +SRC_URI[md5sum] =3D "d88d4ed02a2098e32ba057cc0c2724ba"
> +SRC_URI[sha256sum] =3D "604029bc97b6e84da7e9eba4cef8e822c80d9255cf3d9e1d=
0f7d53652b0986aa"

Fails to fetch:
NOTE: recipe libjs-sizzle-1.9.3-r0: task do_fetch: Started
WARNING: Checksum failure encountered with download of http://kr.archive.ub=
untu.com/ubuntu/pool/universe/s/sizzle/libjs-sizzle_1.9.3-1_all.deb;subdir=
=3Dlibjs-sizzle-1.9.3 - will attempt other sources if available
WARNING: Renaming /home/jenkins/oe/world/shr-core/downloads/libjs-sizzle_1.=
9.3-1_all.deb to /home/jenkins/oe/world/shr-core/downloads/libjs-sizzle_1.9=
=2E3-1_all.deb_bad-checksum_748b8805e21caed658f6765f7c491d46
ERROR: Fetcher failure for URL: 'http://kr.archive.ubuntu.com/ubuntu/pool/u=
niverse/s/sizzle/libjs-sizzle_1.9.3-1_all.deb;subdir=3Dlibjs-sizzle-1.9.3'.=
 Checksum mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/libjs-sizzle_1.9.3-1_all.d=
eb' has md5 checksum 748b8805e21caed658f6765f7c491d46 when d88d4ed02a2098e3=
2ba057cc0c2724ba was expected
File: '/home/jenkins/oe/world/shr-core/downloads/libjs-sizzle_1.9.3-1_all.d=
eb' has sha256 checksum 2a6468763c40a30f6f7d0df8906cd17aaebd6edaa5478aeaffd=
7b6b5fb8abd35 when 604029bc97b6e84da7e9eba4cef8e822c80d9255cf3d9e1d0f7d5365=
2b0986aa was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] =3D "748b8805e21caed658f6765f7c491d46"
SRC_URI[sha256sum] =3D "2a6468763c40a30f6f7d0df8906cd17aaebd6edaa5478aeaffd=
7b6b5fb8abd35"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.

ERROR: Function failed: Fetcher failure for URL: 'http://kr.archive.ubuntu.=
com/ubuntu/pool/universe/s/sizzle/libjs-sizzle_1.9.3-1_all.deb;subdir=3Dlib=
js-sizzle-1.9.3'. Unable to fetch URL from any source.

> +
> +SIZZLEDIR =3D "${datadir}/javascript/sizzle"
> +SIZZLEDOCDIR =3D "${docdir}/libjs-sizzle"
> +
> +do_install() {
> +    install -d -m 0755 ${D}${SIZZLEDIR}
> +    install -m 0644 ${S}${SIZZLEDIR}/sizzle.js ${D}${SIZZLEDIR}/
> +    install -m 0644 ${S}${SIZZLEDIR}/sizzle.min.js ${D}${SIZZLEDIR}/
> +
> +    install -d -m 0755 ${D}${SIZZLEDOCDIR}
> +    install -m 0644 ${S}${SIZZLEDOCDIR}/* ${D}${SIZZLEDOCDIR}/
> +}
> +
> +FILES_${PN} =3D "/usr/share/javascript/sizzle/"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G+DT6X5ssgZ56VG3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSHNosACgkQN1Ujt2V2gBxo3gCcDdrBYANX9WBHK8hmtS59o63S
EWQAn2TvvFJuM9A/CTV2n7iXdMgZ3e3z
=wcC+
-----END PGP SIGNATURE-----

--G+DT6X5ssgZ56VG3--
