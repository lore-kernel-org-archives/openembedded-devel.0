Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NrnHj-0002Ea-BH
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 08:03:23 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 4E04424830
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 08:00:16 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Am0WAFcaoEtT4zvyPGdsb2JhbAAHgwSYAwEBAQE3pwWQJIEsgmBqBIYZ
X-IronPort-AV: E=Sophos;i="4.49,656,1262559600"; d="scan'208";a="51644663"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 17 Mar 2010 08:00:16 +0100
Message-ID: <4BA07DFF.7090506@atmel.com>
Date: Wed, 17 Mar 2010 08:00:15 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: ulf.samuelsson@atmel.com
References: <1268609353-31224-1-git-send-email-ulf.samuelsson@atmel.com>	<201003150733.48704.marcin@juszkiewicz.com.pl>	<4B9DD9D9.90909@atmel.com>
	<hnksah$k9i$1@dough.gmane.org> <4BA07C78.7050607@atmel.com>
In-Reply-To: <4BA07C78.7050607@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] alsa-state: Add support for at91 boards
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
X-List-Received-Date: Wed, 17 Mar 2010 07:03:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:
> Koen Kooi skrev:
>> On 15-03-10 07:55, Ulf Samuelsson wrote:
>>> Marcin Juszkiewicz skrev:
>>>> Dnia poniedziaBek, 15 marca 2010 o 00:29:13 Ulf Samuelsson napisaB(a):
>>>>> Add ALSA configuration files for at91 boards
>>>> Add bump PR of alsa-state and I will push such version.
>>>>
>>>> Regards, 
>>> OK.
>>> Base on your comment on linux, I will change to have a common directory
>>> as well, but is there a smarter way?
>>> What I'd often like to do is to have one directory
>>> for a group of machines.
>>> So instead of:
>>> ++++++++++++++++++++++++++
>>> FILES_XXX = " <Something> "
>>> SRC_URI_at91sam92620ek = ${FILES_XXX}
>>> SRC_URI_at91sam92621ek = ${FILES_XXX}
>>> SRC_URI_at91sam92623ek = ${FILES_XXX}
>>> ------------------------
>>> I'd like to do:
>>> -----------------------------
>>> SRC_URI_at91 = " <Something> "
>>> +++++++++++++++++++++++++++++
>> Add SOC_CLASS = "at91" to the common machine include file and then you
>> can do what you describe.
>>
> 
> Tried that and it failed.
> 
> $ cd <INSTALL>/openembedded
> $ grep -R SOC_CLASS *
> did not find anything which I did not put there.
> 
> Is there really such a function, with a different name,
> or was it proposed, but never implemented?
> 
> 
Don't bother, I found it.

It is called "SOC_FAMILY"


> 
>> regards,
>>
>> Koen
>>
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 


-- 
Best Regards
Ulf Samuelsson



