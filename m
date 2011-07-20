Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qjdy5-0003vY-5M for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:06:09 +0200
Received: from f053035220.adsl.alicedsl.de ([78.53.35.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qjduw-0000Fv-C3; Wed, 20 Jul 2011 21:02:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <j05t3l$kj8$1@dough.gmane.org>
References: <1311121620-27630-1-git-send-email-agnel.joel@gmail.com>
	<j05t3l$kj8$1@dough.gmane.org>
Date: Wed, 20 Jul 2011 23:02:01 +0200
Message-ID: <1311195721.6129.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: s-kipisz2@ti.com, joelagnel@ti.com, jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Wed, 20 Jul 2011 21:06:09 -0000
X-Groupsio-MsgNum: 33255
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-b7DV8D2qxC7eL+5egE8e"

--=-b7DV8D2qxC7eL+5egE8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 20.07.2011, 08:37 +0200 schrieb Koen Kooi:

> Op 20-07-11 02:27, Joel A Fernandes schreef:
> > This fixes MMC errors due to timeouts on certain SD Cards, following su=
ggestions to set dto to 14 by Jason Kridner and Steven Kipisz
> >=20
> > Details of the issue: http://talk.maemo.org/showthread.php?p=3D1000707#=
post1000707
>=20
> This patch doesn't apply to .dev

I guess because it was intended for maintenance. Joel, I think the
policy is that patches should go to master first.

> > --- Changes since earlier patch: * Set dto to 14 instead of doubling ti=
meout
> >=20
> > Other notes: * We have confirmation that this patch fixes the issue, so=
 it is safe to apply to the maintentance tree
> >=20
> > * Also please revert the earlier patch from the dev tree titled "linux-=
omap-psp: Added patch to fix MMC timeout errors" (commit 93e91091c7e2864274=
207cc7c59e3f64e453f843)
>=20
> We don't work like that.

I think the problem is that the version was bumped and decreasing it
when reverting does not work.

Therefore either send a patch reverting the previous commit but
increasing the version or send a patch updating the MMC patch.


Thanks,

Paul


PS: Joel, do I still need to CC everyone? I guess Koen is reading the
list anyhow.

--=-b7DV8D2qxC7eL+5egE8e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4nQkQACgkQPX1aK2wOHVhVXwCfY1Ahq8snaTJbNCTDH+hgP+Lr
TBwAnRZfj+GbvqE/SKdCWad2/41MrY+r
=2FH3
-----END PGP SIGNATURE-----

--=-b7DV8D2qxC7eL+5egE8e--
