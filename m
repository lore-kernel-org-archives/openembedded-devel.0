Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1J9mFQ-0004Js-SR
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 19:53:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 0E714308011
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:47:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id izlHGI0jGEKV
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:47:35 +0100 (CET)
Received: from [192.168.5.10] (xdsl-87-79-213-37.netcologne.de [87.79.213.37])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id C2EC8308010
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:47:35 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <477A7469.4060904@student.utwente.nl>
References: <E1J9k05-00006v-OV@linuxtogo.org>
	<477A7469.4060904@student.utwente.nl>
Date: Tue, 01 Jan 2008 19:47:34 +0100
Message-Id: <1199213254.8062.59.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.2 
Subject: Re: [oe-commits] org.oe.dev gpsd: Provide working default	configuration and init-script for fic-gta01. This makes	gpsd	device-specific for gta01, please check the feeds.
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
X-List-Received-Date: Tue, 01 Jan 2008 18:53:57 -0000
X-Groupsio-MsgNum: 3776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-9fr5YQ2+fR3lGpl/m37a"

--=-9fr5YQ2+fR3lGpl/m37a
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Am Dienstag, den 01.01.2008, 18:12 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> coredump2 commit schreef:
> > gpsd: Provide working default configuration and init-script for fic-gta=
01. This makes gpsd device-specific for gta01, please check the feeds.
>=20
> the (recently renamed) machine_id function exists for a reason. gta0* is
> runtime detectable, so no reason to hardcode it at buildtime.=20

Are you seriously suggesting hacking gpsd to runtime-detect the device
it's running on and auto-configure itself _just_ so you can point to
machine_id and make life for everyone a bit more difficult?

You can't expect people to hack apps just so the apps fit your holy
image of a "good" build environment, it is the other way around my
friend.

> And if
> people insist on buildtime hardcodes, but the stuff in ${PN}-conf or
> something.

Please stop your trolling. Paul took the two minutes to think up some
understandable reasons for the change-request. Your mail, OTOH didn't
add any value at all to this thread, and is just wasted bandwidth, like
usual.

If I see any more of this trolling nonsense thrown my way, I will add
you to my killfile. I don't care what you think, what you say, or what
you write.
Very few people these days do take you seriously, that is something to
think about.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-9fr5YQ2+fR3lGpl/m37a
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHeorGPXyoPq8wMNkRAuc3AKCd2qmp8Y7uU09XznVE3h9oHAAoDwCfWvaX
tWnSDOZ9C3tJKmZA6bpzMOQ=
=D+Rh
-----END PGP SIGNATURE-----

--=-9fr5YQ2+fR3lGpl/m37a--
