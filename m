Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IXwlQ-00023j-A9
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 12:26:36 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8JAMexW026337 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2007 12:22:40 +0200
Message-ID: <46F0F884.2040805@student.utwente.nl>
Date: Wed, 19 Sep 2007 12:23:00 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
	<46F01DC6.6000503@student.utwente.nl>
	<1190151259.46f0445be87d7@imp.free.fr>
	<1190192138.46f0e40ab7964@imp.free.fr>
In-Reply-To: <1190192138.46f0e40ab7964@imp.free.fr>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: fortran and octave
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
X-List-Received-Date: Wed, 19 Sep 2007 10:26:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alain2210 schreef:
> Hello,
> 
>> So gcc-cross_4.2.1 with this patch
>> http://gcc.gnu.org/ml/gcc-patches/2007-05/msg01010.html
>> is compiling.... (but I get a probleme in staging).
> 
> With this patch and FORTRAN = ",fortran" in gcc_4.1.2.bb,
> Building of gcc-cross__4.1.2.bb works and gfortran is working.

Thanks for testing it! I made 2 commits that enable building and packaging for (lib)gfortran.

> Now, I'm building octave.

you need to have my second commit to get octave working on the device, because it wasn't
getting packaged.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG8PiEMkyGM64RGpERAobpAJ4n5Qw7as8OXEQvxgOJ+CiFtAa+3QCcD2/O
2naKPgHeoIrx9HJE6uKcmLM=
=gSGl
-----END PGP SIGNATURE-----


