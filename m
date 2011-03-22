Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zMw-0008Is-JX for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 12:03:24 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zLC-00007l-Ra for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:01:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110322105613.GC3418@jama.jama.net>
References: <1300790542.3827.19.camel@mattotaupa>
	<20110322105613.GC3418@jama.jama.net>
Date: Tue, 22 Mar 2011 12:01:33 +0100
Message-ID: <1300791693.26064.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/3] ipkg: remove legacy staging and install `libipkg.pc` properly
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
X-List-Received-Date: Tue, 22 Mar 2011 11:03:27 -0000
X-Groupsio-MsgNum: 30496
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PEkfHpXIuN3i4X7dIOjI"

--=-PEkfHpXIuN3i4X7dIOjI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 22.03.2011, 11:56 +0100 schrieb Martin Jansa:
> On Tue, Mar 22, 2011 at 11:42:22AM +0100, Paul Menzel wrote:
> > Date: Tue, 22 Mar 2011 10:51:47 +0100
> >=20
> > Convert to new style staging [1] and install `libipkg.pc` properly as d=
one in [2][3].
> >=20
> > [1] http://openembedded.org/index.php/Legacy_staging
> > [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc2c=
8fe4c5629add94bd0b922f5b3446624a9f4d8
> > [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D488=
38f0fca6b00767115dd13bce2537f035fd3ba
>=20
> Is it worth to update it now when I hope last bits were also converted
> to opkg?

`gpe-package` depends on `libipkg`.

> git mv to obsolete would be easier to review :).

Good point, but maybe someone still uses it and can benefit from the
fix.


Thanks,

Paul


> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > CC: Andreas Oberritter <obi@opendreambox.org>
> > ---
> > Another time I do not understand why `libipkg.pc` is not installed
> > automatically. I did not find =C2=BBlibipkg.pc was not installed.=C2=AB=
 from
> > `pkgconfig.bbclass` in `log.do_install`. Is that an error in the
> > Makefile of `ipkg`?
> > ---
> >  recipes/ipkg/ipkg_0.99.163.bb |   13 ++++---------
> >  1 files changed, 4 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/recipes/ipkg/ipkg_0.99.163.bb b/recipes/ipkg/ipkg_0.99.163=
.bb
> > index 8eb83a1..09068d4 100644
> > --- a/recipes/ipkg/ipkg_0.99.163.bb
> > +++ b/recipes/ipkg/ipkg_0.99.163.bb
> > @@ -1,5 +1,5 @@
> >  include ipkg.inc
> > -PR =3D "r8"
> > +PR =3D "r9"
> > =20
> >  S =3D "${WORKDIR}/ipkg-${PV}"
> > =20
> > @@ -12,15 +12,10 @@ SRC_URI =3D "http://www.handhelds.org/pub/packages/=
ipkg/ipkg-${PV}.tar.gz \
> >  	file://lonk-link-name.patch \
> >  	"
> > =20
> > -do_stage() {
> > -	oe_libinstall -so libipkg ${STAGING_LIBDIR}
> > -	install -d ${STAGING_INCDIR}/libipkg/
> > -	for f in *.h
> > -	do
> > -		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
> > -	done
> > +do_install () {
> > +	install -d ${D}${libdir}/pkgconfig
> > +	install -m 0644 ${WORKDIR}/libipkg.pc ${D}${libdir}/pkgconfig/libipkg=
.pc
> >  }
> > =20
> > -
> >  SRC_URI[md5sum] =3D "0b10ad2924611bccaea8ddf98481a192"
> >  SRC_URI[sha256sum] =3D "405743e1ba320ed6095d42a898f1486e3af1d745cae2bd=
45dfe1d8403a4d8995"
> > --=20
> > 1.7.4.1
>=20
>=20
>=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=-PEkfHpXIuN3i4X7dIOjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IgYcACgkQPX1aK2wOHVjO7ACfeBi6De+dDpoiRq9NpkRJ7yRi
clgAn0mYTaB9teLYkJhelYS6Ldr1ntso
=lINW
-----END PGP SIGNATURE-----

--=-PEkfHpXIuN3i4X7dIOjI--
