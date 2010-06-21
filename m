Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQnH8-0003g7-3G
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 22:07:24 +0200
Received: by pxi4 with SMTP id 4so38092pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 13:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=PbHwGDMyTCpxe9GiiaShY3bp0SDXTBb2004v/VRJ2xQ=;
	b=Jm2bF5d298oFzZDRT4Qi2Tr754KWEB6WKptlNdYURBBMrEFkG3JX6R4ztKd6FycXR6
	8KIipiI5omvOQiAxCk7yU6NYnMO0hL3Fx6mm/TcjaMQx10qP31Dq2ynt8R9IzoLebxRx
	zzLQaJA9KNktIKEBIwgIbjL1dQJZiknzwvNnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=IPs3eDkoXWUWipdKdHRkGrIuoInnO2IXGZsQtDmGCESynlSV/tKjtoIF2U20qpOxUB
	g4s+daKk6fr7Qpg06SIY/Yu15XKLZeHrAJYM2lwPxb8BE5zCZh6CyzwbBSD7i3kN51Eb
	76FOVCUsOnMW9mpy91q6Msfh94TYQ8PoZlFyI=
Received: by 10.115.98.19 with SMTP id a19mr4428264wam.82.1277150232170;
	Mon, 21 Jun 2010 12:57:12 -0700 (PDT)
Received: from gmail.com ([99.57.141.118])
	by mx.google.com with ESMTPS id h9sm19366448wal.0.2010.06.21.12.57.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 12:57:09 -0700 (PDT)
Date: Mon, 21 Jun 2010 12:58:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100621195806.GA28518@gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
	<4C1F7B40.3060609@mentor.com>
	<AANLkTimFBLIRDkIT4qu-G6YxaqQEmlttwBGa_wHcYzMJ@mail.gmail.com>
	<20100621193659.GA28361@gmail.com>
	<AANLkTin5tkEC0OmJRmnItPYD53U0g87kjoWVCJOKL64y@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin5tkEC0OmJRmnItPYD53U0g87kjoWVCJOKL64y@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Mon, 21 Jun 2010 20:07:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (21/06/10 21:49), Frans Meulenbroeks wrote:
> 2010/6/21 Khem Raj <raj.khem@gmail.com>:
> > On (21/06/10 21:27), Frans Meulenbroeks wrote:
> >> 2010/6/21 Tom Rini <tom_rini@mentor.com>:
> >> > Frans Meulenbroeks wrote:
> >> >>
> >> >> Dear all,
> >> >>
> >> >> After the introduction of linux-libc-headers-native I've bumped into
> >> >> the following issue.
> >> >> linux-libc-headers-native installs unistd.h in sysroots
> >> >> This causes other recipes to pick up the x86 files instead of the target
> >> >> ones.
> >> >> I've seen this happen for both unistd.h and sigcontext.h
> >> >
> >> > What DISTRO/MACHINE are you using?
> >>
> >> DISTRO is angstrom-2008.1, MACHINE is NEEK; this one is NIOS2 based
> >> and not committed yet.
> >> From examining the gcc-cross dir I suspect some other archtectures
> >> will also be vulnerable to this (as they also have a linux-unwind.h
> >> which includes signal.h to get sigcontext).
> >> The following architectures have a sigcontext struct in their gcc/config dir:
> >>
> >> gcc-cross-4.1.2-r23.1/gcc-4.1.2/gcc/config> grep -r sigcontext .
> >> ./sh/linux-unwind.h:  struct sigcontext *sc;
> >> ./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> >> &rt_->uc.uc_mcontext;
> >> ./sh/linux-unwind.h:  struct sigcontext *sc;
> >> ./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> >> &rt_->uc.uc_mcontext;
> >> ./alpha/linux-unwind.h:  struct sigcontext *sc;
> >> ./i386/linux-unwind.h:  struct sigcontext *sc;
> >> ./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> >> &uc_->uc_mcontext;
> >> ./i386/linux-unwind.h:  struct sigcontext *sc;
> >> ./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> >> &rt_->uc.uc_mcontext;
> >> ./mips/linux-unwind.h:    struct sigcontext uc_mcontext;
> >> ./mips/linux-unwind.h:  struct sigcontext *sc;
> >> ./mips/linux-unwind.h:        struct sigcontext sigctx;
> >> ./mips/linux-unwind.h:  /* On o32 Linux, the register save slots in
> >> the sigcontext are
> >> ./ia64/linux-unwind.h:/* This works only for glibc-2.3 and later,
> >> because sigcontext is different
> >> ./ia64/linux-unwind.h:        struct sigcontext *sc;
> >> ./ia64/linux-unwind.h:      struct sigcontext *sc = frame_->sc;
> >> ./ia64/linux-unwind.h:         in the sigcontext but leaves them intact, so there's no
> >> ./ia64/linux-unwind.h:        struct sigcontext *sc;
> >> ./ia64/linux-unwind.h:      struct sigcontext *sc = frame->sc;
> >> ./ia64/linux-unwind.h:         in the sigcontext but leaves them intact, so there's no
> >> ./pa/linux-unwind.h:   tell us how to locate the sigcontext structure.
> >> ./pa/linux-unwind.h:  struct sigcontext *sc;
> >> ./nios2/linux-unwind.h:       struct sigcontext ctx;
> >
> > try to port recipes/gcc/gcc-4.2.4/sh_unwind.patch to nios. This could help
> > here.
> >
> 
> Will look into it. This might indeed help (actually I don't know too
> much about this).
> Still of course this is only a workaround. 

no its not a workaround. such a fix is upstream in gcc for SH and MIPS

The root cause is the host
> inc dir when compiling a target dir.
> Thinking of it, apart from fixing the root cause (which is probably
> above my capabilities), 

GMPINC should not be passed when building target files. I will see if I can
cook up something.

the simplest way would be just to patch the
> generated Makefile and remove the offending -I
> That would also solve my unistd.h problem.

thats even uglier to much with generated files.

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


