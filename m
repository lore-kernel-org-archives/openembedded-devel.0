Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UA04d-0005s5-KP
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2013 16:34:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1PFIL6g019536
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2013 07:18:21 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Feb 2013 07:18:21 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C79817FE2;
	Mon, 25 Feb 2013 10:18:06 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 627EA20D5B; Mon,
	25 Feb 2013 10:18:20 -0500 (EST)
Date: Mon, 25 Feb 2013 10:18:20 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <jackie.huang@windriver.com>
Message-ID: <20130225151820.GE4330@windriver.com>
References: <1361769851-28342-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1361769851-28342-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [meta-networking][PATCH] ebtables: move ebtables-save to sbindir to avoid QA issue
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
X-List-Received-Date: Mon, 25 Feb 2013 15:34:44 -0000
X-List-Received-Date: Mon, 25 Feb 2013 15:34:44 -0000
X-Groupsio-MsgNum: 43297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline

--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[meta-networking][PATCH] ebtables: move ebtables-save to sbindir to avoid =
QA issue] On 13.02.25 (Mon 13:24) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Fix the QA issue:
> WARNING: QA Issue: ebtables: Found a reference to /usr/ in
>     /path/to/tmp/work/x86_64-wrs-linux/ebtables-2.0.10-4-r1/packages-spli=
t/ebtables/sbin/ebtables-save
> WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should n=
ot reference anything in exec_prefix
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb=
 b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index bca34c0..d6d803a 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Utility for basic Ethernet frame filtering o=
n a Linux bridge, MAC NAT
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e=
73e"
>  SECTION =3D "console/network"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  RDEPENDS_${PN} +=3D "perl"
> =20
> @@ -44,6 +44,11 @@ do_install () {
>  	# Fix hardcoded paths in scripts
>  	sed -i 's!/sbin/!${base_sbindir}/!g' ${D}/${sysconfdir}/init.d/ebtables
>  	sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/ebtables
> +
> +	# The script ebtables-save refernces perl in exec_prefix, so
> +	# move it to sbindir to avoid QA issue
> +	install -d ${D}/${sbindir}
> +	mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
>  }
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/default/ebtables"
--=20
-Joe MacDonald.
:wq

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlErgLwACgkQPN8S4W6ZZndb5gCeKKgySbzhWy9aprioF0c/0GTz
kZIAniprydjmO1Lx8f+X6fwch1ztSOO3
=Budd
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
