Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JROrT-0006bM-UL
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 10:34:11 +0100
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id D036A5FF86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 10:33:15 +0100 (CET)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 2018B5FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 10:33:14 +0100 (CET)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 0422D5FF86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 10:33:14 +0100 (CET)
Received: from [192.168.95.68] (unknown [192.168.95.68])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 9B42223E46
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 10:33:13 +0100 (CET)
Message-ID: <47BAA259.8010306@bolloretelecom.eu>
Date: Tue, 19 Feb 2008 10:33:13 +0100
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47BA9022.6020105@bolloretelecom.eu>
	<1203412568.21824.10.camel@dax.rpnet.com>
In-Reply-To: <1203412568.21824.10.camel@dax.rpnet.com>
X-Enigmail-Version: 0.94.2.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: conf/kernel.bbclass: staging for linux >= 2.6.24 on	x86 needs fixing
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
X-List-Received-Date: Tue, 19 Feb 2008 09:34:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> That solution looks fine to me. As mentioned on irc we also need to dea=
l
> with ARCH =3D x86_64 and rather than a big complex if clause I think it=
s
> simply easiest to use x86 as a fallback so:
>
> elif [ -e arch/x86/Makefile ]; then
>
> shouldn't cause any problems.
>
> Maybe just add a comment about this being to catch the ARCH =3D i386 an=
d
> x86_64 cases so we remember why we did this in a years time :).
>
OK, commited with the appropriate comment.

- --
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHuqJYCL1n3lVB9EYRAnM3AJ9XKfRmshzGcve6DFF5F9XgT6orWQCZAZtT
681tDeYXGOG6G+mtb9WcJ8I=3D
=3DPcK2
-----END PGP SIGNATURE-----


