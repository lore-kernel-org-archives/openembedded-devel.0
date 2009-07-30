Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWO9u-0006ZD-C0
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 07:26:30 +0200
Received: by qyk35 with SMTP id 35so1713477qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 22:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oPyxThP2Cf+6fSfIcu0n53O0e+OHTKlKBeyYInnCLzI=;
	b=kowAeEr5deM+XN3qqYU5kHB1aZuthAr15Ruwo8jJTpm2Ei3zRrzqJtuhAu/JCBBPRD
	2AmRg5QlX4OeVqkDPw6fQJc/oKEdBLuzfD+MCFY/O2YH1NWrVQDHbF9mERO2D0j8YlYK
	EeywMPamjuysF9vMcP0MZ6dgfc354nBryUxSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eFnxnpASXbDh/KLRd9BkDmU684VB4EtLHLVmktN9l+Ar5w2zmgjvyZLW5I7XJXk+Fo
	InmtWcf+JVHjJi1dtBD9n0PSdRHaqLIebzGJ7g5dpTZwsbxayiHJ8bqFxQV9ci6ssf0y
	gBm/GHWfn/saYY9EBNGiShZp0YExaDT2h7+bk=
MIME-Version: 1.0
Received: by 10.229.81.140 with SMTP id x12mr132102qck.35.1248930690171; Wed, 
	29 Jul 2009 22:11:30 -0700 (PDT)
In-Reply-To: <200907291131.04967.marcin@juszkiewicz.com.pl>
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
	<4A700A74.7040507@xora.org.uk>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
Date: Thu, 30 Jul 2009 14:41:30 +0930
Message-ID: <6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Thu, 30 Jul 2009 05:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2009/7/29 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia =B6roda, 29 lipca 2009 o 10:38:12 Graeme Gregory napisa=B3(a):
>> Koen Kooi wrote:
>> > NAK, this breaks the resulting kernel-image ipk
>>
>> Double NAK, read the git log, I put this there to specifically make
>> stuff work, I thought I had removed it from kernel.bbclass but I
>> obviously forgot to push that patch. Doing it in do_deploy is just
>> totally wrong.
>
> So maybe remove it from kernel.bbclass/do_deploy and move
> linux.inc/do_compile_append to kernel.bbclass?
>
> We need to clean linux.inc by moving stuff from it to kernel.bbclass.
>

Ok, my patch is bogus. It doesn't even let me do what I wanted.
*smacks self for not testing first*

The real issue is that my kernel entry point is not fixed. The entry
point can be found by searching for the 'kernel_entry' symbol in the
vmlinux. And unfortunately, I can't search for this at an appropriate
time to be able to set UBOOT_ENTRYPOINT.

What I would need is something like the following, post do_compile.

UBOOT_ENTRYPOINT=3D`${NM} ${S}/vmlinux | \
		awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print $1}'

Where UBOOT_ENTRYSYMBOL=3D"kernel_entry" could be set from the ${MACHINE}.c=
onf.


Presumably no one else's machine with a variable entry point is using
u-boot.... The uImage makefile target in my kernel tree generates a
uImage anyway. Perhaps this step could simply be skipped if the
${S}/arch/${ARCH}/uImage file already exists?

-Graham


