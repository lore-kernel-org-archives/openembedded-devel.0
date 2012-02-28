Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2KcE-0004C9-2a
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 11:49:06 +0100
Received: by eekc1 with SMTP id c1so708570eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 02:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.181.193 as permitted sender) client-ip=10.14.181.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.181.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.181.193])
	by 10.14.181.193 with SMTP id l41mr11018070eem.26.1330425639107
	(num_hops = 1); Tue, 28 Feb 2012 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vRaoqX96eFjejzoZeg66Cg90U1VxUrhRlUbNtlMbK1w=;
	b=WK6W9z9l2+u6R3n928NkNsTVXoGEg8rpXxaAVpRbLYvQH13kT1abMXUZPI5ZsdiFFJ
	ZmnXhh1cnOwwQNBL45jxT5QIpFD6S3IoVWJIv0qWdrkP+ueFRbl3k4hTVr94fnS9mbNu
	2K+znWsP8saBnMDHTRAJLVhqs1RlgWNIv1PcQ=
Received: by 10.14.181.193 with SMTP id l41mr8217105eem.26.1330425638987;
	Tue, 28 Feb 2012 02:40:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm68936035eeb.7.2012.02.28.02.40.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 02:40:38 -0800 (PST)
Date: Tue, 28 Feb 2012 11:40:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120228104030.GA3910@jama.jama.net>
References: <jii6me$ae8$2@dough.gmane.org>
	<1330423441-653-1-git-send-email-Martin.Jansa@gmail.com>
	<4F4CA8F1.6060608@slimlogic.co.uk>
MIME-Version: 1.0
In-Reply-To: <4F4CA8F1.6060608@slimlogic.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv2] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Tue, 28 Feb 2012 10:49:06 -0000
X-Groupsio-MsgNum: 37511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 10:14:09AM +0000, Graeme Gregory wrote:
> Undetailed change below
>=20
> Graeme
>=20
> On 28/02/12 10:04, Martin Jansa wrote:
> > * virtual/kernel was needed only to provide omapfb.h in staging
> >    but that's now moved to BSP layers, no need to make sstate hash
> >    machine specific here.
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    6 +++---
> >   1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-=
oe/recipes-multimedia/mplayer/mplayer2_git.bb
> > index 3e4d369..0b73d57 100644
> > --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> > +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> > @@ -1,7 +1,7 @@
> >   DESCRIPTION =3D "Open Source multimedia player."
> >   SECTION =3D "multimedia"
> >   HOMEPAGE =3D "http://www.mplayerhq.hu/"
> > -DEPENDS =3D "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg=
 xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame =
libxv virtual/libx11 virtual/kernel libass \
> > +DEPENDS =3D "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg=
 xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame =
libxv virtual/libx11 libass \
> >   	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 =
lame', d)}"
> >
> >   RDEPENDS_${PN} =3D "mplayer-common"
> > @@ -18,10 +18,10 @@ SRC_URI =3D "git://repo.or.cz/mplayer.git;protocol=
=3Dgit;branch=3Dmaster \
> >
> >   SRCREV =3D "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
> >
> > -ARM_INSTRUCTION_SET =3D "ARM"
> > +ARM_INSTRUCTION_SET =3D "arm"
> This is obvious to us old school but should be detailed in changelog.

This recipe was only one using upper case ARM in this, and as classes
check only for '=3D=3D "thumb"' then this is just cosmetics no change in
behavior.

>=20
> >
> >   PV =3D "2.0+gitr${SRCPV}"
> > -PR =3D "r7"
> > +PR =3D "r8"
> >
> >   PARALLEL_MAKE =3D ""
> >
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Mrx4ACgkQN1Ujt2V2gBzhyQCeP5rpStNM8CaN3kHHT249Z32Q
4oQAn0THvazIRfzVsfz1IG+GfdLZFrn+
=kDwK
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
