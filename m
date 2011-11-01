Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RLNAk-0005yk-G1 for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 23:51:10 +0100
Received: from f053040042.adsl.alicedsl.de ([78.53.40.42]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RLN4v-0006EY-VM for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 22:45:10 +0000
Message-ID: <1320187498.27731.13.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 01 Nov 2011 23:44:58 +0100
In-Reply-To: <1320166017-12836-1-git-send-email-nmacgum@gmail.com>
References: <1320166017-12836-1-git-send-email-nmacgum@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] guilt-native: changed SRC_URI
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
X-List-Received-Date: Tue, 01 Nov 2011 22:51:10 -0000
X-Groupsio-MsgNum: 35168
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-2whspa3CqzfQ92N/dL+d"

--=-2whspa3CqzfQ92N/dL+d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Neil,


Am Dienstag, den 01.11.2011, 09:46 -0700 schrieb nmacgum@gmail.com:
> From: Neil MacMunn <neil@gumstix.com>
>=20
> * the old kernel.org URI is no longer reachable

=E2=80=A6 because of the server compromise.

> Signed-off-by: Neil MacMunn <neil@gumstix.com>
> ---
>  meta/recipes-devtools/guilt/guilt-native_0.33.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/reci=
pes-devtools/guilt/guilt-native_0.33.bb
> index 54b1b90..325118a 100644
> --- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
> +++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
> @@ -8,7 +8,7 @@ PR =3D r1
> =20
>  inherit native
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/people/jsipek/guilt/guilt-=
${PV}.tar.gz\
> +SRC_URI =3D "http://ftp.sunet.se/pub/Linux/kernels/people/jsipek/guilt/g=
uilt-${PV}.tar.gz\

If I understand that correctly, you should define `KERNELORG_MIRROR` to
something else in your `local.conf` until <kernel.org> is back hosting
these archives. Otherwise all mirrors need to be changed. Maybe this
variable could be also redefined to some other mirror and later we will
revert that commit when <kernel.org> is back up.

>             file://guilt-push.patch \
>  	   file://guilt-pop.patch \
>  	   file://guilt.patch \


Thanks,

Paul


--=-2whspa3CqzfQ92N/dL+d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6wdmoACgkQPX1aK2wOHVj/AQCeI2ButFWCdsj5tdEPIkp4y/FG
BcMAn3gLFmNVOlW6BZMLUA/ghtNI4Wnh
=O8Wu
-----END PGP SIGNATURE-----

--=-2whspa3CqzfQ92N/dL+d--
