Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UM06B-0007Fe-6B
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 19:01:51 +0100
Received: by mail-pa0-f45.google.com with SMTP id kl13so762552pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uCdxj3tVaycQJH4fd4GFLPu60zabEXSNU72xc5Ai1Ms=;
	b=GMbiVSVxSpTZE19JkrnPD3afD09tN6MRz3RoPdQIP80SeA2mDzIwJnZJR0REdIfX0d
	dWm0yaCPnm3rkUL8RbhCn9XUGmYwPv+Q1WrGNDu4+8nbUiqbue28Z0xWqBqiHfx3IKdE
	fmtBWzd3iE+E4CC56fWfWLg0ukJzM0vJlefVogSje/3XXYpwkl3ldjEWm8y3gRGNYFlQ
	yOAcV0ov3mpRIRaZndxaousJuhFJb4Dyi2hNXEB135jqunUeN+JkV+iE+VQ+htFSSRwT
	+wz9KnrWKT3eS++HyRRgk8DsxM0ponOKOvZp1lxlGvMexdbwgofUWwRfOD+lJIhvjLKy
	OKYA==
X-Received: by 10.66.250.161 with SMTP id zd1mr10628293pac.141.1364665484267; 
	Sat, 30 Mar 2013 10:44:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm7240969pbg.18.2013.03.30.10.44.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 30 Mar 2013 10:44:43 -0700 (PDT)
Date: Sat, 30 Mar 2013 18:44:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130330174444.GN11120@jama>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
	<1357139774-4364-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+T6QPnFy=OAdiAi7H0avHn0AK-qbtEbMBBkizF7OWYtL4qGyQ@mail.gmail.com>
	<CA+T6QPm1H5g_Pu029vi4Yc8GcEDsb3jRgw8oTFc_UHQbad3g0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+T6QPm1H5g_Pu029vi4Yc8GcEDsb3jRgw8oTFc_UHQbad3g0Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xfce/meta-gnome/V2 01/10] exo: update to 0.10.2
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
X-List-Received-Date: Sat, 30 Mar 2013 18:01:51 -0000
X-Groupsio-MsgNum: 43814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7fwXp2o0gOrkU5lS"
Content-Disposition: inline

--7fwXp2o0gOrkU5lS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2013 at 01:14:13PM -0400, Jason Kridner wrote:
> On Sat, Mar 30, 2013 at 1:05 PM, Jason Kridner <jkridner@beagleboard.org>=
 wrote:
> > On Wed, Jan 2, 2013 at 10:16 AM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >>
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 ++--
> >>  .../exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb}            |    4 ++--
> >>  2 files changed, 4 insertions(+), 4 deletions(-)
> >>  rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb =3D> exo_0.10.2.bb} (=
87%)
> >
> >
> > There seems to be a missing dependency on some Perl modules[1]:
> >
> > | checking for perl module URI::Escape... no
> > | checking for perl module URI::file... no
> > | checking for perl module URI::URL... no
> > | configure: error: Atleast one of the required Perl modules
> > (URI::Escape, URI::file and URI::URL) was not found on your system
> > | Configure failed. The contents of all config.log files follows to
> > aid debugging
> >
> > [1] https://s3.amazonaws.com/beagleboard/angstrom-2013-03-30-16%3A24%3A=
13/build.log
> >
> > I'm working on a patch.
>=20
> k, it seems that the builds use the Perl packages in the host system
> and not perl-native, so probably the right thing to do is for me to
> simply add it to my host system.
>=20
> For Ubuntu, that is 'sudo apt-get install liburi-perl'.
>=20
> Is this something we'd want to avoid having as a host dependency in the f=
uture?

I would prefer to inherit perlnative and add it as dependency.

If you managed to build the rest without liburi-perl, then it's not so
common on host..

>=20
> >
> >>
> >>
> >> diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfc=
e/recipes-xfce/exo/exo/configure.patch
> >> index 2ccfcfc..ef27e42 100644
> >> --- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
> >> +++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
> >> @@ -1,5 +1,5 @@
> >> ---- exo-0.3.4/configure.in~    2007-12-02 10:37:06.000000000 -0200
> >> -+++ exo-0.3.4/configure.in     2008-06-05 17:21:42.000000000 -0300
> >> +--- a/configure.ac     2007-12-02 10:37:06.000000000 -0200
> >> ++++ b/configure.ac     2008-06-05 17:21:42.000000000 -0300
> >>  @@ -127,22 +127,24 @@
> >>   dnl ***************************************
> >>   dnl *** Check for strftime() extensions ***
> >> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb b/meta-xfce/recip=
es-xfce/exo/exo_0.10.2.bb
> >> similarity index 87%
> >> rename from meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
> >> rename to meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> >> index af9103f..4fdfd48 100644
> >> --- a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
> >> +++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> >> @@ -13,8 +13,8 @@ SRC_URI +=3D " \
> >>      file://gnome-mount \
> >>  "
> >>
> >> -SRC_URI[md5sum] =3D "189bd19210e1d7d8601be1cdf27bf259"
> >> -SRC_URI[sha256sum] =3D "6e21aa30692affcb45fc8283d034da4a02221d26e3e1f=
acb968d04fed4ba05b0"
> >> +SRC_URI[md5sum] =3D "c70f2a217811bfba2e62f938d4b8f748"
> >> +SRC_URI[sha256sum] =3D "b385828bf8a38204da3254b57fdfa25a72694495aa189=
fabd5040f707eec76ce"
> >>
> >>  # see http://wiki.xfce.org/gnomemount-replacement
> >>  do_install_append () {
> >> --
> >> 1.7.4.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7fwXp2o0gOrkU5lS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFXJIwACgkQN1Ujt2V2gBymDwCfYLCrzQsYVeWZ/yufCvzNktbh
la0AnjYS78ibaMJLDcRM6Qgdv8Hm+fQp
=Rcga
-----END PGP SIGNATURE-----

--7fwXp2o0gOrkU5lS--
