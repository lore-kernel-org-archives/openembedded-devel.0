Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1MKO-0007as-7F
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 18:49:56 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 0D5F1491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 18:49:34 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 30 Sep 2010 18:49:33 +0200
Message-ID: <4CA4BF8B.6050509@dresearch.de>
Date: Thu, 30 Sep 2010 18:49:15 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285783198-23407-1-git-send-email-t.fromm@dresearch.de>
	<1285859228.3805.115.camel@mattotaupa>
In-Reply-To: <1285859228.3805.115.camel@mattotaupa>
X-OriginalArrivalTime: 30 Sep 2010 16:49:33.0812 (UTC)
	FILETIME=[75983340:01CB60BF]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] vim-7.2: remove quotes from CC in configure.in
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
X-List-Received-Date: Thu, 30 Sep 2010 16:49:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

>> upstream: OE-only
>
> Please remove this again.

I will. Same thing as with the other patches: I learned the right place=20
for this tag after this patch went out.

>> configure.in features quotes around some calls to $CC (i.e. it calls
>> "$CC"). CC is, however, not always just the compiler name. In OpenEmbe=
dded
>> CC looks more like "arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -m=
tune=3Darm926ej-s -mthumb-interwork -mno-thumb".
>>
[...]
>> configure: creating ./config.status
>> config.status: creating auto/config.mk
>> config.status: creating auto/config.h
>>
>> So the configure step had errors, but didn't report any in the return =
code.
>>
>> This patch removes the quotes around the CC variable in configure.in, =
which unbreaks the configure step.
>
> I have the same questions as before. Do you know if something similar i=
s
> needed upstream? I think it is not OE only since other frameworks have
> similar values for `CC`.

Hmmm, do you think? I found this a way too tiny issue to report back=20
upstream. But allright, I'll report it to the Vim developer's mailing=20
list tomorrow, and refer to the e-mail thread in the upstream tag.

>> diff --git a/recipes/vim/files/configure.in_remove_CC_quotes.patch b/r=
ecipes/vim/files/configure.in_remove_CC_quotes.patch
>> new file mode 100644
>> index 0000000..db9fb07
>> --- /dev/null
>> +++ b/recipes/vim/files/configure.in_remove_CC_quotes.patch
>
> Please add the appropriate patch header.

I'm getting the idea now. Don't give up yet :)

>>
>>   addtask applypatch after do_unpack before do_patch
>
> Besides that I build tested your patch and it worked for
> `angstrom-2008.1`, `minimal-{eglibc,libc,uclibc}` and `MACHINE =3D
> "beagleboard"`.

It worked? Well, then your default minimal build includes X libraries.=20
Target vim-7.2 fails in a clean build without X libraries, because the=20
recipe is still broken. Another patch fixes this, it's already in the=20
queue. Anyway, thanks for testing!

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


