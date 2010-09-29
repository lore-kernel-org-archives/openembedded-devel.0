Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0wOd-0000xa-H7 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 15:08:38 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0wON-0004Df-P5 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 13:08:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
References: <4CA0B4FF.3050601@dresearch.de>
	<1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
Date: Wed, 29 Sep 2010 15:08:13 +0200
Message-ID: <1285765693.4578.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add falloc.h to the exported kernel header files.
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
X-List-Received-Date: Wed, 29 Sep 2010 13:08:41 -0000
X-Groupsio-MsgNum: 24134
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SdFS08/9DnghW9TyWlHB"

--=-SdFS08/9DnghW9TyWlHB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


thank you for your patch. Could you please add the recipe name to the
beginning of the commit summary as demanded by the commit policy
[1]. ;-)


Am Montag, den 27.09.2010, 17:23 +0200 schrieb Thilo Fromm:
> This adds include/linux/falloc.h to the list of files
> exported by the kernel to the C library.
> The include file is required for building e.g. a recent util-linux-ng
> against 2.6.24.

it looks like the same fix was committed upstream [3] in March 2008 [4].
Since the Linux kernel 2.6.24 was released in January 2008 this fixed
should be present in all Linux kernels >=3D 2.6.24.

If you sent a patch iteration, please add that information to the commit
message.

> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
>  .../linux-libc-headers/files/export_falloc_h.patch |   10 ++++++++++
>  .../linux-libc-headers_2.6.24.bb                   |    1 +
>  2 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.patc=
h
>=20
> diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/rec=
ipes/linux-libc-headers/files/export_falloc_h.patch
> new file mode 100644
> index 0000000..5860e88
> --- /dev/null
> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch

Could you please add a patch header as suggested in [2].

> @@ -0,0 +1,10 @@
> +--- a/include/linux/Kbuild	2010-09-27 16:04:29.000000000 +0200
> ++++ b/include/linux/Kbuild	2010-09-27 15:59:06.000000000 +0200
> +@@ -61,6 +61,7 @@
> + header-y +=3D elf.h
> + header-y +=3D elf-em.h
> + header-y +=3D fadvise.h
> ++header-y +=3D falloc.h
> + header-y +=3D fd.h
> + header-y +=3D fdreg.h
> + header-y +=3D fib_rules.h
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index b90c478..6db6fd1 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -6,6 +6,7 @@ PR =3D "r5"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
>             file://procinfo.h \
> +           file://export_falloc_h.patch \
>             file://unifdef.patch"
> =20
>  S =3D "${WORKDIR}/linux-${PV}"


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Push_patches_upstream
[3] http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
blob;f=3Dinclude/linux/Kbuild;h=3D626b629429ff2fc3f30fcf63b25fb52211f184c0;=
hb=3DHEAD#l120
[4] http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e
[5] http://kernelnewbies.org/Linux_2_6_24

--=-SdFS08/9DnghW9TyWlHB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjOjcACgkQPX1aK2wOHVic3wCfeL5pgfsjxf1qkpgB+pBG2cwY
NAUAni/oOhQB/IGL6jUexRnmW2ppIDnZ
=X/aR
-----END PGP SIGNATURE-----

--=-SdFS08/9DnghW9TyWlHB--
