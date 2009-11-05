Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N5ygR-0006rj-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 10:31:14 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 3E8EB491292
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 10:30:00 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 5 Nov 2009 10:32:27 +0100
Message-ID: <4AF29AFC.8030804@dresearch.de>
Date: Thu, 05 Nov 2009 10:29:32 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF1A5E2.3020002@dresearch.de>
	<alpine.LFD.2.00.0911050322460.17459@localhost>
In-Reply-To: <alpine.LFD.2.00.0911050322460.17459@localhost>
X-OriginalArrivalTime: 05 Nov 2009 09:32:28.0015 (UTC)
	FILETIME=[E3E567F0:01CA5DFA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qemu again :(
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
X-List-Received-Date: Thu, 05 Nov 2009 09:31:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robert P. J. Day wrote:
>> Yesterday i tried to use OE at my new notebook for the first time. But
>> i hit a qemu problem again:
>> ...
>> | mmap: Permission denied
>>
>> All solutions for this problem i found see the cause in a wrong
>> setting of mmap_min_addr (see e.g.
>> <http://www.bugcommunity.com/wiki/index.php/Kernel_and_Rootfs_Build_System#Potential_Problems_.26_Their_Solutions:>).
>>
>> But this setting is correct at my notebook:
>>
>> # cat /proc/sys/vm/mmap_min_addr
>> 0

> ...
> and if you read carefully, you'll notice that even if that value is
> correctly set to zero, you might still get an SELinux violation.  it's
> just a suggestion.

Thanx for the hint, but there's no SELinux (and no Apparmor) running.

Steffen




