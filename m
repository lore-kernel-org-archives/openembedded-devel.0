Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H9EOW-0001SI-OL
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jan 2007 06:40:32 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 1897A93FE4;
	Tue, 23 Jan 2007 00:40:32 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Tue, 23 Jan 2007 00:40:32 -0500
X-Sasl-enc: MZpFWp53TPHt4ax2/pk83ZyAseDQh6xstcy8Kd+5rkZL 1169530831
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 77C57C9C5;
	Tue, 23 Jan 2007 00:40:29 -0500 (EST)
Message-ID: <45B59FD0.1000207@whitby.id.au>
Date: Tue, 23 Jan 2007 16:10:32 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>
	<45B5528F.3050108@whitby.id.au>
In-Reply-To: <45B5528F.3050108@whitby.id.au>
Cc: John Bowler <jbowler@acm.org>, nslu2-developers@yahoogroups.com
Subject: Removal of the proprietary Intel IXP ethernet driver (ixp4{00, 25}-eth, ixp-osal, ixp4xx-csr) from OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2007 05:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

For a long time, the only way to use the internal ethernet port for
ixp4xx devices was to use the proprietary intel driver.  The driver
could not be linked with the kernel, and tainted the kernel.

Thankfully, that has now changed with the development of the open source
ixp npe kernel driver, which is GPL and can be freely linked with the
kernel.  Note that the microcode firmware blob (ixp4xx-npe) which needs
to be loaded by the driver is still Intel Proprietary and requires a
click-through license on any firmware image that includes it.

The ixp4xx-kernel package (as of 2.6.19) now supports this new driver.
It has been tested on the NSLU2, NAS100d, and Loft devices, and as of
the 0.3.1 version is considered stable.

Accordingly, I propose to remove the Intel Proprietary driver from the
OpenEmbedded metadata.  I also propose to remove versions of the
ixp4xx-kernel earlier than 2.6.19.

The following packages will be obsoleted, and then removed:

ixp425-eth/ixp400-eth_1.4
ixp425-eth/ixp400-eth_1.5
ixp425-eth/ixp400-eth_1.5.1
ixp425-eth/ixp425-eth_1.1
ixp425-eth/ixp425-eth_1.2
ixp4xx/ixp-osal_1.5
ixp4xx/ixp-osal_2.0
ixp4xx/ixp-osal_2.1
ixp4xx/ixp-osal_2.1.1
ixp4xx/ixp4xx-csr_1.4
ixp4xx/ixp4xx-csr_1.5
ixp4xx/ixp4xx-csr_2.0
ixp4xx/ixp4xx-csr_2.1
ixp4xx/ixp4xx-csr_2.1.1
linux/ixp4xx-kernel_2.6.15.3
linux/ixp4xx-kernel_2.6.16
linux/ixp4xx-kernel_2.6.17
linux/ixp4xx-kernel_2.6.18

Any objections?

[Note that this will not affect anyone's ability to build from the
SlugOS binary release source code archives - they are in SVN.]

-- Rod




