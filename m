Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PmXvi-00015T-Ba
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 21:43:26 +0100
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p17KgMXw003975;
	Mon, 7 Feb 2011 12:42:22 -0800 (PST)
Received: from ala-mail06.corp.ad.wrs.com ([147.11.57.147]) by
	ALA-MAIL03.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 7 Feb 2011 12:42:21 -0800
Received: from Macintosh-5.local ([172.25.36.226]) by
	ala-mail06.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 7 Feb 2011 12:42:21 -0800
Message-ID: <4D50592D.2030300@windriver.com>
Date: Mon, 07 Feb 2011 14:42:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
	<4D504A7E.4030809@windriver.com>
	<AANLkTikT+xiXg5W39LzE4dHyLjGnO1oQF3=x_k0mXAjN@mail.gmail.com>
In-Reply-To: <AANLkTikT+xiXg5W39LzE4dHyLjGnO1oQF3=x_k0mXAjN@mail.gmail.com>
X-OriginalArrivalTime: 07 Feb 2011 20:42:21.0921 (UTC)
	FILETIME=[84EFFD10:01CBC707]
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 20:43:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/11 2:19 PM, Khem Raj wrote:
> On Mon, Feb 7, 2011 at 11:39 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 2/7/11 1:33 PM, Khem Raj wrote:
>>> On Mon, Feb 7, 2011 at 7:53 AM, Enrico Scholz
>>> <enrico.scholz@sigma-chemnitz.de> wrote:
>>>> Explicit '-mthumb' is required because Cortex-M3 does not support ARM
>>>> instructions and actual flags cause gcc to fail with 'error: target CPU
>>>> does not support ARM mode'.
>>>>
>>>> The '-mcpu=cortex-m3' is shorter than '-march=armv7-m -mtune=cortex-m3'
>>>> and enables workarounds like '-mfix-cortex-m3-ldrd'.
>>>
>>> Does -mcpu=cortex-m3 also cause gcc to tune for cortex-m3 ?
>>
>> -mcpu=cortex-m3 is equivalent to -march=cortex-m3 -mtune=cortex-m3
> 
> is -march=cortex-m3 valid even ? my question was if we select armv7-m
> using -march
> then gcc knows stuff like oh this arch has a hardware div instruction
> but now if we
> use -mcpu will it still do it.

You would have to look in the source and see if -mcpu=cortex-m3 is an "alias"
for anything or simply uses the default logic of cpu == march && mtune..

(FYI, last time I looked at how this worked was a year or so ago.. so if the way
GCC processes options has changed, then I'm wrong..  but it's worth looking at..
 I was scolded many times by GCC developers that -mcpu= is not the same as
specifically setting the arch and tune.)

Usually you use march & mtune when you are trying to make a set of binaries that
is capable of running on multiple cores in the same family.  I see it used the
most of IA and Power systems myself.

--Mark


