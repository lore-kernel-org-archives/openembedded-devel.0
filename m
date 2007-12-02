Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1Iylmf-00063c-EC
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 11:10:45 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 5312659B26
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2007 05:07:26 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 02 Dec 2007 05:07:26 -0500
X-Sasl-enc: n1SouLM48aVjQ6wqj+Y3PL1ZlVeXtHUpNWBCSXkZp80b 1196590045
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 85D1F73E1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2007 05:07:25 -0500 (EST)
Message-ID: <475283BC.2030903@whitby.id.au>
Date: Sun, 02 Dec 2007 20:36:52 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47520EA7.8030507@whitby.id.au> <47526A83.30109@student.utwente.nl>
In-Reply-To: <47526A83.30109@student.utwente.nl>
Subject: Re: RFC: Inclusion of bootloader utilities in task-base
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
X-List-Received-Date: Sun, 02 Dec 2007 10:10:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>> Some MACHINE configurations have FEATURES defined for 'uboot' and
>> 'redboot'.  It looks like these are intended to identify the bootloader
>> used on that machine.
> 
>> These turn on additions to RDEPENDS in task-base for some bootloader
>> utilities.
> 
>> RFC #2: Shouldn't these be RRECOMMENDS unless they are absolutely
>> critical, so that you can ipkg remove them if you don't want them.
> 
> I'm not familiar with the finer points of bootloaders, so I'm not really
> qualified to respond to this, but if the utils are _critical_, they
> should be RDEPENDS in task-boot, not task base.

Agreed.  In the case of redboot and apex, they are not that critical.

The redboot util 'fis' is used to reflash fis directory partitions.

The apex util 'apex-env' is used to change the kernel cmdline from userspace.

Dunno about the uboot util package.

-- Rod


