Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpW25-0004nX-W3
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 02:18:18 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PpW0w-0006Ex-NO from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 17:17:06 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 17:17:06 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 18:17:05 -0700
Message-ID: <4D5B2586.5070105@mentor.com>
Date: Tue, 15 Feb 2011 18:16:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>	<4D5A8AD3.2050901@mentor.com>
	<AANLkTi=hEZq-Ow8DVi16tZtEzDy3cHC4gqgPbrcPpd57@mail.gmail.com>
In-Reply-To: <AANLkTi=hEZq-Ow8DVi16tZtEzDy3cHC4gqgPbrcPpd57@mail.gmail.com>
X-OriginalArrivalTime: 16 Feb 2011 01:17:05.0661 (UTC)
	FILETIME=[39511AD0:01CBCD77]
Subject: Re: linux-libc-headers and eglibc having circular dependency
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
X-List-Received-Date: Wed, 16 Feb 2011 01:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 04:49 PM, George Alexandru Dorobantu wrote:

> Here it is http://pastebin.com/YGbdjX1Q

Ah ha!  INHERIT += "gettext" doesn't belong in there.  If it's brought 
in globally, you get circular deps as you've found.  I assume you saw a 
message about missing inherit gettext in your build previously and 
thought this would fix it, yes?  I think that means we need to clarify 
the message a bit...

>
> Thank you
> George A. Dorobantu
>
>
> On Tue, Feb 15, 2011 at 9:16 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>
>> On 02/15/2011 04:20 AM, George Alexandru Dorobantu wrote:
>>
>>> Hello guys,
>>>
>>> I've just started a new building and I got this error:
>>>
>>> g@g-home:/media/500GB/oe/openembedded$ bitbake qt4e-base-image
>>> NOTE: Handling BitBake files: - (7318/7318) [100 %]
>>> Parsing of 7318 .bb files complete (6892 cached, 426 parsed). 7596
>>> targets,
>>> 357 skipped, 0 masked, 0 errors.
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.10.2"
>>> METADATA_BRANCH   = "org.openembedded.dev"
>>> METADATA_REVISION = "b4a8a11"
>>> TARGET_ARCH       = "arm"
>>> TARGET_OS         = "linux-gnueabi"
>>> MACHINE           = "qemuarm"
>>> DISTRO            = "angstrom"
>>> DISTRO_VERSION    = "v20110215"
>>> TARGET_FPU        = "soft"
>>>
>>> NOTE: Resolving any missing task queue dependencies
>>> FATAL: Task /media/500GB/oe/openembedded/recipes/linux-libc-headers/
>>> linux-libc-headers_2.6.32.bb (do_package) has circular dependency on
>>> /media/500GB/oe/openembedded/recipes/eglibc/eglibc_2.12.bb (do_package)
>>>
>>>
>>> Can anyone help me with this?
>>>
>>
>> Can you please put your local.conf into pastebin.com and give us a link?
>>   We don't usually see this kind of problem, thanks!
>>
>> --
>> Tom Rini
>> Mentor Graphics Corporation
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Tom Rini
Mentor Graphics Corporation


