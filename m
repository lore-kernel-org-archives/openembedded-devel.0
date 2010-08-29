Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OqPOs-0003rp-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 13:53:15 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A7919491286
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:52:43 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 31 Aug 2010 13:52:43 +0200
Resent-From: Steffen Sledz <sledz@dresearch.de>
Resent-To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Resent-Date: Tue, 31 Aug 2010 13:52:52 +0200
Resent-Message-Id: <4C7CED14.9060504@dresearch.de>
Resent-User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.8) Gecko/20100802 Lightning/1.0b2 Thunderbird/3.1.2
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 29 Aug 2010 11:39:25 +0000
Message-ID: <4C7A46EA.9040609@dresearch.de>
Date: Sun, 29 Aug 2010 13:39:22 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.11) Gecko/20100714 SUSE/3.0.6 Lightning/1.0b1
	Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>	<4C77C60E.3080106@dresearch.de>
	<AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>
In-Reply-To: <AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>
X-OriginalArrivalTime: 31 Aug 2010 11:52:43.0752 (UTC)
	FILETIME=[05943680:01CB4903]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Tue, 31 Aug 2010 11:53:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 28.08.2010 01:34, schrieb Khem Raj:
>>> +INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
>>
>> I just wanted to ask if there are any objections (e.g. a policy on
>> using start/stop order 'levels') in using 'stop 90' here.
>>
> 
> I guess its distro maintainers call isnt it ?

I'm not sure if it is. That's why i asked for policies about this. ;-)

Steffen



