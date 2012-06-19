Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgsBx-0002OZ-5a
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 08:45:33 +0200
Received: by wgbdr1 with SMTP id dr1so4784029wgb.12
	for <openembedded-devel@openembedded.org>;
	Mon, 18 Jun 2012 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p4ZEgvA858pxEfQLRJ9CezMBqYsM1hafhIeOGEBfgQI=;
	b=DpA8PvAn+WI8THgCWdrDV48+nJbRDREg67Y1ATLtrf7exoe9VuEgA9pcJQYnzPaVh7
	HQZA0Ywh7Heboj1n1EnTPs0TKClmlhjudKrZFxI87cu84MbDnVj839jiJjdO8M+TLeWq
	6Fr6WaTUPJqdIslnWC6boAE63oodYJIakW9x0RxsUfn/7Q0pNOgXhUKJX1Fp2N7WEpmB
	uQefqdy4N4Bw4h/Hhn54Dgun9gsRsM8edWKLXFrzcjAqFVgoVg80VOwAF/WIqtdzw8sr
	9vxNAHi1ouyokn8pcLnmDv3WkZZ75W6fBfKrDphoYaFkz9jfzKsobYWDllPWidUlhH6Y
	TXaQ==
Received: by 10.216.80.212 with SMTP id k62mr9246883wee.18.1340087688352;
	Mon, 18 Jun 2012 23:34:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n6sm55274795wie.7.2012.06.18.23.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 23:34:47 -0700 (PDT)
Date: Tue, 19 Jun 2012 08:34:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20120619063448.GO3178@jama.jama.net>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
	<20120619060703.GA4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619060703.GA4845@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Tue, 19 Jun 2012 06:45:33 -0000
X-Groupsio-MsgNum: 39289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline

--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 08:07:03AM +0200, Apelete Seketeli wrote:
> Le 19-Jun-12, Martin Jansa a =E9crit:
> > On Tue, Jun 19, 2012 at 01:42:10AM +0200, Apelete Seketeli wrote:
> > > This fix regenerates the gtk+-2.20.1/no-demos.patch file because the
> > > targeted Makefile.am file changed since gtk+-2.10.1.
> > > The gtk+_2.20.1.bb recipe is also updated to fix an issue where
> > > no-demos.patch was not taken into account during the do_patch() stage.
> > >=20
> > > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > > ---
> > >  recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
> > >  recipes/gtk+/gtk+_2.20.1.bb             |    3 +--
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/g=
tk+-2.20.1/no-demos.patch
> > > index 0fc4c48..ac0730d 100644
> > > --- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> > > +++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> > > @@ -1,7 +1,8 @@
> > > ---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
> > > -+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
> > > -@@ -1,6 +1,6 @@
> > > +--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
> > > ++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
> > > +@@ -1,7 +1,7 @@
> > >   ## Makefile.am for GTK+
> > > + include $(top_srcdir)/Makefile.decl
> > >  =20
> > >  -SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules demos tests perf contrib
> > >  +SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules tests perf contrib
> > > diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> > > index 9cffee1..6e3c291 100644
> > > --- a/recipes/gtk+/gtk+_2.20.1.bb
> > > +++ b/recipes/gtk+/gtk+_2.20.1.bb
> > > @@ -1,10 +1,9 @@
> > >  require gtk+.inc
> > > =20
> > > -SRC_URI_append_virtclass-native =3D " file://no-demos.patch \
> > > -"
> > >  SRC_URI_append =3D "file://gtk-dnd-grab-deadlock-fix.patch \
> > >  		  file://cross-nm.patch \
> > >  		  file://xkb-ifdef.patch \
> > > +		  file://no-demos.patch \
> >=20
> > I guess this was because demos were working for target case and were
> > intentionally disabled only for native..
>=20
> In my oe setup I did not build gtk+-native. I added gtk+-native to the
> ASSUME_PROVIDED list in local.conf instead, and installed
> libgtk2.0-dev on my host machine.
> As a consequence, I faced this gtk+ issue while baking a target
> package, not a native one.
>=20
> Do you mean I shouldn't have fixed the issue the way I did ? What
> would be the best course of action then ?

As you can see in
http://git.openembedded.org/openembedded/commit/recipes/gtk+?id=3Da3b0920d0=
cc2cecac9eea4993ad18a64b207d7af
and
http://git.openembedded.org/openembedded/commit/recipes/gtk+?id=3Da3b0920d0=
cc2cecac9eea4993ad18a64b207d7af

no-demos.patch is intentionally applied only for gtk+-native and even
correctly packaged for target. So if you have issues building
gtk+_2.20.1.bb then rebasing gtk+-2.20.1/no-demos.patch is right, but
moving that patch from SRC_URI_append_virtclass-native to SRC_URI_append
is wrong.

BTW: I'm not using oe-classic at all, and I'm still reading oe-devel ML, pl=
ease=20
don't put me to To: directly, Thanks.

Cheers,

>=20
> Regards.
> --=20
>         Apelete

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/gHYgACgkQN1Ujt2V2gBwQNQCeN4Hj9F9IMnGNq/bVMQlW2La1
2iUAoIgQMrsMHhWN6AURZHCNlmYjICQy
=ElgB
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--
