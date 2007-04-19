Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1Heg7e-0007dX-Nv
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 01:33:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id CCF193081F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2007 01:33:05 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 09360-08 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2007 01:33:02 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-213-196-247-37.netcologne.de
	[213.196.247.37]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 94F483081ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2007 01:32:41 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20070418090235.GA21841@twibble.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
Date: Fri, 20 Apr 2007 01:32:33 +0200
Message-Id: <1177025553.5022.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 23:33:07 -0000
X-Groupsio-MsgNum: 1890
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-OuzSrkbuICqS/A5byzzk"

--=-OuzSrkbuICqS/A5byzzk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 18.04.2007, 19:02 +1000 schrieb Jamie Lenehan:
> On Tue, Apr 17, 2007 at 12:02:03AM +0200, Koen Kooi wrote:
> > Hi,
> >=20
> > Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs=
 for
> > almost all machines, which wipes /var/lib at boot, which will break blu=
ez and
> > dpkg.
> >=20
> > What would be the best way to preserve /var/lib (and maybe others) acro=
ss boots?
>=20
> This has been brought up a few times and no one has really had a good
> answer for it. I think /var/lib at a minimum needs to be made
> persistent.
>=20
> After thinking about it a bit I've got the following proposal:
>=20
>  - make /var a standard directory (no tmpfs)
>=20
>  - make /var/volatile a tmpfs filesystems (or /var/tmpfs)
>=20
>  - symlink things that are to be made volatile from /var into
>    /var/volatile
>=20

Sounds fine to me.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-OuzSrkbuICqS/A5byzzk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGJ/wRPXyoPq8wMNkRAoORAKCBvj3pyjO2mXpvbPNbK9e8FsYacACg2/au
R/mg/MYfJ0IB1+akW5vUY98=
=5gpi
-----END PGP SIGNATURE-----

--=-OuzSrkbuICqS/A5byzzk--
