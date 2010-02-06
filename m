Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NdnXf-00047O-Ts
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 17:29:59 +0100
Received: by iwn35 with SMTP id 35so5137014iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 08:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=SdpQbBrq8Al7xuMXB6aI2A7ysjtDFCSNVWORf2dDJ/A=;
	b=qBL3IcAMCku/vMMVyPXGK6+EAOnAaOY3xOiObn9fp2qLofgtMAZNC02SZBl72E0NhQ
	emAf34ZuNo2LvfyX+7u7+AM99fgyCfXcnAomAdVw1czCGREcrtZlCdb4BtT9TdAKOzNF
	gFGJB1vB3XZjCmjTpwrDoUn+VfyPjkx3+B12c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bNC4Ks37M2GWf/iNmCNvgKNQ+G2F+QYmHwr+Lp+TliNKnvvC0TGfG1zx/fS4UZuz2M
	Weln3OIB8Ob/WEpd1WtXiCyNgaQXn4MKebAzgOSBH8zQqOZvbrfxvqXe6ruE4uYSZfg1
	+aW0vpuQgtgWBmfOpA/C+99CNKhUmeBV4rf/Q=
MIME-Version: 1.0
Received: by 10.231.147.70 with SMTP id k6mr2544225ibv.55.1265473644673; Sat, 
	06 Feb 2010 08:27:24 -0800 (PST)
In-Reply-To: <1464457259.415721265420228467.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
References: <1444973837.415081265420091001.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<1464457259.415721265420228467.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
Date: Sat, 6 Feb 2010 08:27:24 -0800
Message-ID: <19c1b8a91002060827g8336a7uda4dce4652548846@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
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
X-List-Received-Date: Sat, 06 Feb 2010 16:30:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 5, 2010 at 5:37 PM,  <pspreadborough@comcast.net> wrote:
>
> ----- "Travis Stratman" <tstratman@emacinc.com> wrote:
>> On Fri, 2010-02-05 at 13:41 -0800, Khem Raj wrote:
>> > On Fri, Feb 5, 2010 at 12:43 PM, Travis Stratman <tstratman@emacinc.com> wrote:
>> > > On Fri, 2010-02-05 at 10:00 -0800, Khem Raj wrote:
>> > >> On Fri, Feb 5, 2010 at 4:29 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
>> > >> > On 02/03/10 15:03, pspreadborough@comcast.net wrote:
>> > >> >>
>> > >> >> My 2.6.29 kernel is built with the CodeSourcery
>> > >> >> arm-2009q3-67-arm-none-linux-gnueabi compiler and has the EABI and
>> > >> >> OABI_COMPAT config options enabled. Using this kernel I can boot my SA1110
>> > >> >> iPaq into a OABI ramfs with no problems, however if I build a "HelloWorld"
>> > >> >> executable with the same compiler and try and run it I get an "Illegal
>> > >> >> Instruction" error. I build the test program using static linking, select
>> > >> >> the correct machine type and tune options but to no avail, I always get the
>> > >> >> illegal instruction.
>> > >>
>> > >> You need gcc 4.4 to get EABI working on ARMv4 and there are additional patches
>> > >> to gcc on top of gcc 4.4 see
>> > >> gcc-armv4-pass-fix-v4bx-to-ld.patch for gcc in OE. So as Koen suggested earlier
>> > >> if you try with OE compiler you might have better chance of getting it
>> > >> to work as many
>> > >> OE devs have tried it.
>> > >> btw. are you passing march=armv4 to the compiler when doing the compile ?
>> > >
>> > > >From my understanding of this issue he has an OABI rootfs and is trying
>> > > to run an EABI executable on top of it. This just doesn't work period
>> > > AFAIK; the kernel can boot either OABI or EABI with the compatibility
>> > > flags config'd in, but all of the binaries on the filesystem must match.
>> > >
>> > > I'll have to look into the patch that you referenced above because I
>> > > have been using EABI (built through OE) for both the kernel and
>> > > filesystem with armv4t for a few years now. First w/ GCC 4.1.1 and now
>> > > with 4.2.4 and I've never run into issues. Does the issue only manifest
>> > > in certain situations?
>> >
>> > Well you said armv4t thats a whole different story than armv4 (without
>> > 't') for EABI
>> > AFAICT SA1110 is based on ARMv4 not ARMv4t.
>>
>> You are correct, my mistake.
>
> I have built a EABI rootfs but I get a kernel panic when it attempts
> to run init, hence my attempts to verify my EABI executables on a OABI
> fs.
>
> Perhaps it's time for me to try the OE EABI compiler. Can you advise me
> on which OE recipes to use for this?

use 4.4.2 or 4.4.3

>
> Regards,
>
> Pete
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


