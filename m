Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iyk60-0008T7-Ch
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 09:22:36 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB28JFiq001326 for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Dec 2007 09:19:15 +0100
Message-ID: <47526A83.30109@student.utwente.nl>
Date: Sun, 02 Dec 2007 09:19:15 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47520EA7.8030507@whitby.id.au>
In-Reply-To: <47520EA7.8030507@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Inclusion of bootloader utilities in task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2007 08:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Some MACHINE configurations have FEATURES defined for 'uboot' and
> 'redboot'.  It looks like these are intended to identify the bootloader
> used on that machine.
> 
> These turn on additions to RDEPENDS in task-base for some bootloader
> utilities.
> 
> RFC #1: Is putting bootloader utilities in task-base a good idea in the
> first place?  Surely it's something that you either need for first boot
> (in which case it should be in the more primitive task-boot list), or
> it's something you use rarely after first boot (in which case it
> shouldn't be  wasting precious flash space in a task-base list but
> should just be ipkg installed when needed).
> 
> RFC #2: Shouldn't these be RRECOMMENDS unless they are absolutely
> critical, so that you can ipkg remove them if you don't want them.

I'm not familiar with the finer points of bootloaders, so I'm not really
qualified to respond to this, but if the utils are _critical_, they
should be RDEPENDS in task-boot, not task base.

regards,

Koen


> RFC #3: I want to add an 'apex' FEATURE for the Apex bootloader, and
> have that enable the 'apex-env' utility.  Any objections?  It would be
> done in the way decided by RFC #2, and subject to an RFC #1 decision.
> 
> RFC #4: If a machine (like the ixp4xx) can use a number of different
> bootloaders (redboot and apex in the case of the NSLU2), should they all
> be listed as features in machine.conf?
> 
> -- Rod
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHUmqDMkyGM64RGpERApTWAJ0Tv04Q+IepkAvT3ciF0TZRMKaPQwCbB1r4
b/wlDDn2RfoPM/di65PDBFM=
=H8Wb
-----END PGP SIGNATURE-----


