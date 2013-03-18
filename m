Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHfuL-0007K1-7B
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 20:39:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2IJMt9X010235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2013 12:22:55 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 12:22:55 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 2B9F47FE2;
	Mon, 18 Mar 2013 15:22:17 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 10CC622641; Mon,
	18 Mar 2013 15:22:54 -0400 (EDT)
Date: Mon, 18 Mar 2013 15:22:54 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130318192254.GD14025@windriver.com>
References: <1362994719-12276-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362994719-12276-1-git-send-email-wenzong.fan@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: wfan@windriver.com
Subject: Re: [PATCH] meta-networking: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 18 Mar 2013 19:39:50 -0000
X-Groupsio-MsgNum: 43589
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline

--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH] meta-networking: Add LAYERVERSION and LAYERDEPENDS] On 13.03.=
11 (Mon 17:38) wenzong.fan@windriver.com wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Add LAYERVERSION and LAYERDEPENDS to layer.conf
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-networking/conf/layer.conf |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index 1ea2bc2..f75080a 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -9,3 +9,8 @@ BBFILE_COLLECTIONS +=3D "networking"
>  BBFILE_PATTERN_networking :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_networking =3D "5"
> =20
> +# This should only be incremented on significant changes that will
> +# cause compatibility issues with other layers
> +LAYERVERSION_networking =3D "1"
> +
> +LAYERDEPENDS_networking =3D "core"

I went ahead and merged this piece since on the whole it makes things
better by being there.  I'll take another patch for Paul's suggestion
whenever it's available.

--=20
-Joe MacDonald.
:wq

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHaY4ACgkQPN8S4W6ZZnewcwCdGdUoR2WVDqjR1vXxvWzZ8aKv
QZ8AnjmCjvdcG0kSABvG9PmxgNlLFCYf
=s/Vs
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
