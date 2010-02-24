Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NkCKe-0000GA-NU
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 09:10:59 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7A7D0491264
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 09:08:13 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 24 Feb 2010 09:08:53 +0100
Message-ID: <4B84DE66.4080602@dresearch.de>
Date: Wed, 24 Feb 2010 09:08:06 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 24 Feb 2010 08:08:53.0596 (UTC)
	FILETIME=[9AEC09C0:01CAB528]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Angstrom, udev, and kernel version
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
X-List-Received-Date: Wed, 24 Feb 2010 08:10:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since Angstrom updated to udev_151 we've a big problem.

udevd started from within /etc/init.d/udev crashes with

/sbin/udevd -d --debug
1266997931.250494 [297] udev_monitor_new_from_netlink: error getting socket: Invalid argument error initializing netlink socket
1266997931.250718 [297] main: error initializing netlink socket

Searching the internet for this error i found some hints that this udev version requires at least linux 2.6.27. Unfortunately we are forced to use 2.6.24 because of special driver/machine support for hipox. :(

Is there a way to rollback to udev_141 for hipox machine?

Or is there a backport patch available for 2.6.24 to support udev_151?

Steffen



