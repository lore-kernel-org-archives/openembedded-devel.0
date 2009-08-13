Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbUkY-0002sx-TH for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 09:29:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbUUW-00059p-JK for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 07:12:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 07:12:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 07:12:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Aug 2009 09:12:40 +0200
Message-ID: <h60eda$re1$1@ger.gmane.org>
References: <4A81BE84.6010607@atmel.com>	<200908121433.31479.marcin@juszkiewicz.com.pl>	<1250092579.12282.73.camel@mill.internal.reciva.com>
	<4A833D9F.1090608@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A833D9F.1090608@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Thu, 13 Aug 2009 07:29:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-08-09 00:09, Ulf Samuelsson wrote:
> Phil Blundell skrev:
>> On Wed, 2009-08-12 at 14:33 +0200, Marcin Juszkiewicz wrote:
>>> Dnia wtorek, 11 sierpnia 2009 o 20:55:00 Ulf Samuelsson napisał(a):
>>>> I introduced the possibility to build linux using
>>>> make<board>_defconfig, instead of using a
>>>> defconfig in a board directory under linux.
>>>> LINUX26_DEFCONFIG needs to be defined.
>>> Interesting, will check. I see a problem anyway because linux_*.bb
>>> recipes by default use defconfig as part of SRC_URI. But we can use
>>> empty file to satisfy it.
>>
>> We've tried this kind of thing before on various platforms and it
>> generally seems to be a losing proposition.  Even if your kernel sources
>> are targetting just a single MACHINE, the kernel isn't quite modular
>> enough yet that you can truly have a "one size fits all" configuration
>> to suit all DISTROs.
>>
>> Also, if you are relying on the defconfig from upstream, any
>> configuration change at all requires that you either patch it, or
>> re-issue the upstream tarball.  Neither of those are as convenient as
>> just editing the defconfig locally in OE.
>>
>> So, in general, I think you're probably better off sticking with the
>> "defconfig in FILESDIR" paradigm.  That's not to say I'm completely
>> opposed to adding the option to use the one from upstream, but I think
>> you would need to be a bit careful about where you use it.
>>
>> p.
>
> Initially, this is to allow easy test of a new board where a config
> exists in the kernel.

You're saying that a 'cp /path/to/source/linux/arch/arm/configs/foo 
/OE/org.oe.dev/recipes/linux/linux/foo/defconfig' is too hard?

regards,

Koen



