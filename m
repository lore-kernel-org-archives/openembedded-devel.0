Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD3E16A591
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:44:04 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x55so1711583wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0SZkujGYoxcXwaQqv8rWFRomyqNxZ56wZ6qJAD1kWEY=;
	b=jrL5WO++Z2FipNgXDPV39pLVQ9VVzEeOLhvaEkBRhU2VKBxT1yDsJ24b174F1JoOWA
	21yQBwPGf0Ptd5xRIL2VjdcIL7B2tQST3fxbG6GkZq1Lz4X+yanFXF8ceC9YwhqZ8tKv
	9UATDQb7NyU3y/De6VlS8+EQye9pAp3Nfe2p20bYEzZfRycrEDuP6Zb4vJVgCuPLNPtj
	fEknoD4Qbr8nhi1r2Q4pl1xX2JhvG5xoBNLdMsYuhgJHh0c9tuWsQ0QClYjIxdele5ot
	ejfQcRMIw/Upc+/SVynxN7sJUDTdITDvGR0vXE1RumchrxotJVcOWVs4C35kFk8WDB4k
	Odzg==
X-Received: by 10.194.89.233 with SMTP id br9mr18923198wjb.50.1370263444624;
	Mon, 03 Jun 2013 05:44:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	en3sm23255783wid.1.2013.06.03.05.44.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 05:44:04 -0700 (PDT)
Date: Mon, 3 Jun 2013 14:44:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130603124419.GA20775@jama>
References: <1369218937-26345-1-git-send-email-philip@balister.org>
	<20130603122433.GB3279@jama>
MIME-Version: 1.0
In-Reply-To: <20130603122433.GB3279@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv3] gnuradio : Update recipe to build for all machines.
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
X-List-Received-Date: Mon, 03 Jun 2013 12:44:05 -0000
X-Groupsio-MsgNum: 44956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2013 at 02:24:33PM +0200, Martin Jansa wrote:
> On Wed, May 22, 2013 at 06:35:37AM -0400, Philip Balister wrote:
> > Also updated the git repo address after recent changes in hosting.
> >=20
> > The recipe failed to build for machines without neon as a tune feature.
> > The cmake config options have been changed so that it configures proper=
ly
> > now.
> >=20
> > Also dropped documentation from build to work around a doc generation p=
roblem.
> >=20
> > Test on armv7a, x86, and x86-64.
> >=20
> > Signed-off-by: Philip Balister <philip@balister.org>
> > ---
> >  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/me=
ta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> > index edd4615..45f4c77 100644
> > --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> > +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> > @@ -70,7 +70,7 @@ SRCREV =3D "5f69899e059e9bea58f92af61f70fc3f63825087"
> >  GIT_REPO =3D "gnuradio.git"
> >  GIT_BRANCH =3D "master"
> > =20
> > -SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};pro=
tocol=3Dgit \
> > +SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH}=
;protocol=3Dgit \
> >  "
> > =20
> >  S=3D"${WORKDIR}/git"
> > @@ -82,21 +82,18 @@ EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
> >                   -DENABLE_GR_FCD=3DOFF \
> >                   -DENABLE_GR_WXGUI=3DOFF \
> >                   -DENABLE_GR_VIDEO_SDL=3DOFF \
> > +                 -DENABLE_SPHINX=3DOFF -DENABLE_DOXYGEN=3DOFF \
>=20
> This isn't enough, it still fails to build docs in jenkins builds (see
> status update email).

| xmlto: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t=
e-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml do=
es not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml:6: warnin=
g: failed to load external entity "/home/jenkins/oe/shr-core-branches/shr-c=
ore/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-tre=
llis/doc/docbookx.dtd"
| ]>
|   ^
| warning: failed to load external entity "/home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/gi=
t/gr-trellis/doc/docbookx.dtd"
| validity error : Could not load the external subset "docbookx.dtd"
| Document /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv=
5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml =
does not validate
| make[2]: *** [gr-trellis/doc/gr-trellis.html] Error 13
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/build'
| make[1]: *** [gr-trellis/doc/CMakeFiles/gr_trellis_html.dir/all] Error 2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGsj6MACgkQN1Ujt2V2gBzaugCfeAWoovTwgpPdF5dsovFPpJnb
KkIAoIsN11bd6b7a7vrm+xODw4nPze67
=M7YU
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
