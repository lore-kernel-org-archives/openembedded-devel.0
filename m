Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TdREv-00047Q-Jr
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 20:54:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qARJeREs025251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 11:40:27 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 27 Nov 2012 11:40:26 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 909767FCE	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 14:39:39 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	0D3B86A7E20; Tue, 27 Nov 2012 14:40:26 -0500 (EST)
Date: Tue, 27 Nov 2012 14:40:25 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121127194025.GE18359@windriver.com>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1353602922.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2 0/2] ntp fixes
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
X-List-Received-Date: Tue, 27 Nov 2012 19:54:46 -0000
X-Groupsio-MsgNum: 41765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline

--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2 0/2] ntp fixes] On 12.11.22 (Thu 16:49) Pa=
ul Eggleton wrote:

> Changes since v1:
> * Fix hardcoded paths in scripts
> * Move contents of ntp-bin package to previously empty ntp-utils package
> * Move the ntp server configuration to runtime (/etc/default/ntpdate)
> * Specify configuration files using CONFFILES
> * Remove unused init script path from FILES_ntpdate
>=20
>=20
> The following changes since commit d08ee5a51d4e89ae587d170f8b990626898414=
28:
>=20
>   qt4-embedded: drop bbappend for 4.8.1 (2012-11-22 09:48:36 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/ntp
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/ntp
>=20
> Paul Eggleton (2):
>   ntp: cleanup recipes and fix SSL support
>   ntp: make servers configurable and default to none configured
>=20
>  meta-networking/recipes-support/ntp/files/ntp      |   31 -------
>  meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
>  meta-networking/recipes-support/ntp/files/ntpdate  |   11 ++-
>  .../recipes-support/ntp/files/ntpdate.default      |    7 ++
>  .../recipes-support/ntp/files/openssl-check.patch  |   59 ++++++++++++
>  .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 ---
>  meta-networking/recipes-support/ntp/ntp.inc        |   94 ++++++++++++++=
++----
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   44 +--------
>  8 files changed, 154 insertions(+), 105 deletions(-)
>  delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
>  create mode 100644 meta-networking/recipes-support/ntp/files/ntpdate.def=
ault
>  create mode 100644 meta-networking/recipes-support/ntp/files/openssl-che=
ck.patch
>  delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
>=20

Merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC1FykACgkQPN8S4W6ZZneJtgCeP+dNVh8WPwkkTKN3XmpqL2q0
bMAAnR1uH1d825QqelZfVHp4bfWZjQlp
=y/ie
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
