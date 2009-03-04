Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Leoe2-0002df-AW
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:48:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Leo6k-0007hL-9s
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 10:13:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:13:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:13:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 11:13:30 +0100
Message-ID: <golk8b$52t$1@ger.gmane.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>	<49ADB183.5070709@balister.org>	<1236120999.10602.70.camel@andromeda>
	<49AE5117.5020806@gefanuc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <49AE5117.5020806@gefanuc.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 10:48:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-03-09 10:59, Martyn Welch wrote:
> Michael 'Mickey' Lauer wrote:
>> Am Dienstag, den 03.03.2009, 17:38 -0500 schrieb Philip Balister:
>>> Michael 'Mickey' Lauer wrote:
>>>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>>>> Module: openembedded.git
>>>>> Branch: org.openembedded.dev
>>>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>>>> URL:
>>>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=eee859a9c348871d6d644ece76bc57b151cc80e8
>>>>>
>>>>>
>>>>> Author: Koen Kooi <koen@openembedded.org>
>>>>> Date: Tue Mar 3 21:47:57 2009 +0100
>>>>>
>>>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot
>>>>> deleted 1.10
>>>> Ah, are we in that mood again? Take more pills.
>>> We need to have a serious discussion about deleting recipes. I know
>>> the deletion of python 2.5 will force me to address the 2.5->2.6
>>> upgrade in gnuradio before the upstream developers are ready.
>>>
>>> We need a way to remove recipes, but doing it as part of adding a new
>>> recipe is causing problems for OE users.
>>
>> Yes, we need to have a serious discussion about lots of things
>> surrounding the OpenEmbedded project, before the popularity kills the
>> project. Judging from the amount of interest though, I don't see that
>> happening -- neither short term nor long term.
>>
>
> Ok, so if a serious discussion is out of the question, lets just have a
> normal discussion.
>
> I see this issue to be partially related to the on going discussions
> regarding submissions. I assume that the "Commit_Policy"[1] on the wiki
> is either unofficial, out-of-date or optional as it states:
>
> * Changes to core toolchain components need review (gcc, binutils,
> libtool, pkgconfig, automake, autoconf etc.)
>
> Where:
>
> "Review" is defined as posting it on the mailing lists and getting
> positive agreement from two or more core developers.
> Now a quick check of my OpenEmbedded mail folder doesn't chuck up any
> messages with automake in the title that have a patch with this commit.
> Maybe I'm looking on the wrong mailing list.

I haven't seen anything like that either, and upgrading automake *did* 
break, since a lot of apps now do 'install -s' which calls host strip :(
This is exactly why we did extensive testing the last time we touched 
automake.

regards,

Koen



