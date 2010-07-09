Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OXAtq-00067j-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:33:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 1A9474012B8A3;
	Fri,  9 Jul 2010 12:28:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 1173D40227393;
	Fri,  9 Jul 2010 12:28:48 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3VoMA8IwJZl; Fri,  9 Jul 2010 12:28:47 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id C9E714012B8A3;
	Fri,  9 Jul 2010 12:28:47 +0200 (CEST)
Message-ID: <4C36FA2E.6020507@gmx.net>
Date: Fri, 09 Jul 2010 12:30:06 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100528 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Thomas Haase <t.haase@tarent.de>
Subject: OpenJDK recipes merged
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
X-List-Received-Date: Fri, 09 Jul 2010 10:33:43 -0000
X-Groupsio-MsgNum: 20840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig38D84162919D82FA692E4FD5"

--------------enig38D84162919D82FA692E4FD5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Behold!

Henning merged all the OpenJDK-related recipes which means that from now
on it is not necessary anymore to use the Jalimo overlays for those. I
know that some people were nearly giving up on whether this happens
anytime but if you have a look at the actual files you'll see that an
OpenJDK-build is a complex beast and that is true although there is
already a fine harness called IcedTea around it, that takes a great
share of making the build process simpler.

I personally thank the cool guys at *BugLabs* who are sponsoring the
latest improvements! Everyone else: Go buy more Bugs. :-)

I will soon update the 'Java' page in our wiki and describe how the
build process works. It might also happen that I give a talk at this
year's frOScon (St. Augustin, Germany) about it. AFAIU Ken Gilmer of
BugLabs fame will do the same at this years JavaOne.

Caveats: While the recipes are fine and I think the packaging is of very
high quality, we are experiencing some instability issues with
jamvm-initial which can make it spontaneously crash and therefore let
the OpenJDK build fail. We're on it.

Btw: I was once told by Sun people that building the JDK on an ARM
device takes around 24hrs (!!). A build of the 'openjdk-6' recipe itself
(no dependencies) is around half an hour. Cool?

Enjoy!
Robert


--------------enig38D84162919D82FA692E4FD5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkw2+i4ACgkQG9cfwmwwEtpmEQCfTflFuNs3LN8RILA3U7Mmp1Dx
Zs0AnAypgrB7/KMImFXqfHqph197tmqs
=H9UZ
-----END PGP SIGNATURE-----

--------------enig38D84162919D82FA692E4FD5--
