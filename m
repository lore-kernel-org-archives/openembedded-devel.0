Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz3Jj-000383-7e for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 10:07:49 +0200
Received: from f053038003.adsl.alicedsl.de ([78.53.38.3] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz3Je-0004Fe-QI for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 08:07:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim8cnSprD7+T_vZF-nrJ24V8u6PnZGjpUd0q+gd@mail.gmail.com>
References: <4C9950EA.2070306@gmail.com>
	<AANLkTim8cnSprD7+T_vZF-nrJ24V8u6PnZGjpUd0q+gd@mail.gmail.com>
Date: Fri, 24 Sep 2010 10:07:33 +0200
Message-ID: <1285315653.3715.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] mythfront-config.bb: Fix do_unpack for machines other than epia.
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
X-List-Received-Date: Fri, 24 Sep 2010 08:07:54 -0000
X-Groupsio-MsgNum: 23924
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dm2xP7AV1D/2TeDWd2IO"

--=-dm2xP7AV1D/2TeDWd2IO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 24.09.2010, 09:24 +0200 schrieb Frans Meulenbroeks:
> 2010/9/22 Graham Gower <graham.gower@gmail.com>:
> > Signed-off-by: Graham Gower <graham.gower@gmail.com>
> > ---
> >  recipes/mythfront/mythfront-config.bb |   14 ++++++++------
> >  1 files changed, 8 insertions(+), 6 deletions(-)
> >
> Thanks for unbreaking this.
> I've never noticed this, but I must say I didn't really peek into this on=
e.
>=20
> Some concerns wrt the rest of the recipe though
>=20
> > diff --git a/recipes/mythfront/mythfront-config.bb b/recipes/mythfront/=
mythfront-config.bb
> > index b87e0be..79ba428 100644
> > --- a/recipes/mythfront/mythfront-config.bb
> > +++ b/recipes/mythfront/mythfront-config.bb
> > @@ -1,11 +1,12 @@
> >  PV =3D "1.10"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  RDEPENDS_${PN} =3D "font-misc-misc"
>=20
> This is not sufficient. There should also be a dependency on mythtv
> itself and on lirc (but maybe mythtv will drag than one in)
>=20
> >  LICENSE =3D "MIT"
> > -SRC_URI =3D "file://tftp.sh file://xorg.conf"
> > +SRC_URI =3D "file://tftp.sh"
> >
> > -SRC_URI_append_epia =3D " file://serial.sh"
> > +SRC_URI_append_epia =3D " file://serial.sh \
> > +                       file://xorg.conf"
> >
> >  do_install() {
> >        install -d ${D}${sysconfdir}/udhcpc.d/
> > @@ -14,9 +15,6 @@ do_install() {
> >        install -d ${D}${sysconfdir}/mythtv
> >        ln -sf /var/lib/config/mysql.txt ${D}${sysconfdir}/mythtv
>=20
> This is already done if you install mythtv-database
> >
> > -       install -d ${D}${sysconfdir}/X11
> > -       install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11
>=20
> Not sure if this is good. for epia there is an xorg.conf, but it is
> not in the SRC_URIL for non-epia, so it cannot be installed for these
> (unless you get it from somewhere else)

As far as I can see, this problem is the actual purpose of Graham=E2=80=99s
patch. It moves these commands to `do_install_append_epia()`.

> > -
> >        ln -sf /var/lib/config/lircd.conf ${D}${sysconfdir}/lircd.conf
>=20
> and i would say lirc should perhaps do this.
> >
> >        install -d ${D}/dev
> > @@ -30,3 +28,7 @@ do_install() {
> >        fi
> >  }
> >
> > +do_install_append_epia() {
> > +       install -d ${D}${sysconfdir}/X11
> > +       install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11
> > +}
> > --

Adhering to the mantra of small changes, I would acknowledge this patch
and get your concerns addressed in another patch. Frans, as one of the
MythTV maintainers, your Acked-by would be appreciated too, I guess.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-dm2xP7AV1D/2TeDWd2IO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkycXEUACgkQPX1aK2wOHViFxgCfWKK5/RJcaEJOCdp0rGC0tMUl
GqEAn0Ix3dRXF6SPlcf8YpZfAlINeka8
=95Fp
-----END PGP SIGNATURE-----

--=-dm2xP7AV1D/2TeDWd2IO--
