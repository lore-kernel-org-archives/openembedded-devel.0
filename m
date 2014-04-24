Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFDE65DB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 07:19:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3O7JBKA006180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 00:19:11 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 24 Apr 2014 00:19:10 -0700
Message-ID: <5358BAEB.8090602@windriver.com>
Date: Thu, 24 Apr 2014 15:19:07 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
	<20140423175635.GK2486@jama>
In-Reply-To: <20140423175635.GK2486@jama>
X-Originating-IP: [128.224.162.204]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 24 Apr 2014 07:19:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/24/2014 01:56 AM, Martin Jansa wrote:
> On Tue, Apr 22, 2014 at 03:07:25PM +0800, Chong Lu wrote:
>> 1. Add DESCRIPTION
>> 2. Add init script for starting up the PostgreSQL server.
>> 3. Disable krb5 by default
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   .../postgresql/files/postgresql-bashprofile        |    4 +
>>   .../postgresql/files/postgresql.init               |  241 ++++++++++++++++++++
>>   meta-oe/recipes-support/postgresql/postgresql.inc  |   63 ++++-
>>   3 files changed, 303 insertions(+), 5 deletions(-)
>>   create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
>>   create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.init
>>
>> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
>> new file mode 100644
>> index 0000000..1c931f3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
>> @@ -0,0 +1,4 @@
>> +[ -f /etc/profile ] && source /etc/profile
>> +
>> +PGDATA=/var/lib/postgresql/data
>> +export PGDATA
>> diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.init b/meta-oe/recipes-support/postgresql/files/postgresql.init
>> new file mode 100644
>> index 0000000..ab46477
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/postgresql/files/postgresql.init
>> @@ -0,0 +1,241 @@
>> +#!/bin/sh
>> +#
>> +# postgresql	This is the init script for starting up the PostgreSQL
>> +#		server.
>> +#
>> +# chkconfig: - 64 36
>> +# description: PostgreSQL database server.
>> +# processname: postmaster
>> +# pidfile: /var/run/postmaster.PORT.pid
>> +
>> +# This script is slightly unusual in that the name of the daemon (postmaster)
>> +# is not the same as the name of the subsystem (postgresql)
>> +
>> +# PGVERSION is the full package version, e.g., 8.4.0
>> +# Note: the specfile inserts the correct value during package build
>> +PGVERSION=9.2.4
>> +# PGMAJORVERSION is major version, e.g., 8.4 (this should match PG_VERSION)
>> +PGMAJORVERSION=`echo "$PGVERSION" | sed 's/^\([0-9]*\.[0-9]*\).*$/\1/'`
>> +
>> +# Source function library.
>> +. /etc/init.d/functions
>> +
>> +# Find the name of the script
>> +NAME=`basename $0`
>> +if [ ${NAME:0:1} = "S" -o ${NAME:0:1} = "K" ]
>> +then
>> +	NAME=${NAME:3}
>> +fi
>> +
>> +# For SELinux we need to use 'runuser' not 'su'
>> +if [ -x /sbin/runuser ]
>> +then
>> +    SU=runuser
>> +else
>> +    SU=su
>> +fi
>> +
>> +
>> +# Set defaults for configuration variables
>> +PGENGINE=/usr/bin
>> +PGPORT=5432
>> +PGDATA=/var/lib/postgresql/data
>> +PGLOG=/var/lib/postgresql/pgstartup.log
>> +# Value to set as postmaster process's oom_adj
>> +PG_OOM_ADJ=-17
>> +
>> +# Override defaults from /etc/sysconfig/postgresql if file is present
>> +[ -f /etc/default/postgresql/${NAME} ] && . /etc/default/postgresql/${NAME}
>> +
>> +export PGDATA
>> +export PGPORT
>> +
>> +lockfile="/var/lock/subsys/${NAME}"
>> +pidfile="/var/run/postmaster.${PGPORT}.pid"
>> +
>> +script_result=0
>> +
>> +start(){
>> +	[ -x "$PGENGINE/postmaster" ] || exit 5
>> +
>> +	PSQL_START=$"Starting ${NAME} service: "
>> +
>> +	# Make sure startup-time log file is valid
>> +	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
>> +	then
>> +		touch "$PGLOG" || exit 4
>> +		chown postgres:postgres "$PGLOG"
>> +		chmod go-rwx "$PGLOG"
>> +		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
>> +	fi
>> +
>> +	# Check for the PGDATA structure
>> +	if [ -f "$PGDATA/PG_VERSION" ] && [ -d "$PGDATA/base" ]
>> +	then
>> +		# Check version of existing PGDATA
>> +		if [ x`cat "$PGDATA/PG_VERSION"` != x"$PGMAJORVERSION" ]
>> +		then
>> +			SYSDOCDIR="(Your System's documentation directory)"
>> +			if [ -d "/usr/doc/postgresql-$PGVERSION" ]
>> +			then
>> +				SYSDOCDIR=/usr/doc
>> +			fi
>> +			if [ -d "/usr/share/doc/postgresql-$PGVERSION" ]
>> +			then
>> +				SYSDOCDIR=/usr/share/doc
>> +			fi
>> +			if [ -d "/usr/doc/packages/postgresql-$PGVERSION" ]
>> +			then
>> +				SYSDOCDIR=/usr/doc/packages
>> +			fi
>> +			if [ -d "/usr/share/doc/packages/postgresql-$PGVERSION" ]
>> +			then
>> +				SYSDOCDIR=/usr/share/doc/packages
>> +			fi
>> +			echo
>> +			echo $"An old version of the database format was found."
>> +			echo $"You need to upgrade the data format before using PostgreSQL."
>> +			echo $"See $SYSDOCDIR/postgresql-$PGVERSION/README.rpm-dist for more information."
>> +			exit 1
>> +		fi
>> +	else
>> +		# No existing PGDATA! Warn the user to initdb it.
>> +		echo
>> +                echo "$PGDATA is missing. Use \"service postgresql initdb\" to initialize the cluster first."
>> +		echo -n " [FAILED] "
>> +		echo
>> +		exit 1
>> +	fi
>> +
>> +	echo -n "$PSQL_START"
>> +	test x"$PG_OOM_ADJ" != x && echo "$PG_OOM_ADJ" > /proc/self/oom_score_adj
>> +	$SU -l postgres -c "$PGENGINE/postmaster -p '$PGPORT' -D '$PGDATA' ${PGOPTS} &" >> "$PGLOG" 2>&1 < /dev/null
>> +	sleep 2
>> +	pid=`head -n 1 "$PGDATA/postmaster.pid" 2>/dev/null`
>> +	if [ "x$pid" != x ]
>> +	then
>> +		echo -n " [ OK ]"
>> +		touch "$lockfile"
>> +		echo $pid > "$pidfile"
>> +		echo
>> +	else
>> +		echo -n  " [FAILED]"
>> +		echo
>> +		script_result=1
>> +	fi
>> +}
>> +
>> +stop(){
>> +	echo -n $"Stopping ${NAME} service: "
>> +	if [ -e "$lockfile" ]
>> +	then
>> +	    $SU -l postgres -c "$PGENGINE/pg_ctl stop -D '$PGDATA' -s -m fast" > /dev/null 2>&1 < /dev/null
>> +	    ret=$?
>> +	    if [ $ret -eq 0 ]
>> +	    then
>> +		echo -n " [ OK ] "
>> +		rm -f "$pidfile"
>> +		rm -f "$lockfile"
>> +	    else
>> +		echo -n " [FAILED] "
>> +		script_result=1
>> +	    fi
>> +	else
>> +	    # not running; per LSB standards this is "ok"
>> +	    echo -n " [ OK ] "
>> +	fi
>> +	echo
>> +}
>> +
>> +restart(){
>> +    stop
>> +    start
>> +}
>> +
>> +condrestart(){
>> +    [ -e "$lockfile" ] && restart || :
>> +}
>> +
>> +reload(){
>> +    $SU -l postgres -c "$PGENGINE/pg_ctl reload -D '$PGDATA' -s" > /dev/null 2>&1 < /dev/null
>> +}
>> +
>> +initdb(){
>> +    if [ -f "$PGDATA/PG_VERSION" ]
>> +    then
>> +	echo -n "Data directory is not empty!"
>> +	echo -n " [FAILED] "
>> +	echo
>> +	script_result=1
>> +    else
>> +	echo -n $"Initializing database: "
>> +	if [ ! -e "$PGDATA" -a ! -h "$PGDATA" ]
>> +	then
>> +		mkdir -p "$PGDATA" || exit 1
>> +		chown postgres:postgres "$PGDATA"
>> +		chmod go-rwx "$PGDATA"
>> +	fi
>> +	# Clean up SELinux tagging for PGDATA
>> +	[ -x /sbin/restorecon ] && /sbin/restorecon "$PGDATA"
>> +
>> +	# Make sure the startup-time log file is OK, too
>> +	if [ ! -e "$PGLOG" -a ! -h "$PGLOG" ]
>> +	then
>> +		touch "$PGLOG" || exit 1
>> +		chown postgres:postgres "$PGLOG"
>> +		chmod go-rwx "$PGLOG"
>> +		[ -x /sbin/restorecon ] && /sbin/restorecon "$PGLOG"
>> +	fi
>> +
>> +	# Initialize the database
>> +	$SU -l postgres -c "$PGENGINE/initdb --pgdata='$PGDATA' --auth='ident'" >> "$PGLOG" 2>&1 < /dev/null
>> +
>> +	# Create directory for postmaster log
>> +	mkdir "$PGDATA/pg_log"
>> +	chown postgres:postgres "$PGDATA/pg_log"
>> +	chmod go-rwx "$PGDATA/pg_log"
>> +
>> +	if [ -f "$PGDATA/PG_VERSION" ]
>> +	then
>> +	    echo -n " [ OK ] "
>> +	else
>> +	    echo -n " [FAILED] "
>> +	    script_result=1
>> +	fi
>> +	echo
>> +    fi
>> +}
>> +
>> +# See how we were called.
>> +case "$1" in
>> +  start)
>> +	start
>> +	;;
>> +  stop)
>> +	stop
>> +	;;
>> +  status)
>> +	status postmaster
>> +	script_result=$?
>> +	;;
>> +  restart)
>> +	restart
>> +	;;
>> +  condrestart|try-restart)
>> +	condrestart
>> +	;;
>> +  reload)
>> +	reload
>> +	;;
>> +  force-reload)
>> +	restart
>> +	;;
>> +  initdb)
>> +	initdb
>> +	;;
>> +  *)
>> +	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|initdb}"
>> +	exit 2
>> +esac
>> +
>> +exit $script_result
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
>> index 5f2088e..db425e7 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>> @@ -1,4 +1,22 @@
>> -DESCRIPTION = "PostgreSQL is a powerful, open source relational database system."
>> +SUMMARY = "PostgreSQL is a powerful, open source relational database system."
>> +DESCRIPTION = "\
>> +    PostgreSQL is an advanced Object-Relational database management system \
>> +    (DBMS) that supports almost all SQL constructs (including \
>> +    transactions, subselects and user-defined types and functions). The \
>> +    postgresql package includes the client programs and libraries that \
>> +    you'll need to access a PostgreSQL DBMS server.  These PostgreSQL \
>> +    client programs are programs that directly manipulate the internal \
>> +    structure of PostgreSQL databases on a PostgreSQL server. These client \
>> +    programs can be located on the same machine with the PostgreSQL \
>> +    server, or may be on a remote machine which accesses a PostgreSQL \
>> +    server over a network connection. This package contains the docs \
>> +    in HTML for the whole package, as well as command-line utilities for \
>> +    managing PostgreSQL databases on a PostgreSQL server. \
>> +     \
>> +    If you want to manipulate a PostgreSQL database on a local or remote \
>> +    PostgreSQL server, you need this package. You also need to install \
>> +    this package if you're installing the postgresql-server package. \
>> +    "
>>   HOMEPAGE = "http://www.postgresql.com"
>>   LICENSE = "BSD"
>>   DEPENDS = "zlib readline tzcode-native"
>> @@ -8,23 +26,58 @@ ARM_INSTRUCTION_SET = "arm"
>>   
>>   #WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
>>   
>> -SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
>> +SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
>> +           file://postgresql.init \
>> +           file://postgresql-bashprofile \
>> +"
>>   
>>   LEAD_SONAME = "libpq.so"
>>   
>>   # LDFLAGS for shared libraries
>>   export LDFLAGS_SL = "${LDFLAGS}"
>>   
>> -inherit autotools pkgconfig
>> +inherit autotools pkgconfig useradd
>>   
>> -EXTRA_OECONF = "--disable-rpath"
>> -EXTRA_OECONF_sh4 = "--disable-spinlocks --disable-rpath"
>> +EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
>> +                 --datadir=${datadir}/${BPN} \
>> +                 --sysconfdir=${sysconfdir}/${BPN} \
>> +                 --without-krb5 \
>> +"
>> +EXTRA_OECONF_sh4 += "--disable-spinlocks"
>>   EXTRA_OECONF_aarch64 += "--disable-spinlocks"
>>   
>>   do_compile_append() {
>>       cp /usr/sbin/zic ${S}/src/timezone/
>>   }
>>   
>> +# server needs to configure user and group
>> +usernum = "28"
>> +groupnum = "28"
>> +USERADD_PACKAGES = "${PN}"
>> +USERADD_PARAM_${PN} = "-M -g postgres -o -r -d ${localstatedir}/lib/${BPN} \
>> +    -s /bin/bash -c 'PostgreSQL Server' -u ${usernum} postgres"
>> +GROUPADD_PARAM_${PN} = "-g ${groupnum} -o -r postgres"
>> +
>> +INITSCRIPT_PACKAGES = "${PN}"
>> +INITSCRIPT_NAME = "${BPN}-server"
>> +INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
>> +
>> +do_install_append() {
>> +	# install dirs and server init
>> +	install -d ${D}${sysconfdir}/init.d
>> +	install -m 0755 ${WORKDIR}/${BPN}.init \
>> +	    ${D}${sysconfdir}/init.d/${BPN}-server
>> +	sed -i -e "s/^PGVERSION=.*$/PGVERSION=${PV}/g" \
>> +	    ${D}${sysconfdir}/init.d/${BPN}-server
>> +	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
>> +	install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
>> +	install -m 644 ${WORKDIR}/${BPN}-bashprofile \
>> +	    ${D}${localstatedir}/lib/${BPN}/.bash_profile
>> +	chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
>> +	# multiple server config directory
>> +	install -d -m 700 ${D}${sysconfdir}/default/${BPN}
>> +}
> We're using 4 spaces for indentation, I've changed all 4 patches to use
> that when cherry-picking them to master-next, but next time please use
> correct indentation.
Ok, Thanks.

Chong
>> +
>>   SSTATE_SCAN_FILES += "Makefile.global"
>>   
>>   PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


