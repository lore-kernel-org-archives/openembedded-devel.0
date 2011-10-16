Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RFXPW-00043x-20 for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 22:34:18 +0200
Received: from f053043242.adsl.alicedsl.de ([78.53.43.242]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RFXKB-0006ch-KC for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 20:28:47 +0000
Message-ID: <1318796911.6392.63.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Oct 2011 22:28:31 +0200
In-Reply-To: <201110162130.45541.GNUtoo@no-log.org>
References: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
	<1313666756.4016.76.camel@mattotaupa>
	<1313759841.3673.42.camel@mattotaupa>
	<201110162130.45541.GNUtoo@no-log.org>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: minimal-uclibc: ../../src/lib/.libs/liblightmediascanner.so: undefined reference to `libiconv_open' (was: [meta-efl] lightmediascanner: Add version 0.4.3.0 (initial recipe))
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
X-List-Received-Date: Sun, 16 Oct 2011 20:34:18 -0000
X-Groupsio-MsgNum: 34774
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-cwFzncCiHBa+QyCKGrZL"

--=-cwFzncCiHBa+QyCKGrZL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 16.10.2011, 21:30 +0200 schrieb Denis 'GNUtoo' Carikli:
> >The upstream developer Gustavo provided a patch and this seems to fix
> >the build issues. Could you test if the recipe in oe.dev [1] works for
> >you.
> it doesn't work for me:
> | configure.ac:37: required file `./config.rpath' not found
> | autoreconf: automake failed with exit status: 1

What recipe did you use? The recipe for 0.4.3.0 in OE-classic takes care
of that [1]!

Please be more elaborate next time and adapt the subject line too if the
message content is different.

> and at line 37 there is:
> AM_ICONV
> which is added by that patch.

0.4.3.0 should be fine. Anyway I pushed 0.4.4 in commit 63d3969b [2].


Thanks,

Paul


[1] http://git.openembedded.org/openembedded/tree/recipes/lightmediascanner=
/lightmediascanner_0.4.3.0.bb?id=3D63d3969b0f839fc4b7bf7fe836daec729d9d3c53=
#n18
[2] http://git.openembedded.org/openembedded/commit/?id=3D63d3969b0f839fc4b=
7bf7fe836daec729d9d3c53

--=-cwFzncCiHBa+QyCKGrZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6bPm8ACgkQPX1aK2wOHVh/RACfUn1ORqH6uVJcrOakZXxxUKll
Sn0AoIaTk4y/p3yAstKdcWx6zP9ViwVE
=Ju2U
-----END PGP SIGNATURE-----

--=-cwFzncCiHBa+QyCKGrZL--
