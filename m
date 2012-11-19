Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TaW5Q-00065Q-7d
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:28:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAJIEjWS021427
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 10:14:45 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 19 Nov 2012 10:14:44 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 8DEC67FD0	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 13:14:06 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	93CB36A80C0; Mon, 19 Nov 2012 13:14:43 -0500 (EST)
Date: Mon, 19 Nov 2012 13:14:43 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121119181443.GD13350@windriver.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
	<2f446d9b50fd73f3d8a5b09c8c5b99bec41e16d0.1353345006.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <2f446d9b50fd73f3d8a5b09c8c5b99bec41e16d0.1353345006.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 1/8] tftp-hpa: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Mon, 19 Nov 2012 18:28:52 -0000
X-Groupsio-MsgNum: 41574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A few of these need clean-up (attribution, up-stream status, etc.) that
Paul and I were discussing, forgot about, and are now focused on again.

I'm still sorting that part out, so there's an update coming from me for
the tftp-hpa patches before they get merged.

-J.

[[oe] [meta-networking][PATCH 1/8] tftp-hpa: add from OE-Classic, update an=
d tidy up] On 12.11.19 (Mon 17:11) Paul Eggleton wrote:

> * Update to 5.2
> * Add patches
> * Add DESCRIPTION and better SUMMARY
> * Make LICENSE more accurate
> * Add LIC_FILES_CHKSUM
> * Update ALTERNATIVE_* definitions
>=20
> Much of this was done by Joe MacDonald <joe.macdonald@windriver.com>.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../recipes-daemons/tftp-hpa/files/default         |    3 +
>  .../recipes-daemons/tftp-hpa/files/init            |  104 +++++++++++++
>  .../tftp-hpa/files/tftp-0.40-remap.patch           |   19 +++
>  .../tftp-hpa/files/tftp-0.42-tftpboot.patch        |   54 +++++++
>  .../tftp-hpa/files/tftp-0.49-chk_retcodes.patch    |   15 ++
>  .../tftp-hpa/files/tftp-0.49-cmd_arg.patch         |  159 ++++++++++++++=
++++++
>  .../tftp-hpa/files/tftp-hpa-0.39-tzfix.patch       |   18 +++
>  .../files/tftp-hpa-0.49-fortify-strcpy-crash.patch |   26 ++++
>  .../tftp-hpa/files/tftp-hpa-0.49-stats.patch       |   14 ++
>  .../tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch      |   23 +++
>  .../recipes-daemons/tftp-hpa/files/tftp-xinetd     |   18 +++
>  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   66 ++++++++
>  12 files changed, 519 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/default
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/init
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0=
=2E40-remap.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0=
=2E42-tftpboot.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0=
=2E49-chk_retcodes.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-0=
=2E49-cmd_arg.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-h=
pa-0.39-tzfix.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-h=
pa-0.49-fortify-strcpy-crash.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-h=
pa-0.49-stats.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-h=
pa-5.2-pktinfo.patch
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-x=
inetd
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/met=
a-networking/recipes-daemons/tftp-hpa/files/default
> new file mode 100644
> index 0000000..de2ed18
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
> @@ -0,0 +1,3 @@
> +#Defaults for tftpd-hpa
> +RUN_DAEMON=3D"yes"
> +OPTIONS=3D"-l -s /srv/tftpboot"
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta-n=
etworking/recipes-daemons/tftp-hpa/files/init
> new file mode 100644
> index 0000000..5ad8c52
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
> @@ -0,0 +1,104 @@
> +#! /bin/sh
> +#
> +# Author:	Jaakko Niemi <liiwi@iki.fi>
> +# Modified from skeleton file in sarge
> +
> +### BEGIN INIT INFO
> +# Provides:          tftp-hpa
> +# Required-Start:    $local_fs $remote_fs $syslog $network
> +# Required-Stop:     $local_fs $remote_fs $syslog $network
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      1
> +# Short-Description: HPA's tftp client=20
> +# Description:       tftp server to allow booting clients which support
> +#                    the PXE protocol.
> +### END INIT INFO
> +
> +set -e
> +
> +PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> +DESC=3D"HPA's tftpd"
> +NAME=3Din.tftpd
> +DAEMON=3D/usr/sbin/$NAME
> +PIDFILE=3D/var/run/$NAME.pid
> +SCRIPTNAME=3D/etc/init.d/tftpd-hpa
> +
> +# Gracefully exit if the package has been removed.
> +test -x $DAEMON || exit 0
> +
> +# Read config file if it is present.
> +if [ -r /etc/default/tftpd-hpa ]
> +then
> +	. /etc/default/tftpd-hpa
> +fi
> +
> +if [ "$RUN_DAEMON" !=3D "yes" ] ; then
> +         echo "tftpd-hpa disabled in /etc/default/tftpd-hpa"
> +	 exit 0
> +fi
> +
> +#
> +#	Function that starts the daemon/service.
> +#
> +d_start() {
> +	start-stop-daemon --start --quiet --exec $DAEMON -- $OPTIONS
> +}
> +
> +#
> +#	Function that stops the daemon/service.
> +#
> +d_stop() {
> +	start-stop-daemon --stop --quiet --name $NAME
> +}
> +
> +#
> +#	Function that sends a SIGHUP to the daemon/service.
> +#
> +d_reload() {
> +	start-stop-daemon --stop --quiet --name $NAME --signal 1
> +}
> +
> +case "$1" in
> +  start)
> +	echo  "Starting $DESC: $NAME"
> +	d_start
> +	echo "."
> +	;;
> +  stop)
> +	echo  "Stopping $DESC: $NAME"
> +	d_stop
> +	echo "."
> +	;;
> +  #reload)
> +	#
> +	#	If the daemon can reload its configuration without
> +	#	restarting (for example, when it is sent a SIGHUP),
> +	#	then implement that here.
> +	#
> +	#	If the daemon responds to changes in its config file
> +	#	directly anyway, make this an "exit 0".
> +	#
> +	# echo -n "Reloading $DESC configuration..."
> +	# d_reload
> +	# echo "done."
> +  #;;
> +  restart|force-reload)
> +	#
> +	#	If the "reload" option is implemented, move the "force-reload"
> +	#	option to the "reload" entry above. If not, "force-reload" is
> +	#	just the same as "restart".
> +	#
> +	echo "Restarting $DESC: $NAME"
> +	d_stop
> +	sleep 1
> +	d_start
> +	echo "."
> +	;;
> +  *)
> +	# echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
> +	echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-rem=
ap.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.p=
atch
> new file mode 100644
> index 0000000..755a307
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
> @@ -0,0 +1,19 @@
> +diff -up tftp-hpa-0.49/tftpd/remap.c.zero tftp-hpa-0.49/tftpd/remap.c
> +--- tftp-hpa-0.49/tftpd/remap.c.zero	2008-10-20 18:08:31.000000000 -0400
> ++++ tftp-hpa-0.49/tftpd/remap.c	2008-11-25 11:41:09.000000000 -0500
> +@@ -286,6 +286,7 @@ struct rule *parserulefile(FILE * f)
> +     int lineno =3D 0;
> +     int err =3D 0;
> +=20
> ++    memset(this_rule, '\0', sizeof(struct rule));
> +     while (lineno++, fgets(line, MAXLINE, f)) {
> +         rv =3D parseline(line, this_rule, lineno);
> +         if (rv < 0)
> +@@ -294,6 +295,7 @@ struct rule *parserulefile(FILE * f)
> +             *last_rule =3D this_rule;
> +             last_rule =3D &this_rule->next;
> +             this_rule =3D tfmalloc(sizeof(struct rule));
> ++            memset(this_rule, '\0', sizeof(struct rule));
> +         }
> +     }
> +=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tft=
pboot.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftp=
boot.patch
> new file mode 100644
> index 0000000..a0de58d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.p=
atch
> @@ -0,0 +1,54 @@
> +diff -up tftp-hpa-0.48/tftp-xinetd.tftpboot tftp-hpa-0.48/tftp-xinetd
> +--- tftp-hpa-0.48/tftp-xinetd.tftpboot	2007-01-31 00:51:05.000000000 +01=
00
> ++++ tftp-hpa-0.48/tftp-xinetd	2008-05-20 12:05:53.000000000 +0200
> +@@ -10,7 +10,7 @@ service tftp
> + 	wait			=3D yes
> + 	user			=3D root
> + 	server			=3D /usr/sbin/in.tftpd
> +-	server_args		=3D -s /tftpboot
> ++	server_args		=3D -s /var/lib/tftpboot
> + 	disable			=3D yes
> + 	per_source		=3D 11
> + 	cps			=3D 100 2
> +diff -up tftp-hpa-0.48/README.security.tftpboot tftp-hpa-0.48/README.sec=
urity
> +--- tftp-hpa-0.48/README.security.tftpboot	2008-05-29 17:36:32.000000000=
 +0200
> ++++ tftp-hpa-0.48/README.security	2008-05-29 17:37:21.000000000 +0200
> +@@ -17,10 +17,10 @@ probably the following:
> +=20
> + 1. Create a separate "tftpd" user and group only used for tftpd;
> + 2. Have all your boot files in a single directory tree (usually called=
=20
> +-   /tftpboot).
> +-3. Specify "-p -u tftpd -s /tftpboot" on the tftpd command line; if
> ++   /var/lib/tftpboot).
> ++3. Specify "-p -u tftpd -s /var/lib/tftpboot" on the tftpd command line=
; if
> +    you want clients to be able to create files use
> +-   "-p -c -U 002 -u tftpd -s /tftpboot" (replace 002 with whatever
> ++   "-p -c -U 002 -u tftpd -s /var/lib/tftpboot" (replace 002 with whate=
ver
> +    umask is appropriate for your setup.)
> +=20
> + 	       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +@@ -40,12 +40,12 @@ directly.  Thus, if your /etc/inetd.conf
> + line):
> +=20
> + tftp	dgram	udp	wait	root	/usr/sbin/tcpd
> +-/usr/sbin/in.tftpd -s /tftpboot -r blksize
> ++/usr/sbin/in.tftpd -s /var/lib/tftpboot -r blksize
> +=20
> + ... it's better to change to ...
> +=20
> + tftp	dgram	udp	wait	root	/usr/sbin/in.tftpd
> +-in.tftpd -s /tftpboot -r blksize
> ++in.tftpd -s /var/lib/tftpboot -r blksize
> +=20
> + You should make sure that you are using "wait" option in tftpd; you
> + also need to have tftpd spawned as root in order for chroot (-s) to
> +diff -up tftp-hpa-0.48/tftpd/sample.rules.tftpboot tftp-hpa-0.48/tftpd/s=
ample.rules
> +--- tftp-hpa-0.48/tftpd/sample.rules.tftpboot	2008-05-29 17:38:46.000000=
000 +0200
> ++++ tftp-hpa-0.48/tftpd/sample.rules	2008-05-29 17:38:05.000000000 +0200
> +@@ -30,5 +30,5 @@ rg	\\		/		# Convert backslashes to slash
> + rg	\#		@		# Convert hash marks to @ signs
> + rg	/../		/..no../	# Convert /../ to /..no../
> + e	^ok/				# These are always ok
> +-r	^[^/]		/tftpboot/\0	# Convert non-absolute files
> ++r	^[^/]		/var/lib/tftpboot/\0	# Convert non-absolute files
> + a	\.pvt$				# Reject requests for private files
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk=
_retcodes.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-=
chk_retcodes.patch
> new file mode 100644
> index 0000000..6d63571
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcod=
es.patch
> @@ -0,0 +1,15 @@
> +diff -up tftp-hpa-0.49/tftpd/tftpd.c.chk_retcodes tftp-hpa-0.49/tftpd/tf=
tpd.c
> +--- tftp-hpa-0.49/tftpd/tftpd.c.chk_retcodes	2009-01-15 15:28:50.0000000=
00 +0100
> ++++ tftp-hpa-0.49/tftpd/tftpd.c	2009-01-15 15:31:36.000000000 +0100
> +@@ -932,7 +932,10 @@ int main(int argc, char **argv)
> +             exit(EX_OSERR);
> +         }
> + #ifdef __CYGWIN__
> +-        chdir("/");             /* Cygwin chroot() bug workaround */
> ++				if (chdir("/") < 0) {			/* Cygwin chroot() bug workaround */
> ++					syslog(LOG_ERR, "chroot: %m");
> ++					exit(EX_OSERR);
> ++				}
> + #endif
> +     }
> + #ifdef HAVE_SETREGID
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd=
_arg.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_a=
rg.patch
> new file mode 100644
> index 0000000..2b9023a
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.pa=
tch
> @@ -0,0 +1,159 @@
> +diff -up tftp-hpa-0.49/config.h.cmd_arg tftp-hpa-0.49/config.h
> +--- tftp-hpa-0.49/config.h.cmd_arg	2010-04-19 15:29:10.567331454 +0200
> ++++ tftp-hpa-0.49/config.h	2010-04-20 07:33:03.133232772 +0200
> +@@ -291,6 +291,7 @@ typedef int socklen_t;
> + /* Prototypes for libxtra functions */
> +=20
> + void *xmalloc(size_t);
> ++void *xrealloc(void *, size_t);
> + char *xstrdup(const char *);
> +=20
> + #ifndef HAVE_BSD_SIGNAL
> +diff -up tftp-hpa-0.49/configure.in.cmd_arg tftp-hpa-0.49/configure.in
> +--- tftp-hpa-0.49/configure.in.cmd_arg	2008-10-21 00:08:31.000000000 +02=
00
> ++++ tftp-hpa-0.49/configure.in	2010-04-19 11:05:12.387340698 +0200
> +@@ -152,6 +152,7 @@ OBJROOT=3D`pwd`
> +=20
> + XTRA=3Dfalse
> + PA_SEARCH_LIBS_AND_ADD(xmalloc, iberty)
> ++PA_SEARCH_LIBS_AND_ADD(xrealloc, iberty)
> + PA_SEARCH_LIBS_AND_ADD(xstrdup, iberty)
> + PA_SEARCH_LIBS_AND_ADD(bsd_signal, bsd, bsdsignal)
> + PA_SEARCH_LIBS_AND_ADD(getopt_long, getopt, getopt_long)
> +diff -up tftp-hpa-0.49/lib/xrealloc.c.cmd_arg tftp-hpa-0.49/lib/xrealloc=
=2Ec
> +--- tftp-hpa-0.49/lib/xrealloc.c.cmd_arg	2010-04-19 11:05:12.387340698 +=
0200
> ++++ tftp-hpa-0.49/lib/xrealloc.c	2010-04-19 11:05:12.387340698 +0200
> +@@ -0,0 +1,20 @@
> ++/*
> ++ * xrealloc.c
> ++ *
> ++ * Simple error-checking version of realloc()
> ++ *
> ++ */
> ++
> ++#include "config.h"
> ++
> ++void *xrealloc(void *ptr, size_t size)
> ++{
> ++    void *p =3D realloc(ptr, size);
> ++
> ++    if (!p) {
> ++        fprintf(stderr, "Out of memory!\n");
> ++        exit(128);
> ++    }
> ++
> ++    return p;
> ++}
> +diff -up tftp-hpa-0.49/tftp/main.c.cmd_arg tftp-hpa-0.49/tftp/main.c
> +--- tftp-hpa-0.49/tftp/main.c.cmd_arg	2008-10-21 00:08:31.000000000 +0200
> ++++ tftp-hpa-0.49/tftp/main.c	2010-04-19 11:05:12.389329337 +0200
> +@@ -89,11 +89,14 @@ int connected;
> + const struct modes *mode;
> + #ifdef WITH_READLINE
> + char *line =3D NULL;
> ++char *remote_pth =3D NULL;
> + #else
> + char line[LBUFLEN];
> ++char remote_pth[LBUFLEN];
> + #endif
> + int margc;
> +-char *margv[20];
> ++char **margv;
> ++int sizeof_margv=3D0;
> + const char *prompt =3D "tftp> ";
> + sigjmp_buf toplevel;
> + void intr(int);
> +@@ -379,6 +382,10 @@ static void getmoreargs(const char *part
> +         free(line);
> +         line =3D NULL;
> +     }
> ++    if (remote_pth) {
> ++        free(remote_pth);
> ++        remote_pth =3D NULL;
> ++    }
> +     line =3D xmalloc(len + elen + 1);
> +     strcpy(line, partial);
> +     strcpy(line + len, eline);
> +@@ -535,6 +542,7 @@ void put(int argc, char *argv[])
> +     int fd;
> +     int n, err;
> +     char *cp, *targ;
> ++    long dirlen, namelen, lastlen=3D0;
> +=20
> +     if (argc < 2) {
> +         getmoreargs("send ", "(file) ");
> +@@ -588,9 +596,22 @@ void put(int argc, char *argv[])
> +     }
> +     /* this assumes the target is a directory */
> +     /* on a remote unix system.  hmmmm.  */
> +-    cp =3D strchr(targ, '\0');
> +-    *cp++ =3D '/';
> ++    dirlen =3D strlen(targ)+1;
> ++#ifdef WITH_READLINE
> ++    remote_pth =3D xmalloc(dirlen+1);
> ++#endif
> ++    strcpy(remote_pth, targ);
> ++    remote_pth[dirlen-1] =3D '/';
> ++    cp =3D remote_pth + dirlen;
> +     for (n =3D 1; n < argc - 1; n++) {
> ++#ifdef WITH_READLINE
> ++        namelen =3D strlen(tail(argv[n])) + 1;
> ++        if (namelen > lastlen) {
> ++            remote_pth =3D xrealloc(remote_pth, dirlen + namelen + 1);
> ++            cp =3D remote_pth + dirlen;
> ++            lastlen =3D namelen;
> ++        }
> ++#endif
> +         strcpy(cp, tail(argv[n]));
> +         fd =3D open(argv[n], O_RDONLY | mode->m_openflags);
> +         if (fd < 0) {
> +@@ -600,9 +621,9 @@ void put(int argc, char *argv[])
> +         }
> +         if (verbose)
> +             printf("putting %s to %s:%s [%s]\n",
> +-                   argv[n], hostname, targ, mode->m_mode);
> ++                   argv[n], hostname, remote_pth, mode->m_mode);
> +         sa_set_port(&peeraddr, port);
> +-        tftp_sendfile(fd, targ, mode->m_mode);
> ++        tftp_sendfile(fd, remote_pth, mode->m_mode);
> +     }
> + }
> +=20
> +@@ -801,6 +822,10 @@ static void command(void)
> +             free(line);
> +             line =3D NULL;
> +         }
> ++        if (remote_pth) {
> ++            free(remote_pth);
> ++            remote_pth =3D NULL;
> ++        }
> +         line =3D readline(prompt);
> +         if (!line)
> +             exit(0);            /* EOF */
> +@@ -872,7 +897,13 @@ struct cmd *getcmd(char *name)
> + static void makeargv(void)
> + {
> +     char *cp;
> +-    char **argp =3D margv;
> ++    char **argp;
> ++
> ++    if (!sizeof_margv) {
> ++        sizeof_margv =3D 20;
> ++        margv =3D xmalloc(sizeof_margv * sizeof(char *));
> ++    }
> ++    argp =3D margv;
> +=20
> +     margc =3D 0;
> +     for (cp =3D line; *cp;) {
> +@@ -882,6 +913,11 @@ static void makeargv(void)
> +             break;
> +         *argp++ =3D cp;
> +         margc +=3D 1;
> ++        if (margc =3D=3D sizeof_margv) {
> ++            sizeof_margv +=3D 20;
> ++            margv =3D xrealloc(margv, sizeof_margv * sizeof(char *));
> ++            argp =3D margv + margc;
> ++        }
> +         while (*cp !=3D '\0' && !isspace(*cp))
> +             cp++;
> +         if (*cp =3D=3D '\0')
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39=
-tzfix.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39=
-tzfix.patch
> new file mode 100644
> index 0000000..ded02ef
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.=
patch
> @@ -0,0 +1,18 @@
> +diff -up tftp-hpa-0.49/tftpd/tftpd.c.tzfix tftp-hpa-0.49/tftpd/tftpd.c
> +--- tftp-hpa-0.49/tftpd/tftpd.c.tzfix	2008-10-20 18:08:31.000000000 -0400
> ++++ tftp-hpa-0.49/tftpd/tftpd.c	2008-11-25 11:45:27.000000000 -0500
> +@@ -350,6 +350,14 @@ int main(int argc, char **argv)
> +     const char *pidfile =3D NULL;
> +     u_short tp_opcode;
> +=20
> ++    time_t my_time =3D 0;
> ++    struct tm* p_tm;
> ++    char envtz[10];
> ++    my_time =3D time(NULL);
> ++    p_tm =3D localtime(&my_time);
> ++    snprintf(envtz, sizeof(envtz) - 1, "UTC%+d", (p_tm->tm_gmtoff * -1)=
/3600);
> ++    setenv("TZ", envtz, 0);
> ++
> +     /* basename() is way too much of a pain from a portability standpoi=
nt */
> +=20
> +     p =3D strrchr(argv[0], '/');
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49=
-fortify-strcpy-crash.patch b/meta-networking/recipes-daemons/tftp-hpa/file=
s/tftp-hpa-0.49-fortify-strcpy-crash.patch
> new file mode 100644
> index 0000000..e9b70d4
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortif=
y-strcpy-crash.patch
> @@ -0,0 +1,26 @@
> +diff -urN tftp-hpa-0.49.orig/tftp/tftp.c tftp-hpa-0.49/tftp/tftp.c
> +--- tftp-hpa-0.49.orig/tftp/tftp.c	2008-10-20 18:08:31.000000000 -0400
> ++++ tftp-hpa-0.49/tftp/tftp.c	2009-08-05 09:47:18.072585848 -0400
> +@@ -279,15 +279,16 @@
> +             struct tftphdr *tp, const char *mode)
> + {
> +     char *cp;
> ++    size_t len;
> +=20
> +     tp->th_opcode =3D htons((u_short) request);
> +     cp =3D (char *)&(tp->th_stuff);
> +-    strcpy(cp, name);
> +-    cp +=3D strlen(name);
> +-    *cp++ =3D '\0';
> +-    strcpy(cp, mode);
> +-    cp +=3D strlen(mode);
> +-    *cp++ =3D '\0';
> ++    len =3D strlen(name) + 1;
> ++    memcpy(cp, name, len);
> ++    cp +=3D len;
> ++    len =3D strlen(mode) + 1;
> ++    memcpy(cp, mode, len);
> ++    cp +=3D len;
> +     return (cp - (char *)tp);
> + }
> +=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49=
-stats.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49=
-stats.patch
> new file mode 100644
> index 0000000..b6c9d05
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.=
patch
> @@ -0,0 +1,14 @@
> +diff -up tftp-hpa-0.49/tftp/tftp.c.stats tftp-hpa-0.49/tftp/tftp.c
> +--- tftp-hpa-0.49/tftp/tftp.c.stats	2011-01-03 15:38:34.217918067 +0100
> ++++ tftp-hpa-0.49/tftp/tftp.c	2011-01-03 15:38:37.498917014 +0100
> +@@ -400,8 +400,8 @@ static void printstats(const char *direc
> + {
> +     double delta;
> +=20
> +-    delta =3D (tstop.tv_sec + (tstop.tv_usec / 100000.0)) -
> +-        (tstart.tv_sec + (tstart.tv_usec / 100000.0));
> ++    delta =3D (tstop.tv_sec + (tstop.tv_usec / 1000000.0)) -
> ++        (tstart.tv_sec + (tstart.tv_usec / 1000000.0));
> +     if (verbose) {
> +         printf("%s %lu bytes in %.1f seconds", direction, amount, delta=
);
> +         printf(" [%.0f bit/s]", (amount * 8.) / delta);
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-=
pktinfo.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2=
-pktinfo.patch
> new file mode 100644
> index 0000000..d1fa75c
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo=
=2Epatch
> @@ -0,0 +1,23 @@
> +diff -up tftp-hpa-5.2/tftpd/recvfrom.c.test tftp-hpa-5.2/tftpd/recvfrom.c
> +--- tftp-hpa-5.2/tftpd/recvfrom.c.test	2011-12-11 23:13:52.000000000 +01=
00
> ++++ tftp-hpa-5.2/tftpd/recvfrom.c	2012-01-04 10:05:17.852042256 +0100
> +@@ -149,16 +149,16 @@ myrecvfrom(int s, void *buf, int len, un
> +=20
> +     /* Try to enable getting the return address */
> + #ifdef IP_RECVDSTADDR
> +-    if (from->sa_family =3D=3D AF_INET)
> ++    if (from->sa_family =3D=3D AF_INET || !from->sa_family)
> +         setsockopt(s, IPPROTO_IP, IP_RECVDSTADDR, &on, sizeof(on));
> + #endif
> + #ifdef IP_PKTINFO
> +-    if (from->sa_family =3D=3D AF_INET)
> ++    if (from->sa_family =3D=3D AF_INET || !from->sa_family)
> +         setsockopt(s, IPPROTO_IP, IP_PKTINFO, &on, sizeof(on));
> + #endif
> + #ifdef HAVE_IPV6
> + #ifdef IPV6_RECVPKTINFO
> +-    if (from->sa_family =3D=3D AF_INET6)
> ++    if (from->sa_family =3D=3D AF_INET6 || !from->sa_family)
> +         setsockopt(s, IPPROTO_IPV6, IPV6_RECVPKTINFO, &on, sizeof(on));
> + #endif
> + #endif
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd b=
/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
> new file mode 100644
> index 0000000..fe70163
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
> @@ -0,0 +1,18 @@
> +# default: off
> +# description: The tftp server serves files using the trivial file trans=
fer \
> +#	protocol.  The tftp protocol is often used to boot diskless \
> +#	workstations, download configuration files to network-aware printers, \
> +#	and to start the installation process for some operating systems.
> +service tftp
> +{
> +	socket_type		=3D dgram
> +	protocol		=3D udp
> +	wait			=3D yes
> +	user			=3D root
> +	server			=3D /usr/sbin/in.tftpd-hpa
> +	server_args		=3D -s /var/lib/tftpboot
> +	disable			=3D yes
> +	per_source		=3D 11
> +	cps				=3D 100 2
> +	flags			=3D IPv6
> +}
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/m=
eta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> new file mode 100644
> index 0000000..f09663d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -0,0 +1,66 @@
> +SUMMARY        =3D "Client for the Trivial File Transfer Protocol"
> +DESCRIPTION    =3D \
> +"The Trivial File Transfer Protocol (TFTP) is normally used only for \
> +booting diskless workstations.  The tftp package provides the user   \
> +interface for TFTP, which allows users to transfer files to and from a \
> +remote machine.  This program and TFTP provide very little security, \
> +and should not be enabled unless it is expressly needed."
> +DEPENDS =3D "tcp-wrappers readline"
> +SECTION =3D "network"
> +LICENSE =3D "BSD-4-Clause"
> +LIC_FILES_CHKSUM =3D "file://MCONFIG.in;startline=3D1;endline=3D9;md5=3D=
c28ba5adb43041fae4629db05c83cbdd \
> +                    file://tftp/tftp.c;startline=3D1;endline=3D32;md5=3D=
988c1cba99d70858a26cd877209857f4"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-h=
pa-${PV}.tar.bz2 \
> +           file://tftp-0.40-remap.patch \
> +           file://tftp-0.42-tftpboot.patch \
> +           file://tftp-0.49-chk_retcodes.patch \
> +           file://tftp-0.49-cmd_arg.patch \
> +           file://tftp-hpa-0.39-tzfix.patch \
> +           file://tftp-hpa-0.49-fortify-strcpy-crash.patch \
> +           file://tftp-hpa-0.49-stats.patch \
> +           file://tftp-hpa-5.2-pktinfo.patch \
> +           file://default \
> +           file://init"
> +
> +SRC_URI[md5sum] =3D "46c9bd20bbffa62f79c958c7b99aac21"
> +SRC_URI[sha256sum] =3D "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c=
9332841304d1a269"
> +
> +inherit autotools update-rc.d update-alternatives
> +
> +EXTRA_OECONF +=3D "--disable-option-checking"
> +
> +# configure.in has errors
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install() {
> +	oe_runmake install INSTALLROOT=3D${D}
> +	mv ${D}${bindir}/tftp ${D}${bindir}/tftp-hpa
> +	mv ${D}${sbindir}/in.tftpd ${D}${sbindir}/in.tftpd-hpa
> +
> +	install -m 755 -d ${D}${localstatedir}/lib/tftpboot/
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
> +	install -d ${D}${sysconfdir}/default
> +	install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
> +}
> +
> +FILES_${PN} =3D "${bindir}"
> +
> +PACKAGES +=3D "tftp-hpa-server"
> +SUMMARY_tftp-hpa-server =3D "Server for the Trivial File Transfer Protoc=
ol"
> +FILES_tftp-hpa-server =3D "${sbindir} ${sysconfdir} ${localstatedir}"
> +CONFFILES_tftp-hpa-server =3D "${sysconfdir}/default/tftpd-hpa"
> +
> +INITSCRIPT_PACKAGES =3D "tftp-hpa-server"
> +INITSCRIPT_NAME =3D "tftpd-hpa"
> +INITSCRIPT_PARAMS =3D "start 20 2 3 4 5 . stop 20 1 ."
> +
> +ALTERNATIVE_${PN} =3D "tftp"
> +ALTERNATIVE_TARGET[tftp] =3D "${bindir}/tftp-hpa"
> +ALTERNATIVE_PRIORITY =3D "50"
> +
--=20
-Joe MacDonald.
:wq

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCqdxMACgkQPN8S4W6ZZncZ7ACfULPHPpyuXIaKytkuhIunRHze
0eIAn2BKf4At6Wszu/kIKKLxRKcAtSt8
=4+3D
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
