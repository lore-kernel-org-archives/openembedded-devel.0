Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZlJ3-0002mK-Pc
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 17:59:29 +0200
Received: by wibhm14 with SMTP id hm14so3547640wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u8k69nOl8ZEhoQ67oSpPg3cnadbW1exfN/n/KKhrf3o=;
	b=HgbLWcqnFjXTfuvlQwfGi+uPahofIE3g9+6k2u42farcFm5QM+QMfBlZ5EIkIaDaIj
	4jQftyXl96c15QOWmg8VPV3G+0naAhzTDVQjPePiiuPVZ5u/w3jX5ho3BKoGEryOWdaK
	q49yIufaPxzGYGmLEHZMBK+TM2hIvSfAf7LnInCPosgYpGqHVrDgFQCCuc0bJW8n65AB
	JXDJRW/sNsaOPeBPALzQSJ1alNPh/t6ZIS4ARbkzXsbm3I6nvZy/cjOtePSO8Fkp5d5a
	HPeC5qHOmq2pubfNm9vxjkQPAagriMDQnO5O049HyzR8tK6Z9jq0XR6NKw+j40rsp8gu
	Wr4w==
Received: by 10.216.225.23 with SMTP id y23mr151238wep.67.1338392951243;
	Wed, 30 May 2012 08:49:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm35876354wib.9.2012.05.30.08.49.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 08:49:10 -0700 (PDT)
Date: Wed, 30 May 2012 17:49:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120530154918.GS3138@jama.jama.net>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
	<2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
	<CALbNGRTHSa+An9tURPWUQRgzZL8dMWN2s1uYJ+WyH41W=y-98Q@mail.gmail.com>
	<20120530152220.GQ3138@jama.jama.net>
	<CALbNGRS2vZ5_57H+u8O=jWkXUy1UD__-aB6KwDTgY-gyXCen4A@mail.gmail.com>
	<20120530153233.GR3138@jama.jama.net>
	<CALbNGRTtxTWiLXG06uzUxy8oCBOaXrfsvN=JMHaAyFLSsY6W_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTtxTWiLXG06uzUxy8oCBOaXrfsvN=JMHaAyFLSsY6W_g@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 15:59:29 -0000
X-Groupsio-MsgNum: 39055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HywJcj55HbA57jnN"
Content-Disposition: inline

--HywJcj55HbA57jnN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 05:38:14PM +0200, Andreas M=FCller wrote:
> On Wed, May 30, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, May 30, 2012 at 05:26:46PM +0200, Andreas M=FCller wrote:
> >> On Wed, May 30, 2012 at 5:22 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Wed, May 30, 2012 at 05:14:58PM +0200, Andreas M=FCller wrote:
> >> >> On Wed, May 30, 2012 at 4:21 PM, Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> >> > ---
> >> >> > =A0meta-oe/classes/systemd.bbclass | =A0 =A03 ++-
> >> >> > =A01 files changed, 2 insertions(+), 1 deletions(-)
> >> >> >
> >> >> > diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/sy=
stemd.bbclass
> >> >> > index db35717..e895021 100644
> >> >> > --- a/meta-oe/classes/systemd.bbclass
> >> >> > +++ b/meta-oe/classes/systemd.bbclass
> >> >> > @@ -201,7 +201,8 @@ python populate_packages_prepend () {
> >> >> > =A0 =A0 =A0 =A0# run all modifications once when creating package
> >> >> > =A0 =A0 =A0 =A0if os.path.exists('${D}'):
> >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for pkg_systemd in d.getVar('SYSTE=
MD_PACKAGES', 1).split():
> >> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar('SYSTEM=
D_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + p=
kg_systemd, 1).strip():
> >> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemd_services =
=3D d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD=
_SERVICE', 1)
> >> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if systemd_services=
 and systemd_services.strip():
> >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sy=
stemd_generate_package_scripts(pkg_systemd)
> >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sy=
stemd_add_rdepends(pkg_systemd)
> >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_check_services()
> >> >> > --
> >> >> > 1.7.8.6
> >> >> >
> >> >> Two questions:
> >> >>
> >> >> 1. Did you see [1]?
> >> >
> >> > no, did you forgot to attach it? :)
> >> >
> >> >> 2. What is that strip for?
> >> >
> >> > In one .bbappend I had something like
> >> >
> >> > SERVICES =3D "foo"
> >> > SERVICES_bar =3D ""
> >> > SYSTEMD_SERVICE +=3D "${SERVICES}"
> >> >
> >> > And space was ending in SYSTEMD_SERVICE causing this to be executed
> >> > without any real service in it (and failing).
> >> >
> >> > I can fix it by using _append but this .strip() looked like better
> >> > solution for other who don't notice extra whitespace.
> >> >
> >> > Cheers,
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >> Yes :)
> >> http://patches.openembedded.org/patch/28841/
> >
> > Ah, sorry, I haven't noticed this, looks good too (I can fix that case
> > with extra whitespace in my .bbappend if needed).
> >
> > both can fix this:
> > http://trac.shr-project.org/trac/ticket/2003
> >
> > :)
> >
> > Cheers,
> >
> I think yours is better for your use case - sorry I still do not yet
> understand it - but don't worry for that. But my concern is that there
> are other places in systemd.bbclass failing for space issue. Did you
> check that?

Not specially for that, I know that I had this issue when introducing
systemd-machine-units and 2 machines were sharing same layer (same
=2Ebbappend with different services)

I thought it was between om-gta02 and om-gta04, but current .bbappend in
meta-smartphone/meta-openmoko has only services for gta02 so maybe I had
this use-case only in progress and then pushed version without this..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HywJcj55HbA57jnN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GQX4ACgkQN1Ujt2V2gBzO/wCghsyxatDTgI5frpiIB5V9ufcC
j4YAn3/L1MR/GlSkR8yzBX3STR0RWOcz
=7fto
-----END PGP SIGNATURE-----

--HywJcj55HbA57jnN--
