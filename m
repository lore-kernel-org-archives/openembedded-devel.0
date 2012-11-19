Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TaVs3-0003f0-Oh
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:15:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Nov 2012 10:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,280,1352102400"; d="scan'208";a="219780065"
Received: from unknown (HELO helios.localnet) ([10.252.122.190])
	by azsmga001.ch.intel.com with ESMTP; 19 Nov 2012 10:00:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Nov 2012 18:00:50 +0000
Message-ID: <5887051.MbDNksKi0G@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <k8drqf$id4$1@ger.gmane.org>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
	<738d5da6dd36ec7c495cb2ed90d969095e99b8fb.1353345006.git.paul.eggleton@linux.intel.com>
	<k8drqf$id4$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 3/8] quagga: add from OE-Classic, update and tidy-up
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
X-List-Received-Date: Mon, 19 Nov 2012 18:15:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 November 2012 18:55:33 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 19-11-12 18:11, Paul Eggleton schreef:
> > * Update to 0.99.21 * Fix SRC_URI to point to a working download
> > location * Make LICENSE more accurate * Add LIC_FILES_CHKSUM * Add old
> > gentoo patch to fix libcap linking errors * Put binaries in sbindir * Use
> > useradd.bbclass to create user/groups * Add LSB headers to init script
> > (borrowed from debian) * Tidy up packaging and directory references * Add
> > SUMMARY
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> 
> dd94a
> 
> > --- /dev/null +++
> > b/meta-networking/recipes-protocols/quagga/files/watchquagga.init @@ -0,0
> > +1,64 @@ +#!/bin/sh +# +### BEGIN INIT INFO +# Provides: watchquagga +#
> > Required-Start: $local_fs $network $remote_fs $syslog +# Required-Stop:
> > $local_fs $network $remote_fs $syslog +# Default-Start:  2 3 4 5 +#
> > Default-Stop: 0 1 6 +# Short-Description: start and stop the Quagga
> > watchdog +### END INIT INFO + +PATH=/bin:/usr/bin:/sbin:/usr/sbin + +#
> > Load configuration +test -f /etc/default/watchquagga && .
> > /etc/default/watchquagga
> 
> hardcoded $sysconfdir
> 
> > + +# Check that there are daemons to be monitored. +[ -z "$watch_daemons"
> > ] && exit 0 + +pidfile="/var/run/quagga/watchquagga.pid"
> 
> hardcoded $localstatedir
> 
> > + +case "$1" in +    start) +	echo -n "Starting quagga watchdog daemon:
> > watchquagga" +	start-stop-daemon --start \ +		--pidfile $pidfile \ +
> > --exec /usr/sbin/watchquagga \
> 
> hardcoded $sbindir
> 
> [..]
> 
> etc.

Sure I can fix these, but you're aware there are a ton of these in meta-oe...?

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre


