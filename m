Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PvXfU-0001lL-G2 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 17:15:52 +0100
Received: from f053039171.adsl.alicedsl.de ([78.53.39.171]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PvXdy-0004iu-8b for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 16:14:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D7107F9.90008@gmail.com>
References: <4D705C07.20508@freescale.com>
	<1299244359-5345-1-git-send-email-obi@opendreambox.org>
	<4D7107F9.90008@gmail.com>
Date: Fri, 04 Mar 2011 17:14:17 +0100
Message-ID: <1299255257.3830.37.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 16:15:52 -0000
X-Groupsio-MsgNum: 29927
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-EBpwQWdzkb76WlICHgSU"

--=-EBpwQWdzkb76WlICHgSU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 04.03.2011, 07:40 -0800 schrieb Khem Raj:
> On 3/4/2011 5:12 AM, Andreas Oberritter wrote:
> > Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> > ---
> > This was only compile-tested. It would be nice to get some feedback.
>=20
> Looks ok to me. Does it need any deps? May be building it from scratch=
=20
> will detect it if not otherwise
>=20
> Acked-by: Khem Raj <raj.khem@gmail.com>

With the dependencies addressed and =E2=80=A6

> >   recipes/mrouted/mrouted_3.9.4.bb |   23 +++++++++++++++++++++++
> >   1 files changed, 23 insertions(+), 0 deletions(-)
> >   create mode 100644 recipes/mrouted/mrouted_3.9.4.bb
> >
> > diff --git a/recipes/mrouted/mrouted_3.9.4.bb b/recipes/mrouted/mrouted=
_3.9.4.bb
> > new file mode 100644
> > index 0000000..4ba4111
> > --- /dev/null
> > +++ b/recipes/mrouted/mrouted_3.9.4.bb
> > @@ -0,0 +1,23 @@
> > +DESCRIPTION =3D "DVMRP multicast routing daemon"
> > +HOMEPAGE =3D "http://troglobit.com/mrouted.shtml"
> > +SECTION =3D "network"
> > +LICENSE =3D "BSD"
> > +
> > +SRC_URI =3D "ftp://ftp.vmlinux.org/pub/People/jocke/mrouted/mrouted-${=
PV}.tar.bz2"
> > +SRC_URI[md5sum] =3D "688b74fc42919d588f262e6b3c9c6d4c"
> > +SRC_URI[sha256sum] =3D "c697549b2e506a380575f7adb67e87288ef2295b97241b=
3a1aeb0e88b827a3e1"
> > +
> > +EXTRA_OEMAKE =3D " \
> > +        datadir=3D${datadir} \
> > +        mandir=3D${mandir} \
> > +        prefix=3D${prefix} \
> > +        sysconfdir=3D${sysconfdir} \
> > +        DESTDIR=3D${D} \
> > +"
> > +
> > +do_compile() {
> > +        oe_runmake
> > +}

=E2=80=A6 add a blank line (?) this is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

> > +do_install() {
> > +        oe_runmake install
> > +}

--=-EBpwQWdzkb76WlICHgSU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1xD9kACgkQPX1aK2wOHVhmyACeJFEywij69kWTivgwo88Toyot
2M8AnjRbKRv4epf31YcDotbz+wDiF5ZD
=jvG/
-----END PGP SIGNATURE-----

--=-EBpwQWdzkb76WlICHgSU--
