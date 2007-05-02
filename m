Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1Hj2Vk-0006tt-5X
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2007 02:16:00 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id BCABD218649
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 May 2007 20:06:38 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 01 May 2007 20:06:39 -0400
X-Sasl-enc: XmKTIU7me2rJyn+S3XbR8wsRETP8oFd1WDqr6Rrz3jD2 1178064399
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id D85E9AFD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 May 2007 20:06:38 -0400 (EDT)
Message-ID: <4637D5B6.4060305@whitby.id.au>
Date: Wed, 02 May 2007 09:35:10 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <HOECLKEKOHLAMMGDLLBHKEFLKOAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHKEFLKOAA.skoroneos@digital-opsis.com>
Subject: Re: squasfs jffs2 default image settings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 00:16:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stelios Koroneos wrote:
> After a day of "head scratching" i realized the the reason an image i was
> building, failed to load on a powerpc target was that the default settings
> for squashfs squashfs-lzma and jffs2 were set to little endian architecture
> 
> //snip from  bitbake.conf
> 
> EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
> EXTRA_IMAGECMD_squashfs = "-le -b 16384"
> EXTRA_IMAGECMD_squashfs-lzma = "-le -b 16384"
> 
> These look like they were set for a specific machine (maybe i am wrong), but
> shouldn't the default settings be at least architecture neutral ?
> (Even the block sizes shouldn't be defined there as a machine might be
> better suited by another size)
> 
> Any objections to have EXTRA_IMAGECMD for these types of images default to
> no specific settings  ?

Fine with me.  I think the nslu2 and ixp4xx are the few dual-endian
machines in OE, and both of them are already set up to set the
endianness, padding and block size on those commands explicitly.

-- Rod


