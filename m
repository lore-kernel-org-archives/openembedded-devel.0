Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3UPG-0007jT-7M for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 16:56:14 +0200
Received: from f053041096.adsl.alicedsl.de ([78.53.41.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3UKM-0002XH-0Z for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 14:51:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2011 16:51:04 +0200
In-Reply-To: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
References: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315925466.4195.58.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Tue, 13 Sep 2011 14:56:14 -0000
X-Groupsio-MsgNum: 34209
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-cPlZ/YT/drF5Fy7Ws2gd"

--=-cPlZ/YT/drF5Fy7Ws2gd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 13.09.2011, 15:29 +0200 schrieb Steffen Sledz:
> GNU make >=3D 3.82 does not allow mixed implicit and normal rules

Did you update your build host?

I think to circumvent such issues `make-native` 3.81 should be used?

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/eglibc/eglibc-2.9/make-3.82.patch |   16 ++++++++++++++++
>  recipes/eglibc/eglibc_2.9.bb              |    3 ++-
>  2 files changed, 18 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch
>=20
> diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/e=
glibc-2.9/make-3.82.patch
> new file mode 100644
> index 0000000..b0a45d9
> --- /dev/null
> +++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch
> @@ -0,0 +1,16 @@

The patch header is missing [1].

> +diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile
> +--- libc.orig//manual/Makefile	2011-09-13 14:49:57.428424088 +0200
> ++++ libc/manual/Makefile	2011-09-13 14:50:47.009620484 +0200
> +@@ -242,7 +242,11 @@
> + .PHONY: stubs
> + stubs: $(objpfx)stubs
> + endif
> +-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
> ++$(objpfx)stubs ../po/manual.pot:
> ++	$(make-target-directory)
> ++	touch $@
> ++
> ++$(objpfx)stamp%:
> + 	$(make-target-directory)
> + 	touch $@
> +=20
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index be60ba7..7e0fa55 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  DEPENDS +=3D "gperf-native"
>  FILESPATHPKG =3D. "eglibc-svn:"
>  PV =3D "2.9"
> -PR =3D "${INC_PR}.10"
> +PR =3D "${INC_PR}.11"
>  PR_append =3D "+svnr${SRCPV}"
>  SRCREV=3D"10153"
>  EGLIBC_BRANCH=3D"eglibc-2_9"
> @@ -14,6 +14,7 @@ SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${E=
GLIBC_BRANCH};proto=3Dsvn \
>             file://shorten-build-commands.patch \
>             file://sh4_set_fpscr.patch \
>             file://sh4_local-fpscr_values.patch \
> +           file://make-3.82.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk"
>  S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"


Thanks,

Paul


[1] http://openembedded.org/index.php?title=3DCommit_Patch_Message_Guidelin=
es

--=-cPlZ/YT/drF5Fy7Ws2gd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5vbdgACgkQPX1aK2wOHViaIACfUgyE5Udx5Js7DrxZpKkB9ubh
5+cAnjb2lmriktBdCJboafnqvlhVG4eq
=xZ7Q
-----END PGP SIGNATURE-----

--=-cPlZ/YT/drF5Fy7Ws2gd--
