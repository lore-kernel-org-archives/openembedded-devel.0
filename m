Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T8Q3A-0003eU-6a for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:22:20 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T8PrI-0001OE-9u for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:10:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:10:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 03 Sep 2012 08:09:42 +0200
Message-ID: <k21hj7$npr$2@ger.gmane.org>
References: <1346633420-10990-1-git-send-email-joe.macdonald@windriver.com>
	<1346633420-10990-2-git-send-email-joe.macdonald@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346633420-10990-2-git-send-email-joe.macdonald@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH 1/2] meta-networking: Migrate dnsmasq into meta-networking
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
X-List-Received-Date: Mon, 03 Sep 2012 06:22:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-09-12 02:50, Joe MacDonald schreef:
> Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com> --- 
> .../recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb   |  13 + 
> .../recipes-daemons/dnsmasq/dnsmasq.inc            |  29 ++ 
> .../recipes-daemons/dnsmasq/dnsmasq_2.55.bb        |   4 + 
> .../recipes-daemons/dnsmasq/files/dnsmasq.conf     | 293
> +++++++++++++++++++++ meta-networking/recipes-daemons/dnsmasq/files/init
> |  52 ++++ .../dnsmasq/dnsmasq-dbus_2.55.bb                   |  13 - 
> meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc   |  29 -- 
> .../recipes-connectivity/dnsmasq/dnsmasq_2.55.bb   |   4 - 
> .../dnsmasq/files/dnsmasq.conf                     | 293
> --------------------- meta-oe/recipes-connectivity/dnsmasq/files/init
> |  52 ---- 10 files changed, 391 insertions(+), 391 deletions(-) create
> mode 100644 meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb 
> create mode 100644 meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc 
> create mode 100644
> meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb create mode
> 100755 meta-networking/recipes-daemons/dnsmasq/files/dnsmasq.conf create
> mode 100644 meta-networking/recipes-daemons/dnsmasq/files/init delete
> mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb 
> delete mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc 
> delete mode 100644 meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb 
> delete mode 100755
> meta-oe/recipes-connectivity/dnsmasq/files/dnsmasq.conf delete mode
> 100644 meta-oe/recipes-connectivity/dnsmasq/files/init
> 

> diff --git a/meta-networking/recipes-daemons/dnsmasq/files/init
> b/meta-networking/recipes-daemons/dnsmasq/files/init new file mode
> 100644 index 0000000..d1aa9e5 --- /dev/null +++
> b/meta-networking/recipes-daemons/dnsmasq/files/init @@ -0,0 +1,52 @@ 
> +#!/bin/sh +DAEMON=/usr/bin/dnsmasq +NAME=dnsmasq +DESC="DNS forwarder
> and DHCP server" +ARGS="-7 /etc/dnsmasq.d" + +test -f $DAEMON || exit 0 
> + +set -e + +case "$1" in +    start) +        echo -n "starting $DESC:
> $NAME... " +	test -d /var/lib/misc/ || mkdir /var/lib/misc/ +
> start-stop-daemon -S -x $DAEMON -- $ARGS +	echo "done." +	;; +    stop) +
> echo -n "stopping $DESC: $NAME... " +	start-stop-daemon -K -x $DAEMON +
> echo "done." +	;; +    status) +	echo -n "dnsmasq " +	start-stop-daemon
> -q -K -t -x $DAEMON +	RET=$? +	if [ "$RET" = "0" ]; then +		PID=`cat
> /var/run/dnsmasq.pid` +		echo "($PID) is running" +	else +		echo "is not
> running" +		exit $RET +	fi +	;; +    restart) +        echo "restarting
> $DESC: $NAME... " + 	$0 stop +	$0 start +	echo "done." +	;; +    reload) 
> +    	echo -n "reloading $DESC: $NAME... " +    	killall -HUP $(basename
> ${DAEMON}) +	echo "done." +	;; +    *) +	echo "Usage: $0
> {start|stop|status|restart|reload}" +	exit 1 +	;; +esac + +exit 0

Can this be made LSB compliant? Or better, does dnsmasq ship with its own
initscript we can use?
Another nit, the initscript and conffile hardcode /etc and /var, while the
recipe allows changing them.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQREmmMkyGM64RGpERApmoAJ9jBM4+/H1EiY4yHPmWUUq3Q8p7hQCgnlx4
i+OCPKb2ao1egXP88MOKCVA=
=AhXV
-----END PGP SIGNATURE-----



