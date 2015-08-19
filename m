Return-Path: <joe@deserted.net>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5384173CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:58:41 +0000 (UTC)
Received: by iodv127 with SMTP id v127so22046768iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 12:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=u7wmChimEFPK9QbuKudR6kKqmmeZajHzDenYa4AzWRo=;
	b=givgpexbKsULwmfA7UM//eV+AdWGpF5zzZj71FL90ce6AWUD3X12fJsLZebhNxg3Pz
	GS/Z9R3Tr0q96PiMBk0krmPzDTKQMGqLcGVI6uY5uoA0dXjO52RJ6fHCgpG5iBaUgo8o
	0ZPR/TOGchiHSqdpcE/ayEcx49UV4F/ZaZCo5EZKtNOOQJGpFSnaYGpzVAnPH8jXmZQH
	i5OfAARP9UmwQOoQZmfSj5PKFOnvpe+y3DFlJmVvNn6BYaXDVH6xnL6q8MFwsho+A8Wq
	CSCkvwdD1EhyxRPi2X4h/6pVzDvWpvmmb8VwHhv8Bw7owekGNTllMe/pdytDGJXBWScY
	ycbw==
X-Gm-Message-State: ALoCoQkOAuBef82QLMjjPrAfFf+oYPUFOWCOrMSe1AkH2UiTrcmVVo8X9nNsFjeR4uXSaCIakEIY
X-Received: by 10.107.137.208 with SMTP id t77mr14085412ioi.2.1440014321671;
	Wed, 19 Aug 2015 12:58:41 -0700 (PDT)
Received: from deserted.net ([23.233.31.74]) by smtp.gmail.com with ESMTPSA id
	ht6sm1430910igb.11.2015.08.19.12.58.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 12:58:20 -0700 (PDT)
Date: Wed, 19 Aug 2015 15:57:31 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150819195731.GB5444@deserted.net>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4
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
X-List-Received-Date: Wed, 19 Aug 2015 19:58:42 -0000
X-Groupsio-MsgNum: 56812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.12 (Wed =
10:05) kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade inetutils from 1.9.2 to 1.9.4.

You don't appear to be working against the meta-openembedded tree on
this, I got a merge conflict on:

> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connec=
tivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/telnetd-Fix-deadlock-on-cleanup.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnet=
d-Fix-deadlock-on-cleanup.patch

Which, after a bit of head-scratching, suggests your tree has this patch
merged:

http://patchwork.openembedded.org/patch/96727/

but, based on this discussion (also recorded in patchwork):

http://comments.gmane.org/gmane.comp.handhelds.openembedded/69654

we rejected it.

Anyway, I've resolved it and am merging the result.  Please try to
ensure you're working on the current up-stream tree, though.

-J.

>=20
> * add homepage
> * update inetutils/version.patch
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/fix-disable-ipv6.patch  |=
 0
>  ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch | 0
>  .../{inetutils-1.9.2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch    |=
 0
>  .../inetutils-1.9-PATH_PROCNET_DEV.patch                             | 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rexec.xinetd.inetutils  |=
 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rlogin.xinetd.inetutils |=
 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rsh.xinetd.inetutils    |=
 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/telnet.xinetd.inetutils |=
 0
>  .../telnetd-Fix-deadlock-on-cleanup.patch                            | 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/tftpd.xinetd.inetutils  |=
 0
>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/version.patch           |=
 2 +-
>  .../inetutils/{inetutils_1.9.2.bb =3D> inetutils_1.9.4.bb}             |=
 5 +++--
>  12 files changed, 4 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/fix-disable-ipv6.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GL=
IBC__.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/inetutils-1.8-0003-wchar.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/rexec.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/rlogin.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/rsh.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/telnet.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/tftpd.xinetd.inetutils (100%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 =
=3D> inetutils}/version.patch (93%)
>  rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.2.b=
b =3D> inetutils_1.9.4.bb} (97%)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/fix-disable-ipv6.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/fix-disable-ipv6.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix-di=
sable-ipv6.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch=
 b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0=
001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetut=
ils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/=
inetutils/inetutils/inetutils-1.8-0003-wchar.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/inetutils-1.8-0003-wchar.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetut=
ils-1.8-0003-wchar.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connect=
ivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/inetutils-1.9-PATH_PROCNET_DEV.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetut=
ils-1.9-PATH_PROCNET_DEV.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/rexec.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/rexec.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rexec.=
xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils/rlogin.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/rlogin.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlogin=
=2Exinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/=
inetutils/rsh.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/rsh.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xi=
netd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils/telnet.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/telnet.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnet=
=2Exinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connec=
tivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/telnetd-Fix-deadlock-on-cleanup.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnet=
d-Fix-deadlock-on-cleanup.patch
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/tftpd.xinetd.inetutils
> similarity index 100%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/tftpd.xinetd.inetutils
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.=
xinetd.inetutils
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetuti=
ls/version.patch
> similarity index 93%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.=
2/version.patch
> rename to meta-networking/recipes-connectivity/inetutils/inetutils/versio=
n.patch
> index 1caa2d3..532a0e5 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/vers=
ion.patch
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version.pa=
tch
> @@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
>  =20
>  -AC_INIT([GNU inetutils],
>  - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v=
/;s/_/./g']),
> -+AC_INIT([GNU inetutils],[1.9.2],
> ++AC_INIT([GNU inetutils],[1.9.4],
>    [bug-inetutils@gnu.org])
>  =20
>   AC_CONFIG_SRCDIR([src/inetd.c])
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> similarity index 97%
> rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9.=
2.bb
> rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.=
bb
> index 6209272..cdcba83 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of co=
mmon \
>  networking utilities and servers including ftp, ftpd, rcp, \
>  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> +HOMEPAGE =3D "http://www.gnu.org/software/inetutils"
>  SECTION =3D "net"
>  DEPENDS =3D "ncurses netbase readline"
>  LICENSE =3D "GPLv3"
> @@ -21,8 +22,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.gz \
>             file://telnetd-Fix-deadlock-on-cleanup.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> -SRC_URI[sha256sum] =3D "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a=
0509117a36a89913"
> +SRC_URI[md5sum] =3D "04852c26c47cc8c6b825f2b74f191f52"
> +SRC_URI[sha256sum] =3D "be8f75eff936b8e41b112462db51adf689715658a1b09e0d=
6b05d11ec92cc616"
> =20
>  inherit autotools gettext update-alternatives texinfo
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlXU36sACgkQwFvcllog0XyQhACeMXUjvrpyvrmXQChwmP243jPL
IsQAnibE1kebrQFD78NKr7L7FKuuY/Rg
=0XFR
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
