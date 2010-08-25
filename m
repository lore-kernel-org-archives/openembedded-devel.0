Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoOYN-000098-Jj for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 00:35:00 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoOXy-0007Z4-MB for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 22:34:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
References: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
Date: Thu, 26 Aug 2010 00:34:16 +0200
Message-ID: <1282775656.3711.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,FB_CIALIS_LEO3
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] upstart: fix sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 22:35:00 -0000
X-Groupsio-MsgNum: 22661
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xhFAY/6Xih5arOO9R5Cs"

--=-xhFAY/6Xih5arOO9R5Cs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 22:49 +0600 schrieb Anatoly Shipitsin:

As written in my other message, what was the problem in the first place
is missing.

> * change PR =3D "r2"
> * add example-jobs for sysvinit compat
> * add update-alternatives for proper switch
> * add native tty service generate
> * add rc rcS scripts for run sysvinit scripts

Where did you take those from?

> * change reboot halt poweroff shutdown for compatible with update-alterna=
tives
> * move runlevel to upstart-sysvinit
> * change upstart-sysvtools-doc to upstart-sysvcompat-doc

Small commits =E2=80=93 like changing the package name =E2=80=93 make it ea=
sier to
review.

> Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
> ---
>  recipes/upstart/upstart.inc              |  111 ++++++++++++++++++++++++=
++++-
>  recipes/upstart/upstart/init/rc          |  102 ++++++++++++++++++++++++=
+++
>  recipes/upstart/upstart/init/rcS         |  113 ++++++++++++++++++++++++=
++++++
>  recipes/upstart/upstart/init/rcS-default |   25 +++++++
>  recipes/upstart/upstart_0.3.11.bb        |   15 +++-
>  recipes/upstart/upstart_0.3.8.bb         |   14 +++--
>  6 files changed, 367 insertions(+), 13 deletions(-)
>  create mode 100755 recipes/upstart/upstart/init/rc
>  create mode 100755 recipes/upstart/upstart/init/rcS
>  create mode 100644 recipes/upstart/upstart/init/rcS-default
>=20
> diff --git a/recipes/upstart/upstart.inc b/recipes/upstart/upstart.inc
> index e67774a..7512133 100644
> --- a/recipes/upstart/upstart.inc
> +++ b/recipes/upstart/upstart.inc
> @@ -4,7 +4,7 @@ DEPENDS =3D ""
>  DESCRIPTION =3D "Event driven system init"
>  LICENSE =3D "GPL"
> =20
> -inherit autotools pkgconfig=20
> +inherit autotools pkgconfig update-alternatives
> =20
>  # --enable-compat builds halt, reboot, shutdown tools
>  EXTRA_OECONF +=3D "--enable-compat"
> @@ -17,6 +17,109 @@ FILES_libupstart-dev +=3D "${libdir}/libupstart.* ${i=
ncludedir}/upstart/"
> =20
>  # upstart-sysvcompat provides Sys V Init compatible tools: halt, reboot,
>  # shutdown, telinit. These might be needed by other scripts.
> -PACKAGES =3D+ "upstart-sysvcompat upstart-sysvtools-doc"
> -FILES_upstart-sysvcompat +=3D "${sbindir}/reboot ${sbindir}/halt ${sbind=
ir}/shutdown ${sbindir}/telinit"
> -FILES_upstart-sysvcompat-doc +=3D "${mandir}/*/reboot.* ${mandir}/*/halt=
.* ${mandir}/*/shutdown.* ${mandir}/*/telinit.*"
> +PACKAGES =3D+ "upstart-sysvcompat upstart-sysvcompat-doc"
> +FILES_upstart-sysvcompat +=3D " \
> +    ${base_sbindir}/reboot.* ${base_sbindir}/halt.* ${base_sbindir}/powe=
roff.* \
> +    ${base_sbindir}/shutdown.* ${base_sbindir}/telinit ${base_sbindir}/r=
unlevel \
> +    ${sysconfdir}/event.d/control-alt-delete \
> +    ${sysconfdir}/event.d/rc* \
> +    ${sysconfdir}/event.d/sulogin \
> +    ${sysconfdir}/init.d \
> +    ${sysconfdir}/default/rcS \
> +"
> +FILES_upstart-sysvcompat-doc +=3D " \
> +    ${mandir}/*/reboot.* ${mandir}/*/halt.* ${mandir}/*/poweroff.* \
> +     ${mandir}/*/shutdown.* ${mandir}/*/telinit.* ${mandir}/*/runlevel.*=
 \
> +"
> +
> +ALTERNATIVE_NAME =3D "init"
> +ALTERNATIVE_LINK =3D "${base_sbindir}/init"
> +ALTERNATIVE_PATH =3D "${base_sbindir}/init.${PN}"
> +ALTERNATIVE_PRIORITY =3D "60"
> +
> +EXTRA_OEMAKE +=3D "'bindir=3D${base_bindir}' \
> +		 'sbindir=3D${base_sbindir}' \
> +		 'usrbindir=3D${bindir}' \
> +		 'usrsbindir=3D${sbindir}' \
> +		 'includedir=3D${includedir}' \
> +		 'mandir=3D${mandir}'"

Is not that picked up automatically?

> +do_install () {
> +	oe_runmake 'DESTDIR=3D${D}' install
> +	install -d ${D}${sysconfdir}
> +	install -d ${D}${sysconfdir}/default
> +	install -d ${D}${sysconfdir}/init.d
> +
> +	install -m 0644	${WORKDIR}/init/rcS-default	${D}${sysconfdir}/default/r=
cS
> +	install -m 0755 ${WORKDIR}/init/rc		${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/init/rcS		${D}${sysconfdir}/init.d
> +	install -m 0644 ${WORKDIR}/rc*			${D}${sysconfdir}/event.d
> +	install -m 0644 ${WORKDIR}/control-alt-delete	${D}${sysconfdir}/event.d
> +	install -m 0644 ${WORKDIR}/sulogin		${D}${sysconfdir}/event.d
> +
> +	if [ ! -z "${SERIAL_CONSOLE}" ]; then
> +	     cat <<EOF >> ${D}${sysconfdir}/event.d/tty-serial
> +# tty-serial - getty
> +#
> +# This service maintains a getty on tty-serial from the point the system=
 is
> +# started until it is shut down again.
> +
> +start on runlevel 2
> +start on runlevel 3
> +start on runlevel 4
> +start on runlevel 5
> +
> +stop on runlevel 0
> +stop on runlevel 1
> +stop on runlevel 6
> +
> +respawn
> +exec ${base_sbindir}/getty ${SERIAL_CONSOLE}
> +EOF
> +	fi
> +	if [ "${USE_VT}" =3D "1" ]; then
> +	    for n in ${SYSVINIT_ENABLED_GETTYS}
> +	    do
> +	     cat <<EOF >> ${D}${sysconfdir}/event.d/tty$n
> +# tty$n - getty
> +#
> +# This service maintains a getty on tty$n from the point the system is
> +# started until it is shut down again.
> +
> +start on runlevel 2
> +start on runlevel 3
> +start on runlevel 4
> +start on runlevel 5
> +
> +stop on runlevel 0
> +stop on runlevel 1
> +stop on runlevel 6
> +
> +respawn
> +exec ${base_sbindir}/getty 38400 tty$n
> +EOF
> +	    done
> +	fi
> +
> +	mv ${D}${base_sbindir}/init	${D}${base_sbindir}/init.${PN}
> +        mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
> +	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
> +        mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${P=
N}
> +	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${PN}
> +}
> +
> +pkg_postinst_${PN}-sysvcompat () {
> +#!/bin/sh
> +update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN}=
 200
> +update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
> +update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff=
.${PN} 200
> +update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown=
.${PN} 200
> +}
> +
> +pkg_prerm_${PN}-sysvcompat () {
> +#!/bin/sh
> +update-alternatives --remove reboot reboot.${PN}
> +update-alternatives --remove halt halt.${PN}
> +update-alternatives --remove poweroff reboot.${PN}
> +update-alternatives --remove shutdown shutdown.${PN}
> +}
> diff --git a/recipes/upstart/upstart/init/rc b/recipes/upstart/upstart/in=
it/rc
> new file mode 100755
> index 0000000..fdb0fce
> --- /dev/null
> +++ b/recipes/upstart/upstart/init/rc
> @@ -0,0 +1,102 @@
> +#!/bin/sh
> +#
> +# rc		This file is responsible for starting/stopping
> +#		services when the runlevel changes.
> +#
> +#		Optimization feature:
> +#		A startup script is _not_ run when the service was
> +#		running in the previous runlevel and it wasn't stopped
> +#		in the runlevel transition (most Debian services don't
> +#		have K?? links in rc{1,2,3,4,5} )
> +#
> +# Author:	Miquel van Smoorenburg <miquels@cistron.nl>
> +#		Bruce Perens <Bruce@Pixar.com>
> +#
> +# Version:	@(#)rc  2.78  07-Nov-1999  miquels@cistron.nl
> +#
> +
> +. /etc/default/rcS
> +export VERBOSE
> +
> +#
> +# Start script or program.
> +#
> +startup() {
> +  case "$1" in
> +	*.sh)
> +		sh "$@"
> +		;;
> +	*)
> +		"$@"
> +		;;
> +  esac
> +}
> +
> +  # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
> +  trap ":" INT QUIT TSTP
> +
> +  # Set onlcr to avoid staircase effect.
> +  stty onlcr 0>&1
> +
> +  # Now find out what the current and what the previous runlevel are.
> +
> +  runlevel=3D$RUNLEVEL
> +  # Get first argument. Set new runlevel to this argument.
> +  [ "$1" !=3D "" ] && runlevel=3D$1
> +  if [ "$runlevel" =3D "" ]
> +  then
> +	echo "Usage: $0 <runlevel>" >&2
> +	exit 1
> +  fi
> +  previous=3D$PREVLEVEL
> +  [ "$previous" =3D "" ] && previous=3DN
> +
> +  export runlevel previous
> +
> +  # Is there an rc directory for this new runlevel?
> +  if [ -d /etc/rc$runlevel.d ]
> +  then
> +	# First, run the KILL scripts.
> +	if [ $previous !=3D N ]
> +	then
> +		for i in /etc/rc$runlevel.d/K[0-9][0-9]*
> +		do
> +			# Check if the script is there.
> +			[ ! -f $i ] && continue
> +
> +			# Stop the service.
> +			startup $i stop
> +		done
> +	fi
> +	# Now run the START scripts for this runlevel.
> +	for i in /etc/rc$runlevel.d/S*
> +	do
> +		[ ! -f $i ] && continue
> +
> +		if [ $previous !=3D N ] && [ $previous !=3D S ]
> +		then
> +			#
> +			# Find start script in previous runlevel and
> +			# stop script in this runlevel.
> +			#
> +			suffix=3D${i#/etc/rc$runlevel.d/S[0-9][0-9]}
> +			stop=3D/etc/rc$runlevel.d/K[0-9][0-9]$suffix
> +			previous_start=3D/etc/rc$previous.d/S[0-9][0-9]$suffix
> +			#
> +			# If there is a start script in the previous level
> +			# and _no_ stop script in this level, we don't
> +			# have to re-start the service.
> +			#
> +			[ -f $previous_start ] && [ ! -f $stop ] && continue
> +		fi
> +		case "$runlevel" in
> +			0|6)
> +				startup $i stop
> +				;;
> +			*)
> +				startup $i start
> +				;;
> +		esac
> +	done
> +  fi
> +# eof /etc/init.d/rc
> diff --git a/recipes/upstart/upstart/init/rcS b/recipes/upstart/upstart/i=
nit/rcS
> new file mode 100755
> index 0000000..15b90f7
> --- /dev/null
> +++ b/recipes/upstart/upstart/init/rcS
> @@ -0,0 +1,113 @@
> +#!/bin/sh
> +#
> +# rcS		Call all S??* scripts in /etc/rcS.d in
> +#		numerical/alphabetical order.
> +#
> +# Version:	@(#)/etc/init.d/rcS  2.76  19-Apr-1999  miquels@cistron.nl
> +#
> +
> +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> +runlevel=3DS
> +prevlevel=3DN
> +umask 022
> +export PATH runlevel prevlevel
> +
> +#	Make sure proc is mounted
> +#
> +[ -d "/proc/1" ] || mount proc /proc -t proc
> +
> +#	Make sure sys is mounted
> +[ -d "/sys/kernel" ] || mount sysfs /sys -t sysfs
> +
> +#
> +#	See if system needs to be setup. This is ONLY meant to
> +#	be used for the initial setup after a fresh installation!
> +#
> +if [ -x /sbin/unconfigured.sh ]
> +then
> +  /sbin/unconfigured.sh
> +fi
> +
> +#
> +#	Source defaults.
> +#
> +. /etc/default/rcS
> +
> +#
> +#	Trap CTRL-C &c only in this shell so we can interrupt subprocesses.
> +#
> +trap ":" INT QUIT TSTP
> +
> +#
> +#       Do we have /proc/progress and set VERBOSE to "no" ?
> +#       If so, calculate the number of scripts and the incremental step
> +#
> +if [ "$VERBOSE" =3D no ]; then
> +    if [ -e /proc/progress ]; then
> +        set `ls -1 /etc/rc$runlevel.d/S* | wc`
> +        numscripts=3D$1
> +        PROGRESS_incstep=3D`expr 90 / $1`
> +        PROGRESS_value=3D10
> +        PROGRESS=3Dyes
> +        export PROGRESS_value PROGRESS_incstep
> +    fi
> +fi
> +export VERBOSE PROGRESS
> +
> +#
> +#	Call all parts in order.
> +#
> +for i in /etc/rcS.d/S??*
> +do
> +	# Ignore dangling symlinks for now.
> +	[ ! -f "$i" ] && continue
> +
> +	# Handle verbosity
> +	[ "$VERBOSE" =3D very ] && echo "INIT: Running $i..."
> +	if [ "$PROGRESS" =3D yes ]; then
> +		export PROGRESS_value=3D`expr $PROGRESS_value + $PROGRESS_incstep`
> +		echo "$PROGRESS_value Starting $i..." >/proc/progress
> +	fi
> +
> +	case "$i" in
> +		*.sh)
> +			# Source shell script for speed.
> +			(
> +				trap - INT QUIT TSTP
> +				set start
> +				. $i
> +			)
> +			;;
> +		*)
> +			# No sh extension, so fork subprocess.
> +			$i start
> +			;;
> +	esac
> +
> +        #
> +        # Report status based on result code
> +        #
> +        result=3D$?
> +        if [ "$PROGRESS" =3D yes ]; then
> +                if [ "$result" =3D 0 ]; then
> +                    echo "=3Ds" >/proc/progress
> +                else
> +                    echo "=3Df" >/proc/progress
> +                fi
> +        fi
> +done
> +
> +#
> +#	For compatibility, run the files in /etc/rc.boot too.
> +#
> +[ -d /etc/rc.boot ] && run-parts /etc/rc.boot
> +
> +#
> +#	Finish setup if needed. The comment above about
> +#	/sbin/unconfigured.sh applies here as well!
> +#
> +if [ -x /sbin/setup.sh ]
> +then
> +  /sbin/setup.sh
> +fi
> +
> diff --git a/recipes/upstart/upstart/init/rcS-default b/recipes/upstart/u=
pstart/init/rcS-default
> new file mode 100644
> index 0000000..7ad3c7b
> --- /dev/null
> +++ b/recipes/upstart/upstart/init/rcS-default
> @@ -0,0 +1,25 @@
> +#
> +#	Defaults for the boot scripts in /etc/rcS.d
> +#
> +
> +# Time files in /tmp are kept in days.
> +TMPTIME=3D0
> +# Set to yes if you want sulogin to be spawned on bootup
> +SULOGIN=3Dno
> +# Set to no if you want to be able to login over telnet/rlogin
> +# before system startup is complete (as soon as inetd is started)
> +DELAYLOGIN=3Dno
> +# Set UTC=3Dyes if your system clock is set to UTC (GMT), and UTC=3Dno i=
f not.
> +# UTC=3Dyes
> +# Set VERBOSE to "no" if you would like a more quiet bootup.
> +VERBOSE=3Dno
> +# Set EDITMOTD to "no" if you don't want /etc/motd to be editted automat=
ically
> +EDITMOTD=3Dno
> +# Whether to fsck root on boot
> +ENABLE_ROOTFS_FSCK=3Dno
> +# Set FSCKFIX to "yes" if you want to add "-y" to the fsck at startup.
> +FSCKFIX=3Dyes
> +# Set TICKADJ to the correct tick value for this specific machine
> +#TICKADJ=3D10000
> +# Enable caching in populate-volatile.sh
> +VOLATILE_ENABLE_CACHE=3Dyes
> diff --git a/recipes/upstart/upstart_0.3.11.bb b/recipes/upstart/upstart_=
0.3.11.bb
> index c4db01b..a0bd17e 100644
> --- a/recipes/upstart/upstart_0.3.11.bb
> +++ b/recipes/upstart/upstart_0.3.11.bb
> @@ -1,11 +1,18 @@
>  require upstart.inc
> =20
> -SRC_URI =3D "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz=
2 \
> +SRC_URI =3D "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz=
2;name=3Dupstart \
> +    http://upstart.ubuntu.com/download/example-jobs/0.3/example-jobs-${P=
V}.tar.gz;name=3Dcompat \
> +    file://init/rcS-default file://init/rc file://init/rcS \
>  "
> =20
>  RRECOMMENDS_${PN} =3D "libupstart upstart-sysvcompat"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
> -SRC_URI[md5sum] =3D "a9e475e1458c876add0441d9d4cfe9c0"
> -SRC_URI[sha256sum] =3D "d4f7fff9112049eab318518719735d0ac66ff558ed91c2d7=
c7c41124de2832b6"
> +USE_VT ?=3D "1"
> +SYSVINIT_ENABLED_GETTYS ?=3D "1"

Why are those two lines needed in this, but not in the 0.3.8 recipe?

> +SRC_URI[upstart.md5sum] =3D "a9e475e1458c876add0441d9d4cfe9c0"=20
> +SRC_URI[upstart.sha256sum] =3D "d4f7fff9112049eab318518719735d0ac66ff558=
ed91c2d7c7c41124de2832b6"
> +SRC_URI[compat.md5sum] =3D "22d66ef8bc9d167eb822bbfecb584107"
> +SRC_URI[compat.sha256sum] =3D "f53fae7258fcf67cb29d344e53e1548171e4781af=
11ff4ba92b8b81caab3c315"
> diff --git a/recipes/upstart/upstart_0.3.8.bb b/recipes/upstart/upstart_0=
.3.8.bb
> index 1b2cfb5..baf00d2 100644
> --- a/recipes/upstart/upstart_0.3.8.bb
> +++ b/recipes/upstart/upstart_0.3.8.bb
> @@ -1,10 +1,14 @@
>  require upstart.inc
> =20
> -SRC_URI =3D "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz=
2 \
> -file://autoconf_version.patch"
> +SRC_URI =3D "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz=
2;name=3Dupstart \
> +    http://upstart.ubuntu.com/download/example-jobs/0.3/example-jobs-${P=
V}.tar.gz;name=3Dcompat \
> +    file://init/rcS-default file://init/rc file://init/rcS \
> +    file://autoconf_version.patch \
> +"
> =20
>  PR =3D "r1"
> =20
> -
> -SRC_URI[md5sum] =3D "5cdd2dc3a3f02089c9450edf4e8f4941"
> -SRC_URI[sha256sum] =3D "9a2a37455ad4e9dd2856b5a0f15adb1a3f84439f60d0f63b=
041584a2666e9835"
> +SRC_URI[upstart.md5sum] =3D "5cdd2dc3a3f02089c9450edf4e8f4941"
> +SRC_URI[upstart.sha256sum] =3D "9a2a37455ad4e9dd2856b5a0f15adb1a3f84439f=
60d0f63b041584a2666e9835"
> +SRC_URI[compat.md5sum] =3D "22d66ef8bc9d167eb822bbfecb584107"
> +SRC_URI[compat.sha256sum] =3D "f53fae7258fcf67cb29d344e53e1548171e4781af=
11ff4ba92b8b81caab3c315"


Thanks,

Paul

--=-xhFAY/6Xih5arOO9R5Cs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx1mmgACgkQPX1aK2wOHVjXnwCfes1JC1Gwa+ZB8eFFrUW7zG1p
CHQAn09vn2q0IJBbdVEZl0mnrkGaQMVl
=xm8n
-----END PGP SIGNATURE-----

--=-xhFAY/6Xih5arOO9R5Cs--
