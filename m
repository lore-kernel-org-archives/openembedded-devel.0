Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TEbxB-0004OD-Iq for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:17:45 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TEbku-00086x-CE for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:05:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 10:05:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 10:05:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 20 Sep 2012 10:04:26 +0200
Message-ID: <k3eim5$mre$2@ger.gmane.org>
References: <1347996907-22852-1-git-send-email-andrei@gherzan.ro>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1347996907-22852-1-git-send-email-andrei@gherzan.ro>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH][V2] zram: Integrate an init script
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
X-List-Received-Date: Thu, 20 Sep 2012 08:17:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-09-12 21:35, Andrei Gherzan schreef:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro> --- 
> meta-oe/recipes-extended/zram/zram/init         |   28 +++++++++++++++++ 
> meta-oe/recipes-extended/zram/zram/zram-load.sh |   37
> +++++++++++++++++++++++ meta-oe/recipes-extended/zram/zram_0.1.bb       |
> 24 +++++++++++++++ 3 files changed, 89 insertions(+) create mode 100644
> meta-oe/recipes-extended/zram/zram/init create mode 100644
> meta-oe/recipes-extended/zram/zram/zram-load.sh create mode 100644
> meta-oe/recipes-extended/zram/zram_0.1.bb
> 
> diff --git a/meta-oe/recipes-extended/zram/zram/init
> b/meta-oe/recipes-extended/zram/zram/init new file mode 100644 index
> 0000000..7bd8bcc --- /dev/null +++
> b/meta-oe/recipes-extended/zram/zram/init @@ -0,0 +1,28 @@ +#!/bin/bash 
> +### BEGIN INIT INFO +# Provides: zram +# Required-Start: +#
> Required-Stop: +# Default-Start: 2 3 4 5 +# Default-Stop: 0 1 6 +#
> Short-Description: Increased Performance In Linux With zRam (Virtual Swap
> Compressed in RAM) +### END INIT INFO +set -e + +case "$1" in +
> start) +        zram-load.sh --load +        ;; +    stop) +
> zram-load.sh --unload +        ;; +    restart) +        zram-load.sh
> --unload +        sleep 3 +        zram-load.sh --load +        ;; +
> *) +        echo "Usage: $0 {start|stop|restart}" +        RETVAL=1 
> +esac +exit $RETVAL diff --git
> a/meta-oe/recipes-extended/zram/zram/zram-load.sh
> b/meta-oe/recipes-extended/zram/zram/zram-load.sh new file mode 100644 
> index 0000000..786cd0c --- /dev/null +++
> b/meta-oe/recipes-extended/zram/zram/zram-load.sh @@ -0,0 +1,37 @@ 
> +#!/bin/sh + +num_cpus=$(grep -c processor /proc/cpuinfo) +[ "$num_cpus"
> != 0 ] || num_cpus=1 + +last_cpu=$((num_cpus - 1)) + +mem_by_cpu=$(awk -v
> cpus=$num_cpus '/MemTotal/ { print (($2 * 1024) / cpus) }'
> /proc/meminfo) + +if [ "$1" = "--load" ] ; then +	echo zram: Trying to
> load kernel module. + +	# Linux 3.2 workaround - value name changed :o. +
> modprobe -q zram zram_num_devices=$num_cpus + +	# Linux < 3.2. +
> #modprobe -q zram num_devices=$num_cpus + +	echo zram: Enable in-memory
> compressed swap of $mem_by_cpu bytes. +	for i in $(seq 0 $last_cpu); do +
> echo 1 > /sys/block/zram$i/reset +		echo $mem_by_cpu >
> /sys/block/zram$i/disksize +		mkswap /dev/zram$i +		swapon -p 100
> /dev/zram$i +	done +fi + +if [ "$1" = "--unload" ] ; then +	echo zram:
> Disable in-memory compressed swap. +	for i in $(seq 0 $last_cpu); do +
> grep -q "/dev/zram$i" /proc/swaps && swapoff /dev/zram$i +	done + +	sleep
> 1 +	echo zram: Unload kernel module. +	rmmod zram +fi diff --git
> a/meta-oe/recipes-extended/zram/zram_0.1.bb
> b/meta-oe/recipes-extended/zram/zram_0.1.bb new file mode 100644 index
> 0000000..dd59784 --- /dev/null +++
> b/meta-oe/recipes-extended/zram/zram_0.1.bb @@ -0,0 +1,24 @@ +DESCRIPTION
> = "Linux zram compressed in-memory swap" +LICENSE = "MIT" 
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58" + 
> +inherit allarch update-rc.d + +RDEPENDS_${PN} = "util-linux-swaponoff
> kmod kernel-module-zram"

You are never allowed to RDEPEND on a kernel-module, imagine what happens
when it's builtin. Also R* variables go below do_install

> + +PR = "r0"

Remove that

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQWs4JMkyGM64RGpERArflAJ9et18piezL0x+DWynSvSvjFeKPDACeJ/N3
AYTy8UaWNsNAxNxw5ciDx74=
=ahxG
-----END PGP SIGNATURE-----



