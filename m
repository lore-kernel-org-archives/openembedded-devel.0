Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJqnM-0004eU-2y
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 15:14:23 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7BDBM1R032293 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2007 15:11:23 +0200
Message-ID: <46BDB574.40009@dominion.kabel.utwente.nl>
Date: Sat, 11 Aug 2007 15:11:16 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1186835653.5859.27.camel@localhost.localdomain>
In-Reply-To: <1186835653.5859.27.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: SRC_URI_OVERIDES_PACKAGE_ARCH
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
X-List-Received-Date: Sat, 11 Aug 2007 13:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

> The problem is that translating SRC_URI to localpaths is computationally
> expensive. In the SRCREV case, it involves hitting the network which is
> very slow. If we use the localpath calls at all, we hit the database
> which will slow down parsing.
> 
> We have several options:
>  * restore the old behaviour, accept the parsing slowdown

If people want to know how much the slowdown is, add:

SRC_URI_OVERIDES_PACKAGE_ARCH = "1"

to your local.conf. On a dual opteron with U320 scsi disks it becomes unbearably slow.

I think checking only file:// paths is the best intermediate solution.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvbV0MkyGM64RGpERAr3VAJ94xJwqdaWcUE81/2GNFgaxnHh+YQCfS109
kfMBSlqKAVtv4lk2S1SU86U=
=mnp2
-----END PGP SIGNATURE-----


