Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8158D73D24
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 12:45:38 +0000 (UTC)
Received: by wgin8 with SMTP id n8so86880536wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rdGHa8jHOJF4tBNo44RCEO9lV9pPi3LVhCebJ3Rp+vc=;
	b=Oh+9D1vWCwU0Prc9v5IgaKKWXzHmPnpViC9IS4DH8uzCypiQJhYZKLS0dpO+eoayGN
	oq2ZVcFBcOcQygwHGx+ZhB9cy4ohU0M1oQRmd+F3m4PEgX+8bSKDkXP7sBCwMrxuucGl
	bGQlZjxjXEIS0HSceDu8BYb5uu0FNdk23Op4r6dD3l6nIBXnHEb+PTBB37tiNprmFsZG
	nsHWI4Ey294PM1QZYDdaJXvzhdIjDaUSj9bHJnA66yZBglN+YQBg0llP9dy3gxkTxs4t
	gI/ZV6WGDhgTSFb5z1LYqtAR7QZAvN6ug4Tg9wQkp2FfAVCWbKrdJhguWWjs4+ab/l/3
	M/Sg==
X-Received: by 10.180.74.230 with SMTP id x6mr14070900wiv.58.1428497139768;
	Wed, 08 Apr 2015 05:45:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m4sm15478467wjb.25.2015.04.08.05.45.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 05:45:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 14:45:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150408124542.GF2337@jama>
References: <cover.1428164164.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1428164164.git.akuster808@gmail.com>
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
X-List-Received-Date: Wed, 08 Apr 2015 12:45:39 -0000
X-Groupsio-MsgNum: 55010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline

--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2015 at 09:24:10AM -0700, Armin Kuster wrote:
> This is an major update for the Ruby package. For those interested in it,=
 please try it out and provide feedback on testing.
>=20
> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782=
ec:
>=20
>   python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
>=20
> are available in the git repository at:
>=20
>   git://github.com/akuster/meta-openembedded.git akuster/ruby_update
>   https://github.com//tree/akuster/ruby_update
>=20
> Armin Kuster (2):
>   ruby: package update to verison 2.2.1
>   README: update maintainer

This seems to be causing new QA warning from one ruby recipe:

bundler-1.6.2: bundler: Files/directories were installed but not shipped
  /usr/lib/ruby/gems/2.2.0/build_info
  /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]

can you check that?

>=20
>  meta-ruby/README                                   |   2 +-
>  meta-ruby/recipes-devtools/ruby/ruby.inc           |   8 +-
>  ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 --
>  .../ruby/ruby/remove-the-dependency-on-dir.patch   |  37 ---
>  .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 -
>  .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ------
>  .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 -----------
>  .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 --
>  .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 -
>  .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ------
>  ...kmf.rb-fix-race-conditions-at-install-ext.patch |  31 ---
>  .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 ---------------=
------
>  .../ruby/{ruby_1.9.3-p547.bb =3D> ruby_2.2.1.bb}     |  23 +-
>  13 files changed, 10 insertions(+), 762 deletions(-)
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extc=
onf-hardcode-wide-getaddr-info-test-outco.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-depen=
dency-on-dir.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-alway=
s-use-i386.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custo=
m-rubygems-location.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disab=
le-versioned-paths.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-insta=
ll-cross.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-=
verbose.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubyg=
ems-1.8.11-uninstaller.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix=
-race-conditions-at-install-ext.patch
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-=
binary-extensions.patch
>  rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p547.bb =3D> ruby_2.2=
=2E1.bb} (52%)
>=20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUlIvYACgkQN1Ujt2V2gBwYdgCgu3jevrDjXAWJc3PHSOgYXux0
K6wAniRsuZIUbdPDqEi/2w/CwOfgzT5F
=Q+f2
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
