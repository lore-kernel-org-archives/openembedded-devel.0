Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8rqo-0001El-Hr
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 11:54:23 +0200
Received: by iwn35 with SMTP id 35so2046156iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ek7f0S0T2zo8mYhDCBqoapvkX1WIVRDvxkQmLA/igtE=;
	b=Fz70UdchkPeqS4+aKR2rIGjazoezt8ovgDm9iaVimHfA/h3FOWCVTFOhONyO3eZ488
	9bZI/wMzQS3frizY9VP7xRGna1c8Ae6S7WUiHJLVlfc7e0UsFBYNLNbni04JoUU38x3f
	Qq6dOd5XWBZN7PzEUiZb+/0qePdy6JFxaoOns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nLIb5s/kokf0fXu0UzWmc1ZHX4Ly749mu+DJQDVZEFuETvNDalmVXQhxQ0uDb1hyaB
	RWlfjw/GDS5MOu1kEVRXJNDhDE5s2U4Nf7pEKP6z0oA+ZCd+oFXoaUdWx7I/3w0I5oD6
	NFO4z4/mzxDqTEcUkNSRBU4nQE5ISxchqEnwQ=
MIME-Version: 1.0
Received: by 10.231.155.212 with SMTP id t20mr687059ibw.37.1287654825778; Thu,
	21 Oct 2010 02:53:45 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 02:53:45 -0700 (PDT)
In-Reply-To: <i9p0tr$5iq$1@dough.gmane.org>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com> <i9osim$dcl$1@dough.gmane.org>
	<AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>
	<i9p0tr$5iq$1@dough.gmane.org>
Date: Thu, 21 Oct 2010 11:53:45 +0200
Message-ID: <AANLkTinkrKz3+7=Y-QT=_HFcq7PNpuHe9tFroBUJN3G7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Thu, 21 Oct 2010 09:54:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-10-10 10:43, Frans Meulenbroeks wrote:
>
>> PS: my opinion is that machine maintainers generally know better what
>> kernel works best for their machines than distro owners;
>
> And what's stopping them to put DEFAULT_PREFERENCE_machine and
> COMPATIBLE_MACHINE in the kernel recipes?
> There is no technical reason for setting it in machine.conf, so why
> should we break the orthogonality for that?

I have no problems with that. We could start a migration process to
achieve that. Guess the machine maintainers should be involved (and if
no maintainer is known, i feel the machine should either get a new
maintainer otherwise we should seriously consider whether we want to
keep the machine).

Then again on the other hand it would be nice to have all machine
specifics in one place (which is an argument for machine.conf), but of
course the distro should be able to override that.

>
>> PPS: what's next? removing the PREFERRED_PROVIDER_virtual/kernel from
>> the machine configs because you feel you know better ?
>
> That is actually an option these days since most kernel recipes set
> COMPATIBLE_MACHINE correctly :)
> But seriously, there are use cases for one distro to use a different
> kernel for a given machine for whatever reasons.

Agree. I am not saying the distro should blindly follow the machine,
the distro should have the ultimate control of what goes in the
distro, but I feel it is up to the machine maintainer to come with a
set of sensible defaults for that machine (which are applied if the
distro uses the default setting)
>
> This whole situation is a mess because recipes/linux is a mess. It would

Agree!
In a lesser case it also applies for u-boot (where some of the
messiness is hidden in the uboot-git recipe)

> be a nice topic for OEDEM to see if we should switch to a poky BSP
> model. It would boils down to:
>
> 1 bblayer per machine or SOC_FAMILY containing:
> * machine.conf
> * first and second stage bootloaders
> * kernel
>
> I can see some serious issues with that, but that's for another thread
> to discuss.
>
> regards,
>
> Koen

Enjoy, Frans.


