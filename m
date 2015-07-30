Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1C41F762CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:41:47 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZKpxr-0004Ig-O5 from Joe_MacDonald@mentor.com ;
	Thu, 30 Jul 2015 08:41:47 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Jul 2015 08:41:46 -0700
Received: by burninator (Postfix, from userid 1000)	id A79DC58162E; Thu, 30
	Jul 2015 11:41:12 -0400 (EDT)
Date: Thu, 30 Jul 2015 11:41:12 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Message-ID: <20150730154112.GC6457@mentor.com>
References: <1437591250-9247-1-git-send-email-jslater@windriver.com>
	<20150722203127.GM22729@mentor.com>
	<007BD92917A2324FA403BCF9A464CF848235F768@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF848235F768@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
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
X-List-Received-Date: Thu, 30 Jul 2015 15:41:49 -0000
X-Groupsio-MsgNum: 56441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline

--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep a=
s broken] On 15.07.28 (Tue 19:39) Slater, Joseph wrote:

>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> > Sent: Wednesday, July 22, 2015 1:31 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependenc=
y but keep as
> > broken
> >=20
> > [[oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep a=
s broken] On
> > 15.07.22 (Wed 11:54) Joe Slater wrote:
> >=20
> > > We will need the conditional dependency on systemd.  It is
> > > not a good idea to use PNBLACKLIST in a recipe, and the
> >=20
> > It isn't a good idea to have a recipe that needs to be blacklisted.  :-)
> >=20
> > That said, it's here and there's still an argument for supporting it, so
> > why remove PNBLACKLIST and replace it with something less obvious?
>=20
> Blacklisting oneself is esthetically unpleasing.

I won't argue there.  But it happens because it's a less violent option
than kicking the recipe to the curb and waiting for pick-up day.  It
does allow someone using the recipe to come along and still use it for
their scenario if they need it and they know the reason for the
blacklisting doesn't apply to them.

> But, beyond that, it doesn't work for multilib variants, and for some
> reason PNBLACKLIST[${PN}] does not parse.

I don't know about that, but maybe a patch to poky is appropriate
instead.  It's nothing to be proud of, but there are dozens of recipes
in meta-openembedded/ right now that are blacklisted, unless you're
planning on submitting the same construct to replace all of them, I
don't think there's much more to discuss on it.

I'm marking this 'changes requested'.  Do you think you could re-submit
with just the dependency change?

Thanks,
-J.

>=20
> Joe
>=20
>=20
> >=20
> > No objection to a conditional dependency on systemd.
> >=20
> > -J.
> >=20
> > > version here does not suppress lib32-ypbind-mt.
> > >
> > > Signed-off-by: Joe Slater <jslater@windriver.com>
> > > ---
> > >  recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/m=
eta-
> > networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > index 4f8bf48..359b020 100644
> > > --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > @@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Binds t=
o \
> > >  the server which answered as first. \
> > >  "
> > >  HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> > > -DEPENDS =3D "yp-tools"
> > > +DEPENDS =3D "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd',=
 'systemd', '', d)}"
> > >  PROVIDES +=3D "ypbind"
> > >
> > > -PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> > > +python () {
> > > +    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-tools")
> > > +}
> > >
> > >  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.b=
z2 \
> > >             file://ypbind-yocto.init \
> > > --
> > > 1.7.9.5
> > >
> > --
> > -Joe MacDonald.
> > :wq
--=20
-Joe MacDonald.
:wq

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVukWYAAoJEEn8ffcsOfaWiTIIAJ58QFuZ2ce+FPcjQxAh0TFv
Q1Gb0eW3IBBo6mjsFbetVBRaKzqMl/iaebdzDCIOF5YszhjqbDWw5Poanrj+sp/w
qami0s1OUICaC8iZe5Pm5ozQAiCbQxF+X6oKmaaT2j2biTAVZO7+2SgGUrIL01jh
batgWpYMiONIu6oyT0j5tB179J8wBlkCLCKylWITkEfhzzV39veqzP4sHbfpfZLu
g3nmeGTRirPKgOWKoKPytyOSlX+Wtn0R2fBW/MeWCGDfuCxT2LwXHrSD/CpbSh40
fRaVr8H/8afcCrfjwo9P9/noJBNYjDEJNzuvnJup7BphRyWWYFDdDBFPLH2eItg=
=gEfj
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
