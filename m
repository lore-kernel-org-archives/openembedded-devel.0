Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NkEOS-0002i8-Sc
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 11:23:04 +0100
Received: (qmail 27797 invoked by uid 813007); 24 Feb 2010 10:20:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 Feb 2010 10:20:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2010 11:19:16 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1266951776.18176.47.camel@trini-m4400>
In-Reply-To: <1266951776.18176.47.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201002241119.20053.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Wed, 24 Feb 2010 10:23:04 -0000
X-Groupsio-MsgNum: 17030
Content-Type: multipart/signed; boundary="nextPart3278864.PpuGi2WGuW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3278864.PpuGi2WGuW
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 23 lutego 2010 o 20:02:56 Tom Rini napisa=C5=82(a):
> I was about to just push this and I noticed that a number of
> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> FEATURE_SUID=3Dy, but it's not actually install SUID.  And since I recall
> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> it best to post the patch first and let folks speak up / ask me to drop
> FEATURE_SUID=3Dy when I do this.  So, here's the patch:

Ok, but does not it require /etc/something to list which applets are allowe=
d=20
to be suid and which are not?=20

Hm. checked sources. with FEATURE_SUID suid will be active only for "cronta=
b,=20
dnsd, findfs, ipcrm, ipcs, login, passwd, ping, su, traceroute, vlock"=20
commands. /etc/busybox.conf is CONFIG_FEATURE_SUID_CONFIG option.

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart3278864.PpuGi2WGuW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuE/SQACgkQeQ6MlGH/2qt3jACfaJFyLhsC4rVmbeaKawot885H
ZFUAnRQ9AsgfUfT1/r7W6wH7MAeamhIx
=2HI7
-----END PGP SIGNATURE-----

--nextPart3278864.PpuGi2WGuW--
