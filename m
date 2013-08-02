Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2F76B22E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2013 11:02:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2013 04:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,800,1367996400"; d="scan'208";a="276753066"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 04:02:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Fri, 02 Aug 2013 12:02:33 +0100
Message-ID: <1535997.schkkc0hlE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D2BC@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
	<20130801103252.GL3280@jama>
	<91586D499ADFD74FBCFB8425266A5DE40153ADA9D2BC@pluto.melinkcorp.local>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: opkg: How to make package signal reboot required?
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
X-List-Received-Date: Fri, 02 Aug 2013 11:02:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Thursday 01 August 2013 08:27:32 Bryan Evenson wrote:
> Thanks for the replies.  If there is nothing standard in place at the
> moment, then I'm planning on setting things up on my end to follow the
> standard (from what I can tell) Debian practice.  In my pkg_postinst, I'm
> going to add the lines:
> 
> #!/bin/sh -e
> if test "x$D" = "x"; then
>     touch /var/run/reboot-required
>     cat ${PN} >> /var/run/reboot-required.pkgs
> fi
> 
> Then in my script that does the firmware upgrade, I'll check for the
> existence of /var/run/reboot-required to determine whether the system needs
> to be rebooted.
> 
> If anything can be done to add the above (or something similar) to the
> pkg_postinst by setting a flag in the Bitbake recipe, I'm all for it.  I'm
> not quite sure which piece would be responsible for such action (oe-core? 
> Bitbake? Something else?).  If someone could suggest the proper place, I'd
> happily submit a request on the proper bug tracker.

Since this is something that would be implemented in OE-Core the best place 
for this would be the Yocto Project bugzilla which tracks bugs/enhancements 
for that:

https://bugzilla.yoctoproject.org/

If you could file it under Runtime -> Package Management Issues -> 
package-management-Issues and mark it as "enhancement" in the severity column 
that would be great.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

