Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9476B1E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:29:31 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 9D9933F4A5;
	Thu, 19 Sep 2013 07:29:31 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Thu, 19 Sep 2013 07:29:30 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Thu, 19 Sep 2013 07:29:30 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Thu, 19 Sep 2013 07:29:29 +0200
Message-ID: <523A8BB9.5030009@topic.nl>
Date: Thu, 19 Sep 2013 07:29:29 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
	<52394067.6040205@topic.nl> <52396EB6.3010304@windriver.com>
In-Reply-To: <52396EB6.3010304@windriver.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Thu, 19 Sep 2013 05:29:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 09/18/2013 11:13 AM, Hongxu Jia wrote:
> Hi Mike,
>
> The reason why add util-linux-mount to RDEPENDS is the mount in
> busybox doesn't support 'syntax of external mount helpers' very well.
>
> Which means you could directly invoke mount rather than
> mount.ntfs/mount.exfat
> to mount ntfs/exfat filesystem.

I really don't have the faintest clue what you're referring to. Could=20
you please explain?

And my experience is exactly the opposite - When util-linux-mount gets=20
installed, it breaks things. Busybox mount works just fine.

If anything, it should rdepend on something like "virtual/mount" or so.

It doesn't seem right for a package to enforce choices that the distro=20
should make. Regardless of how broken busybox might be - that's the=20
distro's problem, not something a filesystem driver should care about.

Regards,
Mike.


> Thanks,
> Hongxu
>
> On 09/18/2013 01:55 PM, Mike Looijmans wrote:
>> Ping!
>>
>> Anything wrong with the patch? anyone reading this at all?
>>
>> BTW, the same problem is in the exfat recipe, so I was going to send a
>> patch for that as well.
>>
>>
>> On 09/12/2013 11:37 AM, Mike Looijmans wrote:
>>> ntfs-3g-ntfsprogs has no runtime dependency on util-linux-mount, for
>>> example busybox mount will also do just fine. It might be less useful
>>> without any mount program, but that's not the same as depending on it.
>>>
>>> The dependency broke several images because util-linux-mount behaves
>>> differently than busybox mount, resulting in failure to mount ext2/3
>>> volumes and network shares on user's systems.
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>>   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2013.1.13.bb
>>> b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2013.1.13.bb
>>>
>>> index e084187..a34a791 100644
>>> ---
>>> a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2013.1.13.bb
>>>
>>> +++
>>> b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2013.1.13.bb
>>>
>>> @@ -5,6 +5,7 @@ PROVIDES =3D "ntfsprogs ntfs-3g"
>>>   LICENSE =3D "GPLv2 & LGPLv2"
>>>   LIC_FILES_CHKSUM =3D
>>> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>>> file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62bf790f0a"
>>> +PR =3D "r1"
>>>
>>>   SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz=
"
>>>   S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>>> @@ -23,7 +24,7 @@ EXTRA_OEMAKE =3D "LDCONFIG=3Decho"
>>>   PACKAGES =3D+ "ntfs-3g ntfsprogs libntfs-3g"
>>>
>>>   FILES_ntfs-3g =3D "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*
>>> ${base_sbindir}/mount.ntfs"
>>> -RDEPENDS_ntfs-3g +=3D "fuse util-linux-mount"
>>> +RDEPENDS_ntfs-3g +=3D "fuse"
>>>
>>>   FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
>>>   FILES_libntfs-3g =3D "${libdir}/*${SOLIBS}"
>>>
>>
>>
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>>
>> TOPIC Embedded Systems
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
>> Telefax: (+31) - (0)499 - 33.69.70
>> E-mail: mike.looijmans@topic.nl
>> Website: www.topic.nl
>>
>> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn
>> uitsluitend bestemd voor de geadresseerde, zoals die blijkt uit het
>> e-mail bericht en/of de bijlagen. Er kunnen gegevens met betrekking
>> tot een derde instaan. Indien u als niet-geadresseerde dit bericht en
>> de bijlagen ontvangt, terwijl u niet bevoegd of gemachtigd bent om dit
>> bericht namens de geadresseerde te ontvangen, wordt u verzocht de
>> afzender hierover direct te informeren en het e-mail bericht met de
>> bijlagen te vernietigen. Ieder gebruik van de inhoud van het e-mail
>> bericht, waaronder de daarbij behorende bijlagen, door een ander dan
>> de geadresseerde is onrechtmatig jegens ons dan wel de eventueel in
>> het e-mail bericht of de bijlagen voorkomende andere personen. TOPIC
>> Embedded Systems is niet aansprakelijk voor enigerlei schade
>> voortvloeiend uit het gebruik en/of acceptatie van dit e-mail bericht
>> of de daarbij behorende bijlagen.
>>
>> The contents of this message, as well as any enclosures, are addressed
>> personally to, and thus solely intended for the addressee. They may
>> contain information regarding a third party. A recipient who is
>> neither the addressee, nor empowered to receive this message on behalf
>> of the addressee, is kindly requested to immediately inform the sender
>> of receipt, and to destroy the message and the enclosures. Any use of
>> the contents of this message and/or the enclosures by any other person
>> than the addressee or person who is empowered to receive this message,
>> is illegal towards the sender and/or the aforementioned third party.
>> TOPIC Embedded Systems is not  liable for any damage as a result of
>> the use and/or acceptance of this message and as well as any enclosures.
>>=20

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
_______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


