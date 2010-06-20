Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQHYK-0000tY-9T
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 12:15:01 +0200
Received: by bwz14 with SMTP id 14so682377bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LUUv5c0OxPGqYk4BO8RTneMwAY7tV3Sxh5emx8bLY3s=;
	b=LQu2As1RPFI/lgieDDBCVyHUhxuHOWrl7yKRFvB+ibXLeD4pR2x2yLXf61l4OrdFQG
	0Hr0bSrYMNC5PX0S0qKVStFx6jDKYMNxVL+Hi4reLUhzYHrEISVOWAesl9hjyfWJXG7t
	UBTypijLycJLjqjf5kgtqMkByi61TstWsaXV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mQ0Pq0aPd5VggS3wFTHItCVUbQOkAQMxbdq2+gVIS1nCL2J3WhZ6mNxCsw22XwRq6u
	rc2N4SWuLSxFxr+5pe158NP1JwGX/7wH069eZo7IKkJRnQgjwS+FRGeyeLOu2LijPbPx
	TXzWxClBxpX2vH24tKrhsH5HntFqMPQxdRIyc=
MIME-Version: 1.0
Received: by 10.204.79.204 with SMTP id q12mr1684335bkk.118.1277028628370; 
	Sun, 20 Jun 2010 03:10:28 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Sun, 20 Jun 2010 03:10:28 -0700 (PDT)
In-Reply-To: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
Date: Sun, 20 Jun 2010 12:10:28 +0200
Message-ID: <AANLkTimgVzkf5AyjiLjL8konvlZcMmpkVciB696FI6zL@mail.gmail.com>
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
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Sun, 20 Jun 2010 10:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Hi,
>
> I'm about to complete bringing a new architecture (nios2 with mmu) and
> machine (cyclone III FPGA starter kit, and maybe also the Nios2
> Embeddeded Evaluation Kit (aka neek)) to oe.
> Is there a policy on on the process how to do this.
>
> Changes are fairly localised:
> - add suport to binutils for the new architecture (currently based
> upon binutils 2.17.50.0.12)
> - add support to gcc for the new architecture (based upon gcc 4.1.2)
> - added a kernel recipe (and a linux-libc-headers recipe for 2.6.34)
> - some hardware specific changes to glibc 2.5
>
> And some smaller changes (e.g. adding the machines, adding the
> architecture to insane.bbclass and siteinfo.class, and a small patch
> or two on other recipes (mainly busybox)).
>
> Can I just commit these? It does not impact other architectures/machines.
> Patches are fairly big (because of the new files that contain the
> machine specific stuff), so posting them is impractical
> If someone wants to review I can also make a branch, but this is only
> useful if someone is actually going to review this (volunteers
> welcome).
>
> Please advise.
>
> Some concluding remarks:
> Only a minor part of the work is mine. Most comes from the nios2 git
> (git://sopc.et.ntust.edu.tw/git/toolchain-mmu.git). The stuff on that
> git is based upon a windriver version of the csl toolchain.
> My activity was mostly isolating the nios2 specific stuff and create
> patches for mainstream package versions.
> That is also the reason why it is based upon old versions of
> gcc/binutils/glibc: I didn't want to deviate too much from what is in
> the git.
>
> BTW: as nios2 is a programmable core, there may be different variants.
> So you need to program the board with the appropriate .sof file.
> The one I used for neek is the one found here:
> http://www.nioswiki.com/Try_out_without_compilation
> Should I put this sof file somewhere in the oe tree? No idea if this
> is legally ok, and no idea where to put it.
> Or should I put a reference somewhere? (and if so, where?)
>
> Suggestions welcome!
>
> Have fun! Frans
>
Oops. forgot one thing:

gcc for nios2 only seems to build on a 32 bit architecture. While
cross compling gcc on a 64 bit architecture gcc bails out with an
internal compilation error: segmentation fault.
(actually only tried on ubunti 10.04, 64 bit).
No idea yet on how to fix this. Moving to a different version of gcc
did not help.
Open to suggestions on how to fix this.

Frans


