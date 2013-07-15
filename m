Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B86CC61642
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 12:37:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FCc1pN001124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 05:38:01 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 05:38:00 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 59E7F7FE4	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 08:37:34 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id A5605410DF; Mon,
	15 Jul 2013 08:37:59 -0400 (EDT)
Date: Mon, 15 Jul 2013 08:37:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130715123759.GB3842@windriver.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/3] Add mosh and dependencies
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
X-List-Received-Date: Mon, 15 Jul 2013 12:37:59 -0000
X-Groupsio-MsgNum: 45374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline

--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-oe][PATCH 0/3] Add mosh and dependencies] On 13.07.13 (Sat 15:4=
7) Paul Eggleton wrote:

> Add a recipe for mosh, and for dependencies migrate libio-pty-perl from
> OE-Classic and bring in protobuf from meta-virtualization.
>=20
> I considered putting this in meta-networking, however meta-virtualization
> will still need protobuf and it already depends on meta-oe, and officially
> meta-networking does not depend on meta-oe so splitting these would not
> really work with the current layer dependencies.

That's not strictly true anymore, actually.  It was my intent and I
think there's value in it, but CRDA (already in meta-networking) depends
on python-m2crypto (in meta-oe).  I discovered it in my world build a
few weeks ago and hadn't yet managed to get round to seeing if there was
a clean way to separate the two.

I absolutely don't want the stated intent that meta-networking be
standalone be a barrier to adding packages to it that clearly belong to
it.

That's my way of saying I've no objection right now to including this in
meta-net.

-J.

>=20
>=20
> The following changes since commit c383d6230942bb1558cee02764bced09031cb7=
0f:
>=20
>   llvm3.3: Add zlib dependency and explicitly enable it (2013-07-12 12:12=
:09 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/mosh
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/mosh
>=20
> Paul Eggleton (3):
>   protobuf: add recipe from meta-virtualization and tweak
>   libio-pty-perl: add from OE-Classic and update
>   mosh: add new recipe for version 1.2.4
>=20
>  meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    | 29 ++++++++++++++++=
++++++
>  .../recipes-devtools/perl/libio-pty-perl_1.10.bb   | 14 +++++++++++
>  .../recipes-devtools/protobuf/protobuf_2.4.1.bb    | 20 +++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>  create mode 100644 meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
>=20
--=20
-Joe MacDonald.
:wq

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHj7ScACgkQPN8S4W6ZZnfwIQCcCM94n3tJU0Ar9oQODBDl7Sjf
tj4AmgOGn7GWJCv/7c+QtBo1c6i20o7P
=M0SC
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
