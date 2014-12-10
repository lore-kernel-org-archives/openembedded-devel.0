Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE70D725B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 12:35:38 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so4983878wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 04:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pUR9G+kEZIIWeStA2DTXJV2cP4zwZ36VnuZnK8b4M8M=;
	b=sDLWuRYRpaPDyt8cCGrIeZtyWTqAandXLhc10zHxVUHcR+ZYPaK0X7piQDVOFpRZ4L
	9ZOOirELsXUhNc5GUtxYrLi0YhDTh36BqI7wMSpdFonfOAcQDRkfIOu6/0kUeChj2L2r
	/adYnOQ0FHu7Dwtm8mnvBal1vTTo75wXb63T4Po1zL+S0CCYiLfx0klQZFpDkDPUiaRM
	4Y6sL+C98z4zeLV4pNHL9L0JUHFKfl22qNOxK7BbPYW/km8tOzJiTBb08y60I5m+SBE3
	wpSO/Rm2iGM5m7M7f82MjD07LSObTUyAIdvBxgrSHhz/OT1+8lT1qMShGlwtFfyWOovT
	Mz7w==
X-Received: by 10.180.103.40 with SMTP id ft8mr5954091wib.68.1418214937053;
	Wed, 10 Dec 2014 04:35:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u1sm6945959wif.6.2014.12.10.04.35.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 04:35:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Dec 2014 13:35:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141210123539.GC2473@jama>
References: <1418088972-3518-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418088972-3518-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] openct: add new recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 12:35:44 -0000
X-Groupsio-MsgNum: 53264
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2014 at 09:36:12AM +0800, Li xin wrote:
> OpenCT implements drivers for several smart card readers.
> It comes as driver in ifdhandler format for PC/SC-Lite,
> as CT-API driver, or as a small and lean middleware,
> so applications can use it with minimal overhead.
> OpenCT also has a primitive mechanism to export smart card
> readers to remote machines via TCP/IP.

Fails to build because of bashisms in do_install:
http://errors.yoctoproject.org/Errors/Search/Details/6223/1/10/3559

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../openct/etc-openct.udev.in-disablePROGRAM.patch | 31 ++++++++
>  .../openct/etc-openct_usb.in-modify-UDEVINFO.patch | 35 +++++++++
>  meta-oe/recipes-support/openct/openct/openct.init  | 89 ++++++++++++++++=
++++++
>  .../recipes-support/openct/openct/openct.service   | 13 ++++
>  .../recipes-support/openct/openct/openct.sysconfig |  5 ++
>  meta-oe/recipes-support/openct/openct_0.6.20.bb    | 83 ++++++++++++++++=
++++
>  6 files changed, 256 insertions(+)
>  create mode 100644 meta-oe/recipes-support/openct/openct/etc-openct.udev=
=2Ein-disablePROGRAM.patch
>  create mode 100644 meta-oe/recipes-support/openct/openct/etc-openct_usb.=
in-modify-UDEVINFO.patch
>  create mode 100644 meta-oe/recipes-support/openct/openct/openct.init
>  create mode 100644 meta-oe/recipes-support/openct/openct/openct.service
>  create mode 100644 meta-oe/recipes-support/openct/openct/openct.sysconfig
>  create mode 100644 meta-oe/recipes-support/openct/openct_0.6.20.bb
>=20
> diff --git a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-dis=
ablePROGRAM.patch b/meta-oe/recipes-support/openct/openct/etc-openct.udev.i=
n-disablePROGRAM.patch
> new file mode 100644
> index 0000000..745f923
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePRO=
GRAM.patch
> @@ -0,0 +1,31 @@
> +From e0d3e0bb1e38ff851696a7d8826e651d364ad8ce Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 5 Dec 2014 02:00:57 +0900
> +Subject: [PATCH 1/2] etc/openct.udev.in: disablePROGRAM
> +
> +Bug fix: https://bugzilla.redhat.com/show_bug.cgi?id=3D287871
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + etc/openct.udev.in | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/etc/openct.udev.in b/etc/openct.udev.in
> +index d11d0e1..48083c9 100644
> +--- a/etc/openct.udev.in
> ++++ b/etc/openct.udev.in
> +@@ -22,7 +22,8 @@ ACTION!=3D"add", GOTO=3D"openct_usb_rules_end"
> + # 2010-01-06 removed, as latest udev doesn't know WAIT_FOR_ATTR any mor=
e.
> +=20
> + # sleep for 100ms - the wait_for_sysfs might not be enough
> +-PROGRAM=3D"/bin/sleep 0.1"
> ++# Disabled in this package - see https://bugzilla.redhat.com/287871
> ++# PROGRAM=3D"/bin/sleep 0.1"
> +=20
> + # ccid
> + ATTR{bInterfaceClass}=3D=3D"0b", ATTR{bInterfaceSubClass}=3D=3D"00", AT=
TR{bInterfaceProtocol}=3D=3D"00", ATTRS{idVendor}=3D=3D"?*"  RUN+=3D"@udevd=
ir@/openct_usb /dev/$parent"
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modi=
fy-UDEVINFO.patch b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in=
-modify-UDEVINFO.patch
> new file mode 100644
> index 0000000..d5e3fe5
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEV=
INFO.patch
> @@ -0,0 +1,35 @@
> +From d93985a137b553b2723235d03bda341dab14064f Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 5 Dec 2014 02:04:03 +0900
> +Subject: [PATCH 2/2] etc/openct_usb.in: modify UDEVINFO
> +
> +this patch is from Fedora
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + etc/openct_usb.in | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/etc/openct_usb.in b/etc/openct_usb.in
> +index 32f91aa..917467d 100644
> +--- a/etc/openct_usb.in
> ++++ b/etc/openct_usb.in
> +@@ -15,10 +15,10 @@ if [ -z "$DEVNAME" ]; then
> + 	# Guess udev info interface.
> + 	# Newer udev uses udevadm
> + 	#
> +-	if which udevinfo > /dev/null 2>&1; then
> +-		UDEVINFO=3D"udevinfo"
> +-	else
> ++	if which udevadm > /dev/null 2>&1; then
> + 		UDEVINFO=3D"udevadm info"
> ++	else
> ++		UDEVINFO=3D"udevinfo"
> + 	fi
> + 	DEVNAME=3D/dev/$($UDEVINFO --query=3Dname --path=3D$(dirname $DEVPATH))
> + fi
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/openct/openct/openct.init b/meta-oe/=
recipes-support/openct/openct/openct.init
> new file mode 100644
> index 0000000..c689609
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct/openct.init
> @@ -0,0 +1,89 @@
> +#!/bin/sh
> +#
> +# openct       This shell script takes care of starting and stopping Ope=
nCT.
> +#
> +# chkconfig:   2345 24 89
> +# description: OpenCT is a middleware framework for smart card terminals.
> +#
> +# processname: ifdhandler
> +# config:      /etc/openct.conf
> +
> +### BEGIN INIT INFO
> +# Provides: openct
> +# Default-Start: 2 3 4 5
> +# Default-Stop: 0 1 6
> +# Should-Start: $syslog $network
> +# Should-Stop: $syslog $network
> +# Short-Description: Middleware framework for smart card terminals
> +# Description: This starts/stops the OpenCT middleware framework support
> +#              for smart card terminals.
> +### END INIT INFO
> +
> +. /etc/init.d/functions
> +
> +exec=3D"/usr/sbin/openct-control"
> +prog=3Dopenct
> +proc=3Difdhandler
> +
> +OPENCT_OPTIONS=3D
> +[ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
> +
> +lockfile=3D/var/lock/subsys/$prog
> +
> +start() {
> +    retval=3D0
> +    if ! status $proc >/dev/null 2>&1 ; then
> +        action $"Initializing OpenCT smart card terminals: " \
> +            $exec $OPENCT_OPTIONS init
> +        retval=3D$?
> +        [ $retval -eq 0 ] && touch $lockfile
> +    fi
> +    return $retval
> +}
> +
> +stop() {
> +    if status $proc >/dev/null 2>&1 ; then
> +        action $"Stopping OpenCT smart card terminals: " \
> +            $exec $OPENCT_OPTIONS shutdown
> +    fi
> +    retval=3D$?
> +    if [ $retval -eq 0 ] ; then
> +        rm -f /var/run/openct/status
> +        rm -f $lockfile
> +    fi
> +    return $retval
> +}
> +
> +restart() {
> +    stop
> +    start
> +}
> +
> +oct_status() {
> +    status $proc
> +    retval=3D$?
> +    if [ -e /var/run/openct/status ] ; then
> +        $exec $OPENCT_OPTIONS status
> +        [ -e /var/run/openct/status ] && \
> +            echo $"Waiting for reader attach/detach events..."
> +    fi
> +    return $retval
> +}
> +
> +case "$1" in
> +    start|stop|restart)
> +        $1
> +        ;;
> +    reload|force-reload)
> +        restart
> +        ;;
> +    status)
> +        oct_status
> +        ;;
> +    try-restart|condrestart)
> +  	[ ! -f $lockfile ] || restart
> +	;;
> +    *)
> +        echo $"Usage: $0 {start|stop|status|restart|try-restart|reload|f=
orce-reload}"
> +        exit 2
> +esac
> diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-=
oe/recipes-support/openct/openct/openct.service
> new file mode 100644
> index 0000000..c9ec497
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct/openct.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DOpenct Middleware framework for smart card terminals
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +EnvironmentFile=3D-/etc/sysconfig/openct
> +ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init=20
> +ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
> +RemainAfterExit=3Dyes
> +KillMode=3Dnone
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-support/openct/openct/openct.sysconfig b/met=
a-oe/recipes-support/openct/openct/openct.sysconfig
> new file mode 100644
> index 0000000..ffc2707
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct/openct.sysconfig
> @@ -0,0 +1,5 @@
> +#                                                                    -*-=
 sh -*-
> +# Extra options to pass to openct-control.
> +# Consult "/usr/sbin/openct-control -h" for available options.
> +#
> +OPENCT_OPTIONS=3D""
> diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/re=
cipes-support/openct/openct_0.6.20.bb
> new file mode 100644
> index 0000000..29c2419
> --- /dev/null
> +++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> @@ -0,0 +1,83 @@
> +Summanry =3D "Middleware framework for smart card terminals"
> +DESCRIPTION =3D "OpenCT implements drivers for several smart card reader=
s. \
> +It comes as driver in ifdhandler format for PC/SC-Lite, \
> +as CT-API driver, or as a small and lean middleware, \
> +so applications can use it with minimal overhead. \
> +OpenCT also has a primitive mechanism to export smart card \
> +readers to remote machines via TCP/IP."
> +
> +DEPENDS +=3D "libtool pcsc-lite libusb-compat"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/o/${PN}/${PN}_${PV}.orig.tar.gz \
> +    file://etc-openct.udev.in-disablePROGRAM.patch \
> +    file://etc-openct_usb.in-modify-UDEVINFO.patch \
> +    file://openct.init \
> +    file://openct.sysconfig \
> +    file://openct.service"
> +
> +SRC_URI[md5sum] =3D "a1da3358ab798f1cb9232f1dbababc21"
> +SRC_URI[sha256sum] =3D "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a=
86c01c805d181a68"
> +
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f17206a5=
b0a1"
> +
> +inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','syste=
md','', d)}
> +SYSTEMD_SERVICE_${PN} +=3D "openct.service "
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +EXTRA_OECONF=3D" \
> +    --disable-static \
> +    --enable-usb \
> +    --enable-pcsc \
> +    --enable-doc \
> +    --enable-api-doc \
> +    --with-udev=3D/lib/udev \
> +    --with-bundle=3D${libdir}/pcsc/drivers \
> +"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN} +=3D " \
> +    ${libdir}/ctapi \
> +    /lib/udev \
> +    ${libdir}/openct-ifd.so \
> +    ${libdir}/pcsc \
> +    /run/openct/status \
> +"
> +
> +FILES_${PN}-dbg +=3D " \
> +    ${libdir}/ctapi/.debug \
> +    ${libdir}/pcsc/drivers/openct-ifd.bundle/Contents/Linux/.debug \
> +"
> +
> +INSANE_SKIP_${PN} +=3D "dev-deps"
> +
> +do_install () {
> +    rm -rf ${D}
> +    install -d ${D}/etc
> +    install -dm 755 ${D}/lib/udev
> +    # fix up hardcoded paths
> +    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
> +        ${WORKDIR}/openct.service ${WORKDIR}/openct.init
> +    oe_runmake install DESTDIR=3D${D}
> +    install -dm 755 ${D}${libdir}/ctapi
> +    mv ${D}${libdir}/{libopenctapi.so,ctapi}
> +    install -Dpm 644 etc/openct.udev ${D}/etc/udev/rules.d/60-openct.rul=
es
> +    install -pm 644 etc/openct.conf ${D}/etc/openct.conf
> +    install -Dpm 755 ${WORKDIR}/openct.init ${D}/etc/init.d/openct
> +    install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}/etc/sysconfig/open=
ct
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}/${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}=
/system
> +    fi
> +    so=3D$(find ${D} -name \*.so | sed "s|^${D}||")
> +    sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
> +    install -Dpm 644 etc/reader.conf ${D}/etc/reader.conf.d/openct.conf
> +    install -dm 755 ${D}${localstatedir}/run/openct
> +    touch ${D}${localstatedir}/run/openct/status
> +    chmod 644 ${D}${localstatedir}/run/openct/status
> +}
> +
> +pkg_postinst_${PN} () {
> +    ln -sf ctapi/libopenctapi.so ${libdir}/libopenctapi.so
> +}
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSIPhsACgkQN1Ujt2V2gBzJjwCfXbQJlXo39gajPlk1INKQoKwk
uqYAn33qW7fQN1mu4ki7DyY7Py2JQFG0
=FP5w
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
