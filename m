Received: from mail-iw0-f193.google.com ([209.85.223.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NdVyV-0002qt-Lm
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 22:44:30 +0100
Received: by iwn33 with SMTP id 33so692668iwn.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 13:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=M7Nbu5FzkOnMkBsykSXYRWZ6v9LGcHksdBGEyYLOmFM=;
	b=km+Jkawv4mMQw4szyj9BFf79T7vv9lfJWpsdjr13/p4OtaMN2szhf9h15tQanPa1U9
	1SHLVUMDC2NNBTEx4ZTxACK2kZeoPs7k13CR6nEOwW24CS1zcC/8D+aoQQI6k03oIAvv
	DBRbxbUM58z8NXTm4u9J03Ru2UI0lpI58NbWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SA2bCAsRLjpJ7QtSzDk2Lk8IUF9+WQ2ThSNDPEh9MvdhR9cQmHP4E53ZIvDwI8JiAP
	RbcTFo4H9l2/mNCEJa92kWOIDRgo+VOc7PvLL3OzA1BJhROZNJ2qbvLMbxDPsKbSM4O0
	eUsd1bI3mno/iGMTrKfhVeQsDsNTM+jjIHYis=
MIME-Version: 1.0
Received: by 10.231.147.70 with SMTP id k6mr831859ibv.55.1265406117377; Fri, 
	05 Feb 2010 13:41:57 -0800 (PST)
In-Reply-To: <1265402638.4267.384.camel@cheeto.emacinc.com>
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<4B6C0F0D.8030308@vollmann.ch>
	<19c1b8a91002051000r69e645bey7395aa912d38e172@mail.gmail.com>
	<1265402638.4267.384.camel@cheeto.emacinc.com>
Date: Fri, 5 Feb 2010 13:41:57 -0800
Message-ID: <19c1b8a91002051341m3465d125hcaa15fcfac08f10@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Fri, 05 Feb 2010 21:44:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 5, 2010 at 12:43 PM, Travis Stratman <tstratman@emacinc.com> wrote:
> On Fri, 2010-02-05 at 10:00 -0800, Khem Raj wrote:
>> On Fri, Feb 5, 2010 at 4:29 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
>> > On 02/03/10 15:03, pspreadborough@comcast.net wrote:
>> >>
>> >> My 2.6.29 kernel is built with the CodeSourcery
>> >> arm-2009q3-67-arm-none-linux-gnueabi compiler and has the EABI and
>> >> OABI_COMPAT config options enabled. Using this kernel I can boot my SA1110
>> >> iPaq into a OABI ramfs with no problems, however if I build a "HelloWorld"
>> >> executable with the same compiler and try and run it I get an "Illegal
>> >> Instruction" error. I build the test program using static linking, select
>> >> the correct machine type and tune options but to no avail, I always get the
>> >> illegal instruction.
>>
>> You need gcc 4.4 to get EABI working on ARMv4 and there are additional patches
>> to gcc on top of gcc 4.4 see
>> gcc-armv4-pass-fix-v4bx-to-ld.patch for gcc in OE. So as Koen suggested earlier
>> if you try with OE compiler you might have better chance of getting it
>> to work as many
>> OE devs have tried it.
>> btw. are you passing march=armv4 to the compiler when doing the compile ?
>
> >From my understanding of this issue he has an OABI rootfs and is trying
> to run an EABI executable on top of it. This just doesn't work period
> AFAIK; the kernel can boot either OABI or EABI with the compatibility
> flags config'd in, but all of the binaries on the filesystem must match.
>
> I'll have to look into the patch that you referenced above because I
> have been using EABI (built through OE) for both the kernel and
> filesystem with armv4t for a few years now. First w/ GCC 4.1.1 and now
> with 4.2.4 and I've never run into issues. Does the issue only manifest
> in certain situations?

Well you said armv4t thats a whole different story than armv4 (without
't') for EABI
AFAICT SA1110 is based on ARMv4 not ARMv4t.

>
> Thanks,
>
> TAS
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


