Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GcIQB-0005Cg-3z
	for openembedded-devel@openembedded.org; Tue, 24 Oct 2006 11:18:07 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9O9AX8a016066 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2006 11:10:34 +0200
Message-ID: <453DD889.2040209@dominion.kabel.utwente.nl>
Date: Tue, 24 Oct 2006 11:10:33 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453DD6D1.8080407@dominion.kabel.utwente.nl>
In-Reply-To: <453DD6D1.8080407@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: unset MACHINE before building bintutils-cross
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
X-List-Received-Date: Tue, 24 Oct 2006 09:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> There's a subtle bug in OE/binutils which will pickup $MACHINE from your shell environment
> and mess up binutils. In my case binutils thought is was built for 'arm:hx4700' instead of
> 'arm', making glibc-intermediate fail during configure.
> A big thanks to Holger for pointing me in the right direction.

The above is a bit confusing, to trigger the bug you need to do:

export MACHINE=hx4700 ; bitbake glibc

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFPdiJMkyGM64RGpERAjiGAJ49af3agd5y0DQktyjVFufZqyXkXACeNvia
lDaDm4PMoSvyo9jxatrF4F4=
=wws3
-----END PGP SIGNATURE-----


