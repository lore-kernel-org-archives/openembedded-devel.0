Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B1F126AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:16:46 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so961141wgg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t9hD9LycwAkaJNYSn45WcvGyf+fBL06pu4QEJ52VWZk=;
	b=l9hvO4BpgOxB5gp5hL65Dze/MX844LN0kyqY9LSDisLGIZ4rXvu9o7LfNu9PSNQ3aM
	xtfc58+LPV1EHjoI4F9tZ9sPNAlB5hWKmMaMV7tdVDDoI/kuOYwH538qENFiuFv4AK4Z
	BGskQb/cRi1gJfo82SBLC+oI63KGJoUXZuC7cNRO1Crki7E/ZX7Gwkrw7UrGhaiyGxXS
	wiKKIRKcyufnYEyzX+MupyXR00GJZclJGIvhi6mlrZAg3Azy9XEBmMy1qjn2c/s6onvE
	zI2/E9st8JP2WH1YFHvPwEVFnMwY5K0upOE27Vc+0YIpxoNuLT/j0LZ8qiIk7lX/Tk0R
	5nQA==
X-Received: by 10.194.235.135 with SMTP id um7mr59796149wjc.1.1416406606305;
	Wed, 19 Nov 2014 06:16:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fp9sm2403993wic.12.2014.11.19.06.16.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:16:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:16:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119141646.GC3315@jama>
References: <1415092937-12036-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1415092937-12036-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libhugetlbfs: avoid search host library path for cross compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 14:16:49 -0000
X-Groupsio-MsgNum: 52928
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2014 at 04:22:17AM -0500, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> There was a patch fixing the same issue:
> libhugetlbfs-avoid-search-host-library-path-for-cros.patch
>=20
> but missed the elf_i386.xB*, this patch fixes for it.

Please test the changes you're sending.

libhugetlbfs-elf_i386-avoid-search-host-library-path.patch is in wrong
directory and not found in do_fetch task.

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
>  ...s-elf_i386-avoid-search-host-library-path.patch |   40 ++++++++++++++=
++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf=
_i386-avoid-search-host-library-path.patch
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index c2262ea..9469639 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/code \
>      file://0001-aarch64-fix-page-size-not-properly-computed.patch \
>      file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.pat=
ch \
>      file://0001-Extend-arm32-support-to-include-BE-variants.patch \
> +    file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-a=
void-search-host-library-path.patch b/recipes-benchmark/libhugetlbfs/files/=
libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
> new file mode 100644
> index 0000000..8a34e9d
> --- /dev/null
> +++ b/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-se=
arch-host-library-path.patch
> @@ -0,0 +1,40 @@
> +From 889e52753d30179ba4ac940023cb4ed561436ab8 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Tue, 4 Nov 2014 00:49:11 -0800
> +Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path f=
or cross compilation
> +
> +Upstream-Status: Inappropriate [cross compile specific]
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + ldscripts/elf_i386.xB   |    1 -
> + ldscripts/elf_i386.xBDT |    1 -
> + 2 files changed, 2 deletions(-)
> +
> +diff --git a/ldscripts/elf_i386.xB b/ldscripts/elf_i386.xB
> +index 43fe51c..eae0fa8 100644
> +--- a/ldscripts/elf_i386.xB
> ++++ b/ldscripts/elf_i386.xB
> +@@ -3,7 +3,6 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
> + 	      "elf32-i386")
> + OUTPUT_ARCH(i386)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SE=
ARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> + INPUT(-lhugetlbfs);
> + /* Do we need any of these for elf?
> +    __DYNAMIC =3D 0;    */
> +diff --git a/ldscripts/elf_i386.xBDT b/ldscripts/elf_i386.xBDT
> +index d72aebe..3bac1b1 100644
> +--- a/ldscripts/elf_i386.xBDT
> ++++ b/ldscripts/elf_i386.xBDT
> +@@ -3,7 +3,6 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
> + 	      "elf32-i386")
> + OUTPUT_ARCH(i386)
> + ENTRY(_start)
> +-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SE=
ARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
> + INPUT(-lhugetlbfs);
> + /* Do we need any of these for elf?
> +    __DYNAMIC =3D 0;    */
> +--=20
> +1.7.9.5
> +
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRspk4ACgkQN1Ujt2V2gBxzMACdE9BNDlNRu7GEw0iERmMEaE3/
PBkAnAroZ35ZQgVW3udBmfIPXafXapjj
=KC7A
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
