Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 57A1D65D94
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:26:37 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2941135eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Hlz4GLqEpJ15zRJiaftt1i2q7CllP195BginWX7SUiQ=;
	b=ZyinIveL7EkIu4T7J6q4wewYnJwR7rHbVKAAhua2gX670+LFuFo5hdCaahojN8nZm7
	tW2la8n64W+I+N9Dj53pRqHN+mTbL6Ok9AD7VpNeafpzfn6f3w/wzrehbAPNuq7VfIoo
	A7cRJZQMjSpY25pyqQ+s9o5u8PitpUNfdTuurezgTZOfIYzUNFb2FHfc4r6Zps9c2boX
	vjGFNRQbvpSM2nSoR3YeOMW6CPhutGKWrmvUPUvxwBeuj/dKglWjH7nuDV/zUGc4Iq3O
	W8rFyppyfDrf1DOTsZ+7L2DqsQcmzQULmeO/R53VDjy6vh8oRemif7KVWEz7TBmHY29d
	8VeQ==
X-Received: by 10.15.48.129 with SMTP id h1mr38376684eew.57.1397993198281;
	Sun, 20 Apr 2014 04:26:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm93810742eei.24.2014.04.20.04.26.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:26:37 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:26:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420112642.GT2486@jama>
References: <1397724616-12883-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397724616-12883-1-git-send-email-Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] postgresql: add init script and enable some bindings
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
X-List-Received-Date: Sun, 20 Apr 2014 11:26:38 -0000
X-Groupsio-MsgNum: 49327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00zH/wdDQmWzr4bS"
Content-Disposition: inline

--00zH/wdDQmWzr4bS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 04:50:16PM +0800, Chong Lu wrote:
> 1. Add init script for starting up the PostgreSQL server.
> 2. Add DESCRIPTION
> 3. Make tests, plperl, plpython, pltcl subpackages as dynamic in case
> other packages runtime depend on them.
> 4. Disable krb5 by default and enable pam, openssl, python, uuid, libxml,
> tcl, nls, libxml and perl bindings.
> 5. Make contrib and split them in postgresql-contrib.
> 6. Multilib builds set the package name (PN) to both foo and lib32-foo
> breaking build.use BPN instead to get the Base package name.

I think there should be only one -dbg package, can you split this huge
patch into smaller patches and resend?

It's hard to review with so many changes.

>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../postgresql/files/postgresql-bashprofile        |    4 +
>  .../postgresql/files/postgresql.init               |  241 ++++++++++++++
>  .../postgresql/files/postgresql.pam                |    4 +
>  meta-oe/recipes-support/postgresql/postgresql.inc  |  330 ++++++++++++++=
++++--
>  4 files changed, 560 insertions(+), 19 deletions(-)
>  create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-b=
ashprofile
>  create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.i=
nit
>  create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.p=
am
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
> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.pam b/me=
ta-oe/recipes-support/postgresql/files/postgresql.pam
> new file mode 100644
> index 0000000..0b6fdc5
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/postgresql.pam
> @@ -0,0 +1,4 @@
> +#%PAM-1.0
> +auth            include         common-auth
> +account         include         common-account
> +password        include         common-password
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgresql/postgresql.inc
> index 5f2088e..1d25a53 100644
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
> @@ -6,32 +24,198 @@ INC_PR =3D "r0"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> -#WARNING: this recipe assumes you have the timezone compiler present in =
/usr/sbin/zic
> -
> -SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
> +SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
> +           file://postgresql.init \
> +           file://postgresql-bashprofile \
> +           file://postgresql.pam \
> +"
> =20
>  LEAD_SONAME =3D "libpq.so"
> =20
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
> +
> +enable_pam =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)=
}"
> +PACKAGECONFIG ??=3D "${enable_pam} openssl python uuid libxml tcl nls li=
bxml perl"
> +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam,"
> +PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl,"
> +PACKAGECONFIG[python] =3D "--with-python,--wsithout-python,python,python"
> +PACKAGECONFIG[uuid] =3D "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
> +# when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CRO=
SS
> +PACKAGECONFIG[tcl] =3D \
> +    "--with-tcl --with-tclconfig=3D${STAGING_BINDIR_CROSS},--without-tcl=
,tcl,"
> +PACKAGECONFIG[nls] =3D "--enable-nls,--disable-nls,,"
> +PACKAGECONFIG[libxml] =3D "--with-libxml,--without-libxml,libxml2,libxml=
2"
> +PACKAGECONFIG[perl] =3D "--with-perl,--without-perl,perl,perl"
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
> +PACKAGES_DYNAMIC +=3D "^${PN}-plperl ^${PN}-plperl-dbg \
> +                     ^${PN}-pltcl ^${PN}-pltcl-dbg \
> +                     ^${PN}-plpython ^${PN}-plpython-dbg \
> +"
> +
> +python populate_packages_prepend() {
> +
> +    def fill_more(name, dbg=3DTrue):
> +        if name is None or name.strip() =3D=3D "":
> +            return
> +
> +        fpack=3Dd.getVar('PACKAGES') or ""
> +        fpack=3D"${PN}-" + name + " " + fpack
> +        if dbg:
> +            fpack=3D"${PN}-" + name + "-dbg" + " " + fpack
> +        d.setVar('PACKAGES', fpack)
> +
> +    conf=3D(d.getVar('PACKAGECONFIG', True) or "").split()
> +    pack=3Dd.getVar('PACKAGES') or ""
> +    bb.debug(1, "PACKAGECONFIG=3D%s" % conf)
> +    bb.debug(1, "PACKAGES1=3D%s" % pack )
> +
> +    if "perl" in conf :
> +        fill_more("plperl")
> +
> +    if "tcl" in conf:
> +        fill_more("pltcl")
> +
> +    if "python" in conf:
> +        fill_more("plpython")
> +
> +    pack=3Dd.getVar('PACKAGES', True) or ""
> +    bb.debug(1, "PACKAGES2=3D%s" % pack)
> +
> +}
> +
> +do_configure() {
> +	# do_configure_prepend
> +	# make sure configure finds python includdirs with these envs
> +	export BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> +	       STAGING_INCDIR=3D${STAGING_INCDIR} \
> +	       STAGING_LIBDIR=3D${STAGING_LIBDIR}
> +
> +	# do_configure
> +	autotools_do_configure
> +
> +	# do_configure_append
> +	# workaround perl package related bugs
> +	sed -i -e "s:-L/usr/local/lib:-L=3D/usr/local/lib:g" \
> +	    ${S}/src/Makefile.global
> +	LIBPNA=3D"\${STAGING_LIBDIR_NATIVE}/perl-native"
> +	LIBNA=3D"\${STAGING_LIBDIR_NATIVE}"
> +	BLIBNA=3D"\${STAGING_BASE_LIBDIR_NATIVE}"
> +	sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
> +	    ${S}/src/Makefile.global
> +	sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
> +	    ${S}/src/Makefile.global
> +	# remove the rpath, replace with correct lib path
> +	sed -i \
> +	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
> +	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${BLIBNA}::g" \
> +	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${LIBNA}::g" \
> +	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${BLIBNA}::g" \
> +	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
> +	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
> +	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
> +	${S}/src/Makefile.global
> +
> +	# workaround perl package's libperl.so problem
> +	# we are using perlnative so this perl should have same version
> +	perl_version=3D`perl -v 2>/dev/null | \
> +            sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\=
1/p'`
> +	if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
> +	     ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
> +		ln -sf ../../../libperl.so.5 \
> +		    ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
> +	fi
> +}
> +
>  do_compile_append() {
> -    cp /usr/sbin/zic ${S}/src/timezone/
> +	oe_runmake -C contrib all
> +}
> +
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
> +	# install contrib
> +	oe_runmake DESTDIR=3D${D} -C contrib install
> +	# install tutorial
> +	install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
> +	install ${S}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
> +
> +	# install COPYRIGHT README HISTORY
> +	install -d -m 0755 ${D}${docdir}/${BPN}
> +	for i in ${S}/{COPYRIGHT,README,HISTORY} \
> +            ${S}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template};=
 do
> +		[ -f $i ] && install $i ${D}${docdir}/${BPN}
> +	done
> +
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
> +
> +	if [ "${@d.getVar('enable_pam', True)}" =3D "pam" ]; then
> +		install -d ${D}${sysconfdir}/pam.d
> +		install -m 644 ${WORKDIR}/postgresql.pam \
> +		    ${D}${sysconfdir}/pam.d/postgresql
> +	fi
>  }
> =20
>  SSTATE_SCAN_FILES +=3D "Makefile.global"
> =20
>  PACKAGES =3D+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
>               libecpg-compat-dbg libecpg-compat \
> -             libecpg-dbg libecpg libecpg-dev \
> -             libpq-dbg libpq libpq-dev \=20
> -             libpgtypes-dbg libpgtypes "
> +             libecpg-dbg libecpg libecpg-dev libecpg-staticdev libecpg-d=
oc \
> +             libpq-dbg libpq libpq-dev libpq-staticdev \
> +             libpgtypes-dbg libpgtypes \
> +             ${PN}-contrib ${PN}-contrib-dbg \
> +"
> +
> +FILES_${PN} +=3D "${sysconfdir}/init.d/${BPN}-server \
> +    ${localstatedir}/lib/${BPN}/data ${localstatedir}/lib/${BPN}/backups=
 \
> +    ${localstatedir}/lib/${BPN}/.bash_profile ${sysconfdir}/default/${BP=
N} \
> +    ${libdir}/${BPN}/dict_snowball.so ${libdir}/${BPN}/plpgsql.so \
> +    ${libdir}/${BPN}/euc2004_sjis2004.so \
> +    ${libdir}/${BPN}/libpqwalreceiver.so \
> +    ${libdir}/${BPN}/*_and_*.so \
> +    ${@'${sysconfdir}/pam.d/postgresql' \
> +       if 'pam' =3D=3D d.getVar('enable_pam', True) \
> +       else ''} \
> +"
> +
> +FILES_${PN}-dbg +=3D " ${libdir}/${BPN}/.debug/dict_snowball.so \
> +    ${libdir}/${BPN}/.debug/plpgsql.so \
> +    ${libdir}/${BPN}/.debug/euc2004_sjis2004.so \
> +    ${libdir}/${BPN}/.debug/libpqwalreceiver.so \
> +    ${libdir}/${BPN}/.debug/*_and_*.so \
> +"
> =20
>  FILES_${PN}-client =3D "${bindir}/clusterdb \
>                  ${bindir}/createdb \
> @@ -47,32 +231,140 @@ FILES_${PN}-client =3D "${bindir}/clusterdb \
>                  ${bindir}/reindexdb \
>                  ${bindir}/vacuumdb \
>                  ${bindir}/vacuumlo \
> -                ${datadir}/${PN}/psqlrc.sample"
> +                ${datadir}/${BPN}/psqlrc.sample"
> +
> +FILES_${PN}-client-doc =3D "${mandir}/man1/clusterdb.* \
> +    ${mandir}/man1/createdb.*   ${mandir}/man1/createlang.* \
> +    ${mandir}/man1/createuser.* ${mandir}/man1/dropdb.* \
> +    ${mandir}/man1/droplang.*   ${mandir}/man1/dropuser.* \
> +    ${mandir}/man1/pg_dump.*    ${mandir}/man1/pg_dumpall.* \
> +    ${mandir}/man1/pg_restore.* ${mandir}/man1/psql.* \
> +    ${mandir}/man1/reindexdb.*  ${mandir}/man1/vacuumdb.* \
> +    ${mandir}/man7/* \
> +"
> +
> +FILES_${PN}-doc +=3D "${docdir}/${BPN}/html ${libdir}/${BPN}/tutorial/ \
> +    ${mandir}/man1/initdb.* ${mandir}/man1/pg_controldata.* \
> +    ${mandir}/man1/pg_ctl.* ${mandir}/man1/pg_resetxlog.* \
> +    ${mandir}/man1/postgres.* ${mandir}/man1/postmaster.* \
> +"
> =20
> -FILES_${PN}-doc +=3D "${prefix}/doc/"
> -FILES_${PN}-timezone =3D "${datadir}/${PN}/timezone"
> -FILES_${PN}-server-dev =3D "${includedir}/${PN}/server"
> +FILES_${PN}-timezone =3D "${datadir}/${BPN}/timezone \
> +    ${datadir}/${BPN}/timezonesets \
> +"
> +RDEPENDS_${PN} +=3D "${PN}-timezone"
> +FILES_${PN}-server-dev =3D "${includedir}/${BPN}/server"
> =20
>  FILES_libecpg =3D "${libdir}/libecpg*${SOLIBS}"
>  FILES_libecpg-dbg =3D "${libdir}/.debug/libecpg*"
>  FILES_libecpg-dev =3D "${libdir}/libecpg*${SOLIBSDEV} \
>                       ${libdir}/libpgtypes*${SOLIBSDEV} \
> -                     ${includedir}/ecpg*.h ${includedir}/${PN}/ecpg*.h \
> -                     ${includedir}/pgtypes*.h ${includedir}/${PN}/inform=
ix \
> +                     ${includedir}/ecpg*.h ${includedir}/${BPN}/ecpg*.h \
> +                     ${includedir}/pgtypes*.h ${includedir}/${BPN}/infor=
mix \
>                       ${includedir}/sql3types.h ${includedir}/sqlca.h"
> +FILES_libecpg-doc =3D "${mandir}/man1/ecpg.*"
>  FILES_libecpg-staticdev =3D "${libdir}/libecpg*.a"
>  SECTION_libecpg-staticdev =3D "devel"
>  RDEPENDS_libecpg-staticdev =3D "libecpg-dev (=3D ${EXTENDPKGV})"
> =20
>  FILES_libpq =3D "${libdir}/libpq*${SOLIBS}"
> -FILES_libpq-dbg =3D "${libdir}/.debug/libpq* ${libdir}/${PN}/pgxs/src/te=
st/regress/.debug/*"
> +FILES_libpq-dbg =3D "${libdir}/.debug/libpq* ${libdir}/${BPN}/pgxs/src/t=
est/regress/.debug/*"
>  FILES_libpq-dev =3D "${libdir}/libpq*${SOLIBSDEV} \
>                     ${includedir}"
> -FILES_libpq-staticdev =3D "${libdir}/libpq*.a"
> +FILES_libpq-staticdev =3D "${libdir}/libpq*.a ${libdir}/libpgport.a"
>  SECTION_libpq-staticdev =3D "devel"
>  RDEPENDS_libpq-staticdev =3D "libpq-dev (=3D ${EXTENDPKGV})"
> =20
>  FILES_libecpg-compat =3D "${libdir}/libecpg_compat*${SOLIBS}"
>  FILES_libecpg-compat-dbg =3D "${libdir}/.debug/libecpg_compat*"
> +FILES_libecpg-compat-dev =3D "${libdir}/libecpg_compat*${SOLIBS}"
>  FILES_libpgtypes =3D "${libdir}/libpgtypes*${SOLIBS}"
>  FILES_libpgtypes-dbg =3D "${libdir}/.debug/libpgtypes*"
> +FILES_libpgtypes-staticdev =3D "${libdir}/libpgtypes*.a"
> +FILES_libpgtypes-dev =3D "${libdir}/libpgtypes*${SOLIBS} ${includedir}/p=
gtypes*.h"
> +
> +FILES_${PN}-contrib =3D " ${bindir}/oid2name ${bindir}/pg_standby \
> +    ${bindir}/pgbench ${bindir}/vacuumlo \
> +    ${S}/contrib/spi/*.example \
> +    ${libdir}/${BPN}/_int.so ${libdir}/${BPN}/adminpack.so \
> +    ${libdir}/${BPN}/autoinc.so ${libdir}/${BPN}/auto_explain.so \
> +    ${libdir}/${BPN}/auth_delay.so ${libdir}/${BPN}/btree_gin.so \
> +    ${libdir}/${BPN}/btree_gist.so ${libdir}/${BPN}/.so \
> +    ${libdir}/${BPN}/chkpass.so ${libdir}/${BPN}/citext.so \
> +    ${libdir}/${BPN}/cube.so ${libdir}/${BPN}/dblink.so \
> +    ${libdir}/${BPN}/dict_int.so ${libdir}/${BPN}/dict_xsyn.so \
> +    ${libdir}/${BPN}/dummy_seclabel.so ${libdir}/${BPN}/earthdistance.so=
 \
> +    ${libdir}/${BPN}/file_fdw.so ${libdir}/${BPN}/fuzzystrmatch.so \
> +    ${libdir}/${BPN}/hstore.so ${libdir}/${BPN}/insert_username.so \
> +    ${libdir}/${BPN}/isn.so ${libdir}/${BPN}/lo.so \
> +    ${libdir}/${BPN}/ltree.so ${libdir}/${BPN}/moddatetime.so \
> +    ${libdir}/${BPN}/pageinspect.so ${libdir}/${BPN}/pg_buffercache.so \
> +    ${libdir}/${BPN}/pg_freespacemap.so ${libdir}/${BPN}/pg_trgm.so \
> +    ${libdir}/${BPN}/pgcrypto.so ${libdir}/${BPN}/pgrowlocks.so \
> +    ${libdir}/${BPN}/pgstattuple.so ${libdir}/${BPN}/pg_stat_statements.=
so \
> +    ${libdir}/${BPN}/refint.so ${libdir}/${BPN}/seg.so \
> +    ${libdir}/${BPN}/sslinfo.so \
> +    ${libdir}/${BPN}/tablefunc.so \
> +    ${libdir}/${BPN}/test_parser.so ${libdir}/${BPN}/timetravel.so \
> +    ${libdir}/${BPN}/tsearch2.so ${libdir}/${BPN}/uuid-ossp.so \
> +    ${libdir}/${BPN}/pgxml.so ${libdir}/${BPN}/passwordcheck.so \
> +    ${libdir}/${BPN}/pg_upgrade_support.so ${libdir}/${BPN}/.so \
> +    ${libdir}/${BPN}/unaccent.so \
> +"
> +FILES_${PN}-contrib-dbg =3D " \
> +    ${libdir}/${BPN}/.debug/_int.so ${libdir}/${BPN}/.debug/adminpack.so=
 \
> +    ${libdir}/${BPN}/.debug/autoinc.so ${libdir}/${BPN}/.debug/auto_expl=
ain.so \
> +    ${libdir}/${BPN}/.debug/auth_delay.so ${libdir}/${BPN}/.debug/btree_=
gin.so \
> +    ${libdir}/${BPN}/.debug/btree_gist.so ${libdir}/${BPN}/.debug/.so \
> +    ${libdir}/${BPN}/.debug/chkpass.so ${libdir}/${BPN}/.debug/citext.so=
 \
> +    ${libdir}/${BPN}/.debug/cube.so ${libdir}/${BPN}/.debug/dblink.so \
> +    ${libdir}/${BPN}/.debug/dict_int.so ${libdir}/${BPN}/.debug/dict_xsy=
n.so \
> +    ${libdir}/${BPN}/.debug/dummy_seclabel.so \
> +    ${libdir}/${BPN}/.debug/earthdistance.so \
> +    ${libdir}/${BPN}/.debug/file_fdw.so ${libdir}/${BPN}/.debug/fuzzystr=
match.so \
> +    ${libdir}/${BPN}/.debug/hstore.so ${libdir}/${BPN}/.debug/insert_use=
rname.so \
> +    ${libdir}/${BPN}/.debug/isn.so ${libdir}/${BPN}/.debug/lo.so \
> +    ${libdir}/${BPN}/.debug/ltree.so ${libdir}/${BPN}/.debug/moddatetime=
=2Eso \
> +    ${libdir}/${BPN}/.debug/pageinspect.so \
> +    ${libdir}/${BPN}/.debug/pg_buffercache.so \
> +    ${libdir}/${BPN}/.debug/pg_freespacemap.so \
> +    ${libdir}/${BPN}/.debug/pg_trgm.so \
> +    ${libdir}/${BPN}/.debug/pgcrypto.so ${libdir}/${BPN}/.debug/pgrowloc=
ks.so \
> +    ${libdir}/${BPN}/.debug/pgstattuple.so \
> +    ${libdir}/${BPN}/.debug/pg_stat_statements.so \
> +    ${libdir}/${BPN}/.debug/refint.so ${libdir}/${BPN}/.debug/seg.so \
> +    ${libdir}/${BPN}/.debug/sslinfo.so \
> +    ${libdir}/${BPN}/.debug/tablefunc.so \
> +    ${libdir}/${BPN}/.debug/test_parser.so ${libdir}/${BPN}/.debug/timet=
ravel.so \
> +    ${libdir}/${BPN}/.debug/tsearch2.so ${libdir}/${BPN}/.debug/uuid-oss=
p.so \
> +    ${libdir}/${BPN}/.debug/pgxml.so ${libdir}/${BPN}/.debug/passwordche=
ck.so \
> +    ${libdir}/${BPN}/.debug/pg_upgrade_support.so \
> +    ${libdir}/${BPN}/.debug/unaccent.so \
> +"
> +DESCRIPTION_${PN}-contrib =3D "The postgresql-contrib package contains \
> +    contributed packages that are included in the PostgreSQL distributio=
n."
> +
> +FILES_${PN}-pltcl =3D "${libdir}/${BPN}/pltcl.so ${bindir}/pltcl_delmod \
> +    ${binddir}/pltcl_listmod ${bindir}/pltcl_loadmod  \
> +    ${datadir}/${BPN}/unknown.pltcl"
> +FILES_${PN}-pltcl-dbg =3D "${libdir}/${BPN}/.debug/pltcl.so"
> +SUMMARY_${PN}-pltcl =3D "The Tcl procedural language for PostgreSQL"
> +DESCRIPTION_${PN}-pltcl =3D "PostgreSQL is an advanced Object-Relational=
 \
> +    database management system.  The postgresql-pltcl package contains t=
he PL/Tcl \
> +    procedural language for the backend."
> +
> +FILES_${PN}-plperl =3D "${libdir}/${BPN}/plperl.so"
> +FILES_${PN}-plperl-dbg =3D "${libdir}/${BPN}/.debug/plperl.so"
> +SUMMARY_${PN}-plperl =3D "The Perl procedural language for PostgreSQL"
> +DESCRIPTION_${PN}-plperl =3D "PostgreSQL is an advanced Object-Relationa=
l \
> +    database management system.  The postgresql-plperl package contains =
the \
> +    PL/Perl procedural language for the backend."
> +
> +# In version 8, it will be plpython.so
> +# In version 9, it might be plpython{2,3}.so depending on python2 or 3
> +FILES_${PN}-plpython =3D "${libdir}/${BPN}/plpython*.so"
> +FILES_${PN}-plpython-dbg =3D "${libdir}/${BPN}/.debug/plpython*.so"
> +SUMMARY_${PN}-plpython =3D "The Python procedural language for PostgreSQ=
L"
> +DESCRIPTION_${PN}-plpython =3D "PostgreSQL is an advanced Object-Relatio=
nal \
> +    database management system.  The postgresql-plpython package contain=
s \
> +    the PL/Python procedural language for the backend."
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

--00zH/wdDQmWzr4bS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrvIACgkQN1Ujt2V2gBy4JACglOMe8BYXV1ybnfNhT4GL4dF1
wYUAn1FOYJTr8gzmljsbP++bWfKF0f4c
=DoxF
-----END PGP SIGNATURE-----

--00zH/wdDQmWzr4bS--
