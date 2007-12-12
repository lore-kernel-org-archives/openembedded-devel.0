Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J2O4K-0000Gb-0C
	for openembedded-devel@openembedded.org; Wed, 12 Dec 2007 10:39:56 +0100
Received: from Powerbook-2.local (vpn006150.vpn.utwente.nl [130.89.6.150])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBC9ZU0k029830; Wed, 12 Dec 2007 10:35:31 +0100
Message-ID: <475FAB62.3090702@student.utwente.nl>
Date: Wed, 12 Dec 2007 10:35:30 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <1617210780.20071212000416@gmail.com>
	<31294197.20071212092006@vanille-media.de>
In-Reply-To: <31294197.20071212092006@vanille-media.de>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] Using ${PR} instead of ${DATETIME} in deployed kernel image filename
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
X-List-Received-Date: Wed, 12 Dec 2007 09:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> Paul Sokolovsky wrote:
>> Hello openembedded-devel,
> 
>>   I already mentioned this in
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/003695.html , here's specific RFC:
>> I'd like to propose using the following filename pattern for deployed
>> kernel images: "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}", instead
>> of "${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}". This will
>> ensure that kernels built from the same recipe are named consistently,
>> and thus will allow users and developers track kernels easier. Also,
>> any change to build configuration should be accompanied by recipe PR
>> bump, so new kernel file will be produces.
> 
> +1. Good thing is it forces you to update PR, bad thing is it forces
> you to update PR, especially when you are trying out multiple
> defconfigs. But I guess in that case you probably use devshell or an
> out-of-OE-tree kernel.
> 
>>   So:
> 
>> 1. Does anybody see something grossly wrong with this scheme?
>> 2. Otherwise, I'm going to change this for linux-handhelds-2.6, and
>> would like to encourage maintainers of the other kernel recipes to do
>> the same.
> 
> Isn't it already deployed in linux.inc? I remember I had to catch up
> linux-openmoko.inc because of that change.

It is. Remaining 'offenders' are linux-hh and linux-rp, and maybe some
other kernel recipes I never look at.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHX6tiMkyGM64RGpERAt+SAJ9hLMyja973cmVH9ODATkw59ozCxACeIDHm
e9Nqvwk9Yakn3SWfghFc7f0=
=MKeG
-----END PGP SIGNATURE-----


