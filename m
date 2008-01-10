Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JCuuW-0007oH-Ts
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 11:45:20 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0AAjA0k014099 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2008 11:45:11 +0100
Message-ID: <4785F736.5050707@student.utwente.nl>
Date: Thu, 10 Jan 2008 11:45:10 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: a5c7b007eaa675cc904f5285291d2f8a597efc84
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
X-List-Received-Date: Thu, 10 Jan 2008 10:45:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I just noticed a5c7b007eaa675cc904f5285291d2f8a597efc84 [1], which is a
bit bogus.

I've been building gcc 4.2.x for arm on my ubuntu gutsy machine for a
while now, and I can compile things like octave (which needs a fortran
compiler) and hope to be able to build R and grass soon (which also need
a fortran compiler). After this revision was committed bitbake halted to
a stop and informed me I needed to install gfortran. Hmmm.
I know for sure gfortran isn't need and I suspect the real issue is in
gmp-native or mpfr-native not being picked up correctly.
As a test I compiled gcc natively on my efika (without gfortran, but
with mpfr-dev and gmp-dev installed) and that works and now has a
working fortran compiler. I even compiled octave natively and it runs
quite well.

To sum it up:

~ * gfortran is NOT needed to build a gfortran cross-compiler, something
else is wrong.

regards,

Koen

[1]
http://lists.linuxtogo.org/pipermail/openembedded-commits/2008-January/011406.html

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHhfc2MkyGM64RGpERAgDYAJ0a0kN10TFp3SlCv08riQk2NXZRHACgsBOU
hYdqF4j+KTr5ZkDOP1dZI/A=
=KswC
-----END PGP SIGNATURE-----


