Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1JpL-0003BC-1L
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:09:40 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A6CB5491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 16:09:27 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 30 Sep 2010 16:09:27 +0200
Message-ID: <4CA49A05.9030500@dresearch.de>
Date: Thu, 30 Sep 2010 16:09:09 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285838213.3805.52.camel@mattotaupa>	<1285850437-2620-1-git-send-email-t.fromm@dresearch.de>
	<1285852480.3805.79.camel@mattotaupa>
In-Reply-To: <1285852480.3805.79.camel@mattotaupa>
X-OriginalArrivalTime: 30 Sep 2010 14:09:27.0476 (UTC)
	FILETIME=[17C5A740:01CB60A9]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] linux-libc-headers_2.6.24: Add falloc.h to kernel exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 14:09:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

>> This adds include/linux/falloc.h to the list of files exported by the =
kernel to the C library.
>> The include file is required for building e.g. a recent util-linux-ng =
against 2.6.24.
>>
>> Starting from 2.6.25 a similar patch has been accepted upstream (the m=
ainline
>> kernel). For 2.6.24, however, falloc.h is not exported although it's p=
resent.
>>
[...]
>>   .../linux-libc-headers/files/export_falloc_h.patch |   11 ++++++++++=
+
>> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
>> @@ -0,0 +1,11 @@
>> +upstream: OE-only
>
> Hmm, do you think it is OE only. As written in my other message I
> consider this an upstream patch, which has been committed already.
>
>          upstream: http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds=
/linux-2.6.git;a=3Dcommit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e
>          comment: Patch is present in Linux kernel>=3D 2.6.25.

Technically, this upstreamed patch is not my patch. Upstream is way=20
older, it's from a different author, etc. Plus it's included in=20
successive kernel releases, but it's not in the version affected by my=20
patch. From my point of view my patch is an OE-only hack because it=20
back-ports to an older kernel version a different patch which originated=20
from OE (?) a long time ago and then went mainline.

I'll of course change this to your suggestion if this is a problem. I=20
did not do this yet so my patch won't get confused with the original one=20
that went mainline.

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


