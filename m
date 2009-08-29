Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhIzT-0003H9-JK
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 10:08:52 +0200
Received: by qyk34 with SMTP id 34so1606218qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 00:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oEc4DtHh/Ki6X6g5eVF6KV1plNUbhP982uGDRkR7jzU=;
	b=oxqyeUO0p+khRl1mT98pVXgYvlSKCYDxalRCwDjzV1q0+Bazj7TWDe4qtoTf/Yy4Vk
	tS33DVpQw5pJsclA1D5v0BjLrq8uCe4fkC6NSN/SGAyzuYStogtX6ZIUyPsozddUUCtQ
	N/A9e3xtn3vzGbkim7HBAs4VGXJAEPT0JV5do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oJB71J9jYzxXOH6zYR+NSzqq9ZMgZamBdYkZzhcRxd0t4Q04cfQxZQdtpUPHGj2Iu3
	YWUOXV5stftE2LYpUwo0z9Z4EtatZYax15Ir0DUwn5FCh7vxWDrrG1e+4qDKTPqnSH3i
	+9nt1YXYG2n4k/m9mUKolW4QL/6TNK+Vs8uDo=
MIME-Version: 1.0
Received: by 10.229.11.147 with SMTP id t19mr1077471qct.28.1251532234078; Sat, 
	29 Aug 2009 00:50:34 -0700 (PDT)
In-Reply-To: <20090829020254.GC6785@smtp.west.cox.net>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
Date: Sat, 29 Aug 2009 00:50:34 -0700
Message-ID: <19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 08:08:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2009 at 7:02 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Fri, Aug 28, 2009 at 05:00:44PM -0700, Khem Raj wrote:
>
>> Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
>> which is e500 cores.
>
> Two things. =C2=A0First, doesn't that override the previous TARGET_OS? =
=C2=A0Or
> did I miss some magic in there to use the previous result?

hmm yes it wil if it is linux-gnueabi then the second assignment will
reset it to linux

Discard it.  I think we need something better

Second, can
> we trigger this on something other than the machine list? =C2=A0This will=
 get
> larger, not smaller. =C2=A0BASE_PACKAGE_ARCH perhaps? =C2=A0Or would that=
 not be
> allowed?

yeah sounds a better idea let me look into it a bit.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


