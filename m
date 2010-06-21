Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQmrI-0006xZ-Cp
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 21:40:41 +0200
Received: by pxi4 with SMTP id 4so24277pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=szYEclxnfqLH0vcivRDR4Lz8RcgKT/DgiZHDqEl+akQ=;
	b=QdzwMXg/xSdaBs1Y8YZ6Duyavj3uq04QNUxEj6VNhf67yR4Yr7Br360tkfO8DMu/VB
	vqTfS11zoMIU5jtntGOgnKUGBqNLcVpNa6HB4Oxbfv3doRyVxk0g1yhFGde8dGnNlrvD
	6n35ppFRqsNit5ido5J/JqyDpu0OY0Xk/9TUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ODe6Qo2HkbwrHLaNykGpXX0/kRFdnCQz1C/2UdrPC0mjVF1kuvMrbf1vhEMjqJLD2M
	eJ3OTDtCPQx7ggX6lCFtPt+SKEePFt20v3aaeWE8UQh61obqv5l2wZwdGW3gzX6dz/Rd
	2+DcxPgIOt0tEEzxHKLXi5luZ7MxGAy/IHXPE=
Received: by 10.142.67.30 with SMTP id p30mr3863712wfa.154.1277148964069;
	Mon, 21 Jun 2010 12:36:04 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t1sm3371550rvl.21.2010.06.21.12.36.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 12:36:03 -0700 (PDT)
Date: Mon, 21 Jun 2010 12:36:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100621193659.GA28361@gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
	<4C1F7B40.3060609@mentor.com>
	<AANLkTimFBLIRDkIT4qu-G6YxaqQEmlttwBGa_wHcYzMJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimFBLIRDkIT4qu-G6YxaqQEmlttwBGa_wHcYzMJ@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Jun 2010 19:40:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/06/10 21:27), Frans Meulenbroeks wrote:
> 2010/6/21 Tom Rini <tom_rini@mentor.com>:
> > Frans Meulenbroeks wrote:
> >>
> >> Dear all,
> >>
> >> After the introduction of linux-libc-headers-native I've bumped into
> >> the following issue.
> >> linux-libc-headers-native installs unistd.h in sysroots
> >> This causes other recipes to pick up the x86 files instead of the target
> >> ones.
> >> I've seen this happen for both unistd.h and sigcontext.h
> >
> > What DISTRO/MACHINE are you using?
> 
> DISTRO is angstrom-2008.1, MACHINE is NEEK; this one is NIOS2 based
> and not committed yet.
> From examining the gcc-cross dir I suspect some other archtectures
> will also be vulnerable to this (as they also have a linux-unwind.h
> which includes signal.h to get sigcontext).
> The following architectures have a sigcontext struct in their gcc/config dir:
> 
> gcc-cross-4.1.2-r23.1/gcc-4.1.2/gcc/config> grep -r sigcontext .
> ./sh/linux-unwind.h:  struct sigcontext *sc;
> ./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> &rt_->uc.uc_mcontext;
> ./sh/linux-unwind.h:  struct sigcontext *sc;
> ./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> &rt_->uc.uc_mcontext;
> ./alpha/linux-unwind.h:  struct sigcontext *sc;
> ./i386/linux-unwind.h:  struct sigcontext *sc;
> ./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> &uc_->uc_mcontext;
> ./i386/linux-unwind.h:  struct sigcontext *sc;
> ./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
> &rt_->uc.uc_mcontext;
> ./mips/linux-unwind.h:    struct sigcontext uc_mcontext;
> ./mips/linux-unwind.h:  struct sigcontext *sc;
> ./mips/linux-unwind.h:	struct sigcontext sigctx;
> ./mips/linux-unwind.h:  /* On o32 Linux, the register save slots in
> the sigcontext are
> ./ia64/linux-unwind.h:/* This works only for glibc-2.3 and later,
> because sigcontext is different
> ./ia64/linux-unwind.h:	struct sigcontext *sc;
> ./ia64/linux-unwind.h:      struct sigcontext *sc = frame_->sc;
> ./ia64/linux-unwind.h:	 in the sigcontext but leaves them intact, so there's no
> ./ia64/linux-unwind.h:	struct sigcontext *sc;
> ./ia64/linux-unwind.h:      struct sigcontext *sc = frame->sc;
> ./ia64/linux-unwind.h:	 in the sigcontext but leaves them intact, so there's no
> ./pa/linux-unwind.h:   tell us how to locate the sigcontext structure.
> ./pa/linux-unwind.h:  struct sigcontext *sc;
> ./nios2/linux-unwind.h:	struct sigcontext ctx;

try to port recipes/gcc/gcc-4.2.4/sh_unwind.patch to nios. This could help
here.

-Khem


