Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1I7BjC-0000e2-Iu
	for openembedded-devel@openembedded.org; Sat, 07 Jul 2007 16:57:42 +0200
Received: from vpn006144.vpn.utwente.nl (vpn006144.vpn.utwente.nl
	[130.89.6.144])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l67EqEj1015944 for <openembedded-devel@lists.openembedded.org>;
	Sat, 7 Jul 2007 16:52:14 +0200
Message-ID: <468FA89D.8060701@dominion.kabel.utwente.nl>
Date: Sat, 07 Jul 2007 15:52:13 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1I75mQ-0005Wr-Px@linuxtogo.org>
	<142948947.20070707122533@vanille-media.de>
In-Reply-To: <142948947.20070707122533@vanille-media.de>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
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
X-List-Received-Date: Sat, 07 Jul 2007 14:57:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Michael Lauer schreef:
> koen commit wrote:
>> disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
> 
> May I request that from now on _every_ disapproval goes hand in hand with a
> lengthy explanation on oe-devel?

Yes, sorry about that, I wanted to act quickly before people with glibc builds get the
change, build libiconv and require a build from scratch.

The bottom line:

*NEVER* DEPEND on libiconv directly, but on virtual/libiconv, otherwise you break all
glibc based builds out there

The situation is tricky since uclibc (and maybe newlib) need libiconv, but our glibc build
can use the internal iconv from libc6.so. That's why we have virtual/libiconv which does
the right thing automagically.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGj6hgMkyGM64RGpERAhQSAJ9BRu5yEB5IB3aS6s2p/u5IsErOSQCeOL3e
QazmT2c2fB9En+b0UZkhF4o=
=qFg1
-----END PGP SIGNATURE-----


