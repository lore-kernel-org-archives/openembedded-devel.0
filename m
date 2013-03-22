Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UJ7Hy-0004sR-QL
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 20:06:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2MInB95012531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 11:49:11 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 22 Mar 2013 11:49:11 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id CE74C7FD0;
	Fri, 22 Mar 2013 14:48:27 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4FBE720017; Fri,
	22 Mar 2013 14:49:10 -0400 (EDT)
Date: Fri, 22 Mar 2013 14:49:10 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Aws Ismail <aws.ismail@windriver.com>
Message-ID: <20130322184910.GL10961@windriver.com>
References: <1363892721-25929-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1363892721-25929-1-git-send-email-aws.ismail@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/1][V2] Quagga has no snmp support, unrecognized options --enable-tcp-md5
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
X-List-Received-Date: Fri, 22 Mar 2013 19:06:10 -0000
X-Groupsio-MsgNum: 43696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJI8q/aziP9idhqk"
Content-Disposition: inline

--vJI8q/aziP9idhqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH  0/1][V2] Quagga has no snmp support, unrecognized=
 options --enable-tcp-md5] On 13.03.21 (Thu 15:05) Aws Ismail wrote:

> *** V2 ***
> Fix typo in the SNMP CONF line
> *** V2 ***
>=20
> This commit introduces a set of changes to do the following:
>=20
> 1. Update the configure option for quagga to replace the old --enable-tcp=
-md5
> 2. Add snmp support based on DISTRO_FEATURES availability.
> 3. Install sample runtime configuration files for quagga and its daemons.
> 4. Make sure the post install script is executed at the right stage.
>=20
>=20
> Aws Ismail (1):
>   Quagga has no snmp support, unrecognized options --enable-tcp-md5
>=20
>  .../recipes-protocols/quagga/quagga.inc            |   23 ++++++++++++++=
++---
>  1 files changed, 19 insertions(+), 4 deletions(-)

Hey Aws,

I hate to send this back for a v3 just for this, but since you're right
there fixing stuff, can you also clean up the inconsistent use of hard
tabs and spaces in the recipe?  Probably best to do that as a separate
commit, so it's clear what you're actually changing and what's purely
cosmetic.

--=20
-Joe MacDonald.
:wq

--vJI8q/aziP9idhqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFMp6UACgkQPN8S4W6ZZnciGACeOY5Ds5W6KvyoSJX7ekoErskQ
y0IAmwZwabvrXUhCdwOO3TAhp3tzLNwE
=DdfI
-----END PGP SIGNATURE-----

--vJI8q/aziP9idhqk--
