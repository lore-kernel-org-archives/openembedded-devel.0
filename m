Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8HqY-0002OH-5h
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:18:38 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L8Hn4-0005Cf-EG
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 17:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 18:11:58 +0100
Message-ID: <gh930v$ks4$1@ger.gmane.org>
References: <gh8v57$5nk$1@ger.gmane.org> <49380C4F.1050809@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <49380C4F.1050809@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Thu, 04 Dec 2008 17:18:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 17:58, Mike (mwester) wrote:
> Koen Kooi wrote:
> ...
>> My current ideas:
>>
>> 1) remove /etc/dev.tar if its>  x weeks old
>> 2) recreate it on shutdown
>> 3) remove it after x times
>>
>> option 1) breaks on systems without an RTC and/or no /etc/timestamp
>> option 2) moves the slowness to shutdown
>> option 3) requires extra logic and filesystem access
>>
>> and all options don't fix the first case I mentioned, they all take a
>> while to make /dev/fb1 appear.
>>
>> The key is that it should be transparent to users, so adding a check for
>> .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that implies
>> that users are aware of the problem and know how to 'fix' it.
>>
>> Does anyone have other ways to invalidate the cache, and if not, which
>> option would get your vote?
>
> A slight improvement would be to make the dev.tar file dependent upon
> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
> doesn't match the current command line.  This could be a very fast
> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.

That solves only part of the problem, since on omap3 we enable a 
different fb driver that doesn't require any bootargs (and safely 
ignores the ones for the old driver) and gives you an additional overlay 
(/dev/fb2).

But I think combining the 'cmp /proc/cmdline /etc/dev_cmdline' with 
option 2) would solve most of the problems I'm seeing in a not-too-ugly 
way :)

Thanks for the suggestion!

regards,

Koen



