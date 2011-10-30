Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RKTsG-0001E3-Nd for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 12:48:24 +0100
Received: from f053046056.adsl.alicedsl.de ([78.53.46.56]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RKTmd-0005QN-Py; Sun, 30 Oct 2011 11:42:36 +0000
Message-ID: <1319974939.4242.19.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 12:42:19 +0100
In-Reply-To: <AC090B9732AB2B4DB7FF476E907FE660013BAEBD36@dnce02.ent.ti.com>
References: <1318324122-16951-1-git-send-email-vitap@ti.com>
	<1318343515.14384.8.camel@mattotaupa>
	<AC090B9732AB2B4DB7FF476E907FE660013BAEBD36@dnce02.ent.ti.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Sun, 30 Oct 2011 11:48:24 -0000
X-Groupsio-MsgNum: 35088
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-uSZt/bEipUYyXLdbZSBB"

--=-uSZt/bEipUYyXLdbZSBB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vita,


are you reading the list or do I have to add your address to the CC
field?


Am Sonntag, den 30.10.2011, 10:58 +0100 schrieb Preskovsky, Vita:

> Please see my answers bellow.

thank you for your answer.

> -----Original Message-----

> Sent: Tuesday, October 11, 2011 4:32 PM

> Subject: Re: [oe] [PATCH] bluez4_4.95.bb: new recipe for building bluez-4=
.95
>=20
> Dear Vita,
>=20
>=20
> thank you for your patch.
>=20
> Am Dienstag, den 11.10.2011, 11:08 +0200 schrieb Vita Preskovsky:
>=20
> Using
>=20
>         bluez4: Add version 4.95
>=20
> as the commit summary would be cleaner. Use `git commit --amend` to chang=
e that.
>=20
> Additionally you should elaborate more in the commit message what the pat=
ch is doing.
>=20
> 1. Have you tested it? Is it just an upgrade because of or does version
> 4.91 in the repository have any short comings so that it should be remove=
d?
>
> I tested this recipe, and the reason I added this version is that we want=
 to use this version of Bluez in our release.

I guess you tested it using =C8=A6ngstr=C3=B6m, so the old recipe can be re=
moved.
Please note that oe-core already has version 4.96.

> > Signed-off-by: Vita Preskovsky <vitap@ti.com>
> > ---
> >  recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++
> >  1 files changed, 30 insertions(+), 0 deletions(-)  create mode 100644=
=20
> > recipes/bluez/bluez4_4.95.bb
> >=20
> > diff --git a/recipes/bluez/bluez4_4.95.bb=20
> > b/recipes/bluez/bluez4_4.95.bb new file mode 100644 index=20
> > 0000000..a682d6a
> > --- /dev/null
> > +++ b/recipes/bluez/bluez4_4.95.bb
> > @@ -0,0 +1,30 @@
> > +require bluez4.inc
> > +SRC_URI =3D "\
> > +  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
>=20
> 2. As far as I know kernel.org after the compromise presently does not pr=
ovide that archive. So the recipe will not build unless there is a mirror s=
omewhere. Do you know of a mirror?
>=20
> There are two possible locations for this package:
> 	http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/bluetooth/bl=
uez-4.95.tar.gz
>  	http://www.angstrom-distribution.org/unstable/sources/bluez-4.95.tar.gz
> I changed the SRC_URI in my working directory for the first location and =
it worked fine. So with what location do you prefer the recipe will be rele=
ased?

I am unsure about the policy myself and I do not think an =E2=80=9COE mirro=
r=E2=80=9D
has that particular archive.

> > + file://bluetooth.conf \
> > +"
> > +
> > +SRC_URI[md5sum] =3D "341294b2849a04a4afff5c96bfbf30b2"
> > +SRC_URI[sha256sum] =3D "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c=
0ce6bebd27fa4120f6"
> > +
> > +DEFAULT_PREFERENCE =3D "-1"
>=20
> 3. Why?
> > +DEFAULT_PREFERENCE_angstrom =3D "1"
>=20
> 4. Have you talked to the =C8=A6ngstr=C3=B6m maintainers?
>=20
> These two variables are defined in the previous version of bluez4 recipe:=
 bluez4_4.89.bb. Without these two definitions in my recipe bitbake prefers=
 the old recipe upon mine, which doesn't leave me a choice but to define th=
ese variables.

The =E2=80=9Ccorrect=E2=80=9D way would be to first add that recipe and the=
n afterward
sent a patch to change the preferences which the =C8=A6ngstr=C3=B6m maintai=
ners
have to acknowledge.

> > +
> > +DEPENDS +=3D "libsndfile1"
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +# Not all distros have a recent enough udev BTUDEV =3D "=20
> > +--disable-udevrules"
> > +BTUDEV_angstrom =3D " --enable-udevrules"
> > +BTUDEV_shr =3D " --enable-udevrules"
> > +
> > +EXTRA_OECONF +=3D "${BTUDEV}"
> > +do_configure_append(){
> > +	echo "#define LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >>=20
> > +${S}/config.h }
> > +
> > +FILES_${PN}-dbg +=3D "\
> > +  ${base_libdir}/udev/.debug \
> > +  ${libdir}/*/.debug \
> > +"
>=20
> Otherwise this recipe looks good. Is it planned for branch 2011.03-mainte=
nance?


Thanks,

Paul

--=-uSZt/bEipUYyXLdbZSBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6tOBsACgkQPX1aK2wOHViPbwCePn1dysiw0P6PdZ2kAckjAlgj
5dMAnA/Z2YL5MnjafdpI5eqCHgVcByy6
=KRKm
-----END PGP SIGNATURE-----

--=-uSZt/bEipUYyXLdbZSBB--
