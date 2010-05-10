Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OBNbT-0004Wj-KJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 09:40:40 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7989E49127F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 09:36:49 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 10 May 2010 09:38:03 +0200
Message-ID: <4BE7B795.1010607@dresearch.de>
Date: Mon, 10 May 2010 09:36:53 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE185C7.50305@dresearch.de>	<1273140949-14699-1-git-send-email-sledz@dresearch.de>	<hru6f7$4qk$1@dough.gmane.org>	<4BE29E46.2000600@dresearch.de>	<4BE3BA38.1010102@dresearch.de>	<hs0f5k$sl$1@dough.gmane.org>
	<4BE3C2B1.5040307@dresearch.de>
In-Reply-To: <4BE3C2B1.5040307@dresearch.de>
X-OriginalArrivalTime: 10 May 2010 07:38:03.0683 (UTC)
	FILETIME=[B944F730:01CAF013]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Mon, 10 May 2010 07:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>>>  #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
>>>> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
>>>> +PREFERRED_VERSION_linux-libc-headers       ?= "2.6.31"
>>>> +PREFERRED_VERSION_linux-libc-headers_hipox ?= "2.6.24"
>>>
>>> NACK, that creates undefined behaviour for multimachine builds.
>
>> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers       = "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
>
>> Is this better?
>
> No, it still changes the headers for one machine, which leads to
> undefined behaviour for other machines using the same arch.
> Any solution that doesn't mark *all* packages as machine specific for
> hipox is going to cause that behaviour.

Would be a

-PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers  ?= "2.6.31"

acceptable to allow overwrites in local.conf?

BTW: I did not found any fallback handling for inotify_init1 (added with 2.6.27) in the glibc.

Regards,
Steffen



