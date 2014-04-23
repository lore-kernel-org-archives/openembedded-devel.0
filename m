Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6455A65D50
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 17:56:28 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so1051074eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NaM2gErc7pJc2QQrnyDcc7vzlaJSnwRCaBnvdr0QGEQ=;
	b=zzSmCC9+1bFKDrQdoiWs/rBIWKDB5H08aFVYUJL4xPKDFeXsPJ2gogkuNN8dIdIDAe
	QGydaMHi6/MPNSwVtYoAsiag69XBqdJyelZvn/IkdTebsgTt+IyNIsblLHEQDuYWQsmG
	0Gp4KPzi5XZh/ASGrLm8QjP/kZbN372hQffSaszY+Dod8srIcax44XHu6GWPYWnlOuP8
	vq1ZxjdNxvch7mQamnXXNLTJ/gGF5QLObW85PV0io7vVofEzmtiGAa6sGNKogwr0APRA
	y4Pkxom7nY0UKXGj8rQWTNMghFlnzTNo+qHSbr5h/2NHpFmLmrwm6bpLoOVVl4AKSMlx
	DFWA==
X-Received: by 10.15.32.206 with SMTP id a54mr64347727eev.51.1398275788745;
	Wed, 23 Apr 2014 10:56:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q41sm8269311eez.7.2014.04.23.10.56.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 10:56:27 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Apr 2014 19:56:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140423175635.GK2486@jama>
References: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH V2 1/4] postgresql: add init script and DESCRIPTION
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
X-List-Received-Date: Wed, 23 Apr 2014 17:56:31 -0000
X-Groupsio-MsgNum: 49455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xluWKNDh2/FEVhBx"
Content-Disposition: inline

--xluWKNDh2/FEVhBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 03:07:25PM +0800, Chong Lu wrote:
> 1. Add DESCRIPTION
> 2. Add init script for starting up the PostgreSQL server.
> 3. Disable krb5 by default
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../postgresql/files/postgresql-bashprofile        |    4 +
>  .../postgresql/files/postgresql.init               |  241 ++++++++++++++=
++++++
>  meta-oe/recipes-support/postgresql/postgresql.inc  |   63 ++++-
>  3 files changed, 303 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-b=
ashprofile
>  create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.i=
nit
>=20
> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-bashprof=
ile b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
> new file mode 100644
> index 0000000..1c931f3
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
> @@ -0,0 +1,4 @@
> +[ -f /etc/profile ] && source /etc/profile
> +
> +PGDATA=3D/var/lib/postgresql/data
> +export PGDATA
> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.init b/m=
eta-oe/recipes-support/postgresql/files/postgresql.init
> new file mode 100644
> index 0000000..ab46477
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/postgresql.init
> @@ -0,0 +1,241 @@
> +#!/bin/sh
> +#
> +# postgresql	This is the init script for starting up the PostgreSQL
> +#		server.
> +#
> +# chkconfig: - 64 36
> +# description: PostgreSQL database server.
> +# processname: postmaster
> +# pidfile: /var/run/postmaster.PORT.pid
> +
> +# This script is slightly unusual in that the name of the daemon (postma=
ster)
> +# is not the same as the name of the subsystem (postgresql)
> +
> +# PGVERSION is the full package version, e.g., 8.4.0
> +# Note: the specfile inserts the correct value during package build
> +PGVERSION=3D9.2.4
> +# PGMAJORVERSION is major version, e.g., 8.4 (this should match PG_VERSI=
ON)
> +PGMAJORVERSION=3D`echo "$PGVERSION" | sed 's/^\([0-9]*\.[0-9]*\).*$/\1/'`
> +
> +# Source function library.
> +. /etc/init.d/functions
> +
> +# Find the name of the script
> +NAME=3D`basename $0`
> +if [ ${NAME:0:1} =3D "S" -o ${NAME:0:1} =3D "K" ]
> +then
> +	NAME=3D${NAME:3}
> +fi
> +
> +# For SELinux we need to use 'runuser' not 'su'
> +if [ -x /sbin/runuser ]
> +then
> +    SU=3Drunuser
> +else
> +    SU=3Dsu
> +fi
> +
> +
> +# Set defaults for configuration variables
> +PGENGINE=3D/usr/bin
> +PGPORT=3D5432
> +PGDATA=3D/var/lib/postgresql/data
> +PGLOG=3D/var/lib/postgresql/pgstartup.log
> +# Value to set as postmaster process's oom_adj
> +PG_OOM_ADJ=3D-17
> +
> +# Override defaults from /etc/sysconfig/postgresql if file is present
> +[ -f /etc/default/postgresql/${NAME} ] && . /etc/default/postgresql/${NA=
ME}
> +
> +export PGDATA
> +export PGPORT
> +
> +lockfile=3D"/var/lock/subsys/${NAME}"
> +pidfile=3D"/var/run/postmaster.${PGPORT}.pid"
> +
> +script_result=3D0
> +
> +start(){
> +	[ -x "$PGENGINE/postmaster" ] || exit 5
> +
> +	PSQL_START=3D$"Starting ${NAME} service: "
> +
> +	# Make sure startup-time log file is valid
> +	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
> +	then
> +		touch "$PGLOG" || exit 4
> +		chown postgres:postgres "$PGLOG"
> +		chmod go-rwx "$PGLOG"
> +		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
> +	fi
> +
> +	# Check for the PGDATA structure
> +	if [ -f "$PGDATA/PG_VERSION" ] && [ -d "$PGDATA/base" ]
> +	then
> +		# Check version of existing PGDATA
> +		if [ x`cat "$PGDATA/PG_VERSION"` !=3D x"$PGMAJORVERSION" ]
> +		then
> +			SYSDOCDIR=3D"(Your System's documentation directory)"
> +			if [ -d "/usr/doc/postgresql-$PGVERSION" ]
> +			then
> +				SYSDOCDIR=3D/usr/doc
> +			fi
> +			if [ -d "/usr/share/doc/postgresql-$PGVERSION" ]
> +			then
> +				SYSDOCDIR=3D/usr/share/doc
> +			fi
> +			if [ -d "/usr/doc/packages/postgresql-$PGVERSION" ]
> +			then
> +				SYSDOCDIR=3D/usr/doc/packages
> +			fi
> +			if [ -d "/usr/share/doc/packages/postgresql-$PGVERSION" ]
> +			then
> +				SYSDOCDIR=3D/usr/share/doc/packages
> +			fi
> +			echo
> +			echo $"An old version of the database format was found."
> +			echo $"You need to upgrade the data format before using PostgreSQL."
> +			echo $"See $SYSDOCDIR/postgresql-$PGVERSION/README.rpm-dist for more =
information."
> +			exit 1
> +		fi
> +	else
> +		# No existing PGDATA! Warn the user to initdb it.
> +		echo
> +                echo "$PGDATA is missing. Use \"service postgresql initd=
b\" to initialize the cluster first."
> +		echo -n " [FAILED] "
> +		echo
> +		exit 1
> +	fi
> +
> +	echo -n "$PSQL_START"
> +	test x"$PG_OOM_ADJ" !=3D x && echo "$PG_OOM_ADJ" > /proc/self/oom_score=
_adj
> +	$SU -l postgres -c "$PGENGINE/postmaster -p '$PGPORT' -D '$PGDATA' ${PG=
OPTS} &" >> "$PGLOG" 2>&1 < /dev/null
> +	sleep 2
> +	pid=3D`head -n 1 "$PGDATA/postmaster.pid" 2>/dev/null`
> +	if [ "x$pid" !=3D x ]
> +	then
> +		echo -n " [ OK ]"
> +		touch "$lockfile"
> +		echo $pid > "$pidfile"
> +		echo
> +	else
> +		echo -n  " [FAILED]"
> +		echo
> +		script_result=3D1
> +	fi
> +}
> +
> +stop(){
> +	echo -n $"Stopping ${NAME} service: "
> +	if [ -e "$lockfile" ]
> +	then
> +	    $SU -l postgres -c "$PGENGINE/pg_ctl stop -D '$PGDATA' -s -m fast" =
> /dev/null 2>&1 < /dev/null
> +	    ret=3D$?
> +	    if [ $ret -eq 0 ]
> +	    then
> +		echo -n " [ OK ] "
> +		rm -f "$pidfile"
> +		rm -f "$lockfile"
> +	    else
> +		echo -n " [FAILED] "
> +		script_result=3D1
> +	    fi
> +	else
> +	    # not running; per LSB standards this is "ok"
> +	    echo -n " [ OK ] "
> +	fi
> +	echo
> +}
> +
> +restart(){
> +    stop
> +    start
> +}
> +
> +condrestart(){
> +    [ -e "$lockfile" ] && restart || :
> +}
> +
> +reload(){
> +    $SU -l postgres -c "$PGENGINE/pg_ctl reload -D '$PGDATA' -s" > /dev/=
null 2>&1 < /dev/null
> +}
> +
> +initdb(){
> +    if [ -f "$PGDATA/PG_VERSION" ]
> +    then
> +	echo -n "Data directory is not empty!"
> +	echo -n " [FAILED] "
> +	echo
> +	script_result=3D1
> +    else
> +	echo -n $"Initializing database: "
> +	if [ ! -e "$PGDATA" -a ! -h "$PGDATA" ]
> +	then
> +		mkdir -p "$PGDATA" || exit 1
> +		chown postgres:postgres "$PGDATA"
> +		chmod go-rwx "$PGDATA"
> +	fi
> +	# Clean up SELinux tagging for PGDATA
> +	[ -x /sbin/restorecon ] && /sbin/restorecon "$PGDATA"
> +
> +	# Make sure the startup-time log file is OK, too
> +	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
> +	then
> +		touch "$PGLOG" || exit 1
> +		chown postgres:postgres "$PGLOG"
> +		chmod go-rwx "$PGLOG"
> +		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
> +	fi
> +
> +	# Initialize the database
> +	$SU -l postgres -c "$PGENGINE/initdb --pgdata=3D'$PGDATA' --auth=3D'ide=
nt'" >> "$PGLOG" 2>&1 < /dev/null
> +
> +	# Create directory for postmaster log
> +	mkdir "$PGDATA/pg_log"
> +	chown postgres:postgres "$PGDATA/pg_log"
> +	chmod go-rwx "$PGDATA/pg_log"
> +
> +	if [ -f "$PGDATA/PG_VERSION" ]
> +	then
> +	    echo -n " [ OK ] "
> +	else
> +	    echo -n " [FAILED] "
> +	    script_result=3D1
> +	fi
> +	echo
> +    fi
> +}
> +
> +# See how we were called.
> +case "$1" in
> +  start)
> +	start
> +	;;
> +  stop)
> +	stop
> +	;;
> +  status)
> +	status postmaster
> +	script_result=3D$?
> +	;;
> +  restart)
> +	restart
> +	;;
> +  condrestart|try-restart)
> +	condrestart
> +	;;
> +  reload)
> +	reload
> +	;;
> +  force-reload)
> +	restart
> +	;;
> +  initdb)
> +	initdb
> +	;;
> +  *)
> +	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|rel=
oad|force-reload|initdb}"
> +	exit 2
> +esac
> +
> +exit $script_result
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgresql/postgresql.inc
> index 5f2088e..db425e7 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -1,4 +1,22 @@
> -DESCRIPTION =3D "PostgreSQL is a powerful, open source relational databa=
se system."
> +SUMMARY =3D "PostgreSQL is a powerful, open source relational database s=
ystem."
> +DESCRIPTION =3D "\
> +    PostgreSQL is an advanced Object-Relational database management syst=
em \
> +    (DBMS) that supports almost all SQL constructs (including \
> +    transactions, subselects and user-defined types and functions). The \
> +    postgresql package includes the client programs and libraries that \
> +    you'll need to access a PostgreSQL DBMS server.  These PostgreSQL \
> +    client programs are programs that directly manipulate the internal \
> +    structure of PostgreSQL databases on a PostgreSQL server. These clie=
nt \
> +    programs can be located on the same machine with the PostgreSQL \
> +    server, or may be on a remote machine which accesses a PostgreSQL \
> +    server over a network connection. This package contains the docs \
> +    in HTML for the whole package, as well as command-line utilities for=
 \
> +    managing PostgreSQL databases on a PostgreSQL server. \
> +     \
> +    If you want to manipulate a PostgreSQL database on a local or remote=
 \
> +    PostgreSQL server, you need this package. You also need to install \
> +    this package if you're installing the postgresql-server package. \
> +    "
>  HOMEPAGE =3D "http://www.postgresql.com"
>  LICENSE =3D "BSD"
>  DEPENDS =3D "zlib readline tzcode-native"
> @@ -8,23 +26,58 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  #WARNING: this recipe assumes you have the timezone compiler present in =
/usr/sbin/zic
> =20
> -SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
> +SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
> +           file://postgresql.init \
> +           file://postgresql-bashprofile \
> +"
> =20
>  LEAD_SONAME =3D "libpq.so"
> =20
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig useradd
> =20
> -EXTRA_OECONF =3D "--disable-rpath"
> -EXTRA_OECONF_sh4 =3D "--disable-spinlocks --disable-rpath"
> +EXTRA_OECONF +=3D "--enable-thread-safety --disable-rpath \
> +                 --datadir=3D${datadir}/${BPN} \
> +                 --sysconfdir=3D${sysconfdir}/${BPN} \
> +                 --without-krb5 \
> +"
> +EXTRA_OECONF_sh4 +=3D "--disable-spinlocks"
>  EXTRA_OECONF_aarch64 +=3D "--disable-spinlocks"
> =20
>  do_compile_append() {
>      cp /usr/sbin/zic ${S}/src/timezone/
>  }
> =20
> +# server needs to configure user and group
> +usernum =3D "28"
> +groupnum =3D "28"
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "-M -g postgres -o -r -d ${localstatedir}/lib/${=
BPN} \
> +    -s /bin/bash -c 'PostgreSQL Server' -u ${usernum} postgres"
> +GROUPADD_PARAM_${PN} =3D "-g ${groupnum} -o -r postgres"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}"
> +INITSCRIPT_NAME =3D "${BPN}-server"
> +INITSCRIPT_PARAMS =3D "start 64 . stop 36 0 1 2 3 4 5 6 ."
> +
> +do_install_append() {
> +	# install dirs and server init
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/${BPN}.init \
> +	    ${D}${sysconfdir}/init.d/${BPN}-server
> +	sed -i -e "s/^PGVERSION=3D.*$/PGVERSION=3D${PV}/g" \
> +	    ${D}${sysconfdir}/init.d/${BPN}-server
> +	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
> +	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
> +	install -m 644 ${WORKDIR}/${BPN}-bashprofile \
> +	    ${D}${localstatedir}/lib/${BPN}/.bash_profile
> +	chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
> +	# multiple server config directory
> +	install -d -m 700 ${D}${sysconfdir}/default/${BPN}
> +}

We're using 4 spaces for indentation, I've changed all 4 patches to use
that when cherry-picking them to master-next, but next time please use
correct indentation.

> +
>  SSTATE_SCAN_FILES +=3D "Makefile.global"
> =20
>  PACKAGES =3D+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xluWKNDh2/FEVhBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNX/tMACgkQN1Ujt2V2gBxlEQCfSurM/1cPJWIck/WrZ1mYB1zw
AfQAnjwnlPLNt0GnG4Qjf0H+E5+oNqXv
=X8kQ
-----END PGP SIGNATURE-----

--xluWKNDh2/FEVhBx--
