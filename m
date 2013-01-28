Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmR7-0003eC-1v
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:59:40 +0100
Received: by mail-wi0-f175.google.com with SMTP id hq12so791935wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XBgX/bLieZxmBbdu6DrPuuq2ApeFLANKNyIa5ZzLQzI=;
	b=inmW61WrP5nTVoIszD8HbBHYFE0OWXuCQk2fTG2C7a7h70vi++Hpyvo90IZyD9fTyq
	2Ni1lEzKWMWCq/ZFawIKy+f8wte/D9YaQgw9P0um5Ws0gVq1KXXEt9hcI0q3MUS3HUAa
	+M4yf28e+q1FYuL6LnjFPD/mxj3MinGIfS/RDwr03UY7Jlp9B9zqjSR4rjKLEJ9vT4JD
	acxUkvUJ0N14NoFgjsICxARMx58tIsOemNwQevYYeZ+mCFOC1dy0YJvEhT32654Cb/0L
	khKC/BbKBgeUnDKYgDOBO9tZZtIn8+UBsVM0PUQEmRev0GcUY3SnAg3pje4HGmE1tbM2
	x5zQ==
X-Received: by 10.194.104.137 with SMTP id ge9mr2271363wjb.59.1359369839076;
	Mon, 28 Jan 2013 02:43:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bz12sm12758622wib.5.2013.01.28.02.43.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:43:58 -0800 (PST)
Date: Mon, 28 Jan 2013 11:44:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128104402.GX16904@jama.palm1.palmone.com>
References: <1358778699-30412-1-git-send-email-riku.voipio@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1358778699-30412-1-git-send-email-riku.voipio@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] fuse: add aarch64 support
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
X-List-Received-Date: Mon, 28 Jan 2013 11:00:03 -0000
X-Groupsio-MsgNum: 42882
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BtNCO5h84ExDStzY"
Content-Disposition: inline

--BtNCO5h84ExDStzY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 04:31:38PM +0200, Riku Voipio wrote:
> u64/u32 is not defined in sys/types.h, include linux/types.h like
> the kernel version of fuse.h does. Patch sent to upstream mailing list.

Applied thanks

>=20
> Upstream-Status: Submitted
>=20
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  .../recipes-support/fuse/fuse-2.9.2/aarch64.patch  |   20 ++++++++++++++=
++++++
>  meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |    1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
>=20
> diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch b/meta=
-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
> new file mode 100644
> index 0000000..180f544
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> +
> +--- a/include/fuse_kernel.h
> ++++ b/include/fuse_kernel.h
> +@@ -88,12 +88,7 @@
> + #ifndef _LINUX_FUSE_H
> + #define _LINUX_FUSE_H
> +=20
> +-#include <sys/types.h>
> +-#define __u64 uint64_t
> +-#define __s64 int64_t
> +-#define __u32 uint32_t
> +-#define __s32 int32_t
> +-#define __u16 uint16_t
> ++#include <linux/types.h>
> +=20
> + /*
> +  * Version negotiation:
> diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb b/meta-oe/recipes=
-support/fuse/fuse_2.9.2.bb
> index 23b9447..b558c4d 100644
> --- a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
> +++ b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
> @@ -9,6 +9,7 @@ PR =3D "r1"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
>             file://gold-unversioned-symbol.patch \
> +           file://aarch64.patch \
>            "
>  SRC_URI[md5sum] =3D "7d80d0dc9cc2b9199a0c53787c151205"
>  SRC_URI[sha256sum] =3D "81a728fb3f87da33063068735e2fb7e2cd89df207d32687d=
3d3278385279cefc"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BtNCO5h84ExDStzY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVnIACgkQN1Ujt2V2gByVuACfVQKFu6Ph5Fi0nIh5mIIOTXHg
BbcAoKWRtiLKyxrzYAM44s0CajxXc4ao
=MA3c
-----END PGP SIGNATURE-----

--BtNCO5h84ExDStzY--
