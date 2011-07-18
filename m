Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiuIT-0005Eg-Ip for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 22:20:09 +0200
Received: from f053040145.adsl.alicedsl.de ([78.53.40.145]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiuFJ-0002Ws-ID for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 20:16:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311017115-28352-2-git-send-email-ray.danks@se-eng.com>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
	<1311017115-28352-2-git-send-email-ray.danks@se-eng.com>
Date: Mon, 18 Jul 2011 22:16:05 +0200
Message-ID: <1311020166.20601.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/3] rt-tests: Upgrade to latest version 0.73.
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
X-List-Received-Date: Mon, 18 Jul 2011 20:20:09 -0000
X-Groupsio-MsgNum: 33214
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HfdRj8+FLrz8NhASDmte"

--=-HfdRj8+FLrz8NhASDmte
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.07.2011, 13:25 -0600 schrieb Raymond Danks:

No full stop at the end of commit summaries, please.

> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
>  recipes/rt-tests/rt-tests_0.73.bb |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/rt-tests/rt-tests_0.73.bb
>=20
> diff --git a/recipes/rt-tests/rt-tests_0.73.bb b/recipes/rt-tests/rt-test=
s_0.73.bb
> new file mode 100644
> index 0000000..bebf89e
> --- /dev/null
> +++ b/recipes/rt-tests/rt-tests_0.73.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Real-time tests, such as cyclictest, for real-time linu=
x PREEMPT RT kernels"
> +HOMEPAGE =3D "http://rt.wiki.kernel.org/index.php/Cyclictest"
> +LICENSE =3D "GPL"
> +PR =3D "r1"

Please start at `r0`.

> +
> +SRC_URI =3D "http://www.kernel.org/pub/linux/kernel/people/tglx/rt-tests=
/rt-tests-${PV}.tar.bz2"
> +
> +S =3D "${WORKDIR}/rt-tests"
> +
> +CFLAGS +=3D "-D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +# Limit to cyclictest only for non-real-time kernels.
> +# EXTRA_OEMAKE =3D "cyclictest"
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  # any file that is executable by user and/or group
> +  for binary in `find . -perm /u+x,g+x -type f`
> +  do
> +    install -m 0755 $binary ${D}${bindir}
> +  done
> +}

Hmm, I am wondering how does this recipe work anyway. `inherit
autotools` is missing, so how are the tasks configure and compile
executed?

> +
> +SRC_URI[md5sum] =3D "98da46135f0a91c96cb7e5b27c7e3bb6"
> +SRC_URI[sha256sum] =3D "f8d396ecd6aa5526c49919acbac0ea4936f27f2410ca8065=
70d8c92c1067c29d"

Ok, it looks like you just adapted the recipe of the old version already
in included in OE.

1. Please use `git format-patch -M -M -C -C -C` =E2=80=93 I do not know how
often those arguments have to be passed =E2=80=93 so that Git detects renam=
es
and makes the diff smaller and easier to review.
2. Could you please send a follow up patch removing the old version?
3. If there are any errors with the old version which you experienced
and have been fixed, please mention those in the commit message.


Thanks,

Paul

--=-HfdRj8+FLrz8NhASDmte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4klIUACgkQPX1aK2wOHVj58ACdEuWPR9VKAk45x9lRLyy7DSOn
AEYAnR4HktMMYNP7JrIN8v4mtXLp84Fc
=g6sX
-----END PGP SIGNATURE-----

--=-HfdRj8+FLrz8NhASDmte--
