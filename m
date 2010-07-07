Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWQcQ-000869-8Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:08:39 +0200
Received: by bwz10 with SMTP id 10so3786834bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SgEdWMmiYVTC2AlkUiYq8IssA7HqG3jcZpvPaTacM8k=;
	b=RFwBhckASFxF8Usdm64FDW0H5aAg9zZ3FHjq494ekCW+ULRdGcky54ZoXd8/3VuOh6
	t6ogkSXtM+V2GWZ7YHzgC7nGFKJoiWoDWExgB6A+7kLDU/Ffe8nBLEvUCKiSNZMGN4Nx
	8n7cNgFg255DHPWeRplWC3IfecpQj2YmVcW1Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Wb0lWE7qOBuOAF+Jj7msqkYiNJlnShoSNoXskgUMvyupQEf8ryt0B8ZK/fnLScVSC8
	SVema31aFdhys/QEP2EN5bTyzFlbaUihpJfEaMP+QehCCLuMjxUP4DafoL79aOG2hUvY
	fWqgeFMZt9L02G1HUzDTz4KDjunCmSf59vdtM=
MIME-Version: 1.0
Received: by 10.204.126.161 with SMTP id c33mr4794319bks.108.1278493429113; 
	Wed, 07 Jul 2010 02:03:49 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 02:03:48 -0700 (PDT)
In-Reply-To: <AANLkTilBEJzflm5tC3EwoWNbyYNoqL1dgbD8JN8P6NiO@mail.gmail.com>
References: <AANLkTik1mhR1trtNfJcNrehMg0gs2lNSXyp51PPpaSPu@mail.gmail.com>
	<lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1278439840.30247.3632.camel@rex>
	<AANLkTimI2cM6ehyfx2VQ3FnZiwxkl1SiXJG4Gf4gCGLR@mail.gmail.com>
	<AANLkTin0OEZqHK__gDBP4J2aliFRxr5b3Yjm8HH9CT8v@mail.gmail.com>
	<AANLkTilBEJzflm5tC3EwoWNbyYNoqL1dgbD8JN8P6NiO@mail.gmail.com>
Date: Wed, 7 Jul 2010 11:03:48 +0200
Message-ID: <AANLkTikhVr_O6RX1xlMnZDyj84jXZoclWMZLEyzaR0vE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native glibc-initial-2.9 unpack error
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
X-List-Received-Date: Wed, 07 Jul 2010 09:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/7 Jan Paesmans <jan.paesmans@gmail.com>:
> Khem posted a patch for it earlier:
> [oe] [PATCH][v2] base.bbclass: re-add backward compatibility with
> bitbake w.r.t decodeurl fix in bitbake
>
> I applied that one and it fixed the issue. Also the issue turned up
> with libpam-base-files.bb and that patch also fixes that one.

Hm. This patch is also in oe. I am at oe head.
Also verified that my base.bbclass is patched.
Then removed my tmp dir and build from scratch
still have the problem.

Frans
>
> Regards,
>
> Jan
>
> On Wed, Jul 7, 2010 at 10:40 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/7/6 Khem Raj <raj.khem@gmail.com>:
>>> On Tue, Jul 6, 2010 at 11:10 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>>>> On Tue, 2010-07-06 at 19:17 +0200, Enrico Scholz wrote:
>>>>> Jan Paesmans <jan.paesmans@gmail.com> writes:
>>>>>
>>>>> > cp: cannot create regular file `/ld.so.conf': Permission denied
>>>>>
>>>>> bb.decodeurl (bitbake 1.10) seems to be buggy:
>>>>>
>>>>> | >>> import bb
>>>>> | >>> bb.decodeurl("file://ld.so.conf")
>>>>> | ('file', '', 'ld.so.conf', '', '', {})
>>>>> | >>> bb.decodeurl("file://etc/ld.so.conf")
>>>>> | ('file', 'etc', '/ld.so.conf', '', '', {})
>>>>> | >>> bb.decodeurl("file://etc/test/ld.so.conf")
>>>>> | ('file', 'etc', '/test/ld.so.conf', '', '', {})
>>>>>
>>>>
>>>> There was a fix recently added to bitbake master for this:
>>>>
>>>> http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
>>>
>>> right. OE needed a fix too
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=5ac52371b09a25518b60e23e80c8c812cdea6e36
>>>
>>> which means that bitbake fix should also go
>>> into 1.8 an 1.10 to keep building oe .dev with those versions of bitbake.
>>
>> I still have the problem:
>> glibc 2.5 initial
>> cp: cannot create regular file `/ld.so.conf': Permission denied
>>
>> bitbake 1.10 head, oe head.
>> verified that the patch for oe is there
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


