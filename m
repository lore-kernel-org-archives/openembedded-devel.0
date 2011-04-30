Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGG5D-0007xx-HZ for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 21:44:03 +0200
Received: from f053036151.adsl.alicedsl.de ([78.53.36.151]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGG3e-0001z2-Dq for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 19:42:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304166728-3002-1-git-send-email-schnitzeltony@gmx.de>
References: <1304166728-3002-1-git-send-email-schnitzeltony@gmx.de>
Date: Sat, 30 Apr 2011 21:41:29 +0200
Message-ID: <1304192489.3928.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Sat, 30 Apr 2011 19:44:03 -0000
X-Groupsio-MsgNum: 31532
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-p/ILJcikytK95a1PRlY3"

--=-p/ILJcikytK95a1PRlY3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Samstag, den 30.04.2011, 14:32 +0200 schrieb Andreas Mueller:
> During performance tests with BB_NUMBER_THREADS > 10
> libgpsbt failed with
>=20
> | /home/Superandy/tmp/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstr=
om-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: canno=
t find -ldbus-glib-1
> | collect2: ld returned 1 exit status
> | make[1]: *** [libgpsbt.la] Error 1
> | make[1]: Leaving directory `/home/Superandy/tmp/work/armv7a-angstrom-li=
nux-gnueabi/libgpsbt-0.1-r2/libgpsbt-0.1'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> ...
> ERROR: '/home/Superandy/data/OpenEmbedded/gumstix-oe/recipes/maemo4/libgp=
sbt_0.1.bb' failed

Why is the task compile even executed for your system? Using
`minimal-uclibc` already task configure detects the missing dependency.

        [=E2=80=A6]
        | checking for GLIB... yes
        | checking for DBUS... configure: error: Package requirements ( dbu=
s-glib-1 >=3D 0.23 ) were not met:
        |
        | No package 'dbus-glib-1' found
        |
        | Consider adjusting the PKG_CONFIG_PATH environment variable if yo=
u
        | installed software in a non-standard prefix.
        |
        | Alternatively, you may set the environment variables DBUS_CFLAGS
        | and DBUS_LIBS to avoid the need to call pkg-config.
        | See the pkg-config man page for more details.
        |
        NOTE: package libgpsbt-0.1-r2: task do_configure: Failed

> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

> ---
>  recipes/maemo4/libgpsbt_0.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/maemo4/libgpsbt_0.1.bb b/recipes/maemo4/libgpsbt_0.1=
.bb
> index c6c6ea6..d199379 100644
> --- a/recipes/maemo4/libgpsbt_0.1.bb
> +++ b/recipes/maemo4/libgpsbt_0.1.bb
> @@ -1,8 +1,8 @@
>  LICENSE =3D "nokia"
> =20
> -PR =3D "r2"
> +PR =3D "r3"

Is that needed?

> -DEPENDS =3D "libgpsmgr dbus"
> +DEPENDS =3D "libgpsmgr dbus dbus-glib"
> =20
>  # This is proprietary software in Chinook, so we have to stay with the l=
ast released
>  # free version.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-p/ILJcikytK95a1PRlY3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk28ZdYACgkQPX1aK2wOHVgjtgCfRQHb5myBNcjOrQB7GNjsIBog
GPMAnio0Ux+R3JlHrBFSigzwYA4ztZKu
=ZwE/
-----END PGP SIGNATURE-----

--=-p/ILJcikytK95a1PRlY3--
