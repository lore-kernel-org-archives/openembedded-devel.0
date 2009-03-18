Received: from [213.36.80.91] (helo=mail.libertysurf.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LjwxW-0004WI-FI
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 15:41:33 +0100
Received: from blini.bolloretelecom.eu (62.210.194.121) by mail.libertysurf.fr
	(8.5.016.1)
	id 498AE76200D5464B for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 16:30:39 +0100
Received: from [192.168.95.60] (unknown [192.168.95.60])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id B150323E44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 15:40:35 +0100 (CET)
Message-ID: <49C107E3.30505@bolloretelecom.eu>
Date: Wed, 18 Mar 2009 15:40:35 +0100
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49BFA406.6030802@bolloretelecom.eu>	<20090317143526.3e79150c@vanille.zapto.org>	<49BFADB1.3090207@bolloretelecom.eu>
	<20090317171705.208a7d31@kmfms>
In-Reply-To: <20090317171705.208a7d31@kmfms>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 213.36.80.91
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Wed, 18 Mar 2009 14:41:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Jim,

> Now if I "inherit qt4e" they fail with something like this:
>
> | NOTE: using qmake spec in
> /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux-=
gnueabi-oe-g++,
>  using profiles '' | NOTE: qmake prevar substitution:
> QT_LIBINFIX=3DE | Failure to read QMAKESPEC conf file
> /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux-=
gnueabi-oe-g++/qmake.conf.
>  | Error processing project file: flickcharm.pro | FATAL: Error
> calling
> /home/jim/Projects/gumstix/oe/tmp/staging/i686-linux/usr/bin/qmake2
>  on flickcharm.pro
>
> Is tmp/cross/armv7a/share/qt4/mkspecs/linux-gnueabi-oe-g++ the
> correct path?  I have a
> tmp/cross/i686/share/qt4/mkspecs/linux-gnueabi-oe-g++ area, but not
> tmp/cross/armv7a/share/qt4/mkspecs/linux-gnueabi-oe-g++.
>
> I'm assuming I just need to do something more than just "inherit
> qt4e" in my recipe?  Perhaps I'm seeing a bug specific to the
> gumstix branch?

To my knowledge qmake support has been busted for a while (I also have
your problem if I try to build a qmake-based package), I'm suprised
this hasn't cropped up earlier.

I'll try to look into it, but I don't quite understand the way
"qmake2-native" is packaged (why is it a "cross" package?), and where
the "mkspecs" directories end up.

If someone can help shed some light on this, I'm all ears!

- --
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknBB+IACgkQCL1n3lVB9Ea2AQCgvutQjRjjeriH5++gUWi/1whr
3FQAn0Vn2CQEhW9ZESouNaxglZucqsOQ
=3DPAED
-----END PGP SIGNATURE-----



