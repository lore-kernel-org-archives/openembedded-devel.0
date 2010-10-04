Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P2g6W-00035j-B4
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 10:09:02 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E4E64491282
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 10:08:44 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 4 Oct 2010 10:08:44 +0200
Message-ID: <4CA98B66.3060404@dresearch.de>
Date: Mon, 04 Oct 2010 10:08:06 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>	<4CA46AD8.2070205@dresearch.de>	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>	<4CA5B348.1000404@dresearch.de>	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
In-Reply-To: <AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
X-OriginalArrivalTime: 04 Oct 2010 08:08:44.0632 (UTC)
	FILETIME=[5D48BD80:01CB639B]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Mon, 04 Oct 2010 08:09:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Frans,

>>> I tracked it down - libunwind publishes unwind.h, and gcc uses an int=
ernal
>>> file of the same name while being built.
>>
>> Yes gcc has its own version of libunwind which it used unless
>> configured with --with-system-libunwind
>> IIUC the problem happens with target gcc not with cross-gcc. target
>> gcc is built using cross-gcc and
>> <sysroot>/use/include could be preferred over the location of
>> libunwind.h which is in gcc sources
>> If thats the case then we need to fix gcc build to not look into
>> standard sysroot/usr/include but prefer
>> the local unwind.h when its using internal libunwind. The problem
>> would not show up if the libunwind versions
>> were matching but that may not be the case always and I dont know of
>> hand how we can fix the gcc configury/build
>> to ignore installed unwind.h
>>
>> You workaround would only work if build sequence was followed if some
>> one just cleaned gcc and rebuild it
>> the problem will resurface.
>>
> Thanks for the analysis Khem.
> This is indeed more or less what I had expected.
>
> For me this patch gets a NAK as it does only masks the problvem in
> some cases but not really solves it.

You're right with this analysis; however, the patch enables Openembedded=20
to be built *at all*. If you care less about whether you're able to=20
actually build and if you have the time to wait until someone ventures=20
deep into the gcc build and fixes the cause, then this is the way to go.

For us, however, this patch is a valid workaround. It will make=20
Openembedded work for us until the original issue is fixed.

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
Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle


