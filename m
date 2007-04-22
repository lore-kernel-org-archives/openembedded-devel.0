Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hfj0l-0007f0-5e
	for openembedded-devel@openembedded.org; Sun, 22 Apr 2007 22:50:20 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3MKVgox015754 for <openembedded-devel@openembedded.org>;
	Sun, 22 Apr 2007 22:31:42 +0200
Message-ID: <462BC62F.6030907@dominion.kabel.utwente.nl>
Date: Sun, 22 Apr 2007 22:31:43 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070422202157.BEBB9401B37@tinman.treke.net>
In-Reply-To: <20070422202157.BEBB9401B37@tinman.treke.net>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-issues] [Bug 2123] Fixed QA issues for opie-image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2007 20:50:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

bugzilla-daemon@tinman.treke.net schreef:

> ------- Comment #4 from pmiscml@gmail.com  2007-04-22 13:21 -------
> Nice try ;-). The real issue though is that no .bb should ever override
> PACKAGES variable, only append (prepend). Default PACKAGES and FILES settings
> are set in *.bbclass. 

That's not quite true for e.g metapackages since ALLOW_EMPTY will start to generate bogus
packages.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGK8YvMkyGM64RGpERAggKAJ4luMJflKRBy4I2e8SEHOq63kFhEwCfZQhK
otkxNbbV0DHNlPuGh2IpoHA=
=AzZu
-----END PGP SIGNATURE-----


