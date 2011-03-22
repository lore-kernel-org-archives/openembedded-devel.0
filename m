Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1x1O-000706-NH for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:32:58 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1wzf-0004gi-4o for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 08:31:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
Date: Tue, 22 Mar 2011 09:31:09 +0100
Message-ID: <1300782669.3827.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 08:32:58 -0000
X-Groupsio-MsgNum: 30480
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-d9WiSmz094rZMhz0zRuX"

--=-d9WiSmz094rZMhz0zRuX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 22.03.2011, 09:01 +0100 schrieb heinold@inf.fu-berlin.de:
> From: Henning Heinold <heinold@inf.fu-berlin.de>

Maybe add a link to the corresponding discussion [1].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/0310=
58.html

> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> ---
>  recipes/cairo/cairo.inc |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> index c60d7d9..fad50b3 100644
> --- a/recipes/cairo/cairo.inc
> +++ b/recipes/cairo/cairo.inc
> @@ -1,15 +1,22 @@
>  SECTION =3D "libs"
>  PRIORITY =3D "optional"
> -DEPENDS =3D "virtual/libx11 pixman libsm libpng fontconfig libxrender gl=
ib-2.0"
>  DESCRIPTION =3D "Cairo graphics library"
>  LICENSE =3D "MPL LGPL"
> =20
> +DEPENDS =3D "virtual/libx11 pixman libsm libpng fontconfig libxrender gl=
ib-2.0"
> +
> +DEPENDS_append_arm =3D " libatomic-ops"
> +DEPENDS_append_mips =3D " libatomic-ops"
> +DEPENDS_append_mipsel =3D " libatomic-ops"
> +DEPENDS_append_ppc =3D " libatomic-ops"
> +
>  #check for TARGET_FPU=3Dsoft and inform configure of the result so it ca=
n disable some floating points=20
>  require cairo-fpu.inc
>  EXTRA_OECONF +=3D "${@get_cairo_fpu_setting(bb, d)}"
> =20
>  inherit autotools pkgconfig=20
> =20
> +

When you commit, please remove the extra line, which slipped in.

>  PACKAGES =3D+ "cairo-trace cairo-trace-dev libcairo-script-interpreter l=
ibcairo-gobject"
>  FILES_libcairo-gobject =3D "${libdir}/libcairo-gobject.so.*"
>  FILES_libcairo-script-interpreter =3D "${libdir}/libcairo-script-interpr=
eter.so.*"

I am ignorant on this topic, so others have to acknowledge your patch.


Sorry and thanks,

Paul

--=-d9WiSmz094rZMhz0zRuX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IXk0ACgkQPX1aK2wOHVjRRACdHX35+rYqumG0MqAHZgCvXyWh
ppUAni4rCouj4or+iHMA0wc9mHjpajIg
=LOng
-----END PGP SIGNATURE-----

--=-d9WiSmz094rZMhz0zRuX--
