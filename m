Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZl2q-0007ll-A6
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 17:42:44 +0200
Received: by wibhn14 with SMTP id hn14so3187907wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3mVwUFmSVywtY1lR/j78E6kTBbLQ0+X/LhPTqRnkBAc=;
	b=XyENWVjXYK+4DrhdJeBCJjdsgpUMiSElbV/9KeitNiwyL+k0qJief2UTBO91WbTkdV
	/ZQNnuRpC/iQW4ldw6GfMnL6l7ZSpiwNrfdqwkiy+6dv8fxwW8dQM+aQxG3LcNiWXk5s
	Kq/9Y/aBOX3lPfLu20b1D92D+TyyUaWOpa1k6tbPIGKTCNRbhjur3zxHrAGGUkDsW8K1
	veUUPVKibVuMmQIlR/3bynXpwe8w/7EbXs8QjrE+TZMMDSrsOlk6skToSLsACGSgt8yq
	M/PiHV4Iu7N1cQSXcg08Z8xukFO3jF87Q62S+DSQ4Qdyv2B7bBP4cDLlrEcvsPk5LWkP
	aOgw==
Received: by 10.216.141.15 with SMTP id f15mr10481593wej.82.1338391945627;
	Wed, 30 May 2012 08:32:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn9sm35793392wib.5.2012.05.30.08.32.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 08:32:24 -0700 (PDT)
Date: Wed, 30 May 2012 17:32:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120530153233.GR3138@jama.jama.net>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
	<2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
	<CALbNGRTHSa+An9tURPWUQRgzZL8dMWN2s1uYJ+WyH41W=y-98Q@mail.gmail.com>
	<20120530152220.GQ3138@jama.jama.net>
	<CALbNGRS2vZ5_57H+u8O=jWkXUy1UD__-aB6KwDTgY-gyXCen4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRS2vZ5_57H+u8O=jWkXUy1UD__-aB6KwDTgY-gyXCen4A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 2/3] systemd.bbclass: fix postinst/rdepends generation for recipes with SYSTEMD_SERVICE (without _PN suffix)
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
X-List-Received-Date: Wed, 30 May 2012 15:42:44 -0000
X-Groupsio-MsgNum: 39053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//h4sZKAxcnndsN6"
Content-Disposition: inline

--//h4sZKAxcnndsN6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 05:26:46PM +0200, Andreas M=FCller wrote:
> On Wed, May 30, 2012 at 5:22 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, May 30, 2012 at 05:14:58PM +0200, Andreas M=FCller wrote:
> >> On Wed, May 30, 2012 at 4:21 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> > =A0meta-oe/classes/systemd.bbclass | =A0 =A03 ++-
> >> > =A01 files changed, 2 insertions(+), 1 deletions(-)
> >> >
> >> > diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/syste=
md.bbclass
> >> > index db35717..e895021 100644
> >> > --- a/meta-oe/classes/systemd.bbclass
> >> > +++ b/meta-oe/classes/systemd.bbclass
> >> > @@ -201,7 +201,8 @@ python populate_packages_prepend () {
> >> > =A0 =A0 =A0 =A0# run all modifications once when creating package
> >> > =A0 =A0 =A0 =A0if os.path.exists('${D}'):
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for pkg_systemd in d.getVar('SYSTEMD_=
PACKAGES', 1).split():
> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar('SYSTEMD_S=
ERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_=
systemd, 1).strip():
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemd_services =3D d=
=2EgetVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SE=
RVICE', 1)
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if systemd_services an=
d systemd_services.strip():
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0syste=
md_generate_package_scripts(pkg_systemd)
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0syste=
md_add_rdepends(pkg_systemd)
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_check_services()
> >> > --
> >> > 1.7.8.6
> >> >
> >> Two questions:
> >>
> >> 1. Did you see [1]?
> >
> > no, did you forgot to attach it? :)
> >
> >> 2. What is that strip for?
> >
> > In one .bbappend I had something like
> >
> > SERVICES =3D "foo"
> > SERVICES_bar =3D ""
> > SYSTEMD_SERVICE +=3D "${SERVICES}"
> >
> > And space was ending in SYSTEMD_SERVICE causing this to be executed
> > without any real service in it (and failing).
> >
> > I can fix it by using _append but this .strip() looked like better
> > solution for other who don't notice extra whitespace.
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> Yes :)
> http://patches.openembedded.org/patch/28841/

Ah, sorry, I haven't noticed this, looks good too (I can fix that case
with extra whitespace in my .bbappend if needed).

both can fix this:
http://trac.shr-project.org/trac/ticket/2003

:)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--//h4sZKAxcnndsN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GPZEACgkQN1Ujt2V2gBwqCACeNn/ixhwVFQJFskaG3D6Q2VKw
OFAAoIeLEljN/lPiox/uqtPP/eINCJgS
=5Cp2
-----END PGP SIGNATURE-----

--//h4sZKAxcnndsN6--
