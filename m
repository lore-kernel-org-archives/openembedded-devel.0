Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NpkpC-0002Or-ON
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 17:01:31 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A2FC3491264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 16:58:30 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 11 Mar 2010 16:58:48 +0100
Message-ID: <4B99132A.1060608@dresearch.de>
Date: Thu, 11 Mar 2010 16:58:34 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B990C32.6000906@dresearch.de> <hnb3e4$t8v$1@dough.gmane.org>
In-Reply-To: <hnb3e4$t8v$1@dough.gmane.org>
X-OriginalArrivalTime: 11 Mar 2010 15:58:48.0291 (UTC)
	FILETIME=[BC775330:01CAC133]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom opkg feed config
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
X-List-Received-Date: Thu, 11 Mar 2010 16:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>> At the moment recipes/angstrom/angstrom-feed-configs.bb creates
>> also config file for ${MACHINE_ARCH} specific packages. But at
>> least for the machine arch 'hipox' (i'm not sure for other ones)
>> the given URI does not exist. This results in an error when
>> calling 'opkg update':
> 
>> Collected errors:
>>  * Failed to download http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv5te/machine/hipox/Packages.gz, error 1
> 
>> Does this directory intentionally not exist?
> 
>> Wouldn't it be better to create an empty Packages.gz if there
>> are no machine arch specific packages?
> 
> Feel free to volunteer to support this machine in angstrom, ask on the
> angstrom devel mailinglist about it.

I'm not sure if i have the time to handle this. Sorry.

But as mentioned before, wouldn't it be a good idea to create an
empty Packages.gz for all OE known machine types which are not
officially supported by Angstrom just to avoid this error. That
sounds easy to realize.

Steffen



