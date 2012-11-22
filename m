Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TbZQ8-0003sD-Fj
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 17:14:33 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Thu, 22 Nov 2012
	17:00:25 +0100
X-TM-IMSS-Message-ID: <11d5f0520021b9af@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 11d5f0520021b9af ;
	Thu, 22 Nov 2012 17:00:17 +0100
Message-ID: <50AE4C18.6060500@nedap.com>
Date: Thu, 22 Nov 2012 17:00:24 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <50AE2633.1030006@nedap.com>
	<20121122133125.GC12637@jama.jama.net>	<50AE2A59.4090802@nedap.com>
	<20121122135442.GD12637@jama.jama.net>	<50AE37B9.3070406@nedap.com>
	<20121122151725.GG12637@jama.jama.net>
In-Reply-To: <20121122151725.GG12637@jama.jama.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: kernel image
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
X-List-Received-Date: Thu, 22 Nov 2012 16:14:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2012 04:17 PM, Martin Jansa wrote:
> On Thu, Nov 22, 2012 at 03:33:29PM +0100, Jaap de Jong wrote:
>> On 11/22/2012 02:54 PM, Martin Jansa wrote:
>>> On Thu, Nov 22, 2012 at 02:36:25PM +0100, Jaap de Jong wrote:
>>>> On 11/22/2012 02:31 PM, Martin Jansa wrote:
>>>>> On Thu, Nov 22, 2012 at 02:18:43PM +0100, Jaap de Jong wrote:
>>>>>> Hi,
>>>>>> does anyone know where the + (in
>>>>>> kernel-2.6.35.14+_2.6.35-r14.6_mymachine.ipk) is added?
>>>>>> It is added on my pc (running ubuntu); it is not added on my debian
>>>>>> buildserver.
>>>>> Check if you have oe-core 56fe5300
>>>> I'm using oe-classic for this...
>>> Then apply it in oe-classic kernel.bbclass or your recipe.
>>>
>> Stupid question probably.. Where can I find it?
>> And one more: does it make sense that the '+' is added under ubuntu and
>> that is absent on my buildserver?
> http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=56fe5300ab5ab072c20acd03d7fc26e9cae4e652
>
> Try to compare those 3 commands on both builders.
>
>
That seems to help.
I added it to my local linux recipe

    do_configure_prepend() {
         touch .scmversion
    }

Thanks for your support!

