Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1f1s-0001IO-Si for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 14:48:37 +0200
Received: from f053035163.adsl.alicedsl.de ([78.53.35.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1f1f-0005Nl-Pv for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 12:47:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1009091126390.11516@asterix.crazy-teaparty.dyndns.org>
References: <1283946231-29039-1-git-send-email-fahad_usman@mentor.com>
	<alpine.LNX.2.00.1009091126390.11516@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 01 Oct 2010 14:47:46 +0200
Message-ID: <1285937266.4079.14.camel@mattotaupa>
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
Subject: [REGRESSION] [PATCH] glib-1.2: merged native and non-native recipes
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
X-List-Received-Date: Fri, 01 Oct 2010 12:48:48 -0000
X-Groupsio-MsgNum: 24263
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1I3QWUo3hhl7ODzKL0hc"

--=-1I3QWUo3hhl7ODzKL0hc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Fahad, dear Tom,


Am Donnerstag, den 09.09.2010, 11:31 +0200 schrieb Vitus Jensen:

> On Wed, 8 Sep 2010, Fahad Usman wrote:
>=20
> > * removed the glib-1.2-native_1.2.10.bb file
> > * added NATIVE_INSTALL_WORKS =3D "1"
> > * added BBCLASSEXTEND =3D "native"
> > * converted do_stage of native recipe to do_install_virtclass-native in=
 the combined recipe
> > * added DEPENDS_virtclass-native =3D "" to avoid dependencies loops
> > * added gettext in inherit because it was needed by the native recipes
> > * bumped PR
> >
> > Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> > ---
> > recipes/glib-1.2/glib-1.2-native_1.2.10.bb |   49 ---------------------=
-------
> > recipes/glib-1.2/glib-1.2_1.2.10.bb        |   20 ++++++++++-
> > 2 files changed, 18 insertions(+), 51 deletions(-)
>=20
>=20
> > diff --git a/recipes/glib-1.2/glib-1.2_1.2.10.bb b/recipes/glib-1.2/gli=
b-1.2_1.2.10.bb
> > index 72ee826..67266d4 100644
> > --- a/recipes/glib-1.2/glib-1.2_1.2.10.bb
> > +++ b/recipes/glib-1.2/glib-1.2_1.2.10.bb
> > @@ -4,7 +4,8 @@ SECTION =3D "libs"
> > PRIORITY =3D "optional"
> > LICENSE =3D "LGPL"
> > DEPENDS =3D "glib-1.2-native"
> > -PR =3D "r4"
> > +DEPENDS_virtclass-native =3D ""
> > +PR =3D "r5"
>=20
> I don't know if everyone thinks so but I feel the following line is more=
=20
> elegant:
>=20
> DEPENDS_pn-glib-1.2 +=3D "glib-1.2-native"
>=20
> You skip the DEPENDS_virtclass-native line and may use the "+=3D" operato=
r.

[=E2=80=A6]

Tom committed an updated patch in 44af05 [1]. Unfortunately building the
recipe fails for me in `do_configure()`.

        [=E2=80=A6]
        | checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc=
 -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mth=
umb-interwork -mno-thumb
        | checking whether the C compiler works... no
        | configure: error: in `/oe/build-minimal-eglibc/minimal-dev/work/a=
rmv7a-oe-linux-gnueabi/glib-1.2-1.2.10-r5/glib-1.2.10':
        | configure: error: C compiler cannot create executables
        | See `config.log' for more details.
        | ERROR: Function do_configure failed
        NOTE: package glib-1.2-1.2.10-r5: task do_configure: Failed
        [=E2=80=A6]

Do you know what might cause this? Reverting this commit the recipe can
be build.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D44af050=
77f455f5b76cf76eb41dcc62a51de7582

--=-1I3QWUo3hhl7ODzKL0hc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyl2GsACgkQPX1aK2wOHViZYQCZAd8mah32J9PebjXrG94s43Ij
PgMAn0sF1je2l5hq9dklG1FVBqyA+ztg
=41zw
-----END PGP SIGNATURE-----

--=-1I3QWUo3hhl7ODzKL0hc--
