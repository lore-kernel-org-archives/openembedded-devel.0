Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BBDA0710C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 14:33:58 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XRMUZ-00027i-PR from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 07:33:59 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 9 Sep 2014 07:33:59 -0700
Received: by burninator (Postfix, from userid 1000)	id AE3225814C3; Tue,  9
	Sep 2014 10:33:58 -0400 (EDT)
Date: Tue, 9 Sep 2014 10:33:58 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909143358.GI2125@mentor.com>
References: <1410246680-19344-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1410246680-19344-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking] dnsmasq: uprev it to 2.71
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
X-List-Received-Date: Tue, 09 Sep 2014 14:34:09 -0000
X-Groupsio-MsgNum: 52047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Content-Disposition: inline

--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.

-J.

[[oe] [PATCH][meta-networking] dnsmasq: uprev it to 2.71] On 14.09.09 (Tue =
15:11) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Update lua.patch
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq/lua.patch      |   21 ++++++++++----=
------
>  .../recipes-support/dnsmasq/dnsmasq_2.68.bb        |    9 ---------
>  .../recipes-support/dnsmasq/dnsmasq_2.71.bb        |    9 +++++++++
>  3 files changed, 19 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.=
bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.=
bb
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/=
meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
> index aac7b97..06d15fe 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
> @@ -1,16 +1,15 @@
>  Upstream-status: Inappropriate [OE specific]
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -
>  --- dnsmasq-2.68.orig/Makefile	2014-08-11 09:05:17.000000000 -0700
>  +++ dnsmasq-2.68/Makefile	2014-08-11 09:05:51.930648617 -0700
>  @@ -57,8 +57,8 @@
> - idn_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_=
CONFIG) --libs libidn`=20
> - ct_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK =
$(PKG_CONFIG) --cflags libnetfilter_conntrack`
> - ct_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK =
$(PKG_CONFIG) --libs libnetfilter_conntrack`
> --lua_cflags =3D  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --cflags lua5.1`=20
> --lua_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --libs lua5.1`=20
> -+lua_cflags =3D  `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --cflags lua`
> -+lua_libs =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --libs lua`
> - sunos_libs =3D  `if uname | grep SunOS >/dev/null 2>&1; then echo -lsoc=
ket -lnsl -lposix4; fi`
> - version =3D     -DVERSION=3D'\"`$(top)/bld/get-version $(top)`\"'
> -=20
> + idn_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PK=
G_CONFIG) --libs libidn`=20
> + ct_cflags =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRAC=
K $(PKG_CONFIG) --cflags libnetfilter_conntrack`
> + ct_libs =3D       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRAC=
K $(PKG_CONFIG) --libs libnetfilter_conntrack`
> +-lua_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIP=
T $(PKG_CONFIG) --cflags lua5.1`=20
> +-lua_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIP=
T $(PKG_CONFIG) --libs lua5.1`=20
> ++lua_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIP=
T $(PKG_CONFIG) --cflags lua`=20
> ++lua_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIP=
T $(PKG_CONFIG) --libs lua`=20
> + nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $=
(PKG_CONFIG) --cflags nettle hogweed`
> + nettle_libs =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $=
(PKG_CONFIG) --libs nettle hogweed`
> + gmp_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $=
(PKG_CONFIG) --copy -lgmp`
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> deleted file mode 100644
> index 61b94a0..0000000
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require dnsmasq.inc
> -
> -SRC_URI +=3D "\
> -    file://parallel-make.patch \
> -    file://lua.patch \
> -"
> -
> -SRC_URI[dnsmasq-2.68.md5sum] =3D "6f8351ca0901f248efdb81532778d2ef"
> -SRC_URI[dnsmasq-2.68.sha256sum] =3D "402019d61f53f1ccc04cc6218719fd3b158=
ea3fca9a83ab55471f981a2097c2f"
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
> new file mode 100644
> index 0000000..48d9bbf
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
> @@ -0,0 +1,9 @@
> +require dnsmasq.inc
> +
> +SRC_URI +=3D "\
> +    file://parallel-make.patch \
> +    file://lua.patch \
> +"
> +
> +SRC_URI[dnsmasq-2.71.md5sum] =3D "15a68f7f6cc0119e843f67d2f79598f1"
> +SRC_URI[dnsmasq-2.71.sha256sum] =3D "7d8c64f66a396442e01b639df3ea6b4e02b=
a88cbe206c80be8de68b6841634c4"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDw/WAAoJEEn8ffcsOfaWMuoIAMFiokV8shC2H9q3Ik0zy+qi
FIRsLRtfUL40VIaLVVVBlcBkrIvvXdl6fPFuFUEJWnlplLAKKoOzEaUdXrkA9KXb
fcOuyKelHvJDdtlvZZ7RY+hwkkx2T2/N6PToYUEtZdx6Q739rsGheohKV7jOUjjm
GwDxei45md1GraSZxbi0rzxff9MiVIeKtSIH5ueeZHC24rt0gH4OZIcJUnNqMSzJ
HxXNx2y15yr/wP0EAReewwMAFw2Lnc99zpG9GvLqfz45VFi+LBpDNFpmxlojffOl
EfJds4QwLpKo42pGhVewoXc0dd5ewgPATOhOF5EwNzEOjAqx685PI0+hMfeEmL4=
=/BWS
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
