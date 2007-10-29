Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1ImTn0-0005V4-F5
	for openembedded-devel@openembedded.org; Mon, 29 Oct 2007 13:32:18 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9TCORUo013761 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2007 13:24:27 +0100
Message-ID: <4725D0FB.1040204@student.utwente.nl>
Date: Mon, 29 Oct 2007 13:24:27 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHEEJIMKAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHEEJIMKAA.skoroneos@digital-opsis.com>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits]	org.oe.dev	conf/machine/include/tune-ppc405.inc :	Move	TARGET_FPU =	"soft" to the tune file so its
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
X-List-Received-Date: Mon, 29 Oct 2007 12:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stelios Koroneos schreef:
> Although this is getting OT :)
> 
> Buidling with hardfloat for a cpu that does not have an fpu means that
> 1) You need to have a kernel that supports fp emulation (and actually
> provides correct fp results)
> 2) Have it enabled by default in OE
> 3) Be prepared to pay the processing penalty as every fp instruction is
> going to generate an exeption that needs to be handled by the kernel.

Right, that's how we have done it in OE for the ARMs without FPU for the
past 4 years. On ARM it's a 10x-50x slowdown, but still very popular,
i.e. debian/arm is still using hardfloat. I'm not saying it makes sense,
I'm saying that this is how it has been done for the past 4 years :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHJdD7MkyGM64RGpERAiYEAJ9o15AwGFUlIekx/CrlnqVfwhkKFgCgoN4N
7anBacFs+gt5jg0dRLl0aKg=
=BOhh
-----END PGP SIGNATURE-----


