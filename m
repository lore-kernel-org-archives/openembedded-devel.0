Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JgaFA-0005G7-7g
	for openembedded-devel@openembedded.org; Tue, 01 Apr 2008 08:45:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JgaF4-0007aI-HV
	for openembedded-devel@openembedded.org; Tue, 01 Apr 2008 06:45:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 01 Apr 2008 06:45:10 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 01 Apr 2008 06:45:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 01 Apr 2008 08:44:53 +0200
Message-ID: <fssll5$uhe$1@ger.gmane.org>
References: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: [Review] Remove /xorg-lib/pixman_* in favor of /libpixman/libpixman_*
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
X-List-Received-Date: Tue, 01 Apr 2008 06:45:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello,
|
| (lib)pixman is present at two locations:
|
| /libpixman/libpixman_*
| /xorg-lib/pixman_*
|
| The latter has a false/redundant DEPENDS = "util-macros
| xorg-headers-native" as it includes xorg-lib/xorg-lib-common.inc.
|
| That these are redundant can be tested with the latest 0.9.6 recipes,
| present in both directories, which have been *identical* and present
| since 2007-11-10.
|
| * I propose to remove the xorg-lib/ ones, as pixman is independent of
| X. That's also the way I use it.
|
| * I would like to hear if anyone using X and /libpixman/libpixman
| 0.9.6 found any problems so far, as I don't use X on my targets (yet).

How about dropping the xorg-lib one and renaming libpixman to pixman?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH8dnlMkyGM64RGpERAigbAJ4541CA5X/zMvP1WOzYWJWIJaYzcACeKwgD
59VCHHpCF2mR/2Rrxs0QMGs=
=6hH/
-----END PGP SIGNATURE-----



