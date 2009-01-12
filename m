Received: from [130.89.2.12] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LMTBZ-0007iV-LZ
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 21:14:57 +0100
Received: from [172.20.1.5] (vpn006129.vpn.utwente.nl [130.89.6.129])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id n0CK84Ib013491; 
	Mon, 12 Jan 2009 21:08:04 +0100
Message-Id: <9AB0D1BC-C8E5-49AF-9841-8563DC76CC9B@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: Tom Rini <trini@kernel.crashing.org>
In-Reply-To: <20090112200403.GB3342@smtp.west.cox.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Mon, 12 Jan 2009 21:08:01 +0100
References: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>
	<20090112200403.GB3342@smtp.west.cox.net>
X-Pgp-Agent: GPGMail d55 (v55, Leopard)
X-Mailer: Apple Mail (2.930.3)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel@openembedded.org
Subject: Re: OE weekly changelog 2009-01-05 to 2009-01-12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Mon, 12 Jan 2009 20:14:57 -0000
X-Groupsio-MsgNum: 7180
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-13-80611538"
Content-Transfer-Encoding: 7bit

--Apple-Mail-13-80611538
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 12 jan 2009, om 21:04 heeft Tom Rini het volgende geschreven:

> On Mon, Jan 12, 2009 at 11:02:34AM -0500, Cliff Brake wrote:
> [snip]
>> Koen Kooi (57):
> [snip]
>>      mtd-utils: add 1.2.0+git for ubifs-support
>>      mtd-utils: package *all* ubifs utils
>
> Anything in particular holding back on a -native version too?

Nothing apart from a bit of testing :)

> (and I
> haven't done a new pull yet, so forgive me if it's in already)  If  
> not,
> I'll go and push that in shortly, along with mkfs.ubi (unless that got
> merged in, it was stand alone when I delt with it all).  Thanks!


koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -c ipk/armv7a/ 
mtd-utils_1.2.0+git-r1.1_armv7a.ipk  | grep mkfs
-rwxr-xr-x root/root     51092 2009-01-11 16:26 ./usr/bin/mkfs.ubifs
koen@dominion:/OE/angstrom-dev/deploy/glibc$

As you might notice, mkfs.jffs* is missing, which shows why testing is  
important before committing ;)

regards,

Koen


--Apple-Mail-13-80611538
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: Dit deel van het bericht is digitaal ondertekend
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJa6MkMkyGM64RGpERAj6BAKCEW1colq6Sdoev+48Qn9ljCSRKZgCgmEWc
Ga60xfL/C6j+VnpjjfCBthI=
=3eL7
-----END PGP SIGNATURE-----

--Apple-Mail-13-80611538--
