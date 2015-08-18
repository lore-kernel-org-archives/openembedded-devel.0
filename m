Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3AB608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 01:27:47 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZRVpW-0001gr-K3 from Joe_MacDonald@mentor.com ;
	Mon, 17 Aug 2015 18:36:46 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 17 Aug 2015 18:27:46 -0700
Received: by burninator (Postfix, from userid 1000)	id E78C6587596; Mon, 17
	Aug 2015 21:27:01 -0400 (EDT)
Date: Mon, 17 Aug 2015 21:27:01 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20150818012701.GA24907@mentor.com>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
	<55D179C1.5010402@windriver.com> <20150817150349.GD8518@mentor.com>
	<55D24E83.7080508@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55D24E83.7080508@windriver.com>
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
X-List-Received-Date: Tue, 18 Aug 2015 01:27:49 -0000
X-Groupsio-MsgNum: 56755
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.17 (=
Mon 17:13) Randy MacLeod wrote:

> On 2015-08-17 11:03 AM, Joe MacDonald wrote:
> >[Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.1=
7 (Mon 14:05) Kang Kai wrote:
> >
> >>On 2015=E5=B9=B408=E6=9C=8812=E6=97=A5 10:05, kai.kang@windriver.com wr=
ote:
> >>>From: Kai Kang <kai.kang@windriver.com>
> >>>
> >>>Upgrade inetutils from 1.9.2 to 1.9.4.
> >>
> >>Ping?
> >
> >Since I'm seeing a lot of these lately I thought I might explain my
> >current workflow.
>=20
> Thanks for the background.
>=20
> >For build or security issues, I'm trying to stay on
> >top of them and be as responsive as possible,
>=20
> okay.
>=20
> >but for general recipe
> >updates, particularly ones like this where the log shows essentially
> >nothing critical has changed, I'm holding off until at least my
> >autobuilders get to chew on them and reassure me we're not bringing in
> >new QA (or worse) issues,
>=20
> I'd hope that means a day or two and not a week, right?
>=20
> >and ideally I prefer to see a pass in one of
> >Martin's "state of the world" builds.
>=20
> I assumed that the state-of-the-world builds would be for master
> and the release branches but no:
>    http://www.openembedded.org/wiki/Bitbake_World_Status_Setup
>=20
>    "It's not using "master" branches,
>      but "jansa/master" branches in ..."
>=20
> They appear to happen every day:
>    http://logs.nslu2-linux.org/buildlogs/oe/world/
> And the stats are published once or twice a week, most of the time...
>    http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> Hmmm, would newer build systems be useful:
>    "Usually I build for 3 MACHINE qemuarm, qemux86, qemux86-64.
>     Each MACHINE takes about 20-24hours so sometimes there is
>     bigger delay."
>=20
> >I also try to give everyone on
> >the list a reasonable amount of time to respond to anything as well, but
> >that's not a gating factor.
>=20
> What's a reasonable time? ~ 1-2 days?
>=20
> Just trying ensure that our ping time is reasonable. :)

A week or so.  What Khem said.

OTOH, write a commit log with words like "fixes several CVEs" and list
them if you want to have a good chance of a faster turnaround (see
Armin's package update from earlier today, that gets attention).

Similarly, "fixes a build failure for all architectures on multilib"
(see my patches coming out soon) will also tend to get processed faster.
Often the build fixes go straight into master since they resolve issues
with the world builds and Martin or I will merge them to un-break stuff
for everyone.

I don't intend to single anyone out, and I've said many times that I
appreciate a ping, but thought it was worth being transparent since this
one came in less than a week after the initial patch came out and the
commit log doesn't communicate any urgency.  :-)

-J.

>=20
> ../Randy
> >
> >Just FYI.
> >
> >-J.
> >
> >>
> >>>
> >>>* add homepage
> >>>* update inetutils/version.patch
> >>>
> >>>Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>---
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/fix-disable-ipv6.patc=
h  | 0
> >>>  ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch=
 | 0
> >>>  .../{inetutils-1.9.2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch =
   | 0
> >>>  .../inetutils-1.9-PATH_PROCNET_DEV.patch                            =
 | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rexec.xinetd.inetutil=
s  | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rlogin.xinetd.inetuti=
ls | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/rsh.xinetd.inetutils =
   | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/telnet.xinetd.inetuti=
ls | 0
> >>>  .../telnetd-Fix-deadlock-on-cleanup.patch                           =
 | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/tftpd.xinetd.inetutil=
s  | 0
> >>>  .../inetutils/{inetutils-1.9.2 =3D> inetutils}/version.patch        =
   | 2 +-
> >>>  .../inetutils/{inetutils_1.9.2.bb =3D> inetutils_1.9.4.bb}          =
   | 5 +++--
> >>>  12 files changed, 4 insertions(+), 3 deletions(-)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/fix-disable-ipv6.patch (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for=
-__GLIBC__.patch (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/inetutils-1.8-0003-wchar.patch (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/rexec.xinetd.inetutils (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/rlogin.xinetd.inetutils (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/rsh.xinetd.inetutils (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/telnet.xinetd.inetutils (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/tftpd.xinetd.inetutils (100%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9=
=2E2 =3D> inetutils}/version.patch (93%)
> >>>  rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9=
=2E2.bb =3D> inetutils_1.9.4.bb} (97%)
> >>>
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils/fix-disable-ipv6.patch
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/fix-disable-ipv6.patch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix=
-disable-ipv6.patch
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patc=
h b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-=
0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.pat=
ch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/ine=
tutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity=
/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.8-0003-wchar.patch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/ine=
tutils-1.8-0003-wchar.patch
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connec=
tivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/ine=
tutils-1.9-PATH_PROCNET_DEV.patch
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils/rexec.xinetd.inetutils
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rexec.xinetd.inetutils
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rex=
ec.xinetd.inetutils
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetut=
ils/inetutils/rlogin.xinetd.inetutils
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rlogin.xinetd.inetutils
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlo=
gin.xinetd.inetutils
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils=
/inetutils/rsh.xinetd.inetutils
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/rsh.xinetd.inetutils
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh=
=2Exinetd.inetutils
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetut=
ils/inetutils/telnet.xinetd.inetutils
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnet.xinetd.inetutils
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/tel=
net.xinetd.inetutils
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-conne=
ctivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/telnetd-Fix-deadlock-on-cleanup.patch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/tel=
netd-Fix-deadlock-on-cleanup.patch
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils/tftpd.xinetd.inetutils
> >>>similarity index 100%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/tftpd.xinetd.inetutils
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/tft=
pd.xinetd.inetutils
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-=
1.9.2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetut=
ils/version.patch
> >>>similarity index 93%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils-1=
=2E9.2/version.patch
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils/ver=
sion.patch
> >>>index 1caa2d3..532a0e5 100644
> >>>--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/v=
ersion.patch
> >>>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version=
=2Epatch
> >>>@@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
> >>>  -AC_INIT([GNU inetutils],
> >>>  - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutil=
s-/v/;s/_/./g']),
> >>>-+AC_INIT([GNU inetutils],[1.9.2],
> >>>++AC_INIT([GNU inetutils],[1.9.4],
> >>>    [bug-inetutils@gnu.org])
> >>>   AC_CONFIG_SRCDIR([src/inetd.c])
> >>>diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_=
1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>>similarity index 97%
> >>>rename from meta-networking/recipes-connectivity/inetutils/inetutils_1=
=2E9.2.bb
> >>>rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E4.bb
> >>>index 6209272..cdcba83 100644
> >>>--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
> >>>+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> >>>@@ -2,6 +2,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of=
 common \
> >>>  networking utilities and servers including ftp, ftpd, rcp, \
> >>>  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
> >>>  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> >>>+HOMEPAGE =3D "http://www.gnu.org/software/inetutils"
> >>>  SECTION =3D "net"
> >>>  DEPENDS =3D "ncurses netbase readline"
> >>>  LICENSE =3D "GPLv3"
> >>>@@ -21,8 +22,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}=
=2Etar.gz \
> >>>             file://telnetd-Fix-deadlock-on-cleanup.patch \
> >>>  "
> >>>-SRC_URI[md5sum] =3D "aa1a9a132259db83e66c1f3265065ba2"
> >>>-SRC_URI[sha256sum] =3D "0423ea40a160cd4630f817e247df5c08ecc625378d2bb=
56a0509117a36a89913"
> >>>+SRC_URI[md5sum] =3D "04852c26c47cc8c6b825f2b74f191f52"
> >>>+SRC_URI[sha256sum] =3D "be8f75eff936b8e41b112462db51adf689715658a1b09=
e0d6b05d11ec92cc616"
> >>>  inherit autotools gettext update-alternatives texinfo
> >>
> >>
> >>--
> >>Regards,
> >>Neil | Kai Kang
> >>
> >>
> >>
>=20
>=20
--=20
-Joe MacDonald.
:wq

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV0onlAAoJEEn8ffcsOfaW+wgH/0l+Iv67k+Hyr2Kpt0Hu2CDv
QVoRTnDb625ppJYsdJsFv5UHKQtlA/hABZzRvTF17XZFKUCDm5MGg872wQcRLzAJ
7ycv7RCg2qgjSN6pRBeoPwWMGHVM3zhpD4Z49I6LFmJd5bUlnA/kHxlE1vvDGBN3
jVg2I6p7URDnzguFgp9cBfO4osVHExvaiJO4RvoUFju6XqUGKZU6H7xMV+503GG1
TB82f0GdNnKfrDVRpwIt79ypOS9+1I85PM5flyrwe3DzgMYOPZNZjnWEzSlbQIq6
CsmFVXtKjqYjv3s0rJcuwOvtD5HzTDa7XdDVH9JQDnCbvZdZEyDX+zw8fNIjlqc=
=alui
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
