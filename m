Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHfvg-0007U1-90
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 20:41:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2IJOIw1019264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2013 12:24:18 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 12:24:17 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 496B37FE2;
	Mon, 18 Mar 2013 15:23:39 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 3F03E2264E; Mon,
	18 Mar 2013 15:24:17 -0400 (EDT)
Date: Mon, 18 Mar 2013 15:24:17 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Message-ID: <20130318192416.GF14025@windriver.com>
References: <1362025894-15350-1-git-send-email-sen.zhang@windriver.com>
	<CAMKF1spjo1JxeZd1yJGi4uq2cTp84R3eFrGWZCgPYM12VqQRWw@mail.gmail.com>
	<512EFE76.8060407@windriver.com>
MIME-Version: 1.0
In-Reply-To: <512EFE76.8060407@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] pptp-linux: Add dependency to fix parallel build
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
X-List-Received-Date: Mon, 18 Mar 2013 19:41:26 -0000
X-Groupsio-MsgNum: 43591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Content-Disposition: inline

--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] pptp-linux: Add dependency to fix parall=
el build] On 13.02.28 (Thu 14:51) Jesse Zhang wrote:

> On 02/28/2013 02:23 PM, Khem Raj wrote:
> > On Wed, Feb 27, 2013 at 8:31 PM, Jesse Zhang <sen.zhang@windriver.com> =
wrote:
> >> CQID: WIND00405538
> >=20
> > what is this ?
>=20
> Ah, sorry. Sent from the wrong branch. That's our internal tracking code.

Okay, merged this version.

Thanks Jesse.

-J.

>=20
> See below for the patch with corrected message.
>=20
> jesse
>=20
> From 908296fa5f2bd89c110b1ba072248305b28c3fb6 Mon Sep 17 00:00:00 2001
> From: Jesse Zhang <sen.zhang@windriver.com>
> Date: Wed, 27 Feb 2013 17:27:12 +0800
> Subject: [PATCH] pptp-linux: Add dependency to fix parallel build
>=20
> Add dependency on the generated config.h file for pptp.c and version.c.
>=20
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
>  .../pptp-linux-1.7.2/fix-parallel-build.patch         | 19 +++++++++++++=
++++++
>  recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb      |  6 ++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-par=
allel-build.patch
>=20
> diff --git a/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-b=
uild.patch b/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-bui=
ld.patch
> new file mode 100644
> index 0000000..77722b0
> --- /dev/null
> +++ b/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.pa=
tch
> @@ -0,0 +1,19 @@
> +pptp.c and version.c depend on config.h
> +
> +Upstream-Status: Backport
> +
> +Upstream has already similar fixes. Will be available on next release.
> +
> +Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> +
> +--- a/Makefile	2013-02-27 17:09:24.431226665 +0800
> ++++ b/Makefile	2013-02-27 17:09:03.442075550 +0800
> +@@ -43,6 +43,8 @@
> + pptpsetup.8: pptpsetup
> + 	pod2man $? > $@
> +=20
> ++pptp.o version.o: config.h
> ++
> + config.h:=20
> + 	echo "/* text added by Makefile target config.h */" > config.h
> + 	echo "#define PPTP_LINUX_VERSION \"$(VERSION)$(RELEASE)\"" >> config.h
> diff --git a/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/recipes-p=
rotocols/pptp-linux/pptp-linux_1.7.2.bb
> index ac3f8f6..c173af4 100644
> --- a/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> +++ b/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> @@ -9,10 +9,12 @@ SECTION =3D "network"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar=
=2Egz \
> -           file://options.pptp"
> +           file://options.pptp \
> +           file://fix-parallel-build.patch \
> +           "
> =20
>  SRC_URI[md5sum] =3D "4c3d19286a37459a632c7128c92a9857"
>  SRC_URI[sha256sum] =3D "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7=
d9a445b8d37694bc"
--=20
-Joe MacDonald.
:wq

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHaeAACgkQPN8S4W6ZZncdYwCdE/L3k3ylVrJG1OHSi0mlGpHm
IMcAn2ZqVlHBXImKiaT2V6sp1GkwC1x8
=Syh6
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
