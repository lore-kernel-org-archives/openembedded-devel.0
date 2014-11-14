Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA12E6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 11:59:01 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id n3so2470394wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 03:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yj+HdgGmtdZkDs/haECCnQE05s9ul/tfZIjxcN4NdbY=;
	b=SrBibl1EUDQ5NKo82ijgTVn7bsdxElKQx2lENYfIrHclXx6+7NP2lLtrgkxOuwMMrU
	8vhiQQpg9+mdJuHsgPEscDB7hrYVO3hdpcklzKU9FYH7BNoqLXrJ+LylCsII0TZWVYlb
	dj8n31donbLoqKoSIurvOKwENSSkMW1KDscC3bPCj1C9NOe5Pm70kYmULfetZgv0MCzl
	0jXat7dXV8DV1a2deEmzURhAC0Xe3HRBjMLgYAdT9pDx9rXT6muR2Ekg9pfOKlZIYDzu
	xErbCI1ChdN18USRXKASzgH2NihdbFAU983xlido1uB8EeUKuu1cO2lfSaUtz11xougb
	UnPQ==
X-Received: by 10.181.29.74 with SMTP id ju10mr6988723wid.10.1415966341564;
	Fri, 14 Nov 2014 03:59:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq6sm3187796wib.1.2014.11.14.03.59.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 03:59:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 12:59:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141114115906.GC2458@jama>
References: <1415953529-10127-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415953529-10127-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] xrdb: Update to 1.1.0
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
X-List-Received-Date: Fri, 14 Nov 2014 11:59:02 -0000
X-Groupsio-MsgNum: 52879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 04:25:29PM +0800, Qian Lei wrote:
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb | 10 ----------
>  meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb b/meta-oe/re=
cipes-graphics/xorg-app/xrdb_1.0.9.bb
> deleted file mode 100644
> index f258bb2..0000000
> --- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require recipes-graphics/xorg-app/xorg-app-common.inc
> -SUMMARY =3D "X server resource database utility"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd1167c4f586bd41f0c62166db4384=
a69"
> -
> -DEPENDS +=3D "libxmu"
> -PR =3D "r6"
> -
> -SRC_URI[md5sum] =3D "ed2e48cf33584455d74615ad4bbe4246"
> -SRC_URI[sha256sum] =3D "642401e12996efe3e5e5307a245e24c282b94a44c1f147e1=
77c8484b862aeab7"
> diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb b/meta-oe/re=
cipes-graphics/xorg-app/xrdb_1.1.0.bb
> new file mode 100644
> index 0000000..7d60783
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
> @@ -0,0 +1,10 @@
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +SUMMARY =3D "X server resource database utility"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd1167c4f586bd41f0c62166db4384=
a69"
> +
> +DEPENDS +=3D "libxmu"
> +PR =3D "r6"

Will drop PR when cherry-picking.

Please drop PR when you're upgrading version (PV or PE)

> +
> +SRC_URI[md5sum] =3D "b54c7e3e53b4f332d41ed435433fbda0"
> +SRC_URI[sha256sum] =3D "73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641=
698d7dc541ca565b"
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

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl7ooACgkQN1Ujt2V2gBwhFgCgk2FdY2jcAXiJ88dcHMfffv0B
D74AoIrbZ9hsVDZd7kHFf4v62f+rjh/q
=zVsE
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
