Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CD6D66FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 16:36:30 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1d887j-0006WD-O2 from Joe_MacDonald@mentor.com ;
	Tue, 09 May 2017 09:36:31 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 May 2017 09:36:31 -0700
Received: by burninator (Postfix, from userid 1000)	id 6AB48580BC5; Tue,  9
	May 2017 12:36:30 -0400 (EDT)
Date: Tue, 9 May 2017 12:36:30 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <jackie.huang@windriver.com>
Message-ID: <20170509163629.GA24456@mentor.com>
MIME-Version: 1.0
In-Reply-To: <7107637a8dd9779404a39e2cc586ff132cbf5309.1493194374.git.jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 2/8] freeradius: add new recipe
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
X-List-Received-Date: Tue, 09 May 2017 16:36:31 -0000
X-Groupsio-MsgNum: 66684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry to resurrect a v1 patch but I've lost the v2 and the list seems
to have eaten my original reply to that one.  Here's my comments from it
(and the reason why the current patch has been marked rejected in
patchwork: https://patchwork.openembedded.org/patch/139452/)

[[oe] [meta-networking][PATCH 2/8 v2] freeradius: add new recipe] On 17.04.=
26 (Wed 16:22) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> FreeRADIUS is an Internet authentication daemon,
> which implements the RADIUS protocol, as defined
> in RFC 2865 (and others).
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../freeradius/files/freeradius                    | 110 ++++++++++
>  .../freeradius-avoid-searching-host-dirs.patch     | 194 +++++++++++++++=
++
>  ...radius-configure.ac-add-option-for-libcap.patch |  70 ++++++
>  ...dius-configure.ac-allow-cross-compilation.patch |  31 +++
>  .../files/freeradius-enble-user-in-conf.patch      |  28 +++
>  ...eeradius-fix-error-for-expansion-of-macro.patch |  61 ++++++
>  ...ius-fix-issues-related-to-m4-include-path.patch | 236 +++++++++++++++=
++++++
>  .../freeradius-fix-quoting-for-BUILT_WITH.patch    |  55 +++++
>  .../files/freeradius-libtool-detection.patch       |  89 ++++++++
>  .../freeradius-libtool-do-not-use-jlibtool.patch   | 160 ++++++++++++++
>  .../freeradius-rlm_python-add-PY_INC_DIR.patch     |  33 +++
>  .../freeradius/files/radiusd-volatiles.conf        |   2 +
>  .../freeradius/files/radiusd.service               |  16 ++
>  .../freeradius/files/volatiles.58_radiusd          |   3 +
>  .../freeradius/freeradius_3.0.12.bb                | 223 +++++++++++++++=
++++

This is an old version of freeradius, as evinced by your SRC_URI:

> +SRC_URI =3D "ftp://ftp.freeradius.org/pub/freeradius/old/freeradius-serv=
er-${PV}.tar.bz2 \

Why not bring the current version (3.0.13) in since it's a new recipe
and save a later update?

> diff --git a/meta-networking/recipes-connectivity/freeradius/files/freera=
dius-avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity=
/freeradius/files/freeradius-avoid-searching-host-dirs.patch
> new file mode 100644
> index 000000000..8ab23d3ef
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-av=
oid-searching-host-dirs.patch
> @@ -0,0 +1,194 @@
> +From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 4 Jan 2016 01:44:04 -0500
> +Subject: [PATCH] avoid searching host dirs
> +
> +Upstream-Status: Inappropriate [cross-compile specific]

I don't know if that's specifically a reason to be inappropriate for
upstream.  :-)

Anyway, given that some of the patches were submitted upstream, as you
noted elsewhere, it may be that the current version won't need them at
all.

--=20
-Joe MacDonald.
:wq

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJZEfANAAoJEEn8ffcsOfaWcn8IAK0RJDk7UEmk576iRVKilM5i
y5B3Zk0Rq8wtK+QsJd2uUgG3XC6JPudQzSGPBupH2RQlArlz9guoqukhWxwg/gSW
GsCjhTVycC9jqidGvnyoqBPJLtz69X7acAuJIqh7BBbFkIclIIwGtMRkYBcmwJId
IjLR0TxgRVy634g0dXPD1OJCe2vahCga9kKhWYZ7m0qfHG0+U7MOEVg2/jxxXDpJ
3e+G6yWmMkPtrk4+/bKUWuK0SBFpRaogAmrar/J3HGBLZjFxAea7YwtFVqqMc1VO
CjeR5zIK7IQggNUuZLS1NOI3NgXEMNoMvhR4M5uTpaFSk8aEvI1w8cXMNau8Tf0=
=aO4D
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
