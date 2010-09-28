Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0VdG-00040W-FC for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 10:33:56 +0200
Received: from f053043200.adsl.alicedsl.de ([78.53.43.200]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0Vd7-0001C3-Jw for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 08:33:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285661564-1308-1-git-send-email-t.fromm@dresearch.de>
References: <1285660172.4168.10.camel@mattotaupa>
	<1285661564-1308-1-git-send-email-t.fromm@dresearch.de>
Date: Tue, 28 Sep 2010 10:33:40 +0200
Message-ID: <1285662820.4168.24.camel@mattotaupa>
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
Subject: Re: [v2] wvstreams-4.6: Remove dbus support because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 08:34:14 -0000
X-Groupsio-MsgNum: 24086
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-cW2UsjysVSsAiudP/Iv/"

--=-cW2UsjysVSsAiudP/Iv/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you know, if and how =C2=BBPATCH=C2=AB got stripped in the subject? With=
out it,
Patchwork will not pick it up, I think.


Am Dienstag, den 28.09.2010, 10:12 +0200 schrieb Thilo Fromm:
> From: t.fromm <t.fromm@ba11ecae-741b-462f-8724-1218f99f5906>

Where does that line come from. Did you send this patch from the same
system and did you configure git correctly?

	git config user.name Thilo Fromm
	git config user.email t.fromm@dresearch.de

It is just a cosmetic error, but this line will be shown in the commit
history and used for the weekly changelog generation.

> If wvstreams is configured with DBus support enabled (by not providing
> --without-dbus) the the build fails at link time as libdbus cannot be
> found:
>=20
> | ./CXX -c dbus/wvdbusconn
> | ./CXX -c dbus/wvdbusmarshal
> | ./CXX -c dbus/wvdbusmsg
> | ./CXX -c dbus/wvdbusserver
> | linking libwvdbus.so...
> | arm-angstrom-linux-gnueabi-g++: /libdbus-1.a: No such file or directory
> | make: *** [libwvdbus.so] Error 1
> | FATAL: oe_runmake failed
> NOTE: Task failed: /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-an=
gstrom-linux-gnueabi/wvstreams-4.6-r0/temp/log.do_compile.6422
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvs=
treams_4.6.bb do_compile failed
> ERROR: Task 2024 (/home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/w=
vstreams_4.6.bb, do_compile) failed
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
>  recipes/wvstreams/wvstreams_4.6.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstr=
eams_4.6.bb
> index 91abc7d..688a80f 100644
> --- a/recipes/wvstreams/wvstreams_4.6.bb
> +++ b/recipes/wvstreams/wvstreams_4.6.bb
> @@ -3,6 +3,8 @@ LICENSE =3D "LGPL"
>  DESCRIPTION =3D "WvStreams is a network programming library in C++"
>  DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
> =20
> +PR =3D "r2"
> +

I think `PR` starts at 0 by default.

>  SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
>  	"
> =20
> @@ -10,7 +12,8 @@ inherit autotools pkgconfig
> =20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib=
"
> =20
> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam"
> +# dbus detection currently broken in configure.ac; remember to add "dbus=
 (>=3D 1.2.14)" to DEPENDS  when fixed
> +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-db=
us"
> =20
>  PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
>  PACKAGES_prepend =3D "uniconfd uniconfd-dbg "

Just a question. Do you know if the other version of wvstreams suffer
from the same problem?


Thanks,

Paul

--=-cW2UsjysVSsAiudP/Iv/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyhqGQACgkQPX1aK2wOHVgGzgCfUSmL+jzuNU2YsHudjtLCcmeN
wCQAnjmzDzaLnIMi272dDoGnxUwR5FSu
=qrd8
-----END PGP SIGNATURE-----

--=-cW2UsjysVSsAiudP/Iv/--
