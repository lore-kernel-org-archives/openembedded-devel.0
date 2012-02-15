Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RxavC-0004cW-P9 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 10:13:06 +0100
Received: from f053045066.adsl.alicedsl.de ([78.53.45.66]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RxanO-0006cY-Jd for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 09:05:02 +0000
Message-ID: <1329296695.4465.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2012 10:04:55 +0100
In-Reply-To: <CAO-TFnG+O4F8-Kiu8DK1SHR3Caz4xF-AJdHZouPrgv6fqw31NA@mail.gmail.com>
References: <CAO-TFnG+O4F8-Kiu8DK1SHR3Caz4xF-AJdHZouPrgv6fqw31NA@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] ntpclient: Port 2010_365 recipe from OE Classicntpclient: Port 2010_365 recipe from OE Classic.
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
X-List-Received-Date: Wed, 15 Feb 2012 09:13:06 -0000
X-Groupsio-MsgNum: 37128
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-6jTjVYnmKhZv5+zWaWea"

--=-6jTjVYnmKhZv5+zWaWea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Kelvin,


thank you for the patch.

Am Mittwoch, den 15.02.2012, 00:34 +0000 schrieb Kelvin Lawson:

You pasted the summary line twice. Also please add the ID to the commit
message.

> * Also includes a Makefile fix to reorder the linker parameters.
> Signed-off-by: Kelvin Lawson <kelvinl@users.sf.net>
> ---
>  meta-oe/recipes-connectivity/ntpclient/files/init  |   42 ++++++++++++++=
+++
>  .../ntpclient/files/ntpclient-link.patch           |   12 +++++
>  .../ntpclient/ntpclient_2010_365.bb                |   47 ++++++++++++++=
++++++
>  3 files changed, 101 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/ntpclient/files/init
>  create mode 100644
> meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch

The patch is mangled.

>  create mode 100644 meta-oe/recipes-connectivity/ntpclient/ntpclient_2010=
_365.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/ntpclient/files/init
> b/meta-oe/recipes-connectivity/ntpclient/files/init
> new file mode 100644
> index 0000000..7b85902
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ntpclient/files/init
> @@ -0,0 +1,42 @@
> +#! /bin/sh
> +#
> +# This is an init script for openembedded
> +# Copy it to /etc/init.d/ntpclient and type
> +# > update-rc.d ntpclient defaults 60
> +#
> +ntpclient=3D/sbin/ntpclient
> +test -x "$ntpclient" || exit 0
> +# Seconds Between Time Checks
> +ntpinterval=3D600
> +# Upstream NTP Server Name
> +ntpserver=3Dpool.ntp.org
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting NTP Client"
> +    start-stop-daemon --start --quiet --background --make-pidfile
> --pidfile /var/run/ntpclient.pid --exec $ntpclient -- -l -i
> $ntpinterval -h $ntpserver
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping NTP Client"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/ntpclient.pid
> +    echo "."
> +    ;;
> +  reload|force-reload)
> +    start-stop-daemon --stop --quiet --signal 1 --exec $ntpclient
> +    ;;
> +  restart)
> +    echo -n "Stopping NTP Client"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/ntpclient.pid
> +    echo "."
> +    sleep 1
> +    echo -n "Starting NTP Client"
> +    start-stop-daemon --start --quiet --background --make-pidfile
> --pidfile /var/run/ntpclient.pid --exec $ntpclient -- -l -i
> $ntpinterval -h $ntpserver
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/ntpclient
> {start|stop|reload|restart|force-reload}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.=
patch
> b/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
> new file mode 100644
> index 0000000..b95fc24
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ntpclient/files/ntpclient-link.patch
> @@ -0,0 +1,12 @@

Please add a patch header as demanded in the commit and patch message
guide lines.

Also add what the error is please and describe the fix.

> +diff -Naur ntpclient-2010/Makefile ntpclient-2010-patched/Makefile
> +--- ntpclient-2010/Makefile	2010-12-28 06:26:36.000000000 +0000
> ++++ ntpclient-2010-patched/Makefile	2012-01-31 00:55:36.000000000 +0000
> +@@ -19,7 +19,7 @@
> + CFLAGS +=3D -DENABLE_REPLAY
> + # CFLAGS +=3D -DUSE_OBSOLETE_GETTIMEOFDAY
> +
> +-LDFLAGS +=3D -lrt
> ++LDLIBS +=3D -lrt
> +
> + all: ntpclient
> +
> diff --git a/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
> b/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
> new file mode 100644
> index 0000000..0ee7230
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ntpclient/ntpclient_2010_365.bb
> @@ -0,0 +1,47 @@
> +DESCRIPTION =3D "NTP (RFC-1305) client for unix-alike computers"
> +HOMEPAGE =3D "http://doolittle.icarus.com/ntpclient"

That URL does not work for me. Please fix this up in a follow up patch.

> +AUTHOR =3D "Larry Doolittle <larry@doolittle.boa.org>"
> +RDEPENDS_${PN} =3D "busybox"
> +SECTION =3D "admin"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a22d=
be6"
> +PR =3D "r0"
> +# The ntpclient package uses version numbers that include an underscore =
:(
> +PV =3D "2010_365"
> +# ntpclient unpacks into a directory that doesn't include version info :=
(
> +S =3D "${WORKDIR}/${PN}-2010"
> +
> +SRC_URI =3D "http://doolittle.icarus.com/ntpclient/ntpclient_${PV}.tar.g=
z \
> +           file://ntpclient-link.patch \
> +           file://init \
> +          "
> +
> +INITSCRIPT_NAME =3D "ntpclient"
> +INITSCRIPT_PARAMS =3D "defaults 65"
> +inherit update-rc.d
> +
> +LDFLAGS +=3D " -lrt "

I guess your patch makes that obsolete?

> +
> +do_compile() {
> +    oe_runmake ntpclient
> +    oe_runmake adjtimex
> +}
> +
> +do_install () {
> +    # Install the binary and tools
> +    install -D -m 0755 ${S}/ntpclient ${D}${base_sbindir}/ntpclient
> +    install -D -m 0755 ${S}/adjtimex ${D}${base_sbindir}/adjtimex.${PN}
> +    install -D -m 0755 ${S}/rate.awk ${D}${sbindir}/ntpclient-drift-rate=
.awk
> +    install -D -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ntpclien=
t
> +}
> +
> +pkg_postinst_${PN} () {
> +	update-alternatives --install ${base_sbindir}/adjtimex adjtimex
> adjtimex.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> +	update-alternatives --remove adjtimex adjtimex.${PN}
> +}
> +
> +SRC_URI[md5sum] =3D "a64689398f2df8933ee0d8da246e9eaa"
> +SRC_URI[sha256sum] =3D
> "9ad9b028385082fb804167f464e2db0a0b3d33780acd399327e64898b8fcfddd"

It would be great if you could send to patches. One which imports it and
another one fixing up the errors.


Thanks,

Paul

--=-6jTjVYnmKhZv5+zWaWea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk87dTgACgkQPX1aK2wOHVi7LACggo3YdWBNGGAEOWxlktEOufOK
2SwAoIjjgD9Cl5R6ZUt80AZ5uD7t+J2R
=Ktkf
-----END PGP SIGNATURE-----

--=-6jTjVYnmKhZv5+zWaWea--
