Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3038D733F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:20:54 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so10019874wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yFQ3hkEwhPr29oA5EVUwIGQJtk+NvNinLfE8a2UIkTc=;
	b=Bva5fbOc/UerYMugd1K3XcWJ1sFOANB+OwkObo/7io1zMTmTGedqtIiGduzyjPyqHQ
	n2bowyjouognHeSnJW8zf3RADYq16Old3QIzQ0M1VV10k8T/JUeKEDz9WMFx4t5GXAqi
	rv+0D2p5pPEQsbOewlOiEvgj8rzZT5pym4AA64fyOAKr4CKoLNK5TNP70AWtwM4zJjax
	1AFGjTLeVIkP+iew2fAlsnZSFXieeHNCzzxErsRhSlEpfSaMR85AYOgs75CvVTOBHi15
	+0lFYfX6XtDWm+iC6vWoazxX/FeYWL7K0lsqk/a+jjSA2HcS4It6PzJo7HSK1jolj4Uz
	71tA==
X-Received: by 10.194.187.236 with SMTP id fv12mr7961969wjc.131.1423779655614; 
	Thu, 12 Feb 2015 14:20:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm7436842wjc.13.2015.02.12.14.20.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:20:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:20:59 +0100
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150212222059.GI2272@jama>
References: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
	<20150212183043.GF2272@jama> <54DD1C8B.90205@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <54DD1C8B.90205@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mplayer2: Remove blacklist
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
X-List-Received-Date: Thu, 12 Feb 2015 22:20:57 -0000
X-Groupsio-MsgNum: 54238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="itqfrb9Qq3wY07cp"
Content-Disposition: inline

--itqfrb9Qq3wY07cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 02:35:07PM -0700, Gary Thomas wrote:
> On 2015-02-12 11:30, Martin Jansa wrote:
> > On Tue, Feb 03, 2015 at 06:44:07AM -0700, Gary Thomas wrote:
> >> mplayer2 no longer needs to be blacklisted as OE-core has moved
> >> to libav_9.16
> >
> > Please fix following issues before blacklisting it:
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc,
> > but it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but
> > it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver,
> > but it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it
> > isn't a build dependency? [build-deps]
>=20
> This must be an inferred dependency as mpg123 is not in meta-oe, but
> rather meta-multimedia and it is possible to build mplayer using only
> meta-oe and not meta-multimedia.  How should that be handled?

PACKAGECONFIG[mpg123] which isn't enabled by default (so that people
with meta-multimedia can enable it if they want and by default it's
explicitly disabled for everybody

> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19,
> > but it isn't a build dependency? [build-deps]
> >
> >> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >> ---
> >>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta=
-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> >> index 7c04ff1..089aa15 100644
> >> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> >> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> >> @@ -13,8 +13,6 @@ RCONFLICTS_${PN} =3D "mplayer"
> >>   LICENSE =3D "GPLv3"
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
> >>
> >> -PNBLACKLIST[mplayer2] ?=3D "Requires newer libav which has negative D=
_P"
> >> -
> >>   SRC_URI =3D "git://repo.or.cz/mplayer.git \
> >>       file://0001-configure-don-t-disable-ASS-support-when-explicitly-=
=2Epatch \
> >>   "
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--itqfrb9Qq3wY07cp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdJ0sACgkQN1Ujt2V2gBwD4wCgr+uUOJ9PCQ24VF9wvMpX9LLn
SYkAn2YISqQ/2Rcxzj2aAJExXrHmXqyz
=LjTw
-----END PGP SIGNATURE-----

--itqfrb9Qq3wY07cp--
