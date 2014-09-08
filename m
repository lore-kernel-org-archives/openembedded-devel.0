Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9E01F6FE3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Sep 2014 20:29:12 +0000 (UTC)
Received: from svr-orw-fem-02.mgc.mentorg.com ([147.34.96.168])
	by relay1.mentorg.com with esmtp 
	id 1XR5Yn-0001wR-S3 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Sep 2014 13:29:13 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.2.247.3;
	Mon, 8 Sep 2014 13:29:13 -0700
Received: by burninator (Postfix, from userid 1000)	id 02601580CED; Mon,  8
	Sep 2014 16:29:12 -0400 (EDT)
Date: Mon, 8 Sep 2014 16:29:12 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140908202912.GB2125@mentor.com>
References: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
	<1409643577-4088-4-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1409643577-4088-4-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 5/5] meta-networking: Update layer dependency information
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
X-List-Received-Date: Mon, 08 Sep 2014 20:29:15 -0000
X-Groupsio-MsgNum: 52027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH 5/5] meta-networking: Update layer dependency=
 information] On 14.09.02 (Tue 00:39) Khem Raj wrote:

> since python recipes are now spun out into its own layer
> and there are recipes like crda which depend on M2Crypto
> python module, of which the recipe is now moved from meta-oe
> into meta-python, we need to express this change of layers
> otherwise if you are not using meta-python then you end up
> with errors e.g.
>=20
> Nothing PROVIDES 'python-m2crypto-native' (but
> meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> DEPENDS on or otherwise requires it).
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/README          | 8 ++++++--
>  meta-networking/conf/layer.conf | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/README b/meta-networking/README
> index 339d40e..e1ba27d 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -17,17 +17,21 @@ Dependencies
> =20
>  This layer depends on:
> =20
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://github.com/openembedded/openembedded-core.git
>  branch: master
>  revision: HEAD
> =20
>  For some recipes, the meta-oe layer is required:
> =20
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-oe
>  branch: master
>  revision: HEAD
> =20
> +URI: git://github.com/openembedded/meta-openembedded.git
> +subdirectory: meta-python
> +branch: master
> +revision: HEAD
> =20
>  Maintenance
>  -----------
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index 39c2ceb..d99d738 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -14,5 +14,7 @@ BBFILE_PRIORITY_networking-layer =3D "5"
>  LAYERVERSION_networking-layer =3D "1"
> =20
>  LAYERDEPENDS_networking-layer =3D "core"
> +LAYERDEPENDS_networking-layer =3D "openembedded-layer"
> +LAYERDEPENDS_networking-layer =3D "meta-python"
> =20
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDhGYAAoJEEn8ffcsOfaWwzoIAI4dXZ4DEzrbu/5KZ2hIcZTE
sU1v8D7aD0euU0PBSfirczvjvBUw5ZPBMKJgBfvr9DdfhoFn2w7aJclxH5d6l6xO
TOyIrzPFwm7LwXiMVvUVJBqiql/z2AewUFf5KXyP4p9EEKKrof7VZ6t2mez79hpD
07qV/20ches0cUT8yCZsrOMFG+1iLSzg/PbcqqiWrcZ6PwfMKDWtk57ShFLuVxk+
RIuI7n0xFfPb+k3XIsWp5/OSynzwMPa/5D3hoYjQxE17cxTp635efB0tbIdjveNu
hHGqacEQuIYY1rY0EgTEePC61ZMax4QYzdQCU65WEc/r9+l0matyPEo00rms9k0=
=Nxbm
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
