Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORNIn-0008TS-27 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 12:35:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORNEM-0001Fa-7s for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 12:30:54 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 12:30:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 12:30:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Jun 2010 12:30:44 +0200
Message-ID: <hvsnol$mvd$1@dough.gmane.org>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>	<hvl1uc$bol$1@dough.gmane.org>	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 23 Jun 2010 10:35:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-06-10 12:09, Frans Meulenbroeks wrote:
> 2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 23-06-10 10:53, Frans Meulenbroeks wrote:
>>> 2010/6/20 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>>>> 2010/6/20 Koen Kooi <k.kooi@student.utwente.nl>:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> On 20-06-10 11:58, Frans Meulenbroeks wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I'm about to complete bringing a new architecture (nios2 with mmu) and
>>>>>> machine (cyclone III FPGA starter kit, and maybe also the Nios2
>>>>>> Embeddeded Evaluation Kit (aka neek)) to oe.
>>>>>> Is there a policy on on the process how to do this.
>>>>>
>>>>> Have a look at the nios2 patches Leon sent last december, they were
>>>>> reviewed on this list, but not committed.
>>>>
>>>> Koen, thanks for reminding me the look at the review comments.
>>>>
>>>> I'm well aware of the work of Leon and Walter (and they are well aware
>>>> of my work).
>>>> Note that what Leon posted was for a non-mmu nios2 core, whereas the
>>>> changes I have is for an mmu core.
>>>>
>>>> Triggered by Koens reminder I revisited the review comments. Actually
>>>> none but one are applicable for me.
>>>> The one that is applicable is the one about pinning versions in
>>>> machine descriptions.
>>>> I have also done that, as there are simply no other versions of
>>>> binutils and gcc that can be used by this hardware.
>>>> Also I don't feel empowered to make changes in distribution specific files.
>>>>
>>>> The only alternative way that I can think of is doing something like:
>>>> DEFAULT_PREFERENCE_nios2 = "1" in the recipes I need.
>>>> No idea if that overrules the distro settings or not, but I can give
>>>> it a try later today.
>>>
>>> Well, tried it and apparently a distro pin has priority over a
>>> DEFAULT_PREFERENCE_nios2 in the recipe.
>>> Guess I'll have to do the pinning the the machine description as
>>> described above.
>>
>> NO! Machines *never* pin versions, that's what distros and to a lesser
>> extent recipes are for.
> 
> The issue is that I have no way to specify which versions of a
> toolchain that are supported (and to enforce that only a supported
> version works).

You have no way to pin versions based on arch? Angstrom does that just
fine for blackfin, avr32 and armv4:

# Blackfin has its on gcc
ANGSTROM_GCC_VERSION_bfin           = "4.1.2"

#avr32 only has support for gcc 4.2.2
ANGSTROM_GCC_VERSION_avr32      ?= "4.2.2"

#armv4 needs at least gcc 4.4.2 for eabi
ANGSTROM_GCC_VERSION_armv4              ?= "4.4.2"

#Everybody else can just use this:
ANGSTROM_GCC_VERSION                     ?= "4.3.3"

PREFERRED_VERSION_gcc                    ?= "${ANGSTROM_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross              ?= "${ANGSTROM_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-sdk          ?= "${ANGSTROM_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-initial      ?= "${ANGSTROM_GCC_VERSION}"
PREFERRED_VERSION_gcc-cross-intermediate ?= "${ANGSTROM_GCC_VERSION}"

So what's stopping you from creating a patch that does

+ANGSTROM_GCC_VERSION_nios2-mmu = "4.1.2"

And similar for binutils? For other distros you can use sane-toolchain
or something.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIeJUMkyGM64RGpERAs9AAJ4smKJ3ErSKzGa5ge5AJecDNjukqACaA/t/
ljn0G+lPaOSpjcI+l8B6LaA=
=vlrX
-----END PGP SIGNATURE-----



