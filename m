Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14JL-0000ss-Oo for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:35:36 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P14JA-0005YA-T1 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 21:35:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Wed, 29 Sep 2010 23:35:23 +0200
Message-ID: <1285796123.27605.4.camel@mattotaupa>
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
Subject: Re: [PATCH] kernel.bbclass: avoid NOTE messages for files that are staged but not packaged
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
X-List-Received-Date: Wed, 29 Sep 2010 21:35:36 -0000
X-Groupsio-MsgNum: 24190
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-a18KhLYxKS2Y4yIRdzPA"

--=-a18KhLYxKS2Y4yIRdzPA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Frans,


Am Mittwoch, den 29.09.2010, 22:39 +0200 schrieb Frans Meulenbroeks:
> copy the files directly from the work area to staging. That way
> there are no unpackaged files in image/ so no NOTE messages.
> Additional advantage is that it is faster as we save the copy to the imag=
e dir.
>=20
> See also http://thread.gmane.org/gmane.comp.handhelds.openembedded/37487
>=20
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Acked-by: Roman I Khimov <khimov@altell.ru>
> Tested-by: Petr ?tetiar <ynezz@true.cz>
> Acked-by: Eric B?nard <eric@eukrea.com>

please fix the special characters when you commit this.

I tried to apply your patch using `pwam.sh 3097` and saw that you
already accidentally had commited this patch in
9a5382aad4e5a3e52fa52722cf5587fdba958e9f [1].

        wpa-supplicant : moved unused files to obsolete dir

Please revert that commit and commit appropriately.

[=E2=80=A6]


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9a5382a=
ad4e5a3e52fa52722cf5587fdba958e9f

--=-a18KhLYxKS2Y4yIRdzPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjsRUACgkQPX1aK2wOHVhs+ACggkgECgpxsY0Otq/FNiqETobk
baEAn0HU93S5R8+u9QHCH2zcaThhuXfu
=sCjc
-----END PGP SIGNATURE-----

--=-a18KhLYxKS2Y4yIRdzPA--
