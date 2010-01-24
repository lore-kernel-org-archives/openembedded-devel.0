Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ122-0000ct-A4 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 12:53:33 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ0zp-0004Ha-4N for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:51:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
References: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
Date: Sun, 24 Jan 2010 12:51:11 +0100
Message-ID: <1264333871.3810.65.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sun, 24 Jan 2010 11:53:33 -0000
X-Groupsio-MsgNum: 16153
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RDAS+ikAHETwKqZnb8xV"

--=-RDAS+ikAHETwKqZnb8xV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 15:16 -0800 schrieb John Faith:

[Moved note about v2 to the end of commit message.]

> Allow socat 1.7.1.2 to cross build.  In configure.in, the 4th value in
> AC_TRY_RUN() gives a default value for cross build environments since
> a test program cannot be run on the build system.  There are 2 places
> where AC_MSG_RESULT() is used instead of a default value which seems
> to result in code like "#define CRDLY_SHIFT" which breaks preprocessor
> checks like "#if CRDLY_SHIFT >=3D 0".

Maybe add an item, why the change in do_configure() is needed. Just copy
it from your reply to Koen maybe.

> The patch gives default values in configure and configure.in for cross
> compiling and checks were added in the affected source.

v2: Added package source checksums, changed PR to r0, and removed some
trailing whitespace in the patch.

> Signed-off-by: John Faith <john@soundmetrics.com>

Build-tested-by: Paul Menzel <paulepanter@users.sourceforge.net>
  (beagleboard, =C3=85ngstr=C3=B6m)

        /oe/angstrom-dev/deploy/glibc/ipk/armv7a$ ls -lh socat*
        -rw-r--r-- 1 x x 146K 24. Jan 12:21 socat_1.7.1.2-r0.5_armv7a.ipk
        -rw-r--r-- 1 x x 9,4M 24. Jan 12:21 socat-dbg_1.7.1.2-r0.5_armv7a.i=
pk
        -rw-r--r-- 1 x x  790 24. Jan 12:21 socat-dev_1.7.1.2-r0.5_armv7a.i=
pk
        -rw-r--r-- 1 x x  36K 24. Jan 12:21 socat-doc_1.7.1.2-r0.5_armv7a.i=
pk

I am just wondering about the size of `socat-dbg*.ipk` though.

> ---

[=E2=80=A6]

> +--- socat-1.7.1.2/xioopts.c.orig	2010-01-04 04:29:36.000000000 -0800
> ++++ socat-1.7.1.2/xioopts.c	2010-01-21 10:54:03.561742501 -0800
> +@@ -763,7 +763,7 @@ const struct optname optionnames[] =3D {
> + 	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)

Still some trailing whitespaces (in all ipv6 lines I think).

        openembedded$ git am -s /tmp/\[oe\]_\[PATCH_v2\]_socat\:_Add_versio=
n_1.7.1.2=20
        Applying: socat: Add version 1.7.1.2
        /oe/openembedded/.git/rebase-apply/patch:76: space before tab in in=
dent.
         	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
        /oe/openembedded/.git/rebase-apply/patch:78: space before tab in in=
dent.
         	IF_TERMIOS("isig",	&opt_isig)
        /oe/openembedded/.git/rebase-apply/patch:81: space before tab in in=
dent.
         	IF_TERMIOS("ispeed",	&opt_ispeed)
        /oe/openembedded/.git/rebase-apply/patch:83: space before tab in in=
dent.
         	IF_TERMIOS("istrip",	&opt_istrip)
        /oe/openembedded/.git/rebase-apply/patch:85: space before tab in in=
dent.
         	IF_OPENSSL("openssl-pseudo",	&opt_openssl_pseudo)
        warning: squelched 5 whitespace errors
        warning: 10 lines add whitespace errors.

(Try to apply your patch yourself.) But I guess it is alright.

[=E2=80=A6]

> diff --git a/recipes/socat/socat_1.7.1.2.bb b/recipes/socat/socat_1.7.1.2=
.bb
> new file mode 100644
> index 0000000..2214354
> --- /dev/null
> +++ b/recipes/socat/socat_1.7.1.2.bb
> @@ -0,0 +1,23 @@
> +SECTION =3D "console/network"
> +DEPENDS =3D "openssl readline"
> +DESCRIPTION =3D "Socat is a network relay for bidirectional data \
> +transfer between two independent data channels."
> +LICENSE =3D "GPL"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://www.dest-unreach.org/socat/download/${P}.tar.bz2 \
> +           file://socat-1.7.1.2-cross.patch;patch=3D1 "
> +
> +inherit autotools
> +
> +do_configure() {
> +	# Override this function so the included config.h.in is used instead
> +	# of recreating it with autoheader.
> +	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"

Someone else has to judge on the autotool stuff.

[=E2=80=A6]

--=-RDAS+ikAHETwKqZnb8xV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcNC8ACgkQPX1aK2wOHVjiigCeI93QOynpDIWWv7zpsyE8GZzA
cl0AniD9cGnxmcIYe4cZ/qRPDLt7uQQj
=cbtU
-----END PGP SIGNATURE-----

--=-RDAS+ikAHETwKqZnb8xV--
