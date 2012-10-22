Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQIIC-0003bB-5n
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 15:43:59 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2000013wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8n+9343q5OFB0PX8IIe8tKO7Tgv1LNeve6+y83gqZLM=;
	b=A/Lnq17AJuIWI4tg3QIY0nsP56bdPe/wP5OI+UtN+InHvLH57gGmCiUCMgVpKQGld3
	60JQhLcOW2ZbssbqWIig1j+3UuSFIqK43105TWqBIh4bpjk4aGSQAlyhRt+IMXhG3N1i
	YvOnVkY6ib6JIhXC2TvRtmZEQMdHPqgxeK3GLdSuxWdR6BSI8h9iaSPAXxnGIPRUTxyF
	esQBPzXw6vehuu4R4itXPBpVh3VGWcEucmDzTanH/+BMWbMRL1+9Qx0PYPLBxFwTjbz8
	zFXHmlULTPi9/VbJn0KZEJd03DFo9hvjAlwxJsomQbimO0xtSqcFPQ5OJWDrC3c51W/N
	7D1w==
Received: by 10.180.87.34 with SMTP id u2mr21356567wiz.4.1350912619582;
	Mon, 22 Oct 2012 06:30:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm51091116wib.6.2012.10.22.06.30.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 06:30:18 -0700 (PDT)
Date: Mon, 22 Oct 2012 15:30:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121022133033.GJ3269@jama.jama.net>
References: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
	<7D46E86EC0A8354091174257B2FED10159275020@DLEE12.ent.ti.com>
	<CAGiJk9e0xzegmQ32NAkKFdvY+TcyP5ZtnvyUBk59cz0Tc1sQeQ@mail.gmail.com>
	<20121022132248.GI3269@jama.jama.net>
	<7D46E86EC0A8354091174257B2FED10159275338@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159275338@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 13:44:28 -0000
X-Groupsio-MsgNum: 41206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q5r20fdKX+PFtYHw"
Content-Disposition: inline

--q5r20fdKX+PFtYHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 01:26:59PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > Behalf Of Martin Jansa
> > Sent: Monday, October 22, 2012 8:23 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add
> > RPROVIDES to fix errors when rdepending on jpeg
> >=20
> > On Mon, Oct 22, 2012 at 03:20:35PM +0200, Samuel Stirtzel wrote:
> > > 2012/10/22 Maupin, Chase <chase.maupin@ti.com>:
> > > >> -----Original Message-----
> > > >> From: openembedded-devel-bounces@lists.openembedded.org
> > > >> [mailto:openembedded-devel-bounces@lists.openembedded.org]
> > On
> > > >> Behalf Of Samuel Stirtzel
> > > >> Sent: Monday, October 22, 2012 4:59 AM
> > > >> To: openembedded-devel@lists.openembedded.org
> > > >> Subject: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add
> > RPROVIDES to
> > > >> fix errors when rdepending on jpeg
> > > >>
> > > >> This fixes "ERROR: Multiple .bb files are due to be built
> > which
> > > >> each provide jpeg"
> > > >>
> > > >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> > > >> ---
> > > >>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
> > > >>  1 file changed, 3 insertions(+)
> > > >>
> > > >> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > > >> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > > >> index 2aefe1f..303bbae 100644
> > > >> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > > >> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> > > >> @@ -15,6 +15,9 @@ S =3D "${WORKDIR}/trunk"
> > > >>
> > > >>  # Drop-in replacement for jpeg
> > > >>  PROVIDES =3D "jpeg"
> > > >> +RPROVIDES_${PN} +=3D "jpeg"
> > > >> +RREPLACES_${PN} +=3D "jpeg"
> > > >> +RCONFLICTS_${PN} +=3D "jpeg"
> > > >
> > > > Does this need a PR bump?  Aside from that this has my ack.
> > > >
> > >
> > > The error message disappeared without PR bumps or rebuilding.
> > > Hopefully it doesn't need one, as that would trigger a rebuild
> > of many
> > > recipes (like Qt, gtk+, gtk+3)
> >=20
> > It needs one to replace jpeg with libjpeg-turbo on target.
> >=20
> > opkg won't replace it without PR bump afaik
>=20
> And it should not force a rebuild of the other packages I believe.    But=
 maybe this is a new behaviour.

It does with OEBasicHash, but what doesn't..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q5r20fdKX+PFtYHw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFSnkACgkQN1Ujt2V2gBzHqQCdGLQiyEQ/PtI0oNMkFMZqE0bN
IVkAn234Y9uS11KMLkBqayq8kprqh7ej
=qwB5
-----END PGP SIGNATURE-----

--q5r20fdKX+PFtYHw--
