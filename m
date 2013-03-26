Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UKaF5-000668-CK
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 21:13:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QJuBIe012027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 12:56:11 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 26 Mar 2013 12:56:10 -0700
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 411057FD0;
	Tue, 26 Mar 2013 15:55:22 -0400 (EDT)
Received: by skynet (Postfix, from userid 1000)	id 5DE06600A71; Tue, 26 Mar
	2013 15:56:08 -0400 (EDT)
Date: Tue, 26 Mar 2013 15:56:08 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Aws Ismail <aws.ismail@windriver.com>
Message-ID: <20130326195604.GA3692@windriver.com>
References: <1364225407-13263-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1364225407-13263-1-git-send-email-aws.ismail@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2][V3] Quagga: deal with snmp support, and some cleanup.
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
X-List-Received-Date: Tue, 26 Mar 2013 20:13:14 -0000
X-Groupsio-MsgNum: 43743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH  0/2][V3] Quagga: deal with snmp support, and some=
 cleanup.] On 13.03.25 (Mon 11:30) Aws Ismail wrote:

>=20
> *** V3 ***
> Cleanup whitespaces and hardtabs
> This is made a separate new commit
> *** V3 ***
>=20
> Overall, this commit introduces a set of changes to do the following:
>=20
> 1. Update the configure option for quagga to replace the old --enable-tcp=
-md5
> 2. Add snmp support based on DISTRO_FEATURES availability.
> 3. Install sample runtime configuration files for quagga and its daemons.
> 4. Make sure the post install script is executed at the right stage.
>=20
> Aws Ismail (2):
>   Quagga has no snmp support, unrecognized options --enable-tcp-md5
>   Quagga: clean up whitespaces/hardtabs in recipe
>=20
>  .../recipes-protocols/quagga/quagga.inc            |   71 ++++++++++++--=
------
>  1 files changed, 43 insertions(+), 28 deletions(-)

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlFR/VEACgkQPN8S4W6ZZnfwPQCfUd54pSe5neTzvGFoK5B+Kx45
lDMAn3sLqjhzLj0BUcfULC9cdTrCU1vu
=MKN+
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
