Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A610E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 00:42:38 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Z1l9C-0003vt-EL from Joe_MacDonald@mentor.com ;
	Sun, 07 Jun 2015 17:42:38 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2; Sun, 7 Jun 2015
	17:42:37 -0700
Received: by burninator (Postfix, from userid 1000)	id 77ADD580663; Sun,  7
	Jun 2015 20:42:29 -0400 (EDT)
Date: Sun, 7 Jun 2015 20:42:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150608004229.GB32578@mentor.com>
References: <1433139476-13265-1-git-send-email-rongqing.li@windriver.com>
	<20150606020139.GC27123@mentor.com> <5574E267.90908@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5574E267.90908@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] znc: upgrade to 1.6.0
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
X-List-Received-Date: Mon, 08 Jun 2015 00:42:39 -0000
X-Groupsio-MsgNum: 55812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking] znc: upgrade to 1.6.0] On 15.06.08 (Mon =
08:31) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B406=E6=9C=8806=E6=97=A5 10:01, Joe MacDonald wrote:
> >Hey Roy,
> >
> >[[oe] [PATCH][meta-networking] znc: upgrade to 1.6.0] On 15.06.01 (Mon 1=
4:17) rongqing.li@windriver.com wrote:
> >
> >>From: Roy Li <rongqing.li@windriver.com>
> >>
> >>1. upgrade to 1.6.0 to fix CVE-2014-9403
> >>2. Remove the backup patch
> >>3. not git version, otherwise it requires "git submodule" command,
> >>since Csocket is moved into git submodule
> >>4. update the checksum of LICENSE, since the date in it was changed
> >
> >Couple of things about this one.  The patch fails to apply:
> >
> >------------------------------------------------------------------------
> >% git am /tmp/a.mbox
> >Applying: znc: upgrade to 1.6.0
> >error: patch failed: meta-networking/recipes-irc/znc/znc_git.bb:1
> >error: meta-networking/recipes-irc/znc/znc_git.bb: patch does not apply
> >Patch failed at 0001 znc: upgrade to 1.6.0
> >The copy of the patch that failed is found in:
> >    /home/jjm/external/yocto-networking/meta-openembedded/.git/rebase-ap=
ply/patch
> >When you have resolved this problem, run "git am --continue".
> >If you prefer to skip this patch, run "git am --skip" instead.
> >To restore the original branch and stop patching, run "git am --abort".
> >------------------------------------------------------------------------
> >
> >but also, unless there's a good reason to drop the git recipe, I'd
> >rather keep that and add in the released one beside it.  Normally I
> >don't like to keep multiple versions of a recipe around, but if one of
> >those is a "build directly from the source repo", that I think is
> >reasonable to keep around.
> >
> >-J.
>=20
> Sorry, I will fix it

Okay.  I haven't looked at the repo myself, but if there are
obvious tags for the releases, maybe you want to create a version of the
recipe that includes the git version directly and just selects an
appropriate release tag?  I don't know, just a thought.  Whatever works.

-J.

>=20
> -Roy
>=20
> >
> >>
> >>Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>---
> >>  ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 -------------=
---------
> >>  .../recipes-irc/znc/{znc_git.bb =3D> znc_1.6.0.bb}   | 14 ++----
> >>  2 files changed, 5 insertions(+), 67 deletions(-)
> >>  delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-=
pointer-dereference-in-webadmin.patch
> >>  rename meta-networking/recipes-irc/znc/{znc_git.bb =3D> znc_1.6.0.bb}=
 (47%)
> >>
> >>diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-=
dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fi=
x-NULL-pointer-dereference-in-webadmin.patch
> >>deleted file mode 100644
> >>index 68e4414..0000000
> >>--- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-derefer=
ence-in-webadmin.patch
> >>+++ /dev/null
> >>@@ -1,58 +0,0 @@
> >>-Subject: [PATCH] Fix NULL pointer dereference in webadmin.
> >>-
> >>-Upstream-Status: Backport
> >>-
> >>-commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
> >>-
> >>-Triggerable by any non-admin, if webadmin is loaded.
> >>-
> >>-The only affected version is 1.0
> >>-
> >>-Thanks to ChauffeR (Simone Esposito) for reporting this.
> >>----
> >>- modules/webadmin.cpp | 8 ++++----
> >>- 1 file changed, 4 insertions(+), 4 deletions(-)
> >>-
> >>-diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
> >>-index b793c02..816f217 100644
> >>---- a/modules/webadmin.cpp
> >>-+++ b/modules/webadmin.cpp
> >>-@@ -419,7 +419,7 @@ public:
> >>- 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> >>-
> >>- 			// Admin||Self Check
> >>--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->=
GetUser() !=3D pNetwork->GetUser())) {
> >>-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork |=
| spSession->GetUser() !=3D pNetwork->GetUser())) {
> >>- 				return false;
> >>- 			}
> >>-
> >>-@@ -448,7 +448,7 @@ public:
> >>- 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> >>-
> >>- 			// Admin||Self Check
> >>--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->=
GetUser() !=3D pNetwork->GetUser())) {
> >>-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork |=
| spSession->GetUser() !=3D pNetwork->GetUser())) {
> >>- 				return false;
> >>- 			}
> >>-
> >>-@@ -472,7 +472,7 @@ public:
> >>- 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> >>-
> >>- 			// Admin||Self Check
> >>--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->=
GetUser() !=3D pNetwork->GetUser())) {
> >>-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork |=
| spSession->GetUser() !=3D pNetwork->GetUser())) {
> >>- 				return false;
> >>- 			}
> >>-
> >>-@@ -486,7 +486,7 @@ public:
> >>- 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> >>-
> >>- 			// Admin||Self Check
> >>--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->=
GetUser() !=3D pNetwork->GetUser())) {
> >>-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork |=
| spSession->GetUser() !=3D pNetwork->GetUser())) {
> >>- 				return false;
> >>- 			}
> >>-
> >>---
> >>-1.8.5.2.233.g932f7e4
> >>-
> >>diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networki=
ng/recipes-irc/znc/znc_1.6.0.bb
> >>similarity index 47%
> >>rename from meta-networking/recipes-irc/znc/znc_git.bb
> >>rename to meta-networking/recipes-irc/znc/znc_1.6.0.bb
> >>index 77db25b..ca3c606 100644
> >>--- a/meta-networking/recipes-irc/znc/znc_git.bb
> >>+++ b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
> >>@@ -1,17 +1,13 @@
> >>  SUMMARY =3D "ZNC, an advanced IRC bouncer"
> >>  LICENSE =3D "GPLv2"
> >>-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >>+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> >>
> >>-DEPENDS =3D "openssl"
> >>+DEPENDS =3D "openssl zlib"
> >>
> >>-PV =3D "1.0+git"
> >>-
> >>-SRCREV =3D "ef59c23068547c132cb678092fba9a21317fd5f2"
> >>-SRC_URI =3D "git://github.com/znc/znc.git \
> >>-           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
> >>+SRC_URI =3D "http://znc.in/releases/${BP}.tar.gz \
> >>            "
> >>-
> >>-S =3D "${WORKDIR}/git"
> >>+SRC_URI[md5sum]=3D"674d8c1277752dcc627b96e33a63376e"
> >>+SRC_URI[sha256sum]=3D"df622aeae34d26193c738dff6499e56ad669ec654484e196=
23738d84cc80aba7"
> >>
> >>  inherit autotools-brokensep pkgconfig
> >>
>=20
--=20
-Joe MacDonald.
:wq

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVdOT1AAoJEEn8ffcsOfaW1AMIAL//lc9AVfBb7mPtC0XtsRv2
JnlN+UuN2g+5p092X3hnzoY/Ns3B7bkybLZgxnCsvKWbPStAY1IN7K//LEKsyXxh
pLNN18SbjsJyuimnJgNWMhvOklpWm6pwcH3w+/D4lUxq55jNWyV2FK1W/BBEfwUA
SrA5gIXO+Tr/aNCoSqrKkpqYA535+gVPW91OUQfgzCP+t0dSOHudyQVDRlz19l8r
RJziRj7BGsXcbPyN9TJHOjkMTySDDYIJ7FYWWdC43Vm+rEhirl9bB5IN7uaL0yQl
rtiTLeuFnV83eJpHeVT7pQmuPjy+tW3MPPWwvk8KobwbAXXko0f7leAi02wysgk=
=U58d
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
