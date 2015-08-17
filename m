Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8123B606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:04:34 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZRM6Q-0003In-RC from Joe_MacDonald@mentor.com ;
	Mon, 17 Aug 2015 08:13:34 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 17 Aug 2015 08:04:34 -0700
Received: by burninator (Postfix, from userid 1000)	id B3025587596; Mon, 17
	Aug 2015 11:03:49 -0400 (EDT)
Date: Mon, 17 Aug 2015 11:03:49 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20150817150349.GD8518@mentor.com>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
	<55D179C1.5010402@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55D179C1.5010402@windriver.com>
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
X-List-Received-Date: Mon, 17 Aug 2015 15:04:35 -0000
X-Groupsio-MsgNum: 56746
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline

--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.17 (=
Mon 14:05) Kang Kai wrote:

> On 2015=E5=B9=B408=E6=9C=8812=E6=97=A5 10:05, kai.kang@windriver.com wrot=
e:
> >From: Kai Kang <kai.kang@windriver.com>
> >
> >Upgrade inetutils from 1.9.2 to 1.9.4.
>=20
> Ping?

Since I'm seeing a lot of these lately I thought I might explain my
current workflow.  For build or security issues, I'm trying to stay on
top of them and be as responsive as possible, but for general recipe
updates, particularly ones like this where the log shows essentially
nothing critical has changed, I'm holding off until at least my
autobuilders get to chew on them and reassure me we're not bringing in
new QA (or worse) issues, and ideally I prefer to see a pass in one of
Martin's "state of the world" builds.  I also try to give everyone on
the list a reasonable amount of time to respond to anything as well, but
that's not a gating factor.

Just FYI.

-J.

>=20
> >
> >* add homepage
> >* update inetutils/version.patch
> >
> >Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >---
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/fix-disable-ipv6.patch =
 | 0
> >  ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch |=
 0
> >  .../{inetutils-1.9.2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch   =
 | 0
> >  .../inetutils-1.9-PATH_PROCNET_DEV.patch                             |=
 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rexec.xinetd.inetutils =
 | 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rlogin.xinetd.inetutils=
 | 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rsh.xinetd.inetutils   =
 | 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/telnet.xinetd.inetutils=
 | 0
> >  .../telnetd-Fix-deadlock-on-cleanup.patch                            |=
 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/tftpd.xinetd.inetutils =
 | 0
> >  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/version.patch          =
 | 2 +-
> >  .../inetutils/{inetutils_1.9.2.bb =3D> inetutils_1.9.4.bb}            =
 | 5 +++--
> >  12 files changed, 4 insertions(+), 3 deletions(-)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/fix-disable-ipv6.patch (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__G=
LIBC__.patch (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/inetutils-1.8-0003-wchar.patch (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/rexec.xinetd.inetutils (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/rlogin.xinetd.inetutils (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/rsh.xinetd.inetutils (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/telnet.xinetd.inetutils (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/tftpd.xinetd.inetutils (100%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2=
 =3D> inetutils}/version.patch (93%)
> >  rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.2=
=2Ebb =3D> inetutils_1.9.4.bb} (97%)
> >
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils=
/inetutils/fix-disable-ipv6.patch
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/fix-disable-ipv6.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix-d=
isable-ipv6.patch
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch =
b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-00=
01-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetu=
tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/i=
netutils/inetutils/inetutils-1.8-0003-wchar.patch
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.8-0003-wchar.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetu=
tils-1.8-0003-wchar.patch
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connecti=
vity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/inetutils-1.9-PATH_PROCNET_DEV.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetu=
tils-1.9-PATH_PROCNET_DEV.patch
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils=
/inetutils/rexec.xinetd.inetutils
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rexec.xinetd.inetutils
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/rexec=
=2Exinetd.inetutils
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/rlogin.xinetd.inetutils
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rlogin.xinetd.inetutils
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlogi=
n.xinetd.inetutils
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/i=
netutils/rsh.xinetd.inetutils
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rsh.xinetd.inetutils
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh.x=
inetd.inetutils
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils/telnet.xinetd.inetutils
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/telnet.xinetd.inetutils
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/telne=
t.xinetd.inetutils
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connect=
ivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/telnetd-Fix-deadlock-on-cleanup.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/telne=
td-Fix-deadlock-on-cleanup.patch
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils=
/inetutils/tftpd.xinetd.inetutils
> >similarity index 100%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/tftpd.xinetd.inetutils
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/tftpd=
=2Exinetd.inetutils
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.=
9.2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutil=
s/version.patch
> >similarity index 93%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/version.patch
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils/versi=
on.patch
> >index 1caa2d3..532a0e5 100644
> >--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/ver=
sion.patch
> >+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version.p=
atch
> >@@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
> >  -AC_INIT([GNU inetutils],
> >  - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-=
/v/;s/_/./g']),
> >-+AC_INIT([GNU inetutils],[1.9.2],
> >++AC_INIT([GNU inetutils],[1.9.4],
> >    [bug-inetutils@gnu.org])
> >   AC_CONFIG_SRCDIR([src/inetd.c])
> >diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.=
9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >similarity index 97%
> >rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E2.bb
> >rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4=
=2Ebb
> >index 6209272..cdcba83 100644
> >--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >@@ -2,6 +2,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of c=
ommon \
> >  networking utilities and servers including ftp, ftpd, rcp, \
> >  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
> >  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> >+HOMEPAGE =3D "http://www.gnu.org/software/inetutils"
> >  SECTION =3D "net"
> >  DEPENDS =3D "ncurses netbase readline"
> >  LICENSE =3D "GPLv3"
> >@@ -21,8 +22,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.t=
ar.gz \
> >             file://telnetd-Fix-deadlock-on-cleanup.patch \
> >  "
> >-SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> >-SRC_URI[sha256sum] =3D "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56=
a0509117a36a89913"
> >+SRC_URI[md5sum] =3D "04852c26c47cc8c6b825f2b74f191f52"
> >+SRC_URI[sha256sum] =3D "be8f75eff936b8e41b112462db51adf689715658a1b09e0=
d6b05d11ec92cc616"
> >  inherit autotools gettext update-alternatives texinfo
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20
--=20
-Joe MacDonald.
:wq

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV0ffSAAoJEEn8ffcsOfaWDCIIALY+Pd9bQtpg3mTjiDNr0p/+
oXxfAQbHR/E8nq3uVygAOjfJf3K45iYlNsmzupRhH7ysD8XFWa82r7G2PPZkrkeU
Fs1MGhy48wHn8AP2vYda14JMxQXTa7jz8W6FVZIQiJBz/ubP6yxBUOw21cK258a+
v6U4kEEAkLRjauav8/UC9IWn7+Do7u7TgtSS3kTVqDwcC+7h2uG671tc5nusVOF7
8aaJdYsD96R89S7xjNlzjqFhDwABQ86nB18Dk3MHiq1be/dlOFV/BEJOI8mO8rxI
dBiHpuowsy7oGWlaN4mi6/U7oHy3paAnqsF3EBYEdw5n0kk02zwYDtaETMTgEWY=
=IpCZ
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
