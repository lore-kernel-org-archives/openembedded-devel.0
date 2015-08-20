Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E38575E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:04:28 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so38750432wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pDqmd+763JiTWRkI/yp7qLKbW+7DG/V6dV1jRArkCCA=;
	b=g4g52v62wouAuKuxgSzTkYY2xxtxcFWkbUaSAFIk4rm0eUgEHsPVwNDpGEksuOJzWp
	/eHQcJQtgMrWXW7uVa4AWf9K1Y2JsdauFSE4pGS50JaGe7Mad5cNVhNeQKMsRvFjsQs/
	ZfTSFlfpHuFiMwAXXpeVZ+2IgQfbHbtT0tP/uoqnTOEFFmCf6t6iYUGt5aH9SAO/r9oh
	BmIYNEvwnr3nTyAkzMF4rL3VSZfV0YXUdQDFhcw+bD+2I3CiHoJ5s62ZoTx7L0FiELzj
	mpZ7IlxXNQa6v+/QtkyW+UTz7YFu30woTaFzq37y+jg5YeAKbWu4RsXJvmz2/1K8/y1F
	9CyA==
X-Received: by 10.194.179.103 with SMTP id df7mr7123095wjc.69.1440083068164;
	Thu, 20 Aug 2015 08:04:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l13sm5959304wjr.18.2015.08.20.08.04.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:04:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:04:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150455.GK2446@jama>
References: <1424786397-5616-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1424786397-5616-1-git-send-email-mario@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-python][PATCH] python-urllib3: add recipe for version 1.10.1
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
X-List-Received-Date: Thu, 20 Aug 2015 15:04:28 -0000
X-Groupsio-MsgNum: 56839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HTLCc13+3hfAZ6SL"
Content-Disposition: inline

--HTLCc13+3hfAZ6SL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2015 at 10:59:57AM -0300, Mario Domenech Goulart wrote:
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  .../recipes-devtools/python/python-urllib3_1.10.1.bb    |   15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-urllib3_1.=
10.1.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb=
 b/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
> new file mode 100644
> index 0000000..89f7428
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Python HTTP library with thread-safe connection pooling, fi=
le post support, sanity friendly, and more"
> +HOMEPAGE =3D "https://github.com/shazow/urllib3"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3be3707c5f24a69709682265e=
29566fe"
> +
> +SRC_URI =3D "https://github.com/shazow/urllib3/archive/${PV}.zip"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).

> +SRC_URI[md5sum] =3D "73935fe42b6ef51d078edbbca7c1bd55"
> +SRC_URI[sha256sum] =3D "5fadd55b46bf826e46a482bb3d53662a8a88d8f9ea8656e3=
51b659b8ad9bfc0f"
> +
> +S =3D "${WORKDIR}/urllib3-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} +=3D "python-netclient"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HTLCc13+3hfAZ6SL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7JYACgkQN1Ujt2V2gBxLNwCeJ8pH9AnwILbxd9pXqbPshJlk
8PcAnjiAKmjiWJothBP/tOt3lb7RGcKL
=ry6W
-----END PGP SIGNATURE-----

--HTLCc13+3hfAZ6SL--
