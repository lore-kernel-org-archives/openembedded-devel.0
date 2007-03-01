Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HMo3w-0005Ax-3b
	for openembedded-devel@openembedded.org; Thu, 01 Mar 2007 17:23:24 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l21GNKLr027075 for <openembedded-devel@openembedded.org>;
	Thu, 1 Mar 2007 17:23:20 +0100
Message-ID: <45E6FDF8.2040103@dominion.kabel.utwente.nl>
Date: Thu, 01 Mar 2007 17:23:20 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HMgkl-0004SM-Gs@linuxtogo.org>
	<1439152940.20070301165525@vanille-media.de>
In-Reply-To: <1439152940.20070301165525@vanille-media.de>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE policy:	remove feed management tools
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
X-List-Received-Date: Thu, 01 Mar 2007 16:23:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> koen commit wrote:
>> rootfs_ipk: as per OE policy: remove feed management tools
> 
> Guys, please don't play games. Since it is a handy feature indeed,
> can we perhaps agree on making this a seperate bbclass to keep both of
> you satisfied?

All feed management was removed a long time ago from OE because

a) it's out of scope
b) can't be done right in an automated fashion

And after discovering some bugs in ipkg-utils a while ago it seems you have to manually
munge the Packages file to get something that ipkg will handle correctly when upgrading stuff.

So whichever way you look at it it's going to add broken behaviour to OE. I don't want to
explain to users why their 'feeds' don't work because they disabled common sense because
'OE generated it'.

But but but but but... OE generates feeds now as well!! Right, deploy/ipk contains
subdirectories people could abuse as feeds if they want, but I wouldn't recommend it.

So *if* people *need* OE to generate feeds, there you have them. However, I strongly
oppose adding know broken behaviour to satisfy lazy people.

regards,

Koen

PS: find */ -name  "*.ipk" -exec mv  '{}'  ./ \;


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5v34MkyGM64RGpERAjI0AJ4tbIeCUQoeurXBhlJ8vdFmQ0AD0QCZAVSW
EUO+7SF5AFM4BwLZyTj89tc=
=xAzY
-----END PGP SIGNATURE-----


