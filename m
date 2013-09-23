Return-Path: <joe@deserted.net>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 43FC26CA1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 16:58:17 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so1861479ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VmwIRsdfGG0bPwY9IvzCpETz7gHB0QHo2UPUd4FXX88=;
	b=g+MP1HjoPvQvObCZVy3BGbB8qnd+e6EyUxHeC9voJDhnRF+psZZNhD2tpeua36Tlv4
	Qo5wc31Y0unEy7sOxclZLA3iq/2nx790V3R1hVgHBg7oKe9O1PJnzGDGnKsewXRrhuhs
	21rQ4dF+CGvPas1VviBgQknHNvD3cj5IyRETCSny6GE4ntpt/zsv/2kKKHIQDLIjP0qe
	0FIUkAXIhpmFwSKXqat2uh+dFIpnbzppr433K8iz9qT2YT86wihhTc7OBXOXqrvv9xhz
	9V6YgI3rlArYblweIQOWxc3MF9yWKNPmCsqAWm/AquBHUd4aKpO/JxKzHOeixAkQovXs
	h6qg==
X-Gm-Message-State: ALoCoQluwVGV8SusQ9T86at1NCEu3ZKYFHM9y6PReIcf6MAUEvtMx8EYKPM5tbk7vkgjmInZsLWM
X-Received: by 10.15.98.194 with SMTP id bj42mr38933295eeb.12.1379955497963;
	Mon, 23 Sep 2013 09:58:17 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	r48sm43715686eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 09:58:17 -0700 (PDT)
Date: Mon, 23 Sep 2013 12:58:12 -0400
From: Joe MacDonald <joe@deserted.net>
To: b40290@freescale.com
Message-ID: <20130923165748.GB25887@deserted.net>
References: <1379927191-21769-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1379927191-21769-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] snort: add recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 16:58:18 -0000
X-Groupsio-MsgNum: 46307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Chunrong,

A few things with this one.

- can you be more specific with the LICENSE?

   WARNING: snort: No generic license file exists for: GPL in any provider

- my test build generated QA errors due to host libraries being used in
  the build:

   cc1: warning: include location "/usr/include/pcap" is unsafe for cross-c=
ompilation [-Wpoison-system-directories]
   cc1: warning: include location "/usr/include/pcap" is unsafe for cross-c=
ompilation [-Wpoison-system-directories]
   cc1: warning: include location "/usr/include/pcap" is unsafe for cross-c=
ompilation [-Wpoison-system-directories]
   cc1: warning: include location "/usr/include/pcap" is unsafe for cross-c=
ompilation [-Wpoison-system-directories]

- Is the pkg_postinst_${PN} action really necessary?  Can't you
  accomplish the same thing by inheriting useradd?  At worst, I think
  you'll only need the last line, directly invoking
  populate-volatile.sh.  Could be mistaken on that, though.

- Can you take another pass through the recipe itself, please?  There's
  some inconsistent formatting (specifically around SRC_URI) and
  minor whitespace issues (around EXTRA_OECONF, for sure, maybe
  elsewhere, I've only done a quick scan).

- While we're on the topic, I hate to ask, but any chance we could fix
  up the formatting on the initscript itself?  It's an indentation
  disaster.  Not your fault, I know, but I don't know that we'll ever go
  back to taking the debian one again and I'd rather it be clean for
  anyone who comes along later.

- There's one minor inconsistency in the logrotate file, too, can you
  make them all space-indented or all tab-indented please?

Thanks,

-J.

[[oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.23 (Mon 17:0=
6) b40290@freescale.com wrote:

> From: Chunrong Guo <B40290@freescale.com>
>=20
>   *snort - a free lightweight network intrusion detection
>          system for UNIX and Windows
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-connectivity/snort/files/default       |   42 ++
>  .../snort/files/disable-dap-address-space-id.patch |   52 +++
>  .../snort/files/disable-inaddr-none.patch          |   75 ++++
>  .../recipes-connectivity/snort/files/logrotate     |   12 +
>  .../recipes-connectivity/snort/files/snort.init    |  425 ++++++++++++++=
++++++
>  .../recipes-connectivity/snort/files/volatiles     |    2 +
>  .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   86 ++++
>  7 files changed, 694 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/defa=
ult
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/disa=
ble-dap-address-space-id.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/disa=
ble-inaddr-none.patch
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/logr=
otate
>  create mode 100755 meta-networking/recipes-connectivity/snort/files/snor=
t.init
>  create mode 100644 meta-networking/recipes-connectivity/snort/files/vola=
tiles
>  create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.=
4.6.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/snort/files/default b/m=
eta-networking/recipes-connectivity/snort/files/default
> new file mode 100644
> index 0000000..afd3840
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/default
> @@ -0,0 +1,42 @@
> +# Parameters for the daemon
> +# Add any additional parameteres here.
> +PARAMS=3D"-m 027 -D -d "
> +#
> +# Snort user
> +# This user will be used to launch snort. Notice that the=20
> +# preinst script of the package might do changes to the user=20
> +# (home directory, User Name) when the package is upgraded or
> +# reinstalled.  So, do *not* change this to 'root' or to any other user=
=20
> +# unless you are sure there is no problem with those changes being intro=
duced.
> +#=20
> +SNORTUSER=3D"snort"
> +#
> +# Logging directory
> +# Snort logs will be dropped here and this will be the home
> +# directory for the SNORTUSER. If you change this value you should
> +# change the /etc/logrotate.d/snort definition too, otherwise logs
> +# will not be rotated properly.
> +#
> +LOGDIR=3D"/var/log/snort"
> +#
> +# Snort group
> +# This is the group that the snort user will be added to.
> +#
> +SNORTGROUP=3D"snort"
> +#=20
> +# Allow Snort's init.d script to work if the configured interfaces
> +# are not available. Set this to yes if you configure Snort with
> +# multiple interfaces but some might not be available on boot
> +# (e.g. wireless interfaces)
> +#=20
> +# Note: In order for this to work the 'iproute' package needs to=20
> +# be installed.
> +ALLOW_UNAVAILABLE=3D"no"
> +
> +# Local configs
> +#
> +LOCAL_SNORT_STARTUP=3Dboot
> +LOCAL_SNORT_HOME_NET=3D"192.168.0.0/16"
> +LOCAL_SNORT_INTERFACE=3D""
> +LOCAL_SNORT_STATS_RCPT=3D"root"
> +LOCAL_SNORT_STATS_THRESHOLD=3D"1"
> diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap=
-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/=
disable-dap-address-space-id.patch
> new file mode 100644
> index 0000000..39e5c9c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-addres=
s-space-id.patch
> @@ -0,0 +1,52 @@
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +fix the below error:
> +checking for dap address space id... configure:=20
> +configure: error: cannot run test program while cross compiling
> +
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
> ++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
> +@@ -679,23 +679,23 @@
> +=20
> + AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
> +=20
> +-AC_MSG_CHECKING([for daq address space ID])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <daq.h>
> +-]],
> +-[[
> +-   DAQ_PktHdr_t hdr;
> +-   hdr.address_space_id =3D 0;
> +-]])],
> +-[have_daq_address_space_id=3D"yes"],
> +-[have_daq_address_space_id=3D"no"])
> +-AC_MSG_RESULT($have_daq_address_space_id)
> +-if test "x$have_daq_address_space_id" =3D "xyes"; then
> +-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> +-        [DAQ version supports address space ID in header.])
> +-fi
> ++#AC_MSG_CHECKING([for daq address space ID])
> ++#AC_RUN_IFELSE(
> ++#[AC_LANG_PROGRAM(
> ++#[[
> ++##include <daq.h>
> ++#]],
> ++#[[
> ++#   DAQ_PktHdr_t hdr;
> ++#   hdr.address_space_id =3D 0;
> ++#]])],
> ++have_daq_address_space_id=3D"yes"
> ++#[have_daq_address_space_id=3D"no"])
> ++#AC_MSG_RESULT($have_daq_address_space_id)
> ++#if test "x$have_daq_address_space_id" =3D "xyes"; then
> ++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
> ++#        [DAQ version supports address space ID in header.])
> ++#fi
> +=20
> + # any sparc platform has to have this one defined.
> + AC_MSG_CHECKING(for sparc)
> diff --git a/meta-networking/recipes-connectivity/snort/files/disable-ina=
ddr-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-i=
naddr-none.patch
> new file mode 100644
> index 0000000..9dafe63
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-non=
e.patch
> @@ -0,0 +1,75 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +fix the below error:
> +checking for INADDR_NONE... configure:
> +configure: error: cannot run test program while cross compiling
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +
> +--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
> ++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
> +@@ -281,25 +281,7 @@
> + AC_CHECK_TYPES([boolean])
> +=20
> + # In case INADDR_NONE is not defined (like on Solaris)
> +-have_inaddr_none=3D"no"
> +-AC_MSG_CHECKING([for INADDR_NONE])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <sys/types.h>
> +-#include <netinet/in.h>
> +-#include <arpa/inet.h>
> +-]],
> +-[[
> +-	if (inet_addr("10,5,2") =3D=3D INADDR_NONE);
> +-    return 0;
> +-]])],
> +-[have_inaddr_none=3D"yes"],
> +-[have_inaddr_none=3D"no"])
> +-AC_MSG_RESULT($have_inaddr_none)
> +-if test "x$have_inaddr_none" =3D "xno"; then
> +-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
> +-fi
> ++have_inaddr_none=3D"yes"
> +=20
> + AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> + #include <stdio.h>
> +@@ -397,21 +379,21 @@
> +   fi
> + fi
> +=20
> +-AC_MSG_CHECKING([for pcap_lex_destroy])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <pcap.h>
> +-]],
> +-[[
> +-   pcap_lex_destroy();
> +-]])],
> +-[have_pcap_lex_destroy=3D"yes"],
> +-[have_pcap_lex_destroy=3D"no"])
> +-AC_MSG_RESULT($have_pcap_lex_destroy)
> +-if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> +-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack=
 created by pcap bpf filter])
> +-fi
> ++#AC_MSG_CHECKING([for pcap_lex_destroy])
> ++#AC_RUN_IFELSE(
> ++#[AC_LANG_PROGRAM(
> ++#[[
> ++##include <pcap.h>
> ++#]],
> ++#[[
> ++#   pcap_lex_destroy();
> ++#]])],
> ++have_pcap_lex_destroy=3D"yes"
> ++#[have_pcap_lex_destroy=3D"no"])
> ++#AC_MSG_RESULT($have_pcap_lex_destroy)
> ++#if test "x$have_pcap_lex_destroy" =3D "xyes"; then
> ++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stac=
k created by pcap bpf filter])
> ++#fi
> +=20
> + AC_MSG_CHECKING([for pcap_lib_version])
> + AC_LINK_IFELSE(
> diff --git a/meta-networking/recipes-connectivity/snort/files/logrotate b=
/meta-networking/recipes-connectivity/snort/files/logrotate
> new file mode 100644
> index 0000000..ef3e4af
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/logrotate
> @@ -0,0 +1,12 @@
> +/var/log/snort/*.log /var/log/snort/alert {
> +    size 1M
> +    missingok
> +    compress
> +    delaycompress
> +    rotate 10
> +    sharedscripts
> +    postrotate
> +	/etc/init.d/snort restart
> +    endscript
> +}
> +
> diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init =
b/meta-networking/recipes-connectivity/snort/files/snort.init
> new file mode 100755
> index 0000000..af66619
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/snort.init
> @@ -0,0 +1,425 @@
> +#!/bin/sh -e
> +#
> +# Init.d script for Snort in OpenEmbedded, based on Debian's script
> +#
> +# Copyright (c) 2009 Roman I Khimov <khimov@altell.ru>
> +#
> +# Copyright (c) 2001 Christian Hammers=20
> +# Copyright (c) 2001-2002 Robert van der Meulen
> +# Copyright (c) 2002-2004 Sander Smeenk <ssmeenk@debian.org>
> +# Copyright (c) 2004-2007 Javier Fernandez-Sanguino <jfs@debian.org>
> +#
> +# This is free software; you may redistribute it and/or modify
> +# it under the terms of the GNU General Public License as
> +# published by the Free Software Foundation; either version 2,
> +# or (at your option) any later version.
> +#
> +# This is distributed in the hope that it will be useful, but
> +# WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License with
> +# the Debian operating system, in /usr/share/common-licenses/GPL;  if
> +# not, write to the Free Software Foundation, Inc., 59 Temple Place,
> +# Suite 330, Boston, MA 02111-1307 USA
> +#
> +### BEGIN INIT INFO
> +# Provides:          snort
> +# Required-Start:    $time $network $local_fs
> +# Required-Stop:    =20
> +# Should-Start:      $syslog
> +# Should-Stop:      =20
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Lightweight network intrusion detection system
> +# Description:       Intrusion detection system that will
> +#                    capture traffic from the network cards and will
> +#                    match against a set of known attacks.
> +### END INIT INFO
> +
> +PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> +
> +test $DEBIAN_SCRIPT_DEBUG && set -v -x
> +
> +DAEMON=3D/usr/bin/snort
> +NAME=3Dsnort
> +DESC=3D"Network Intrusion Detection System"
> +
> +. /etc/default/snort
> +COMMON=3D"$PARAMS -l $LOGDIR -u $SNORTUSER -g $SNORTGROUP"
> +
> +test -x $DAEMON || exit 0
> +test -z "$LOCAL_SNORT_HOME_NET" && LOCAL_SNORT_HOME_NET=3D"192.168.0.0/1=
6"
> +
> +# to find the lib files
> +cd /etc/snort
> +
> +running()
> +{
> +        PIDFILE=3D$1
> +# No pidfile, probably no daemon present
> +        [ ! -f "$PIDFILE" ] && return 1
> +        pid=3D`cat $PIDFILE`
> +# No pid, probably no daemon present
> +        [ -z "$pid" ] && return 1
> +        [ ! -d /proc/$pid ] &&  return 1
> +        cmd=3D`cat /proc/$pid/cmdline | tr "\000" "\n"|head -n 1 |cut -d=
 : -f 1`
> +# No daemon
> +        [ "$cmd" !=3D "$DAEMON" ] &&  return 1
> +        return 0
> +}
> +
> +
> +check_log_dir() {
> +# Does the logging directory belong to Snort?
> +	# If we cannot determine the logdir return without error
> +	# (we will not check it)
> +	# This will only be used by people using /etc/default/snort
> +	[ -n "$LOGDIR" ] || return 0
> +	[ -n "$SNORTUSER" ] || return 0
> +	if [ ! -e "$LOGDIR" ] ; then
> +		echo "ERR: logging directory $LOGDIR does not exist"
> +		return 1
> +	elif [ ! -d "$LOGDIR" ] ; then
> +		echo "ERR: logging directory $LOGDIR does not exist"
> +		return 1
> +	else
> +		# Don't worry, be happy
> +		true
> +	fi
> +	return 0
> +}
> +
> +check_root()  {
> +    if [ "$(id -u)" !=3D "0" ]; then
> +        echo "You must be root to start, stop or restart $NAME."
> +        exit 4
> +    fi
> +}
> +
> +case "$1" in
> +  start)
> +        check_root
> +	echo "Starting $DESC " "$NAME"
> +
> +        if [ -e /etc/snort/db-pending-config ] ; then
> +		echo "/etc/snort/db-pending-config file found"
> +		echo "Snort will not start as its database is not yet configured."
> +		echo "Please configure the database as described in"
> +		echo "/usr/share/doc/snort-{pgsql,mysql}/README-database.Debian"
> +		echo "and remove /etc/snort/db-pending-config"
> +		exit 6
> +	fi
> +
> +        if ! check_log_dir; then
> +		echo " will not start $DESC!"
> +		exit 5
> +	fi
> +	if [ "$LOCAL_SNORT_STARTUP" =3D "dialup" ]; then
> +		shift
> +		set +e
> +		/etc/ppp/ip-up.d/snort "$@"
> +		ret=3D$?
> +                if  [ $ret -eq 0 ] ; then
> +                  echo 0
> +                else
> +                  echo 1
> +                fi
> +		exit $ret
> +	fi
> +
> +	# Usually, we start all interfaces
> +	interfaces=3D"$LOCAL_SNORT_INTERFACE"
> +
> +	# If we are requested to start a specific interface...
> +	test "$2" && interfaces=3D"$2"
> +
> +        # If the interfaces list is empty stop (no error)
> +        if [ -z "$interfaces" ] ; then
> +            echo "no interfaces configured, will not start"
> +            echo 0
> +            exit 0
> +        fi
> +
> +	myret=3D0
> +	got_instance=3D0
> +	for interface in $interfaces; do
> +		got_instance=3D1
> +		echo "($interface"
> +
> +                # Check if the interface is available:
> +                # - only if iproute is available
> +                # - the interface exists=20
> +                # - the interface is up
> +                if ! [ -x /sbin/ip ] || ( ip link show dev "$interface" =
>/dev/null 2>&1 && [ -n "`ip link show up "$interface" 2>/dev/null`" ] ) ; =
then
> +
> +		PIDFILE=3D/var/run/snort_$interface.pid
> +                CONFIGFILE=3D/etc/snort/snort.$interface.conf
> +
> +                # Defaults:
> +		fail=3D"failed (check /var/log/syslog and /var/log/snort)"
> +                run=3D"yes"
> +
> +                if [ -e "$PIDFILE" ] && running $PIDFILE; then
> +                        run=3D"no"=20
> +                        # Do not start this instance, it is already runi=
ng
> +                fi
> +
> +                if [ "$run" =3D "yes" ] ; then
> +                    if [ ! -e "$CONFIGFILE" ]; then
> +                        echo "no /etc/snort/snort.$interface.conf found,=
 defaulting to snort.conf"
> +                        CONFIGFILE=3D/etc/snort/snort.conf
> +                    fi
> +
> +                    set +e
> +                    /sbin/start-stop-daemon --start --quiet  \
> +                        --pidfile "$PIDFILE" \
> +                        --exec $DAEMON -- $COMMON $LOCAL_SNORT_OPTIONS \
> +                        -c $CONFIGFILE \
> +                        -S "HOME_NET=3D[$LOCAL_SNORT_HOME_NET]" \
> +                        -i $interface >/dev/null
> +                    ret=3D$?
> +                    case "$ret" in
> +			0)
> +                                echo  "...done)"
> +				;;
> +			*)
> +				echo "...ERROR: $fail)"
> +				myret=3D$(expr "$myret" + 1)
> +				;;
> +                     esac
> +                     set -e
> +                else
> +                        echo "...already running)"
> +                fi
> +
> +                else
> +                # What to do if the interface is not available
> +                # or is not up
> +                        if [ "$ALLOW_UNAVAILABLE" !=3D "no" ] ; then=20
> +                            echo "...interface not available)"
> +                        else=20
> +                            echo "...ERROR: interface not available)"
> +                            myret=3D$(expr "$myret" + 1)
> +                        fi
> +                fi
> +	done
> +
> +	if [ "$got_instance" =3D 0 ] && [ "$ALLOW_UNAVAILABLE" =3D "no" ]; then
> +		echo "No snort instance found to be started!" >&2
> +		exit 6
> +	fi
> +
> +        if  [ $myret -eq 0 ] ; then
> +            echo 0
> +        else
> +            echo 1
> +        fi
> +	exit $myret
> +	;;
> +  stop)
> +        check_root
> +        echo "Stopping $DESC " "$NAME"
> +   =20
> +	if [ "$LOCAL_SNORT_STARTUP" =3D "dialup" ]; then
> +		shift
> +		set +e
> +		/etc/ppp/ip-down.d/snort "$@"
> +		ret=3D$?
> +                if  [ $ret -eq 0 ] ; then
> +                    echo 0
> +                else
> +                  echo 1
> +                fi
> +		exit $ret
> +	fi
> +
> +	# Usually, we stop all current running interfaces
> +	pidpattern=3D/var/run/snort_*.pid
> +
> +	# If we are requested to stop a specific interface...
> +	test "$2" && pidpattern=3D/var/run/snort_"$2".pid
> +
> +	got_instance=3D0
> +        myret=3D0
> +	for PIDFILE in $pidpattern; do
> +		# This check is also needed, if the above pattern doesn't match
> +		test -f "$PIDFILE" || continue
> +
> +		got_instance=3D1
> +		interface=3D$(basename "$PIDFILE" .pid | sed -e 's/^snort_//')
> +
> +		echo "($interface"
> +
> +		set +e
> +                if [ ! -e "$PIDFILE" -o -r "$PIDFILE" ] ; then
> +# Change ownership of the pidfile
> +		    /sbin/start-stop-daemon --stop --retry 5 --quiet --oknodo \
> +			--pidfile "$PIDFILE" --exec $DAEMON >/dev/null
> +                    ret=3D$?
> +                    rm -f "$PIDFILE"
> +                    rm -f "$PIDFILE.lck"
> +                else
> +                     echo "cannot read $PIDFILE"
> +                     ret=3D4
> +                fi
> +		case "$ret" in
> +			0)
> +                                echo  "...done)"
> +				;;
> +			*)
> +				echo "...ERROR)"
> +				myret=3D$(expr "$myret" + 1)
> +				;;
> +		esac
> +                set -e
> +
> +	done
> +
> +	if [ "$got_instance" =3D 0 ]; then
> +		log_warning_msg "No running snort instance found"
> +                exit 0 # LSB demands we don't exit with error here
> +	fi
> +        if  [ $myret -eq 0 ] ; then
> +            echo 0
> +        else
> +            echo 1
> +        fi
> +	exit $myret
> +	;;
> +  restart|force-restart|reload|force-reload)
> +        check_root
> +	# Usually, we restart all current running interfaces
> +	pidpattern=3D/var/run/snort_*.pid
> +
> +	# If we are requested to restart a specific interface...
> +	test "$2" && pidpattern=3D/var/run/snort_"$2".pid
> +
> +	got_instance=3D0
> +	for PIDFILE in $pidpattern; do
> +		# This check is also needed, if the above pattern doesn't match
> +		test -f "$PIDFILE" || continue
> +
> +		got_instance=3D1
> +		interface=3D$(basename "$PIDFILE" .pid | sed -e 's/^snort_//')
> +		$0 stop $interface || true
> +		$0 start $interface || true
> +	done
> +
> +	if [ "$got_instance" =3D 0 ]; then
> +		echo "No snort instance found to be stopped!" >&2
> +                exit 6
> +	fi
> +	;;
> +  status)
> +# Non-root users can use this (if allowed to)
> +        echo "Status of snort daemon(s)"
> +	interfaces=3D"$LOCAL_SNORT_INTERFACE"
> +	# If we are requested to check for a specific interface...
> +	test "$2" && interfaces=3D"$2"
> +        err=3D0
> +        pid=3D0
> +	for interface in $interfaces; do
> +                echo " $interface "
> +                pidfile=3D/var/run/snort_$interface.pid
> +                if [ -f  "$pidfile" ] ; then
> +                        if [ -r "$pidfile" ] ; then
> +                            pidval=3D`cat $pidfile`
> +                            pid=3D$(expr "$pid" + 1)
> +                            if ps -p $pidval | grep -q snort; then
> +                                echo "OK"
> +                            else
> +				echo "ERROR"
> +				err=3D$(expr "$err" + 1)
> +			    fi
> +                         else
> +	       		     echo "ERROR: cannot read status file"
> +                             err=3D$(expr "$err" + 1)
> +                         fi
> +                 else
> +                       echo "ERROR"
> +                       err=3D$(expr "$err" + 1)
> +                 fi
> +        done
> +        if [ $err -ne 0 ] ; then
> +            if [ $pid -ne 0 ] ; then
> +# More than one case where pidfile exists but no snort daemon
> +# LSB demands a '1' exit value here
> +                echo  1
> +                exit 1
> +            else
> +# No pidfiles at all
> +# LSB demands a '3' exit value here
> +                echo  3
> +                exit 3
> +            fi
> +        fi
> +        echo  0
> +        ;;
> +  config-check)
> +        echo "Checking $DESC configuration"=20
> +	if [ "$LOCAL_SNORT_STARTUP" =3D "dialup" ]; then
> +		echo "Config-check is currently not supported for snort in Dialup conf=
iguration"
> +                echo  3
> +                exit 3
> +	fi
> +
> +	# usually, we test all interfaces
> +	interfaces=3D"$LOCAL_SNORT_INTERFACE"
> +	# if we are requested to test a specific interface...
> +	test "$2" && interfaces=3D"$2"
> +
> +	myret=3D0
> +	got_instance=3D0
> +	for interface in $interfaces; do
> +		got_instance=3D1
> +		echo "interface $interface"
> +
> +		CONFIGFILE=3D/etc/snort/snort.$interface.conf
> +		if [ ! -e "$CONFIGFILE" ]; then
> +			CONFIGFILE=3D/etc/snort/snort.conf
> +		fi
> +		COMMON=3D`echo $COMMON | sed -e 's/-D//'`
> +		set +e
> +                fail=3D"INVALID"
> +		if [ -r "$CONFIGFILE" ]; then
> +                    $DAEMON -T $COMMON $LOCAL_SNORT_OPTIONS \
> +			-c $CONFIGFILE \
> +			-S "HOME_NET=3D[$LOCAL_SNORT_HOME_NET]" \
> +			-i $interface >/dev/null 2>&1
> +                    ret=3D$?
> +                else
> +                    fail=3D"cannot read $CONFIGFILE"
> +                    ret=3D4
> +                fi
> +		set -e
> +
> +		case "$ret" in
> +			0)
> +                                echo "OK"
> +				;;
> +			*)
> +                                echo "$fail"
> +				myret=3D$(expr "$myret" + 1)
> +				;;
> +		esac
> +	done
> +	if [ "$got_instance" =3D 0 ]; then
> +		echo "no snort instance found to be started!" >&2
> +		exit 6
> +	fi
> +
> +        if  [ $myret -eq 0 ] ; then
> +            echo 0
> +        else
> +            echo 1
> +        fi
> +	exit $myret
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart|force-restart|reload|force-reload|s=
tatus|config-check}"
> +	exit 1
> +	;;
> +esac
> +exit 0
> diff --git a/meta-networking/recipes-connectivity/snort/files/volatiles b=
/meta-networking/recipes-connectivity/snort/files/volatiles
> new file mode 100644
> index 0000000..e3ab51d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/volatiles
> @@ -0,0 +1,2 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d snort snort 0755 /var/log/snort none
> \ No newline at end of file
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> new file mode 100644
> index 0000000..5a165ef
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> @@ -0,0 +1,86 @@
> +DESCRIPTION =3D "snort - a free lightweight network intrusion detection =
system for UNIX and Windows."
> +HOMEPAGE =3D "http://www.snort.org/"
> +LICENSE =3D "GPL"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc9237=
7c5"
> +
> +DEPENDS =3D "libpcap libpcre daq libdnet"
> +
> +SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
> +            file://disable-inaddr-none.patch \
> +            file://disable-dap-address-space-id.patch \=20
> +	    file://snort.init \
> +	    file://default \
> +            file://logrotate \
> +	    file://volatiles \
> +          "
> +SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
> +SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6=
186a014baa451d43cdb0b3bc"
> +
> +inherit autotools  gettext=20
> +
> +EXTRA_OECONF =3D " \
> +	--enable-gre \   =20
> +	--enable-linux-smp-stats \
> +	--enable-reload \
> +	--enable-reload-error-restart \
> +	--enable-targetbased \
> +	--disable-static-daq \
> +	"
> +
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}/snort/rules
> +	install -d ${D}/${sysconfdir}/snort/preproc_rules
> +	install -d ${D}/${sysconfdir}/default/volatiles
> +	mkdir -p ${D}/${sysconfdir}/init.d
> +	for i in map config conf dtd; do
> +		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
> +	done
> +	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
> +	install -m 0644 ${WORKDIR}/default ${D}/${sysconfdir}/default/snort
> +	install -m 0644 ${WORKDIR}/volatiles ${D}/${sysconfdir}/default/volatil=
es/snort
> +	install -m 0755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
> +	mkdir -p ${D}/${localstatedir}/log/snort
> +	install -d ${D}${sysconfdir}/logrotate.d
> +	install -m 0644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/snort
> +}
> +
> +pkg_postinst_${PN}() {
> +	grep -q ^snort: /etc/group || addgroup snort
> +	grep -q ^snort: /etc/passwd || \
> +		adduser --disabled-password --home=3D/var/log/snort/ --system \
> +			--ingroup snort --no-create-home -g "snort" snort
> +	${sysconfdir}/init.d/populate-volatile.sh update
> +}
> +
> +PACKAGES =3D+ "${PN}-logrotate"
> +FILES_${PN}-logrotate =3D "${sysconfdir}/logrotate.d/snort"
> +FILES_${PN} +=3D " \
> +	${libdir}/snort_dynamicengine/*.so.* \
> +	${libdir}/snort_dynamicpreprocessor/*.so.* \
> +	${libdir}/snort_dynamicrules/*.so.* \
> +	"
> +FILES_${PN}-dbg +=3D " \
> +	${libdir}/snort_dynamicengine/.debug \
> +	${libdir}/snort_dynamicpreprocessor/.debug \
> +	${libdir}/snort_dynamicrules/.debug \
> +	"
> +FILES_${PN}-staticdev +=3D " \
> +	${libdir}/snort_dynamicengine/*.a \
> +	${libdir}/snort_dynamicpreprocessor/*.a \
> +	${libdir}/snort_dynamicrules/*.a \
> +	${libdir}/snort/dynamic_preproc/*.a \
> +	${libdir}/snort/dynamic_output/*.a \
> +	"
> +FILES_${PN}-dev +=3D " \
> +	${libdir}/snort_dynamicengine/*.la \
> +	${libdir}/snort_dynamicpreprocessor/*.la \
> +	${libdir}/snort_dynamicrules/*.la \
> +	${libdir}/snort_dynamicengine/*.so \
> +	${libdir}/snort_dynamicpreprocessor/*.so \
> +	${libdir}/snort_dynamicrules/*.so \
> +	${prefix}/src/snort_dynamicsrc \
> +	"
> +
> +RRECOMMENDS_${PN} +=3D "${PN}-logrotate"
> +RRECOMMENDS_${PN} +=3D "barnyard"
> +RSUGGESTS_${PN}-logrotate +=3D "logrotate"
--=20
-Joe MacDonald.
:wq

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJAcwwACgkQwFvcllog0XxbcwCfRPpVJmaEd+/PtaBmV0rggUFD
IykAoLgtmxJbjMYCvJNjLEtSD7QUqWUM
=8Dad
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
