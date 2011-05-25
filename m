Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QPCra-0001p3-3r
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 14:06:58 +0200
Received: (qmail invoked by alias); 25 May 2011 12:03:55 -0000
Received: from 230.118.101.84.rev.sfr.net (EHLO [192.168.42.72])
	[84.101.118.230]
	by mail.gmx.net (mp062) with SMTP; 25 May 2011 14:03:55 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+YqRRIRoqYuVdnrrSeaslDZ1Z942cmRXeYOThfz2
	D/tPjnPhRTWnpr
Message-ID: <4DDCF017.4010305@gmx.net>
Date: Wed, 25 May 2011 14:03:35 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306099474.5994.112.camel@mattotaupa> <4DDCCD4C.1080902@gmx.net>
	<1306321712.10056.37.camel@mattotaupa>
In-Reply-To: <1306321712.10056.37.camel@mattotaupa>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: =?UTF-8?B?UmU6IGljZWR0ZWE2LW5hdGl2ZTogdGFzayBjb21waWxlIGZhaWxzIHdpdGggYHVuemlwOiBjYW5ub3QgZmluZCB6aXBmaWxlIGRpcmVjdG9yeSBpbiBvbmUgb2YgL29lL2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jpbi91bnppcCBvciDigKZg?=
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
X-List-Received-Date: Wed, 25 May 2011 12:06:58 -0000
X-Groupsio-MsgNum: 32276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig55D97618390085426F49A25C"

--------------enig55D97618390085426F49A25C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

>         # Unzip zip file $2 into directory $1 (if $2 exists)
>         #   Warning: $2 must be absolute path not relative
>         define Unzipper
>         ( \
>           $(MKDIR) -p $1; \
>           $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
>           ( $(CD) $1 && $(UNZIP) -o $2 ) \
>         )
>         endef
>=20
> I do not see where this fails. By the way, to use the native `unzip` I =
have the following in my recipe (as send to the list [2]).
Wow, this is really weird! There is a file
openjdk-ecj/jdk/make/common/shared/Defs-utils.gmk containing all the
tool variable definitions - including UNZIP. So I removed the
EXTRA_OEMAKE part for UNZIP and added the path to our native unzip
executable directly into Defs-utils.gmk and guess what. That works!

This is really weird because the 'Unzipper' command actually echos its
arguments and there $2 is printed perfectly. But when it is accessed a
second time in the actual call it is wrong.

/me puzzled ....

Regards,
Robert


--------------enig55D97618390085426F49A25C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3c8CEACgkQG9cfwmwwEtp8eACdGBoQ4sZO8F7SkXmaFjT3sl76
SzsAnj2IK9A/wpB0tNazQhzR1AUOtyYY
=4Igt
-----END PGP SIGNATURE-----

--------------enig55D97618390085426F49A25C--
