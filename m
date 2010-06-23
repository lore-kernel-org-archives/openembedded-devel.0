Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1ORXzc-0002tG-8h
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 00:00:31 +0200
Received: by gwb19 with SMTP id 19so2092313gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=k7PxharYspx671mlxgP0Lp4trfYNmc+U2zUpCLrFRrc=;
	b=o+kCgsGLcrl5laCKhilK3naJlusMB4gQBda8Gb8OSWOrwnyaSO3z9xX++uLfCOxLQq
	9wI0JxIT6GROUd2PJG15vBbkHeIWI+yPFd5ergWCOY6GGOXjY5LmWUgPXdBQPKcnwbsS
	rNQCV8vvJb4HoLkzWRyNhJB/MYIc64aMRIN6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L5I8NenrQqCx2I1MlA3dJNap3Mv+TXJLl7p7wgdPqahBziMHnqDS93RNYb4U7CpIqL
	/4JEtT7mwYHGGuZEf+iAmwWSF+mi+0JmsbdsTVx9llEhvrbc7+tPUcIww5wCda4oxhf+
	HR/2c7nlAeJv9Zo3ggvgmp+PDpfZjKKd/jwMo=
MIME-Version: 1.0
Received: by 10.229.250.208 with SMTP id mp16mr4707580qcb.132.1277330146686; 
	Wed, 23 Jun 2010 14:55:46 -0700 (PDT)
Received: by 10.229.233.144 with HTTP; Wed, 23 Jun 2010 14:55:46 -0700 (PDT)
In-Reply-To: <AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
	<20100623172352.GC5535@gmail.com>
	<AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
Date: Wed, 23 Jun 2010 16:55:46 -0500
Message-ID: <AANLkTilpGEP-rg2JArFxbRw_dh5ISJYD6IHf9ulzi8kq@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 23 Jun 2010 22:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm working on xilinx platforms support (virtex4, virtex5,
generic-microblaze) [1]
and trying to do it as generic possible, in my case the target boards
depending on the
family can target a hard core arch (powerpc) or a soft-cpu (microblaze),
As far of my work progress I select the supported combinations of
gcc/binutils/glibc in
distro conf files (angstrom-2008).
In config machine files I add u-boot and linux preferred version since this
recipes inherits
xilinx-bsp.bbclass to able to copy some headers to match the
hardware/software model.
Also in xilinx-bsp I handle the possible combinations of configuring u-boot
for the final arch.

But I also require a way to override the final target-tune instead of
introducing a new variable
TARGET_TUNE see [2];

What could be a good approach to handle the final arch configuration
options?

Regards

[1] http://www.gitorious.org/oe-microblaze/<http://www.gitorious.org/oe-microblaze/oe-microblaze/blobs/xilinx-support/conf/machine/xilinx-virtex4.conf>
[2]
http://www.gitorious.org/oe-microblaze/oe-microblaze/blobs/xilinx-support/conf/machine/xilinx-virtex4.conf

On Wed, Jun 23, 2010 at 3:04 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/6/23 Khem Raj <raj.khem@gmail.com>:
> > On (23/06/10 12:09), Frans Meulenbroeks wrote:
> >> 2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > On 23-06-10 10:53, Frans Meulenbroeks wrote:
> >> >> 2010/6/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> >> >>> 2010/6/20 Koen Kooi <k.kooi@student.utwente.nl>:
> >> >>>> -----BEGIN PGP SIGNED MESSAGE-----
> >> >>>> Hash: SHA1
> >> >>>>
> >> >>>> On 20-06-10 11:58, Frans Meulenbroeks wrote:
> >> >>>>> Hi,
> >> >>>>>
> >> >>>>> I'm about to complete bringing a new architecture (nios2 with mmu)
> and
> >> >>>>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
> >> >>>>> Embeddeded Evaluation Kit (aka neek)) to oe.
> >> >>>>> Is there a policy on on the process how to do this.
> >> >>>>
> >> >>>> Have a look at the nios2 patches Leon sent last december, they were
> >> >>>> reviewed on this list, but not committed.
> >> >>>
> >> >>> Koen, thanks for reminding me the look at the review comments.
> >> >>>
> >> >>> I'm well aware of the work of Leon and Walter (and they are well
> aware
> >> >>> of my work).
> >> >>> Note that what Leon posted was for a non-mmu nios2 core, whereas the
> >> >>> changes I have is for an mmu core.
> >> >>>
> >> >>> Triggered by Koens reminder I revisited the review comments.
> Actually
> >> >>> none but one are applicable for me.
> >> >>> The one that is applicable is the one about pinning versions in
> >> >>> machine descriptions.
> >> >>> I have also done that, as there are simply no other versions of
> >> >>> binutils and gcc that can be used by this hardware.
> >> >>> Also I don't feel empowered to make changes in distribution specific
> files.
> >> >>>
> >> >>> The only alternative way that I can think of is doing something
> like:
> >> >>> DEFAULT_PREFERENCE_nios2 = "1" in the recipes I need.
> >> >>> No idea if that overrules the distro settings or not, but I can give
> >> >>> it a try later today.
> >> >>
> >> >> Well, tried it and apparently a distro pin has priority over a
> >> >> DEFAULT_PREFERENCE_nios2 in the recipe.
> >> >> Guess I'll have to do the pinning the the machine description as
> >> >> described above.
> >> >
> >> > NO! Machines *never* pin versions, that's what distros and to a lesser
> >> > extent recipes are for.
> >>
> >> The issue is that I have no way to specify which versions of a
> >> toolchain that are supported (and to enforce that only a supported
> >> version works).
> >> If the DEFAULT_PREFERENCE in recipes had priority above whatever a
> >> distro pins using DEFAULT_PREFERENCE in the recipe could work.
> >> (e.g. if  DEFAULT_PREFERENCE = "-1" does mean something like: "does
> >> not work" and that is respected by the distro).
> >>
> >> Actually I do not want the machine to pin the recipe, I want the
> >> architecture to pin the recipe (or at least tell which versions are
> >> sound, and avoid that non-functional versions are used).
> >
> > you can use the TARGET_ARCH override to do that
>
> I'm not fully sure how one would actually do that.Please explain it to
> me on irc.
>
> >>
> >> If I cannot pin in a machine file, the only alternative seems to be to
> >> make gcc-nios2-* recipes and use a virtual/gcc in the conf file to
> >> select gcc-nios2 as the preferred versions (just like a lot of
> >> machines do with virtual/kernel). Seems like a waste of effort to me,
> >> but oh well
> >
> > Already suggested a solution in prior reply.
>
> I can pin in sane-toolchain, but only a few distro's seem to use that.
> For now I think it is probably best to have gcc-nios recipes and
> define virtual/gcc in the machine configurations. (haven't really seen
> objections to that, and for virtual/kernel this seems common practise)
> The best solution is indeed to have a sane-toolchain.inc that defines
> the available versions for an architecture and that is used by every
> distro, but somehow I doubt if that will happen.
> >
> >>
> >> BTW where did the rule come from that machines never pin versions?
> >> When was that decided?
> >> And as an owner of the machine file, isn't its contents something
> >> which is at my discretion ???
> >
> > Well yes but within bounds of design and common structure. You dont get a
> license to
> > kill with maintainership if you know what I mean :)
>
> I know what you mean, but I don't like it if people sell me crap like
> "NO! Machines *never* pin versions" while within a few seconds I can
> provide evidence that there are not one or two, but 71 machines that
> pin something in their conf.
>
> Frans.
>
> >
> >>
> >> And as a final remark:
> >> I did a quick grep in conf/machine:
> >> $ grep PREFERRED_VERSION * -l | wc
> >>      71      71    1065
> >> $ grep PREFERRED_VERSION * | wc
> >>     104     314    5761
> >>
> >> So there are 71 machine descriptions that pin at least one package. In
> >> total these 71 contain 104 pins.
> >> Most of these pin kernel and/or u-boot but there are also two other
> >> machines that pin gcc.
> >>
> >> Frans.
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

