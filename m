Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQn3m-0007Pz-My
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 21:53:35 +0200
Received: by fg-out-1718.google.com with SMTP id 22so995335fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 12:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6jjkPShk9inQlve/dlEpPJEZbp+ZXxJ77uyuqKTf/x8=;
	b=b/IwFVKX/SoC0EzcXZj8eou0+bDgHfnef59u85XHrnNq/c4SH4Y9jmE1ebJ1zatZVw
	jLVtvugKPMvs3Ry5tbXB/cx5SgGRiC6Ymwi2gtnLijPk27cMt3hk7rAsJEdgYdlr0QkY
	cYwWI+A9gT2GpXWHs4tPMySFA2gGHrGK0/ICY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WkKycoDTnooqyUXZC7QuMEmjEJ+GA88cgOyzv+oEaPqY+2rn313j8uv9gtJZstqaPX
	8yX6ZoDLat0fB/BFRkfd9ehEr+gg0m3IZnnNCIMXtf3DRIcn6Mdtbig6ZqlaTbuX65Hk
	45HCB+kBVL9ogsISMc9HjKKVjwONfjq+6H+94=
MIME-Version: 1.0
Received: by 10.204.74.25 with SMTP id s25mr3396013bkj.76.1277149741514; Mon, 
	21 Jun 2010 12:49:01 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Mon, 21 Jun 2010 12:49:01 -0700 (PDT)
In-Reply-To: <20100621193659.GA28361@gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
	<4C1F7B40.3060609@mentor.com>
	<AANLkTimFBLIRDkIT4qu-G6YxaqQEmlttwBGa_wHcYzMJ@mail.gmail.com>
	<20100621193659.GA28361@gmail.com>
Date: Mon, 21 Jun 2010 21:49:01 +0200
Message-ID: <AANLkTin5tkEC0OmJRmnItPYD53U0g87kjoWVCJOKL64y@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 21 Jun 2010 19:53:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/21 Khem Raj <raj.khem@gmail.com>:
> On (21/06/10 21:27), Frans Meulenbroeks wrote:
>> 2010/6/21 Tom Rini <tom_rini@mentor.com>:
>> > Frans Meulenbroeks wrote:
>> >>
>> >> Dear all,
>> >>
>> >> After the introduction of linux-libc-headers-native I've bumped into
>> >> the following issue.
>> >> linux-libc-headers-native installs unistd.h in sysroots
>> >> This causes other recipes to pick up the x86 files instead of the tar=
get
>> >> ones.
>> >> I've seen this happen for both unistd.h and sigcontext.h
>> >
>> > What DISTRO/MACHINE are you using?
>>
>> DISTRO is angstrom-2008.1, MACHINE is NEEK; this one is NIOS2 based
>> and not committed yet.
>> From examining the gcc-cross dir I suspect some other archtectures
>> will also be vulnerable to this (as they also have a linux-unwind.h
>> which includes signal.h to get sigcontext).
>> The following architectures have a sigcontext struct in their gcc/config=
 dir:
>>
>> gcc-cross-4.1.2-r23.1/gcc-4.1.2/gcc/config> grep -r sigcontext .
>> ./sh/linux-unwind.h: =A0struct sigcontext *sc;
>> ./sh/linux-unwind.h: =A0 =A0 =A0sc =3D (struct sigcontext *) (void *)
>> &rt_->uc.uc_mcontext;
>> ./sh/linux-unwind.h: =A0struct sigcontext *sc;
>> ./sh/linux-unwind.h: =A0 =A0 =A0sc =3D (struct sigcontext *) (void *)
>> &rt_->uc.uc_mcontext;
>> ./alpha/linux-unwind.h: =A0struct sigcontext *sc;
>> ./i386/linux-unwind.h: =A0struct sigcontext *sc;
>> ./i386/linux-unwind.h: =A0 =A0 =A0sc =3D (struct sigcontext *) (void *)
>> &uc_->uc_mcontext;
>> ./i386/linux-unwind.h: =A0struct sigcontext *sc;
>> ./i386/linux-unwind.h: =A0 =A0 =A0sc =3D (struct sigcontext *) (void *)
>> &rt_->uc.uc_mcontext;
>> ./mips/linux-unwind.h: =A0 =A0struct sigcontext uc_mcontext;
>> ./mips/linux-unwind.h: =A0struct sigcontext *sc;
>> ./mips/linux-unwind.h: =A0 =A0 =A0 =A0struct sigcontext sigctx;
>> ./mips/linux-unwind.h: =A0/* On o32 Linux, the register save slots in
>> the sigcontext are
>> ./ia64/linux-unwind.h:/* This works only for glibc-2.3 and later,
>> because sigcontext is different
>> ./ia64/linux-unwind.h: =A0 =A0 =A0 =A0struct sigcontext *sc;
>> ./ia64/linux-unwind.h: =A0 =A0 =A0struct sigcontext *sc =3D frame_->sc;
>> ./ia64/linux-unwind.h: =A0 =A0 =A0 =A0 in the sigcontext but leaves them=
 intact, so there's no
>> ./ia64/linux-unwind.h: =A0 =A0 =A0 =A0struct sigcontext *sc;
>> ./ia64/linux-unwind.h: =A0 =A0 =A0struct sigcontext *sc =3D frame->sc;
>> ./ia64/linux-unwind.h: =A0 =A0 =A0 =A0 in the sigcontext but leaves them=
 intact, so there's no
>> ./pa/linux-unwind.h: =A0 tell us how to locate the sigcontext structure.
>> ./pa/linux-unwind.h: =A0struct sigcontext *sc;
>> ./nios2/linux-unwind.h: =A0 =A0 =A0 struct sigcontext ctx;
>
> try to port recipes/gcc/gcc-4.2.4/sh_unwind.patch to nios. This could hel=
p
> here.
>

Will look into it. This might indeed help (actually I don't know too
much about this).
Still of course this is only a workaround. The root cause is the host
inc dir when compiling a target dir.
Thinking of it, apart from fixing the root cause (which is probably
above my capabilities), the simplest way would be just to patch the
generated Makefile and remove the offending -I
That would also solve my unistd.h problem.

Frans


