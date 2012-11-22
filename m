Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbZUe-0004Nd-EP
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 17:19:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Nov 2012 08:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="171442983"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2012 08:05:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: aws.ismail@windriver.com
Date: Thu, 22 Nov 2012 16:05:03 +0000
Message-ID: <7737777.Md20e45oyb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <50AD258C.1070700@windriver.com>
References: <cover.1353425302.git.paul.eggleton@linux.intel.com>
	<d4690b3173005730a4095f921332eb35f9b16e74.1353425302.git.paul.eggleton@linux.intel.com>
	<50AD258C.1070700@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 3/8] quagga: add from OE-Classic, update and tidy-up
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
X-List-Received-Date: Thu, 22 Nov 2012 16:19:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 November 2012 14:03:40 Aws Ismail wrote:
> On 11/20/2012 10:30 AM, Paul Eggleton wrote:
> > diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.init
> > b/meta-networking/recipes-protocols/quagga/files/quagga.init new file
> > mode 100644
> > index 0000000..d786a5a
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/quagga/files/quagga.init
> > @@ -0,0 +1,200 @@
> > +#!/bin/sh
> > +#
> > +# /etc/init.d/quagga -- start/stop the Quagga routing daemons
> > +#
> > +# Based on debian version by Endre Hirling <endre@mail.elte.hu> and
> > +# Christian Hammers <ch@debian.org>.
> > +#
> > +
> > +### BEGIN INIT INFO
> > +# Provides: quagga
> > +# Required-Start: $local_fs $network $remote_fs $syslog
> > +# Required-Stop: $local_fs $network $remote_fs $syslog
> > +# Default-Start:  2 3 4 5
> > +# Default-Stop: 0 1 6
> > +# Short-Description: start and stop the Quagga routing suite
> > +# Description: Quagga is a routing suite for IP routing protocols like
> > +#              BGP, OSPF, RIP and others. This script contols the main
> > +#              daemon "quagga" as well as the individual protocol
> > daemons.
> > +### END INIT INFO
> > +
> > +# NOTE: sbin must be before bin so we get the iproute2 ip and not the
> > +# busybox ip command. The busybox one flushes all routes instead of just
> > +# the dynamic routes
> > +PATH=/sbin:/usr/sbin:/bin:/usr/bin:/sbin
> > +D_PATH=/usr/sbin/quagga
> 
> Shouldn't this be /usr/sbin rather than /usr/sbin/quagga.
> That's where the daemons are being installed, right?

Ah yes, looks like it should be. Thanks.

> > diff --git
> > a/meta-networking/recipes-protocols/quagga/files/watchquagga.default
> > b/meta-networking/recipes-protocols/quagga/files/watchquagga.default new
> > file mode 100644
> > index 0000000..f152032
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
> > @@ -0,0 +1,7 @@
> > +# Watchquagga configuration
> > +#watch_daemons="zebra bgpd ospfd ospf6d ripd ripngd"
> > +watch_daemons="zebra"
> > +
> > +# To enable restarts, uncomment this line (but first be sure to edit
> > +# the WATCH_DAEMONS line to reflect the daemons you are actually using):
> > +watch_options="-Az -b_ -r/etc/init.d/quagga_restart_%s
> > -s/etc/init.d/quagga_start_%s -k/etc/init.d/quagga_stop_%s"
>
> Paul, these watch_options won't work because -A does not seem to jive
> when a single daemon (i.e. zebra) is being used.
> Recommend using something like:
> 
> watch_options="-z -b_ -r/etc/init.d/quagga_restart_%s"

OK, this is something that came from the OE-Classic recipe from which this one 
is derived. If -A is not going to work here I will remove it.

I'll send out a v2 with these fixes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


