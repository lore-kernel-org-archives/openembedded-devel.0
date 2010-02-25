Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NkYmh-0002MC-Sm
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:09:24 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id EF63549127F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 09:06:39 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 25 Feb 2010 09:07:23 +0100
Message-ID: <4B862F8F.4050001@dresearch.de>
Date: Thu, 25 Feb 2010 09:06:39 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B84DE66.4080602@dresearch.de> <hm32cp$h8m$1@dough.gmane.org>
In-Reply-To: <hm32cp$h8m$1@dough.gmane.org>
X-OriginalArrivalTime: 25 Feb 2010 08:07:23.0127 (UTC)
	FILETIME=[8F695070:01CAB5F1]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom, udev, and kernel version
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
X-List-Received-Date: Thu, 25 Feb 2010 08:09:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>> udevd started from within /etc/init.d/udev crashes with
>> 
>> /sbin/udevd -d --debug
>> 1266997931.250494 [297] udev_monitor_new_from_netlink: error getting socket: Invalid argument error initializing netlink socket
>> 1266997931.250718 [297] main: error initializing netlink socket
>> 
>> Searching the internet for this error i found some hints that this udev version requires at least linux 2.6.27.
> 
> 2.6.27 is only required for signalfd, your error seems to be about a
> missing networking option in defconfig.

Any hints, how we can isolate this problem?



