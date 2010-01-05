Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9RM-0000x3-Nv for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 14:27:19 +0100
Received: from g225142234.adsl.alicedsl.de ([92.225.142.234]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9PP-0001X2-GW for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 13:25:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 05 Jan 2010 14:25:09 +0100
Message-ID: <1262697909.3209.26.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl
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
X-List-Received-Date: Tue, 05 Jan 2010 13:27:19 -0000
X-Groupsio-MsgNum: 15407
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-86s06ynJef5w5iiFELJS"

--=-86s06ynJef5w5iiFELJS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear list,


Am Dienstag, den 05.01.2010, 13:30 +0100 schrieb Paul Menzel:
> Am Dienstag, den 05.01.2010, 10:51 +0100 schrieb Henning Heinold:
> > seems I forgot the depency. Will check them in later. This happens when=
 one
> > done build vom clean oetmp.
>=20
> I merged your changes, did `bitbake -c clean vdr`, `bitbake vdr` and
> still get the same errors as yesterday/this night. I also tried `bitbake
> libintl` manually with no success.
>=20
> Is there something messed up with my setup?

I tried to build another package with `virtual/libintl` in its `DEPENDS`
and after updating the whois recipe to a newer version (see patch some
minutes ago) `bitbake whois` succeeded.

Is written yesterday, I do not really know what I am doing and how to
best approach to fix this problem. ;-)


Thanks,

Paul

--=-86s06ynJef5w5iiFELJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktDPbQACgkQPX1aK2wOHVgL+gCdElsFjQouGZC7ML9EtADUMp/4
WxQAnAo+VXSdlCm0Veli4T0iQ5RlxFh3
=fjXN
-----END PGP SIGNATURE-----

--=-86s06ynJef5w5iiFELJS--
