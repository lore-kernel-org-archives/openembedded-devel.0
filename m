Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B43036AF46
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:24:49 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so1254987eei.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2013 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1+pag7LJ254ufMx7vCCA3N34cJQH2FgZlGl+V/Y4q5s=;
	b=lqfwpOGCZFLpRruQmptad0E1aw8IJPxUCOQYAfH034XBtYC6dE/P6blHbMphtQyGjl
	x9ezw5S4uMk8U8715wEDMUIXQjtVBx+Ov5Yabf+KSXjeHR94rq4TUmyLluTnpgtEUx3v
	+Y6dCO+bZZoABCPA9vflwPYAJpHs8JQt/Diffd/sI+rzvzS3G1ENV0Tsgn9ulifS1Ewe
	12/lVkdCUHlXo/702tBKdqI3khfMX7xJjCIvp1LAe6HV4sUv6IpAGDjTnrpxtbnS+DpJ
	sHa9bbMFIWknZVntIfP6h5DkhJUv/6yIsCvJ4n5vRQhXNPu79vOj5dAIj0zrxpXo++4l
	Dg1A==
X-Received: by 10.14.223.199 with SMTP id v47mr11226001eep.32.1373016290032;
	Fri, 05 Jul 2013 02:24:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm12334475eeo.14.2013.07.05.02.24.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 02:24:49 -0700 (PDT)
Date: Fri, 5 Jul 2013 11:24:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130705092454.GE3259@jama>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
	<5fec7e15e0f9d37c1b764f6e5998d5f70e46cecf.1372987207.git.Martin.Jansa@gmail.com>
	<20130705082559.GA4858@mail.zedat.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20130705082559.GA4858@mail.zedat.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 02/10] ruby: add missing dependency on ruby-native
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
X-List-Received-Date: Fri, 05 Jul 2013 09:24:50 -0000
X-Groupsio-MsgNum: 45302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline

--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 10:26:00AM +0200, Henning Heinold wrote:
> On Fri, Jul 05, 2013 at 03:23:46AM +0200, Martin Jansa wrote:
> > * without ruby available on host it fails:
> >   | NOTE: make LIBRUBYARG=3D-lruby-static
> >   |       CC =3D i586-starfish-linux-gcc  -m32 -march=3Di586 --sysroot=
=3D/OE/sysroots/qemux86
> >   |       LD =3D i586-starfish-linux-ld --sysroot=3D/OE/sysroots/qemux86
> >   |       LDSHARED =3D i586-starfish-linux-gcc  -m32 -march=3Di586 --sy=
sroot=3D/OE/sysroots/qemux86 -shared
> >   |       CFLAGS =3D -O2 -pipe -g -feliminate-unused-debug-types -fPIC
> >   |       XCFLAGS =3D -include ruby/config.h -include ruby/missing.h -f=
visibility=3Dhidden -DRUBY_EXPORT
> >   |       CPPFLAGS =3D   -I. -I.ext/include/i386-linux -I./include -I.
> >   |       DLDFLAGS =3D -Wl,-soname,libruby.so.1.9
> >   |       SOLIBS =3D -lpthread -lrt -ldl -lcrypt -lm
> >   | executable host ruby is required. use --with-baseruby option.
> >   | make: *** [.rbconfig.time] Error 1
> > ---
> >  meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-=
ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> > index 7c5be36..868d0ff 100644
> > --- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> > +++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> > @@ -1,7 +1,7 @@
> >  require ruby.inc
> >  PR =3D "${INC_PR}.0"
> > =20
> > -DEPENDS +=3D "libyaml"
> > +DEPENDS +=3D "libyaml ruby-native"
>=20
> Uhm,
>=20
> after compiling ruby myself it has some more depends like ssl or gdbm or =
do you need only a minimal version?

I don't use target version at all, I was just fixing errors from
missing mandatory dependencies.

Feel free to add PACKAGECONFIGs for optional deps.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHWkOYACgkQN1Ujt2V2gBwyfACeI6JxOkOB5MAkAGR3f1lP4BM5
DrgAn32TdaM0YCDfWVDmvff45FvxckS0
=yGxC
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--
