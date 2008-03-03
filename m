Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JW57r-0004uK-8S
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 08:30:21 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JW56j-00063C-Rd
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 07:29:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 03 Mar 2008 07:29:09 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 03 Mar 2008 07:29:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 03 Mar 2008 08:29:04 +0100
Message-ID: <fqg9c0$g00$1@ger.gmane.org>
References: <1204494435.17068.23.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1204494435.17068.23.camel@utx.utx.cz>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Mon, 03 Mar 2008 07:30:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav Brabec schreef:

| It should be the best possible optimization for PXA270 (compiled for
| iwmmxt, use soft float instead of exception based kernel driver, use -Os
| to make binaries as small as possible and add optimizations from -O3).

Angstrom already enables softfloat (for FPU-less systems) and -Os by
default *and* enables iwmmxt (if you have MACHINE_FEATURES = "iwmmxt")
for apps which have been proven to benefit from iwmmxt (e.g. mplayer).

I still get mysterious segfaults when running an all iwmmxt glibc system
(uclibc is even worse), so I don't think flipping the global switch is a
good idea.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHy6jAMkyGM64RGpERAsGmAKCQBrKr7a0LdUqRStpIDORkk+qS9wCgmmQv
ymohRaCAWpT3vX88U2/vSaI=
=83mT
-----END PGP SIGNATURE-----



