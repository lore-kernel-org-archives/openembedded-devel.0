Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1Hc7qT-0000Lf-3v
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2007 00:32:49 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 0EE5C214158;
	Thu, 12 Apr 2007 18:32:54 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 12 Apr 2007 18:32:49 -0400
X-Sasl-enc: AcX5kvWQ1I4klH4To1VFR9idCzBs5ig4GumAGVZ/iG0G 1176417168
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 15D351CB07;
	Thu, 12 Apr 2007 18:32:47 -0400 (EDT)
Message-ID: <461EB337.7020302@whitby.id.au>
Date: Fri, 13 Apr 2007 08:01:19 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200704122035.03980.openembedded@hrw.one.pl>
In-Reply-To: <200704122035.03980.openembedded@hrw.one.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Thu, 12 Apr 2007 22:32:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
>> My version create several task-base-*, task-distro-* packages which
>> cover several features one by one. Some features contain extra stuff
>> only if other features are available (for example Bluetooth on USB bus
>> only if distro supports BT and device support USB Host).
> 
> What this version gives:
> 
> - each feature gets own package,
> - task-boot contain ONLY stuff needed to boot
> - task-distro-base contain distro addons
> - task-machine-base contain machine specific addons
> - task-base depend on all needed task-* packages
> - ability to choose SSH daemon (dropbear, openssh, none) by distro
> - ability to choose /dev/ manager (udev, devfsd, mdev) by distro
> - ability to choose getty provider (tinylogin by default) by distro
> 
> With this version it is easier to create smaller rootfs - for example 
> image with ONLY bluetooth support is "task-boot + task-base-bluetooth".
> 
> Do some tests, post opinions - I think that this will be nice improvement 
> of task-base.

No tests yet, but it has the support of nslu2-linux distros.

I especially like the dropbear/openssh selection capability.

-- Rod


