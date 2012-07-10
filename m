Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SoWwK-0007H5-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2012 11:41:04 +0200
Received: by bkcik5 with SMTP id ik5so6396171bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2012 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=KHuHIhLFPkYVzu/snLWGeOPRH4wW+m3gY91orZFYFe8=;
	b=VrKuFFJbKWpW6/B65lkOw9ELLR2nlLYCXmX68M6Xy92OjZ3XVSeXaDVlPT0WFZ0lBD
	1ocdpOSdUf28RKWXmhJCKpvEANnnD7KdNTYUUWeOLnj2V9d/CCDOT+OqqmMEmqkngSIb
	ZF0pXR2BNsxr/FoiMX/zxQeeyIPmSYgDnvHmjr7SY8OEcyUmVzFv5DcW8Rt3Rsuo7EQo
	Bk8hydFpG6jgLN1K2CItfTUtqhIh33Oft/FoBDZL8vlQbdHpm+FaAWLEBf/X7Mm2nWWx
	odX4if/Oz/+gIOir3keTu9OySJBtqyvpsGxUpFXcS8ItGzVJMtqN2tc7Kv/9z+XHEcpE
	yyhQ==
Received: by 10.205.122.147 with SMTP id gg19mr17423511bkc.73.1341912593872;
	Tue, 10 Jul 2012 02:29:53 -0700 (PDT)
Received: from oliver-linux (79-245.193-178.cust.bluewin.ch. [178.193.245.79])
	by mx.google.com with ESMTPS id
	hs2sm27723857bkc.1.2012.07.10.02.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 02:29:52 -0700 (PDT)
Date: Tue, 10 Jul 2012 02:29:49 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120710092949.GE5053@oliver-linux>
References: <cover.1341438914.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/14][2011.03-maintenance] Pull request 20120705
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
X-List-Received-Date: Tue, 10 Jul 2012 09:41:04 -0000
X-Groupsio-MsgNum: 39528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline

--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 07:39:18PM +0200, Apelete Seketeli wrote:
> Hello,
>=20
> The patches that come as a follow-up of this message fix build issues
> for the muffinman-image recipe. This is the result of rebasing them
> from master and testing that the recipes still build.
> Please pull this commit into 2011.03-maintenance branch.
>=20
> The following changes since commit 19af5b608b3c69dcd73501402fdba3ca2d16e7=
b2:
>=20
>   classes/mirrors.bbclass: update debian snapshot mirror url (2012-06-19 =
07:52:20 -0700)
>=20
> are available in the git repository at:
>=20
>   git://seketeli.net/~apelete/oe.git muffinman-image-fix
>=20
> Apelete Seketeli (14):
>   opkg-utils: rebase on oe-core recipe
>   util-linux-ng: update SRC_URI to kernel.org valid URI
>   libecj-bootstrap_3.6.1: Update SRC_URI to archive.eclipse.org
>   udev/acl_2.2.49: update recipe SRC_URI
>   udev/attr_2.4.44: update recipe SRC_URI
>   udev: update SRC_URI of multiple recipes
>   task-muffinman: remove phoneme-advanced-foundation
>   bluez4_4.42: update checksum values
>   gtk+: Rebase gtk+-2.20.1/no-demos.patch
>   gtk+: Add no-test-inline-pixbufs.patch to gtk+-2.20.1
>   openssl_1.0.0e: fix build issue for hosts without ipv6
>   xcursor-transparent-theme_0.1.1: update SRC_URI
>   echinus_0.4.3.2: update SRC_URI
>   psplash: convert from svn.o-hand.com to git.yoctoproject.org
>=20
>  recipes/bluez/bluez4_4.42.bb                       |    4 +-
>  recipes/echinus/echinus_0.4.3.2.bb                 |    2 +-
>  recipes/ecj/libecj-bootstrap_3.6.1.bb              |    2 +-
>  recipes/gtk+/gtk+-2.20.1/no-demos.patch            |    7 +--
>  .../gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch  |   22 ++++++++
>  recipes/gtk+/gtk+_2.20.1.bb                        |    1 +
>  recipes/openssl/openssl.inc                        |    5 +-
>  .../opkg-utils/index-ignore-filenotfound.patch     |   54 --------------=
------
>  recipes/opkg-utils/opkg-utils/mtime-int.patch      |   27 ----------
>  .../{opkg-utils_svn.bb =3D> opkg-utils_git.bb}       |   19 +++----
>  ...ash-angstrom_svn.bb =3D> psplash-angstrom_git.bb} |    5 +-
>  ...plash-kaeilos_svn.bb =3D> psplash-kaeilos_git.bb} |    6 +--
>  ...3pandora_svn.bb =3D> psplash-omap3pandora_git.bb} |    5 +-
>  .../{psplash-ti_svn.bb =3D> psplash-ti_git.bb}       |    5 +-
>  recipes/psplash/psplash.inc                        |    8 +--
>  recipes/psplash/{psplash_svn.bb =3D> psplash_git.bb} |    5 +-
>  recipes/tasks/task-muffinman.bb                    |    2 +-
>  recipes/udev/acl_2.2.49.bb                         |    2 +-
>  recipes/udev/attr_2.4.44.bb                        |    2 +-
>  recipes/udev/udev_151.bb                           |    2 +-
>  recipes/udev/udev_154.bb                           |    2 +-
>  recipes/udev/udev_162.bb                           |    2 +-
>  recipes/udev/udev_165.bb                           |    2 +-
>  recipes/util-linux-ng/util-linux-ng.inc            |    2 +-
>  .../xcursor-transparent-theme_0.1.1.bb             |    2 +-
>  25 files changed, 68 insertions(+), 127 deletions(-)
>  create mode 100644 recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
>  delete mode 100644 recipes/opkg-utils/opkg-utils/index-ignore-filenotfou=
nd.patch
>  delete mode 100644 recipes/opkg-utils/opkg-utils/mtime-int.patch
>  rename recipes/opkg-utils/{opkg-utils_svn.bb =3D> opkg-utils_git.bb} (44=
%)
>  rename recipes/psplash/{psplash-angstrom_svn.bb =3D> psplash-angstrom_gi=
t.bb} (85%)
>  rename recipes/psplash/{psplash-kaeilos_svn.bb =3D> psplash-kaeilos_git.=
bb} (77%)
>  rename recipes/psplash/{psplash-omap3pandora_svn.bb =3D> psplash-omap3pa=
ndora_git.bb} (85%)
>  rename recipes/psplash/{psplash-ti_svn.bb =3D> psplash-ti_git.bb} (86%)
>  rename recipes/psplash/{psplash_svn.bb =3D> psplash_git.bb} (84%)

Merged to 2011.03-maintenance, thanks!

--=20
Tom

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk/79g0ACgkQdZngf2G4WwN2rQCgiPfOC0zknFpgMWkU+wWZMcgu
3z0AmwZf4C54MJ0IPfcvvJ5dFRX1AV43
=WgQK
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
