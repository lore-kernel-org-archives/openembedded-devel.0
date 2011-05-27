Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QQ5S3-00007l-Ck for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 00:24:15 +0200
Received: from f053040152.adsl.alicedsl.de ([78.53.40.152]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QQ5PU-00084B-HK for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 22:21:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306423519-31114-1-git-send-email-ludovic.desroches@atmel.com>
References: <1306423519-31114-1-git-send-email-ludovic.desroches@atmel.com>
Date: Sat, 28 May 2011 00:21:10 +0200
Message-ID: <1306534870.4137.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] tiobench: add recipe
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
X-List-Received-Date: Fri, 27 May 2011 22:24:15 -0000
X-Groupsio-MsgNum: 32315
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GtkMG4QX/0PboGlAl5gQ"

--=-GtkMG4QX/0PboGlAl5gQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ludovic,


thank you for your contribution.

Am Donnerstag, den 26.05.2011, 17:25 +0200 schrieb Ludovic Desroches:

please add the version of the program you are adding to the commit
summary next time.

What build configuration did you use for testing?

> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  recipes/tiobench/files/tiobench-makefile.patch |   42 ++++++++++++++++++=
++++++
>  recipes/tiobench/tiobench_0.3.3.bb             |   27 +++++++++++++++
>  2 files changed, 69 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/tiobench/files/tiobench-makefile.patch
>  create mode 100644 recipes/tiobench/tiobench_0.3.3.bb
>=20
> diff --git a/recipes/tiobench/files/tiobench-makefile.patch b/recipes/tio=
bench/files/tiobench-makefile.patch
> new file mode 100644
> index 0000000..23e7a43
> --- /dev/null
> +++ b/recipes/tiobench/files/tiobench-makefile.patch

Please add a header to the patch, if it has been sent upstream.

> @@ -0,0 +1,42 @@
> +--- a/Makefile	2011-05-26 07:48:46.341400974 +0200
> ++++ b/Makefile	2011-05-26 10:54:48.631400818 +0200
> +@@ -1,8 +1,10 @@
> + # Makefile for tiotest
> +=20
> +-CC=3Dgcc
> ++CROSS_COMPILE?=3D
> ++CC=3D$(CROSS_COMPILE)gcc

Would `CC?=3Dgcc` not work too?

> + #CFLAGS=3D-O3 -fomit-frame-pointer -Wall
> + CFLAGS=3D-O2 -Wall
> ++LDFLAGS?=3D
> +=20
> + #DEFINES=3D-DUSE_MMAP=20
> + #-DUSE_MADVISE
> +@@ -14,16 +16,15 @@
> +=20
> + #DEFINES=3D
> +=20
> +-LINK=3Dgcc

Just use `LINK?=3D$(CC)`?

> + EXE=3Dtiotest
> + PROJECT=3Dtiobench
> + # do it once instead of each time referenced
> + VERSION=3D$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " "=
 -f 7 | sed "s/v//g")
> + DISTNAME=3D$(PROJECT)-$(VERSION)
> + INSTALL=3Dinstall
> +-PREFIX=3D/usr/local
> ++PREFIX?=3D/usr/local
> + BINDIR=3D$(PREFIX)/bin
> +-DOCDIR=3D/usr/local/doc/$(DISTNAME)
> ++DOCDIR=3D$(PREFIX)/doc/$(DISTNAME)
> +=20
> + all: $(EXE)
> +=20
> +@@ -34,7 +35,7 @@
> + 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
> +=20
> + $(EXE): tiotest.o crc32.o
> +-	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
> ++	$(CC) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
> + 	@echo
> + 	@echo "./tiobench.pl --help for usage options"
> + 	@echo
> diff --git a/recipes/tiobench/tiobench_0.3.3.bb b/recipes/tiobench/tioben=
ch_0.3.3.bb
> new file mode 100644
> index 0000000..829373f
> --- /dev/null
> +++ b/recipes/tiobench/tiobench_0.3.3.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Threaded I/O tester"
> +HOMEPAGE =3D "http://sourceforge.net/projects/tiobench/"
> +PROVIDES =3D "tiobench"=20
> +LICENSE =3D "GPL"
> +RDEPENDS =3D "\
> +    perl \
> +    perl-module-strict \
> +    perl-module-getopt-long \
> +    perl-module-overload \
> +    perl-module-exporter-heavy \
> +    "	=09

There is unneeded white space at the end. `git diff --check` is your
friend before a commit.

Please sort the above variable according to the style guide [1].

> +PR =3D "r0"
> +
> +SRC_URI =3D "\
> +    http://sourceforge.net/projects/tiobench/files/tiobench/0.3.3/tioben=
ch-0.3.3.tar.gz \
> +    file://tiobench-makefile.patch \
> +    "
> +SRC_URI[md5sum] =3D "bf485bf820e693c79e6bd2a38702a128"
> +SRC_URI[sha256sum] =3D "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844=
b0685b7ea9db2bcc"
> +
> +do_compile() {
> +    make CROSS_COMPILE=3D${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
> +}

Is `oe_runmake` and passing the  available?

> +
> +do_install() {
> +    make install PREFIX=3D${D}
> +}

Is not that the default? If you need to pass options you can add those
to `EXTRA_OEMAKE`. If this does not work, you should still try to use
`oe_runmake` if it is available.


Thanks,

Paul


[1] http://openembedded.org/index.php/Styleguide

--=-GtkMG4QX/0PboGlAl5gQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3gI88ACgkQPX1aK2wOHVhafQCeKAeXLrsyRDG2ko7FLoqwEAFA
l+gAn2NG2DxHGfLL8K625xAwco2ByH3r
=AXjA
-----END PGP SIGNATURE-----

--=-GtkMG4QX/0PboGlAl5gQ--
