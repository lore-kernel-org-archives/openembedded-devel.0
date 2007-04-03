Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYg2B-0002b5-Cz
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 12:14:39 +0200
Received: from [130.89.138.60] (wlan138060.mobiel.utwente.nl [130.89.138.60])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l33AEWox003437 for <openembedded-devel@openembedded.org>;
	Tue, 3 Apr 2007 12:14:32 +0200
Message-ID: <46122905.2010703@dominion.kabel.utwente.nl>
Date: Tue, 03 Apr 2007 12:14:29 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>	<460F5F87.3060403@dominion.kabel.utwente.nl>	<4610C6E6.30102@kernelconcepts.de>
	<583221585.20070403130033@gmail.com>
In-Reply-To: <583221585.20070403130033@gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
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
X-List-Received-Date: Tue, 03 Apr 2007 10:14:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:

>>> That is against our versioning policy, this way you can't upgrade to 0.7.4 when it gets
>>> released[1]. Use _0.7.3+0.7.4pre1 instead.
> 
>> I remember we had these kind of trouble with ipkg before.
> 
>   Why we and why ipkg? Any packaging system which tries to do its work
> well hits into such issues. In this regard, OE follows Debian's way to
> handle this. (Even though I was unable to find exact best
> practices to resolve such cases, they only mumble that it should be
> done: http://www.debian.org/doc/debian-policy/ch-binary.html#s-versions ;
> anyway, + notation is what actually being used).
> 
>   I'm not sure how other packaging systems solve this, for example,
> look at FC6 RPM pile shows that they have *pre* stuff without clearly
> distinguishable pattern of handling it syntactically. But it's known
> where that leads to - to inability to upgrade to a new distro release.
> 
>> Wouldn't it be better
>> to make it possible to handle this properly? I guess we will run into this again
>> and again in future.

It would be best if upstream (prismstumbler in this case) would use proper versioning to
start with, but if that is not possible we can paper over it in OE.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEikFMkyGM64RGpERAvcfAJsFp0Cez/LN84vKGUBAXnbEEAkcAACbB6Jr
MKjIaA7nMU6DhAUQ05UxilY=
=21uY
-----END PGP SIGNATURE-----


