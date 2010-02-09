Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Neq0q-000661-4O
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 14:20:23 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 672E849127F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 14:17:48 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Feb 2010 14:18:43 +0100
Message-ID: <4B716090.2090104@dresearch.de>
Date: Tue, 09 Feb 2010 14:18:08 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B7145A5.70808@dresearch.de> <1265716784.16488.1.camel@mattotaupa>
In-Reply-To: <1265716784.16488.1.camel@mattotaupa>
X-OriginalArrivalTime: 09 Feb 2010 13:18:43.0694 (UTC)
	FILETIME=[6749A0E0:01CAA98A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Tue, 09 Feb 2010 13:20:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
>> And here's what i like to see:
>> * Connect an USB-NIC should result in an DHCP-configured interface.
> 
> Do you have it configured somewhere (for example in [2])? If not you can
> use a daemon like NetworkManager.
> ...
> [2] /etc/network/interfaces

It's the Angstrom standard configuration containing e.g.

 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
 iface eth1 inet dhcp

But i'm not sure what this part means (especially what means 'auto'
here. Where can i found some documentation about the content of this
config file. The busybox and ifup/ifdown manpages are not very helpful
here. :(

And another problem is the mentioned naming. If every connected
USB-NIC gets a new name i cannot refer to it in this config file.

> I hope that helps.

Just a tiny bit.  ;-)

Steffen



