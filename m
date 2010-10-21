Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8qkt-0004RD-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 10:44:12 +0200
Received: by iwn35 with SMTP id 35so1981327iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BuH5Lt3gtwbLPhfoOCp2rdQ6EuSsIRToQWiKil5wXhk=;
	b=WJBFBXJ6MsIQ0snYltST2hTqYtgu+Jcbbo5uy3yWvXzn/P+aGhlC3V/zF28zknFY/M
	XAuij/6KHXqgpZZuEFN0GPuQUM8qCi3pOFwh4gnwTDTbCkBIY0J/h8DEp5vVFgpfrSmY
	1kWHLEHP+2mgLbr4+ZQW6ywPM+JDXdV3xqoLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sahnKa1XBxwwiJMaI4RgBamqQeS57qXI9WvX2DXoIsV+nfNzWFWzi9Czk5ezUpZ74l
	I9cSHYpCq5bS2jxFfgcCrH1yss5ekGYvmYBPkRs+6j9+nlr9zuggD4rCpz5C9pegiU7l
	J+9iAI+c7Fyi3VJ3Jij5lSlSl/61hyl0gTlyI=
MIME-Version: 1.0
Received: by 10.231.16.195 with SMTP id p3mr583620iba.62.1287650614639; Thu,
	21 Oct 2010 01:43:34 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 21 Oct 2010 01:43:34 -0700 (PDT)
In-Reply-To: <i9osim$dcl$1@dough.gmane.org>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com> <i9osim$dcl$1@dough.gmane.org>
Date: Thu, 21 Oct 2010 10:43:34 +0200
Message-ID: <AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Oct 2010 08:44:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-10-10 01:57, Ulf Samuelsson wrote:
>
>> 1) Many boards do put kernel version in the machine conf file.
>
> And they all shouldn't be doing that. I'll remove everyone of those
> later today.

I don't think you can do that without consulting the machine maintainers.

From the commit policy:
 * Machine configs are less sensitive but machine maintainers should be
   consulted where present and known

Also i feel a review and some time to let people adapt to it is useful.
Some distro's might (right or wrong)  rely on the pinning that is done
by the machine, so removing the pinnings without any notice could
seriously break stuff for others.

From someone who complained before about others removing things or
touching "his" recipe, I expect also respect for the work and position
of others.

Frans.

PS: my opinion is that machine maintainers generally know better what
kernel works best for their machines than distro owners; they also
"own" the defconfig file
We have linux*/${MACHINE}/defconfig files, but not
linux*/${DISTRO}/defconfig files.

PPS: what's next? removing the PREFERRED_PROVIDER_virtual/kernel from
the machine configs because you feel you know better ?

Thinking of it: why not allow a machine to set its PREFERRED version
and provider and override that within the distro, should a distro
decide it wants something else?


