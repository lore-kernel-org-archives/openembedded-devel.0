Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0UwZ-0007Gi-8k for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 09:49:54 +0200
Received: from f053043200.adsl.alicedsl.de ([78.53.43.200]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0UwQ-0000PL-64 for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 07:49:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285658920-15596-1-git-send-email-t.fromm@dresearch.de>
References: <1285658920-15596-1-git-send-email-t.fromm@dresearch.de>
Date: Tue, 28 Sep 2010 09:49:32 +0200
Message-ID: <1285660172.4168.10.camel@mattotaupa>
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
Subject: Re: [PATCH] Remove dbus support from wvstreams-4.6 because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 07:49:55 -0000
X-Groupsio-MsgNum: 24080
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PsctCs3zCvGDkcFlEiIA"

--=-PsctCs3zCvGDkcFlEiIA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


please adhere to the commit policy regarding the commit summary, i. e.,
it has to start with the package name.

wvstreams-4.6: remove DBus support, because configure.ac is faulty.

Am Dienstag, den 28.09.2010, 09:28 +0200 schrieb Thilo Fromm:
> If wvstreams is configured with DBus support enabled (by not providing
> --without-dbus) the the build fails at link time as libdbus cannot be
> found:
>=20
> | ./CXX -c dbus/wvdbusconn
> | ./CXX -c dbus/wvdbusmarshal
> | ./CXX -c dbus/wvdbusmsg
> | ./CXX -c dbus/wvdbusserver
> | linking libwvdbus.so...
> | arm-angstrom-linux-gnueabi-g++: /libdbus-1.a: No such file or
> directory

Can your editor be configured to not add line breaks to quotes? I would
prefer that.

> | make: *** [libwvdbus.so] Error 1
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/wvstreams-4.6-r0/temp/log.do_compile.6422
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvstreams_4.6.bb
> do_compile failed
> ERROR: Task 2024
> (/home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvstreams_4.6.bb,
>  do_compile) failed
>=20
> The root cause for this behaviour is in wvstreams' configure.ac; the
> weird dbus detection and library path handling breaks successive builds.
>=20
> This patch, however, does not fix the configure.ac file but disables
> DBus support for wvstreams at configure time. This at least fixes the
> broken build.
>=20
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
>  recipes/wvstreams/wvstreams_4.6.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstr=
eams_4.6.bb
> index 91abc7d..b298a97 100644
> --- a/recipes/wvstreams/wvstreams_4.6.bb
> +++ b/recipes/wvstreams/wvstreams_4.6.bb
> @@ -1,7 +1,7 @@
>  HOMEPAGE =3D "http://alumnit.ca/wiki/index.php?page=3DWvStreams"
>  LICENSE =3D "LGPL"
>  DESCRIPTION =3D "WvStreams is a network programming library in C++"
> -DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
> +DEPENDS =3D "zlib openssl (>=3D 0.9.8) dbus (> 1.2.14)"

Since you remove DBus support, can this dependency be removed? Maybe add
a note to the comment below to not forget to put `dbus` into `DEPENDS`.
=20
>  SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
>  	"
> @@ -10,7 +10,8 @@ inherit autotools pkgconfig
> =20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib=
"
> =20
> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam"
> +# tfm: dbus build currently broken
> +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-db=
us"
> =20
>  PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
>  PACKAGES_prepend =3D "uniconfd uniconfd-dbg "

I think you also need to increment `PR`.

Can you resend the patch as v2 (`--subject-prefix in `git help
format-patch`) and update the status in the patch queue [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork

--=-PsctCs3zCvGDkcFlEiIA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyhngcACgkQPX1aK2wOHVjFewCfY7S3KpMh0tyztHOk/vxuHdaD
rrYAn0InOuP4+t0PhwuXgpw3cf5AecHc
=Rs8w
-----END PGP SIGNATURE-----

--=-PsctCs3zCvGDkcFlEiIA--
