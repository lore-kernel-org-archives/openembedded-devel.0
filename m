Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A7D8D60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 17:55:50 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so68409297wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PrwKyXAKoH6V04Ybl/FPuvhNbA38Favuh40UW+5/a+4=;
	b=kXt/XCoyrVtyiQc8C20hQgb6D73hwTKhv3S2v8TAtoOSS1EtjiBdI45Btm2UYGtlz6
	gl43FlOmO90NMUylWdxjmbFKk0WW8Go34wDKB2oPGMDJiz28dl+mDgjL5fs6IW3HR7dO
	THETJBFjUi4Co8IMVOrV1xLr1oD/UdlH9eUXSnqeBpArNcEthpS/efyvxSJpI7/rs/xl
	YmJPQBXXDSpfveBD1UpmxJGvFEL7H21mCK/er3EwTISjvdw4JwJe0s0MwVs7sNccgv0o
	GVwuwwBxeBQXde0pKRbvHzBvPLuCAT0iUjJYUmWu1aiQ3weaHh9kRDY35Igvr9ugpIdR
	RO/w==
X-Received: by 10.194.108.137 with SMTP id hk9mr50563991wjb.112.1428515751924; 
	Wed, 08 Apr 2015 10:55:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	i10sm16591672wja.40.2015.04.08.10.55.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 10:55:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 19:55:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150408175554.GA29645@jama>
References: <cover.1428164164.git.akuster808@gmail.com>
	<20150408124542.GF2337@jama> <55256909.9050304@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55256909.9050304@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/2] update ruby package
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
X-List-Received-Date: Wed, 08 Apr 2015 17:55:54 -0000
X-Groupsio-MsgNum: 55016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 10:44:41AM -0700, akuster808 wrote:
>=20
>=20
> On 04/08/2015 05:45 AM, Martin Jansa wrote:
> > On Sat, Apr 04, 2015 at 09:24:10AM -0700, Armin Kuster wrote:
> >> This is an major update for the Ruby package. For those interested in =
it, please try it out and provide feedback on testing.
> >>
> >> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5=
782ec:
> >>
> >>    python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
> >>
> >> are available in the git repository at:
> >>
> >>    git://github.com/akuster/meta-openembedded.git akuster/ruby_update
> >>    https://github.com//tree/akuster/ruby_update
> >>
> >> Armin Kuster (2):
> >>    ruby: package update to verison 2.2.1
> >>    README: update maintainer
> >
> > This seems to be causing new QA warning from one ruby recipe:
> >
> > bundler-1.6.2: bundler: Files/directories were installed but not shipped
> >    /usr/lib/ruby/gems/2.2.0/build_info
> >    /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]
> >
> > can you check that?
>=20
> sure.  what arch did you build for?

qemuarm, but I assume this issue will be arch-agnostic

>=20
> - armin
> >
> >>
> >>   meta-ruby/README                                   |   2 +-
> >>   meta-ruby/recipes-devtools/ruby/ruby.inc           |   8 +-
> >>   ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 --
> >>   .../ruby/ruby/remove-the-dependency-on-dir.patch   |  37 ---
> >>   .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 -
> >>   .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ------
> >>   .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 -----------
> >>   .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 --
> >>   .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 -
> >>   .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ------
> >>   ...kmf.rb-fix-race-conditions-at-install-ext.patch |  31 ---
> >>   .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 -----------=
----------
> >>   .../ruby/{ruby_1.9.3-p547.bb =3D> ruby_2.2.1.bb}     |  23 +-
> >>   13 files changed, 10 insertions(+), 762 deletions(-)
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-=
extconf-hardcode-wide-getaddr-info-test-outco.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-d=
ependency-on-dir.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-a=
lways-use-i386.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-c=
ustom-rubygems-location.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-d=
isable-versioned-paths.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-i=
nstall-cross.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-m=
kmf-verbose.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-r=
ubygems-1.8.11-uninstaller.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb=
-fix-race-conditions-at-install-ext.patch
> >>   delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8=
=2E11-binary-extensions.patch
> >>   rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p547.bb =3D> ruby=
_2.2.1.bb} (52%)
> >>
> >> --
> >> 2.3.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUla6oACgkQN1Ujt2V2gBwu9wCeKZ7x7JMagC1clLNhk4BcWt4j
pBUAoJzFMZaMnHVI57QTL5syFxc5VXmC
=rKkr
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
