Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQmil-0004Zl-Mg
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 21:31:58 +0200
Received: by bwz14 with SMTP id 14so1274760bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 12:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=1VvJigSTIXnql9OzrjFFOobcIqZZ/gxghPqGsIUPfYk=;
	b=vf12IEQDNsWodFQpx7mM+7IMnVUwsvLof+e/lrFYSxm7EkPeynhYyE4a9rbsxi+rAk
	DcZ4HplpkHND5dSr7rRIA4OZSTlWHxZaOQbcg0ezMaasGcipmpdAHpYq3Hwn4YI+qLfp
	7nB39z+hpdKgiCYDbzHZzqm77JNWoDqPZWdJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DTzanS+HSuSA3eGo3HE3eDatPa5ruD9iULc9WQfh7H/aVdADGVdIsUUFv3AR/I9ZV2
	yXWXVU7tjQuVtdtAfV9uOp19oEKA90i4IsJIjn8BdSeaJaHIPWJXTfvXEC2EUY8Sxs/W
	pOqbdYpWtT0sTOHwftCbUsPvsnkeYLWg5p2u0=
MIME-Version: 1.0
Received: by 10.204.47.34 with SMTP id l34mr3363173bkf.77.1277148438854; Mon, 
	21 Jun 2010 12:27:18 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Mon, 21 Jun 2010 12:27:18 -0700 (PDT)
In-Reply-To: <4C1F7B40.3060609@mentor.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
	<4C1F7B40.3060609@mentor.com>
Date: Mon, 21 Jun 2010 21:27:18 +0200
Message-ID: <AANLkTimFBLIRDkIT4qu-G6YxaqQEmlttwBGa_wHcYzMJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 21 Jun 2010 19:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/21 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> Dear all,
>>
>> After the introduction of linux-libc-headers-native I've bumped into
>> the following issue.
>> linux-libc-headers-native installs unistd.h in sysroots
>> This causes other recipes to pick up the x86 files instead of the target
>> ones.
>> I've seen this happen for both unistd.h and sigcontext.h
>
> What DISTRO/MACHINE are you using?

DISTRO is angstrom-2008.1, MACHINE is NEEK; this one is NIOS2 based
and not committed yet.
From examining the gcc-cross dir I suspect some other archtectures
will also be vulnerable to this (as they also have a linux-unwind.h
which includes signal.h to get sigcontext).
The following architectures have a sigcontext struct in their gcc/config dir:

gcc-cross-4.1.2-r23.1/gcc-4.1.2/gcc/config> grep -r sigcontext .
./sh/linux-unwind.h:  struct sigcontext *sc;
./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
&rt_->uc.uc_mcontext;
./sh/linux-unwind.h:  struct sigcontext *sc;
./sh/linux-unwind.h:      sc = (struct sigcontext *) (void *)
&rt_->uc.uc_mcontext;
./alpha/linux-unwind.h:  struct sigcontext *sc;
./i386/linux-unwind.h:  struct sigcontext *sc;
./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
&uc_->uc_mcontext;
./i386/linux-unwind.h:  struct sigcontext *sc;
./i386/linux-unwind.h:      sc = (struct sigcontext *) (void *)
&rt_->uc.uc_mcontext;
./mips/linux-unwind.h:    struct sigcontext uc_mcontext;
./mips/linux-unwind.h:  struct sigcontext *sc;
./mips/linux-unwind.h:	struct sigcontext sigctx;
./mips/linux-unwind.h:  /* On o32 Linux, the register save slots in
the sigcontext are
./ia64/linux-unwind.h:/* This works only for glibc-2.3 and later,
because sigcontext is different
./ia64/linux-unwind.h:	struct sigcontext *sc;
./ia64/linux-unwind.h:      struct sigcontext *sc = frame_->sc;
./ia64/linux-unwind.h:	 in the sigcontext but leaves them intact, so there's no
./ia64/linux-unwind.h:	struct sigcontext *sc;
./ia64/linux-unwind.h:      struct sigcontext *sc = frame->sc;
./ia64/linux-unwind.h:	 in the sigcontext but leaves them intact, so there's no
./pa/linux-unwind.h:   tell us how to locate the sigcontext structure.
./pa/linux-unwind.h:  struct sigcontext *sc;
./nios2/linux-unwind.h:	struct sigcontext ctx;

The last one (nios2) is not committed yet. i386 is probably not
vulnerable (at least not on a i386 host) and maybe the same holds for
ia64 (less sure about that).
That leaves as problematic structures: sh, alpha, mips, pa, nios2
arm does not seem to be affected.
Guess the fact that only less popular machines are affected is the
reason this did not surface earlier.

Frans.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


