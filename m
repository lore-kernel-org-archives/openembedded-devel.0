Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TxdmB-0005xm-8X
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 14:20:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0MD504i023983
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 05:05:00 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 22 Jan 2013 05:04:58 -0800
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A71747FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 08:03:06 -0500 (EST)
Received: by skynet (Postfix, from userid 1000)	id EF2F2601301; Tue, 22 Jan
	2013 08:04:44 -0500 (EST)
Date: Tue, 22 Jan 2013 08:04:44 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130122130444.GB14770@windriver.com>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
	<1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-networking][meta-xfce 4/4] autofs: fix QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 13:20:33 -0000
X-Groupsio-MsgNum: 42801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH][meta-oe][meta-networking][meta-xfce 4/4] autofs: fix QA warni=
ngs] On 13.01.22 (Tue 13:20) Martin Jansa wrote:

> autofs-5.0.7: autofs: Files/directories were installed but not shipped
>   /run
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> ---
>  meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index bf679b4..2bf03f1 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -60,4 +60,8 @@ do_configure_prepend () {
>          fi
>  }
> =20
> +do_install_append () {
> +	test -d ${D}/run && rmdir ${D}/run
> +}
> +
>  INSANE_SKIP_${PN} =3D "dev-so"

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlD+jmwACgkQPN8S4W6ZZnekXQCdGIgNb+MRqN3oknR+BZFrJ9tv
aHAAnRruI1viIVTAApMRKHs2sP2mxeuL
=oXKi
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
