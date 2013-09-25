Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 0335C61105
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2013 06:01:46 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 7B4233F4A4;
	Wed, 25 Sep 2013 08:01:46 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed, 25 Sep 2013 08:01:46 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed, 25 Sep 2013 08:01:45 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 25 Sep 2013 08:01:46 +0200
Message-ID: <52427C48.2000109@topic.nl>
Date: Wed, 25 Sep 2013 08:01:44 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
	<52394067.6040205@topic.nl> <52396EB6.3010304@windriver.com>
	<523A8BB9.5030009@topic.nl> <523C0592.5020701@topic.nl>
	<523E47C8.4000505@windriver.com>
In-Reply-To: <523E47C8.4000505@windriver.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Wed, 25 Sep 2013 06:01:46 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 09/22/2013 03:28 AM, Hongxu Jia wrote:
> On 09/20/2013 04:21 PM, Mike Looijmans wrote:
>>
>> On 09/19/2013 07:29 AM, Mike Looijmans wrote:
>>> On 09/18/2013 11:13 AM, Hongxu Jia wrote:
>>>> Hi Mike,
>>>>
>>>> The reason why add util-linux-mount to RDEPENDS is the mount in
>>>> busybox doesn't support 'syntax of external mount helpers' very well.
>>>>
>>>> Which means you could directly invoke mount rather than
>>>> mount.ntfs/mount.exfat
>>>> to mount ntfs/exfat filesystem.
>>>
>>> I really don't have the faintest clue what you're referring to. Could
>>> you please explain?
>>>
>>> And my experience is exactly the opposite - When util-linux-mount gets
>>> installed, it breaks things. Busybox mount works just fine.
>>>
>>> If anything, it should rdepend on something like "virtual/mount" or so.
>>>
>>> It doesn't seem right for a package to enforce choices that the distro
>>> should make. Regardless of how broken busybox might be - that's the
>>> distro's problem, not something a filesystem driver should care about.
>>
>> Additionally:
>>
>> How about a compromise: Put util-linux-mount into the RRECOMMENDS
>> instead of RDEPENDS. Then at least the distro can get rid of it using
>> a BAD_RECOMMENDS or similar construct.
>>
>> Let me know, I'll post a patch.
>>
> Looks good to me.

I already posted that as a patch. Any news, comments, request? Should I=20
post it again?

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

