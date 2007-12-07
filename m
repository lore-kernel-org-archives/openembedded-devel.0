Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0d8M-0001Bt-KH
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 14:20:50 +0100
Received: from Powerbook-2.local (vpn006063.vpn.utwente.nl [130.89.6.63])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB7DGtiq001675 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2007 14:16:55 +0100
Message-ID: <475947C7.6040904@student.utwente.nl>
Date: Fri, 07 Dec 2007 14:16:55 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1J0bLW-00033w-Bc@linuxtogo.org>
In-Reply-To: <E1J0bLW-00033w-Bc@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev sanity.conf: bump bitbake to 1.8.9 for lockfile changes
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
X-List-Received-Date: Fri, 07 Dec 2007 13:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> sanity.conf: bump bitbake to 1.8.9 for lockfile changes

> -BB_MIN_VERSION = "1.8.8"
> +BB_MIN_VERSION = "1.8.9"

It turns out bitbake-1.8.9 doesn't have a tag in svn, and requires
people to use the stable bitbake-1.8 branch or trunk.
The bump was needed after merging fixes from poky, which I realised
require features not present in bitbake 1.8.8.
I'm not to keen on backing out the package_ipk fix, since it fixes a lot
of problems.

So, how do we proceed from here?

regards,

koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWUfHMkyGM64RGpERAouzAKCicOOd6zEPZADOSy+9egfT4U8zhQCghH4O
9tJdg9p2sZY2yqcCWOBVwq8=
=Jzty
-----END PGP SIGNATURE-----


