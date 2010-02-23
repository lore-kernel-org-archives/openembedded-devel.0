Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjyTZ-0008OY-2l for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:23:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjyQw-0007lw-6L for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:20:30 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 18:20:30 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 18:20:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Feb 2010 18:20:18 +0100
Message-ID: <hm12oi$dcl$1@dough.gmane.org>
References: <n> <1266942855-10622-1-git-send-email-michael.lippautz@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <1266942855-10622-1-git-send-email-michael.lippautz@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Bump version to 2.90 and clean recipe
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
X-List-Received-Date: Tue, 23 Feb 2010 17:23:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Is the '/lib/udev/gpsd.hotplug.wrapper' script part of the gpsd tarball?

On 23-02-10 17:34, Michael Lippautz wrote:
> * Removed board related stuff from the main gpsd recipe
> * Add udev hotplugging support (seperate package 'gpsd-udev')
> * Modified configuration and initscript in a way that a gps device could
>   either be added by /etc/default/gpsd OR via recipe using the local
>   gpsd socket.
> * gpsd API changed! look at http://gpsd.berlios.de/#news
> ---
>  recipes/gpsd/files/60-gpsd.rules |   47 ++++++++++
>  recipes/gpsd/files/gpsd          |  182 ++++++++++++++++++++++++--------------
>  recipes/gpsd/files/gpsd-default  |    6 +-
>  recipes/gpsd/files/libtool.patch |   14 +++
>  recipes/gpsd/gpsd.inc            |   62 +++++++------
>  recipes/gpsd/gpsd_2.90.bb        |    9 ++
>  6 files changed, 221 insertions(+), 99 deletions(-)
>  create mode 100644 recipes/gpsd/files/60-gpsd.rules
>  create mode 100644 recipes/gpsd/files/libtool.patch
>  create mode 100644 recipes/gpsd/gpsd_2.90.bb
> 
> diff --git a/recipes/gpsd/files/60-gpsd.rules b/recipes/gpsd/files/60-gpsd.rules
> new file mode 100644
> index 0000000..c01db06
> --- /dev/null
> +++ b/recipes/gpsd/files/60-gpsd.rules
> @@ -0,0 +1,47 @@
> +# udev rules for gpsd
> +# $Id$
> +#
> +# GPSes don't have their own USB device class.  They're serial-over-USB
> +# devices, so what you see is actually the ID of the serial-over-USB chip.
> +# Fortunately, just two of these account for over 80% of consumer-grade
> +# GPS sensors.  The gpsd.hotplug.wrapper script will tell a running gpsd
> +# that it should look at the device that just went active, because it
> +# might be a GPS.
> +#
> +# The following setup works on Debian - something similar will apply on 
> +# other distributions:
> +# 
> +#   /etc/udev/gpsd.rules
> +#   /etc/udev/rules.d/025_gpsd.rules -> ../gpsd.rules
> +#   /lib/udev/gpsd.hotplug.wrapper
> +#   /lib/udev/gpsd.hotplug
> +# 
> +# Setting the link in /etc/udev/rules.d activates the rule and determines
> +# when to run it on boot (similar to init.d processing).
> +
> +SUBSYSTEM!="tty", GOTO="gpsd_rules_end"
> +
> +# Prolific Technology, Inc. PL2303 Serial Port
> +ATTR{idVendor}=="067b", ATTR{idProduct}=="2303", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# ATEN International Co., Ltd UC-232A Serial Port [pl2303]
> +ATTR{idVendor}=="0557", ATTR{idProduct}=="2008", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# FTDI 8U232AM
> +ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# Cypress M8/CY7C64013 (DeLorme uses these)
> +ATTR{idVendor}=="1163", ATTR{idProduct}=="0100", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# PS-360 OEM (Microsoft GPS sold with Street and Trips 2005)
> +ATTR{idVendor}=="067b", ATTR{idProduct}=="aaa0", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# Garmin International GPSmap, various models (tested with Garmin GPS 18 USB)
> +ATTR{idVendor}=="091e", ATTR{idProduct}=="0003", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# Cygnal Integrated Products, Inc. CP210x Composite Device (Used by Holux m241)
> +ATTR{idVendor}=="10c4", ATTR{idProduct}=="ea60", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# u-blox AG, u-blox 5 (tested with Navilock NL-402U)
> +ATTR{idVendor}=="1546", ATTR{idProduct}=="01a5", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# FTDI FT232
> +ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +# u-blox 4
> +SYSFS{idVendor}=="1546", SYSFS{idProduct}=="01a4", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +
> +ACTION=="remove", RUN+="/lib/udev/gpsd.hotplug.wrapper"
> +
> +LABEL="gpsd_rules_end"
> diff --git a/recipes/gpsd/files/gpsd b/recipes/gpsd/files/gpsd
> index 91f09c1..fde4285 100755
> --- a/recipes/gpsd/files/gpsd
> +++ b/recipes/gpsd/files/gpsd
> @@ -1,87 +1,135 @@
>  #!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          gpsd
> +# Required-Start:    $remote_fs $network
> +# Should-Start:      bluetooth dbus udev
> +# Required-Stop:     $remote_fs $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: GPS (Global Positioning System) daemon start/stop script
> +# Description:       Start/Stop script for the gpsd service daemon,
> +#                    which is able to monitor one or more GPS devices
> +#                    connected to a host computer, making all data on
> +#                    the location and movements of the sensors available
> +#                    to be queried on TCP port 2947.
> +### END INIT INFO
> +
> +# Author: Bernd Zeimetz <bzed@debian.org>
>  #
> -# gpsd	This shell script starts and stops gpsd.
> -#
> -# chkconfig: 345 90 40
> -# description: Gpsd manages access to a serial- or USB-connected GPS
> -# processname: gpsd
> +# Please remove the "Author" lines above and replace them
> +# with your own name if you copy and modify this script.
>  
> -# Source function library.
> -#. /etc/rc.d/init.d/functions
> +# Do NOT "set -e"
>  
> -RETVAL=0
> -DAEMON=/usr/sbin/gpsd
> -prog="gpsd"
> +# PATH should only include /usr/* if it runs after the mountnfs.sh script
> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> +DESC="GPS (Global Positioning System) daemon"
> +NAME=gpsd
> +DAEMON=/usr/sbin/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +SCRIPTNAME=/etc/init.d/$NAME
>  
> -test -f /etc/default/$prog && . /etc/default/$prog
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
>  
> -start() {
> -	# Start daemons.
> -	echo -n "Starting $prog: "
> -	# We don't use the daemon function here because of a known bug
> -	# in initlog -- it spuriously returns a nonzero status when 
> -	# starting daemons that fork themselves.  See
> -	# http://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=130629
> -	# for discussion.  Fortunately:
> -	#
> -	# 1. gpsd startup can't fail, or at least not in the absence of
> -	# much larger resource-exhaustion problems that would be very obvious.
> -	#
> -	# 2. We don't need all the logging crud that daemon/initlog sets
> -	# up -- gpsd does its own syslog calls.
> -	#
> -	
> -	if test -x /etc/init.d/gps-hardware
> -	then
> -		if ! ( /etc/init.d/gps-hardware status | grep -q "ready" )
> -		then
> -			/etc/init.d/gps-hardware start
> -		fi
> -	fi
> -	
> -	if [ -e "${GPS_DEV}" ]
> -	then
> -	    start-stop-daemon -S -x ${DAEMON} -- ${GPSD_OPTS} ${GPS_DEV}
> -	    echo "success"
> -	else
> -	    # User needs to symlink ${GPS_DEV} to the right thing
> -	    echo "No ${GPS_DEV} GPS device, aborting gpsd startup. Check /etc/default/$prog"
> -	fi
> -	RETVAL=$?
> -	echo
> -	return $RETVAL
> +# Read configuration, if present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +if [ -z "$GPSD_SOCKET" ] && [ -z "$DEVICES" ]; then
> +	GPSD_SOCKET=/var/run/gpsd.sock
> +fi
> +
> +if [ -n "$GPSD_SOCKET" ]; then
> +        GPSD_OPTIONS="$GPSD_OPTIONS -F $GPSD_SOCKET"
> +fi
> +
> +#
> +# Function that starts the daemon/service
> +#
> +do_start()
> +{
> +	# Return
> +	#   0 if daemon has been started
> +	#   1 if daemon was already running
> +	#   2 if daemon could not be started
> +	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --test > /dev/null \
> +		|| return 1
> +	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
> +		$GPSD_OPTIONS -P $PIDFILE $GPS_DEVICES \
> +		|| return 2
>  }
>  
> -stop() {
> -	# Stop daemons.
> -	echo -n "Shutting down $prog: "
> -        start-stop-daemon -K -x ${DAEMON}
> -#        killproc gpsd
> -	RETVAL=$?
> -	echo
> -	return $RETVAL
> +#
> +# Function that stops the daemon/service
> +#
> +do_stop()
> +{
> +	# Return
> +	#   0 if daemon has been stopped
> +	#   1 if daemon was already stopped
> +	#   2 if daemon could not be stopped
> +	#   other if a failure occurred
> +	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
> +	RETVAL="$?"
> +	[ "$RETVAL" = 2 ] && return 2
> +	# Many daemons don't delete their pidfiles when they exit.
> +	rm -f $PIDFILE
> +	return "$RETVAL"
> +}
> +
> +#
> +# Function that sends a SIGHUP to the daemon/service
> +#
> +do_reload() {
> +	#
> +	# If the daemon can reload its configuration without
> +	# restarting (for example, when it is sent a SIGHUP),
> +	# then implement that here.
> +	#
> +	start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $NAME
> +	return 0
>  }
>  
> -# See how we were called.
>  case "$1" in
>    start)
> -	start
> +		echo "Starting $DESC" "$NAME"
> +		do_start
> +		return $?
>  	;;
>    stop)
> -	stop
> -	;;
> -  restart|reload)
> -	stop
> -	start
> -	RETVAL=$?
> +	echo "Stopping $DESC" "$NAME"
> +	do_stop
> +	return $?
>  	;;
>    status)
> -#	status gpsd
> -#	RETVAL=$?
> +       ;;
> +  reload|force-reload)
> +	echo "Reloading $DESC" "$NAME"
> +	do_reload
> +	return $?
> +	;;
> +  restart)
> +	#
> +	# If the "reload" option is implemented then remove the
> +	# 'force-reload' alias
> +	#
> +	echo "Restarting $DESC" "$NAME"
> +	do_stop
> +	case "$?" in
> +	  0|1)
> +		do_start
> +		return $?
> +		;;
> +	  *)
> +	 	# Failed to stop
> +		return 1
> +		;;
> +	esac
>  	;;
>    *)
> -	echo "Usage: $0 {start|stop|restart|status}"
> -	exit 1
> +	echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> +	exit 3
> +	;;
>  esac
>  
> -exit $RETVAL
> +:
> diff --git a/recipes/gpsd/files/gpsd-default b/recipes/gpsd/files/gpsd-default
> index c345edf..0ceff03 100644
> --- a/recipes/gpsd/files/gpsd-default
> +++ b/recipes/gpsd/files/gpsd-default
> @@ -1,3 +1,5 @@
>  # If you must specify a non-NMEA driver, uncomment and modify the next line
> -#GPSD_OPTS=
> -GPS_DEV="/dev/ttyS3"
> +GPSD_SOCKET="/var/run/gpsd.sock"
> +GPSD_OPTIONS="" 
> +GPS_DEVICES=""
> +
> diff --git a/recipes/gpsd/files/libtool.patch b/recipes/gpsd/files/libtool.patch
> new file mode 100644
> index 0000000..37a7557
> --- /dev/null
> +++ b/recipes/gpsd/files/libtool.patch
> @@ -0,0 +1,14 @@
> +--- a/Makefile.am	2010-01-22 21:27:04.000000000 +0100
> ++++ b/Makefile.am	2010-01-22 21:27:43.000000000 +0100
> +@@ -225,9 +225,9 @@
> + # Warning: This overrides autoconf's normal link-line generatyion process
> + if LIBGPSMM_ENABLE
> + libgps_la_SOURCES += libgpsmm.cpp
> +-libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
> ++libgps_la_LINK = $(LIBTOOL) --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
> + else
> +-libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
> ++libgps_la_LINK = $(LIBTOOL) --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
> + endif
> + 
> + nodist_libgps_la_SOURCES = packet_names.h ais_json.i
> diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
> index a917fbe..85bb36b 100644
> --- a/recipes/gpsd/gpsd.inc
> +++ b/recipes/gpsd/gpsd.inc
> @@ -4,20 +4,17 @@ PRIORITY = "optional"
>  LICENSE = "GPL"
>  DEPENDS = "dbus-glib ncurses python"
>  PROVIDES = "virtual/gpsd"
> +INC_PR = "r4"
>  
>  EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
>                  --x-libraries=${STAGING_LIBDIR} \
>                  --enable-dbus \
> -                --enable-python"
> +"
>  
> -SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> +SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
>             file://gpsd-default \
> -           file://gps-hardware \
> -           file://gpsd"
> -
> -SRC_URI_append_om-gta01 = " \
> -           file://restart_gllin.sh \
> -"
> +           file://gpsd \
> +           file://60-gpsd.rules"
>  			   
>  inherit autotools_stage update-rc.d
>  
> @@ -28,6 +25,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  do_compile_prepend() {
>      export BUILD_SYS="${BUILD_SYS}"
>      export HOST_SYS="${HOST_SYS}"
> @@ -40,44 +39,47 @@ do_install_prepend() {
>  }
>  
>  do_install_append() {
> -        install -d ${D}/${sysconfdir}/init.d
> -        install -d ${D}/dev
> -        install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
> -        install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sysconfdir}/init.d/gps-hardware.default
> -        install -d ${D}/${sysconfdir}/default
> -        install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
> -}
> -
> -do_install_append_om-gta01() {
> -	install -d ${D}/${sysconfdir}/apm/resume.d
> -	install -m 755 ${WORKDIR}/restart_gllin.sh ${D}/${sysconfdir}/apm/resume.d
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
> +    install -d ${D}/${sysconfdir}/default
> +    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
> +
> +    #support for udev
> +    install -d ${D}/${sysconfdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
> +    install -d ${D}${base_libdir}/udev/
> +    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
> +    install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
>  }
>  
>  pkg_postinst_${PN}-conf() {
>  	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
> -	update-alternatives --install ${sysconfdir}/init.d/gps-hardware gps-hardware ${sysconfdir}/init.d/gps-hardware.default 10
>  }
>  
>  pkg_postrm_${PN}-conf() {	
> -	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
> -	update-alternatives --remove gps-hardware ${sysconfdir}/init.d/gps-hardware.default		
> +	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
>  }
>  
> -SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
> -
> -PACKAGES =+ "libgps python-pygps gpsd-conf gpsd-gpsctl gps-utils"
> -
> -PACKAGE_ARCH_gpsd-conf = "${MACHINE_ARCH}"
> +PACKAGES =+ "libgps python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
>  
>  RDEPENDS_${PN} = "gpsd-gpsctl"
> -RRECOMMENDS_${PN} = "gpsd-conf"
> +RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
> +
> +DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
> +FILES_gpsd-udev = "${base_libdir}/* ${sysconfdir}/udev/*"
> +RDEPENDS_gpsd-udev += "udev gpsd-conf"
>  
> +DESCRIPTION_libgps = "C service library used for communicating with gpsd"
>  FILES_libgps = "${libdir}/*.so.*"
> +
> +DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts" 
>  FILES_gpsd-conf = "${sysconfdir}"
> +
> +DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
>  FILES_gpsd-gpsctl = "${bindir}/gpsctl"
> -FILES_gps-utils = "${bindir}/*"
>  
> -# might split them up even more fine granular
> +DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
> +FILES_gps-utils = "${bindir}/*"
>  RDEPENDS_gps-utils = "python-pygps"
>  
>  DESCRIPTION_python-pygps = "Python bindings to gpsd"
> diff --git a/recipes/gpsd/gpsd_2.90.bb b/recipes/gpsd/gpsd_2.90.bb
> new file mode 100644
> index 0000000..2131ef7
> --- /dev/null
> +++ b/recipes/gpsd/gpsd_2.90.bb
> @@ -0,0 +1,9 @@
> +require gpsd.inc
> +
> +SRC_URI += "file://libtool.patch;patch=1"
> +SRC_URI[gpsd.md5sum] = "a23c728b8734c542d559c485857238d2"
> +SRC_URI[gpsd.sha256sum] = "8c81461266fc95aae6519ec996d7e4f4801fb5a02dbcc7a5d1c130bf7fe0cd53"
> +
> +PR = "${INC_PR}.0"
> +
> +PARALLEL_MAKE = ""

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLhA5RMkyGM64RGpERAolDAJ9K1Hu9a8+Yc7wFM6/Y8zDqFa4DYwCfd4yL
TU/a/itLFPioF1EM7aYrG+0=
=d9wb
-----END PGP SIGNATURE-----



