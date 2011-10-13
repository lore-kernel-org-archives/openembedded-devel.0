Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RE9MX-0001i0-3D
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 02:41:29 +0200
Received: by ywf7 with SMTP id 7so612827ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=rHRGHU2wFVyUBDkRoyAUNRAUguzaMaz1l9n0w3ekXs0=;
	b=SjLQXX8XqzOjV/X5pH6E1316GaQp9ujQq+eM9pwqQ1kKeZDVVA4lYym5yrZeyJACot
	86QsiCZP4kQh13CRldRallRBwkn/qkRjFKRU9Cd7JYC7ICisY3ZAIv3LMSb1T9hiOpTe
	6SoJI8p70WgdUMx2rur0Z2EVXo2a0XTX8rVuw=
Received: by 10.68.7.202 with SMTP id l10mr4787774pba.22.1318466144066; Wed,
	12 Oct 2011 17:35:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.58.168 with HTTP; Wed, 12 Oct 2011 17:35:14 -0700 (PDT)
In-Reply-To: <4E963159.6020304@telia.com>
References: <4E936282.3030505@telia.com> <20111010213559.GI3125@denix.org>
	<4E938024.2090605@telia.com> <4E953F31.6080002@telia.com>
	<4E95E479.7070802@gmail.com> <4E963159.6020304@telia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2011 17:35:14 -0700
Message-ID: <CAMKF1spi_8cR0+3CWrv88F+=wS-VsA2_ruH741m+ptQv6D+q7g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: psyco-dist not supported on 64 bit Linux
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
X-List-Received-Date: Thu, 13 Oct 2011 00:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 5:31 PM, Ulf Samuelsson
<ulf_samuelsson@telia.com> wrote:
> On 2011-10-12 21:03, Khem Raj wrote:
>>
>> On 10/12/2011 12:18 AM, Ulf Samuelsson wrote:
>>>
>>> On 2011-10-11 01:30, Ulf Samuelsson wrote:
>>>>
>>>> On 2011-10-10 23:35, Denys Dmytriyenko wrote:
>>>>>
>>>>> On Mon, Oct 10, 2011 at 11:24:18PM +0200, Ulf Samuelsson wrote:
>>>>>>
>>>>>> psyco-dist will not run on a 64 bit linux.
>>>>>> The guys behind psyco-dist recommends the use of PyPy
>>>>>>
>>>>>> What is the recommendation for 64 bit linux?
>>>>>>
>>>>>> Just run without JIT?
>>>>>> Don't run on a 64 bit linux?
>>>>>> Anything else?
>>>>>
>>>>> Yes, not supporting 64-bit hosts is one of the known limitations of
>>>>> psyco.
>>>>> Being stuck with Python 2.6 is another limitation.
>>>>>
>>>>> But, latest bitbake appears to be quite fast even w/o using psyco
>>>>> these days.
>>>>> Especially with parallel parsing on multiple cores...
>>>>>
>>>>
>>>> OK, I will try without JIT then.
>>>>
>>> Now I have some results.
>>>
>>> Building a custom x11 image on a 32 bit Ubuntu 10.10/psyco-dist took 91
>>> minutes.
>>> Building the same image on a 64 bit Ubuntu 11.04 without psyco-dist too=
k
>>> 109 minutes
>>> (The last machine was an i7-920 w 4 GB RAM)
>>> The first might be the same, alternatively it was a machine with 6 GB
>>> RAM.
>>>
>>> =3D It takes 20% more time on a 64 bit O/S.
>>>
>>
>> are these on same hardware running once 32bit or and second time 64bit O=
S
>> ?
>>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I have two core i7 machines
> #1 Dell Studio XPS with a 2.67 GHz =C2=A0920 + 4GB of RAM (2 channel)./Ub=
untu
> 11.04/x64
> =C2=A0 =C2=A0 =C2=A0The 109 minutes was measured on machine #1
>
> #2 Homebuilt with a 2.67 GHz =C2=A0920 + 6 GB of RAM (tri-channel)/Ubuntu=
 10.04
> x86
> =C2=A0 =C2=A0 Gigabyte UD5 Motherboard
> =C2=A0 =C2=A0 The =C2=A0 91 minutes was measured on machine #2.
>
> Both are using the same type of disk Western Digital Black 1 TB
> and have 1333 MHz memories.
>
>
> I tried Ubuntu 11.04 / x86 on machine #1 using an external e-SATA Seagate
> disk
> some time ago. I do not have the exact figures, but It was within minutes
> of machine #2, so I think it is safe to assume that the extra time
> is there due to the lack of JIT compiling.
>
> End of this week, I hope to try on a 4.4 GHz (overclocked) Core-i7
> 2600k/Ubuntu 11.10/x64.
> Still only 1333 MHz memory unfortunately.
>
>

numbers on same hardware with different OS would be more relevant
for comparision

> --
> Best Regards
> Ulf Samuelsson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


