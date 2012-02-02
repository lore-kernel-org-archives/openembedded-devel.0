Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rss8V-0004sK-BE for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 09:35:19 +0100
Received: from g225081057.adsl.alicedsl.de ([92.225.81.57]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rss0y-0004ZL-Qg for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 08:27:33 +0000
Message-ID: <1328171236.3941.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 Feb 2012 09:27:16 +0100
In-Reply-To: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] tmux: Add initial recipe for vesion 1.6.
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
X-List-Received-Date: Thu, 02 Feb 2012 08:35:19 -0000
X-Groupsio-MsgNum: 36839
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-b27gsfJb2msVEXLV8OFC"

--=-b27gsfJb2msVEXLV8OFC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Peter,


thank you for your latest work. It is much appreciated.

Am Mittwoch, den 01.02.2012, 22:38 +0100 schrieb Peter Tworek:

This is just an optional request from me. I would like to see in the
commit message what build configuration you used for testing.

> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
>  meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
>=20
> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-=
extended/tmux/tmux_1.6.bb
> new file mode 100644
> index 0000000..eb6f7df
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Terminal multiplexer"
> +HOMEPAGE =3D "http://tmux.sourceforge.net"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://tmux.c;startline=3D3;endline=3D17;md5=3Df36=
d9c9e6c1c24996a88891fdf783d04"
> +
> +DEPENDS =3D "ncurses libevent"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
> +SRC_URI[md5sum] =3D "3e37db24aa596bf108a0442a81c845b3"
> +SRC_URI[sha256sum] =3D "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5=
967c56881a7efbd6"
> +
> +inherit autotools
> +
> +do_configure_prepend () {
> +	sed -i -e 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed faile=
d"

You can ensure that `sed` is available by depending on `sed-native` I
think. At least in OE-Classic this was available.

Additionally it would be great if you could contact upstream and make
them aware of this problem and maybe even provide a patch. So that in
the feature no adaptations are needed and other distributions/framework
can profit too.

> +}


Thanks,

Paul

--=-b27gsfJb2msVEXLV8OFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8qSOQACgkQPX1aK2wOHVgN2gCfX3wj5ATvVh0hn/k2u39U/3+C
g1YAmwXLSV58mW35BWQRiRa3Hd34++Mz
=5GV4
-----END PGP SIGNATURE-----

--=-b27gsfJb2msVEXLV8OFC--
