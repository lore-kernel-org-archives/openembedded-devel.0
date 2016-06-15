Return-Path: <koen@dominion.thruhere.net>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8315060124
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 18:19:32 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l188so3068132lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=DmgjqL0LpQtd3Urqp3QL+rv2izkilYe0z9kUGc6FcL4=;
	b=I8P1H/1UNtbtuuxDH/UTcbU62/c+MHJOA+O80Mbo6s5cW8HHvLF7n6CaVBnHqLPrM6
	qN5EWinOL4x6T+GR9UsOQLpS9uXZpr6vdo/RJO+KW1LJR+t8oRLnlbVwnf0Eum+KVKP4
	rX8UjU/j0/UaNb8qJsG4H4ezppi27OoSJhwl2hciSECYhc/GT5m1yF/t87kNu/A5CbOG
	H/dOJU00GaLNEnD6cRPM1wWqqFdq4iAd8q/dOcJqAenChlU+wB2VeDCVrX0gvMtqPDiA
	8h5aMt9eUzxR8YFX8RGO3t1VyAPdvJNxKvma9Bl0PEw8emz1DY8UejxvCO1YdU2+YCfu
	T8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=DmgjqL0LpQtd3Urqp3QL+rv2izkilYe0z9kUGc6FcL4=;
	b=dLjsf7TwtIOaVHw56AYZ/igR9y7yVI8nJscJVIBgOimREvPNAolbVHA+CraG8bAMBZ
	hxlN8wRAPUlGzQvSqiADW/6PZrCY37QWpVNMor70tLbFURq0SMOwtk+6WWRZfQpB7oGb
	ev9viHQXVgNo74aNgk53lyStT+kHa7mr/3nwZJkV7uJjRW17cAF/+9mqgWRITColqhpc
	k5xLVjDBkOAdDeD4sPeAoGQZ59mZV4Ku/LkHrIn/XAVboHa7NzWfjZroft1RTyM6sFjA
	woPXAuDohBgxbKwHfIKtwTDXCr9Rq9kg/zGiga16xkfX0fHiQpwJpni8ebGjWEYDamcw
	/D9g==
X-Gm-Message-State: ALyK8tIIsypTA+H6rgTb37bPdgsC29fPOAtVyzNe3PFu6g/1jpITKum6/BrYlcm/q9SiBQ==
X-Received: by 10.28.173.66 with SMTP id w63mr661163wme.14.1466014772184;
	Wed, 15 Jun 2016 11:19:32 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id b77sm3775686wme.0.2016.06.15.11.19.31
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 11:19:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1466014647-56745-2-git-send-email-henry@kittyhawk.aero>
Date: Wed, 15 Jun 2016 20:19:37 +0200
Message-Id: <D7CB1F34-87BD-4830-8721-3D25FDA77E3A@dominion.thruhere.net>
References: <D56F5A73-035E-4C81-9CEE-F23311639B42@dominion.thruhere.net>
	<1466014647-56745-1-git-send-email-henry@kittyhawk.aero>
	<1466014647-56745-2-git-send-email-henry@kittyhawk.aero>
To: Henry Hallam <henry@kittyhawk.aero>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCHv3] chrony: Versatile implementation of NTP
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 18:19:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 15 jun. 2016, om 20:17 heeft Henry Hallam <henry@kittyhawk.aero> =
het volgende geschreven:
>=20
> From: Henry Hallam <henry@pericynthion.org>
>=20
> chrony is an alternative to ntpd.  In particular it may be useful
> for quasi-realtime embedded systems that have a pulse-per-second
> time reference available and need to rapidly synchronize to it after
> boot, which appears to be unachievable with ntpd.
>=20
> Signed-off-by: Henry Hallam <henry@pericynthion.org>

Reviewed-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> .../recipes-support/chrony/chrony/chrony.conf      |  44 +++++++
> .../recipes-support/chrony/chrony/chronyd          |  58 ++++++++++
> .../recipes-support/chrony/chrony_2.4.bb           | 127 =
+++++++++++++++++++++
> 3 files changed, 229 insertions(+)
> create mode 100644 =
meta-networking/recipes-support/chrony/chrony/chrony.conf
> create mode 100644 =
meta-networking/recipes-support/chrony/chrony/chronyd
> create mode 100644 =
meta-networking/recipes-support/chrony/chrony_2.4.bb
>=20
> diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf =
b/meta-networking/recipes-support/chrony/chrony/chrony.conf
> new file mode 100644
> index 0000000..8d226d3
> --- /dev/null
> +++ b/meta-networking/recipes-support/chrony/chrony/chrony.conf
> @@ -0,0 +1,44 @@
> +# Use public NTP servers from the pool.ntp.org project.
> +# Please consider joining the pool project if possible by running =
your own
> +# server(s).
> +# If you are a vendor distributing a product using chrony, you *MUST*
> +# read and comply with http://www.pool.ntp.org/vendors.html
> +pool 0.openembedded.pool.ntp.org iburst
> +
> +# Use a local timeserver in preference to the pool, if it's =
reachable.
> +#server 192.168.22.22 iburst minpoll 2 prefer
> +
> +# Sync to pulse-per-second from an onboard GPS.
> +#refclock PPS /dev/pps0 poll 0 prefer
> +# You'll want to enable CONFIG_PPS and CONFIG_PPS_CLIENT_GPIO in your =
kernel,
> +# and an entry something like this in your device tree:
> +#	pps {
> +#		compatible =3D "pps-gpio";
> +#		gpios =3D <&ps7_gpio_0 56 0>;
> +#	};
> +
> +# In first three updates step the system clock instead of slew
> +# if the adjustment is larger than 1 second.
> +makestep 1.0 3
> +
> +# Record the rate at which the system clock gains/loses time,
> +# improving accuracy after reboot
> +driftfile /var/lib/chrony/drift
> +
> +# Enable kernel synchronization of the hardware real-time clock =
(RTC).
> +rtcsync
> +
> +# Allow NTP client access from local network.
> +#allow 192.168/16
> +
> +# Serve time even if not synchronized to any NTP server.
> +#local stratum 10
> +
> +# Specify file containing keys for NTP authentication.
> +#keyfile /etc/chrony.keys
> +
> +# Specify directory for log files.
> +logdir /var/log/chrony
> +
> +# Select which information is logged.
> +#log measurements statistics tracking
> diff --git a/meta-networking/recipes-support/chrony/chrony/chronyd =
b/meta-networking/recipes-support/chrony/chrony/chronyd
> new file mode 100644
> index 0000000..04f1b68
> --- /dev/null
> +++ b/meta-networking/recipes-support/chrony/chrony/chronyd
> @@ -0,0 +1,58 @@
> +#! /bin/sh
> +
> +# System V init script for chrony
> +# Adapted from the script already in meta-networking for ntpd
> +
> +### BEGIN INIT INFO
> +# Provides:        chrony
> +# Required-Start:  $network $remote_fs $syslog
> +# Required-Stop:   $network $remote_fs $syslog
> +# Default-Start:   2 3 4 5
> +# Default-Stop:
> +# Short-Description: Start chrony time daemon
> +### END INIT INFO
> +
> +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin
> +
> +DAEMON=3D/usr/sbin/chronyd
> +PIDFILE=3D/var/run/chronyd.pid
> +
> +test -x $DAEMON -a -r /etc/chrony.conf || exit 0
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +# Functions to do individual actions
> +startdaemon(){
> +	echo -n "Starting chronyd: "
> +	start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE =
--startas $DAEMON -- "$@"
> +	echo "done"
> +}
> +stopdaemon(){
> +	echo -n "Stopping chronyd: "
> +	start-stop-daemon --stop --quiet --oknodo -p $PIDFILE
> +	echo "done"
> +}
> +
> +case "$1" in
> +  start)
> +	startdaemon
> +	;;
> +  stop)
> +  	stopdaemon
> +	;;
> +  force-reload | restart | reload)
> +  	stopdaemon
> +	startdaemon
> +	;;
> +  status)
> +	status /usr/sbin/chronyd;
> +	exit $?
> +	;;
> +  *)
> +	echo "Usage: chronyd { start | stop | status | restart | reload =
}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb =
b/meta-networking/recipes-support/chrony/chrony_2.4.bb
> new file mode 100644
> index 0000000..aa37caa
> --- /dev/null
> +++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
> @@ -0,0 +1,127 @@
> +SUMMARY =3D "Versatile implementation of the Network Time Protocol"
> +DESCRIPTION =3D "Chrony can synchronize the system clock with NTP \
> +servers, reference clocks (e.g. GPS receiver), and manual input using =
\
> +wristwatch and keyboard. It can also operate as an NTPv4 (RFC 5905) \
> +server and peer to provide a time service to other computers in the \
> +network. \
> +\
> +It is designed to perform well in a wide range of conditions, \
> +including intermittent network connections, heavily congested \
> +networks, changing temperatures (ordinary computer clocks are \
> +sensitive to temperature), and systems that do not run continuously, =
or \
> +run on a virtual machine. \
> +\
> +Typical accuracy between two machines on a LAN is in tens, or a few \
> +hundreds, of microseconds; over the Internet, accuracy is typically \
> +within a few milliseconds. With a good hardware reference clock \
> +sub-microsecond accuracy is possible. \
> +\
> +Two programs are included in chrony: chronyd is a daemon that can be =
\
> +started at boot time and chronyc is a command-line interface program =
\
> +which can be used to monitor chronyd's performance and to change \
> +various operating parameters whilst it is running. \
> +\
> +This recipe produces two binary packages: 'chrony' which contains =
chronyd, \
> +the configuration file and the init script, and 'chronyc' which =
contains \
> +the client program only."
> +
> +HOMEPAGE =3D "http://chrony.tuxfamily.org/"
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI =3D =
"https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
> +	   file://chrony.conf \
> +	   file://chronyd"
> +SRC_URI[md5sum] =3D "d0598aa8a9be8faccef9386f6fc0d5f2"
> +SRC_URI[sha256sum] =3D =
"8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
> +
> +DEPENDS =3D "pps-tools"
> +
> +# Note: Despite being built via './configure; make; make install',
> +#       chrony does not use GNU Autotools.
> +inherit update-rc.d systemd
> +
> +# Configuration options:
> +# - For command line editing support in chronyc, you may specify =
either
> +#   'editline' or 'readline' but not both.  editline is smaller, but
> +#   many systems already have readline for other purposes so you =
might want
> +#   to choose that instead.  However, beware license incompatibility
> +#   since chrony is GPLv2 and readline versions after 6.0 are GPLv3+.
> +#   You can of course choose neither, but if you're that tight on =
space
> +#   consider dropping chronyc entirely (you can use it remotely with
> +#   appropriate chrony.conf options).
> +# - Security-related:
> +#   - 'sechash' is omitted by default because it pulls in nss which =
is huge.
> +#   - 'privdrop' allows chronyd to run as non-root; would need =
changes to
> +#     chrony.conf and init script.
> +#   - 'scfilter' enables support for system call filtering, but =
requires the
> +#     kernel to have CONFIG_SECCOMP enabled.
> +PACKAGECONFIG ??=3D "editline scfilter"
> +PACKAGECONFIG[readline] =3D =
"--without-editline,--without-readline,readline"
> +PACKAGECONFIG[editline] =3D ",--without-editline,libedit"
> +PACKAGECONFIG[sechash] =3D "--without-tomcrypt,--disable-sechash,nss"
> +PACKAGECONFIG[privdrop] =3D ",--disable-privdrop,libcap"
> +PACKAGECONFIG[scfilter] =3D "--enable-scfilter,--without-seccomp"
> +
> +# --disable-static isn't supported by chrony's configure script.
> +DISABLE_STATIC =3D ""
> +
> +do_configure() {
> +    ./configure --sysconfdir=3D${sysconfdir} --bindir=3D${bindir} =
--sbindir=3D${sbindir} \
> +                --localstatedir=3D${localstatedir} =
--datarootdir=3D${datadir} \
> +                ${EXTRA_OECONF}
> +}
> +
> +do_install() {
> +    # Binaries
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/chronyc ${D}${bindir}
> +    install -d ${D}${sbindir}
> +    install -m 0755 ${S}/chronyd ${D}${sbindir}
> +
> +    # Config file
> +    install -d ${D}${sysconfdir}
> +    install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
> +
> +    # System V init script
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
> +   =20
> +    # systemd unit configuration file
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${S}/examples/chronyd.service =
${D}${systemd_unitdir}/system/
> +   =20
> +    # Variable data (for drift and/or rtc file)
> +    install -d ${D}${localstatedir}/lib/chrony
> +
> +    # Log files
> +    install -d ${D}${localstatedir}/log/chrony
> +
> +    # Fix hard-coded paths in config files and init scripts
> +    sed -i -e 's!/var/!${localstatedir}/!g' -e =
's!/etc/!${sysconfdir}/!g' \
> +           -e 's!/usr/sbin/!${sbindir}/!g' -e =
's!/usr/bin/!${bindir}/!g' \
> +           ${D}${sysconfdir}/chrony.conf \
> +           ${D}${sysconfdir}/init.d/chronyd \
> +           ${D}${systemd_unitdir}/system/chronyd.service
> +    sed -i =
's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'=
 ${D}${sysconfdir}/init.d/chronyd
> +    sed -i =
's!^EnvironmentFile=3D.*!EnvironmentFile=3D-${sysconfdir}/default/chronyd!=
' ${D}${systemd_unitdir}/system/chronyd.service
> +}
> +
> +FILES_${PN} =3D "${sbindir}/chronyd ${sysconfdir} ${localstatedir}"
> +CONFFILES_${PN} =3D "${sysconfdir}/chrony.conf"
> +INITSCRIPT_NAME =3D "chronyd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "chronyd.service"
> +
> +# It's probably a bad idea to run chrony and another time daemon on
> +# the same system.  systemd includes the SNTP client 'timesyncd', =
which
> +# will be disabled by chronyd.service, however it will remain on the =
rootfs
> +# wasting 150 kB unless you put 'PACKAGECONFIG_remove_pn-systemd =3D =
"timesyncd"'
> +# in a conf file or bbappend somewhere.
> +RCONFLICTS_${PN} =3D "ntp ntimed"
> +
> +# Separate the client program into its own package
> +PACKAGES =3D+ "chronyc"
> +FILES_chronyc =3D "${bindir}/chronyc"
> --=20
> 2.8.1
>=20


