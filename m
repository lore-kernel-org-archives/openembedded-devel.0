Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UZlGW-0000so-1R
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 19:01:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r47GhMUM019920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 May 2013 09:43:22 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 7 May 2013 09:43:21 -0700
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 6D30C7FD0;
	Tue,  7 May 2013 12:43:17 -0400 (EDT)
Received: by skynet (Postfix, from userid 1000)	id 68688600426; Tue,  7 May
	2013 12:43:16 -0400 (EDT)
Date: Tue, 7 May 2013 12:43:16 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Aws Ismail <aws.ismail@windriver.com>
Message-ID: <20130507164315.GL16756@windriver.com>
References: <1367863609-18196-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1367863609-18196-1-git-send-email-aws.ismail@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/1] Quagga: sync zebra routing table with the
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
X-List-Received-Date: Tue, 07 May 2013 17:01:34 -0000
X-Groupsio-MsgNum: 44616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UUBKWyapWpFAak7q"
Content-Disposition: inline

--UUBKWyapWpFAak7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH  0/1] Quagga: sync zebra routing table with the] O=
n 13.05.06 (Mon 14:06) Aws Ismail wrote:

> When interface goes down, and there are some static routes that are
> made with ip route, they are going to be deleted from kernel fib.
> That's what kernel does by default. But they are not going to be
> deleted from zebra's fib. They will be declared inactive.
>=20
> This issue was originally discussed in [1] and a patch was proposed.
>=20
> [1] http://www.gossamer-threads.com/lists/quagga/dev/22609
>=20
> Aws Ismail (1):
>   Quagga: sync zebra routing table with the kernel one
>=20
>  ...c-zebra-routing-table-with-the-kernel-one.patch |   48 ++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga.inc            |    3 +-
>  2 files changed, 50 insertions(+), 1 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/Zebra-=
sync-zebra-routing-table-with-the-kernel-one.patch
>=20

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--UUBKWyapWpFAak7q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlGJLyMACgkQPN8S4W6ZZnex7gCePeFoZKyqR4F+fjUVZ4cq+M3t
1TsAn3Ull/2c9Yvqu7gtAPXEPDbopgCK
=s5xo
-----END PGP SIGNATURE-----

--UUBKWyapWpFAak7q--
