Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgZO9-0007Vn-T5 for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 10:31:50 +0200
Received: from f053041223.adsl.alicedsl.de ([78.53.41.223]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgZO8-0001Vm-1S for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 08:31:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100803230120.GN4752@home.lan>
References: <1280798728-13412-1-git-send-email-ydirson@altern.org>
	<20100803230120.GN4752@home.lan>
Date: Wed, 04 Aug 2010 10:31:45 +0200
Message-ID: <1280910705.4225.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] python-xdg: prevent infinite recursion in xdg.DesktopEntry.__cmp__().
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
X-List-Received-Date: Wed, 04 Aug 2010 08:31:50 -0000
X-Groupsio-MsgNum: 21810
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-h4Cby+V5Wb5m7K/5qlRU"

--=-h4Cby+V5Wb5m7K/5qlRU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 04.08.2010, 01:01 +0200 schrieb Yann Dirson:
> Delete cmp method which has been dropped from later releases.

Yann, thank you for your patch.

I would prefer if you could move the recipe to 0.19 [1]. I did `git grep
-i pyxdg` and found no traces that 0.15 is pinned anywhere.

Or is your patch for stable?

[=E2=80=A6]


Thanks,

Paul


[1] http://freedesktop.org/wiki/Software/pyxdg

--=-h4Cby+V5Wb5m7K/5qlRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxZJXEACgkQPX1aK2wOHVigxQCfUwnDNwFopwStUxT+muAISINU
bzoAnibaeLWE+Xfi34Mde0PozRRI+1kE
=49jS
-----END PGP SIGNATURE-----

--=-h4Cby+V5Wb5m7K/5qlRU--
