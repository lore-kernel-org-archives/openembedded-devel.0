Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED817687B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 18:06:05 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZbucH-0005bv-L7 from Joe_MacDonald@mentor.com ;
	Tue, 15 Sep 2015 11:06:05 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 11:06:04 -0700
Received: by burninator (Postfix, from userid 1000)	id 9E20B5803A2; Tue, 15
	Sep 2015 14:04:55 -0400 (EDT)
Date: Tue, 15 Sep 2015 14:04:55 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20150915180454.GB10507@mentor.com>
References: <1442339663-15101-1-git-send-email-fabio@bertux.com>
MIME-Version: 1.0
In-Reply-To: <1442339663-15101-1-git-send-email-fabio@bertux.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lldpd: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 18:06:06 -0000
X-Groupsio-MsgNum: 57376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

[[oe] [meta-networking][PATCH] lldpd: Add recipe] On 15.09.15 (Tue 14:54) F=
abio Berton wrote:

> From: Fabio Berton <fabio.berton@ossystems.com.br>
>=20
> lldpd is a 802.1AB implementation, a L2 network discovery protocol.
> It also supports CDP, EDP and various other protocols.

I haven't looked at this in great detail yet, but it appears like it
would provide the same functionality as lldpad, already in
meta-networking:

commit 6781f9b5dc60bbd39727aeaa74c13dd31eb73838
Author: Qian Lei <qianl.fnst@cn.fujitsu.com>
Date:   Thu Dec 11 17:36:20 2014 +0800

    lldpad: Add new recipe
   =20
    LLDPAD contains the Linux user space daemon and configuration tool for
    Intel LLDP Agent with Enhanced Ethernet support for the Data Center.
   =20
    Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I've no objection to carrying two different implementations,
particularly if one is more complete than the other or if one is more
actively developed, but I do have a couple of requests for you given
that you're the second one on the scene.

   - Can we move your recipe to sit beside the other lldp daemon?  (That
     is, in recipes-daemons)

   - Can you update your recipe (and the other, if necessary) to provide
     an appropriate PROVIDES / CONFLICTS variable?

-J.

>=20
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../recipes-connectivity/lldpd/files/lldpd.default |   2 +
>  .../recipes-connectivity/lldpd/files/lldpd.init.d  | 130 +++++++++++++++=
++++++
>  .../recipes-connectivity/lldpd/lldpd_0.7.15.bb     |  65 +++++++++++
>  3 files changed, 197 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/lldpd/files/lldp=
d.default
>  create mode 100644 meta-networking/recipes-connectivity/lldpd/files/lldp=
d.init.d
>  create mode 100644 meta-networking/recipes-connectivity/lldpd/lldpd_0.7.=
15.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/lldpd/files/lldpd.defau=
lt b/meta-networking/recipes-connectivity/lldpd/files/lldpd.default
> new file mode 100644
> index 0000000..3acacfd
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/lldpd/files/lldpd.default
> @@ -0,0 +1,2 @@
> +# Uncomment to start SNMP subagent and enable CDP, SONMP and EDP protocol
> +#DAEMON_ARGS=3D"-x -c -s -e"
> diff --git a/meta-networking/recipes-connectivity/lldpd/files/lldpd.init.=
d b/meta-networking/recipes-connectivity/lldpd/files/lldpd.init.d
> new file mode 100644
> index 0000000..2d88d25
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/lldpd/files/lldpd.init.d
> @@ -0,0 +1,130 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          lldpd
> +# Required-Start:    $remote_fs $network $syslog
> +# Required-Stop:     $network $remote_fs $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: LLDP daemon
> +# Description:       lldpd is a 802.1AB implementation, a L2 network
> +#                    discovery protocol. It also supports CDP, EDP and
> +#                    various other protocols.
> +### END INIT INFO
> +
> +# Do NOT "set -e"
> +
> +log_daemon_msg() {
> +    echo $*
> +}
> +
> +log_end_msg() {
> +    if [ $1 -eq 0 ]; then
> +        success $*
> +    else
> +        failure $*
> +    fi
> +}
> +
> +log_failure_msg() {
> +    echo $*
> +}
> +
> +log_success_msg() {
> +    echo $*
> +}
> +
> +
> +# PATH should only include /usr/* if it runs after the mountnfs.sh script
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +DESC=3D"LLDP daemon"
> +NAME=3Dlldpd
> +DAEMON=3D/usr/sbin/$NAME
> +DAEMON_ARGS=3D""
> +PIDFILE=3D/var/run/$NAME.pid
> +SCRIPTNAME=3D/etc/init.d/$NAME
> +CHROOT=3D/var/run/$NAME
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +# LSB log_* functions
> +. /etc/init.d/functions
> +
> +do_start()
> +{
> +	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --t=
est > /dev/null \
> +		|| return 1
> +	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
> +		$DAEMON_ARGS \
> +		|| return 2
> +}
> +
> +do_stop()
> +{
> +	start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfile $PI=
DFILE --name $NAME
> +	RETVAL=3D"$?"
> +	[ "$RETVAL" =3D 2 ] && return 2
> +	start-stop-daemon --stop --quiet --oknodo --retry=3D0/30/KILL/5 --exec =
$DAEMON
> +	[ "$?" =3D 2 ] && return 2
> +	rm -f $PIDFILE
> +	return "$RETVAL"
> +}
> +
> +do_reload() {
> +	start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $=
NAME
> +	return 0
> +}
> +
> +case "$1" in
> +  start)
> +	[ "$VERBOSE" !=3D no ] && log_daemon_msg "Starting $DESC" "$NAME"
> +	do_start
> +	case "$?" in
> +		0|1) [ "$VERBOSE" !=3D no ] && log_end_msg 0 ;;
> +		2) [ "$VERBOSE" !=3D no ] && log_end_msg 1 ;;
> +	esac
> +	;;
> +  stop)
> +	[ "$VERBOSE" !=3D no ] && log_daemon_msg "Stopping $DESC" "$NAME"
> +	do_stop
> +	case "$?" in
> +		0|1) [ "$VERBOSE" !=3D no ] && log_end_msg 0 ;;
> +		2) [ "$VERBOSE" !=3D no ] && log_end_msg 1 ;;
> +	esac
> +	;;
> +  reload)
> +	log_daemon_msg "Reloading $DESC" "$NAME"
> +	do_reload
> +	log_end_msg $?
> +	;;
> +  restart|force-reload)
> +	log_daemon_msg "Restarting $DESC" "$NAME"
> +	do_stop
> +	case "$?" in
> +	  0|1)
> +		do_start
> +		case "$?" in
> +			0) log_end_msg 0 ;;
> +			1) log_end_msg 1 ;; # Old process is still running
> +			*) log_end_msg 1 ;; # Failed to start
> +		esac
> +		;;
> +	  *)
> +	  	# Failed to stop
> +		log_end_msg 1
> +		;;
> +	esac
> +	;;
> +  status)
> +	status_of_proc $DAEMON $NAME -p $PIDFILE && exit 0 || exit $?
> +	;;
> +  *)
> +	echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload|status=
}" >&2
> +	exit 3
> +	;;
> +esac
> +
> +:
> diff --git a/meta-networking/recipes-connectivity/lldpd/lldpd_0.7.15.bb b=
/meta-networking/recipes-connectivity/lldpd/lldpd_0.7.15.bb
> new file mode 100644
> index 0000000..f68dae3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/lldpd/lldpd_0.7.15.bb
> @@ -0,0 +1,65 @@
> +SUMMARY =3D "A 802.1ab implementation (LLDP) to help you locate neighbor=
s of all your equipments"
> +SECTION =3D "net/misc"
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/ISC;=
md5=3Df3b90e78ea0cffb20bf5cca7947a896d"
> +
> +DEPENDS =3D "libbsd libevent"
> +
> +SRC_URI =3D "\
> +    http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
> +    file://lldpd.init.d \
> +    file://lldpd.default \
> +"
> +
> +SRC_URI[md5sum] =3D "46f7ad97fc1d04084ab11b32fc0ed708"
> +SRC_URI[sha256sum] =3D "c891d6d4480a6a890561ac43d8cc923bd027deb82a3999d6=
5f37d96ca368c246"
> +
> +inherit autotools update-rc.d useradd systemd pkgconfig
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system -g lldpd --shell /bin/false lldpd"
> +GROUPADD_PARAM_${PN} =3D "--system lldpd"
> +
> +EXTRA_OECONF +=3D "--without-embedded-libevent \
> +                 --disable-oldies \
> +                 --with-privsep-user=3Dlldpd \
> +                 --with-privsep-group=3Dlldpd"
> +
> +PACKAGECONFIG ??=3D "cdp fdp edp sonmp lldpmed dot1 dot3"
> +PACKAGECONFIG[json] =3D "--with-json,--without-json,jansson"
> +PACKAGECONFIG[xml] =3D "--with-xml,--without-xml,libxm2"
> +PACKAGECONFIG[snmp] =3D "--with-snmp,--without-snmp,net-snmp"
> +PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
> +PACKAGECONFIG[seccomp] =3D "--with-seccomp,--without-seccomp,libseccomp"
> +PACKAGECONFIG[cdp] =3D "--enable-cdp,--disable-cdp"
> +PACKAGECONFIG[fdp] =3D "--enable-fdp,--disable-fdp"
> +PACKAGECONFIG[edp] =3D "--enable-edp,--disable-edp"
> +PACKAGECONFIG[sonmp] =3D "--enable-sonmp,--disable-sonmp"
> +PACKAGECONFIG[lldpmed] =3D "--enable-lldpmed,--disable-lldpmed"
> +PACKAGECONFIG[dot1] =3D "--enable-dot1,--disable-dot1"
> +PACKAGECONFIG[dot3] =3D "--enable-dot3,--disable-dot3"
> +PACKAGECONFIG[custom] =3D "--enable-custom,--disable-custom"
> +
> +INITSCRIPT_NAME =3D "lldpd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +SYSTEMD_SERVICE_${PN} =3D "lldpd.service"
> +
> +do_install_append() {
> +    install -Dm 0755 ${WORKDIR}/lldpd.init.d ${D}${sysconfdir}/init.d/ll=
dpd
> +    install -Dm 0644 ${WORKDIR}/lldpd.default ${D}${sysconfdir}/default/=
lldpd
> +    # Make an empty configuration file
> +    touch ${D}${sysconfdir}/lldpd.conf
> +}
> +
> +PACKAGES =3D+ "${PN}-bash-completion ${PN}-zsh-completion"
> +
> +FILES_${PN} +=3D "${datadir}/zsh ${libdir}/sysusers.d"
> +RDEPENDS_${PN} +=3D "os-release"
> +
> +FILES_${PN}-bash-completion +=3D "${sysconfdir}/bash_completion.d/"
> +RDEPENDS_${PN}-bash-completion +=3D "bash"
> +
> +FILES_${PN}-zsh-completion +=3D "${datadir}/zsh/vendor-completions/"
> +# FIXME: zsh is broken in meta-oe so this cannot be enabled for now
> +#RDEPENDS_${PN}-zsh-completion +=3D "zsh"
> --=20
> 2.1.4
>=20
--=20
-Joe MacDonald.
:wq

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV+F3GAAoJEEn8ffcsOfaWTUwH/iuHptMaA0Dg+Pcwkjeh6bQy
HjLjrfZGYNz+r1wtkxkwVmIxk+++Pk+vToghENnscmhlLi1dYKmkiobhU4BFafN+
Vn3/SfaarYjE0pVJl9sPMo54y93+Ger86p+RvOzlFY9ZuIfmkw2IeLbTKuPpjjUK
uG37mX1Lb/+c7UrAc0VGBLZsgLwi/2PUMuVnEadZJk1NQ6Uck3i7vWSTdZ62NxGJ
lOLSV54hL3/MZ+1Y3FPx51dSPIiskLw7Ojo7lUOgB0KyoKgP93nzE1u1b4+khXqo
mCZwadoiCchPbI5G8s7xNL48aB6vk5kW60uUS5RCVIFW4fiom86tSAAR6UZi29s=
=zjKZ
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
