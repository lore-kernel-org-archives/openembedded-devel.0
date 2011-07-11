Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qg4zx-0000uz-CK for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 03:09:21 +0200
Received: from f053034122.adsl.alicedsl.de ([78.53.34.122]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qg4wd-00057R-PO; Mon, 11 Jul 2011 01:05:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAD=GYpaP+M+HdYLTvNx668E+V1UVw3xRJrrSZbv9qGR6MkzOHA@mail.gmail.com>
References: <CAD=GYpaP+M+HdYLTvNx668E+V1UVw3xRJrrSZbv9qGR6MkzOHA@mail.gmail.com>
Date: Mon, 11 Jul 2011 03:05:26 +0200
Message-ID: <1310346326.25942.37.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Joel A Fernandes <agnel.joel@gmail.com>
Subject: Re: [PATCH] pulseaudio: Switch to version version 0.9.22
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
X-List-Received-Date: Mon, 11 Jul 2011 01:09:21 -0000
X-Groupsio-MsgNum: 33102
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7uRVS7ZXb8HFfuyip7io"

--=-7uRVS7ZXb8HFfuyip7io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Samstag, den 09.07.2011, 19:39 -0500 schrieb Joel A Fernandes:

> > I do not know if the commit summary is correct and if it should be
> > prepended with ?angstrom?.
>=20
> Why do say that the commit summary is not correct? The conf file being
> patched is for the Angstrom 2011.03 distribution.

that is why it should be prepended with angstrom like it is done in
other changes to those files.

	$ git log conf/distro/include/angstrom*

> >> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
> >>  * Pulseaudio keeping audio devices busy when run as per-user instance
> >>  * Failure of pactl, pacmd etc to connect to the pulseaudio server
> >
> > Please always include links to corresponding list threads if they are
> > available.
> >
> >> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> >> ---
> >> Notes:
> >> * This has to go into the OpenEmbedded 2011.03-maintenance branch as t=
here is no such configration file in the master branch
> >
> >        $ git grep pulse conf/distro
> >        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERR=
ED_VERSION_gst-pulse    =3D "0.9.7"
> >        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERR=
ED_VERSION_pulseaudio   =3D "0.9.15"
> >        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERR=
ED_VERSION_gst-pulse    =3D "0.9.7"
> >        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERR=
ED_VERSION_pulseaudio   =3D "0.9.22"
> >        [?]
> >
> > So you your change could actually be applied to master?
>=20
> I was trying to say that the conf file involved doesn't exist in the
> master branch
>=20
> >>  conf/distro/angstrom-2008.1.conf                   |    3 +++
> >>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
> >>  2 files changed, 4 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2=
008.1.conf
> >> index ae1ed4c..7b4f25a 100644
> >> --- a/conf/distro/angstrom-2008.1.conf
> >> +++ b/conf/distro/angstrom-2008.1.conf
> >> @@ -121,6 +121,9 @@ PREFERRED_VERSION_binutils_avr32 =3D "2.17"
> >>  PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
> >>  PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
> >>
> >> +ANGSTROM_PULSEAUDIO_VERSION          =3D "0.9.15"
> >> +ANGSTROM_PULSEAUDIO_VERSION_armv7a   =3D "0.9.22"
> >> +
> >
> > 1. Where did you find this syntax?
> >
> >        $ git grep PULSE conf/distro/
> >
> > does not find anything in branch master.
>=20
> Yes, I didn't either because I was the first one to add it. :) There
> are other variables in the same conf file that provide overrides in a
> similar way. Why do you think is the syntax not correct?

Well, since in my opinion this variable is redundant. Just change the
versions in the file under `/include/`.

> > 2. Could you add an explanation, why 0.9.22 is not used for everything
> > and only for armv7a. Is that because of commit cce5e648 [1]?
>=20
> I'm not sure which commit causes a problem, but Koen can explain more.
> >From what I understand, the compiler doesn't support building this
> version of pulseaudio for armv7a. Koen?

The old Linux kernel in 2008.1 does not support this for non armv7a
according to Koen=E2=80=99s answer.

> >>  PREFERRED_PROVIDER_dbus-glib             =3D "dbus-glib"
> >>  PREFERRED_PROVIDER_hotplug               =3D "udev"
> >>  PREFERRED_PROVIDER_opkg                 ?=3D "opkg"
> >> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc =
b/conf/distro/include/angstrom-2008-preferred-versions.inc
> >> index b5b524a..e4b8bf1 100644
> >> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> >> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> >> @@ -44,7 +44,7 @@ PREFERRED_VERSION_pango-native     =3D "1.24.4"
> >>  #PREFERRED_VERSION_pixman    =3D "0.13.2"
> >>  PREFERRED_VERSION_pkgconfig  =3D "0.23"
> >>  PREFERRED_VERSION_pkgconfig-native =3D "0.23"
> >> -PREFERRED_VERSION_pulseaudio         =3D "0.9.15"
> >> +PREFERRED_VERSION_pulseaudio         =3D "${ANGSTROM_PULSEAUDIO_VERSI=
ON}"
> >>  PREFERRED_VERSION_python-pycairo =3D "1.8.0"
> >>  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
> >>  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
> >
> > So I would prefer, if you would change the version just in this file an=
d
> > such a patch could go into branch master first.
>=20
> master doesn't have a conf/distro/angstrom-2008.1.conf so I'm not sure
> how I can create a patch for the master branch?

The following change in

	/conf/distro/include/angstrom-2008-preferred-versions.inc

should be enough, should not it?

        PREFERRED_VERSION_pulseaudio         =3D "0.9.15"
        +PREFERRED_VERSION_pulseaudio_armv7a =3D "0.9.22"

> > Even better would be the following.
> >
> > 1. Package PA 0.9.23 for oe-dev. If I remember correctly I send all
> > patches upstream and it should work for all architectures(?).
> > 2. Prefer PA 0.9.23 for ?ngstr?m and other distributions.
> > 3. Remove older PA versions.
> > 4. Cherry pick these changes into branch 2011.03-maintenance.
> >
> > Joel, do you have time and motivation to do that?
>=20
> Motivation is there, but time isn't ;). I can make an effort to do
> this at some point though. Thanks,

As Koen answered, this plan would not work.


Thank you for your answers,

Paul

--=-7uRVS7ZXb8HFfuyip7io
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4aTFYACgkQPX1aK2wOHViYkgCbBWRgBSuIp1Dfmer3WV7wxz0w
96MAn1Ag6a+TBZtYVd+Agj8FGX1L7G+2
=F6KO
-----END PGP SIGNATURE-----

--=-7uRVS7ZXb8HFfuyip7io--
