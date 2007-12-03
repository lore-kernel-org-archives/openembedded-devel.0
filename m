Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iz78n-00044p-Qk
	for openembedded-devel@openembedded.org; Mon, 03 Dec 2007 09:59:01 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB38tOnk031055; Mon, 3 Dec 2007 09:55:34 +0100
Message-ID: <4753C47B.2040903@student.utwente.nl>
Date: Mon, 03 Dec 2007 09:55:23 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <1196641802.6648.31.camel@localhost.localdomain>
In-Reply-To: <1196641802.6648.31.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Angstrom-devel] Angstrom builds with prebuilt meta-toolchain output
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
X-List-Received-Date: Mon, 03 Dec 2007 08:59:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> Hi,
> 
> This is something I experimented a bit with and wondered if anyone else
> was interested in it. I just added external-toolchain.bb to OE which
> allows a meta-toolchain generated toolchain to be used by OE instead of
> building its own.
> 
> The attached patch adds the notion of different toolchains to angstrom,
> by default it uses the one specified by the DISTRO_VERSION_MAJOR
> variable I added but with ANGSTROM_TOOLCHAIN = "external" use a
> pre-supplied toolchain.

It has been my plan to move the toolchain configs to a seperate file for
easier reuse, just haven't had time to RFC it yet :)

regards,

Koen


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHU8R7MkyGM64RGpERApfqAJ4vW2ZjYa9NLKx39hIkGuBIkUgQPwCdF74U
IrSHyqZ1DAR5ni63r08gwQU=
=9M/p
-----END PGP SIGNATURE-----


