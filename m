Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1KGw6S-0000dJ-5x
	for openembedded-devel@openembedded.org; Thu, 10 Jul 2008 15:22:32 +0200
Received: from [172.20.1.5] (vpn006026.vpn.utwente.nl [130.89.6.26])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m6ADLdaJ027936; Thu, 10 Jul 2008 15:21:40 +0200
Message-Id: <ADA6E487-BD92-49C0-B12D-BF87B5568BE2@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <48760C72.8090608@gmx.net>
Mime-Version: 1.0 (Apple Message framework v926)
Date: Thu, 10 Jul 2008 15:21:37 +0200
References: <20080706092603.9E5F3189303@amethyst.openembedded.net>
	<48760C72.8090608@gmx.net>
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.926)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] org.oe.dev glibc 2.6.1: change optimizations flags for	armv7a
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jul 2008 13:22:32 -0000
X-Groupsio-MsgNum: 5481
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-3--981787260"
Content-Transfer-Encoding: 7bit

--Apple-Mail-3--981787260
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 10 jul 2008, om 15:19 heeft Robert Schuster het volgende geschreven:

> koen commit schrieb:
>> glibc 2.6.1: change optimizations flags for armv7a
>> * If the rebuild fails in do_configure, build glibc-initial to get  
>> limits.h in a place where glibc can find it. Builds from scratch  
>> works great, though
>
> Just for the records
>
> If you see this error:
>
> checking how to run the C preprocessor... arm-angstrom-linux-gnueabi- 
> gcc -E
> configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E"
> fails sanity check
> See `config.log' for more details.
> FATAL: oe_runconf failed
>
> you need to run:
>
> bitbake -f -c fetch gcc-cross-initial && bitbake gcc-cross-initial
>
> and then glibc intermediate to fix this.
>
> In short rebuild gcc-cross-initial not glibc-initial. :)

right, but bitbake -b glibc-initial_2.6.1.bb takes less time :)

regards,

Koen

>
>
> Regards
> Robert
>


--Apple-Mail-3--981787260
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFIdgzjMkyGM64RGpERAjcpAKCTnm8/5kGYgRIZiEzcK1egpOf7YgCggBD0
n8CQk4/HtCWIB8miP22FE4o=
=zN9e
-----END PGP SIGNATURE-----

--Apple-Mail-3--981787260--
