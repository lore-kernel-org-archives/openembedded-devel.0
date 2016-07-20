Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 574EF606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 15:38:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so7572778wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XEJCgL/vGKfpd57gZyM6RAPju5Kh3oJVumNG9/U9JVk=;
	b=OFDbWnrjIOXdZBxjNuCBDWIHTFA/sZsWtBOwb+Sjj3forWu4OjlF+Ccge00qubbujU
	V8O8CZiMP9ZBP7wJnMZEYejV+KuuyxOBTCkMOnyc1V8oRTNhQQV7RkVxD8vTAPiHcKcE
	zsBhauQukUUl1jqgyx+NVRYfeeTcii0/g/QXmN+vVB+WyUvmiJrA5h1UmKYKDWD2eWjx
	2pS1NEmE3txdPnrOTw/AlcGPNZumeTHaMcfAhfziZJ5ky1jtW0/3gGqzOsdP2ctKSVxx
	Giqyx/z8i3RCiYnZw9vvhQ1JiguyN6Pq+qZlwGavf4vwxFn9eLHy7nKpJHw98P7kUi67
	7RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XEJCgL/vGKfpd57gZyM6RAPju5Kh3oJVumNG9/U9JVk=;
	b=XfRUmFAHV3qFxjTEADeGH1d4bYJzjAMHq85wpoNfbgw1qc7REw20ZjY4+WgAl556Ru
	uS/vf2KqTQTySsxnRZE5imhlGHq0eyCRC1VgUGBdWpq6XxqX7zUheKt4kjVym6k0kcsz
	msso8E/gcuzA+CDu23u245sKlddmlug57wXfyDjvRPgwbu0sdtAxXWnvJu2zjBPIkp6x
	o4SCb2bsaQTMn8iX3tdoYIz6ZuLuDEUA5TecaKnVRIgE3X9PM3cDlDlI9jOs3u88FQCV
	dMAf29mou66/FJ+SpXNLsm+lVFuTtpdGJkGSLC7TCDGXFDmiaHJWt/04VZhMlhMAnJhg
	wHFQ==
X-Gm-Message-State: ALyK8tKUO9qqqcFWdeE4iOBNhJucMl6+XbLjPlXI7r6+Mj+/yAghcxDpcLzENy3PZw8nRA==
X-Received: by 10.194.229.34 with SMTP id sn2mr1929994wjc.7.1469029083754;
	Wed, 20 Jul 2016 08:38:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id g2sm1840674wjd.38.2016.07.20.08.38.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jul 2016 08:38:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jul 2016 17:38:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160720153809.seufsmt5tvjxudbb@jama>
References: <1468759895-10992-1-git-send-email-derek@asterius.io>
	<20160720140438.aladpjkzdb2j7jhd@jama>
	<CADNbA1pfR8Pbwq+cFBusPuPoa=JvO-dZfeq3aTr8=LCGzGkTsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1pfR8Pbwq+cFBusPuPoa=JvO-dZfeq3aTr8=LCGzGkTsw@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-python][PATCH] python-flask-bcrypt: update package RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2016 15:38:04 -0000
X-Groupsio-MsgNum: 62269
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gjuretnmsfxfg4sm"
Content-Disposition: inline

--gjuretnmsfxfg4sm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 10:34:30AM -0400, Derek Straka wrote:
> It looks like we need to drop 8fe0ebe6e25b4ca07d179a579aa4272266f69259 wh=
ile
> I work on a better fix.  I didn't notice the BBCLASSEXTEND which will cau=
se
> PYTHON_PN to evaluate differently when the native version is built.

OK, dropped from my testing branch (jansa/master) will push master-next
after verifying it helps.

> I have a v2 for 0720807a482cbad744faee60904da0739ca6d2c1 that moves the
> zlib RDEPENDS into the python2.7 version only.

Also updated in jansa/master
BTW: there were few trailing spaces in this one, I've removed them when
cherry-picking v2.

Thanks for quick update.

> On Wed, Jul 20, 2016 at 10:04 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Sun, Jul 17, 2016 at 08:51:35AM -0400, Derek Straka wrote:
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> >
> > I'm not sure which recent changes are causing this, but bitbake world
> > now shows couple ERROR messages:
> >
> > ERROR: Nothing RPROVIDES 'python-io-native' (but
> > virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-p=
ython/recipes-devtools/python/
> > python-cffi_1.7.0.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'python-io-native' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-io-native']
> > NOTE: Runtime target 'python-cryptography-vectors' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was:
> > ['python-cryptography-vectors', 'python-cryptography',
> > 'python-cffi-native', 'python-io-native']
> > NOTE: Runtime target 'python-cryptography-vectors-dev' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was:
> > ['python-cryptography-vectors-dev', 'python-cryptography',
> > 'python-cffi-native', 'python-io-native']
> > ERROR: Nothing RPROVIDES 'python-bcrypt' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-bcrypt_3.1.0.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-flask-bcrypt_0.7.1.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-bcrypt'
> > NOTE: Runtime target 'python-bcrypt' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-bcrypt']
> > NOTE: Runtime target 'python-flask-bcrypt-dev' is unbuildable, removing=
=2E..
> > Missing or unbuildable dependency chain was: ['python-flask-bcrypt-dev',
> > 'python-bcrypt']
> > ERROR: Nothing RPROVIDES 'python-bcrypt-dev' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-bcrypt_3.1.0.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-bcrypt-dev'
> > NOTE: Runtime target 'python-bcrypt-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-bcrypt-dev']
> > ERROR: Nothing RPROVIDES 'python-cryptography' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-cryptography_1.4.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-pyopenssl_16.0.0.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-cryptography'
> > NOTE: Runtime target 'python-cryptography' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-cryptography']
> > ERROR: Nothing RPROVIDES 'python-pyopenssl' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-pyopenssl_16.0.0.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-c=
onnectivity/gateone/
> > gateone_git.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl'
> > NOTE: Runtime target 'python-pyopenssl' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-pyopenssl']
> > NOTE: Runtime target 'gateone' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['gateone',
> > 'python-pyopenssl']
> > NOTE: Runtime target 'gateone-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['gateone-dev',
> > 'python-pyopenssl']
> > ERROR: Nothing RPROVIDES 'python3-zlib' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python3-werkzeug_0.11.10.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'python3-zlib' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-zlib']
> > NOTE: Runtime target 'python3-werkzeug' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-werkzeug',
> > 'python3-zlib']
> > NOTE: Runtime target 'python3-flask-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-flask-dev',
> > 'python3-werkzeug', 'python3-zlib']
> > NOTE: Runtime target 'python3-flask' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-flask',
> > 'python3-werkzeug', 'python3-zlib']
> > NOTE: Runtime target 'python3-flask-pymongo-dev' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was: ['python3-flask-pymongo-de=
v',
> > 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> > NOTE: Runtime target 'python3-flask-login' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-flask-login',
> > 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> > NOTE: Runtime target 'python3-flask-login-dev' is unbuildable, removing=
=2E..
> > Missing or unbuildable dependency chain was: ['python3-flask-login-dev',
> > 'python3-flask', 'python3-werkzeug', 'python3-zlib']
> > NOTE: Runtime target 'python3-werkzeug-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-werkzeug-dev',
> > 'python3-zlib']
> > ERROR: Nothing RPROVIDES 'python-pyopenssl-dev' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-pyopenssl_16.0.0.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl-dev'
> > NOTE: Runtime target 'python-pyopenssl-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-pyopenssl-dev']
> > ERROR: Nothing RPROVIDES 'python-cryptography-dev' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-cryptography_1.4.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-cryptography-dev'
> > NOTE: Runtime target 'python-cryptography-dev' is unbuildable, removing=
=2E..
> > Missing or unbuildable dependency chain was: ['python-cryptography-dev']
> > ERROR: Nothing RPROVIDES 'python3-flask-pymongo' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python3-flask-pymongo_0.4.1.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python3-flask-pymongo'
> > NOTE: Runtime target 'python3-flask-pymongo' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-flask-pymongo']
> > ERROR: Nothing RPROVIDES 'python-flask-bcrypt' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/
> > python-flask-bcrypt_0.7.1.bb RDEPENDS on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'python-flask-bcrypt'
> > NOTE: Runtime target 'python-flask-bcrypt' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python-flask-bcrypt']
> >
> > Can you please check why?
> >
> > > ---
> > >  meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb | 4
> > ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> > python-flask-bcrypt_0.7.1.bb b/meta-python/recipes-devtools/python/
> > python-flask-bcrypt_0.7.1.bb
> > > index d08883d..f035862 100644
> > > --- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> > > @@ -1,4 +1,4 @@
> > > -DESCRIPTION =3D "Brcrypt hashing for Flask."
> > > +DESCRIPTION =3D "Bcrypt hashing for Flask."
> > >  LICENSE =3D "BSD"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ee2ee5bee7fe96597770e92d=
b5719a8"
> > >
> > > @@ -9,4 +9,4 @@ PYPI_PACKAGE =3D "Flask-Bcrypt"
> > >
> > >  inherit pypi setuptools
> > >
> > > -RDEPENDS_${PN} =3D "python-bcrypt"
> > > +RDEPENDS_${PN} +=3D "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gjuretnmsfxfg4sm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlePmuAACgkQN1Ujt2V2gBzyXQCeKOhN1MjiXIpyY5kKTbiVUyT2
c+oAn1Yy7wBIlJoBLYYHxVAECRgIGZvD
=CAdK
-----END PGP SIGNATURE-----

--gjuretnmsfxfg4sm--
