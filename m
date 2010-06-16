Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OOwFB-0006Uk-Np
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 19:17:42 +0200
Received: by ywh6 with SMTP id 6so4703749ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=M51L65AIbquB/p93VMCti3j6h63jYonfsoCIpHTZjWU=;
	b=S3RGyKP6ndTXYyaInliA+bXt32z+wdsZT6B5LVzugFO5jMC1iV/taT/8DlnSlWTFoT
	sPguyqwzDi33KanYJCloTemEc1kVdz0u+MRyEUIhAY1LrNgByd2SAunw0i2dghDMVz9u
	KG3dDkreDO1Ayjw/ZDZD5F/G70TANTqf8Wvi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FD2ihCkVJ4uCgZJ909bSSNfQ8Pl4rDknK/9SvoTjOPnvvJvgXFaPIotrcVvA6UjjCD
	XNHJUnMQ1F7PfN6yMaSWqT/Z7L0hJEVvSGd/B00rGDjHlKM3v58VxOLbPCe2aMu5p98G
	Bb7+eIuTVjQfU+vN+lUdH6i+SlNSIE1VrJo7U=
Received: by 10.151.28.13 with SMTP id f13mr9910426ybj.143.1276708391783; Wed, 
	16 Jun 2010 10:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Wed, 16 Jun 2010 10:12:51 -0700 (PDT)
In-Reply-To: <20100616175640.4d7795ff@xora-desktop.xora.org.uk>
References: <4C187CF6.5010401@gmx.net>
	<20100616090200.5c23b895@xora-desktop.xora.org.uk> 
	<AANLkTilul0-HFnIkW2eJ7lTzZ7EMzq6qBzLYZhUVxyhZ@mail.gmail.com> 
	<20100616175640.4d7795ff@xora-desktop.xora.org.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jun 2010 10:12:51 -0700
Message-ID: <AANLkTimFM0nCDuT-eMOJRvolhw06Q6uoHwmbnebIIFjL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 17:17:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 16, 2010 at 9:56 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> On Wed, 16 Jun 2010 09:54:07 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Jun 16, 2010 at 1:02 AM, Graeme Gregory <dp@xora.org.uk>
>> wrote:
>> > On Wed, 16 Jun 2010 09:27:50 +0200
>> > Robert Schuster <thebohemian@gmx.net> wrote:
>> >
>> >> Hi,
>> >> Angstrom's default GCC is 4.3.3 for ARM. Unfortunately that version
>> >> lacks atomic intrinsics support for the very same architecture
>> >> (__sync_synchronize and friends). The support is available from
>> >> 4.4.x onwards but a patch exists in Ubuntu's GCC that adds the
>> >> intrinsics to the earlier GCC version. I would like add that patch
>> >> to our GCC 4.3.x (all of them so there is not suddenly a feature
>> >> missing when one changes from one microversion to another). This
>> >> has the potential for drastic effects on other recipes because a
>> >> lot of programs (e.g. pulseaudio, llvm) check for the availability
>> >> of the intrinsics and make use of them in that case.
>> >>
>> >> I ask for comments here because I would also like to see this
>> >> change move into OE stable later on. (The use case is to get
>> >> OpenJDK with the Shark JIT compiler [llvm-based] to run on the
>> >> bug20 hardware).
>> >>
>> >> Regards,
>> >> Robert
>> >
>> > This sounds like it would require a DISTRO_PR bump on the Angstrom
>> > side
>>
>> why a DISTRO_PR bump. ? Just update the libgcc
>>
> Did you miss the "This has the potential for drastic effects..." bit?

Those applications are working fine and they will keep working fine as
long as you dont recompile them
and you make sure that libgcc is updated then whenever you rebuild an
application that uses the atomic
builtins will start using them until then it should work without using them.

Maybe I am missing something it would be helpful if Robert could
explain potential scenarios
where it would break precompiled binaries. I don't see it.

>
> Graeme
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


