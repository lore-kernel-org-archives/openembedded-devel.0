Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC30720C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:37:56 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so2085533wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1Jck3IZX/FKIjT/4HHtQNIHxzT1DJdCabHXb9q25eZE=;
	b=sQD+gu4aZre2XKAg3A6duBnfHBNbrYoD8FvhmLO0CSd/AW4hqh7VUIshIjx2AEHCbI
	BZO/a+b5oNayPPU5OjN5S8pF0/zJe01VGp2Lyj0V+ABWpEmQRvxOZm1xyQ/Q/PnQgvll
	mOZv0Z9hThTEIJqgmGF5Y7e0+lZCmh55huW4Fey9Oi8Ya53E6OC2wv+boPzU0ihNJj+w
	cj7baKJdCQQyiIJh4OwsEPdg5GLxMvam3iQ8wZ09yRDH+WzELVhQBVdqr6qDe8ZOu5JO
	VsfS9r6U2+6Mf5pVSTBh8jkUMlqgD984kJPm2YHvtfTEsgsEoF4YevgkxMkKImCn7E18
	kURA==
X-Received: by 10.180.76.110 with SMTP id j14mr741324wiw.40.1416407875899;
	Wed, 19 Nov 2014 06:37:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dx8sm2489489wib.2.2014.11.19.06.37.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:37:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:37:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119143756.GH3315@jama>
References: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] tiptop: Add new recipe
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
X-List-Received-Date: Wed, 19 Nov 2014 14:37:58 -0000
X-Groupsio-MsgNum: 52933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Content-Disposition: inline

--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 11:44:05AM +0800, Qian Lei wrote:
> Tiptop is a performance monitoring tool for Linux. It provides a
> dynamic real-time view of the tasks running in the system. Tiptop
> is very similar to the top utility, but most of the information
> displayed comes from hardware counters.
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/tiptop/tiptop_2.2.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
>=20
> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb b/meta-oe/reci=
pes-extended/tiptop/tiptop_2.2.bb
> new file mode 100644
> index 0000000..7f29ef3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Hardware performance monitoring counters"=20
> +HOMEPAGE =3D "http://tiptop.gforge.inria.fr/"=20
> +LICENSE =3D "GPLv2"=20
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"=20
> +DEPENDS =3D "ncurses libxml2"=20
> +
> +SRC_URI =3D "http://tiptop.gforge.inria.fr/releases/tiptop-${PV}.tar.gz"=
=20

tiptop-${PV} -> ${BP}

all lines have trailing spaces

I've fixed both when cherry-picking to master-next

> +SRC_URI[md5sum] =3D "74255a29acf44569db021b080ad3e3f7"=20
> +SRC_URI[sha256sum] =3D "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86=
bed8a16aa96b171d"=20
> +
> +CFLAGS +=3D "-I${STAGING_INCDIR}/libxml2"
> +
> +inherit autotools-brokensep
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

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsq0QACgkQN1Ujt2V2gBxu9QCeOGm+W7ALtKSlmscT0y6W06P3
QzUAoKhycCVPOYWowXd4tzktbAzmf9rO
=fn2o
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
