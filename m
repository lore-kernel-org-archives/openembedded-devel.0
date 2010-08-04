Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OggWR-00082d-DM
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:08:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 66E19400E111F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:08:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 5EEF5402C1E7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:08:36 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIyfbUVcZZUm
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:08:36 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 36F7D400E111F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:08:36 +0200 (CEST)
Message-ID: <4C5990C1.8050302@gmx.net>
Date: Wed, 04 Aug 2010 18:09:37 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
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
Subject: MULTIMACHINE builds and PACKAGE_ARCH=all recipes
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
X-List-Received-Date: Wed, 04 Aug 2010 16:08:59 -0000
X-Groupsio-MsgNum: 21849
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDA4FE7F253DC0210FE477E1B"

--------------enigDA4FE7F253DC0210FE477E1B
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I am in the process of updating the java recipes to use
BBCLASSEXTEND=3D"native" and fixing the do_stage use. However now I hit a=

problem because of a workaround which was added months ago to install
Java libraries (jars) into one common directory in a multimachine build.
This workaround was *additionally* specifically added to the angstrom
2008 distribution.

The problem that people wanted to solve was that in a multimachine build
the installation of a PACKAGE_ARCH=3D"all" recipe was only being done onc=
e
and so from the 2nd machine onwards the build process was unable to
access the jars.

For me I always wondered how it is for python, C# or perl
programs/libraries which we provide and why there is no problem with
them. As it looks they go the simple way and simply do not appear to
have set PACKAGE_ARCH=3D"all".

So for now I see 2 solutions for the Java recipes:
1) Java packages do not appear as arch-independent anymore.
2) Bitbake (or OE) should be taught to install an arch dependent package
into all sysroots of a multimachine build.

The former is quickly done because most recipes use java-library.bbclass
but I find this technically wrong somehow (it also slows down everyone's
multimachine builds considerably).

I don't know how difficult or feasible it is to implement the 2nd option
(Bitbake gods anyone?) or whether there might even be a third option.

I only know that the shit has hit the fan ... :-/

Regards
Robert


--------------enigDA4FE7F253DC0210FE477E1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkxZkMUACgkQG9cfwmwwEtr2aACgjZDOjwhse3l/RlZHoUtjVsDB
1jMAniCl9RGw/iyttW0F7PPGl26t7UZ1
=BYDl
-----END PGP SIGNATURE-----

--------------enigDA4FE7F253DC0210FE477E1B--
