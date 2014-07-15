Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BA1766FC92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:15:24 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so5653102wgg.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X6nTTkm5sCrYvdG7u2+8t506MNllsAg5Fr4yTmikp6E=;
	b=Itdk//Q/VWGRIpCbZyEfnzjmOR+YOT36JjEYo6XsfaprW1QAuZxrjhKEAYnewo/Mdp
	b3PXmyI2shaAQRuILvxMFXzxtsMbmHo4uTo5rsJmXhvDjeNyOkHViWwUJvIzuHvVHD2y
	IfUQOX8kiAKOOF1GDngNfYzfgplUfuU7e+cZ0S8QVAG3hRnyvj1efbZu7XCNxUQi+Bjq
	fdNCkxtGD81vecKjRSzU70ASzErYLP9byWOUNJrk4wEmcC2jZZclgkBgKE0ablI1of+I
	U8brQ3Dea2EA/6GsR+ouO1K7BeJTWNzzJKq6ZudDmK+40+E37Z4UTiN91k37eO77fAK1
	Mcwg==
X-Received: by 10.194.82.106 with SMTP id h10mr11633183wjy.115.1405430124987; 
	Tue, 15 Jul 2014 06:15:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ja9sm43715551wic.8.2014.07.15.06.15.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 06:15:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 15:15:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140715131533.GM2433@jama>
References: <1405402285-29775-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1405402285-29775-1-git-send-email-akuster@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] [v3] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 13:15:32 -0000
X-Groupsio-MsgNum: 50954
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XBg9NAhDNArbJUtw"
Content-Disposition: inline

--XBg9NAhDNArbJUtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 10:31:25PM -0700, Armin Kuster wrote:
> update to version r119
> Use github instead of svn
> LICENSE md5sum changed since it was updated in r117
> FIxes CVE-2014-4611

This belongs to oe-core as you have originally posted it :)

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/lz4/{lz4_svn.bb =3D> lz4_git.bb} | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>  rename meta/recipes-support/lz4/{lz4_svn.bb =3D> lz4_git.bb} (68%)
>=20
> diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/l=
z4/lz4_git.bb
> similarity index 68%
> rename from meta/recipes-support/lz4/lz4_svn.bb
> rename to meta/recipes-support/lz4/lz4_git.bb
> index 38e36d8..3978d76 100644
> --- a/meta/recipes-support/lz4/lz4_svn.bb
> +++ b/meta/recipes-support/lz4/lz4_git.bb
> @@ -2,15 +2,12 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
>  DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding compression speed at 400 MB/s per core, scalable with multi-cores CPU=
=2E It also features an extremely fast decoder, with speed in multiple GB/s=
 per core, typically reaching RAM speed limits on multi-core systems."
> =20
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2008d2325e11691e17fcaa3a6046f=
850"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0b0d063f37a4477b54af2459477dc=
afd"
> =20
> -# Upstream names releases after SVN revs
> -SRCREV =3D "112"
> -PV =3D "r${SRCREV}"
> +SRCREV =3D "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
> +SRC_URI=3D "git://github.com/Cyan4973/lz4.git;branch=3Dmaster"
> =20
> -SRC_URI =3D "svn://lz4.googlecode.com/svn/;module=3Dtrunk;protocol=3Dhtt=
p"
> -
> -S =3D "${WORKDIR}/trunk"
> +S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' DESTDIR=3D${D} LIBDIR=
=3D${libdir} INCLUDEDIR=3D${includedir}"
> =20
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

--XBg9NAhDNArbJUtw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPFKXUACgkQN1Ujt2V2gBySsACfRyt5zuXxV6dd6o+vGAL7xFHn
WAYAnjqZz6BGSh23rDoB4Ez58Fqn3GbG
=Zsf2
-----END PGP SIGNATURE-----

--XBg9NAhDNArbJUtw--
