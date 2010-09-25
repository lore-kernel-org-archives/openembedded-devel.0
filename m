Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OzQK4-0002ON-RI for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 10:41:35 +0200
Received: from f053039053.adsl.alicedsl.de ([78.53.39.53]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OzQJz-00016r-5J for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 08:41:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285357189-26457-2-git-send-email-msmith@cbnco.com>
References: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
	<1285357189-26457-1-git-send-email-msmith@cbnco.com>
	<1285357189-26457-2-git-send-email-msmith@cbnco.com>
Date: Sat, 25 Sep 2010 10:41:25 +0200
Message-ID: <1285404085.5151.3.camel@mattotaupa>
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
Subject: Re: [PATCH 2/4] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Sat, 25 Sep 2010 08:41:35 -0000
X-Groupsio-MsgNum: 23984
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tOajk8mWLRWseRgOioya"

--=-tOajk8mWLRWseRgOioya
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 24.09.2010, 15:39 -0400 schrieb Michael Smith:
> This should work around package incompatibilities with whatever version
> of make is installed on the build system.
>=20
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  classes/base.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index b19eb32..60e6bc8 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -71,7 +71,8 @@ def base_deps(d):
>  	if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
>  		if (bb.data.getVar('HOST_SYS', d, 1) !=3D
>  	     	    bb.data.getVar('BUILD_SYS', d, 1)):
> -			deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/libc "
> +			deps +=3D (" virtual/${TARGET_PREFIX}gcc virtual/libc "
> +				"make-native")

Are the parentheses =C2=BB()=C2=AB needed? Is it to prevent using =C2=BB\=
=C2=AB for the line
break?

>  		elif bb.data.inherits_class('native', d) and \
>  				bb.data.getVar('PN', d, True) not in \
>  				("linux-libc-headers-native", "quilt-native",


Thanks,

Paul

--=-tOajk8mWLRWseRgOioya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkydtbAACgkQPX1aK2wOHVhcTgCfUVpw797P1LERkLuMV2ya5wAJ
JKAAnjxq5h0bpAEZKopk0KI2IDSctnNN
=TqiE
-----END PGP SIGNATURE-----

--=-tOajk8mWLRWseRgOioya--
