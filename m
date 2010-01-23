Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYm5c-0001eY-9L for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 20:56:15 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYm3P-0005n4-Kw for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 19:53:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
Date: Sat, 23 Jan 2010 20:53:54 +0100
Message-ID: <1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 19:56:15 -0000
X-Groupsio-MsgNum: 16113
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-UDVHlvJFmgBWjFi0be97"

--=-UDVHlvJFmgBWjFi0be97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 11:03 -0800 schrieb John Faith:
> Allow socat 1.7.1.2 to cross build.  In configure.in, the 4th value in
> AC_TRY_RUN() gives a default value for cross build environments since
> a test program cannot be run on the build system.  There are 2 places
> where AC_MSG_RESULT() is used instead of a default value which seems
> to result in code like "#define CRDLY_SHIFT" which breaks preprocessor
> checks like "#if CRDLY_SHIFT >=3D 0".
>=20
> The patch gives default values in configure and configure.in for cross
> compiling and checks were added in the affected source.
>=20
> Signed-off-by: John Faith <john@soundmetrics.com>

Thank you for your patch.

1. Applying your patch gives me warnings.

        $ git am /tmp/\[oe\]_\[PATCH\]_socat\:_Add_version_1.7.1.2=20
        Applying: socat: Add version 1.7.1.2
        /srv/filme/oe/openembedded/.git/rebase-apply/patch:29: trailing whi=
tespace.
        =20
        /srv/filme/oe/openembedded/.git/rebase-apply/patch:38: trailing whi=
tespace.
        =20
        /srv/filme/oe/openembedded/.git/rebase-apply/patch:46: trailing whi=
tespace.
        =20
        /srv/filme/oe/openembedded/.git/rebase-apply/patch:54: trailing whi=
tespace.
        =20
        /srv/filme/oe/openembedded/.git/rebase-apply/patch:60: space before=
 tab in indent.
         	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
        warning: squelched 13 whitespace errors
        warning: 18 lines add whitespace errors.

> ---
>  recipes/socat/files/socat-1.7.1.2-cross.patch |   98 +++++++++++++++++++=
++++++
>  recipes/socat/socat_1.7.1.2.bb                |   23 ++++++
>  2 files changed, 121 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/socat/files/socat-1.7.1.2-cross.patch
>  create mode 100644 recipes/socat/socat_1.7.1.2.bb
>=20
> diff --git a/recipes/socat/files/socat-1.7.1.2-cross.patch b/recipes/soca=
t/files/socat-1.7.1.2-cross.patch

[ =E2=80=A6 I do not no autotools.]

> diff --git a/recipes/socat/socat_1.7.1.2.bb b/recipes/socat/socat_1.7.1.2=
.bb
> new file mode 100644
> index 0000000..5bbb421
> --- /dev/null
> +++ b/recipes/socat/socat_1.7.1.2.bb
> @@ -0,0 +1,23 @@
> +SECTION =3D "console/network"
> +DEPENDS =3D "openssl readline"
> +DESCRIPTION =3D "Socat is a relay for bidirectional data \
> +transfer between two independent data channels."
> +LICENSE =3D "GPL"
> +PR =3D "r1"

You can start with `r0` I think.

> +
> +SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-1.7.1.2.ta=
r.bz2 \

Can we do this more generic: `=E2=80=A6/download/${P}.tar.bz2`.

> +           file://socat-1.7.1.2-cross.patch;patch=3D1 "
> +
> +inherit autotools
> +
> +do_configure() {
> +	# Override this function to avoid autoconf/automake/aclocal/autoheader
> +	# since config.h.in gets recreated.
> +	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> +	oe_runconf
> +}
> +
> +do_install_prepend () {
> +	mkdir -p ${D}${bindir}
> +	install -d ${D}${bindir} ${D}${mandir}/man1
> +}

2. I cannot build your patch because checksums are missing [1].
3. Looking at the difference between `socat_1.3.2.1.bb` and
`socat_1.7.1.2.bb` there is not much. Could you factor that out into an
include file e. g. unify this?

Please fix this up and resend with `[PATCH v2]` in the subject line and
a note in the commit message.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Checksums

--=-UDVHlvJFmgBWjFi0be97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbU8wACgkQPX1aK2wOHVhyXQCgi5KJDmXKntkmbvcdXnGp2iXY
2FAAn3nuUJ/jllMxdT0g6TuDYYZQdgZM
=8E+D
-----END PGP SIGNATURE-----

--=-UDVHlvJFmgBWjFi0be97--
