Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ivalx-0005bv-2Y
	for openembedded-devel@openembedded.org; Fri, 23 Nov 2007 16:48:53 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lANFkMiq020174 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 16:46:22 +0100
Message-ID: <4746F5CE.3010209@student.utwente.nl>
Date: Fri, 23 Nov 2007 16:46:22 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4746E045.2070805@gmx.net>
In-Reply-To: <4746E045.2070805@gmx.net>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: bbclass providing some level of scratchbox compatibility
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
X-List-Received-Date: Fri, 23 Nov 2007 15:48:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Schuster schreef:
> Hi,
> I am using OE to build binaries that can be run from within Maemo
> scratchbox.
> 
> The binaries I create are for the native architecture (the one of the
> host CPU) not the emulated one. Such binaries need a special rpath. What
> the bbclass does is simply putting that special rpath in LD_RUN_PATH
> before configuring and compiling. This has the effect that all built
> binaries have it in.

Looks nice, but shouldn't we put the generated binaries (e.g. packages,
tarballs) in a special dir in deploy so there's no risk of confusing the
m with non-rpathed ones?

> Together with a halfway compatible toolchain (CS gcc3.4.4, glibc2.3.x)
> that allows me to run those binaries in Maemo's scratchbox.
> 
> I am using this for Jalimo[0] and would like to push it upstream. I am
> open for suggestions.
> 
> File a bug?

Always :)


regards,

Koen

> Regards
> Robert
> 
> [0] - http://jalimo.org/wiki/doku.php?id=doc:howto:cacaoandecjinscratchbox
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHRvXOMkyGM64RGpERArK+AJ4vMC4CiawyuEUvl4B4nS8JZ3vPIgCdFNYv
dfREBlDgZTf/iek33/8MiOA=
=XxR9
-----END PGP SIGNATURE-----


