Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLeAZ-0006jr-Br for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 18:27:51 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLe9F-0001cJ-Mf for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 16:26:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iou12i$88c$1@dough.gmane.org>
References: <1303134465.3910.63.camel@mattotaupa>
	<1303134640.3910.67.camel@mattotaupa>	<4DAD7297.2030606@opendreambox.org>
	<1303506946.4155.81.camel@mattotaupa>
	<AF97BCF4-CD32-4069-BB81-FECAC104F6D9@dominion.thruhere.net>
	<1303509611.4155.111.camel@mattotaupa> <iou12i$88c$1@dough.gmane.org>
Date: Sun, 15 May 2011 18:24:58 +0200
Message-ID: <1305476698.5838.622.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Sun, 15 May 2011 16:27:51 -0000
X-Groupsio-MsgNum: 32060
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-e/jRAiBGWeMpt6n5UsVa"

--=-e/jRAiBGWeMpt6n5UsVa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.04.2011, 10:02 +0200 schrieb Koen Kooi:

> On 23-04-11 00:00, Paul Menzel wrote:
> > Date: Sun, 17 Apr 2011 19:19:58 +0200
> >=20
> > 1. The revision is close to the upcoming release of pkg-config 0.26. [1=
]
> > 2. The patch `sysrootfix.patch` has been merged upstream [2].
> > 3. No embedded GLib is shipped anymore [3]. Therefore drop patches `aut=
ofoo.patch` and `glibconfig-sysdefs.h`.
> >=20
> > The patch is tested using the following configuration
> >=20
> > 	Build Configuration:
> > 	BB_VERSION        =3D "1.12.0"
> > 	METADATA_BRANCH   =3D "pkg-config"
> > 	METADATA_REVISION =3D "d4ae0c5"
> > 	TARGET_ARCH       =3D "arm"
> > 	TARGET_OS         =3D "linux-uclibceabi"
> > 	MACHINE           =3D "beagleboard"
> > 	DISTRO            =3D "minimal-uclibc"
> > 	DISTRO_VERSION    =3D "dev-snapshot-20110417"
> > 	TARGET_FPU        =3D "hard"
> >=20
> > and `angstrom-2010.x` and `minimal` too.
> >=20
> > [1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.=
html
> > [2] http://cgit.freedesktop.org/pkg-config/commit/?id=3D66d49f1375fec83=
8bcd301bb4ca2ef76cee0e47c
> > [3] http://cgit.freedesktop.org/pkg-config/commit/?id=3D99964eddb593517=
3fcedfc793e762d7dc7d01bba
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

I did not commit this yet thinking Andreas would give his ack. Today
pkg-config 0.26 was released. I am testing this right now and will
update the revision accordingly.

> > ---
> > v2: change `PV` from `0.26` to `0.25+0.26` to ensure a sane upgrade pat=
h
> >=20
> > 1. How can this recipe used also for the native recipe?
> > 2. What is `pkg-config-sdk` used for?

I am still do not know what to do about `pkg-config-native` (add
BBCLASSEXTEND =3D "native"?) and `pkg-config-sdk`.

> > ---
> >  recipes/pkgconfig/pkgconfig_git.bb |   10 ++++++++++
> >  1 files changed, 10 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/pkgconfig/pkgconfig_git.bb
> >=20
> > diff --git a/recipes/pkgconfig/pkgconfig_git.bb b/recipes/pkgconfig/pkg=
config_git.bb
> > new file mode 100644
> > index 0000000..39a5033
> > --- /dev/null
> > +++ b/recipes/pkgconfig/pkgconfig_git.bb
> > @@ -0,0 +1,10 @@
> > +require ${PN}.inc
> > +
> > +SRCREV =3D "7850aeb03a54a15d07b6c243b61033cd379c39d7"
> > +PV =3D "0.25+0.26"
> > +PR =3D "${INC_PR}.0"
> > +PR_append =3D "+gitr${SRCPV}"
> > +
> > +SRC_URI =3D "git://anongit.freedesktop.org/pkg-config;protocol=3Dgit"
> > +
> > +S =3D "${WORKDIR}/git"


Thanks,

Paul


[1] http://lists.freedesktop.org/archives/pkg-config/2011-May/000744.html

--=-e/jRAiBGWeMpt6n5UsVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P/loACgkQPX1aK2wOHVjNiACfa22uFdA87Ect1zarFRLmI5yV
M10AoIWkFTvI6T26t5uh4s44Rv4XVQT2
=FgPv
-----END PGP SIGNATURE-----

--=-e/jRAiBGWeMpt6n5UsVa--
