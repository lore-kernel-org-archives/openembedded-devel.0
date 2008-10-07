Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnB6k-0000Re-M7
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 13:52:08 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnB2L-0001Xy-DK
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 11:47:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 11:47:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 11:47:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Oct 2008 13:47:19 +0200
Message-ID: <gcfi87$g4t$1@ger.gmane.org>
References: <48E6624C.7000409@opensimpad.org>
	<gc72hu$i8f$1@ger.gmane.org>	<48E758CB.7040209@opensimpad.org>
	<48EB45F0.8080809@opensimpad.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <48EB45F0.8080809@opensimpad.org>
Sender: news <news@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Tue, 07 Oct 2008 11:52:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-10-2008 13:20, Bernhard Guillon wrote:
> Any obstacles left? Else I would like to ask if some of you can please
> commit it [2] [3] to .dev branch.

I still dislike a single package handling so many different things *and* 
containing config files for other packages.


> best regards
> Bernhard Guillon
>
> 1 http://linuxtogo.org/gowiki/Angstrom/XQt/playground
> 2 http://bugs.openembedded.net/show_bug.cgi?id=4582
> 3 http://bugs.openembedded.net/show_bug.cgi?id=4603
>
> Bernhard Guillon schrieb:
>> Koen Kooi schrieb:
>>>
>>> NACK!
>>>
>>> +do_install() {
>>> [..]
>>> + install -d ${D}/home/root
>>> + install -m 0600 .blackboxrc ${D}/home/root
>>>
>>> A package NEVER EVER touches $HOME. NEVER! I wish ascii could
>>> produces some bigger capitals that blink and have baseballbats to get
>>> the point across, but sadly it can't.
>>>
>>> Imagine I don't log in as root and fire up packagekit to install that
>>> packages. I don't get the .blackboxrc, but the root user suddenly has
>>> his .blackboxrc overwritten without notice.
>>>
>>> So:
>>>
>>> A package NEVER EVER touches $HOME. NEVER!
>>>
>>> ${sysconfdir} exists for a reason.
>>>
>> Ok, I added a second version of the patch to the bugtracker which
>> implements your suggestion.
>>
>> I did use ${HOME} in the first version because it is the standard
>> location for blackbox configuration [1].
>>
>> Is there any way for a clean implementation to put the config to the
>> standard location? With e.g postinstall? I don't like the idea of not
>> using a standard location but I agree that hardcode to /home/root can
>> cause trouble.
>>
>>
>> best regards
>> Bernhard Guillon
>>
>> 1
>> http://blackboxwm.sourceforge.net/BlackboxDocumentation/BlackboxConfiguration#location
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




