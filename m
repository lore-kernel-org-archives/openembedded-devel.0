Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qeid7-0004SI-NX for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 09:04:09 +0200
Received: from f053040030.adsl.alicedsl.de ([78.53.40.30]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeiZj-0004x4-TT; Thu, 07 Jul 2011 07:00:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
Date: Thu, 07 Jul 2011 09:00:18 +0200
Message-ID: <1310022018.4532.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	beagle@list.ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Thu, 07 Jul 2011 07:04:09 -0000
X-Groupsio-MsgNum: 33035
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VhitDRdfBHwUWjut3Pj1"

--=-VhitDRdfBHwUWjut3Pj1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Donnerstag, den 07.07.2011, 00:38 -0500 schrieb Joel A Fernandes:
> * Pulseaudio running as per-user is opening audio devices and blocking ev=
eryone else from getting access
>   to the device. The problem is it doesn't even seem to be allowing appli=
cations to connect to it, this
>   patch starts it up in system mode instead which is tested and known to =
work

thank you for the patch. Could you post your error and check with the
PulseAudio guys what the cause is? There are very responsive on their
mailing list, which moved to freedesktop.org recently.

As far as I understood system mode can sometimes be the right thing to
do but most of the time it is just a configuration error. Running PA and
printing out the debug messages should give you a clue.

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Changes since earlier version:
>  Sorry I didn't bump the PR! Resending it again
>=20
>  .../pulseaudio-system-mode-startup.sh              |    4 ++++
>  recipes/pulseaudio/pulseaudio_0.9.22.bb            |   17 ++++++++++++++=
++-
>  2 files changed, 20 insertions(+), 1 deletions(-)
>  create mode 100755 recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-syste=
m-mode-startup.sh
>=20
> diff --git a/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-=
startup.sh b/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-st=
artup.sh
> new file mode 100755
> index 0000000..528ceb9
> --- /dev/null
> +++ b/recipes/pulseaudio/pulseaudio-0.9.21/pulseaudio-system-mode-startup=
.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +echo "Starting Pulseaudio in system mode.."
> +pulseaudio --log-target=3Dsyslog --system
> diff --git a/recipes/pulseaudio/pulseaudio_0.9.22.bb b/recipes/pulseaudio=
/pulseaudio_0.9.22.bb
> index 2368829..1bc6816 100644
> --- a/recipes/pulseaudio/pulseaudio_0.9.22.bb
> +++ b/recipes/pulseaudio/pulseaudio_0.9.22.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
> =20
> -PR =3D ${INC_PR}.2
> +PR =3D ${INC_PR}.3
> =20
>  DEPENDS +=3D "gdbm speex"
> =20
> @@ -12,6 +12,10 @@ FILESPATHPKG =3D. "pulseaudio-0.9.21:"
> =20
>  inherit gettext
> =20
> +inherit update-rc.d
> +INITSCRIPT_NAME =3D "pulseaudio.sh"
> +INITSCRIPT_PARAMS =3D "start 99 2 3 4 5 ."
> +
>  #SRC_URI +=3D "\
>  #  file://buildfix.patch \
>  #  file://autoconf_version.patch \
> @@ -27,6 +31,7 @@ SRC_URI +=3D "\
>    file://armv4+v5asm.patch \
>    file://fixbluezbuild.patch \
>    file://ubacktrace.patch \
> +  file://pulseaudio-system-mode-startup.sh \
>  "
> =20
>  #do_compile_prepend() {
> @@ -37,3 +42,13 @@ SRC_URI +=3D "\
> =20
>  SRC_URI[md5sum] =3D "ca85ab470669b05e100861654cf5eb3c"
>  SRC_URI[sha256sum] =3D "c6019324395117a258c048a6db5e9734551cc2c61dc35b46=
403ff00d64be55f0"
> +
> +do_install_append() {
> +  # init script to start pulseaudio system-wide
> +  install -d ${D}/${sysconfdir}/init.d/
> +  install -m 0755 ${WORKDIR}/pulseaudio-system-mode-startup.sh ${D}/${sy=
sconfdir}/init.d/pulseaudio.sh

If I remember correctly that is configurable in the config files for PA
under `/etc/pulse/`.

> +  # Disable startup of pulseaudio as a per-user instance
> +  chmod -x ${D}/${bindir}/start-pulseaudio-x11

Is that needed? It is an unexpected change for the user having to find
out that s/he has to make a program under `/usr/bin/` executable to run
it.

> +}
> +

Please do not add empty lines.


Thanks,

Paul

--=-VhitDRdfBHwUWjut3Pj1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4VWYEACgkQPX1aK2wOHVgMIQCfQIkPIoyboZiD/eOlXBhuKNPp
9aQAmwfAlhlINzWSoVmAkPj5xtiPLqr/
=4UTB
-----END PGP SIGNATURE-----

--=-VhitDRdfBHwUWjut3Pj1--
