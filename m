Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OmOob-0004JW-4G
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 12:27:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 06CF84000556D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 12:26:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id E30954000BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 12:26:51 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRU-NpeRkvLl
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 12:26:51 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 9E59F4000556D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 12:26:51 +0200 (CEST)
Message-ID: <4C6E5867.1030703@gmx.net>
Date: Fri, 20 Aug 2010 12:26:47 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C624772.8000607@nedap.com>	<20100811072548.GB7282@mi.fu-berlin.de>	<20100819105518.GL11569@jama>	<20100819121301.GA21426@mi.fu-berlin.de>	<20100819122903.GM11569@jama>	<4C6E29B3.8050801@nedap.com>
	<20100820074410.GO11569@jama> <4C6E354A.9040906@nedap.com>
In-Reply-To: <4C6E354A.9040906@nedap.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 10:27:13 -0000
X-Groupsio-MsgNum: 22479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig0C62AA24E21E2683A16C5C2F"

--------------enig0C62AA24E21E2683A16C5C2F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Jaap,
no the fix is not necessary since stable does not have the
virtclass-native stuff.

Apart from that adding the jamvm-native 1.5.4 recipe to stable would be
a good idea.

Regards
Robert

Am 20.08.2010 09:56, schrieb Jaap de Jong:
> Thanks Martin,
>
> it is translating right now...
> do_configure for openjdk-6-jre-6b18-1.8-r10.6 passed, so this problem
> is solved!
>
> The same (minor changes) applies to the stable/2009 branch?
>
> Jaap
>
> On 08/20/2010 09:44 AM, Martin Jansa wrote:
>> On Fri, Aug 20, 2010 at 09:07:31AM +0200, Jaap de Jong wrote:
>>  =20
>>> Hi Martin,
>>>     =20
>> Hi Jaap,
>>
>>  =20
>>> I've read about your fix on this matter and did a complete new rebuil=
d
>>> last night, but it still does not translate here.
>>> Although the error is somewhere else.
>>>     =20
>> Yes, I know..
>>
>> try again with:
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Daa5fae1=
ad0f33ca478873ffd1a48fcaefff61b13
>>
>>
>> Regards,
>>
>>   =20
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig0C62AA24E21E2683A16C5C2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkxuWGoACgkQG9cfwmwwEtokwACgnnwwkIzbMVQrUQ3yyzLwPyJI
fEwAniq1UWjnTV2YSN5r551XMbmz4jKj
=23h4
-----END PGP SIGNATURE-----

--------------enig0C62AA24E21E2683A16C5C2F--
