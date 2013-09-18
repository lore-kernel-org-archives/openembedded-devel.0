Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13AC96B6C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:13:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I9DU95014010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:13:30 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Sep 2013 02:13:28 -0700
Message-ID: <52396EB6.3010304@windriver.com>
Date: Wed, 18 Sep 2013 17:13:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
	<52394067.6040205@topic.nl>
In-Reply-To: <52394067.6040205@topic.nl>
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
X-List-Received-Date: Wed, 18 Sep 2013 09:13:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mike,

The reason why add util-linux-mount to RDEPENDS is the mount in
busybox doesn't support 'syntax of external mount helpers' very well.

Which means you could directly invoke mount rather than 
mount.ntfs/mount.exfat
to mount ntfs/exfat filesystem.

Thanks,
Hongxu

On 09/18/2013 01:55 PM, Mike Looijmans wrote:
> Ping!
>
> Anything wrong with the patch? anyone reading this at all?
>
> BTW, the same problem is in the exfat recipe, so I was going to send a 
> patch for that as well.
>
>
> On 09/12/2013 11:37 AM, Mike Looijmans wrote:
>> ntfs-3g-ntfsprogs has no runtime dependency on util-linux-mount, for
>> example busybox mount will also do just fine. It might be less useful
>> without any mount program, but that's not the same as depending on it.
>>
>> The dependency broke several images because util-linux-mount behaves
>> differently than busybox mount, resulting in failure to mount ext2/3
>> volumes and network shares on user's systems.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git 
>> a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb 
>> b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb 
>>
>> index e084187..a34a791 100644
>> --- 
>> a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
>> +++ 
>> b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
>> @@ -5,6 +5,7 @@ PROVIDES = "ntfsprogs ntfs-3g"
>>   LICENSE = "GPLv2 & LGPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>> file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
>> +PR = "r1"
>>
>>   SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
>>   S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>> @@ -23,7 +24,7 @@ EXTRA_OEMAKE = "LDCONFIG=echo"
>>   PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
>>
>>   FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* 
>> ${base_sbindir}/mount.ntfs"
>> -RDEPENDS_ntfs-3g += "fuse util-linux-mount"
>> +RDEPENDS_ntfs-3g += "fuse"
>>
>>   FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
>>   FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
>>
>
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


