Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1cYo-00055n-UM
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 12:10:00 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 109EE491286;
	Fri,  1 Oct 2010 12:09:35 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 12:09:34 +0200
Message-ID: <4CA5B348.1000404@dresearch.de>
Date: Fri, 01 Oct 2010 12:09:12 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
In-Reply-To: <AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
X-OriginalArrivalTime: 01 Oct 2010 10:09:34.0936 (UTC)
	FILETIME=[BF901580:01CB6150]
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
X-List-Received-Date: Fri, 01 Oct 2010 10:10:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Frans, hello Khem,

>>>> It looks like libunwind provides header files that are named
>>>> identically to gcc header files. gcc then confuses these headers whe=
n it
>>>> is built, causing a break of the build.
>>>>
>>>> This patch makes libunwind depend on gcc which resolves the build is=
sue.
>>>> Both
>>>> build nicely when gcc is built first.
>>>
>>> Hm. Ideally this should be patched in gcc.
>>
>> I don't think this is a gcc issue. It's a reasonable point of view, ri=
ght,
>> but pushing the header file issue back to libunwind is a valid POV, to=
o. I
>> think it's rather a problem between those two packages.
>
> Well I don't know the exact cause:
> if libunwind publishes a header X.h and gcc has an internal header
> file X.h and picks the wrong one then clearly the way it searches the
> include dirs is wrong.
> if both publish X.h and they are incompatible then there is a
> conflict, and some other package could pick up the wrong X.h too.
>
> (and it could also be the case that libunwind does publish a file
> which it should not publish as it is an internal file)

They both provide unwind.h. For the library this is a "public" header=20
file, though, describing the interface to libunwind. It's exported by=20
libunwind. For some reason the libunwind version is used by gcc when gcc=20
is compiled.

>>> Now I feel that if someone
>>>
>>> does a bitbake libunwind; bitbake -cclean gcc; bitbake gcc things
>>> still fail.
>>
>> Did you give this a try? I'll check it as soon as I can.
>
> I haven't; I'm not behind my build system atm.
>
> The issue that I see is that the last gcc build still may pick up the
> libunwind header.

OK, I see. I ran a test build, and you're right, this is what happens.=20
Well, at least a clean build works with my small patch.

However, it looks like the maintainer of the gcc recipe needs to lake a=20
look at this. I CCed this mal directly to Khem to get some attention to=20
this issue.

>>> Btw what include files are we talking about?
>>
>> I took word from Steffen (Sledz) about the cause of the problem, so I =
didn't
>> investigate any further. Introducing the dependency seemed to fix the
>> problem, so why bother. However, I feel like this kind of problem is b=
etter
>> fixed (the way you're proposing it) by the package maintainer, if ther=
e is
>> one.
>
> I'd rather know the root cause.
> A fix without the root cause being known, often ends up to be
> something that just masks the problem.
> No idea if there is a libunwind maintainer.
> gcc maintainer is Khem Raj.

I tracked it down - libunwind publishes unwind.h, and gcc uses an=20
internal file of the same name while being built.

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


