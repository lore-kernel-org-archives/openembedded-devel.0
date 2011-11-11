Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROyy3-0000OL-U7 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 22:48:59 +0100
Received: from f053039250.adsl.alicedsl.de ([78.53.39.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROysA-00008h-Mc for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 21:42:54 +0000
Message-ID: <1321047762.18833.19.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 22:42:42 +0100
In-Reply-To: <1321046272-3745-1-git-send-email-todd.kempel@gmail.com>
References: <1321046272-3745-1-git-send-email-todd.kempel@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] commiting recipe for batctl
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
X-List-Received-Date: Fri, 11 Nov 2011 21:49:00 -0000
X-Groupsio-MsgNum: 35358
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Y9IHcrnRIh6effPdaWVn"

--=-Y9IHcrnRIh6effPdaWVn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Todd,


thank you for your contribution.


Am Freitag, den 11.11.2011, 15:17 -0600 schrieb Todd Kempel:
> From: Todd Kempel <todd@todd-VirtualBox.(none)>

Please use a real email address.

	git config user.email todd.kempel@gmail.com

The commit summary should be the following

	batctl: Add version 2011.3.0 (initial recipe)

Please also add a short description how you tested this recipe and if
everything works. Did you also try a uClibc based build?

There are some guide lines in the OE wiki [1][2][3].

> Signed-off-by: Todd Kempel <todd@todd-VirtualBox.(none)>
> ---
>  recipes/batctl/batctl-2011.3.0/makefile-fix.patch |   18 +++++++++++++
>  recipes/batctl/batctl.inc                         |   28 +++++++++++++++=
++++++
>  recipes/batctl/batctl_2011.3.0.bb                 |    6 ++++
>  recipes/batctl/files/makefile-fix.patch           |   18 +++++++++++++
>  4 files changed, 70 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/batctl/batctl-2011.3.0/makefile-fix.patch
>  create mode 100644 recipes/batctl/batctl.inc
>  create mode 100644 recipes/batctl/batctl_2011.3.0.bb
>  create mode 100644 recipes/batctl/files/makefile-fix.patch
>=20
> diff --git a/recipes/batctl/batctl-2011.3.0/makefile-fix.patch b/recipes/=
batctl/batctl-2011.3.0/makefile-fix.patch
> new file mode 100644
> index 0000000..45bd69e
> --- /dev/null
> +++ b/recipes/batctl/batctl-2011.3.0/makefile-fix.patch

Please add a patch header [3]. Like what problem does that patch fix and
did you send it upstream?

> @@ -0,0 +1,18 @@
> +--- batctl-2011.3.0.orig/Makefile	2011-11-09 16:22:58.088166320 -0600
> ++++ batctl-2011.3.0/Makefile	2011-11-09 16:33:21.181006028 -0600
> +@@ -24,7 +24,6 @@
> + MANPAGE =3D man/batctl.8
> +=20
> + # batctl flags and options
> +-CFLAGS +=3D -pedantic -Wall -W -std=3Dgnu99 -fno-strict-aliasing -MD

Why does not that work? Do you have an idea?

> + LDLIBS +=3D -lm
> +=20
> + # disable verbose output
> +@@ -38,7 +37,6 @@
> + endif
> +=20
> + # standard build tools
> +-CC ?=3D gcc

Does `oe_runmake` not overwrite that?

> + RM ?=3D rm -f
> + INSTALL ?=3D install
> + MKDIR ?=3D mkdir -p
> diff --git a/recipes/batctl/batctl.inc b/recipes/batctl/batctl.inc
> new file mode 100644
> index 0000000..71dd948
> --- /dev/null
> +++ b/recipes/batctl/batctl.inc
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Routing protocol daemon for multi-hop ad-hoc mesh netwo=
rks."
> +SECTION =3D "console/network"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +HOMEPAGE =3D "http://www.open-mesh.net/"

`HOMEPAGE` goes below the description please [4].

> +
> +INC_PR =3D "r2"

Start with `r0` please when committing it upstream.

> +
> +RDEPENDS_${PN} =3D "kernel-module-tun"
> +
> +SRC_URI =3D "http://downloads.open-mesh.net/batman/stable/sources/batctl=
/batctl-${PV}.tar.gz \
> +           file://makefile-fix.patch \
> +          "
> +
> +S =3D "${WORKDIR}/batctl-${PV}"

That should be the default?

> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +do_stage() {
> +  :
> +}

`do_stage` is deprecated [5].

> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 0755 batctl ${D}${bindir}
> +}
> diff --git a/recipes/batctl/batctl_2011.3.0.bb b/recipes/batctl/batctl_20=
11.3.0.bb
> new file mode 100644
> index 0000000..2b32e63
> --- /dev/null
> +++ b/recipes/batctl/batctl_2011.3.0.bb
> @@ -0,0 +1,6 @@
> +require batctl.inc
> +PR =3D "${INC_PR}.1"

Start with `.0` please.

> +
> +
> +SRC_URI[md5sum] =3D "8eb197896049bb04a6beef56015a16b6"
> +SRC_URI[sha256sum] =3D "94922fd167d2bca5193cc7465bfc212c2c3595da70e65350=
6493dfc65e4410fb"
> diff --git a/recipes/batctl/files/makefile-fix.patch b/recipes/batctl/fil=
es/makefile-fix.patch
> new file mode 100644
> index 0000000..45bd69e
> --- /dev/null
> +++ b/recipes/batctl/files/makefile-fix.patch
> @@ -0,0 +1,18 @@
> +--- batctl-2011.3.0.orig/Makefile	2011-11-09 16:22:58.088166320 -0600
> ++++ batctl-2011.3.0/Makefile	2011-11-09 16:33:21.181006028 -0600
> +@@ -24,7 +24,6 @@
> + MANPAGE =3D man/batctl.8
> +=20
> + # batctl flags and options
> +-CFLAGS +=3D -pedantic -Wall -W -std=3Dgnu99 -fno-strict-aliasing -MD
> + LDLIBS +=3D -lm
> +=20
> + # disable verbose output
> +@@ -38,7 +37,6 @@
> + endif
> +=20
> + # standard build tools
> +-CC ?=3D gcc
> + RM ?=3D rm -f
> + INSTALL ?=3D install
> + MKDIR ?=3D mkdir -p

This is already in the correct folder. Please commit just one patch. ;-)

Otherwise that looks nice. Please resubmit as `[PATCH v2]` [6].

	--subject-prefix=3D"PATCH v2"


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy
[2] http://www.openembedded.org/wiki/Commit_log_example
[3] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
[4] http://www.openembedded.org/wiki/Styleguide
[5] http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

--=-Y9IHcrnRIh6effPdaWVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk69ltIACgkQPX1aK2wOHVhZFwCfTnMwwH1fTyHPO2a/B0TzO/h3
JxwAn3ZATBEzILxWIy0FYLRQLb1trbvd
=GEPB
-----END PGP SIGNATURE-----

--=-Y9IHcrnRIh6effPdaWVn--
