Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 74F7B6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 08:43:30 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VWMhU-0005vr-8W for openembedded-devel@lists.openembedded.org;
	Wed, 16 Oct 2013 10:43:28 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:43:28 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:43:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 Oct 2013 10:43:19 +0200
Message-ID: <l3ljit$r28$1@ger.gmane.org>
References: <1381907473-16769-1-git-send-email-b40290@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1381907473-16769-1-git-send-email-b40290@freescale.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-networking][PATCH 1/3] snort : add recipe
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
X-List-Received-Date: Wed, 16 Oct 2013 08:43:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-10-13 09:11, b40290@freescale.com schreef:
> From: Chunrong Guo <B40290@freescale.com>
> 
> *snort - a free lightweight network intrusion detection system for UNIX
> and Windows
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com> --- 
> .../recipes-connectivity/snort/files/default       |   42 ++ 
> .../snort/files/disable-dap-address-space-id.patch |   52 +++ 
> .../snort/files/disable-inaddr-none.patch          |   75 ++++ 
> .../recipes-connectivity/snort/files/logrotate     |   12 + 
> .../recipes-connectivity/snort/files/snort.init    |  425
> ++++++++++++++++++++ .../recipes-connectivity/snort/files/volatiles     |
> 2 + .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   83 ++++ 7
> files changed, 691 insertions(+), 0 deletions(-) create mode 100644
> meta-networking/recipes-connectivity/snort/files/default create mode
> 100644
> meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
>
> 
create mode 100644
meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
> create mode 100644
> meta-networking/recipes-connectivity/snort/files/logrotate create mode
> 100755 meta-networking/recipes-connectivity/snort/files/snort.init create
> mode 100644 meta-networking/recipes-connectivity/snort/files/volatiles 
> create mode 100644
> meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> 
> diff --git a/meta-networking/recipes-connectivity/snort/files/default
> b/meta-networking/recipes-connectivity/snort/files/default new file mode
> 100644 index 0000000..afd3840 --- /dev/null +++
> b/meta-networking/recipes-connectivity/snort/files/default @@ -0,0 +1,42
> @@

> +LOGDIR="/var/log/snort"

Hardcoded path

> diff --git a/meta-networking/recipes-connectivity/snort/files/logrotate
> b/meta-networking/recipes-connectivity/snort/files/logrotate new file
> mode 100644 index 0000000..e394e2e --- /dev/null +++
> b/meta-networking/recipes-connectivity/snort/files/logrotate @@ -0,0
> +1,12 @@ +/var/log/snort/*.log /var/log/snort/alert {

hardcoded path

> +    size 1M +    missingok +    compress +    delaycompress +    rotate
> 10 +    sharedscripts +    postrotate +    /etc/init.d/snort restart

hardcoded path and sysvinit specific


> diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init
> b/meta-networking/recipes-connectivity/snort/files/snort.init new file
> mode 100755 index 0000000..af66619 --- /dev/null +++
> b/meta-networking/recipes-connectivity/snort/files/snort.init @@ -0,0
> +1,425 @@

> + +PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

hardcoded paths

> + +test $DEBIAN_SCRIPT_DEBUG && set -v -x + +DAEMON=/usr/bin/snort

hardcoded path

> +NAME=snort +DESC="Network Intrusion Detection System" + +.
> /etc/default/snort

hardcoded path

> +COMMON="$PARAMS -l $LOGDIR -u $SNORTUSER -g $SNORTGROUP" + +test -x
> $DAEMON || exit 0 +test -z "$LOCAL_SNORT_HOME_NET" &&
> LOCAL_SNORT_HOME_NET="192.168.0.0/16" + +# to find the lib files +cd
> /etc/snort

hardcoded path


> +check_root()  { +    if [ "$(id -u)" != "0" ]; then +        echo "You
> must be root to start, stop or restart $NAME." +        exit 4 +    fi

does this work with busybox?

> +} + +case "$1" in +  start) +        check_root +	echo "Starting $DESC "
> "$NAME" + +        if [ -e /etc/snort/db-pending-config ] ; then +		echo
> "/etc/snort/db-pending-config file found" +		echo "Snort will not start
> as its database is not yet configured." +		echo "Please configure the
> database as described in" +		echo
> "/usr/share/doc/snort-{pgsql,mysql}/README-database.Debian" +		echo "and
> remove /etc/snort/db-pending-config"

Tons of hardcoded paths

> +		exit 6 +	fi + +        if ! check_log_dir; then +		echo " will not
> start $DESC!" +		exit 5 +	fi +	if [ "$LOCAL_SNORT_STARTUP" = "dialup" ];
> then +		shift +		set +e +		/etc/ppp/ip-up.d/snort "$@"

hardcoded path and needs RRECOMMENDS = pppd?


> +	myret=0 +	got_instance=0 +	for interface in $interfaces; do +
> got_instance=1 +		echo "($interface" + +                # Check if the
> interface is available: +                # - only if iproute is
> available +                # - the interface exists +                # -
> the interface is up +                if ! [ -x /sbin/ip ] || ( ip link
> show dev "$interface" >/dev/null 2>&1 && [ -n "`ip link show up
> "$interface" 2>/dev/null`" ] ) ; then

hardcoded path and needs RDEPENDS = iputils?

> + +		PIDFILE=/var/run/snort_$interface.pid +
> CONFIGFILE=/etc/snort/snort.$interface.conf + +                #
> Defaults: +		fail="failed (check /var/log/syslog and /var/log/snort)" +
> run="yes"

paths...

> + +                if [ -e "$PIDFILE" ] && running $PIDFILE; then +
> run="no" +                        # Do not start this instance, it is
> already runing +                fi + +                if [ "$run" = "yes"
> ] ; then +                    if [ ! -e "$CONFIGFILE" ]; then +
> echo "no /etc/snort/snort.$interface.conf found, defaulting to
> snort.conf" +                        CONFIGFILE=/etc/snort/snort.conf

paths...

> +                    fi + +                    set +e +
> /sbin/start-stop-daemon --start --quiet  \

start-stop-daemon is in $PATH, so no need to hardcode /sbin

> +	if [ "$LOCAL_SNORT_STARTUP" = "dialup" ]; then +		shift +		set +e +
> /etc/ppp/ip-down.d/snort "$@"

paths....


> +	# Usually, we stop all current running interfaces +
> pidpattern=/var/run/snort_*.pid

paths and isn't that /run nowadays?

> +	# If we are requested to stop a specific interface... +	test "$2" &&
> pidpattern=/var/run/snort_"$2".pid

paths

> + +	got_instance=0 +        myret=0 +	for PIDFILE in $pidpattern; do +		#
> This check is also needed, if the above pattern doesn't match +		test -f
> "$PIDFILE" || continue + +		got_instance=1 +		interface=$(basename
> "$PIDFILE" .pid | sed -e 's/^snort_//') + +		echo "($interface" + +		set
> +e +                if [ ! -e "$PIDFILE" -o -r "$PIDFILE" ] ; then +#
> Change ownership of the pidfile +		    /sbin/start-stop-daemon --stop
> --retry 5 --quiet --oknodo \

paths


> +  restart|force-restart|reload|force-reload) +        check_root +	#
> Usually, we restart all current running interfaces +
> pidpattern=/var/run/snort_*.pid

paths and I'll stop here a sed in do_install will catch most if not all
hardcodes. The start-stop-daemon ones need to get removed.


> diff --git a/meta-networking/recipes-connectivity/snort/files/volatiles
> b/meta-networking/recipes-connectivity/snort/files/volatiles new file
> mode 100644 index 0000000..0f22f9b --- /dev/null +++
> b/meta-networking/recipes-connectivity/snort/files/volatiles @@ -0,0 +1,2
> @@ +# <type> <owner> <group> <mode> <path> <linksource> +d snort snort
> 0755 /var/log/snort none diff --git
> a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb new file
> mode 100644 index 0000000..c72b49b --- /dev/null +++
> b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb @@ -0,0
> +1,83 @@ +DESCRIPTION = "snort - a free lightweight network intrusion
> detection system for UNIX and Windows." +HOMEPAGE =
> "http://www.snort.org/" +LICENSE = "GPL-2.0" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5" + +DEPENDS =
> "libpcap libpcre daq libdnet" + + +SRC_URI = "
> ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \ +
> file://disable-inaddr-none.patch \ +
> file://disable-dap-address-space-id.patch \ +
> file://snort.init \ +            file://default \ +
> file://logrotate \ +            file://volatiles" + 
> +SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd" 
> +SRC_URI[tarball.sha256sum] =
> "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc" + 
> +inherit autotools  gettext

update-rc.d class for the sysvscript?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSXlGnMkyGM64RGpERAiuLAKCELquADUALv8QG7yjV9oWopld8xwCgtQUU
8sMwg/KHo2JzsX0Vr3AH/KM=
=jg8m
-----END PGP SIGNATURE-----


