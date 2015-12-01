Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DB5F06011D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:34:54 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1a3ntG-00057w-6M from Joe_MacDonald@mentor.com ;
	Tue, 01 Dec 2015 08:34:54 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Tue, 1 Dec 2015
	08:34:53 -0800
Received: by burninator (Postfix, from userid 1000)	id F0F57580F50; Tue,  1
	Dec 2015 11:34:52 -0500 (EST)
Date: Tue, 1 Dec 2015 11:34:52 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <jackie.huang@windriver.com>
Message-ID: <20151201163452.GB4384@mentor.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1447910888.git.jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/7 v2] waf-samba: fix build failure on targets unsupported by qemu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Dec 2015 16:34:56 -0000
X-Groupsio-MsgNum: 58864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jackie,

I tried pulling in this patch set from:

   git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_151119-0

and it quickly crashed into a patching error:

   http://pastebin.com/k6f0M4c3

Did you still want that branch considered for merging?

-J.

[[oe] [meta-networking][PATCH 0/7 v2] waf-samba: fix build failure on targe=
ts unsupported by qemu] On 15.11.19 (Thu 13:37) jackie.huang@windriver.com =
wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> v2 comments:
>=20
> rebase since samba reladted packages are move to meta-networking
> from meta-oe.
>=20
> Comments:
>=20
> samba and required packages started to use waf build
> system since 4.x, and the waf bbclass use qemu user mode
> to help configure checking by default, but not all targets
> are supported by qemu user mode, so it definitely fail on those
> targets (it failed on our fsl_t2xxx and cav-octeon3).
>=20
> The solution here it so use waf cross-answer mode to avoid
> using qemu, but we need to prepare the cross-answers, it's
> easy and error-prone if we try to get these cross-answers manually,
> but fortunately, waf provides another mode to help generate
> them in newer version, so upgrade related packages and
> backport patches for samba (I also tried to upgrad samba
> to 4.3.1, but it still doesn't work in my runtime testing
> after some bug fixing, so I keep in the current version for
> now, I may upgrade it sometime later if I get better understand
> about the new version).
>=20
> Build tested on:
>=20
> intel-x86-64
> qemux86
> qemuarm
> qemuarma9
> qemuarm64
> qemumips
> qemumips64
> fsl-ls20xx
> fsl-t2xxx
> xilinx-zynq
> cav-octeon3
>=20
>=20
> --
> The following changes since commit ea319464b673cbf9a416b582dc4766faeb9984=
30:
>=20
>   vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, d=
v1394, svg, svgdec (2015-11-16 21:50:11 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib jhuang0/d_samba-rebase_151119-0
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/d_samba=
-rebase_151119-0
>=20
> Jackie Huang (7):
>   libtdb: upgrade to 1.3.7
>   libldb: upgrade to 1.1.21
>   libtevent: upgrade to 0.9.25
>   talloc: upgrade to 2.1.3
>   samba: fix the incorrect tmpfiles installed directory
>   samba: backport patches for cross-compiling
>   waf-samba.bbclass: add cross-answers option and files
>=20
>  ...1-waf-sanitize-and-fix-added-cross-answer.patch |  60 ++++++++
>  ...-Adds-a-new-mode-to-samba-cross-compiling.patch | 112 ++++++++++++++
>  ...-readability-of-cross-answers-generated-b.patch |  66 ++++++++
>  ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |  72 +++++++++
>  .../0005-build-unify-and-fix-endian-tests.patch    | 169 +++++++++++++++=
++++++
>  ...006-avoid-using-colon-in-the-checking-msg.patch |  32 ++++
>  ...sing-of-cross-answers-file-in-case-answer.patch |  36 +++++
>  .../recipes-connectivity/samba/samba_4.1.12.bb     |  16 +-
>  .../libldb/{libldb_1.1.17.bb =3D> libldb_1.1.21.bb}  |   4 +-
>  .../libtdb/{libtdb_1.3.0.bb =3D> libtdb_1.3.7.bb}    |   4 +-
>  .../{libtevent_0.9.21.bb =3D> libtevent_0.9.25.bb}   |   4 +-
>  .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}    |  18 +--
>  meta-oe/classes/waf-samba.bbclass                  |  43 +++++-
>  meta-oe/conf/layer.conf                            |   1 +
>  meta-oe/files/waf-cross-answers/README             |   3 +
>  .../waf-cross-answers/cross-answers-aarch64.txt    |  38 +++++
>  .../files/waf-cross-answers/cross-answers-arm.txt  |  39 +++++
>  .../files/waf-cross-answers/cross-answers-i586.txt |  39 +++++
>  .../files/waf-cross-answers/cross-answers-i686.txt |  39 +++++
>  .../files/waf-cross-answers/cross-answers-mips.txt |  39 +++++
>  .../waf-cross-answers/cross-answers-mips64.txt     |  38 +++++
>  .../waf-cross-answers/cross-answers-powerpc.txt    |  39 +++++
>  .../waf-cross-answers/cross-answers-powerpc64.txt  |  39 +++++
>  .../waf-cross-answers/cross-answers-x86_64.txt     |  38 +++++
>  24 files changed, 965 insertions(+), 23 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0001-waf-sanitize-and-fix-added-cross-answer.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0005-build-unify-and-fix-endian-tests.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0006-avoid-using-colon-in-the-checking-msg.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
>  rename meta-networking/recipes-support/libldb/{libldb_1.1.17.bb =3D> lib=
ldb_1.1.21.bb} (92%)
>  rename meta-networking/recipes-support/libtdb/{libtdb_1.3.0.bb =3D> libt=
db_1.3.7.bb} (87%)
>  rename meta-networking/recipes-support/libtevent/{libtevent_0.9.21.bb =
=3D> libtevent_0.9.25.bb} (86%)
>  rename meta-networking/recipes-support/talloc/{talloc_2.1.1.bb =3D> tall=
oc_2.1.3.bb} (69%)
>  create mode 100644 meta-oe/files/waf-cross-answers/README
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-aarch64=
=2Etxt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-arm.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i586.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-i686.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-mips64.=
txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc=
=2Etxt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-powerpc=
64.txt
>  create mode 100644 meta-oe/files/waf-cross-answers/cross-answers-x86_64.=
txt
>=20
--=20
-Joe MacDonald.
:wq

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWXcwsAAoJEEn8ffcsOfaWwkMIANPVwkcpp8vkwyO3iimBwEwm
YGCd9OmE4xn06r+mrd/kjzE+f4RfhBScIA040fduddqG5xOaCUAO7hf243RV+s2w
C7xmAIi9GEXdUqRUr6mTVSZcvzTUw1M909W1qDSkz2XBSkXYZzSva93eWxVWQG3K
zD8CKe1DEqaJVCDHuIBtZLY2xN3T4UmiW6EBm287R5mo2wRlpT6vHTLMTWlGcrxW
aLmZG0X06cY5M1gLGImS9XHhtLtfONpfStDDpVKZm86WV7KK5pwg0DOIOZRo7REK
t5JE33Lpyzj6SAmum5bGlzn0I6fWFENbH4pupa7DE/541emPO06LMGuRPUvCr4o=
=Y6Bg
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
