Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0D0A60762
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 17:32:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n184so197034wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kqsNfsu4XjBzQKbOt+RtvAXO5tINzN32OSjWMwhpooA=;
	b=RI/wpQwcAvfP2orVHecUv3G+U2SSGwLfCtozq7pYOvWNvNUfE6Tmv9bTcY8ggsHf4u
	p53Q4ugSV8buiEa/W9LarPN6Mv+esaJM2M0YbrXal254NM4rfFhAuVASueMatZU5kgJU
	sQQATV+CIFDkto8z0C2QczuDzpDsfvXbcyVJQgJQUXfbKrFBXMJuAjC8SKA5tF2WWBB4
	oC7ZsYvU+7J6Uce6eHDF4y9FDXE6F92cLfMnqdeR4LI1dJEg8pUFdaNFUYyoUATz7wxl
	eyf342Xf+93JX1+qAg7IF1MK4YsADnMkVSmyqVol9qUUzlgHVSuYgHkk88pVIowzXWUB
	lw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kqsNfsu4XjBzQKbOt+RtvAXO5tINzN32OSjWMwhpooA=;
	b=DGUURgTowEYxUcOZyfv/kBtO1LvLLVOD99LcZ4vDhC2KM024wKfYWgTDKUbp/rEa/J
	QGidnTc1om45x42RGuiy1BBdO1lnKhrMSkwPOWw2p/Osvuc6d6SOV4losLatYSJhAwAN
	ZWMHwTJYBi1r18S0VMI0TuY9tlR2PBLOVM9NW9FXSgJwxEYL9ZHTQWky8tAEfKZXAeoD
	eTueR90p/CzGXcDYh6gn+L8KyqR1K6iGtlnz1GsV91lqpvWDxHWiHBopAsovWXdpQHNG
	FIaCHVtyrroumyBzgC+YcRpJc6mKtZl377wbzsehidah8exTAfDsw/TolH1WMNotpp48
	2XJA==
X-Gm-Message-State: ALyK8tLsvPxiDBvdrHg556iFVq3wkomzg86yVaX/0dYE5uAj4LpmFOB0PrR3damsl/W79A==
X-Received: by 10.194.123.170 with SMTP id mb10mr7338596wjb.39.1465925575299; 
	Tue, 14 Jun 2016 10:32:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y6sm5191656wmy.8.2016.06.14.10.32.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Jun 2016 10:32:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Jun 2016 19:33:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160614173311.GB21667@jama>
References: <1465499198-340-1-git-send-email-henry@pericynthion.org>
MIME-Version: 1.0
In-Reply-To: <1465499198-340-1-git-send-email-henry@pericynthion.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Tue, 14 Jun 2016 17:32:56 -0000
X-Groupsio-MsgNum: 61822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 12:06:38PM -0700, Henry Hallam wrote:
> chrony is an alternative to ntpd.  In particular it may be useful
> for quasi-realtime embedded systems that have a pulse-per-second
> time reference available and need to rapidly synchronize to it after
> boot, which appears to be unachievable with ntpd.
>=20
> Signed-off-by: Henry Hallam <henry@pericynthion.org>
> ---
>  .../recipes-support/chrony/chrony/chrony.conf      | 40 +++++++++++
>  .../recipes-support/chrony/chrony/chronyd          | 58 +++++++++++++++
>  .../recipes-support/chrony/chrony_2.4.bb           | 83 ++++++++++++++++=
++++++

Autodetects some dependencies:

WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on nss,
but it isn't a build dependency, missing nss in DEPENDS or
PACKAGECONFIG? [build-deps]
WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on
libedit, but it isn't a build dependency, missing libedit in DEPENDS or
PACKAGECONFIG? [build-deps]

>  3 files changed, 181 insertions(+)
>  create mode 100644 meta-networking/recipes-support/chrony/chrony/chrony.=
conf
>  create mode 100644 meta-networking/recipes-support/chrony/chrony/chronyd
>  create mode 100644 meta-networking/recipes-support/chrony/chrony_2.4.bb
>=20
> diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf b/=
meta-networking/recipes-support/chrony/chrony/chrony.conf
> new file mode 100644
> index 0000000..435a4f9
> --- /dev/null
> +++ b/meta-networking/recipes-support/chrony/chrony/chrony.conf
> @@ -0,0 +1,40 @@
> +# Use public NTP servers from the pool.ntp.org project.
> +pool pool.ntp.org iburst
> +
> +# Use a local timeserver in preference to the pool, if it's reachable.
> +#server 192.168.22.22 iburst minpoll 2 prefer
> +
> +# Sync to pulse-per-second from an onboard GPS.
> +# refclock PPS /dev/pps0 poll 0 prefer
> +# You'll want to enable CONFIG_PPS and CONFIG_PPS_CLIENT_GPIO in your ke=
rnel,
> +# and an entry something like this in your device tree:
> +#	pps {
> +#		compatible =3D "pps-gpio";
> +#		gpios =3D <&ps7_gpio_0 56 0>;
> +#	};
> +
> +# Record the rate at which the system clock gains/loses time,
> +# improving accuracy after reboot
> +driftfile /var/lib/chrony.drift
> +
> +# In first three updates step the system clock instead of slew
> +# if the adjustment is larger than 1 second.
> +makestep 1.0 3
> +
> +# Enable kernel synchronization of the real-time clock (RTC).
> +#rtcsync
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
> diff --git a/meta-networking/recipes-support/chrony/chrony/chronyd b/meta=
-networking/recipes-support/chrony/chrony/chronyd
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
> +	start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --startas=
 $DAEMON -- "$@"
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
> +	echo "Usage: chronyd { start | stop | status | restart | reload }" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-=
networking/recipes-support/chrony/chrony_2.4.bb
> new file mode 100644
> index 0000000..2b6ae5b
> --- /dev/null
> +++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
> @@ -0,0 +1,83 @@
> +SUMMARY =3D "Versatile implementation of the Network Time Protocol"
> +DESCRIPTION =3D "Chrony can synchronize the system clock with NTP \
> +servers, reference clocks (e.g. GPS receiver), and manual input using \
> +wristwatch and keyboard. It can also operate as an NTPv4 (RFC 5905) \
> +server and peer to provide a time service to other computers in the \
> +network. \
> +\
> +It is designed to perform well in a wide range of conditions, \
> +including intermittent network connections, heavily congested \
> +networks, changing temperatures (ordinary computer clocks are \
> +sensitive to temperature), and systems that do not run continuosly, or \
> +run on a virtual machine. \
> +\
> +Typical accuracy between two machines on a LAN is in tens, or a few \
> +hundreds, of microseconds; over the Internet, accuracy is typically \
> +within a few milliseconds. With a good hardware reference clock \
> +sub-microsecond accuracy is possible. \
> +\
> +Two programs are included in chrony: chronyd is a daemon that can be \
> +started at boot time and chronyc is a command-line interface program \
> +which can be used to monitor chronyd's performance and to change \
> +various operating parameters whilst it is running."
> +
> +HOMEPAGE =3D "http://chrony.tuxfamily.org/"
> +SECTION =3D "net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "libcap readline"
> +# It's probably a bad idea to run chrony and ntpd on the same system.
> +RCONFLICTS_${PN} =3D "ntp"
> +
> +SRC_URI =3D "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
> +	   file://chrony.conf \
> +	   file://chronyd"
> +
> +SRC_URI[md5sum] =3D "d0598aa8a9be8faccef9386f6fc0d5f2"
> +SRC_URI[sha256sum] =3D "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d=
7ee4e7ae8af6391f"
> +
> +# Note: chrony does not use autotools, although it is built via './confi=
gure; make; make install'.
> +inherit update-rc.d systemd
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/chrony.conf"
> +
> +INITSCRIPT_NAME =3D "chronyd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "chronyd.service"
> +
> +do_configure() {
> +	./configure --sysconfdir=3D${sysconfdir} --bindir=3D${bindir} --sbindir=
=3D${sbindir} --localstatedir=3D${localstatedir} --datarootdir=3D${datadir}
> +}
> +
> +do_compile() {
> +	make ${PARALLEL_MAKE}
> +}
> +
> +do_install() {
> +	# binaries
> +        install -d ${D}${bindir}
> +        install -m 0755 ${S}/chronyc ${D}${bindir}
> +        install -d ${D}${sbindir}
> +        install -m 0755 ${S}/chronyd ${D}${sbindir}
> +
> +        # config files
> +        install -d ${D}${sysconfdir}
> +	install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
> +
> +	# System V init scripts
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
> +=09
> +	# systemd unit
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/sy=
stem/
> +=09
> +        # variable data (for drift file)
> +        install -d ${D}${localstatedir}/lib/chrony
> +
> +        # log files
> +        install -d ${D}${localstatedir}/log/chrony
> +}
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldgP9UACgkQN1Ujt2V2gBxYoQCdEmoCy0Fi6ZJbmz+xOPAv40d0
oIAAoKnWSJbTSNqkH3p0mbX8FgyUqiJ1
=5LEg
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
