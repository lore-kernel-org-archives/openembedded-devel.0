Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1INcdw-00036v-80; Wed, 22 Aug 2007 00:56:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7LMt41R029328; Wed, 22 Aug 2007 00:55:04 +0200
Message-ID: <46CB6D5B.40501@dominion.kabel.utwente.nl>
Date: Wed, 22 Aug 2007 00:55:23 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1INbyh-0006rm-0y@linuxtogo.org>
In-Reply-To: <E1INbyh-0006rm-0y@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev compulab-pxa270.conf: fix serial console setup for 2.6.22 kernel,
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
X-List-Received-Date: Tue, 21 Aug 2007 22:56:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cbrake commit schreef:

> conf/machine/compulab-pxa270.conf

> +# the following is require for building tiny images that can fit in NOR flash.
> +# recommend using uclibc, Angstrom, and angstrom-minimal-image bitbake target
> +# note, if these are define in your local.conf, they will be overwritten
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= "mtd-utils ipkg"

I have a real hard time believing that a device needs ipkg[1] and mtd-utils to boot. This
does not belong in task-base, but in your local.conf or image recipe. Please remove it
from the machine file.

regards,

Koen

[1] especially considering angstrom will ditch ipkg and use dpkg in the near future
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGy21bMkyGM64RGpERAptkAJ9yQTM3Cl1XPjBG3BSjKnEFo3x8MgCfWGaL
8QrfzERc5s5NxrSYvT8fQF4=
=sy3r
-----END PGP SIGNATURE-----


