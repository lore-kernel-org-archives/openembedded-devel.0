Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1GjR-0002Lw-R6
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 12:51:23 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9C3C6491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 12:51:10 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 30 Sep 2010 12:51:10 +0200
Message-ID: <4CA46B8D.20106@dresearch.de>
Date: Thu, 30 Sep 2010 12:50:53 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285765693.4578.14.camel@mattotaupa>	<1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
	<1285838213.3805.52.camel@mattotaupa>
In-Reply-To: <1285838213.3805.52.camel@mattotaupa>
X-OriginalArrivalTime: 30 Sep 2010 10:51:10.0511 (UTC)
	FILETIME=[64A0DBF0:01CB608D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] linux-libc-headers (2.6.24): Add falloc.h to kernel exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 10:51:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

> although not very important I think it is better to write
>
> 	linux-libc-headers_2.6.24
>
> in the commit summary.

OK.

>> upstream: OE-only
>
> This can be omitted in the commit message.

Yupp, I think I now understand the purpose of this tag, any that I put=20
it at the wrong place.

>> This adds include/linux/falloc.h to the list of files exported by the =
kernel
>> to the C library. The include file is required for building e.g. a rec=
ent
>> util-linux-ng against 2.6.24.
>>
>> Starting from 2.6.25 a similar patch has been accepted upstream (the m=
ainline
>> kernel). For 2.6.24, however, falloc.h is not exported although it's p=
resent.
>>
>> Signed-off-by: Thilo Fromm<t.fromm@dresearch.de>
>> ---
>>   .../linux-libc-headers/files/export_falloc_h.patch |   10 ++++++++++
>>   .../linux-libc-headers_2.6.24.bb                   |    1 +
>>   2 files changed, 11 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.=
patch
>>
>> diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/=
recipes/linux-libc-headers/files/export_falloc_h.patch
>> new file mode 100644
>> index 0000000..5860e88
>> --- /dev/null
>> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
>
> Just for the record. Please add the patch header as I wrote in my other
> message

I missed the spot. Sorry for that. I'll fix this.

> I think the next iteration will be ready to be committed.

Cool :)

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB:54412
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


