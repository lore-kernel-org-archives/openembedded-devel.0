Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD30860557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:08:24 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZSmzY-0002bk-P3 from Joe_MacDonald@mentor.com ;
	Fri, 21 Aug 2015 07:08:24 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 21 Aug 2015 07:08:24 -0700
Received: by burninator (Postfix, from userid 1000)	id 7A35E5875CD; Fri, 21
	Aug 2015 10:07:34 -0400 (EDT)
Date: Fri, 21 Aug 2015 10:07:34 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20150821140734.GB8498@mentor.com>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
	<20150819195731.GB5444@deserted.net>
	<55D58F20.2060006@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55D58F20.2060006@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 21 Aug 2015 14:08:28 -0000
X-Groupsio-MsgNum: 56894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.20 (=
Thu 16:26) Kang Kai wrote:

> On 2015=E5=B9=B408=E6=9C=8820=E6=97=A5 03:57, Joe MacDonald wrote:
> >[[oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.12 (W=
ed 10:05) kai.kang@windriver.com wrote:
> >
> >>From: Kai Kang <kai.kang@windriver.com>
> >>
> >>Upgrade inetutils from 1.9.2 to 1.9.4.
> >You don't appear to be working against the meta-openembedded tree on
> >this, I got a merge conflict on:
> >
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-conn=
ectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/telnetd-Fix-deadlock-on-cleanup.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/teln=
etd-Fix-deadlock-on-cleanup.patch
> >Which, after a bit of head-scratching, suggests your tree has this patch
> >merged:
> >
> >http://patchwork.openembedded.org/patch/96727/
> >
> >but, based on this discussion (also recorded in patchwork):
> >
> >http://comments.gmane.org/gmane.comp.handhelds.openembedded/69654
> >
> >we rejected it.
> >
> >Anyway, I've resolved it and am merging the result.  Please try to
> >ensure you're working on the current up-stream tree, though.
>=20
> I worked on branch master-next of meta-networking. It has commit which ad=
ds
> telnetd-Fix-deadlock-on-cleanup.patch.
> So should I work based on branch master rather than master-next?

That would be my recommendation, yeah.  The next time master-next gets
updated the patch will likely be dropped.  My understanding is that
master-next isn't intended to be fast-forward, so working on top of it
can lead to surprises.

That said, I try to always cherry pick my commits out of master-next
once I know they've been vetted there first.

-J.

>=20
> --Kai
>=20
> >
> >-J.
> >
> >>* add homepage
> >>* update inetutils/version.patch
> >>
> >>Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>---
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/fix-disable-ipv6.patch=
  | 0
> >>  ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch =
| 0
> >>  .../{inetutils-1.9.2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch  =
  | 0
> >>  .../inetutils-1.9-PATH_PROCNET_DEV.patch                             =
| 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rexec.xinetd.inetutils=
  | 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rlogin.xinetd.inetutil=
s | 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rsh.xinetd.inetutils  =
  | 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/telnet.xinetd.inetutil=
s | 0
> >>  .../telnetd-Fix-deadlock-on-cleanup.patch                            =
| 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/tftpd.xinetd.inetutils=
  | 0
> >>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/version.patch         =
  | 2 +-
> >>  .../inetutils/{inetutils_1.9.2.bb =3D> inetutils_1.9.4.bb}           =
  | 5 +++--
> >>  12 files changed, 4 insertions(+), 3 deletions(-)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/fix-disable-ipv6.patch (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__=
GLIBC__.patch (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/rexec.xinetd.inetutils (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/rlogin.xinetd.inetutils (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/rsh.xinetd.inetutils (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/telnet.xinetd.inetutils (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/tftpd.xinetd.inetutils (100%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.=
2 =3D> inetutils}/version.patch (93%)
> >>  rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.=
2.bb =3D> inetutils_1.9.4.bb} (97%)
> >>
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetut=
ils/inetutils/fix-disable-ipv6.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/fix-disable-ipv6.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix-=
disable-ipv6.patch
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.pat=
ch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8=
-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/inet=
utils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivit=
y/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.8-0003-wchar.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/inet=
utils-1.8-0003-wchar.patch
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-conne=
ctivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/inet=
utils-1.9-PATH_PROCNET_DEV.patch
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetut=
ils/inetutils/rexec.xinetd.inetutils
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rexec.xinetd.inetutils
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rexe=
c.xinetd.inetutils
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetu=
tils/inetutils/rlogin.xinetd.inetutils
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rlogin.xinetd.inetutils
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlog=
in.xinetd.inetutils
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/rsh.xinetd.inetutils
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rsh.xinetd.inetutils
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh.=
xinetd.inetutils
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetu=
tils/inetutils/telnet.xinetd.inetutils
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/telnet.xinetd.inetutils
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/teln=
et.xinetd.inetutils
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-conn=
ectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/telnetd-Fix-deadlock-on-cleanup.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/teln=
etd-Fix-deadlock-on-cleanup.patch
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetut=
ils/inetutils/tftpd.xinetd.inetutils
> >>similarity index 100%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/tftpd.xinetd.inetutils
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/tftp=
d.xinetd.inetutils
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetu=
tils/version.patch
> >>similarity index 93%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/version.patch
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils/vers=
ion.patch
> >>index 1caa2d3..532a0e5 100644
> >>--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/ve=
rsion.patch
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version.=
patch
> >>@@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
> >>  -AC_INIT([GNU inetutils],
> >>  - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils=
-/v/;s/_/./g']),
> >>-+AC_INIT([GNU inetutils],[1.9.2],
> >>++AC_INIT([GNU inetutils],[1.9.4],
> >>    [bug-inetutils@gnu.org])
> >>   AC_CONFIG_SRCDIR([src/inetd.c])
> >>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1=
=2E9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.=
bb
> >>similarity index 97%
> >>rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.=
9.2.bb
> >>rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.=
4.bb
> >>index 6209272..cdcba83 100644
> >>--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>@@ -2,6 +2,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of =
common \
> >>  networking utilities and servers including ftp, ftpd, rcp, \
> >>  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
> >>  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> >>+HOMEPAGE =3D "http://www.gnu.org/software/inetutils"
> >>  SECTION =3D "net"
> >>  DEPENDS =3D "ncurses netbase readline"
> >>  LICENSE =3D "GPLv3"
> >>@@ -21,8 +22,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.=
tar.gz \
> >>             file://telnetd-Fix-deadlock-on-cleanup.patch \
> >>  "
> >>-SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> >>-SRC_URI[sha256sum] =3D "0423ea40a160cd4630f817e247df5c08ecc625378d2bb5=
6a0509117a36a89913"
> >>+SRC_URI[md5sum] =3D "04852c26c47cc8c6b825f2b74f191f52"
> >>+SRC_URI[sha256sum] =3D "be8f75eff936b8e41b112462db51adf689715658a1b09e=
0d6b05d11ec92cc616"
> >>  inherit autotools gettext update-alternatives texinfo
> >>--=20
> >>1.9.1
> >>
> >>
> >>
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20
--=20
-Joe MacDonald.
:wq

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV1zCmAAoJEEn8ffcsOfaWZG8H/0ctMWMGkZdCiP14eGFJF+oi
8Zy72MjbUch6uf1tBAn2VFzfio3g5am5AQxBmZZ738Gq7Ifsa6jv3ynFWjMpAoD/
HKjBKdDeT20+hP9hG+Lr/hHmQrtAwu8/bIzCP0FW/bGtOc4vkTGXFLLvfNBJkvWc
ki1W6Uomjm3UBYmCSVfMXPWdkJNgwi8i1k+7OWdp8VyQnKLirFFYpq0pOW4asFlj
5SWXOZDxS1OcMrGS8yIzvEN/je7mvAfSYtq2vh2kMH6iGU94I5mhc4DfZc6lHM4g
5p3uM9zyqNcG5rjm9fXqlnjIAWtGZyhpntZGJaimwvM3PuoPXdClm5uj4GpzNYc=
=+SC/
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
