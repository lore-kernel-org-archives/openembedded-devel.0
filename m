Received: from smtpauth05.prod.mesa1.secureserver.net ([64.202.165.99])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OOVlG-0003Q7-Vk
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 15:01:04 +0200
Received: (qmail 7757 invoked from network); 15 Jun 2010 12:49:54 -0000
Received: from unknown (209.242.7.146)
	by smtpauth05.prod.mesa1.secureserver.net (64.202.165.99) with ESMTP;
	15 Jun 2010 12:49:54 -0000
Message-ID: <4C1776EE.3080206@mwester.net>
Date: Tue, 15 Jun 2010 07:49:50 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>	<1276584950-22168-1-git-send-email-sledz@dresearch.de>
	<4C1769D5.4020601@dresearch.de>
In-Reply-To: <4C1769D5.4020601@dresearch.de>
X-SA-Exim-Connect-IP: 64.202.165.99
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 13:01:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Am 15.06.2010 08:55, schrieb Steffen Sledz:
>> * The former default behaviour was to exit with failure if lease is not
>>   immediately obtained. This results in permanent network disconnect if DHCP
>>   server is (accidentally) not available at boot time. :(
>>
>> * Since bb 1.14 this is no longer hardcoded and can be configured.
> 
> Some more ACKs?
> 
> Or NAKs (i hope not)?

I shall test with SlugOS, but that's a huge task -- not because of this
change, but because since the sysroot change many weeks ago, we still
have not got SlugOS building in OE again.  With the help of Khem, we're
a lot closer (gcc 4.2.4 builds again), but I still can't generate a
working LE image.

I'll see if I can get a BE image to work well enough today to test this.

-Mike


