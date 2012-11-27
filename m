Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TdREq-00047J-Lw
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 20:54:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qARJe9GE025195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 11:40:09 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 27 Nov 2012 11:40:09 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 517697FCE;	Tue, 27 Nov 2012 14:39:22 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	C26FE6A7E20; Tue, 27 Nov 2012 14:40:08 -0500 (EST)
Date: Tue, 27 Nov 2012 14:40:08 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20121127194008.GD18359@windriver.com>
References: <1354033196-32464-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1354033196-32464-1-git-send-email-eric@eukrea.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Tue, 27 Nov 2012 19:54:37 -0000
X-Groupsio-MsgNum: 41764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH] ntp: fix checksum] On 12.11.27 (Tue 17:19) Eric B=
=E9nard wrote:

> commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to
> a newer version but didn't update the checksum so fetch is failing.
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.6p5.bb
> index f7c5b68..0fce5ce 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> @@ -8,8 +8,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp=
4/ntp-4.2/ntp-${PV}.tar.g
>          file://ntpdate \
>  "
> =20
> -SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> -SRC_URI[sha256sum] =3D "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8=
a02e78be85a7c40e"
> +SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> +SRC_URI[sha256sum] =3D "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23e=
a25ac1405432f91c"
> =20
>  EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"=20
> =20

I didn't merge the patch since the change is included in the updates I
merged from PaulE.

--=20
-Joe MacDonald.
:wq

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC1FxgACgkQPN8S4W6ZZne8dgCfX3HaJ0TvZD9+qDvdWgt6S67X
8/sAniGAi0Asx7SEWkSBNHcWBZ+FcsBl
=YWse
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
