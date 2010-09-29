Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0ycz-0004YC-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 17:31:30 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id CB126491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 17:31:16 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 17:31:16 +0200
Message-ID: <4CA35BB7.2000505@dresearch.de>
Date: Wed, 29 Sep 2010 17:31:03 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA0B4FF.3050601@dresearch.de>	<1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
	<1285765693.4578.14.camel@mattotaupa>
In-Reply-To: <1285765693.4578.14.camel@mattotaupa>
X-OriginalArrivalTime: 29 Sep 2010 15:31:16.0640 (UTC)
	FILETIME=[5B72E200:01CB5FEB]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add falloc.h to the exported kernel header files.
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
X-List-Received-Date: Wed, 29 Sep 2010 15:31:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

> thank you for your patch. Could you please add the recipe name to the
> beginning of the commit summary as demanded by the commit policy
> [1]. ;-)

I will. This one actually was my first patch (I made the same mistake in=20
my second patch - the wvstreams dbus issue - which I already fixed), so=20
don't worry, my commit summary naming should be OK for future patches :)

>> This adds include/linux/falloc.h to the list of files
>> exported by the kernel to the C library.
>> The include file is required for building e.g. a recent util-linux-ng
>> against 2.6.24.
>
> it looks like the same fix was committed upstream [3] in March 2008 [4]=
.
> Since the Linux kernel 2.6.24 was released in January 2008 this fixed
> should be present in all Linux kernels>=3D 2.6.24.

It is present in all kernels > 2.6.24. It's actually in the changelog=20
for 2.6.25:=20
<http://ftp.halifax.rwth-aachen.de/kernel/linux/kernel/v2.6/ChangeLog-2.6=
.25>=20
(search the page for "falloc.h").

But we're stuck with 2.6.24 :-/

> If you sent a patch iteration, please add that information to the commi=
t
> message.

What's a patch iteration?

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
> Could you please add a patch header as suggested in [2].

I suppose you're referring to a line like

upstream: OE-only

? As this patch is not supposed to go upstream (because it's already=20
there) - do you think this is still necessary?

Otherwise I'd just adjust the patch summary and then resubmit the patch=20
as v2.

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


