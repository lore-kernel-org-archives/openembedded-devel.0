Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A21F065C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 19:12:29 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y8w1u-000680-9C from Joe_MacDonald@mentor.com ;
	Wed, 07 Jan 2015 11:12:30 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Jan 2015
	11:12:29 -0800
Received: by burninator (Postfix, from userid 1000)	id 09F1358251B; Wed,  7
	Jan 2015 14:12:26 -0500 (EST)
Date: Wed, 7 Jan 2015 14:12:26 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150107191225.GI10013@mentor.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/5] Networking fixes and upgrades
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
X-List-Received-Date: Wed, 07 Jan 2015 19:12:31 -0000
X-Groupsio-MsgNum: 53749
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RD6GsZsdEJvsf78O"
Content-Disposition: inline

--RD6GsZsdEJvsf78O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH 0/5] Networking fixes and upgrades] On 15.01.=
05 (Mon 10:51) Paul Eggleton wrote:

> Fix a couple of issues in the ntp recipe reported by Philip Balister
> (the file locations patch was previously posted separately; this
> version is identical). Also upgrade a few recipes.
>=20
>=20
> The following changes since commit 2ea3a19a478c526baa04d6b9a9e8c9f42aae9d=
34:
>=20
>   ctapi-common: Add new recipe (2014-12-31 16:38:22 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/networking-f=
ixes
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/networking-fixes
>=20
> Paul Eggleton (5):
>   ntp: fix file locations
>   ntp: add explicit perl dependency to ntp-utils package
>   mtr: update to 0.86
>   traceroute: update to 2.0.21
>   dnsmasq: update to 2.72
>=20
>  .../recipes-support/dnsmasq/dnsmasq_2.71.bb        | 10 -------
>  .../recipes-support/dnsmasq/dnsmasq_2.72.bb        | 10 +++++++
>  .../recipes-support/mtr/files/configure.patch      | 12 ---------
>  .../recipes-support/mtr/files/no-gtk.patch         | 31 ----------------=
------
>  .../mtr/{mtr_0.82.bb =3D> mtr_0.86.bb}               | 10 +++----
>  meta-networking/recipes-support/ntp/ntp_4.2.8.bb   | 22 +++++++--------
>  .../{traceroute_2.0.20.bb =3D> traceroute_2.0.21.bb} |  6 ++---
>  7 files changed, 28 insertions(+), 73 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.=
bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.=
bb
>  delete mode 100644 meta-networking/recipes-support/mtr/files/configure.p=
atch
>  delete mode 100644 meta-networking/recipes-support/mtr/files/no-gtk.patch
>  rename meta-networking/recipes-support/mtr/{mtr_0.82.bb =3D> mtr_0.86.bb=
} (51%)
>  rename meta-networking/recipes-support/traceroute/{traceroute_2.0.20.bb =
=3D> traceroute_2.0.21.bb} (89%)
>=20
> --=20
> 1.9.3
>=20
--=20
-Joe MacDonald.
:wq

--RD6GsZsdEJvsf78O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrYUZAAoJEEn8ffcsOfaWKwIH/j49/cyiTdsh9TWDK1omMrb/
uBy2MLpvEpscB3eiJyypMvZiyIabskljQK+eIel9tLjeCR26Ix4OUNWQTeO0UhRP
zHfyd2+SunaokbC00uXU4/2CYRZCMsdv8LFaO/GJLIQ+zW09surJhQmCY7t4Y8cp
Slv/HctqlWgJW29MHDaWt9IcGUGgD1tkyM/Ue10DCSP8ESUBhZnXmsjDCPHhU/ye
FKZgGaHzzn+/aMy8uNE6WooU9Tk+WZE0Gf0sloz2NQxwrpXd0j6MH8k53oE8uGHh
tsGi2QEYvjaHB7Ey7aFdvz6iEJ67Whcc9TCqE2HMzhnISEMiAq8Vr/rcS42lj2c=
=gK+7
-----END PGP SIGNATURE-----

--RD6GsZsdEJvsf78O--
