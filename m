Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65FCE73772
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:41:05 +0000 (UTC)
Received: by wesp10 with SMTP id p10so16190311wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wtYvdMI93OcRbyL+Zp+B8Snkb8N2hRuKqzNNZXo5Ra8=;
	b=EjE0/PFrFzeLAmZeu6WFqPzk0cp6oZ/O6zGrw60TS1jtXUZL5s0b4JZejcz9Pd+08U
	jv20FuaxjRKKAGJ1lzrLVUGC1XumLDDf1+KwOOBgpytWWBz+s6QESTK0ocLXqZvDm2kU
	4mRZPGaJZRlUB3h0//0pumTTcZbCVlw9InwoX2JLbUNPGxduzckdyK0vOVEoYJHMaICO
	bRN7KDdhAcQbJDyC8xmNu9/OmPQ30poTVCPxzE0ZThxhE7lYp61mFoiutHlNzuB20429
	GChZm/7gPp5Fa0Hk+AiddxsLvx2EjqkH7FphziyVE8rwCXOw/da4almBpTvnNK5SOtRy
	mdTQ==
X-Received: by 10.194.61.51 with SMTP id m19mr25481080wjr.39.1425026465910;
	Fri, 27 Feb 2015 00:41:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m9sm1730379wiz.24.2015.02.27.00.41.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 00:41:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 09:41:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227084124.GI2309@jama>
References: <1423153645-9754-1-git-send-email-fenixk19@mail.ru>
	<1423153645-9754-2-git-send-email-fenixk19@mail.ru>
MIME-Version: 1.0
In-Reply-To: <1423153645-9754-2-git-send-email-fenixk19@mail.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] freetds: add new recipe
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
X-List-Received-Date: Fri, 27 Feb 2015 08:41:10 -0000
X-Groupsio-MsgNum: 54526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline

--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2015 at 07:27:25PM +0300, A. Varnin wrote:
> From: Alexander Varnin <fenixk19@mail.ru>
>=20
> FreeTDS is a set of libraries for Unix and Linux that allows your programs
> to natively talk to Microsoft SQL Server and Sybase databases.

Please fix following QA:
freetds-0.92.79: freetds rdepends on readline, but it isn't a build depende=
ncy? [build-deps]

>=20
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> ---
>  meta-oe/recipes-extended/freetds/freetds_0.92.79.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/freetds/freetds_0.92.79.bb
>=20
> diff --git a/meta-oe/recipes-extended/freetds/freetds_0.92.79.bb b/meta-o=
e/recipes-extended/freetds/freetds_0.92.79.bb
> new file mode 100644
> index 0000000..c7946d1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/freetds/freetds_0.92.79.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "FreeTDS is a set of libraries for Unix and Linux that allow=
s your programs to natively talk to Microsoft SQL Server and Sybase databas=
es."
> +HOMEPAGE =3D "http://www.freetds.org"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b \
> +                    file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605"
> +
> +SRC_URI =3D "ftp://ftp.freetds.org/pub/freetds/stable/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "b97e9bdd3f461af3e8ea559404582f70"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> +
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

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwLbQACgkQN1Ujt2V2gBxcjwCgg8jxyqUa4juJgrxPQ65KscdG
YbwAn32zN1Yyv7cpW/enyYYABBWNoW1F
=wem4
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
