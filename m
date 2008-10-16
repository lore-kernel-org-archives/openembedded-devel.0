Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqN07-0001Rq-9y
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 09:10:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqMv1-0005Vn-8W
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 07:05:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 07:05:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 07:05:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Oct 2008 09:05:01 +0200
Message-ID: <gd6p2t$th1$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org> <gd4aul$sb5$1@ger.gmane.org>
	<200810152317.10733.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810152317.10733.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Thu, 16 Oct 2008 07:10:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 23:17, Holger Freyther wrote:
> On Wednesday 15 October 2008 10:51:33 Koen Kooi wrote:
>> On 15-10-2008 10:22, Holger Freyther wrote:
>>> Hey guys,
>>>
>>> I would start linking everything with -Wl,--hash-style=both as this is
>>> said to speed up the loading of shared libraries by about 50%
>> Also check the as-needed stuff from Poky:
>>
>> ASNEEDED = "-Wl,--as-needed"
>> ASNEEDED_pn-console-tools = ""
>> ASNEEDED_pn-distcc = ""
>> ASNEEDED_pn-openobex = ""
>> ASNEEDED_pn-icu = ""
>> ASNEEDED_pn-xserver-kdrive-xomap = ""
>> ASNEEDED_pn-minimo = ""
>> ASNEEDED_pn-pciutils = ""
>> ASNEEDED_pn-puzzles = ""
>> ASNEEDED_pn-dialer = ""
>>
>> TARGET_LDFLAGS += "${ASNEEDED}"
>>
>> That should also reduce library load time *and* eliminate spurious deps.
>
> Thanks. holger/hash-style has my take on that. It attempts to keep the
> enabling to the libc and distro and the blacklist can be shared among
> everyone.
>
> comments?

Looks good, but I first would like to know how one can identify a recipe 
that breaks with as-needed. Does it fail to link, does it crash at 
runtime, etc?

regards,

Koen



