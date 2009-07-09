Received: from [140.211.166.183] (helo=smtp.gentoo.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vapier@gentoo.org>) id 1MOhNP-0007Br-2f
	for openembedded-devel@openembedded.org; Thu, 09 Jul 2009 02:20:39 +0200
Received: from vapier.localnet (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 36BC6667A3;
	Thu,  9 Jul 2009 00:07:56 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
Organization: wh0rd.org
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Jul 2009 20:08:00 -0400
User-Agent: KMail/1.11.4 (Linux/2.6.30; KDE/4.2.4; x86_64; ; )
References: <20090109155223.GF400@smtp.west.cox.net>
	<gk7tkl$p1o$1@ger.gmane.org>
In-Reply-To: <gk7tkl$p1o$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200907082008.01202.vapier@gentoo.org>
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Blackfin support
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
X-List-Received-Date: Thu, 09 Jul 2009 00:20:41 -0000
X-Groupsio-MsgNum: 11831
Content-Type: multipart/signed; boundary="nextPart3417920.xPz6z88ojW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3417920.xPz6z88ojW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 09 January 2009 11:22:43 Koen Kooi wrote:
> On 09-01-09 16:52, Tom Rini wrote:
> > Hey all.  Has anyone built any of the blackfin boards recently?  I'm
> > finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
> > gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
> > rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
> > anyone else has these things working before I start getting down and
> > dirty.

the FDPIC change is already in mainline gcc and has been for a while

> I keep starting anew with blackfin support due to the current problems:

let's fix this wrong info shall we ...

> * ADI uses their own 'distro', the rest of the world a custom buildroot

actually it's the uClinux distribution that has been around longer than=20
buildroot

> * You need to get gcc from blackfin SVN to get something to compile
> * you need to choose either uclibc from blackfin svn or upstream uclibc

things are pushed to the relevant upstream projects, but it's not our fault=
=20
development occurs faster on our side than upstream can make releases

either way, prebuilt toolchains are always available so people need not bui=
ld=20
it up themselves:
http://blackfin.uclinux.org/gf/project/toolchain/frs

> When you get to the point of building uclibc, the fun starts, since
> uclinux (not uclibc) has no proper shared library support

shockingly incorrect.  FDPIC ELF is 100% complete and exactly the same as E=
LF=20
on your desktop.  there is no difference at all from a C API or GNU linker=
=20
perspective.

> so you have to choose an emulation method (fdpic being one of the options=
).

i have no idea how you're using the term "emulation", but file formats are =
not=20
"emulation methods".  they're file formats.  perhaps try reading this=20
documentation:
http://docs.blackfin.uclinux.org/doku.php?id=3Dtoolchain:executable_file_fo=
rmats

>  From that point on it's downhill, since various parts of uclibc have
> fork() in their code

sounds like you didnt configure uClibc properly

> gcc will ICE on other parts, etc.

gcc ICEs on our side a rare and always get fixed quickly.  if you're=20
indirectly suggesting the Blackfin gcc port is immature or crap, that is=20
absolutely not the case.
=2Dmike

--nextPart3417920.xPz6z88ojW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iQIcBAABAgAGBQJKVTThAAoJEEFjO5/oN/WB6awP/0LdXNQGHf6VfGGSrtbnKBj0
idj66jiDltJPyF78ozm0zSmn/S4Rzcf0dkHfPHoTuuMI6lmUx2g8wr0ZuehyS5EJ
/YuJJLrkJOZtKQlnpJ+7rV0NEXHvc0A3ElOgzmorti/GPYf6K4ZI/lGyn/Ktq0q2
FywxvsOguOcsxkahR5mItKLFWifzOc/LQwSKHlkVpd8/ys1nDYqFIOatwux7blGa
1C+vHJLOoD0sGALwRAzSqG+aIGZOEBd5N+Pcv2x55zRNGv7L9qVtLqdcsHOM4k65
EGiraXD15Fh6eBkh6S7iM8HrzQbhUZS/BtwUbX+nKFlgn1ce3tidfHwFhcM+MXKm
KWPx5ArMFUEP/rZWhEIAdvYuQ1OZYoQWYcA8t9pwLPo8hXNDxI9176bbTqRjSGUR
Gx6LwMhv/sAN0Hwhh/I+ocpiG2tGmPFtoc5xYauIeOi3XbkyTFEt1cEHANJ0Ff6G
T7T4aCv4LvIL6+62TRgdAzx4UjxActOJb6QkoiNOaJfWmjBVpGq+kNL6cf8XkpIK
aUuZspfCiiCXseggf1MwB50jupb7EYPCpddEKSWgqV+p3GTJeEsJ/jKUW6Qztfpn
eWcmUzqXuCwp40zU+WvS8mOP6FrOlGkeEUCNTXqywHWJDTEzk80qr4ZUxmlmECby
1JxXrECDHIgDvNF8yfc/
=gJ8Q
-----END PGP SIGNATURE-----

--nextPart3417920.xPz6z88ojW--
