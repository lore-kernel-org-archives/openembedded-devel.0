Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GuXnn-0008UL-Fx
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 18:21:55 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBDHKCLr027689 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2006 18:20:13 +0100
Message-ID: <4580364A.9020809@dominion.kabel.utwente.nl>
Date: Wed, 13 Dec 2006 18:20:10 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1Gu4iF-0003Rn-TF@linuxtogo.org>	<747437870.20061212201700@vanille-media.de>
	<457F0505.9010201@dominion.kabel.utwente.nl>
In-Reply-To: <457F0505.9010201@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev libx11: don't use oe_runmake to build makekeys since that fails for cross-endian builds
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
X-List-Received-Date: Wed, 13 Dec 2006 17:21:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Michael 'Mickey' Lauer schreef:
>> koen commit wrote:
>>> libx11: don't use oe_runmake to build makekeys since that fails for cross-endian builds
>> This change breaks building libX11 for me. TARGET=armv4
> 
> There is indeed a small thinko in that patch, since the Makefile looks for makekeys.o.
> I'll have to think about a proper fix, if someone doesn't beat me to it.

I reverted it in the meantime.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFgDZKMkyGM64RGpERAjbZAJ4/hflpOfCGkU0lHRYVdUuG56D2kwCcDqpN
0Ea5QFPcWEQ9g3wLW6w5KNM=
=CFXf
-----END PGP SIGNATURE-----


