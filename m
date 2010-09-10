Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ou9eC-0005in-FS for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:52:33 +0200
Received: from f053039231.adsl.alicedsl.de ([78.53.39.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ou9dW-0001Vd-Ct for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 19:51:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100910192032.GK28148@denix.org>
References: <1284141740-24059-1-git-send-email-chase.maupin@ti.com>
	<20100910192032.GK28148@denix.org>
Date: Fri, 10 Sep 2010 21:51:47 +0200
Message-ID: <1284148307.3787.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] jpeg_8b: Allow using older versions of automake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Sep 2010 19:52:33 -0000
X-Groupsio-MsgNum: 23435
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YrwrrIIdxBnPvFoN92UO"

--=-YrwrrIIdxBnPvFoN92UO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase,


Am Freitag, den 10.09.2010, 15:20 -0400 schrieb Denys Dmytriyenko:
> On Fri, Sep 10, 2010 at 01:02:20PM -0500, Chase Maupin wrote:
> > From: Chase <chase@chase-laptop.(none)>

please set up Git on your laptop with the following command.

    git config user.name Chase Maupin
    git config user.email chasemaupin03@gmail.com

> > * Added patch to allow using older versions of automake such
> >   as 1.10.3 when building jpeg version 8b.
> > * Only use the AM_SILENT_RULES if it is available.
> >=20
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>=20
> Acked-by: Denys Dmytriyenko <denis@denix.org>

To get the stats right, maybe the one who is pushing this can fix this
up by deleting the From: line in the message body.

Thanks,

Paul

> > ---
> >  ...igure-make-jpeg-work-with-older-autotools.patch |   30 ++++++++++++=
++++++++
> >  recipes/jpeg/jpeg_8b.bb                            |    7 +++-
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> >  create mode 100644 recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-=
with-older-autotools.patch
> >=20
> > diff --git a/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-ol=
der-autotools.patch b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-wi=
th-older-autotools.patch
> > new file mode 100644
> > index 0000000..dd6fd52
> > --- /dev/null
> > +++ b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-aut=
otools.patch
> > @@ -0,0 +1,30 @@
> > +From e9e77ee999553f9b94de0288688a0bdc60b92e0f Mon Sep 17 00:00:00 2001
> > +From: Chase Maupin <chase.maupin@ti.com>
> > +Date: Tue, 17 Aug 2010 08:30:56 -0500
> > +Subject: [PATCH] configure: make jpeg work with older autotools
> > +
> > +* Only use the AM_SILENT_RULES variable if it is defined.  Older
> > +  versions of automake don't support this option.
> > +
> > +Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > +---
> > + configure.ac |    3 ++-
> > + 1 files changed, 2 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 96da13b..9a58c51 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -26,7 +26,8 @@ AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist for=
eign])
> > + # Make --enable-silent-rules the default.
> > + # To get verbose build output you may configure
> > + # with --disable-silent-rules or use "make V=3D1".
> > +-AM_SILENT_RULES([yes])
> > ++# only use if available
> > ++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > +=20
> > + # This is required when using the de-ANSI-fication feature.
> > + AM_C_PROTOTYPES
> > +--=20
> > +1.7.0.4
> > +
> > diff --git a/recipes/jpeg/jpeg_8b.bb b/recipes/jpeg/jpeg_8b.bb
> > index 4251ca6..688dcd8 100644
> > --- a/recipes/jpeg/jpeg_8b.bb
> > +++ b/recipes/jpeg/jpeg_8b.bb
> > @@ -2,12 +2,15 @@ DESCRIPTION =3D "libjpeg is a library for handling th=
e JPEG (JFIF) image format."
> >  LICENSE =3D "jpeg"
> >  SECTION =3D "libs"
> >  PRIORITY =3D "required"
> > -PR =3D "r0"
> > +PR =3D "r1"
> > =20
> >  # TODO: really needed?
> >  RPROVIDES_${PN} =3D "jpeg"
> > =20
> > -SRC_URI =3D "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz"
> > +SRC_URI =3D "\
> > +    http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
> > +    file://0001-configure-make-jpeg-work-with-older-autotools.patch \
> > +    "
> >  S =3D "${WORKDIR}/jpeg-${PV}"
> > =20
> >  inherit autotools
> > --=20
> > 1.7.0.4


--=-YrwrrIIdxBnPvFoN92UO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyKjE0ACgkQPX1aK2wOHVjCcQCghfzlV2SuQ2R8UyJL1VcVOoSa
RwEAniMmpJb3T3qanMWmwq+Th9rIuTwo
=DMIU
-----END PGP SIGNATURE-----

--=-YrwrrIIdxBnPvFoN92UO--
