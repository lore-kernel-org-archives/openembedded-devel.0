Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOvLT-0003Jl-Og
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 21:01:28 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so6595200wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/CpW3EGmBOJAtL600CqnoDPBHNdT9zIR31ZR0sec7/M=;
	b=EsGByQDLRJJjKRJ9l8sjRDzcqqaMApgsW2lnAx7tyB1UiMNyw9LHs7W/wFZ8J2xDG0
	ElmLgwG3JFu3cUhoMlghkyMsyrFoD9N7PBZMYYDltzEQLbzluPYc7V4v93RbklVV8xcM
	Ty6TznkLGOmyE/ACZKok9z0rffvPYo6gmgQSh2ekWzTgr+uETrSkADu/s6l0SHe5pPf2
	b8XNRZMVCkn/oKQJW3MMhZUcoPTtHgb9pVCJkj3UGqZRpp5rIZEI+4uQynPswYI4iMOC
	BMMqZ4PYQp7K8mbtPkfLR8eRNg80BrdA89450XjLBbMLPQZTsO8fhztndvyqNmISeOtC
	YVNQ==
Received: by 10.180.100.136 with SMTP id ey8mr13296512wib.1.1350586087962;
	Thu, 18 Oct 2012 11:48:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm30872266wib.10.2012.10.18.11.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 11:48:05 -0700 (PDT)
Date: Thu, 18 Oct 2012 20:48:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121018184815.GD3087@jama.jama.net>
References: <1350579089-23342-1-git-send-email-gary@mlbassoc.com>
	<20121018174642.GC3087@jama.jama.net>
	<50804A6C.5020607@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50804A6C.5020607@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] [meta-oe] libav: Fix git URI
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
X-List-Received-Date: Thu, 18 Oct 2012 19:01:28 -0000
X-Groupsio-MsgNum: 41143
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline

--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 12:29:00PM -0600, Gary Thomas wrote:
> On 2012-10-18 11:46, Martin Jansa wrote:
> > On Thu, Oct 18, 2012 at 10:51:29AM -0600, Gary Thomas wrote:
> >> Specifying SRCREV and branch in the git SRC_URI confuses the bitbake
> >> fetcher.  This ends up with a saved tarball which contains neither
> >> the SRCREV nor the branch, which in turn means the git tree needs
> >> to be fetched every time even though a saved tarball has been created.
> >
> > That's fetcher fault.
> >
> > Branch is part of persistent db key for LOCALCOUNT, so this breaks
> > upgrade path.
> >
> > Also AUTOREV wont work without branch specified in SRC_URI.
>=20
> AUTOREV is not being used, so how does your comment apply?

yes it's good practise to use it from some .inc even or local.conf,
_without_ need to change SRC_URI

> > Fix bitbake fetcher instead.
> >
> > Cheers,
> >
> >
> >> Simply removing the branch (which is redundant anyway) from the SRC_URI
> >> makes everything happy.
> >>
> >> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >> ---
> >>   meta-oe/recipes-multimedia/libav/libav_0.8.3.bb |    4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe=
/recipes-multimedia/libav/libav_0.8.3.bb
> >> index 66a32c9..f9a2e06 100644
> >> --- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
> >> +++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
> >> @@ -6,13 +6,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db23=
4ee4d69f5fce4486a80fdaf4a4263 \
> >>                       file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d9=
83680233ad02"
> >>
> >>   PV =3D "0.8.3+git${SRCPV}"
> >> -PR =3D "${INC_PR}.0"
> >> +PR =3D "${INC_PR}.1"
> >>
> >>   # When bumping SRCREV make sure you bump PR here and in dependant
> >>   # recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
> >>   # changes
> >>   SRCREV =3D "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
> >> -SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit;branch=3Dre=
lease/0.8"
> >> +SRC_URI =3D "git://git.libav.org/libav.git;protocol=3Dgit"
> >>
> >>   S =3D "${WORKDIR}/git"
> >>
> >> --
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCATu8ACgkQN1Ujt2V2gBytNACfYfuQ4kBxlHvtG9FYpUvSw8dA
EiMAoJfvZXoS0mPtC4a6LmAmoTXc8unk
=W6R7
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
