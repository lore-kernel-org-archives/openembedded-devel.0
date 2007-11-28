Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IxNFE-0002kV-2i
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 14:46:28 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lASDhRiq022897 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 14:43:27 +0100
Message-ID: <474D707E.2000504@student.utwente.nl>
Date: Wed, 28 Nov 2007 14:43:26 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <474D5541.2020107@xora.org.uk>
In-Reply-To: <474D5541.2020107@xora.org.uk>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Fix uImage generation in way compatible with	kernel.bbclass
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
X-List-Received-Date: Wed, 28 Nov 2007 13:46:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> I would like to do the attached patch to linux.inc to change uImage
> generation so it is compatible with the way kernel.bbclass does things.
> 
> This means the uImage ends up in kernel-image not some random file
> called uImage but not really a uImage.
> 
> koen said the do_install_prepend stuff was to work around vendor bugs
> and is no longer needed in this file.

Looks good, except for these bits of collateral damage:

- -        if test -e arch/${ARCH}/boot/images/uImage ; then
- -             ln -f arch/${ARCH}/boot/images/uImage
arch/${ARCH}/boot/uImage

The above is needed for various powerpc/ppc boards, and the below is
needed for at least blackfin:

- -        if test -e arch/${ARCH}/kernel/vmlinux.lds ; then
- -             ln -f arch/${ARCH}/kernel/vmlinux.lds
arch/${ARCH}/boot/vmlinux

The linux kernel doesn't seem to have a strict policy on image placement
and various vendor patches aren't exactly helping the situation :/

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHTXB+MkyGM64RGpERAnEUAJ9pzhdplIFn1idz+r9u4m7VbT93YgCgjDpk
VX+OKjBT3o1A03PyurqBI+g=
=nfJA
-----END PGP SIGNATURE-----


