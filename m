Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N6ANp-0001s5-77
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 23:00:48 +0100
Received: by iwn28 with SMTP id 28so391214iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 13:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YUhwB4LlwkuKcaAkfVvXTFrVY9Zm/nP9fSbwsfWjbDI=;
	b=Ug9WIoB4ynMKJIz3QER6d/YZmmAiqzzdh7vYw/bsm1bCXzgJni8wopIYX3qV2Em9T9
	U7nEfTRE6x0pE9NjGjSNwgudyD/kgBur4hmt9cP2LjXyscD+yFHlbeA7XeYUBo43meye
	fZJL0Aaei1/4erY1N+v10bMiTO6ixBwUn1ODs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=n4/rOUflvZg5vAEy29/wgkQ3VexEXkYajq8SEagEeE3waVlPnAx8/4KDrH4VhLB6fq
	VTyyMYeMttyV2BeyXN9JLWJxfgYdEK9B/2LbOJA6e9xtmbQ+5MwXu40wXSouxncCep0a
	i1IKri6KL4GxfD+r/ysPdlTp4RAUSiPQT6TYM=
MIME-Version: 1.0
Received: by 10.231.161.138 with SMTP id r10mr564038ibx.34.1257458371102; Thu, 
	05 Nov 2009 13:59:31 -0800 (PST)
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A88B83@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
	<19c1b8a90911041606w78796323p8077fc6f6752fc90@mail.gmail.com>
	<B44D4D5BF344094DABB900C4E0F6E3533945A88B83@srv02.nortechonline.net>
Date: Thu, 5 Nov 2009 13:59:31 -0800
Message-ID: <19c1b8a90911051359m74be846cmd490e13506872e50@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Thu, 05 Nov 2009 22:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2009 at 1:20 PM, Hodgson, Simon
<Simon.Hodgson@nortechonline.co.uk> wrote:
> _______________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] On Behalf Of Khem Raj [raj.khem@gmail.co=
m]
> Sent: 05 November 2009 00:06
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Mono
>
> On Wed, Nov 4, 2009 at 12:11 PM, Hodgson, Simon
> <Simon.Hodgson@nortechonline.co.uk> wrote:
>> I've built Mono for OpenEmbedded to run on an arm processor. But when I =
try to run just a simple Hello World test I get:
>>
>> mini-codegen.c:1073:mono_local_regalloc: assertion failed: (ins->dreg !=
=3D -1)
>>
>> Does anyone have any suggestion as to what I might be doing wrong?
>>
>> mono -V produces:
>> root@at91sam9g20ek:~# mono -V
>> Mono JIT compiler version 2.4.2.3 (tarball Tue Nov =C2=A03 03:08:58 EST =
2009)
>> Copyright (C) 2002-2008 Novell, Inc and Contributors. www.mono-project.c=
om
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0TLS: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 norma=
l
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0GC: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Included Boehm (with typed GC)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0SIGSEGV: =C2=A0 =C2=A0 =C2=A0 normal
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Notifications: epoll
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Architecture: =C2=A0armel,vfp
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Disabled: =C2=A0 =C2=A0 =C2=A0none
>>
>> Is there anymore info perhaps I can provide?
>
> Can you apply the attached patch then rebuild mono and retry your test.
>
> Thanks
>
> -Khem
>
>
> Sorry for being a bit dense, but where should I apply this? It appears to=
 patch the receipe and the mono source, is that correct? Do I need to run p=
atch twice in each directory?

you can cd into (top of your oe source tree) say openembedded/ then do

patch -p1 < this.patch

>
> Thanks
>
>
> Simon
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


