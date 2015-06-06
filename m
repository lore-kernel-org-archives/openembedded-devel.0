Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4B50173BB8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jun 2015 02:01:48 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Z13Qi-00070B-RU from Joe_MacDonald@mentor.com ;
	Fri, 05 Jun 2015 19:01:48 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Jun 2015 19:01:47 -0700
Received: by burninator (Postfix, from userid 1000)	id A6360582565; Fri,  5
	Jun 2015 22:01:39 -0400 (EDT)
Date: Fri, 5 Jun 2015 22:01:39 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150606020139.GC27123@mentor.com>
References: <1433139476-13265-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1433139476-13265-1-git-send-email-rongqing.li@windriver.com>
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
X-List-Received-Date: Sat, 06 Jun 2015 02:01:49 -0000
X-Groupsio-MsgNum: 55807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Roy,

[[oe] [PATCH][meta-networking] znc: upgrade to 1.6.0] On 15.06.01 (Mon 14:1=
7) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. upgrade to 1.6.0 to fix CVE-2014-9403
> 2. Remove the backup patch
> 3. not git version, otherwise it requires "git submodule" command,
> since Csocket is moved into git submodule
> 4. update the checksum of LICENSE, since the date in it was changed

Couple of things about this one.  The patch fails to apply:

------------------------------------------------------------------------
% git am /tmp/a.mbox
Applying: znc: upgrade to 1.6.0
error: patch failed: meta-networking/recipes-irc/znc/znc_git.bb:1
error: meta-networking/recipes-irc/znc/znc_git.bb: patch does not apply
Patch failed at 0001 znc: upgrade to 1.6.0
The copy of the patch that failed is found in:
   /home/jjm/external/yocto-networking/meta-openembedded/.git/rebase-apply/=
patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
------------------------------------------------------------------------

but also, unless there's a good reason to drop the git recipe, I'd
rather keep that and add in the released one beside it.  Normally I
don't like to keep multiple versions of a recipe around, but if one of
those is a "build directly from the source repo", that I think is
reasonable to keep around.

-J.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------=
------
>  .../recipes-irc/znc/{znc_git.bb =3D> znc_1.6.0.bb}   | 14 ++----
>  2 files changed, 5 insertions(+), 67 deletions(-)
>  delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-poi=
nter-dereference-in-webadmin.patch
>  rename meta-networking/recipes-irc/znc/{znc_git.bb =3D> znc_1.6.0.bb} (4=
7%)
>=20
> diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-de=
reference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-=
NULL-pointer-dereference-in-webadmin.patch
> deleted file mode 100644
> index 68e4414..0000000
> --- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereferen=
ce-in-webadmin.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Subject: [PATCH] Fix NULL pointer dereference in webadmin.
> -
> -Upstream-Status: Backport
> -
> -commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
> -
> -Triggerable by any non-admin, if webadmin is loaded.
> -
> -The only affected version is 1.0
> -
> -Thanks to ChauffeR (Simone Esposito) for reporting this.
> ----
> - modules/webadmin.cpp | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
> -index b793c02..816f217 100644
> ---- a/modules/webadmin.cpp
> -+++ b/modules/webadmin.cpp
> -@@ -419,7 +419,7 @@ public:
> - 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> -=20
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->Ge=
tUser() !=3D pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || =
spSession->GetUser() !=3D pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -=20
> -@@ -448,7 +448,7 @@ public:
> - 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> -=20
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->Ge=
tUser() !=3D pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || =
spSession->GetUser() !=3D pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -=20
> -@@ -472,7 +472,7 @@ public:
> - 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> -=20
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->Ge=
tUser() !=3D pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || =
spSession->GetUser() !=3D pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -=20
> -@@ -486,7 +486,7 @@ public:
> - 			CIRCNetwork* pNetwork =3D SafeGetNetworkFromParam(WebSock);
> -=20
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->Ge=
tUser() !=3D pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || =
spSession->GetUser() !=3D pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -=20
> ---=20
> -1.8.5.2.233.g932f7e4
> -
> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking=
/recipes-irc/znc/znc_1.6.0.bb
> similarity index 47%
> rename from meta-networking/recipes-irc/znc/znc_git.bb
> rename to meta-networking/recipes-irc/znc/znc_1.6.0.bb
> index 77db25b..ca3c606 100644
> --- a/meta-networking/recipes-irc/znc/znc_git.bb
> +++ b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
> @@ -1,17 +1,13 @@
>  SUMMARY =3D "ZNC, an advanced IRC bouncer"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> =20
> -DEPENDS =3D "openssl"
> +DEPENDS =3D "openssl zlib"
> =20
> -PV =3D "1.0+git"
> -
> -SRCREV =3D "ef59c23068547c132cb678092fba9a21317fd5f2"
> -SRC_URI =3D "git://github.com/znc/znc.git \
> -           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
> +SRC_URI =3D "http://znc.in/releases/${BP}.tar.gz \
>            "
> -
> -S =3D "${WORKDIR}/git"
> +SRC_URI[md5sum]=3D"674d8c1277752dcc627b96e33a63376e"
> +SRC_URI[sha256sum]=3D"df622aeae34d26193c738dff6499e56ad669ec654484e19623=
738d84cc80aba7"
> =20
>  inherit autotools-brokensep pkgconfig
> =20
--=20
-Joe MacDonald.
:wq

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVclSDAAoJEEn8ffcsOfaW/eMIAI72T+25hOeXdxRB5vO9r9o1
k1XlguNLd4/WiUYJ6PSULzYdM+IyIoJ+rpBN3F5D4lYbBU27ja2GvvLSGrpnrDds
K/P/bcDticD2tWwp7bTAvTEmQvV+n4e/1jBTUvqC3XcLzSmTVGliiqJWP50mwhhe
fwMTJGLxTBHVGL5NqtPFgVY3gDF7pZSMjBsXZL9mGIpuSeLk4rfVX8A0XUfbkZZp
9O276eudJNBmiIcCHkGsOv/EvyKumgxnYboNfAb11LwsTfubeyfCBrqIqUFZVxlS
N+l7y3jIiTZxznrhOg9Ix1SC2aBVSLniVEI4yn8nkTjX5Nna1Ydb1BCjszolkO4=
=StGz
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
