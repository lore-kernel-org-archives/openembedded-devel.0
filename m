Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id ED77772521
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:07:37 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y5gbK-0003wl-Hn from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Dec 2014 12:07:38 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 12:07:37 -0800
Received: by burninator (Postfix, from userid 1000)	id C34AE5810B3; Mon, 29
	Dec 2014 15:07:31 -0500 (EST)
Date: Mon, 29 Dec 2014 15:07:31 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141229200731.GE4672@mentor.com>
References: <cover.1419546494.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1419546494.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 0/1] ntp upgrade (including security fixes)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 20:07:40 -0000
X-Groupsio-MsgNum: 53516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Paul.
-J.

[[oe] [meta-networking][PATCH 0/1] ntp upgrade (including security fixes)] =
On 14.12.25 (Thu 22:29) Paul Eggleton wrote:

> The following change since commit edcf03b5fb576dbeae3784471aec8c2b7a9a04a=
8:
>=20
>   eggdbus: port from openembedded. (2014-12-17 13:11:57 +0100)
>=20
> is available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/ntp-upgrade
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/ntp-upgrade
>=20
> Paul Eggleton (1):
>   ntp: upgrade to 4.2.8
>=20
>  .../recipes-support/ntp/files/CVE-2013-5211.patch  | 112 --------------
>  .../recipes-support/ntp/files/openssl-check.patch  |  59 --------
>  .../recipes-support/ntp/files/tickadj.c.patch      |  32 ----
>  .../ntp/{files =3D> ntp}/ntp-4.2.4_p6-nano.patch     |   0
>  .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  | 168 +++++++++++++++=
++++++
>  .../recipes-support/ntp/{files =3D> ntp}/ntp.conf    |   0
>  .../recipes-support/ntp/{files =3D> ntp}/ntpd        |   0
>  .../recipes-support/ntp/{files =3D> ntp}/ntpdate     |   0
>  .../ntp/{files =3D> ntp}/ntpdate.default             |   0
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   6 -
>  .../recipes-support/ntp/{ntp.inc =3D> ntp_4.2.8.bb}  |  41 ++---
>  11 files changed, 191 insertions(+), 227 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/ntp/files/CVE-2013-52=
11.patch
>  delete mode 100644 meta-networking/recipes-support/ntp/files/openssl-che=
ck.patch
>  delete mode 100644 meta-networking/recipes-support/ntp/files/tickadj.c.p=
atch
>  rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntp-4.2.4_p6=
-nano.patch (100%)
>  create mode 100644 meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp=
-keygen-no-openssl.patch
>  rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntp.conf (10=
0%)
>  rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpd (100%)
>  rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpdate (100=
%)
>  rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpdate.defa=
ult (100%)
>  delete mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
>  rename meta-networking/recipes-support/ntp/{ntp.inc =3D> ntp_4.2.8.bb} (=
81%)
>=20
> --=20
> 1.9.3
>=20
--=20
-Joe MacDonald.
:wq

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUobSDAAoJEEn8ffcsOfaWETwH/3oG5REMK/KWxnPzsiI3jOLv
jYiCR60jrgO0pY0XPwwfwMb7syA/UaKkn2uSvgqzMaMSXldpzEwWgcG9Be+G+29L
MsKSZGb6blcxycPFBCYPF5TyRjDWRbTYYuskTL2EIVgmvjLPdNADtDaPMflJHXLv
c14v9YvhXM/eJdrtUXZGxP2WI6kH5f2u6bECuEivpg9DR9v19JxnSTbIv3dpFfkJ
rm0C2D1Ww00fG4mOXSZWB/PUeRlpZpFM4OVPakB/KOJKlHl2iPkVJaC0xjkhkF5J
q0yYN7eaTp+ZvvkMdaqkK7duRbqFymbgyv4caTolT0wrwzfniEg2gVE26nXzCuM=
=lE1G
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
