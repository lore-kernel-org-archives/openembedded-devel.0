Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcFHG-0004wZ-24 for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 11:47:06 +0100
Received: from f053035160.adsl.alicedsl.de ([78.53.35.160]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcFGo-0007EF-T5 for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:46:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D2A3410.6090906@opendreambox.org>
References: <1294607270.4036.73.camel@mattotaupa>
	<4D2A3410.6090906@opendreambox.org>
Date: Mon, 10 Jan 2011 11:46:37 +0100
Message-ID: <1294656397.4342.30.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: OT: determining in `Makefile.in` the Python version/path
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
X-List-Received-Date: Mon, 10 Jan 2011 10:47:06 -0000
X-Groupsio-MsgNum: 27862
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-3YdUWlScyknM2tpHg+Dt"

--=-3YdUWlScyknM2tpHg+Dt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 09.01.2011, 23:17 +0100 schrieb Andreas Oberritter:
> On 01/09/2011 10:07 PM, Paul Menzel wrote:
> > I tried to use `python-config` to determine the Python version [3].
> >=20
> >         ifeq (arm, $(ARCH))
> >         -# Force external python2.5 for now!
> >         -LIBS +=3D-lpython2.5
> >         +# Force external Python for now!
> >         +LIBS +=3D $(shell python-config --libs)
> >          endif
> >=20
> > This fails with the following error though documented in `log.do_compil=
e`.
> >=20
> >         Traceback (most recent call last):
> >           File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/bin/pyth=
on-config", line 6, in <module>
> >             from distutils import sysconfig
> >           File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/lib/pyth=
on2.6/distutils/sysconfig.py", line 22, in <module>
> >             PREFIX =3D os.path.normpath(sys.prefix).replace( os.getenv(=
"BUILD_SYS"), os.getenv("HOST_SYS") )
> >=20
>=20
> For OE's Python, you need to set some variables in your recipe, e.g.:
>=20
> EXTRA_OECONF =3D " \
>         BUILD_SYS=3D${BUILD_SYS} \
>         HOST_SYS=3D${HOST_SYS} \
>         STAGING_INCDIR=3D${STAGING_INCDIR} \
>         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> "

Andreas, thank you very much. At first it did not work and I got the
same error. Then I tried to put it into `EXTRA_OEMAKE`, since the error
was during task `compile`. That did not work either and I got the same
error again.

With a manual test recipe (attached, `git am --scissors`) manually
running

	python-config --libs

worked, so I think the problem is, that the environment variables are
not passed to the shell(?) opened by `$(shell =E2=80=A6)`.

Searching for `'BUILD_SYS=3D${BUILD_SYS}'` through the repository I found
that sometimes those variables are exported and tried the following

        do_configure_prepend() {
               export BUILD_SYS=3D${BUILD_SYS}
               export HOST_SYS=3D${HOST_SYS}
               export STAGING_INCDIR=3D${STAGING_INCDIR}
               export STAGING_LIBDIR=3D${STAGING_LIBDIR}
        }
       =20
        [=E2=80=A6]
       =20
        do_compile_prepend() {
               export BUILD_SYS=3D${BUILD_SYS}
               export HOST_SYS=3D${HOST_SYS}
               export STAGING_INCDIR=3D${STAGING_INCDIR}
               export STAGING_LIBDIR=3D${STAGING_LIBDIR}
        }

which seems to work. Is that the right explanation and is there an
easier way to do this?


Thanks,

Paul

8<-------------------------------------------------------------------->8
=46rom dbf2af72601e5998af0d3cc0f0dc4abcc5d4fa6e Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Mon, 10 Jan 2011 11:00:45 +0100
Subject: [PATCH] test-python-config: add test program for `python-config`

http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/028563=
.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/helloworld/test-python-config_1.0.0.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/helloworld/test-python-config_1.0.0.bb

diff --git a/recipes/helloworld/test-python-config_1.0.0.bb b/recipes/hello=
world/test-python-config_1.0.0.bb
new file mode 100644
index 0000000..89c89e9
--- /dev/null
+++ b/recipes/helloworld/test-python-config_1.0.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "run `python-config --libs`"
+LICENSE =3D "GPLv3"
+PR =3D "r0"
+DEPENDS =3D "python"
+
+S =3D "${WORKDIR}/${P}"
+
+do_fetch () {
+	mkdir -p ${WORKDIR}/${P}
+	cd ${WORKDIR}/${P}
+}
+
+do_compile () {
+	BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} STAGING_INCDIR=3D${STAGIN=
G_INCDIR} STAGING_LIBDIR=3D${STAGING_LIBDIR} python-config --libs
+}
+
+do_install () {
+}
--=20
1.7.2.3

--=-3YdUWlScyknM2tpHg+Dt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0q440ACgkQPX1aK2wOHVj9UACggwvAQCRVxpWO+lhxfOQoQiYL
cQ8An3ALpWRhEngMakwGcQ9WzT0zT6Vj
=4Q0v
-----END PGP SIGNATURE-----

--=-3YdUWlScyknM2tpHg+Dt--
