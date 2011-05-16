Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLxZY-0006w7-Bd for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:10:56 +0200
Received: from f053045019.adsl.alicedsl.de ([78.53.45.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLxYG-0002LW-Ju; Mon, 16 May 2011 13:09:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305541284-18178-1-git-send-email-sgh@sgh.dk>
References: <BANLkTikH4sOR-aupFyQ9ArqF8iXyk0uGtw@mail.gmail.com>
	<1305541284-18178-1-git-send-email-sgh@sgh.dk>
Date: Mon, 16 May 2011 15:08:04 +0200
Message-ID: <1305551284.5159.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/3] acpid: Make 1.0.10 compile.
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
X-List-Received-Date: Mon, 16 May 2011 13:10:56 -0000
X-Groupsio-MsgNum: 32102
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ro70Z6BtvMiEpEVD0gq5"

--=-ro70Z6BtvMiEpEVD0gq5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear S=C3=B8ren,


Am Montag, den 16.05.2011, 12:21 +0200 schrieb S=C3=B8ren Holm:
> Patch is tested on i686.
> Compilation failed with the following error :
>=20
> | i686-angstrom-linux-gcc -march=3Dpentiumpro --sysroot=3D/home/sgh/oe-ne=
w-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux -W -Wall -Werror -Wundef =
-Wshadow -D_GNU_SOURCE -O2 -g -DVERSION=3D"\"1.0.10\""   -c -o
> sock.o sock.c
> | cc1: warnings being treated as errors
> | libnetlink.c: In function 'addraw_l':
> | libnetlink.c:521:56: error: comparison between signed and unsigned inte=
ger expressions

Christian already submitted a patch for this issue [1][2], but did not
provide a Signed-off-by line, which you also forgot in this patch by the
way.

> ---
>  recipes/acpid/acpid-1.0.10/libnetlink.diff |   15 +++++++++++++++
>  recipes/acpid/acpid_1.0.10.bb              |    1 +
>  2 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/acpid/acpid-1.0.10/libnetlink.diff
>=20
> diff --git a/recipes/acpid/acpid-1.0.10/libnetlink.diff b/recipes/acpid/a=
cpid-1.0.10/libnetlink.diff
> new file mode 100644
> index 0000000..59ab951
> --- /dev/null
> +++ b/recipes/acpid/acpid-1.0.10/libnetlink.diff
> @@ -0,0 +1,15 @@
> +diff --git a/libnetlink.c b/libnetlink.c
> +index 6f1ceea..d34dfe4 100644
> +--- a/libnetlink.c
> ++++ b/libnetlink.c
> +@@ -518,8 +518,8 @@ int addattr_l(struct nlmsghdr *n, int maxlen, int ty=
pe, const void *data,
> +=20
> + int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
> + {
> +-	if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
> +-		fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxl=
en);
> ++	if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxlen) {
> ++	fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxle=
n);

This indentation change is not needed.

> + 		return -1;
> + 	}
> +=20
> diff --git a/recipes/acpid/acpid_1.0.10.bb b/recipes/acpid/acpid_1.0.10.b=
b
> index 9d3170d..f0a6049 100644
> --- a/recipes/acpid/acpid_1.0.10.bb
> +++ b/recipes/acpid/acpid_1.0.10.bb
> @@ -2,6 +2,7 @@ require acpid.inc
> =20
>  SRC_URI_append =3D " file://event.c.diff \
>                     file://netlink.diff \
> +                   file://libnetlink.diff \
>                     file://gcc44.diff \
>                     file://acpid-sys-stat.patch \
>                   "

I would say to wait for Christian=E2=80=99s reply to his thread and hopeful=
ly
will get this in as soon as possible.


Thanks,

Paul


[1] http://patches.openembedded.org/patch/4023/
[2] http://patches.openembedded.org/patch/4061/

--=-ro70Z6BtvMiEpEVD0gq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3RIbQACgkQPX1aK2wOHVgJmgCdEcUyTt2Dhn9tCd4OmtFuk0Id
trYAmwRTFsCYV66FiVURGHK296fDG18q
=uAdb
-----END PGP SIGNATURE-----

--=-ro70Z6BtvMiEpEVD0gq5--
