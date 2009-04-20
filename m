Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1LvmUg-0003dw-HO
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 07:56:40 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 88BFE31CCC1;
	Mon, 20 Apr 2009 01:52:21 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 20 Apr 2009 01:52:21 -0400
X-Sasl-enc: Fjx9NU0tqXv22uhrNyI6GyD7qQ08XIclGksJNbkfT9ux 1240206740
Received: from [120.17.222.93] (unknown [120.17.222.93])
	by mail.messagingengine.com (Postfix) with ESMTPA id 357EF24BB1;
	Mon, 20 Apr 2009 01:52:19 -0400 (EDT)
Message-ID: <49EC0D97.8010903@whitby.id.au>
Date: Mon, 20 Apr 2009 15:22:23 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>
	<45B59FD0.1000207@whitby.id.au>
In-Reply-To: <45B59FD0.1000207@whitby.id.au>
Cc: nslu2-developers@yahoogroups.com
Subject: Removal of the proprietary Intel IXP ethernet driver (ixp4{00, 25}-eth, ixp-osal, ixp4xx-csr) from OE
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
X-List-Received-Date: Mon, 20 Apr 2009 05:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

It seems that I intended to do this, but never got around to it.

<http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-January/001279.html>

There were no objections at the time (over 2 years ago), so unless there
are any objections in the next 48 hours it will be enacted.

-- Rod

Rod Whitby wrote (on 23/01/2007):
> For a long time, the only way to use the internal ethernet port for
> ixp4xx devices was to use the proprietary intel driver.  The driver
> could not be linked with the kernel, and tainted the kernel.
> 
> Thankfully, that has now changed with the development of the open source
> ixp npe kernel driver, which is GPL and can be freely linked with the
> kernel.  Note that the microcode firmware blob (ixp4xx-npe) which needs
> to be loaded by the driver is still Intel Proprietary and requires a
> click-through license on any firmware image that includes it.
> 
> The ixp4xx-kernel package (as of 2.6.19) now supports this new driver.
> It has been tested on the NSLU2, NAS100d, and Loft devices, and as of
> the 0.3.1 version is considered stable.
> 
> Accordingly, I propose to remove the Intel Proprietary driver from the
> OpenEmbedded metadata.  I also propose to remove versions of the
> ixp4xx-kernel earlier than 2.6.19.
> 
> The following packages will be obsoleted, and then removed:
> 
> ixp425-eth/ixp400-eth_1.4
> ixp425-eth/ixp400-eth_1.5
> ixp425-eth/ixp400-eth_1.5.1
> ixp425-eth/ixp425-eth_1.1
> ixp425-eth/ixp425-eth_1.2
> ixp4xx/ixp-osal_1.5
> ixp4xx/ixp-osal_2.0
> ixp4xx/ixp-osal_2.1
> ixp4xx/ixp-osal_2.1.1
> ixp4xx/ixp4xx-csr_1.4
> ixp4xx/ixp4xx-csr_1.5
> ixp4xx/ixp4xx-csr_2.0
> ixp4xx/ixp4xx-csr_2.1
> ixp4xx/ixp4xx-csr_2.1.1
> linux/ixp4xx-kernel_2.6.15.3
> linux/ixp4xx-kernel_2.6.16
> linux/ixp4xx-kernel_2.6.17
> linux/ixp4xx-kernel_2.6.18
> 
> Any objections?
> 
> [Note that this will not affect anyone's ability to build from the
> SlugOS binary release source code archives - they are in SVN.]
> 
> -- Rod



