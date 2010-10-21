Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8rPT-0003nx-Hg for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 11:26:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8rOp-0005Kf-PE for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 11:25:27 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:25:27 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:25:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 Oct 2010 11:25:15 +0200
Message-ID: <i9p0tr$5iq$1@dough.gmane.org>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org>	<4CBC7F6A.9040000@atmel.com>	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>	<4CBCD3FC.5090305@atmel.com>	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>	<4CBF81FC.3040803@atmel.com>
	<i9osim$dcl$1@dough.gmane.org>
	<AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 21 Oct 2010 09:26:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-10-10 10:43, Frans Meulenbroeks wrote:

> PS: my opinion is that machine maintainers generally know better what
> kernel works best for their machines than distro owners;

And what's stopping them to put DEFAULT_PREFERENCE_machine and
COMPATIBLE_MACHINE in the kernel recipes?
There is no technical reason for setting it in machine.conf, so why
should we break the orthogonality for that?

> PPS: what's next? removing the PREFERRED_PROVIDER_virtual/kernel from
> the machine configs because you feel you know better ?

That is actually an option these days since most kernel recipes set
COMPATIBLE_MACHINE correctly :)
But seriously, there are use cases for one distro to use a different
kernel for a given machine for whatever reasons.

This whole situation is a mess because recipes/linux is a mess. It would
be a nice topic for OEDEM to see if we should switch to a poky BSP
model. It would boils down to:

1 bblayer per machine or SOC_FAMILY containing:
* machine.conf
* first and second stage bootloaders
* kernel

I can see some serious issues with that, but that's for another thread
to discuss.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwAb7MkyGM64RGpERAuYSAKCaGnOasoXFk0Cb9xvcASP211PU0gCfaacw
850xksIBon0+M5P9rbt4mOo=
=5mO/
-----END PGP SIGNATURE-----



