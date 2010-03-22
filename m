Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NtcQY-0000c0-Rl
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 08:52:03 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 71275491286
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 08:48:53 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 22 Mar 2010 08:49:13 +0100
Message-ID: <4BA720E0.10806@dresearch.de>
Date: Mon, 22 Mar 2010 08:48:48 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B9E1C0D.5050806@dresearch.de> <20100321081236.GA6455@gmail.com>
In-Reply-To: <20100321081236.GA6455@gmail.com>
X-OriginalArrivalTime: 22 Mar 2010 07:49:13.0518 (UTC)
	FILETIME=[2A47ECE0:01CAC994]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc atomic instruction support for armv5te
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
X-List-Received-Date: Mon, 22 Mar 2010 07:52:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
>> As mentioned before i try to create a recipe for rsyslog.
>>
>> Now i hit the next big problem. The last item at
>> http://www.rsyslog.com/doc-build_from_repo.html says that
>>
>> "The availability of atomic instructions is vital for rsyslog"
>>
>> The gcc version 4.3.3 which is used for armv5te by default
>> misses this. :(
>>
>> Is there a newer gcc version with atomic instruction for armv5te
>> machines available/tested? I heard rumors that 4.4.3 shell
>> have it?
> 
> yes 4.4+ should have them as intrinsic functions.

Unfortunately angstrom uses 4.3.3 by default.

Is it possible to build just this one package with a newer gcc?

> Which ones are needed by rsyslog ?

__sync_fetch_and_sub
__sync_fetch_and_add
__sync_fetch_and_or
__sync_fetch_and_and
__sync_sub_and_fetch
__sync_lock_test_and_set
__sync_bool_compare_and_swap
__sync_val_compare_and_swap

Steffen



