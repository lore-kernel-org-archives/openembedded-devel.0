Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TaVr7-0003Zv-DS for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:14:01 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TaVdc-00085y-0B for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:00:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 19:00:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 19:00:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Nov 2012 18:57:56 +0100
Message-ID: <k8druu$id4$2@ger.gmane.org>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
	<a2ae9814aaa6ddbc0615516868004f6d62649d38.1353345006.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <a2ae9814aaa6ddbc0615516868004f6d62649d38.1353345006.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-networking][PATCH 7/8] proftpd: add from meta-baryon
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
X-List-Received-Date: Mon, 19 Nov 2012 18:14:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-11-12 18:11, Paul Eggleton schreef:
> This was originally from OE-Classic. Improvements over the OE-Classic 
> recipe for reference:
> 
> * Update to 1.3.4b * Add workaround for proftpd host IP resolution * Add
> initscript, borrowed from Debian with some modifications for 
> compatibility * Use autotools.bbclass and remove unnecessary configure
> options * PARALLEL_MAKE = "" is no longer needed, the bug was fixed in
> 1.3.3c * Set SUMMARY (which sets DESCRIPTION) and base it on the short 
> description from the website * Use useradd.bbclass to add ftp user/group 
> * Add HOMEPAGE * Add/fix description in some patches and improve recipe
> indentation * Make LICENSE more accurate * Add LIC_FILES_CHKSUM
> 
> Some of this work was done by Dexuan Cui <dexuan.cui@intel.com> and Kevin
> Strasser <kevin.strasser@linux.intel.com>.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---

> diff --git
> a/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init
> b/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init new
> file mode 100644 index 0000000..01c998c --- /dev/null +++
> b/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init @@
> -0,0 +1,220 @@ +#!/bin/sh + +### BEGIN INIT INFO +# Provides:
> proftpd +# Required-Start:    $remote_fs $syslog $local_fs $network +#
> Required-Stop:     $remote_fs $syslog $local_fs $network +# Should-Start:
> $named +# Should-Stop:       $named +# Default-Start:     2 3 4 5 +#
> Default-Stop:      0 1 6 +# Short-Description: Starts ProFTPD daemon +#
> Description:       This script runs the FTP service offered +#
> by the ProFTPD daemon +### END INIT INFO + +# Start the proftpd FTP
> daemon. + +PATH=/bin:/usr/bin:/sbin:/usr/sbin +DAEMON=/usr/sbin/proftpd

hardcoded $sbindir

> +NAME=proftpd + +# Defaults +RUN="no" +OPTIONS="" 
> +CONFIG_FILE=/etc/proftpd.conf

hardcoded $sysconfigdur

> + +PIDFILE=`grep -i '^pidfile' $CONFIG_FILE|awk '{ print $2 }'` +if [
> "x$PIDFILE" = "x" ]; +then +    PIDFILE=/var/run/proftpd.pid

hardcoded $localstatedir

> +fi + +# Read config (will override defaults) +[ -r /etc/default/proftpd
> ] && . /etc/default/proftpd

hardcoded $sysconfigdir and a lot more in the rest of the file.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQqnMkMkyGM64RGpERAna2AJ0cUe2Knjk1jKzdpYtWmgGH8JHc4ACcDcEw
kxu7B1yYizf2inquugwLEJw=
=HsG/
-----END PGP SIGNATURE-----



