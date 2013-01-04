Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TrDvT-00042C-7W
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 21:32:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r04KGSjw023343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Jan 2013 12:16:28 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 4 Jan 2013 12:16:28 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 941997FCE;
	Fri,  4 Jan 2013 15:14:56 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 61ACF24173; Fri,
	4 Jan 2013 15:16:27 -0500 (EST)
Date: Fri, 4 Jan 2013 15:16:27 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130104201627.GH2874@windriver.com>
References: <1357299205-21120-1-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1357299205-21120-1-git-send-email-andrei.gherzan@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-networking][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
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
X-List-Received-Date: Fri, 04 Jan 2013 20:32:58 -0000
X-List-Received-Date: Fri, 04 Jan 2013 20:32:58 -0000
X-Groupsio-MsgNum: 42495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline

--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] layer.conf: Use .=3D for adding to BBPATH an=
d +=3D to BBFILES] On 13.01.04 (Fri 13:33) Andrei Gherzan wrote:

> Fixes parsing errors which is appearing after this commit to
> meta-openembedded
>=20
> http://cgit.openembedded.org/meta-openembedded/commit/?id=3D3c21a46020bd0=
816579648f684c41dbd6333583e
>=20
> This triggers
> exception NameError: name 'base_contains' is not defined
> without this change
>=20
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  meta-networking/conf/layer.conf |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index f26a172..1ea2bc2 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -1,9 +1,9 @@
>  # We have a conf and classes directory, add to BBPATH
> -BBPATH :=3D "${BBPATH}:${LAYERDIR}"
> +BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a packages directory, add to BBFILES
> -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> - ${LAYERDIR}/recipes-*/*/*.bbappend"
> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> +            ${LAYERDIR}/recipes-*/*/*.bbappend"
> =20
>  BBFILE_COLLECTIONS +=3D "networking"
>  BBFILE_PATTERN_networking :=3D "^${LAYERDIR}/"
--=20
-Joe MacDonald.
:wq

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDnOJsACgkQPN8S4W6ZZnfEogCeOCYaTAzBYu0PGFUdVNJ+CH2h
Y50An2j8ycAzKLmQlT3oqCv0SGhQUAsb
=IMJN
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--
