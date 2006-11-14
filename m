Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gjy2P-0003Xm-T8
	for openembedded-devel@openembedded.org; Tue, 14 Nov 2006 14:09:17 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAED77Lr028829 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Nov 2006 14:07:08 +0100
Message-ID: <4559BF79.1010806@dominion.kabel.utwente.nl>
Date: Tue, 14 Nov 2006 14:07:05 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>	<45586AF5.8060800@kernelconcepts.de>	<45589A63.9030808@kernelconcepts.de>	<200611131725.11432.openembedded@hrw.one.pl>	<4558B5D3.2090609@kernelconcepts.de>	<4558DA84.5030003@dominion.kabel.utwente.nl>
	<4559BC71.6050506@kernelconcepts.de>
In-Reply-To: <4559BC71.6050506@kernelconcepts.de>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: ARM EABI SDK build
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
X-List-Received-Date: Tue, 14 Nov 2006 13:09:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nils Faerber schreef:
> Koen Kooi schrieb:
>> Nils Faerber schreef:
>>>> OK, that was indeed fixed.
>>>> But I still have the problem that gcc-cross-sdk-4.1.1 fails to compile
>>>> due to problems with sys/types.h
>>>> This is really strange since this originates from glibc.
>>>> Koen: Didn't you build an EABI-softfloat toolchain already?
>> Riku did:
>> http://dominion.kabel.utwente.nl/koen/cms/using-openembedded-toolchains-in-scratchbox
> 
> Hmm... the hpowto does not help much since it does not mention which
> distribution he used or how his local.conf looked like...

Most likely his local.conf was:

BBFILES = "/somepath/*/*.bb"

DISTRO="angstrom-2007.1"
MACHINE="qemu-arm"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFWb95MkyGM64RGpERAkzxAKCAAUgKyrEuCPpy/7yznU/RObSvaACdF+yO
Vmksz/DMQqrfttOCZDWvzRw=
=+B7s
-----END PGP SIGNATURE-----


