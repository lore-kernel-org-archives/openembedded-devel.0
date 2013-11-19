Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 95F9E6D86B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 10:14:20 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1851182eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 02:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p3WGl/Lw5NZBiwB0ytcqbKCeJMJ+37B6LVa6b3Tq//4=;
	b=fzEy03OpR26W63Ki14pG9ZegCi0k7v2TqXXCVvvcvPS9+qFrvPjBsIpuNfGwnjSPOb
	o1aDiwrQyYKypKGOg+sEeZFYPHLKfI78pxXhOKBfy8/8WeN0k69buzV2YFzOdknGVdi0
	lmBeUVYIFjqy2hOVi0qRoiaB6rvCO9Zb7je9bVzC2Vn92R5QpyAxqObOK4IYdaVia5cq
	jQxoCRRgLGdGeX/uLx8LBPtM9SBwq/jbDUkCplVXFkHKYLka9JTxx6G9PwQN5dtzqI/J
	J7Tpjkz4FhDO0GDScEjOVI258EaQKnEOZxJTTwljgwLxvGJd4ddFGLwe30Jxs5krVfxj
	HrBg==
X-Received: by 10.15.24.142 with SMTP id j14mr2167906eeu.52.1384856061788;
	Tue, 19 Nov 2013 02:14:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o45sm29048901eep.2.2013.11.19.02.14.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 02:14:21 -0800 (PST)
Date: Tue, 19 Nov 2013 11:14:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131119101422.GC3708@jama>
References: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
	<1384548309-29331-2-git-send-email-schnitzeltony@googlemail.com>
	<20131118222319.GK3727@jama>
	<CALbNGRTmJbjEiLdWaC7v71ALUaEBup9-6F9uSU7BDf1kpF8Rgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTmJbjEiLdWaC7v71ALUaEBup9-6F9uSU7BDf1kpF8Rgg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 2/2] mpd: update to 0.18.4 and get sources from musicpd.org
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
X-List-Received-Date: Tue, 19 Nov 2013 10:14:21 -0000
X-Groupsio-MsgNum: 47178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 09:47:55AM +0100, Andreas M=FCller wrote:
> On Mon, Nov 18, 2013 at 11:23 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Fri, Nov 15, 2013 at 09:45:09PM +0100, Andreas M=FCller wrote:
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  .../musicpd/{mpd_0.17.1.bb =3D> mpd_0.18.4.bb}                   | 10=
 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.17.1.bb =3D>=
 mpd_0.18.4.bb} (89%)
> >>
> >> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb =
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> >> similarity index 89%
> >> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> >> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> >> index 6f2a912..b89eb0e 100644
> >> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> >> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> >> @@ -5,15 +5,15 @@ HOMEPAGE =3D"http://sourceforge.net/projects/musicpd"
> >>
> >>  DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faa=
d2 ffmpeg curl sqlite bzip2 pulseaudio"
> >>
> >> -PR =3D "r4"
> >> -
> >>  SRC_URI =3D " \
> >> -    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
> >> +    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
> >>      file://mpd.conf.in \
> >>  "
> >>
> >> -SRC_URI[md5sum] =3D "da3f3d6617a877192db4c6f53504cd38"
> >> -SRC_URI[sha256sum] =3D "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e96=
868a8979bdfdbe7c2e8"
> >> +SRC_URI[md5sum] =3D "0d881fb32f9d31afcdb0bb13cb78b9ab"
> >> +SRC_URI[sha256sum] =3D "6b171985f192603150c879d105dc4d05d701ac60a2db4=
1630a4dce823e068388"
> >> +
> >> +S =3D "${WORKDIR}/${PN}-0.18"
> >>
> >
> > Can you please review/test
> >
> > http://patchwork.openembedded.org/patch/56953/
> >
> > thanks
> >
> OK - hope to find time for that next week. Could you take the
> libmpd-patch meanwhile?

Yes, both mpd patches are already in queue for jenkins and will be
merged after world builds.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLOf4ACgkQN1Ujt2V2gBzrtQCfTOvpNPFKIxllR2HtiNF4qmHz
8FIAoIdkperpnTZc+xb2TvJDh84dPIA5
=ccQO
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
