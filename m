Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KVwGZ-0002h6-BD
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 00:34:59 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KVwFT-0005YJ-6I
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 22:33:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 22:33:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 22:33:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 Aug 2008 00:33:44 +0200
Message-ID: <g8i648$tfh$1@ger.gmane.org>
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>	<g8gmvc$cob$1@ger.gmane.org>
	<19c1b8a90808200902i4a0d448chfcd591a708717177@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <19c1b8a90808200902i4a0d448chfcd591a708717177@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Wed, 20 Aug 2008 22:34:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi Koen
>
> Thanks for looking at it. While I see that what you mention is
> logical. The construct I have worked ok on uclibc and eglibc angstrom
> builds. But I will change to what you suggested and do builds again.

I suspect we've hit a feature of bitbake again:

FOO = "bar"
FOO_xyz ?= "baz"

=> FOO is now baz

FOO_xyz = "bar"
FOO_xyz ?= "baz"

=> FOO is now bar

I still think this is a bug and depending on it would not be a good idea :)

regards,

Koen

>
> Thanks
>
> -Khem
>
> On Wed, Aug 20, 2008 at 2:08 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> Khem Raj wrote:
>>> Hi
>>>
>>> I was trying to use gcc 4.3 for some uclibc stuff and found it broken.
>>> This patch fixes it.
>>>
>>> 1. Fix target gcc build. The earlier patch I did to fix SDK build was
>>> insufficient so I enhanced it.
>>>
>>> 2. uclibc Locale patches needed a facelift to be able to work with gcc 4.3
>>>
>>> 3. Fix uclibc 0.9.29 to get build using gcc 4.3
>>>
>>> 4. Disable libobjc for arm uclibc. If someone really needs some
>>> packages on uclibc which need objc support then you better fix gcc
>>> first :)
>>>
>>> I intend to apply it on .dev. comments are welcome
>>>
>>> I have tested it on arm uclibc and arm eglibc doing bitbake gcc
>> Your patch has
>>
>> +OBJC ?= ",objc"
>> +OBJC_linux-uclibcgnueabi ?= ""
>> +OBJC_avr ?= ""
>>
>> That probably needs to be:
>>
>> +OBJC_avr32 ?= ""
>> +OBJC_linux-uclibcgnueabi ?= ""
>> +OBJC ?= ",objc"
>>
>> Note the '32' in avr32 and the order of weak assignments.
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>




