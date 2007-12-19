Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J4u3q-0005Wk-Iq
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 09:13:52 +0100
Received: from Powerbook-2.local (vpn006097.vpn.utwente.nl [130.89.6.97])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBJ88k0k009791 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 09:08:46 +0100
Message-ID: <4768D18E.2000105@student.utwente.nl>
Date: Wed, 19 Dec 2007 09:08:46 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>	<978793792.20071218133500@gmail.com>	<74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>	<1211397506.20071218170516@gmail.com>
	<4768368B.3010103@whitby.id.au>
In-Reply-To: <4768368B.3010103@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
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
X-List-Received-Date: Wed, 19 Dec 2007 08:13:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> pHilipp Zabel wrote:
>>> So now that we have the easy method implemented, let's strive for a correct one.
>>> I'd say vfat as other file systems should be a distro-only feature,
>>> cardslot (or "removablestorage") a machine-only one:
>>> "vfat" in DISTRO_FEATURES and "cardslot" in MACHINE_FEATURES --> task-base-vfat
>>> "ext2" in DISTRO_FEATURES and ("cardslot" in MACHINE_FEATURES or "hdd"
>>> in MACHINE_FEATURES) --> task-base-ext2 (without the hdparm
>>> dependency)
>>> "hdd" in MACHINE_FEATURES --> hdparm
>>> etc.
> 
> I agree with the principle.  We also need to add 'usbhost' to the list
> of machine features which can enable the ext2 and vfat distro features
> (for usb flash sticks on devices with usb host ports).
> 
> And of course we need to work out the best way (and appropriate timing)
> for implementation. :-)
> 
> Marcin, Koen, Richard: Do you guys have an opinion on this
> machine/distro features independent naming and combinations of different
> names feeding into combined features?  We need agreement on the
> principle before getting too far into implementation discussion.

My opinion is that 'DISTRO_*' is a misnomer since it essentially decides
what gets into an image. But it works on a 'global' task-base, so it
isn't IMAGE_* either. Maybe we should have a look at what Steve Sakoman
cooked up for the gumstix people.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHaNGOMkyGM64RGpERArvgAJ41pp+S9GsFml73+MWLMcJ180pXbACfbsCu
BnR1WlsuQDqECEkw/pHxZ9A=
=smtt
-----END PGP SIGNATURE-----


