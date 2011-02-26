Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PtJZk-0001IL-1t
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 13:48:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 91865314E1B2;
	Sat, 26 Feb 2011 13:47:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id a+D5hdEiur6X; Sat, 26 Feb 2011 13:47:13 +0100 (CET)
Received: from [172.22.22.61] (ip-81-210-156-22.unitymediagroup.de
	[81.210.156.22])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 5CA36314E1AF;
	Sat, 26 Feb 2011 13:47:13 +0100 (CET)
Message-ID: <4D68F651.80908@opendreambox.org>
Date: Sat, 26 Feb 2011 13:47:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<4D679C54.9060202@opendreambox.org>
	<AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
In-Reply-To: <AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Sat, 26 Feb 2011 12:48:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/25/2011 06:28 PM, Khem Raj wrote:
> On Fri, Feb 25, 2011 at 4:11 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> On 02/25/2011 08:51 AM, Khem Raj wrote:
>>> Well one way is to have kernel headers per machine which means you can
>>> not share target packages anymore since they have to build per machine
>>> but it would be much integrated solution and we could generate the
>>> kernel headers from the kernel recipe itself so we are sure that the
>>> .config of kernel headers match the .config of  kernel itself
>>> downside is it will defeat the multimachine sharing packages a bit.
>>
>> The .config does not have any influence on the generated
> 
> yes thats right
> 
>> linux-libc-headers by definition. linux-libc-headers must not contain
>> any CONFIG_* statements, because they are meant to be independent of it.
>> The kernel config is not available to linux-libc-headers after all.
>>
>> The point I was trying to make is that feature detection at compile time
>> is impossible, if the feature can be disabled by the kernel config
>> (which is the case for epoll and inotify, which in turn were the
>> examples discussed on the mailing list in May 2010). You need to do
>> runtime tests in programs intended to be portable.
> 
> which may not be easy to do for cross compiled packages unless they are patches
> to make this test dynamic

That doesn't make any sense. Runtime tests aren't affected by any cross
compilation issues. Runtime tests are dynamic by nature.

Regards,
Andreas


