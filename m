Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1HLQ-0004iI-4h
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 13:30:41 +0200
Received: by iwn2 with SMTP id 2so2360456iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1YZsbUm6pb9s7uELhJZ/j5HiaKc73HRWHHgLhj495zs=;
	b=QVSJAbdGlJj1krtQ9eAPdm0pT8++OytwOMwKHxFwtctXa8NKpTHUmbBkXUnFzNrW8P
	YoPkj/Ay6lklRPQXKpA/DTzQ1HnXWu+1/VmQ6DyFJoSaNN0EPFdp7k1r2nZiO+cR+UCi
	8yOoMYpdcUOs0FBe8POXJuWoxhFlxtv+BPo64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NXKY3pTtCfKuAsofhFF47LV45WvErYtQT0gWNj0OD3s9sXlFDNxB+x1oOlRghf3+br
	8NY4MbpUkA7Y8QRQ3vTeHajk5PGaiAqSXJ8dqJUXiA3oeDjPcWynqoNsVUxHoiWKgqwz
	mfrVXG2e8MqOU5aMQUAKgV+QCtr2AZuIYR2W8=
MIME-Version: 1.0
Received: by 10.231.19.136 with SMTP id a8mr3574289ibb.86.1285846224204; Thu,
	30 Sep 2010 04:30:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 04:30:24 -0700 (PDT)
In-Reply-To: <4CA46AD8.2070205@dresearch.de>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
Date: Thu, 30 Sep 2010 13:30:24 +0200
Message-ID: <AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 30 Sep 2010 11:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/30 Thilo Fromm <t.fromm@dresearch.de>:
> On 09/30/2010 12:21 PM, Frans Meulenbroeks wrote:
>
>>> It looks like libunwind provides header files that are named
>>> identically to gcc header files. gcc then confuses these headers when i=
t
>>> is built, causing a break of the build.
>>>
>>> This patch makes libunwind depend on gcc which resolves the build issue=
.
>>> Both
>>> build nicely when gcc is built first.
>>
>> Hm. Ideally this should be patched in gcc.
>
> I don't think this is a gcc issue. It's a reasonable point of view, right=
,
> but pushing the header file issue back to libunwind is a valid POV, too. =
I
> think it's rather a problem between those two packages.

Well I don't know the exact cause:
if libunwind publishes a header X.h and gcc has an internal header
file X.h and picks the wrong one then clearly the way it searches the
include dirs is wrong.
if both publish X.h and they are incompatible then there is a
conflict, and some other package could pick up the wrong X.h too.

(and it could also be the case that libunwind does publish a file
which it should not publish as it is an internal file)
>
>> Now I feel that if someone
>>
>> does a bitbake libunwind; bitbake -cclean gcc; bitbake gcc things
>> still fail.
>
> Did you give this a try? I'll check it as soon as I can.

I haven't; I'm not behind my build system atm.

The issue that I see is that the last gcc build still may pick up the
libunwind header.
>
>> Btw what include files are we talking about?
>
> I took word from Steffen (Sledz) about the cause of the problem, so I did=
n't
> investigate any further. Introducing the dependency seemed to fix the
> problem, so why bother. However, I feel like this kind of problem is bett=
er
> fixed (the way you're proposing it) by the package maintainer, if there i=
s
> one.

I'd rather know the root cause.
A fix without the root cause being known, often ends up to be
something that just masks the problem.
No idea if there is a libunwind maintainer.
gcc maintainer is Khem Raj.

BTW thanks for your efforts on this & have fun! Frans
>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
> DResearch Digital Media Systems GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =A0 mailto:t.fromm@dresearch.de
> Fax: +49 (30) 515 932 77 =A0 =A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB:54412
> Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
> Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


