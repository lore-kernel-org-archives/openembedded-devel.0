Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CE34C6B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 02:40:46 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xo1Nu-0000tJ-BH from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2014 18:40:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 10 Nov 2014 18:40:45 -0800
Received: by burninator (Postfix, from userid 1000)	id 76853580A8F; Mon, 10
	Nov 2014 21:40:44 -0500 (EST)
Date: Mon, 10 Nov 2014 21:40:44 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141111024043.GC1803@mentor.com>
References: <cover.1415347548.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1415347548.git.hongxu.jia@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/3][meta-networking]fix install package "curlpp pimd ssmping" to image failed
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
X-List-Received-Date: Tue, 11 Nov 2014 02:40:51 -0000
X-Groupsio-MsgNum: 52805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I merged two of the three of these.  I didn't bring in the curlpp change
since, as Martin pointed out, it looks like a change to solve a problem
that isn't in meta-openembedded.  It may be as simple as updating your
own IMAGE_INSTALL_append, it may be correcting dependency names in some
layer that is external to meta-openembedded, but whatever it is, I can't
find anything inside meta-openembedded that depends on curlpp (as
named), so I don't think it's worth breaking convention here.

Thanks for the other updates, though.

-J.

[[oe] [PATCH 0/3][meta-networking]fix install package "curlpp pimd ssmping"=
 to image failed] On 14.11.07 (Fri 16:08) Hongxu Jia wrote:

> vim local.conf
> ...
> IMAGE_INSTALL_append =3D " curlpp pimd ssmping"
> ...
>=20
> bitbake core-image-minimal
>=20
> //Hongxu
>=20
> The following changes since commit 34ca3aeef1a8ff74de548c427fff8dc94f4b72=
0a:
>=20
>   vpnc: use nativeperl to run perl scripts (2014-11-04 16:02:44 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/fix-mete-networking
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-mete=
-networking
>=20
> Hongxu Jia (3):
>   curlpp: use libcurlpp as curlpp's provider
>   pimd: add do_install to pimd
>   ssmping: add do_install to ssmping
>=20
>  .../recipes-support/curlpp/curlpp_0.7.3.bb         |  1 +
>  meta-networking/recipes-support/pimd/pimd_2.1.8.bb |  7 +++++
>  .../files/0001-Makefile-tweak-install-dir.patch    | 35 ++++++++++++++++=
++++++
>  .../recipes-support/ssmping/ssmping_0.9.1.bb       |  8 ++++-
>  4 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/ssmping/files/0001-Ma=
kefile-tweak-install-dir.patch
>=20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUYXcrAAoJEEn8ffcsOfaWJrsH+wfuAYJeZ6kJxRzNmN1HB0Pu
0GRVUbd2P3ZhCk5FG4c01vi0kP1clry8vJpuAmpgmrF5cvDc7/CCcJCJRe6odBRU
h6JdSfdTzOQNotRxAZ+5VGWUnUp8LJcFOQnQZZd+u9gJA6Qcztys86s//x26ENJs
wYzjlHBgvlhVwOY1yPgpm+28tYTav69ARnqZbHgV8vukeNjWiYVvX/glZcFYnqmJ
FJZJGEueIx0BGe0xfgT2uRg8IX42RrLt+fUZANLFVonN3SNan+BpgvZV1UESHAS2
wTjQIXq5fPqa9wgoO/ApyhMHeGl3Qkk/HP27iYiric2a0amyXvK8oymlnTazedM=
=fmfH
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
