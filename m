Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L248T-0002Yc-J8
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 14:27:25 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L246A-0005ix-FL
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 13:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 13:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 13:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 14:23:54 +0100
Message-ID: <gfrr9a$p4c$2@ger.gmane.org>
References: <1226923118.6891.54.camel@akaza1> <gfrnrh$e05$1@ger.gmane.org>
	<1226925784.6891.58.camel@akaza1>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <1226925784.6891.58.camel@akaza1>
Sender: news <news@ger.gmane.org>
Subject: Re: KERNEL_INCLUDES in uClibc.
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
X-List-Received-Date: Mon, 17 Nov 2008 13:27:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17-11-08 13:43, Mikael Rosbacke wrote:
> mån 2008-11-17 klockan 13:25 +0100 skrev Koen Kooi:
>> On 17-11-08 12:58, Mikael Rosbacke wrote:
>>> Good day.
>>>
>>> I'm currently trying to get a uClibc based minimal image for x86 to
>>> build and have some problems with it. I'm using DISTRO='minimal-uclibc'
>>> and MACHINE='x86' and trying to build the target 'minimal-image'.
>> Try using the angstrom distribution, since minima-uclibc isn't really
>> support or working currently.
>>
> I've managed to get Angstrom working with glibc some days ago. But I
> would like to have something smaller.

Images tell what goes into a rootfs, not a distro, so 'smaller' isn't a 
criterium for switching distro.

> I scanned the distro folder but
> couldn't find a uClibc variant of it. Is there some other way to make
> angstrom use the uclibc?

ANGSTROM_MODE = "uclibc" in local.conf or 'ANGSTROM_MODE=uclibc bitbake 
<foo>"

regards,

Koen



