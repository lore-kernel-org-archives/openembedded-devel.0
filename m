Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDNjv-0001oe-8D for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 23:18:11 +0200
Received: from f053043081.adsl.alicedsl.de ([78.53.43.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDNiD-0000LT-2O; Fri, 22 Apr 2011 21:16:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DAD7297.2030606@opendreambox.org>
References: <1303134465.3910.63.camel@mattotaupa>
	<1303134640.3910.67.camel@mattotaupa>
	<4DAD7297.2030606@opendreambox.org>
Date: Fri, 22 Apr 2011 23:15:46 +0200
Message-ID: <1303506946.4155.81.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 22 Apr 2011 21:18:11 -0000
X-Groupsio-MsgNum: 31404
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AAQMnZnbIWZ6AxBvfqZI"

--=-AAQMnZnbIWZ6AxBvfqZI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 19.04.2011, 13:31 +0200 schrieb Andreas Oberritter:
> On 04/18/2011 03:50 PM, Paul Menzel wrote:
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
> > ---
> > 1. How can this recipe used also for the native recipe?
> > 2. What is `pkg-config-sdk` used for?
> > ---
> >  recipes/pkgconfig/pkgconfig_git.bb |   12 ++++++++++++
> >  1 files changed, 12 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/pkgconfig/pkgconfig_git.bb
> >=20
> > diff --git a/recipes/pkgconfig/pkgconfig_git.bb b/recipes/pkgconfig/pkg=
config_git.bb
> > new file mode 100644
> > index 0000000..9c6d7d1
> > --- /dev/null
> > +++ b/recipes/pkgconfig/pkgconfig_git.bb
> > @@ -0,0 +1,12 @@
> > +require ${PN}.inc
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +SRCREV =3D "7850aeb03a54a15d07b6c243b61033cd379c39d7"
> > +SRC_URI =3D "git://anongit.freedesktop.org/pkg-config;protocol=3Dgit"
> > +
> > +PV =3D "0.26"
> > +PR =3D "${INC_PR}.0"
> > +PR_append =3D "+gitr${SRCPV}"
>=20
> Usually, SRCPV is used in PV, not PR. Also, I'd prefer not using 0.26
> for a pre-release snapshot, to make a future update to the released
> version work. How about using one of
>=20
> PV =3D "0.25+gitr${SRCPV}"
>=20
> or
>=20
> PV =3D "0.25.999+gitr${SRCPV}"
>=20
> instead, and removing the PR_append line?

Your suggestion is documented in the user manual [1], but Koen advised
to use `PR_append` to keep the hash out of `PV` [2].

Would I get an Acked-by changing the line to the following?

	PV =3D "0.25+0.26"


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html#commonuse_new_p=
ackage
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
8803.html

--=-AAQMnZnbIWZ6AxBvfqZI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2x8AIACgkQPX1aK2wOHVhoMQCfT4aVxputHP0iDQvV+RHjwX/v
fsUAmwS6Q2a7mz/FL5bjTT2zAzd01T3X
=0D7z
-----END PGP SIGNATURE-----

--=-AAQMnZnbIWZ6AxBvfqZI--
