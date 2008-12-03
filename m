Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L7lfI-0001bq-OB
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 07:56:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L7lbv-0008Ck-Le
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 06:53:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 03 Dec 2008 06:53:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Dec 2008 06:53:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Dec 2008 07:53:13 +0100
Message-ID: <gh5acq$b72$1@ger.gmane.org>
References: <ggq1n1$85a$1@ger.gmane.org>	<20081129181339.7152fdd4@widy.localdomain>
	<bc64b4640812021611y34db8237vb1c286de035b99bc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <bc64b4640812021611y34db8237vb1c286de035b99bc@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: packaging question
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
X-List-Received-Date: Wed, 03 Dec 2008 06:56:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-12-08 01:11, Dmitry wrote:
> 2008/11/29 Paul Sokolovsky<pmiscml@gmail.com>:
>> Hello,
>>
>> On Sat, 29 Nov 2008 00:17:37 +0000 (UTC)
>> Dmitry Baryshkov<dbaryshkov@gmail.com>  wrote:
>>
>>> Hi,
>>>
>>> To make suspend work on tosa w/o problems, I have to put several
>>> files into apm hooks directories. The question is: into which OE
>>> package should I put them?
>> This was discussed well once - please put all machine- and device-
>> specific hacks and workarounds into separate package(s), to not
>> contaminate the main device-independent package with them, which would
>> either cast the main package machine-specific (QA nightmare), or affect
>> other devices unexpectedly (even bigger QA nightmare). There're few
>> examples of this idea already, see apm-wifi-suspendfix,
>> bluez-dtl1-workaround packages.
>>
>> If such a package is machine specific, it's obvious where it should go
>> - into MACHINE_EXTRA_RDEPENDS. If it's however a workaround for
>> a particular device, especially pluggable, it makes sense to make it
>> more flexible and automagical and associate with the corresponding
>> kernel driver. See kernel.bbclass for how the packages above are
>> handled.
>
> Should I also bump PR of task-base after changing MACHINE_EXTRA_RRECOMMENDS?

and task-boot where appropriate.

regards,

Koen


>
>>> --
>>> With best wishes
>>> Dmitry
>> []
>>
>> --
>> Best regards,
>>   Paul                          mailto:pmiscml@gmail.com
>>
>
>
>




