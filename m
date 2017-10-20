Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 836F7601F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 12:25:50 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e5WN5-0002aJ-E9 from Joe_MacDonald@mentor.com ;
	Fri, 20 Oct 2017 05:25:51 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 20 Oct 2017 05:25:51 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	0740F580FF8; Fri, 20 Oct 2017 08:25:50 -0400 (EDT)
Date: Fri, 20 Oct 2017 08:25:49 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20171020122549.fs4jigrrbfx3ukwr@mentor.com>
References: <1508397130-81256-1-git-send-email-li.zhou@windriver.com>
	<CAMKF1sqT6EK4f1vzUDZfi8mXfc+6_Uror0UtbfALPgQ2kDNatw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqT6EK4f1vzUDZfi8mXfc+6_Uror0UtbfALPgQ2kDNatw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] bridge-utils: modify the AR to cross toolchain
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
X-List-Received-Date: Fri, 20 Oct 2017 12:25:50 -0000
X-Groupsio-MsgNum: 69274
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ekal3vvcc4tr5aqe"
Content-Disposition: inline

--ekal3vvcc4tr5aqe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] bridge-utils: modify the AR to cross too=
lchain] On 17.10.19 (Thu 09:06) Khem Raj wrote:

> On Thu, Oct 19, 2017 at 12:12 AM, Li Zhou <li.zhou@windriver.com> wrote:
> > The Makefile uses the host =E2=80=9Car=E2=80=9D tool when it should be =
using the
> > ar from the target toolchain.
> >
> > Signed-off-by: Jiwei Sun <jiwei.sun@windriver.com>
> > Signed-off-by: Li Zhou <li.zhou@windriver.com>
> > ---
> >  ...ridge-Modifying-the-AR-to-cross-toolchain.patch | 34 ++++++++++++++=
++++++++
> >  .../bridge-utils/bridge-utils_1.5.bb               |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/bridge-utils/bridge=
-utils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch
> >
> > diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/=
0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch b/meta-networking/=
recipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-t=
o-cross-toolchain.patch
> > new file mode 100644
> > index 0000000..e477f41
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-li=
bbridge-Modifying-the-AR-to-cross-toolchain.patch
> > @@ -0,0 +1,34 @@
> > +From 689e24ef05bd1772b2149e4eb48b058ca8361cf4 Mon Sep 17 00:00:00 2001
> > +From: Li Zhou <li.zhou@windriver.com>
> > +Date: Thu, 19 Oct 2017 11:34:18 +0800
> > +Subject: [PATCH 2/2] libbridge: Modifying the AR to cross toolchain
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +The Makefile uses the host =E2=80=9Car=E2=80=9D tool when it should be=
 using the
> > +ar from the target toolchain.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> > +---
> > + libbridge/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
> > +index 11c0829..59d7355 100644
> > +--- a/libbridge/Makefile.in
> > ++++ b/libbridge/Makefile.in
> > +@@ -1,7 +1,7 @@
> > +
> > + KERNEL_HEADERS=3D-I@KERNEL_HEADERS@
> > +
> > +-AR=3Dar
> > ++AR?=3Dar
>=20
> perhaps AR=3D@AR@ would be better

Yeah, I  agree.

-J.

>=20
> > + RANLIB=3D@RANLIB@
> > +
> > + CC=3D@CC@
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_=
1.5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> > index 6032ab0..723ae5f 100644
> > --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> > +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> > @@ -7,6 +7,7 @@ SRC_URI +=3D "\
> >      file://0003-bridge-fix-some-build-time-warnings-errno.h.patch \
> >      file://0004-libbridge-add-missing-include-s-fix-build-against-mu.p=
atch \
> >      file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
> > +    file://0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
> >  "
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9d20a453221a1b7e32ae84694d=
a2c37"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--=20
-Joe MacDonald.
:wq

--ekal3vvcc4tr5aqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlnp600ACgkQSfx99yw5
9par+Af+JU/K44IJsceoCRMXCo+BfgvUlOAQ3rlrY6QgYLHSB2W+H0GfCznIJts9
n2WkG8K+VOIrzWifNvLEran+3q0UkE5tHjTuXPRdLDIMhYycUIOhDcAnLP140M0X
oynsfY11LYSV28l+0nRvXnTLYJZthvnZkUPe4CASQUOmeZzlvxZxmtQu69htmSH9
1HLc8ZOQhxSizSO6mCnxSbpH4Oe2ikfhrKo4ha7+yDLwGBluKsZYCcPMobICeX2K
9f0LPQXjvW5KOFuytHumnNUfXyb89wZTqo0oizAgU4FIUWMhUbvTAF2NQ4+kDLjL
Mz58XBkNhpXqyN5tHBkxim//RtAZ7g==
=zNNp
-----END PGP SIGNATURE-----

--ekal3vvcc4tr5aqe--
