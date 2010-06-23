Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORYSe-0003zE-Ay
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 00:30:30 +0200
Received: by pxi2 with SMTP id 2so692037pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=v5hiHgjfVADboAiSokw02YLayiermqOfhGg2L5Bc9SM=;
	b=aBxWMCurDt5hPFqW8jJsYWPN0l4KuSjDCnaZIcCLdJXiRq//XBbf707qJHLWQN4DNL
	i+hRA1LnRjjkvGuAeLaZ+IAiQfPbdUWIXyQ0RRzEk5uDyClBUPHujjPc1JL3LfUF0koi
	gLAeuSdWruDeNlhNVu/YsvxWcuw957bIjsVPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=bKU8zoWl24NMFT20OKhbb4TOwIfeHs3guTVFsYu7y4aaWv+98gn/yri/ZuYgfc6pL4
	wWf7Dl6q+CvQjUh7F5DKBZU4MlZ33xnsi/uGTBlrGygJNo1o+BURGotpRwvIqCmXrUhh
	OyztsJyXshZTfNH/NOkdXSMxuqVFBwnk6g66M=
Received: by 10.142.249.19 with SMTP id w19mr7915655wfh.175.1277331942763;
	Wed, 23 Jun 2010 15:25:42 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f20sm8180706rvb.15.2010.06.23.15.25.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 15:25:42 -0700 (PDT)
Date: Wed, 23 Jun 2010 15:26:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623222650.GD6653@gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
	<20100623172352.GC5535@gmail.com>
	<AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Wed, 23 Jun 2010 22:30:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/06/10 22:04), Frans Meulenbroeks wrote:
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
> >> >>>>> I'm about to complete bringing a new architecture (nios2 with mmu) and
> >> >>>>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
> >> >>>>> Embeddeded Evaluation Kit (aka neek)) to oe.
> >> >>>>> Is there a policy on on the process how to do this.
> >> >>>>
> >> >>>> Have a look at the nios2 patches Leon sent last december, they were
> >> >>>> reviewed on this list, but not committed.
> >> >>>
> >> >>> Koen, thanks for reminding me the look at the review comments.
> >> >>>
> >> >>> I'm well aware of the work of Leon and Walter (and they are well aware
> >> >>> of my work).
> >> >>> Note that what Leon posted was for a non-mmu nios2 core, whereas the
> >> >>> changes I have is for an mmu core.
> >> >>>
> >> >>> Triggered by Koens reminder I revisited the review comments. Actually
> >> >>> none but one are applicable for me.
> >> >>> The one that is applicable is the one about pinning versions in
> >> >>> machine descriptions.
> >> >>> I have also done that, as there are simply no other versions of
> >> >>> binutils and gcc that can be used by this hardware.
> >> >>> Also I don't feel empowered to make changes in distribution specific files.
> >> >>>
> >> >>> The only alternative way that I can think of is doing something like:
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
> >> (e.g. if  DEFAULT_PREFERENCE = "-1" does mean something like: "does
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

as I said see AVR32 in sane-toolchain.inc

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

distro's are fairly independent so if you intend to support so many of them
and then you have change distro files accordingly.

> For now I think it is probably best to have gcc-nios recipes and
> define virtual/gcc in the machine configurations. (haven't really seen
> objections to that, and for virtual/kernel this seems common practise)

why do you want to compicate already complicated gcc recipes and
mechanisms. Goal should be to consolidate not to diverge.

> The best solution is indeed to have a sane-toolchain.inc that defines
> the available versions for an architecture and that is used by every
> distro, but somehow I doubt if that will happen.

well even this does come with some pricetag. There is a downside to it that changing
versions in sane-toolchain.inc would require qualification on all distro's
that use it. so more distro's harder it will be. But it could be an
achievable goal but thats distro maintainer's choice and I am fine with
whatever they choose.


