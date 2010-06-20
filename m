Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQTYW-00078U-E7
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 01:04:01 +0200
Received: by iwn5 with SMTP id 5so2886316iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=RnCnZ8Du1yGbFaw0YElDNIAXLs9HtUny7+L64f1Ttfk=;
	b=v8oaZg1v3TX+/jp8Nx/f6uf8WzKdHnDpNB/XFqSVOgX4RJyLOkvV+cYrDTFB7bCxid
	NOEXNpVCEsoBsmUsCt15caYdOUdSkkUqswF0qRhTHVJJSyNf9Qy+n8KlIHuLMNShXxPv
	p88kJgYSsOmnfW+pMAojlhGpRlhHiSXZ6SqEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=MXS1y8VVnq3G+rBXgr2dARuyaJkWqBOPeOgS8/n1z2t3kaHYb6cfQIQYHYPHYiGhyY
	OYjL3VScCP/mvBVGRnN+z0P/FagQ17cOs6TSHORWoLtisQNHkeC2zzzrlIK1bQMtXJHR
	aDtbDLFK9+mik/IyiLgFKb2WeqH5Z1Gt6el1A=
Received: by 10.231.169.131 with SMTP id z3mr4403539iby.48.1277074768241; Sun, 
	20 Jun 2010 15:59:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Sun, 20 Jun 2010 15:59:08 -0700 (PDT)
In-Reply-To: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jun 2010 15:59:08 -0700
Message-ID: <AANLkTinWJ0dqR2ECi1B0mS_rM-clNGV6i-NE7-dCN0ut@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Sun, 20 Jun 2010 23:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jun 20, 2010 at 2:58 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
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

you can commit them to a user branch and post your user branch for
review if you want
it reviewed.

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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


