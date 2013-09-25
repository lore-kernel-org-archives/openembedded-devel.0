Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09F15610DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2013 06:09:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8P6991u027609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Sep 2013 23:09:09 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 24 Sep 2013 23:09:09 -0700
Message-ID: <52427E03.2020607@windriver.com>
Date: Wed, 25 Sep 2013 14:09:07 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
	<52394067.6040205@topic.nl> <52396EB6.3010304@windriver.com>
	<523A8BB9.5030009@topic.nl> <523C0592.5020701@topic.nl>
	<523E47C8.4000505@windriver.com> <52427C48.2000109@topic.nl>
In-Reply-To: <52427C48.2000109@topic.nl>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ntfs-3g-ntfsprogs does not rdepend on util-linux-mount
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2013 06:09:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 09/25/2013 02:01 PM, Mike Looijmans wrote:
> On 09/22/2013 03:28 AM, Hongxu Jia wrote:
>> On 09/20/2013 04:21 PM, Mike Looijmans wrote:
>>>
>>> On 09/19/2013 07:29 AM, Mike Looijmans wrote:
>>>> On 09/18/2013 11:13 AM, Hongxu Jia wrote:
>>>>> Hi Mike,
>>>>>
>>>>> The reason why add util-linux-mount to RDEPENDS is the mount in
>>>>> busybox doesn't support 'syntax of external mount helpers' very well.
>>>>>
>>>>> Which means you could directly invoke mount rather than
>>>>> mount.ntfs/mount.exfat
>>>>> to mount ntfs/exfat filesystem.
>>>>
>>>> I really don't have the faintest clue what you're referring to. Could
>>>> you please explain?
>>>>
>>>> And my experience is exactly the opposite - When util-linux-mount gets
>>>> installed, it breaks things. Busybox mount works just fine.
>>>>
>>>> If anything, it should rdepend on something like "virtual/mount" or 
>>>> so.
>>>>
>>>> It doesn't seem right for a package to enforce choices that the distro
>>>> should make. Regardless of how broken busybox might be - that's the
>>>> distro's problem, not something a filesystem driver should care about.
>>>
>>> Additionally:
>>>
>>> How about a compromise: Put util-linux-mount into the RRECOMMENDS
>>> instead of RDEPENDS. Then at least the distro can get rid of it using
>>> a BAD_RECOMMENDS or similar construct.
>>>
>>> Let me know, I'll post a patch.
>>>
>> Looks good to me.
>
> I already posted that as a patch. Any news, comments, request? Should 
> I post it again?
>
The previous posted patch is ok.

//Hongxu
> Mike.
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) – (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn 
> uitsluitend bestemd voor de geadresseerde, zoals die blijkt uit het 
> e-mail bericht en/of de bijlagen. Er kunnen gegevens met betrekking 
> tot een derde instaan. Indien u als niet-geadresseerde dit bericht en 
> de bijlagen ontvangt, terwijl u niet bevoegd of gemachtigd bent om dit 
> bericht namens de geadresseerde te ontvangen, wordt u verzocht de 
> afzender hierover direct te informeren en het e-mail bericht met de 
> bijlagen te vernietigen. Ieder gebruik van de inhoud van het e-mail 
> bericht, waaronder de daarbij behorende bijlagen, door een ander dan 
> de geadresseerde is onrechtmatig jegens ons dan wel de eventueel in 
> het e-mail bericht of de bijlagen voorkomende andere personen. TOPIC 
> Embedded Systems is niet aansprakelijk voor enigerlei schade 
> voortvloeiend uit het gebruik en/of acceptatie van dit e-mail bericht 
> of de daarbij behorende bijlagen.
>
> The contents of this message, as well as any enclosures, are addressed 
> personally to, and thus solely intended for the addressee. They may 
> contain information regarding a third party. A recipient who is 
> neither the addressee, nor empowered to receive this message on behalf 
> of the addressee, is kindly requested to immediately inform the sender 
> of receipt, and to destroy the message and the enclosures. Any use of 
> the contents of this message and/or the enclosures by any other person 
> than the addressee or person who is empowered to receive this message, 
> is illegal towards the sender and/or the aforementioned third party. 
> TOPIC Embedded Systems is not  liable for any damage as a result of 
> the use and/or acceptance of this message and as well as any enclosures.


