Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ORWGC-0006Hz-J6
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 22:09:25 +0200
Received: by bwz14 with SMTP id 14so2395000bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=akeHf5FWLVs9hJ6zUbosdw3vlY8aVVQHhmyXrOwmOf8=;
	b=B154Y+oURiTNa8OpLTmBq1Aaw5+jKRFK9xbrEuwREPPRAnzxuFs0I4lH105dbt8zzo
	9PcKSExi1HMkV79tNmoX/bTnvKyD8KhSJooh0cvMIAcQBmTBDKsQG5gU+5COFSStyJfs
	ALIzwAwlgBqAYDwuXA+ejMpt6r3EHBVx615rI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lE9yVY4LGO8WDkbEjhOMUKPqbXMggANQQ2lqCfXktpFUjR2fkx5NDBrSEndqBsMLNj
	Tn4TDH67WFNgmjh+9dPY0V/eT3GQ0Lw4ryRLos2CSr0zM5R2gusxF5XMCEZMKXYlcYjc
	eGH9IwkI/P/vPX5tCY9fbiXrjmjGxq2T7rNZI=
MIME-Version: 1.0
Received: by 10.204.138.91 with SMTP id z27mr6072711bkt.162.1277323489497; 
	Wed, 23 Jun 2010 13:04:49 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Wed, 23 Jun 2010 13:04:49 -0700 (PDT)
In-Reply-To: <20100623172352.GC5535@gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
	<20100623172352.GC5535@gmail.com>
Date: Wed, 23 Jun 2010 22:04:49 +0200
Message-ID: <AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Wed, 23 Jun 2010 20:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/23 Khem Raj <raj.khem@gmail.com>:
> On (23/06/10 12:09), Frans Meulenbroeks wrote:
>> 2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 23-06-10 10:53, Frans Meulenbroeks wrote:
>> >> 2010/6/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> >>> 2010/6/20 Koen Kooi <k.kooi@student.utwente.nl>:
>> >>>> -----BEGIN PGP SIGNED MESSAGE-----
>> >>>> Hash: SHA1
>> >>>>
>> >>>> On 20-06-10 11:58, Frans Meulenbroeks wrote:
>> >>>>> Hi,
>> >>>>>
>> >>>>> I'm about to complete bringing a new architecture (nios2 with mmu)=
 and
>> >>>>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
>> >>>>> Embeddeded Evaluation Kit (aka neek)) to oe.
>> >>>>> Is there a policy on on the process how to do this.
>> >>>>
>> >>>> Have a look at the nios2 patches Leon sent last december, they were
>> >>>> reviewed on this list, but not committed.
>> >>>
>> >>> Koen, thanks for reminding me the look at the review comments.
>> >>>
>> >>> I'm well aware of the work of Leon and Walter (and they are well awa=
re
>> >>> of my work).
>> >>> Note that what Leon posted was for a non-mmu nios2 core, whereas the
>> >>> changes I have is for an mmu core.
>> >>>
>> >>> Triggered by Koens reminder I revisited the review comments. Actuall=
y
>> >>> none but one are applicable for me.
>> >>> The one that is applicable is the one about pinning versions in
>> >>> machine descriptions.
>> >>> I have also done that, as there are simply no other versions of
>> >>> binutils and gcc that can be used by this hardware.
>> >>> Also I don't feel empowered to make changes in distribution specific=
 files.
>> >>>
>> >>> The only alternative way that I can think of is doing something like=
:
>> >>> DEFAULT_PREFERENCE_nios2 =3D "1" in the recipes I need.
>> >>> No idea if that overrules the distro settings or not, but I can give
>> >>> it a try later today.
>> >>
>> >> Well, tried it and apparently a distro pin has priority over a
>> >> DEFAULT_PREFERENCE_nios2 in the recipe.
>> >> Guess I'll have to do the pinning the the machine description as
>> >> described above.
>> >
>> > NO! Machines *never* pin versions, that's what distros and to a lesser
>> > extent recipes are for.
>>
>> The issue is that I have no way to specify which versions of a
>> toolchain that are supported (and to enforce that only a supported
>> version works).
>> If the DEFAULT_PREFERENCE in recipes had priority above whatever a
>> distro pins using DEFAULT_PREFERENCE in the recipe could work.
>> (e.g. if =A0DEFAULT_PREFERENCE =3D "-1" does mean something like: "does
>> not work" and that is respected by the distro).
>>
>> Actually I do not want the machine to pin the recipe, I want the
>> architecture to pin the recipe (or at least tell which versions are
>> sound, and avoid that non-functional versions are used).
>
> you can use the TARGET_ARCH override to do that

I'm not fully sure how one would actually do that.Please explain it to
me on irc.

>>
>> If I cannot pin in a machine file, the only alternative seems to be to
>> make gcc-nios2-* recipes and use a virtual/gcc in the conf file to
>> select gcc-nios2 as the preferred versions (just like a lot of
>> machines do with virtual/kernel). Seems like a waste of effort to me,
>> but oh well
>
> Already suggested a solution in prior reply.

I can pin in sane-toolchain, but only a few distro's seem to use that.
For now I think it is probably best to have gcc-nios recipes and
define virtual/gcc in the machine configurations. (haven't really seen
objections to that, and for virtual/kernel this seems common practise)
The best solution is indeed to have a sane-toolchain.inc that defines
the available versions for an architecture and that is used by every
distro, but somehow I doubt if that will happen.
>
>>
>> BTW where did the rule come from that machines never pin versions?
>> When was that decided?
>> And as an owner of the machine file, isn't its contents something
>> which is at my discretion ???
>
> Well yes but within bounds of design and common structure. You dont get a=
 license to
> kill with maintainership if you know what I mean :)

I know what you mean, but I don't like it if people sell me crap like
"NO! Machines *never* pin versions" while within a few seconds I can
provide evidence that there are not one or two, but 71 machines that
pin something in their conf.

Frans.

>
>>
>> And as a final remark:
>> I did a quick grep in conf/machine:
>> $ grep PREFERRED_VERSION * -l | wc
>> =A0 =A0 =A071 =A0 =A0 =A071 =A0 =A01065
>> $ grep PREFERRED_VERSION * | wc
>> =A0 =A0 104 =A0 =A0 314 =A0 =A05761
>>
>> So there are 71 machine descriptions that pin at least one package. In
>> total these 71 contain 104 pins.
>> Most of these pin kernel and/or u-boot but there are also two other
>> machines that pin gcc.
>>
>> Frans.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


