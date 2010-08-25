Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoD1P-0006HF-3K for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 12:16:10 +0200
Received: from f053042170.adsl.alicedsl.de ([78.53.42.170]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoD0q-0005im-Mn for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 10:15:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=nsTUOndpz7duDncPmbto8vueL0axvEV2qRCBQ@mail.gmail.com>
References: <AANLkTi=nsTUOndpz7duDncPmbto8vueL0axvEV2qRCBQ@mail.gmail.com>
Date: Wed, 25 Aug 2010 12:15:15 +0200
Message-ID: <1282731315.3880.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Upstart sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 10:16:10 -0000
X-Groupsio-MsgNum: 22632
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-easi+HPbojcDe2yOdJA/"

--=-easi+HPbojcDe2yOdJA/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2010, 15:19 +0600 schrieb Anatoly Shipitsin:
> Hello. I've fixed upstart recipe for proper work in sysvinit compat mode.
> Also i've changed sysvinit recipe.
> I've tested image loading and shutdown with such settings IMAGE_INIT_MANA=
GER
> =3D "upstart upstart-sysvcompat sysvinit-utils"
> it passed successfully. But killall5 was trying to kill upstart init. :)

Thank you for your patch.

Please take a look at the commit policy [1], resend as v2 and please
remember to update the patch queue.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork

--=-easi+HPbojcDe2yOdJA/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx07TMACgkQPX1aK2wOHVjuJgCdHSAhYlGPzNVk9UJj2s3B/suZ
TJAAn0RPaBfOts2g3hw8eoAifE0nw1/L
=8zNR
-----END PGP SIGNATURE-----

--=-easi+HPbojcDe2yOdJA/--
