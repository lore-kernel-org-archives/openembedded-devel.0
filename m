Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1U2Osl-0007Q1-Ps
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 17:27:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r14GBAOr020029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2013 08:11:10 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 4 Feb 2013 08:11:09 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 0B83E7FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2013 11:09:03 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 26D5D20475; Mon,
	4 Feb 2013 11:11:09 -0500 (EST)
Date: Mon, 4 Feb 2013 11:11:09 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130204161108.GO14746@windriver.com>
References: <3825> <1359697678-31822-1-git-send-email-yanjun.zhu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1359697678-31822-1-git-send-email-yanjun.zhu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] When do_compile, netcat-openbsd needs the dependence of glib-2.0.
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
X-List-Received-Date: Mon, 04 Feb 2013 16:27:10 -0000
X-Groupsio-MsgNum: 42981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uX2tiToO0oGq+LKk"
Content-Disposition: inline

--uX2tiToO0oGq+LKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] When do_compile, netcat-openbsd needs the de=
pendence of glib-2.0.] On 13.02.01 (Fri 13:47) yanjun.zhu wrote:

> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>=20
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>  meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.b=
b b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> index f83caee..25cbfa6 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> @@ -2,7 +2,9 @@ require netcat.inc
>  DESCRIPTION =3D "OpenBSD Netcat"
>  HOMEPAGE =3D "http://ftp.debian.org"
>  LICENSE =3D "BSD-3-Clause"
> -PR =3D "r0"
> +PR =3D "r1"
> +
> +DEPENDS +=3D "glib-2.0"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.=
orig.tar.gz;name=3Dnetcat \
>             ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.=
diff.gz;name=3Dnetcat-patch"

Merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--uX2tiToO0oGq+LKk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEP3ZwACgkQPN8S4W6ZZneErACdGmWEC14Rmgxie+VrCtHDu4iH
2nAAnj+9rCq0jRHHnwXq0egwOA5qBINi
=09PQ
-----END PGP SIGNATURE-----

--uX2tiToO0oGq+LKk--
