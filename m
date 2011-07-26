Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QlnqF-0005S9-T0 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 22:03:00 +0200
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QlnnE-0000Ud-75 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 19:59:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311709612-3664-1-git-send-email-tom_rini@mentor.com>
References: <1311709612-3664-1-git-send-email-tom_rini@mentor.com>
Date: Tue, 26 Jul 2011 21:58:46 +0200
Message-ID: <1311710326.3735.447.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH] rp-pppoe: Port from oe.dev
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
X-List-Received-Date: Tue, 26 Jul 2011 20:03:00 -0000
X-Groupsio-MsgNum: 33338
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fsKM3vS3yyDlAECqznD0"

--=-fsKM3vS3yyDlAECqznD0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tom,


Am Dienstag, den 26.07.2011, 12:46 -0700 schrieb Tom Rini:

please add the version number to the commit summary.

> The difference between this and oe.dev are:
> - Reset PR
> - Add bitfields site variable to the endian site file
>   This was wrong in oe.dev for BE (mips).
> - Add LIC_FILES_CHKSUM
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch |  136 ++++++++++++++=
++++++
>  .../rp-pppoe-3.8/dont-swallow-errors.patch         |   11 ++
>  .../rp-pppoe/rp-pppoe-3.8/pppoe-server.default     |   22 +++
>  .../rp-pppoe/rp-pppoe-3.8/pppoe-server.init        |   59 +++++++++
>  .../rp-pppoe-3.8/pppoe-src-restrictions.patch      |   18 +++
>  .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch       |   25 ++++
>  .../rp-pppoe/rp-pppoe-3.8/update-config.patch      |   30 +++++
>  .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        |   23 ++++
>  .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |   61 +++++++++
>  meta-oe/site/endian-big                            |    2 +
>  meta-oe/site/endian-little                         |    2 +
>  11 files changed, 389 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/co=
nfigure_in_cross.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/do=
nt-swallow-errors.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pp=
poe-server.default
>  create mode 100755 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pp=
poe-server.init
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pp=
poe-src-restrictions.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/to=
p-autoconf.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/up=
date-config.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/us=
e-ldflags.patch
>  create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
>  create mode 100644 meta-oe/site/endian-big
>  create mode 100644 meta-oe/site/endian-little
>=20
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure=
_in_cross.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/config=
ure_in_cross.patch
> new file mode 100644
> index 0000000..381a44d
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cro=
ss.patch

Can you add a patch header?

> @@ -0,0 +1,136 @@
> +Index: src/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rp-pppoe-3.8.orig/src/configure.in	2006-04-03 00:29:42.000000000 +10=
00
> ++++ rp-pppoe-3.8/src/configure.in	2007-06-07 22:19:36.000000000 +1000
> +@@ -5,6 +5,13 @@
> + dnl pppd directory for kernel-mode PPPoE
> + PPPD_DIR=3Dppp-2.4.1.pppoe2
> +=20
> ++dnl hard code some paths
> ++PPPD=3D/usr/sbin/pppd
> ++ID=3D/usr/bin/id
> ++ECHO=3D/bin/echo
> ++AC_ARG_VAR(PPPD)
> ++AC_ARG_VAR(ID)
> ++
> + AC_CONFIG_HEADER(config.h)
> +=20
> + AC_PREFIX_DEFAULT(/usr)
> +@@ -44,7 +51,7 @@
> + AC_MSG_RESULT($ac_cv_struct_sockaddr_ll)
> +=20
> + if test "$ac_cv_struct_sockaddr_ll" =3D yes ; then
> +-AC_DEFINE(HAVE_STRUCT_SOCKADDR_LL)
> ++AC_DEFINE([HAVE_STRUCT_SOCKADDR_LL], [], [Have struct SOCKADDR_LL])
> + fi
> +=20
> + dnl Check for N_HDLC line discipline
> +@@ -55,7 +62,7 @@
> + 	ac_cv_n_hdlc=3Dno)
> + AC_MSG_RESULT($ac_cv_n_hdlc)
> + if test "$ac_cv_n_hdlc" =3D yes ; then
> +-AC_DEFINE(HAVE_N_HDLC)
> ++AC_DEFINE([HAVE_N_HDLC], [], [Have N_HDLC])
> + fi
> +=20
> + AC_ARG_ENABLE(plugin, [  --enable-plugin=3Dpppd_src_path   build pppd p=
lugin], ac_cv_pluginpath=3D$enableval, ac_cv_pluginpath=3Dno)
> +@@ -100,13 +107,13 @@
> + if test "$ac_cv_header_linux_if_pppox_h" =3D yes ; then
> + 	if test "$ac_cv_pluginpath" !=3D no ; then
> + 		LINUX_KERNELMODE_PLUGIN=3Drp-pppoe.so
> +-		AC_DEFINE(HAVE_LINUX_KERNEL_PPPOE)
> ++		AC_DEFINE([HAVE_LINUX_KERNEL_PPPOE], [], [Have kernel PPPoE])
> + 		PPPD_INCDIR=3D$ac_cv_pluginpath
> + 	fi
> + fi
> +=20
> + if test "$ac_cv_debugging" =3D "yes" ; then
> +-   AC_DEFINE(DEBUGGING_ENABLED)
> ++   AC_DEFINE([DEBUGGING_ENABLED], [], [Debugging enabled])
> + fi
> +=20
> + AC_SUBST(LINUX_KERNELMODE_PLUGIN)
> +@@ -131,15 +138,8 @@
> + AC_CHECK_SIZEOF(unsigned int)
> + AC_CHECK_SIZEOF(unsigned long)
> +=20
> +-dnl Check for location of pppd
> +-AC_PATH_PROG(PPPD, pppd, NOTFOUND, $PATH:/sbin:/usr/sbin:/usr/local/sbi=
n)
> +-AC_PATH_PROG(ECHO, echo, echo)
> +-
> +-dnl Check for setsid (probably Linux-specific)
> +-AC_PATH_PROG(SETSID, setsid, "", $PATH:/sbin:/usr/sbin:/usr/local/sbin)
> +-
> + dnl Check for an "id" which accepts "-u" option -- hack for Solaris.
> +-AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
> ++dnl AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
> +=20
> + dnl Check for Linux-specific kernel support for PPPoE
> + AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
> +@@ -183,44 +183,8 @@
> + 	CFLAGS=3D"$CFLAGS -Wall -Wstrict-prototypes -ansi"
> + fi
> +=20
> +-dnl If we couldn't find pppd, die
> +-if test "$PPPD" =3D "NOTFOUND"; then
> +-        AC_MSG_WARN([*** Oops!  I couldn't find pppd, the PPP daemon an=
ywhere.])
> +-	AC_MSG_WARN([*** You must install pppd, version 2.3.10 or later.])
> +-	AC_MSG_WARN([*** I will keep going, but it may not work.])
> +-	PPPD=3Dpppd
> +-fi
> +-
> +-dnl Figure out pppd version.  2.3.7 to 2.3.9 -- issue warning.  Less th=
an
> +-dnl 2.3.7 -- stop
> +-
> +-PPPD_VERSION=3D`$PPPD --version 2>&1 | awk ' /version/ {print $NF}'`
> +-
> +-case "$PPPD_VERSION" in
> +-1.*|2.0.*|2.1.*|2.2.*|2.3.0|2.3.1|2.3.2|2.3.3|2.3.4|2.3.5|2.3.6)
> +-	AC_MSG_WARN([*** Oops! Your version of pppd is $PPPD_VERSION, which is=
 too old.])
> +-	AC_MSG_WARN([*** You need at least 2.3.7 (2.3.10 or newer recommended.=
])
> +-	AC_MSG_WARN([*** I will keep going, but it may not work.])
> +-	;;
> +-
> +-2.3.7|2.3.8|2.3.9)
> +-	AC_MSG_WARN([*** Warning.  Your version of pppd is $PPPD_VERSION.  You=
 will])
> +-	AC_MSG_WARN([*** not be able to use connect-on-demand.  Upgrade to ppp=
d])
> +-	AC_MSG_WARN([*** 2.3.10 or newer if you need connect-on-demand.])
> +-	;;
> +-
> +-2*|3*|4*|5*|6*|7*|8*|9*)
> +-	;;
> +-
> +-*)
> +-	AC_MSG_WARN([*** Oops.  I cannot figure out what version of pppd you h=
ave.])
> +-	AC_MSG_WARN([*** All I got back was '$PPPD_VERSION'])
> +-	AC_MSG_WARN([*** I will keep going, but it may not work.])
> +-	;;
> +-esac
> +-
> + dnl Figure out packing order of structures
> +-AC_MSG_CHECKING([packing order of bit fields])
> ++AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
> + AC_TRY_RUN([
> + union foo {
> +     struct bar {
> +@@ -245,10 +209,11 @@
> +     }
> + }], rpppoe_cv_pack_bitfields=3Dnormal, rpppoe_cv_pack_bitfields=3Drev,
> + $ECHO "no defaults for cross-compiling"; exit 0)
> ++])
> +=20
> + if test "$rpppoe_cv_pack_bitfields" =3D "rev" ; then
> + 	AC_MSG_RESULT(reversed)
> +-	AC_DEFINE(PACK_BITFIELDS_REVERSED)
> ++	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
> + else
> + 	AC_MSG_RESULT(normal)
> + fi
> +@@ -312,6 +277,7 @@
> + AC_SUBST(RDYNAMIC)
> + AC_SUBST(LIBEVENT)
> + AC_SUBST(ECHO)
> ++AC_SUBST(HAVE_STRUCT_SOCKADDR_LL)
> +=20
> + datadir_evaluated=3D`eval echo $datadir`
> + AC_SUBST(datadir_evaluated)
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swal=
low-errors.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-=
swallow-errors.patch
> new file mode 100644
> index 0000000..81ce2db
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-err=
ors.patch
> @@ -0,0 +1,11 @@
> +--- a/src/configure.in.org	2008-01-14 21:08:38.000000000 +0200
> ++++ a/src/configure.in	2008-01-14 21:20:09.000000000 +0200
> +@@ -208,7 +208,7 @@
> + 	return 2;
> +     }
> + }], rpppoe_cv_pack_bitfields=3Dnormal, rpppoe_cv_pack_bitfields=3Drev,
> +-$ECHO "no defaults for cross-compiling"; exit 0)
> ++$ECHO "no defaults for cross-compiling"; exit 1)
> + ])
> +=20
> + if test "$rpppoe_cv_pack_bitfields" =3D "rev" ; then
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-ser=
ver.default b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-serv=
er.default
> new file mode 100644
> index 0000000..996d57f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.def=
ault
> @@ -0,0 +1,22 @@
> +# PPPoE Server options
> +
> +# Maximum segment size, not used for in kernel PPPoE
> +#MSS=3D1412
> +
> +# Device(s) - Space seperated list of devices to listen on
> +#DEVICES=3D"eth1"
> +
> +# Local IP
> +#LOCAL_IP=3D10.0.0.1
> +
> +# Starting remote IP
> +#REMOTE_IP=3D10.67.15.1
> +
> +# Service name
> +#SERVICE_NAME=3D"acme"
> +
> +# Maximum number of sessions, default is 16
> +#MAX_SESSIONS=3D64
> +
> +# Access concentrator name, default is the hostname
> +#ACCESS_CONCENTRATOR_NAME=3D"pppoe-rtr-1"
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-ser=
ver.init b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.=
init
> new file mode 100755
> index 0000000..21afe0b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.ini=
t
> @@ -0,0 +1,59 @@
> +#! /bin/sh
> +
> +test -f /usr/sbin/pppoe-server || exit 0
> +test -f /etc/default/pppoe-server && . /etc/default/pppoe-server
> +
> +case $1 in
> +  start)
> +    OPTIONS=3D""
> +    if [ -n "$MSS" ]; then
> +      OPTIONS=3D"$OPTIONS -m $MSS"
> +    fi
> +    if [ -n "$DEVICES" ]; then
> +      for i in $DEVICES; do
> +        OPTIONS=3D"$OPTIONS -I $i"
> +      done
> +    fi
> +    if [ -n "$LOCAL_IP" ]; then
> +      OPTIONS=3D"$OPTIONS -L $LOCAL_IP"
> +    fi
> +    if [ -n "$REMOTE_IP" ]; then
> +      OPTIONS=3D"$OPTIONS -R $REMOTE_IP"
> +    fi
> +    if [ -n "$SERVICE_NAME" ]; then
> +      OPTIONS=3D"$OPTIONS -S $SERVICE_NAME"
> +    fi
> +    if [ -n "$MAX_SESSIONS" ]; then
> +      OPTIONS=3D"$OPTIONS -N $MAX_SESSIONS"
> +    fi
> +    if [ -n "$ACCESS_CONCENTRATOR_NAME" ]; then
> +      OPTIONS=3D"$OPTIONS -C $ACCESS_CONCENTRATOR_NAME"
> +    fi
> +    echo -n "Starting PPPoE server: pppoe-server"
> +    start-stop-daemon --start --quiet --exec /usr/sbin/pppoe-server -- $=
OPTIONS
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping PPPoE server: pppoe-server"
> +    start-stop-daemon --stop --quiet --exec /usr/sbin/pppoe-server -- $O=
PTIONS
> +    echo "."
> +    ;;
> +  status)
> +    pid=3D$(pidof pppoe-server)    	         =20
> +    if [ -n "$pid" ] ; then
> +	    echo "Running with pid $pid"
> +    else
> +	    echo "Not running"
> +    fi
> +    ;;
> +  restart|force-reload)
> +    $0 stop
> +    $0 start
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/pppoe-server {start|stop|restart|force-relo=
ad}"
> +    exit 1
> +    ;;
> +esac
> +
> +exit 0
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src=
-restrictions.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pp=
poe-src-restrictions.patch
> new file mode 100644
> index 0000000..e7e1c2e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restri=
ctions.patch
> @@ -0,0 +1,18 @@
> +Relax restrictions on the PPPoE src address, as per debian bug
> +293811:
> +
> +  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D293811
> +
> +--- rp-pppoe-3.8.orig/src/discovery.c
> ++++ rp-pppoe-3.8/src/discovery.c
> +@@ -376,8 +376,8 @@
> + 	if (!packetIsForMe(conn, &packet)) continue;
> +=20
> + 	if (packet.code =3D=3D CODE_PADO) {
> +-	    if (NOT_UNICAST(packet.ethHdr.h_source)) {
> +-		printErr("Ignoring PADO packet from non-unicast MAC address");
> ++	    if (BROADCAST(packet.ethHdr.h_source)) {
> ++		printErr("Ignoring broadcast PADO packet");
> + 		continue;
> + 	    }
> + 	    parsePacket(&packet, parsePADOTags, &pc);
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoc=
onf.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf=
.patch
> new file mode 100644
> index 0000000..e3b0482
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.pat=
ch
> @@ -0,0 +1,25 @@
> +The autoconf stuff is all in a subdirectory, which is rather annoying
> +as OE expects patches to be applied and autoconf stuff to be done in
> +S. This adds enough autoconf at the top level to allow it to be
> +called there - all it does is run a sub autoconf stuff in the src
> +directory.
> +
> +Index: rp-pppoe-3.8/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ rp-pppoe-3.8/Makefile.am	2007-06-08 15:58:16.000000000 +1000
> +@@ -0,0 +1,5 @@
> ++PACKAGE =3D rp-pppoe
> ++VERSION =3D 3.8
> ++
> ++dnl AM_CFLAGS =3D -Wall -DDEBUG
> ++SUBDIRS =3D src
> +Index: rp-pppoe-3.8/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ rp-pppoe-3.8/configure.in	2007-06-08 15:58:16.000000000 +1000
> +@@ -0,0 +1,4 @@
> ++AC_INIT(src/pppoe.c)
> ++AM_INIT_AUTOMAKE([rp-pppoe], [3.8])
> ++AC_CONFIG_SUBDIRS(src)
> ++AC_OUTPUT(Makefile)
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-co=
nfig.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-conf=
ig.patch
> new file mode 100644
> index 0000000..5642e3c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.pa=
tch
> @@ -0,0 +1,30 @@
> +Set the timeout to 0 since we don't want pppoe to try reconnecting,
> +we want whatever is calling it to reconnect. Lots of odd things
> +happen when you have pppoe retrying itself.
> +
> +The path for the plugin is wrong, it's now part of ppp and is in a
> +ppp's plugin lib directory. If no path is specified then that's where
> +ppp looks, so that's what we do here.
> +
> +Index: rp-pppoe-3.8/configs/pppoe.conf
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rp-pppoe-3.8.orig/configs/pppoe.conf	2006-04-03 00:29:41.000000000 +=
1000
> ++++ rp-pppoe-3.8/configs/pppoe.conf	2007-06-08 16:02:47.000000000 +1000
> +@@ -66,7 +66,7 @@
> + # to connect forever after pppoe-start is called.  Otherwise, it will
> + # give out after CONNECT_TIMEOUT seconds and will not attempt to
> + # connect again, making it impossible to reach.
> +-CONNECT_TIMEOUT=3D30
> ++CONNECT_TIMEOUT=3D0
> +=20
> + # How often in seconds pppoe-start polls to check if link is up
> + CONNECT_POLL=3D2
> +@@ -115,7 +115,7 @@
> + FIREWALL=3DNONE
> +=20
> + # Linux kernel-mode plugin for pppd.  If you want to try the kernel-mod=
e
> +-# plugin, use LINUX_PLUGIN=3D/etc/ppp/plugins/rp-pppoe.so
> ++# plugin, use LINUX_PLUGIN=3Drp-pppoe.so
> + LINUX_PLUGIN=3D
> +=20
> + # Any extra arguments to pass to pppoe.  Normally, use a blank string
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldfla=
gs.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.p=
atch
> new file mode 100644
> index 0000000..1209631
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patc=
h
> @@ -0,0 +1,23 @@
> +--- a/src/Makefile.in	2006-04-02 18:29:42.000000000 +0400
> ++++ b/src/Makefile.in	2010-04-16 17:51:31.000000000 +0400
> +@@ -67,16 +67,16 @@ all: $(TARGETS)
> + 	@echo "Type 'make install' as root to install the software."
> +=20
> + pppoe-sniff: pppoe-sniff.o if.o common.o debug.o
> +-	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o
> ++	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o $(LDFLAGS)
> +=20
> + pppoe-server: pppoe-server.o if.o debug.o common.o md5.o libevent/libev=
ent.a @PPPOE_SERVER_DEPS@
> +-	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o m=
d5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent
> ++	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o m=
d5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent $(LDFLAGS)
> +=20
> + pppoe: pppoe.o if.o debug.o common.o ppp.o discovery.o
> +-	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o
> ++	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o $(LDFLAG=
S)
> +=20
> + pppoe-relay: relay.o if.o debug.o common.o
> +-	@CC@ -o pppoe-relay relay.o if.o debug.o common.o
> ++	@CC@ -o pppoe-relay relay.o if.o debug.o common.o $(LDFLAGS)
> +=20
> + pppoe.o: pppoe.c pppoe.h
> + 	@CC@ $(CFLAGS) '-DVERSION=3D"$(VERSION)"' -c -o pppoe.o pppoe.c
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta=
-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> new file mode 100644
> index 0000000..371d82e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "A user-mode PPPoE client and server suite for Linux"
> +HOMEPAGE =3D "http://www.roaringpenguin.com/en/penguin/openSourceProduct=
s/rpPppoe"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3Da194eaefae2be54ee3221339b=
10d0581"
> +RDEPENDS_${PN} =3D "ppp"
> +RDEPENDS_${PN}-server =3D "${PN}"
> +RRECOMMENDS_${PN} =3D "ppp-oe"
> +PR =3D "r7"

Start from 0?

> +SRC_URI =3D "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
> +           file://top-autoconf.patch \
> +           file://configure_in_cross.patch \
> +           file://pppoe-src-restrictions.patch \
> +           file://update-config.patch \
> +           file://dont-swallow-errors.patch \
> +	   file://use-ldflags.patch \

Indentation.

> +           file://pppoe-server.default \
> +           file://pppoe-server.init"
> +
> +inherit autotools update-rc.d

[=E2=80=A6]


Thanks,

Paul

--=-fsKM3vS3yyDlAECqznD0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4vHHYACgkQPX1aK2wOHVh4WwCfWLpz+P+tUIcBfG2xDr1RGkX0
6BsAn3VwdijoQlQIx9niibgc1Jmtp28u
=Zm15
-----END PGP SIGNATURE-----

--=-fsKM3vS3yyDlAECqznD0--
