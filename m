Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 706E47378D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 13:05:00 +0000 (UTC)
Received: by wesu56 with SMTP id u56so33151722wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 05:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R6kGK+p5Dp2QjushfZPpBbJkM0pe9OLF65yAO4JetNQ=;
	b=l7vzlGmlFgl9neZ7ZSsnG36m3IDjgTMho2ggRTmb7IzCI3dg1a6EEqRdFEIIZ+Or3k
	N/3q/K7gblP2zU5MccSghyhPeVlImu/j6a6lh6nFAcXs4SCmGZ0yXsFvzuctSXp+7k7y
	HHFiEsnwjIFSzKLHT7agvD1mp9Xrcyuu81YPB0zQ4U++YcvgXWAHkGRNhxflBvOoZ7o0
	BWJVZpGvJLu4Nid6QGYTHOZkiIEhfPzfUiOjgbGk1cuTt6GcAyICQ8g4nPA2EPWLnv/1
	CeLVtCXghdLIOT3AxcKQN/Lry/bPsUoZ1VOwHipdix2XT1FcvMmNXHnts/a2aQDCdhce
	nPRQ==
X-Received: by 10.180.210.228 with SMTP id mx4mr24633155wic.71.1425301501689; 
	Mon, 02 Mar 2015 05:05:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j9sm19176977wjy.18.2015.03.02.05.05.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 05:05:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 14:05:23 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302130523.GB2309@jama>
References: <1425296326-2605-1-git-send-email-laszlo.papp@polatis.com>
MIME-Version: 1.0
In-Reply-To: <1425296326-2605-1-git-send-email-laszlo.papp@polatis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Laszlo Papp <laszlo.papp@polatis.com>
Subject: Re: [meta-oe][PATCH] Add uthash recipe
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
X-List-Received-Date: Mon, 02 Mar 2015 13:05:03 -0000
X-Groupsio-MsgNum: 54583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nM4qzG6nHdnn/sXd"
Content-Disposition: inline

--nM4qzG6nHdnn/sXd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 11:38:46AM +0000, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <laszlo.papp@polatis.com>
> ---
>  meta-oe/recipes-support/uthash_1.9.7.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/uthash_1.9.7.bb
>=20
> diff --git a/meta-oe/recipes-support/uthash_1.9.7.bb b/meta-oe/recipes-su=
pport/uthash_1.9.7.bb
> new file mode 100644
> index 0000000..4504dfe
> --- /dev/null
> +++ b/meta-oe/recipes-support/uthash_1.9.7.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Hash table for C structures"

DESCRIPTION -> SUMMARY

> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D564f9c44927f6247dc810bf557e2b=
240"
> +PR =3D "r1"

Don't use PR.

> +
> +SRC_URI =3D "http://downloads.sourceforge.net/uthash/${PN}-${PV}.tar.bz2"

uthash -> ${BPN}
${PN}-${PV} -> ${BP}
http://downloads.sourceforge.net -> ${SOURCEFORGE_MIRROR}

> +
> +SRC_URI[md5sum] =3D "1f14bbee7ee73ed0ceb3549f8cf378b4"
> +SRC_URI[sha256sum] =3D "956f5c99798349c413275fe4c9ff128d72e280655dadbe43=
65f8e9fbda91393f"
> +
> +do_install () {
> +    install -dm755 ${D}${includedir}
> +    install -m 0644 ${S}/src/*.h ${D}${includedir}
> +}
> --=20
> 2.3.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nM4qzG6nHdnn/sXd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0YBMACgkQN1Ujt2V2gBwLSgCfaCh+3pkOuzyqUmAtXxA3x3Fo
1YcAmwTe7OJdr23AuL6QlOQB9sMrZqnm
=RuJF
-----END PGP SIGNATURE-----

--nM4qzG6nHdnn/sXd--
