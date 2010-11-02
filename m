Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDOsK-0007Go-75
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:58:40 +0100
Received: by ywo32 with SMTP id 32so4688586ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=dvjOE0DQkyukB3QjovBP6OSUFoc3BPXpJhkMbQNg9Ew=;
	b=tPHXw9b8YhP9JhdrfM27YOEk2EsD1PYzpGiiUBEHN09UUIgfDPqXOfdBcStSBPe1fx
	2wp3xqzFEapffy6EFTHjHMOlGC1lfP6kxtCUKv5SXT3kpP7gQQFkjur8gATvqr7roIvT
	yrgBstwBws4c4slaEq22BDbrdKYg2ST+G8vQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BC7VW03YNOSlaLsYP/HtJi8JnobhoGne5MyV8MI0hd/fg2due/CUFQab57TK+1mL4d
	Ed81WNaAjhIY6mSgsaxwlqL7DcwurvWdpXzSOVTm4UfDqVHXbGX8zsW9Csc4G/rShW0r
	66rv5b6iZ+nAoEC3jzju+o0wOYZ5vMRwwVxFI=
Received: by 10.90.57.2 with SMTP id f2mr2065559aga.118.1288735068168; Tue, 02
	Nov 2010 14:57:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 14:57:27 -0700 (PDT)
In-Reply-To: <iaptb1$bpb$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 14:57:27 -0700
Message-ID: <AANLkTimH3Nuj0VJNAB6AjGDMJtmW-xAN+MyZ0pgiFC-s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 21:58:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 2, 2010 at 1:46 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 02-11-10 08:02, Frans Meulenbroeks wrote:
>> 2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Hi,
>>>
>>> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
>>> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
>>> It would boil down to:
>>>
>>> 1 base bblayer with shared files:
>>> * conf/machine/include

I think cortexa8 would be  common to non omap/beagleboard machines so
it would be desirable
that this is not overridden from core layer if possible.

>>> * recipes/linux/*.inc

some incs like linux.inc could still stay in core layer

>>>
>>> 1 bblayer per machine or SOC_FAMILY containing:
>>> * machine.conf
>>> * first and second stage bootloaders
>>> * kernel

this is fine. I think SOC_FAMILY or for subarch family is a processor based call
but omap is quite prevalent and has many machines so soc_family in
omap case makes
sense

in general we should try to move minimal stuff into machine layers for
obvious maintenance
burdening reasons. I am afraid that this has potential of leading us
into maintenance problems
if we hold this loosely.

>>>
>>> So, what are peoples thoughts on this? I haven't thought this through
>>> myself, so feel free to point out any show stoppers.
>>> I do not want this to turn into a "splitting the metadata" discussion,
>>> while I'm all for that, it really is a seperate effort and discussion.
>>> But any bblayer style split would benefit from OE being a collection of
>>> git submodules instead of a monolithic tree[1].
>>>
>>> Regards,
>>>
>>> Koen
>>>
>>> [1] Provided git submodules stop sucking so hard in future git versions
>>
>> Replying on the original message on purpose.
>>
>> Is the discussion concluded?
>> How do we proceed with this? Should we have a vote? escalate to TSC?
>> postpone until after the dec 1 release? already do something in a
>> branch?
>
> I have an experimental beagleboard layer, but I want to spend a bit more
> time using it before I come up with an RFC for it.
>
> You have have a look at it at
> http://gitorious.org/angstrom/angstrom-layers/trees/master/BSP/beagleboard
> but I want to stress that it currently is a quick hack that doesn't
> exploit bblayers fully yet.
>
> RP did show me a neat trick to overlay files without copying the
> complete metadata:
>
> http://gitorious.org/angstrom/angstrom-layers/commit/9890faee0eb861bdfd995910090126a8fe83be90.patch
>
> So I would encourage people to try creating their own machine layers to
> get a feel for it so the discussion will be based on actual experience
> instead of handwaving :)
>
> I do fear that pulling things into seperate layers too much will make it
> harder to propagate fixes...
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM0HihMkyGM64RGpERAtlXAKCFK7WmZFTQACKJiegOSKx+panfcQCeJpq0
> Iotf629VoDn0Tb48DkbyHkw=
> =ot/l
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


