Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vijay.rathi@gmail.com>) id 1NKtjw-0006s1-4j
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 14:16:31 +0100
Received: by pxi13 with SMTP id 13so663059pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=HsQU98YAoEp3danjIAUKN3hPmYZ/9VpCmuM7KUQZJ0o=;
	b=Ujswi7GQL1X7By5x6CXmGH7X5vj6HvxJTU2HjQ7KpUXoZAWMykjuLLNLE5fgi8FY19
	jNcAxhvaZQkyWgPp1EWkuS+0RQVg4geyFQyTdzbU84iOB9CmAOGzWTFfPOCvcHCAmpvs
	XqIAZRTGivw+cvqtNG/GpbgYTcXM0RmBMapH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RGCvHR6URssGZ9QlJ2juw6MbbTyG/j7BcxrueJBM8Ww1rZbode3qaORsQvlfuEvGSt
	snry7wIxsCHQrN4WK8CNYnPTbwQXQUCSRXRQbYOh+7yOfATZQth+aYw0gsO8eZ1wQyD8
	C8aruanpTgFE1iciX7KbtfxBKB8U4MdcKRtHY=
MIME-Version: 1.0
Received: by 10.141.89.19 with SMTP id r19mr737612rvl.113.1260969280199; Wed, 
	16 Dec 2009 05:14:40 -0800 (PST)
In-Reply-To: <4B28D9D8.90102@balister.org>
References: <b381e0f80912150646v710aa0ecy4c4526d78f5acde3@mail.gmail.com>
	<b381e0f80912160336t7a5a447as34fe2684abcc3649@mail.gmail.com>
	<4B28C8D2.3000101@kernelconcepts.de>
	<b381e0f80912160454t1fa01b67id1a1426bbe97c722@mail.gmail.com>
	<4B28D9D8.90102@balister.org>
Date: Wed, 16 Dec 2009 18:44:40 +0530
Message-ID: <b381e0f80912160514m25966eex30346d116a3d0176@mail.gmail.com>
From: Vijay Rathi <vijay.rathi@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: vijay.rathi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Issue with bitbake
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
X-List-Received-Date: Wed, 16 Dec 2009 13:16:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Even after git pull, I am getting same build result.
Is this branch broken? OR Am  I missing some dependency?

I am not using -b option with bitbake anywhere.

Regards,
Vijay

On Wed, Dec 16, 2009 at 6:30 PM, Philip Balister <philip@balister.org>wrote:

> On 12/16/2009 07:54 AM, Vijay Rathi wrote:
>
>> Hi,
>>
>> Thanks for quick reply.
>>
>> I followed steps mentioned at :
>>
>> http://www.angstrom-distribution.org/building-angstrom
>>
>> I tried using two approach in different directory/environment
>>
>> 1. As mentioned in online manual, I added ->  MACHINE ?= "beagleboard"
>> (which
>> i feel incorrect)
>> 2. As mentioned in online manual, I added ->  MACHINE = "beagleboard"
>>
>> But I had same results with - bitbake base-image ie. libsdl-native...
>> failed
>>
>> I am using Fedora Core 9 on my host.
>>
>> Am I missing something?
>>
>
> Try a git pull and restart the build.
>
> Philip
>
>
>
>
>
>> Regards,
>> Vijay
>>
>> On Wed, Dec 16, 2009 at 5:17 PM, Florian Boor<
>> florian.boor@kernelconcepts.de>  wrote:
>>
>>  Hi,
>>>
>>> Vijay Rathi schrieb:
>>>
>>>> I have recently setup the bitbake, OE development tree as per the  wiki
>>>>
>>> for
>>>
>>>> beagleboard.
>>>>
>>>
>>> it would be good to have a link to which instruction you are referring.
>>>
>>>
>>>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>>
>>>> NOTE: Task failed:
>>>>
>>>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>>
>>> these logs should provide the information to find out what's wrong. You
>>> should
>>> try to provide them through some pastebin if you need help to find out
>>> what
>>> actually went wrong.
>>>
>>> Greetings
>>>
>>> Florian
>>>
>>> --
>>> The dream of yesterday                  Florian Boor
>>> is the hope of today                    Tel: +49 271-771091-15
>>> and the reality of tomorrow.            Fax: +49 271-771091-19
>>> [Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
>>>                                        http://www.kernelconcepts.de/en
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>  _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

