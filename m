Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id B5E6D70612
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:15:25 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so4939782wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8M/i5IyzrHMuWcndVAe4Epum/WjeEmxvDp/E9ImaMgk=;
	b=0VIa0dzZHVH3pigNwdlXd5G6vrR55EZWzt3Eur6uoUA+MN2UavBbdgI82HFaFywgkE
	RC0rouWKApp6elARNjxcdLUaquLE3cxsj1/l5+FQh1An6uL3qOFjZxdOkiedG5/JXjO7
	xm8bQRug2kzAtPXe2W+ybJCNHgzuwxKgZKj3cy/i/8jOIpD4oBmEr77qDN3BpQi+BwUw
	qXjC5MNfGGGe4rR80+49jVpr+Pq/4VW5toohgUsBk7se5XuK9FzHExbH1AQVFG2eb9ra
	+MdWDXO5gIvrIAnXcglRlHnY54LDyXa+wzLy812m2zwqGLlIuQWjDplvGIzU+XssTV8T
	ie7A==
X-Received: by 10.180.38.14 with SMTP id c14mr9958462wik.43.1405707323731;
	Fri, 18 Jul 2014 11:15:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	da9sm9256461wib.5.2014.07.18.11.15.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:15:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 20:15:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140718181535.GQ2433@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Fri, 18 Jul 2014 18:15:27 -0000
X-Groupsio-MsgNum: 51088
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HdfuZ4tX+pUSv6/"
Content-Disposition: inline

--+HdfuZ4tX+pUSv6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2014 at 12:37:57AM -0600, Eduardo Silva wrote:
> This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fix=
es
> some problems when switching user when started as root.
>=20
> monkey/yocto: 941ce3a55496d42164164877735db6c8def63265
>=20
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/files/monkey.init         | 34 ++++++++++++++++=
++++++
>  .../recipes-httpd/monkey/files/monkey.service      | 12 ++++++++
>  .../monkey/{monkey_1.5.0.bb =3D> monkey_1.5.1.bb}    | 25 ++++++++++++--=
--
>  3 files changed, 65 insertions(+), 6 deletions(-)
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.init
>  create mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.serv=
ice
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_=
1.5.1.bb} (59%)
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init b/meta=
-webserver/recipes-httpd/monkey/files/monkey.init
> new file mode 100644
> index 0000000..40b2118
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/files/monkey.init
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=3D/usr/bin/monkey
> +NAME=3Dmonkey
> +DESC=3D"Monkey HTTP Server"
> +OPTS=3D"--daemon"
> +
> +case "$1" in
> +  start)
> +	echo -n "Starting $DESC: "
> +	start-stop-daemon --start -x "$DAEMON" -- $OPTS
> +	echo "$NAME."
> +	;;
> +  stop)
> +	echo -n "Stopping $DESC: "
> +	start-stop-daemon --stop -x "$DAEMON"
> +	echo "$NAME."
> +	;;
> +  restart|force-reload)
> +	echo -n "Restarting $DESC: "
> +	start-stop-daemon --stop -x "$DAEMON"
> +	sleep 1
> +	start-stop-daemon --start -x "$DAEMON" -- $OPTS
> +	echo "$NAME."
> +	;;
> +  *)
> +	N=3D/etc/init.d/$NAME
> +	echo "Usage: $N {start|stop|restart|force-reload}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service b/m=
eta-webserver/recipes-httpd/monkey/files/monkey.service
> new file mode 100644
> index 0000000..f9aa57f
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/files/monkey.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DMonkey HTTP Server
> +After=3Dnetwork.target remote-fs.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D/usr/bin/monkey --daemon
> +PIDFile=3D/var/run/monkey.pid.2001
> +TimeoutSec=3D10
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.1.bb
> similarity index 59%
> rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> index 6fa1b77..7d0239e 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> @@ -7,22 +7,24 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44f=
e7014dce33e26468ba93"
> =20
>  SECTION =3D "net"
> =20
> -SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "9123fc371334621fde1c060ab17adcd3"
> -SRC_URI[sha256sum] =3D "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b363=
7bd8bab5b1d098a7"
> +SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
> +           file://monkey.service \
> +           file://monkey.init"
> +
> +SRC_URI[md5sum] =3D "2fe04135728f5c3a86c3a412059e0da3"
> +SRC_URI[sha256sum] =3D "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757=
bfeb72edddf457e7"
> =20
>  EXTRA_OECONF =3D " \
>               --plugdir=3D${libdir}/monkey/ \
>               --logdir=3D${localstatedir}/log/monkey/ \
>               --pidfile=3D${localstatedir}/run/monkey.pid \
>               --default-user=3Dwww-data \
> -             --datadir=3D ${localstatedir}/www/monkey/ \
> +             --datadir=3D${localstatedir}/www/monkey/ \
>               --sysconfdir=3D${sysconfdir}/monkey/ \
>               --enable-plugins=3D* \
>               --disable-plugins=3Dpolarssl \
>               --debug \
> -             --malloc-libc \
> -"
> +             --malloc-libc"
> =20
>  inherit autotools-brokensep pkgconfig update-rc.d systemd
> =20
> @@ -34,3 +36,14 @@ SYSTEMD_SERVICE_${PN} =3D "monkey.service"
>  FILES_${PN} +=3D "${localstatedir}/www/monkey/"
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/monkey/"
> +
> +do_install_append() {
> +
> +    mkdir -p ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monk=
ey
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}=
/system
> +    fi
> +}

Now it failed with:

| NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
| *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ which does no=
t exist
|=20
| opkg-build: Please fix the above errors and try again.

I guess it's because sysvinit script was removed by update-rc.d.bbclass and
then nothing was left in /etc/monkey

> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+HdfuZ4tX+pUSv6/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPJZEcACgkQN1Ujt2V2gBwwVACgp5MzRgUIUtdy77nZpncThbOS
sL0AnRqMNr7T+T1WXYuPMdRhBPNmcqbd
=fItB
-----END PGP SIGNATURE-----

--+HdfuZ4tX+pUSv6/--
