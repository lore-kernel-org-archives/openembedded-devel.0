Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5338976FD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 16:00:03 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so52411292wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cv5Z7XiPn0dw67WJ75bWuClZ72tFNCXdLihBYyQoMCI=;
	b=pjAzlV+0i18sA2tJbOLgxVjiT3h0D9R6/QPhOnLZ8W7SOaOMQ4wTjpuFftwU+9/sk0
	lFuCYtHvzm4G4lbZpi+AE1QfqaLxRSQlP/YoY5yR4l0ODALYuMOEdBk9OeySLxRSzYBr
	9bosaLyAsHy7qdyuC7BiVdpImxUsWjXG9o+mXHxv6igFZ94yE0F2njVjFcAz2mfi3P9c
	kekiTsSjlifWaQG7+OzcYbqIYDa+SgDmRF2F61P16/yomF4FKJsnQYHgDchF6K3vWlC7
	g32m7gxtGsIeA63ZF+bBeVnrWXqkmwjSygaNDALd9B/V4rhQ257/VpflliHBNvhwBqss
	CASw==
X-Received: by 10.180.99.41 with SMTP id en9mr29839823wib.67.1445356803611;
	Tue, 20 Oct 2015 09:00:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id bk4sm4688921wjc.1.2015.10.20.09.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Oct 2015 09:00:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Oct 2015 18:00:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151020160016.GD2557@jama>
References: <1444767490-6833-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1444767490-6833-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver][PATCH] monkey: new v1.6.3 release.
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
X-List-Received-Date: Tue, 20 Oct 2015 16:00:05 -0000
X-Groupsio-MsgNum: 57930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline

--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 02:18:10PM -0600, Eduardo Silva wrote:
> This patch add the new Monkey HTTP Server v1.6.3.
>=20
> For more details about software changes please visit:
>=20
>   http://monkey-project.com/Announcements/v1.6.3

Fails to build with systemd enabled:
http://errors.yoctoproject.org/Errors/Details/20606/

>=20
> =3D=3D=3D Build Tests =3D=3D
>=20
> This version have been tested on Yocto/Fido being packaged and
> deployed on images based on RPM successfully.
>=20
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/files/monkey.init         | 34 ------------
>  .../recipes-httpd/monkey/files/monkey.service      | 12 ----
>  .../recipes-httpd/monkey/monkey_1.5.6.bb           | 64 ----------------=
------
>  .../recipes-httpd/monkey/monkey_1.6.3.bb           | 44 +++++++++++++++
>  4 files changed, 44 insertions(+), 110 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.init
>  delete mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.serv=
ice
>  delete mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
>  create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init b/meta=
-webserver/recipes-httpd/monkey/files/monkey.init
> deleted file mode 100644
> index 40b2118..0000000
> --- a/meta-webserver/recipes-httpd/monkey/files/monkey.init
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -#!/bin/sh
> -
> -PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> -DAEMON=3D/usr/bin/monkey
> -NAME=3Dmonkey
> -DESC=3D"Monkey HTTP Server"
> -OPTS=3D"--daemon"
> -
> -case "$1" in
> -  start)
> -	echo -n "Starting $DESC: "
> -	start-stop-daemon --start -x "$DAEMON" -- $OPTS
> -	echo "$NAME."
> -	;;
> -  stop)
> -	echo -n "Stopping $DESC: "
> -	start-stop-daemon --stop -x "$DAEMON"
> -	echo "$NAME."
> -	;;
> -  restart|force-reload)
> -	echo -n "Restarting $DESC: "
> -	start-stop-daemon --stop -x "$DAEMON"
> -	sleep 1
> -	start-stop-daemon --start -x "$DAEMON" -- $OPTS
> -	echo "$NAME."
> -	;;
> -  *)
> -	N=3D/etc/init.d/$NAME
> -	echo "Usage: $N {start|stop|restart|force-reload}" >&2
> -	exit 1
> -	;;
> -esac
> -
> -exit 0
> diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service b/m=
eta-webserver/recipes-httpd/monkey/files/monkey.service
> deleted file mode 100644
> index f9aa57f..0000000
> --- a/meta-webserver/recipes-httpd/monkey/files/monkey.service
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -[Unit]
> -Description=3DMonkey HTTP Server
> -After=3Dnetwork.target remote-fs.target
> -
> -[Service]
> -Type=3Dforking
> -ExecStart=3D/usr/bin/monkey --daemon
> -PIDFile=3D/var/run/monkey.pid.2001
> -TimeoutSec=3D10
> -
> -[Install]
> -WantedBy=3Dmulti-user.target
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.6.bb
> deleted file mode 100644
> index d7330a1..0000000
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> -HOMEPAGE =3D "http://monkey-project.com"
> -BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> -
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> -
> -SECTION =3D "net"
> -
> -SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
> -           file://monkey.service \
> -           file://monkey.init"
> -
> -SRC_URI[md5sum] =3D "9699e4c9ea6ce6b989907c252ae80254"
> -SRC_URI[sha256sum] =3D "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0=
d0baa2d1e9be1a22"
> -
> -EXTRA_OECONF =3D "--plugdir=3D${libdir}/monkey/ \
> -                --logdir=3D${localstatedir}/log/monkey/ \
> -                --pidfile=3D${localstatedir}/run/monkey.pid \
> -                --default-user=3Dwww-data \
> -                --datadir=3D${localstatedir}/www/monkey/ \
> -                --sysconfdir=3D${sysconfdir}/monkey/ \
> -                --enable-plugins=3D* \
> -                --disable-plugins=3Dmbedtls \
> -                --debug \
> -                --malloc-libc"
> -
> -inherit autotools-brokensep pkgconfig update-rc.d systemd
> -
> -INITSCRIPT_NAME =3D "monkey"
> -INITSCRIPT_PARAMS =3D "defaults 70"
> -
> -SYSTEMD_SERVICE_${PN} =3D "monkey.service"
> -
> -FILES_${PN} +=3D "${localstatedir}/www/monkey/"
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/monkey/monkey.conf \
> -                   ${sysconfdir}/monkey/sites/default \
> -                   ${sysconfdir}/monkey/monkey.mime \
> -                   ${sysconfdir}/monkey/plugins.load \
> -                   ${sysconfdir}/monkey/plugins/proxy_reverse/proxy_reve=
rse.conf \
> -                   ${sysconfdir}/monkey/plugins/mandril/mandril.conf \
> -                   ${sysconfdir}/monkey/plugins/fastcgi/fastcgi.conf \
> -                   ${sysconfdir}/monkey/plugins/logger/logger.conf \
> -                   ${sysconfdir}/monkey/plugins/cgi/cgi.conf \
> -                   ${sysconfdir}/monkey/plugins/cheetah/cheetah.conf \
> -                   ${sysconfdir}/monkey/plugins/dirlisting/dirhtml.conf \
> -                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/header.theme \
> -                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/footer.theme \
> -                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/entry.theme \
> -                   ${sysconfdir}/monkey/plugins/auth/README \
> -                   ${sysconfdir}/monkey/plugins/auth/monkey.users \
> -                   "
> -
> -do_install_append() {
> -
> -    mkdir -p ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monk=
ey
> -
> -    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}=
/system
> -    fi
> -}
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.6.3.bb
> new file mode 100644
> index 0000000..b6f78aa
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> +HOMEPAGE =3D "http://monkey-project.com"
> +BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +SECTION =3D "net"
> +
> +SRC_URI =3D "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "35a915a20d5bdc5a9338316107a37557"
> +SRC_URI[sha256sum] =3D "47973b12cc45c185b054e251a6c3d8a36cae70301f614b41=
32bb1ef504f01cfa"
> +
> +EXTRA_OECMAKE =3D "-DCMAKE_INSTALL_LIBDIR=3D${libdir}/monkey/          \
> +                 -DINSTALL_LOGDIR=3D${localstatedir}/log/monkey/     \
> +                 -DPID_PATH=3D${localstatedir}/run                   \
> +                 -DPID_FILE=3Dmonkey.pid                             \
> +                 -DDEFAULT_USER=3Dwww-data                           \
> +                 -DDEFAULT_PORT=3D80                                 \
> +                 -DINSTALL_WEBROOTDIR=3D${localstatedir}/www/monkey/ \
> +                 -DINSTALL_SYSCONFDIR=3D${sysconfdir}/monkey/        \
> +                 -DWITH_SYSTEM_MALLOC=3D1                            \
> +                 -DWITH_PLUGIN_TLS=3D1                               \
> +                 -DSTATIC_PLUGINS=3Dtls                              \
> +                "
> +
> +inherit cmake update-rc.d systemd
> +
> +INITSCRIPT_NAME =3D "monkey"
> +INITSCRIPT_PARAMS =3D "defaults 70"
> +
> +SYSTEMD_SERVICE_${PN} =3D "monkey.service"
> +
> +FILES_${PN} +=3D "${localstatedir}/www/monkey/"
> +
> +do_install_append() {
> +    install -m 0755 -d ${D}${sysconfdir}/init.d
> +    install -m 755 ${S}/monkey.init ${D}${sysconfdir}/init.d/monkey
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}=
/system
> +    fi
> +}
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYmZQ8ACgkQN1Ujt2V2gBxfzwCfdOW9hv8FXk+7VP81IqdF9ZZ9
zuEAn12hVX5n62IrXXCehdP4anpjMIUc
=WGdJ
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
