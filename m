Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9B8H-0001Lo-Pz
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:29:42 +0200
Received: by gxk22 with SMTP id 22so347927gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=fZH8YUUYOFxcA9r5yVnJySdKsp3xZHijUyvLJZQdbRY=;
	b=q+421Chw1uM7kXWdHUFnhN6ZixdnAZmL8dR5f0wv9HI5EawRmlRKGEMt7o5xGmkf/d
	n4aPnbK+ABE3aN7vrNXHREF6hL4P1LdlSLTupd/bKcXHd9AoizjC5Vy/qfXovT7rntAu
	W8RECabyVX0u3iL2zFH0T4YtObWoneUHNj+hc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=l/sF0xiXwdkKDe+B2kZ2Ez1fTlDVY1p1tcqJAk9Im80hhpRTy5HMli3LYxQVCL1lHm
	xJ3SOg8n3mEC0Yy6n7mN6K6VDQnVM3mJcbXj0fx8lOgisdl2ikVLgTMuBUGd34tvs5L5
	nAkgENI0czpTAmxDZt9KqU1YitOpu/LQTSvBE=
MIME-Version: 1.0
Received: by 10.42.41.16 with SMTP id n16mr1649401ice.270.1287728936930; Thu,
	21 Oct 2010 23:28:56 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 23:28:56 -0700 (PDT)
In-Reply-To: <4CC0B81F.6030706@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com> <i9osim$dcl$1@dough.gmane.org>
	<AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>
	<i9p0tr$5iq$1@dough.gmane.org> <4CC0B81F.6030706@atmel.com>
Date: Fri, 22 Oct 2010 08:28:56 +0200
Message-ID: <AANLkTi=hLsCrMjw4_mvyniVX8GUsqkVZ2nUnrcm4-UD6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
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
X-List-Received-Date: Fri, 22 Oct 2010 06:29:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> Koen Kooi skrev:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 21-10-10 10:43, Frans Meulenbroeks wrote:
>>
>>> PS: my opinion is that machine maintainers generally know better what
>>> kernel works best for their machines than distro owners;
>>
>> And what's stopping them to put DEFAULT_PREFERENCE_machine and
>> COMPATIBLE_MACHINE in the kernel recipes?
>> There is no technical reason for setting it in machine.conf, so why
>> should we break the orthogonality for that?
>>
>>> PPS: what's next? removing the PREFERRED_PROVIDER_virtual/kernel from
>>> the machine configs because you feel you know better ?
>>
>> That is actually an option these days since most kernel recipes set
>> COMPATIBLE_MACHINE correctly :)
>> But seriously, there are use cases for one distro to use a different
>> kernel for a given machine for whatever reasons.
>>
>> This whole situation is a mess because recipes/linux is a mess. It would
>> be a nice topic for OEDEM to see if we should switch to a poky BSP
>> model. It would boils down to:
>>
>> 1 bblayer per machine or SOC_FAMILY containing:
>> * machine.conf
>> * first and second stage bootloaders
>> * kernel
>
> I have already come to the conclusion that we could have a single linux.bb
> recipe.
>
> This assumes that you define things like KERNEL_VERSION, SOC_FAMILY
> etc. outside the recipe and then include files with include filenames
> containing approproate ENVIRONMENT variables.
>
> I.E:
> include $(KERNEL_VERSION)/kernel_source
> include $(SOC_FAMILY)/$(KERNEL_VERSION)/kernel_patch
>
> etc.
>

Isn't that what kernel.bbclass is about ?

Wrt your example:
instead of
include $(KERNEL_VERSION)/kernel_source
you could say:
at the place where you define kernel_source:
SRC_URI = "..."

Basically what you propose is kind of a template.

Frans


