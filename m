Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 901F66B1C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 08:44:52 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 01:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,792,1367996400"; d="scan'208";a="339991178"
Received: from unknown (HELO helios.localnet) ([10.252.122.169])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 01:44:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Thu, 01 Aug 2013 09:44:50 +0100
Message-ID: <1728270.BLIjGjro2R@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
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
X-List-Received-Date: Thu, 01 Aug 2013 08:44:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Wednesday 31 July 2013 21:28:50 Bryan Evenson wrote:
> I have a package that I created for my setup which, when upgraded, will
> require a system reboot.  Is there a general flag/setting that already
> exists to put in my Bitbake recipe to signal that the package requires a
> reboot?  If so, does it just set a flag that a reboot is required or does
> it force a reboot?

It would be worth checking to see if the package manager has any intrinsic 
support for this kind of thing; FWIW I don't know that the ones that we use do 
(at least, we have no out-of-the-box integration for such functionality - I 
know some package managers have "delay until end" functionality for things 
like ldconfig and man page indexes, but we don't currently support this as far 
as I know).

One approach (untested) that could work now however would be to define a 
postinstall script for the package that would start another script in the 
background or via cron; the latter script would then wait until the package 
manager finished and then do whatever was necessary to restart the machine.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

