Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ScIBH-0003j2-Nz
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:29:56 +0200
Received: by bkcjm2 with SMTP id jm2so5886948bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VYZIq5o+djFyh72BW4itxc1Ipw7AjI2ekJPzioXUhCs=;
	b=mDS9IiBc1McS0HX9bagBdtXWDwOxrLGShjRmK22pg3+8ol5o1LLA2kMcid8VxMxr74
	4zeQ3oTge/GkToQ7XIZoTRMb03muwOCsOkbDNv94JK0EicgQG3JKpipEjr+VphTsTvu/
	z+BhDO9PgFU9AMST/ZY+5B0HWyBC4Sug9ANH0J1vSGyE01apTk694IiIJeRWA/CgHAaw
	1Zw5gwo2Re1HSNasA6b/t3EA/WYB6WF2QPW3n/+E8Az6yd0Q1aWdGtcibbA3vaPWCe9x
	aLvA4NOw7sorv/NKGmMxhlDRYNSmDIoeG2zb6Rnm0lRLHCqpLs1ZHFuX+9zwlv/DeKYm
	5xkQ==
Received: by 10.204.151.200 with SMTP id d8mr13186362bkw.82.1338995968441;
	Wed, 06 Jun 2012 08:19:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id iq16sm227922bkc.6.2012.06.06.08.19.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:19:27 -0700 (PDT)
Date: Wed, 6 Jun 2012 17:19:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120606151939.GC3140@jama.jama.net>
References: <1338995599-32521-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<CAG3aBq4LamuK4MT3G4-+az123UCs91J1AvM2GEuK6MTWfRjpQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG3aBq4LamuK4MT3G4-+az123UCs91J1AvM2GEuK6MTWfRjpQA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] python-numpy : Add missing dependencies.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:29:57 -0000
X-Groupsio-MsgNum: 39160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 11:16:14AM -0400, Daniel McDougall wrote:
> Ignore this.  Apparently my 'git commit --amend' didn't catch my fix.

Try to catch
http://git.openembedded.org/meta-openembedded/commit/?id=3D036eb620206041bf=
1cf4be5a8c2a4947afb34382
and rebase

Cheers,

>=20
> On Wed, Jun 6, 2012 at 11:13 AM, Dan McDougall <
> daniel.mcdougall@liftoffsoftware.com> wrote:
>=20
> > Numpy was missing a number of dependencies in the .bb file without which
> > it will
> > not work. This v2 version of the patch fixes the difflib dependency.
> >
> > Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> > ---
> >  .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bbb/met=
a-oe/recipes-devtools/python/
> > python-numpy_1.4.1.bb
> > index 36ab622..bae624e 100644
> > --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > @@ -24,3 +24,8 @@ do_compile_prepend() {
> >
> >  SRC_URI[md5sum] =3D "5c7b5349dc3161763f7f366ceb96516b"
> >  SRC_URI[sha256sum] =3D
> > "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
> > +
> > +RDEPENDS_${PN} =3D "python-unittest \
> > +                  python-diffutils \
> > +                  python-pprint \
> > +                 "
> > --
> > 1.7.9.5
> >
> >
>=20
>=20
> --=20
> Dan McDougall - Chief Executive Officer and Developer
> Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
> 904-446-8323
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/PdQsACgkQN1Ujt2V2gBymIACfaROqN9hf0MSLL5w4iS/Dwq3+
VnQAmwZJgW7FjitTNWZ+Y21tCF9I6pmA
=bPZ3
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
