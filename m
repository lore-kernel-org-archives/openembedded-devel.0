Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LjaRd-0000rr-9a
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 15:39:08 +0100
Received: (qmail 1960 invoked by uid 813007); 17 Mar 2009 14:38:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Mar 2009 14:38:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@openembedded.org
Date: Tue, 17 Mar 2009 15:38:17 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200903171538.21499.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 14:39:08 -0000
X-Groupsio-MsgNum: 8484
Content-Type: multipart/signed; boundary="nextPart1269039.yTyMMyMc6y";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1269039.yTyMMyMc6y
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Hi

I know that there were lot of talks about creating stable branch of=20
OpenEmbedded in last months. But we need stable branch for vendors which=20
use our product.

As some people know I am working for Bug Labs company. Their product=20
named 'BUG Linux' is based on Poky 'pinky' (last stable release). We=20
were considering switch to newer (but never released) version named=20
'elroy' but recently we decided to switch to OpenEmbedded.=20

But to what kind of OE? Development branch change every day and things=20
break from time to time, packages get version bumps without notifying=20
anyone etc. Other possibility would be switch to stable branch but=20
current one is deprecated and not maintained anymore.

So the situation looks like we will need new stable branch with few=20
maintainers (I will be one of them) and with proper policies for merging=20
updates from development tree of OE. I maintained OE branches used for=20
OpenZaurus/Familiar few years ago so can say that I have needed=20
experience for it.

Which things needs defining? I have few in mind:

1. Adding new things. This should be possible only by backporting from
   OE.dev tree and needs to be Acked by at least 2-3 developers which
   use stable branch. New code has to build for at least one distro and
   ARM+x86 architectures (unless it is related to one arch or even one=20
   machine).

2. Marking recipes as buildable or not. With over 6000 of them it is
   really hard to check everything for status. We can remove many old
   versions but sometimes they are useful for some projects. I would  =20
   rather add things like BUILDABLE_armv4t =3D "1" into recipe or into
   conf/distro/include/${DISTRO}-status.inc file. Similar status for
   recipes which are known to not work for some archs.

3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete'=20
   dirs in metadata - both should be dropped in stable branch. Other
   recipes can be marked as not buildable or dropped from branch - I did
   not thought yet on it.

4. Lifetime of branch. Will we do new stable release after 6 months or
   after one year? For how long stable branch will be supported by OE
   itself? I know that there will be companies which will provide
   support for longer time - thats what I do with Poky 'pinky' now.

What do you feel about it? Any opinions or suggestions? Want to join=20
effort?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1269039.yTyMMyMc6y
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm/tdoACgkQeQ6MlGH/2quDLgCeLFq4kXjAB5nxZWHGjTuTbpkT
lAUAn3GGhjHcokGJ1yIq6GYTT51gx5Dw
=R8lN
-----END PGP SIGNATURE-----

--nextPart1269039.yTyMMyMc6y--
