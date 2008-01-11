Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JDPRI-0008GS-2N
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 20:21:12 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0BJKqfr001189 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 20:20:53 +0100
Message-ID: <4787C194.4060907@student.utwente.nl>
Date: Fri, 11 Jan 2008 20:20:52 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47871C71.5020800@student.utwente.nl>	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>	<fm86uh$qa8$1@ger.gmane.org>
	<fm8dm0$ikl$1@ger.gmane.org>
In-Reply-To: <fm8dm0$ikl$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 19:21:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[I can't type, so resending]

Rolf Leggewie schreef:
| It seems this solution is not yet perfect.  All of the sudden, bitbake
| cooks up an armv5te version of libogg for the collie.  My suspicion is
| that this has to do with PACKAGE_EXTRA_ARCHS.
|
| What does PACKAGE_EXTRA_ARCHS do?

It telss ipkg(-collateral) which architectures the device can use (IOW:
what to put in /etc/ipkg/arch.conf).

| If set to "armv4 armv4t armv5e
| armv5te", can that provide problems for a device like the collie which
| is arm-only, not armv5te?

Yes, since it will allow users (and do_rootfs) to install binaries that
won't work.

|  How about the poodle?

poodle is armv5te (pxa25x xscale), collie is armv4 (sa1100 strongarm)

| Is that device and all
| other Zaurus safe with "armv4 armv4t armv5e armv5te"?
|
| If my suspicion is true, my suggestion for Zaurus-2.6.inc is

It isn't, the culprit is:

zaurus-2.6.inc:include conf/machine/include/tune-xscale.inc

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHh8GUMkyGM64RGpERAl3CAJsG3qi/IKbGdoqWGYpWmyD4uteKfQCeJ7b6
S80GSWd6Ls+nKfDfODxzQiM=
=kt3d
-----END PGP SIGNATURE-----


