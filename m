Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hc4pn-0007wN-QC
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 21:19:55 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3CJJoLr021355 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2007 21:19:50 +0200
Message-ID: <461E8652.4060203@dominion.kabel.utwente.nl>
Date: Thu, 12 Apr 2007 21:19:46 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200704122035.03980.openembedded@hrw.one.pl>
In-Reply-To: <200704122035.03980.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Thu, 12 Apr 2007 19:19:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:

> What this version gives:
> 
> - each feature gets own package,
> - task-boot contain ONLY stuff needed to boot
> - task-distro-base contain distro addons
> - task-machine-base contain machine specific addons
> - task-base depend on all needed task-* packages
> - ability to choose SSH daemon (dropbear, openssh, none) by distro
> - ability to choose /dev/ manager (udev, devfsd, mdev) by distro
> - ability to choose getty provider (tinylogin by default) by distro
> 
> With this version it is easier to create smaller rootfs - for example 
> image with ONLY bluetooth support is "task-boot + task-base-bluetooth".
> 
> Do some tests, post opinions - I think that this will be nice improvement 
> of task-base.

I think this would make things like moko-slug possible at image-level instead of distro level.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGHoZSMkyGM64RGpERAqARAJ0Xo0xWJG3F3J70kYOKPBBOky8QIwCfeCO9
4kqtpGWYED9Ict0YQd3wcoA=
=0WnC
-----END PGP SIGNATURE-----


