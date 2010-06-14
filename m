Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OOBeq-00061K-Qz
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jun 2010 17:33:10 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DA05649128A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 17:28:38 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Jun 2010 17:28:38 +0200
Message-ID: <4C164AAE.3060100@dresearch.de>
Date: Mon, 14 Jun 2010 17:28:46 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1276246443-11931-1-git-send-email-sledz@dresearch.de>
	<4C1643F9.7080705@dcombus.com>
In-Reply-To: <4C1643F9.7080705@dcombus.com>
X-OriginalArrivalTime: 14 Jun 2010 15:28:38.0814 (UTC)
	FILETIME=[432D4BE0:01CB0BD6]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Mon, 14 Jun 2010 15:33:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 14.06.2010 17:00, Henri Bragge wrote:
>> * The former default behaviour was to exit with failure if lease is not
>>   immediately obtained. This results in permanent network disconnect
>>   if DHCP
>>   server is (accidentally) not available at boot time. :(

> Did not do the trick for me. I found out that there was another
> definition for udhcpc command in ifupdown.c (at least in busybox
> 1.13.2), that still had the -n parameter. I think that is the reason?

Can't find "another definition for udhcpc" in ifupdown.c.

Can you please check your build. Best would be a clean build.

Which distro and which machine you build for?

Steffen



