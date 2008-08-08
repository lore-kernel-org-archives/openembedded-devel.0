Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KRQgK-0003OK-N9
	for openembedded-devel@openembedded.org; Fri, 08 Aug 2008 14:02:56 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KRQg7-00011t-Lu
	for openembedded-devel@openembedded.org; Fri, 08 Aug 2008 12:02:43 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 08 Aug 2008 12:02:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 08 Aug 2008 12:02:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 08 Aug 2008 14:02:36 +0200
Message-ID: <g7hcks$t7b$1@ger.gmane.org>
References: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>	<48980E9D.8000709@gmx.net>	<20080805124514.GA5131@doriath.ww600.siemens.net>	<489BFEB3.4060103@gmx.net>
	<20080808100611.3acb6c21@aquilonia.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080100)
In-Reply-To: <20080808100611.3acb6c21@aquilonia.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: ppc64 host
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
X-List-Received-Date: Fri, 08 Aug 2008 12:02:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Fri, 08 Aug 2008 10:07:15 +0200
> Robert Schuster<theBohemian@gmx.net>  wrote:
>
>> Hi Dmitry,
>>
>> Dmitry Baryshkov schrieb:
>>> I'm building the OE images on the ppc64 host (Apple xServe G5):
>>> Debian lenny (current), 64-bit kernel, 32-bit userspace.
>> 64 bit kernel + 32 bit userspace is calling for trouble. At one place
>> the autotools stuff will think it needs 64 bit pointers but the
>> compiler supports only 32 bit pointers.
>>
>> I was once experiencing this problem on an x86_64 box with 64 bit
>> kernel and 32 bit userland.
>>
> You can use the linux32 command to hide the 64 bitness from OE.

'linux32 screen -U' has been a life-saver[1] in the past for me :)

regards,

Koen

[1] no, not the candy



