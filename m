Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qet80-0001s3-JC for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 20:16:44 +0200
Received: from g225080076.adsl.alicedsl.de ([92.225.80.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qet4e-0007ZC-9A for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 18:13:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310060679.4153.6.camel@mattotaupa>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
	<52d3dbb81758055099740c437667671b45974a2d.1310045515.git.michael.lippautz@gmail.com>
	<1310060679.4153.6.camel@mattotaupa>
Date: Thu, 07 Jul 2011 20:12:53 +0200
Message-ID: <1310062373.4153.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCHv2 4/4] start-stop-daemon: Add version 1.16.0.2 (initial recipe)
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
X-List-Received-Date: Thu, 07 Jul 2011 18:16:44 -0000
X-Groupsio-MsgNum: 33056
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4HGWzonM7B1C/sXyCEMy"

--=-4HGWzonM7B1C/sXyCEMy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 07.07.2011, 19:44 +0200 schrieb Paul Menzel:
> Am Donnerstag, den 07.07.2011, 15:36 +0200 schrieb Michael Lippautz:
> > Provides a stand-lone s-s-d that is extracted from dpkg of the correspo=
nding
> > version.
> >=20
> > * dpkg_1.16.0.2 is hostedd on sources.oe.org, since debian wipes old ve=
rsions
> >   from their mirrors
> > * Installing only s-s-d (binary) would be covered by automake rules.
> >   Documentation would be missing. Thus install all and purge non s-s-d =
files.
> >=20
> > Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> > ---
> >  .../start-stop-daemon_1.16.0.2.bb                  |   31 ++++++++++++=
++++++++
> >  1 files changed, 31 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-sto=
p-daemon_1.16.0.2.bb
> >=20
> > diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemo=
n_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon=
_1.16.0.2.bb
> > new file mode 100644
> > index 0000000..9b1084a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.=
0.2.bb
> > @@ -0,0 +1,31 @@
> > +DESCRIPTION =3D "Debian's start-stop-daemon utility extracted from the=
 dpkg \
> > +package"
> > +LICENSE =3D "PD"
> > +LIC_FILES_CHKSUM =3D "file://utils/start-stop-daemon.c;md5=3Da963623e4=
588f70122865aaa7a370ce4"
> > +# start-stop-daemon is usually shipped by dpkg
> > +RCONFLICS_${PN} =3D "dpkg"=20
>=20
> Trailing whitespace again.
>=20
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
> > +SRC_URI[md5sum] =3D "d211a84f38987771a49ad1c0f144334a"
> > +SRC_URI[sha256sum] =3D "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042=
d0a31bbcc2b54c0ea5"
> > +
> > +inherit autotools gettext
> > +
> > +S =3D "${WORKDIR}/dpkg-${PV}"
> > +
> > +EXTRA_OECONF =3D " \
> > +  --with-start-stop-daemon \
> > +  --without-bz2 \
> > +  --without-deselect \
> > +  --without-install-info \
> > +  --without-selinux \
> > +  --without-update-alternatives \
> > +"
> > +
> > +do_install_append () {
> > +  # remove everything that is not related to start-stop-daemon, since =
there
> > +  # is no explicit rule for only installing ssd
> > +  find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
> > +  find ${D} -depth -type d -empty -exec rmdir {} \;
> > +}
>=20
> Just looking at the recipe, the recipe in oe-dev [1] seems to do this
> differently and calls `update-alternatives` too. Is that not needed
> anymore and is copying the C file to the repository not working anymore?

I ported your patch to oe-dev and using `minimal-uclibc` it fails with
the following error.

        statcmd.c:369:2: warning: statement with no effect
        querycmd.c: In function 'main':
        querycmd.c:683:3: warning: statement with no effect
        querycmd.c:684:3: warning: statement with no effect
          CCLD   dpkg
          CCLD   dpkg-divert
          CCLD   dpkg-trigger
        archives.o: In function `fd_writeback_init':
        /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uc=
libceabi/start-stop-daemon-1.16.0.2-r0/dpkg-1.16.0.2/src/archives.c:73: und=
efined reference to `sync_file_range'
        archives.o: In function `tar_writeback_barrier':
        /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uc=
libceabi/  CCLD   dpkg-statoverride
        start-stop-daemon-1.16.0.2-r0/dpkg-1.16.0.2/src/archives.c:894: und=
efined reference to `sync_file_range'
        collect2: ld returned 1 exit status
        make[2]: *** [dpkg] Error 1

Building `start-stop-daemon-1.9.18-r1` works fine.


Thanks,

Paul


> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/start=
-stop-daemon/start-stop-daemon_1.9.18.bb?id=3D529b445f1122e3d0de7acff980fa0=
af114368157

--=-4HGWzonM7B1C/sXyCEMy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4V9yUACgkQPX1aK2wOHVj2VQCfbMXKz+JgKeTOBDky5Wp5Dy75
6/EAn1VgjtUNe8c9uuPOSHmQcv/d2PBI
=Y8gT
-----END PGP SIGNATURE-----

--=-4HGWzonM7B1C/sXyCEMy--
