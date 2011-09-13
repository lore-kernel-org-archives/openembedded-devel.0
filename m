Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3PdU-0000Ui-1a for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 11:50:36 +0200
Received: from f053041096.adsl.alicedsl.de ([78.53.41.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3PYZ-0000rn-Ez for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 09:45:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2011 11:45:09 +0200
In-Reply-To: <1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
References: <4E6E2161.3070004@juszkiewicz.com.pl>
	<1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315907128.4195.8.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Tue, 13 Sep 2011 09:50:36 -0000
X-Groupsio-MsgNum: 34201
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-bX7+wTCMA9zeBTlyRgp2"

--=-bX7+wTCMA9zeBTlyRgp2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Steffen,


Am Montag, den 12.09.2011, 17:26 +0200 schrieb Steffen Sledz:
> This patch is similar to the one in linux-libc-headers 2.6.23 [1] and
> enables building of OpenJDK which uses HWCAP_THUMBEE which normally
> are not present in 2.6.24 headers.
>=20
> [1] commit 41cd62ffbac7d272d46a4b39faf8a97c0850dd10

thank you for updating the patch and the commit message.

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++=
++++++
>  .../linux-libc-headers_2.6.24.bb                   |    5 ++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/=
arm-hwcap-add-new-entries.patch
>=20
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwc=
ap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.=
6.24/arm-hwcap-add-new-entries.patch
> new file mode 100644
> index 0000000..6975317
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-=
new-entries.patch
> @@ -0,0 +1,21 @@

I am not sure about the policy in oe.dev, but could you add a patch
header, please [1].

Upstream-Status: Backport [2.6.(which one?)]

> +---
> + include/asm-arm/hwcap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- linux-2.6.24.orig/include/asm-arm/hwcap.h
> ++++ linux-2.6.24/include/asm-arm/hwcap.h
> +@@ -13,10 +13,14 @@
> + #define HWCAP_VFP	64
> + #define HWCAP_EDSP	128
> + #define HWCAP_JAVA	256
> + #define HWCAP_IWMMXT	512
> + #define HWCAP_CRUNCH	1024
> ++#define HWCAP_THUMBEE	2048
> ++#define HWCAP_NEON	4096
> ++#define HWCAP_VFPv3	8192
> ++#define HWCAP_VFPv3D16	16384
> +=20
> + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
> + /*
> +  * This yields a mask that user programs can use to figure out what
> +  * instruction set this cpu supports.
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index 148d03f..cec1835 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,13 +2,14 @@ require linux-libc-headers.inc
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS +=3D "unifdef-native"
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
>             file://procinfo.h \
>             file://export_falloc_h.patch \
>             file://make-3.82.patch \
> -           file://unifdef.patch"
> +           file://unifdef.patch \
> +           file://arm-hwcap-add-new-entries.patch"

To keep future patches smaller could you put the =C2=BB"=C2=AB on the new l=
ine
please?

        =E2=80=A6.patch \
        "
=20
>  SRC_URI_append_hipox =3D " \
>  	file://siocoutqsnd.patch \

With these changes please add

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

below your Signed-off-by line.


Thanks,

Paul


[1] http://openembedded.org/index.php?title=3DCommit_Patch_Message_Guidelin=
es#Patch_Header_Recommendations

--=-bX7+wTCMA9zeBTlyRgp2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5vJiUACgkQPX1aK2wOHVhRSgCgiRI3IHS9ESeCde8SgxsyfByz
UyAAn3i6eHzGSEjIGO2FEzxfxWST5WQv
=hfIz
-----END PGP SIGNATURE-----

--=-bX7+wTCMA9zeBTlyRgp2--
