Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 54A1572518
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:05:34 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y5gZL-00032m-3q from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Dec 2014 12:05:35 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 12:05:34 -0800
Received: by burninator (Postfix, from userid 1000)	id 283895810B3; Mon, 29
	Dec 2014 15:05:28 -0500 (EST)
Date: Mon, 29 Dec 2014 15:05:28 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141229200527.GC4672@mentor.com>
References: <1418890161-30095-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418890161-30095-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] dnrd: Add new recipe
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
X-List-Received-Date: Mon, 29 Dec 2014 20:05:41 -0000
X-Groupsio-MsgNum: 53514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] dnrd: Add new recipe] On 14.12.18 (Thu 16:09=
) Qian Lei wrote:

> dnrd is a proxying nameserver. It forwards DNS queries to the appropriate
> nameserver, but can also act as the primary nameserver for a subnet behind
> a firewall. It also has features such as caching DNS requests, support for
> DNS servers, cache poisoning prevention, TCP support, etc.
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-daemons/dnrd/dnrd/dnrd.conf.sample     | 21 +++++
>  .../recipes-daemons/dnrd/dnrd/dnrd.init            | 94 ++++++++++++++++=
++++++
>  .../recipes-daemons/dnrd/dnrd/dnrd.service         | 12 +++
>  .../recipes-daemons/dnrd/dnrd_2.20.3.bb            | 39 +++++++++
>  4 files changed, 166 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.s=
ample
>  create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
>  create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
>  create mode 100644 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
>=20
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample b=
/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
> new file mode 100644
> index 0000000..d9f6b3d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
> @@ -0,0 +1,21 @@
> +# options to dnrd
> +
> +# example: two default dns servers and dns servers for exampledomain.com=
=2E The
> +# latter are load balanced (-b)
> +#
> +#=20
> +
> +# DNRD_OPTS=3D"
> +# -s XXX.XXX.XX.XXX=20
> +# -s XXX.XXX.XX.XXX
> +# -b
> +# -s XXX.XXX.XX.XXX:exampledomain.com
> +# -s XXX.XXX.XX.XXX:exampledomain.com"
> +
> +# example: dnrd user
> +#
> +
> +# DNRD_USER=3D"user"
> +#
> +
> +
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init b/meta-n=
etworking/recipes-daemons/dnrd/dnrd/dnrd.init
> new file mode 100644
> index 0000000..73289a9
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
> @@ -0,0 +1,94 @@
> +#!/bin/sh
> +#
> +# Startup script for dnrd
> +#
> +#       Copyright 2008, Rakesh Pandit <rakesh.pandit@gmail.com>
> +#=20
> +#       This source is free software; you can redistribute it and/or mod=
ify
> +#       it under the terms of the GNU General Public License as publishe=
d by
> +#       the Free Software Foundation; either version 2, or (at your opti=
on)
> +#       any later version.
> +
> +#       This source is distributed in the hope that it will be useful,
> +#       but WITHOUT ANY WARRANTY; without even the implied warranty of
> +#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +#       GNU General Public License for more details.
> +
> +#       You should have received a copy of the GNU General Public License
> +#       along with this program; if not, write to the Free Software
> +#       Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> +#
> +# chkconfig: - 85 15
> +# description: dnrd is a proxying nameserver. It forwards DNS queries to=
 the
> +# appropriate nameserver, but can also act as the primary nameserver for
> +# a subnet behind a firewall. It also has features such as caching DNS
> +# requests, support for DNS servers, cache poisoning prevention, TCP
> +# support, etc..
> +
> +# processname: dnrd
> +# pidfile: /var/run/dnrd.pid
> +# config: /etc/dnrd/dnrd.conf
> +
> +# Provides:          dnrd
> +# Required-Start:
> +# Should-Start:
> +# Required-Stop:
> +# Default-Stop:      0 1 2 6
> +# Short-Description: Start dnrd daemon
> +# Description:       Domain Name Relay Daemon
> +# END INIT INFO
> +
> +exe=3D/usr/sbin/dnrd
> +pfile=3D/etc/passwd
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +# Source conf file
> +. /etc/dnrd/dnrd.conf
> +
> +[ -x $exe ] || exit 1=20
> +[ -r "/etc/dnrd/dnrd.conf" ] || exit 1
> +if [ $DNRD_USER ]
> +then
> +         grep "^${LOGIN}:" $pfile >/dev/null 2>&1
> +         if [ $? -eq 0 ];then
> +                 echo "$DNRD_USER specified in /etc/dnrd/dnrd.conf does =
not exist!"
> +         fi
> +else
> +        echo "DNRD_USER not set at /etc/dnrd/dnrd.conf!"
> +        exit 1
> +fi
> +
> +case "$1" in
> +  start)
> +        echo -n "Starting  dnrd: "
> +        daemon  dnrd $DNRD_OPTS -u $DNRD_USER
> +        echo
> +        touch /var/lock/subsys/dnrd
> +        ;;
> +  stop)
> +        echo -n "Shutting down dnrd: "
> +        killproc dnrd
> +        echo
> +        rm -f /var/lock/subsys/dnrd
> +        rm -f /var/run/dnrd.pid
> +        ;;
> +  status)
> +        status dnrd
> +        ;;
> +  restart)
> +        $0 stop
> +        $0 start
> +        ;;
> +  reload)
> +        echo -n "Reloading dnrd: "
> +        killproc dnrd -HUP
> +        echo
> +        ;;
> +  *)
> +        echo "Usage: $0 {start|stop|restart|reload|status}"
> +        exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service b/met=
a-networking/recipes-daemons/dnrd/dnrd/dnrd.service
> new file mode 100644
> index 0000000..9c9fa66
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DDomain Name Relay Daemon
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Dforking
> +PIDFile=3D/var/run/dnrd.pid
> +EnvironmentFile=3D/etc/dnrd/dnrd.conf
> +ExecStart=3D/usr/sbin/dnrd $DNRD_OPTS -u $DNRD_USER
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-n=
etworking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> new file mode 100644
> index 0000000..85a58cc
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "A caching, forwarding DNS proxy server"
> +DESCRIPTION =3D "\
> +dnrd is a proxying nameserver. It forwards DNS queries to the appropriat=
e \
> +nameserver, but can also act as the primary nameserver for a subnet behi=
nd \
> +a firewall. It also has features such as caching DNS requests, support f=
or \
> +DNS servers, cache poisoning prevention, TCP support, etc.."
> +HOMEPAGE =3D "http://dnrd.sourceforge.net/"
> +SECTION =3D "System Environment/Daemons"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0be67017f1c770313ad7b40e18d56=
8f1"
> +
> +SRC_URI =3D "http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/$=
{BP}.tar.gz \
> +           file://dnrd.service \
> +           file://dnrd.conf.sample \
> +           file://dnrd.init"
> +SRC_URI[md5sum] =3D "41c9b070aae8ed403fc8c2aac7ab157c"
> +SRC_URI[sha256sum] =3D "aa46e7f8736b88c1d752cf606b3990041221ce91d014e955=
c6b02eb2167db015"
> +
> +SYSTEMD_SERVICE_${PN} =3D "dnrd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +inherit autotools
> +inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','syste=
md','', d)}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} INSTALL=3D"install -p"
> +
> +    sed -i -e 's:/etc/rc.d/init.d/functions:/etc/init.d/functions:g' \
> +        ${WORKDIR}/dnrd.init
> +    install -d -m 0755 ${D}${sysconfdir}/init.d
> +    install -d -m 0755 ${D}${sysconfdir}/dnrd
> +    install -p -m 0644 ${WORKDIR}/dnrd.conf.sample ${D}${sysconfdir}/dnr=
d/dnrd.conf
> +    install -p -m 0755 ${WORKDIR}/dnrd.init ${D}${sysconfdir}/init.d/dnrd
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d -m 0755 ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/dnrd.service ${D}${systemd_unitdir}/sy=
stem
> +    fi
> +}
> --=20
> 1.8.3.1
>=20
--=20
-Joe MacDonald.
:wq

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUobQHAAoJEEn8ffcsOfaWmEIIAKJzXhzOaLKaWdYTphVqq/z7
kti2ihSbEb1wnpLgSLNXHOoXWmdMgrHK+KPC11lA4Ug89Rk6Kn0GaY9SCYZs3BV8
CVWFKzdSNi2yWJF+nctJv2XRiKQQMO1FhTCf1CF9eaN9s79zKfyt3rOTPH4040Bl
Bhhs1aw8a0kYGxT/CBtbLv72Ec3Ve9X6G4V3bHaaX9/JEBY+GMfMmHp+DCQIK5PH
1+KHeq5kwVSvew9XVJ94rBYDSTmxOW4qI4AU5qkfJCWhXdHXYFJZqnaLcLpnsoE5
MXUoiuTkyxXPdBY9072Mdh51m1O/kGmF7WiWgIKEchoS34Qk31j8Wgt97zlt9gs=
=8ISX
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
