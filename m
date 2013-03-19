Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHl6Q-0000zA-UZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 02:12:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2J0thT8015187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 17:55:43 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 17:55:43 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id ECB0E7FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 20:55:03 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id D02BE208E6; Mon,
	18 Mar 2013 20:55:40 -0400 (EDT)
Date: Mon, 18 Mar 2013 20:55:40 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130319005540.GA4586@windriver.com>
References: <1363641523-19107-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1363641523-19107-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: Fix build breakage with systemd in DISTRO_FEATURE
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
X-List-Received-Date: Tue, 19 Mar 2013 01:12:37 -0000
X-Groupsio-MsgNum: 43593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] autofs: Fix build breakage with systemd in D=
ISTRO_FEATURE] On 13.03.18 (Mon 14:18) Khem Raj wrote:

> When systemd is in distro features we need to translate it
> into the appropriate PACKAGECONFIG flag

Aw poo.  Thanks, Khem.  Merged.

-J.

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 6cc3b25..7d8cf17 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -51,6 +51,8 @@ CFLAGS +=3D "${LDFLAGS}"
> =20
>  PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> =20
> +PACKAGECONFIG ?=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'syst=
emd', '', d)}"
> +
>  EXTRA_OEMAKE =3D "DONTSTRIP=3D1"
>  EXTRA_OECONF +=3D "--disable-mount-locking \
>                  --enable-ignore-busy --with-openldap=3Dno \
--=20
-Joe MacDonald.
:wq

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHt4cACgkQPN8S4W6ZZnef7ACeKZRyvIJNaucLyjSXMWD+I43h
/CgAnjBSjxD8YaMONgEpT8sVSVqH/Pak
=VISq
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
