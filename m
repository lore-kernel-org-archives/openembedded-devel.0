Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 203D2605BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:06:19 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XRL7k-0007CG-Js from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 06:06:20 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:06:20 -0700
Received: by burninator (Postfix, from userid 1000)	id 7DB155814C3; Tue,  9
	Sep 2014 09:06:19 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:06:19 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909130619.GC2125@mentor.com>
References: <1408441112-10650-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408441112-10650-1-git-send-email-Chong.Lu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] memcached: add knob to detect whether hugetlbfs are checked
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
X-List-Received-Date: Tue, 09 Sep 2014 13:06:21 -0000
X-Groupsio-MsgNum: 52040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] memcached: add knob to detect whether hugetl=
bfs are checked] On 14.08.19 (Tue 17:38) Chong Lu wrote:

> Add knob to detect whether hugetlbfs are checked or not.
> This patch fixed the error:
>     ld: cannot find -lhugetlbfs
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../memcached/memcached-add-hugetlbfs-check.patch  | 32 ++++++++++++++++=
++++++
>  .../recipes-support/memcached/memcached_1.4.17.bb  | 13 +++++++--
>  2 files changed, 42 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-support/memcached/memcached/m=
emcached-add-hugetlbfs-check.patch
>=20
> diff --git a/meta-networking/recipes-support/memcached/memcached/memcache=
d-add-hugetlbfs-check.patch b/meta-networking/recipes-support/memcached/mem=
cached/memcached-add-hugetlbfs-check.patch
> new file mode 100644
> index 0000000..544b840
> --- /dev/null
> +++ b/meta-networking/recipes-support/memcached/memcached/memcached-add-h=
ugetlbfs-check.patch
> @@ -0,0 +1,32 @@
> +memcached: add knob to detect whether hugetlbfs are checked
> +
> +Add knob to detect whether hugetlbfs are checked or not.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + configure.ac | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7f22f21..21691b9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -314,7 +314,12 @@ fi
> + dnl -------------------------------------------------------------------=
---------
> +=20
> + AC_SEARCH_LIBS(umem_cache_create, umem)
> +-AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
> ++AC_ARG_ENABLE(hugetlbfs,
> ++  [AS_HELP_STRING([--enable-hugetlbfs],[Enable hugetlbfs])])
> ++
> ++if test "x$enable_hugetlbfs" =3D "xyes"; then
> ++  AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
> ++fi
> +=20
> + AC_HEADER_STDBOOL
> + AH_BOTTOM([#if HAVE_STDBOOL_H
> +--=20
> +1.8.3.4
> +
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.b=
b b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> index 5d37df0..e61bc74 100644
> --- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> +++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> @@ -18,7 +18,11 @@ DEPENDS +=3D "libevent"
>  RDEPENDS_${PN} +=3D "perl perl-module-posix perl-module-autoloader perl-=
module-tie-hash"
> =20
>  SRC_URI =3D "http://www.memcached.org/files/${BP}.tar.gz \
> -           file://configure.patch"
> +           file://configure.patch \
> +           file://memcached-add-hugetlbfs-check.patch"
> +
> +# set the same COMPATIBLE_HOST as libhugetlbfs
> +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
> =20
>  SRC_URI[md5sum] =3D "46402dfbd7faadf6182283dbbd18b1a6"
>  SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf992=
6a89999d8cdc0458"
> @@ -26,11 +30,14 @@ SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4=
f0e64eb23859fdbf9926a89999d8c
>  python __anonymous () {
>      endianness =3D d.getVar('SITEINFO_ENDIANNESS', True)
>      if endianness =3D=3D 'le':
> -        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dlittle")
> +        d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=3Dlittle")
>      else:
> -        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dbig")
> +        d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=3Dbig")
>  }
> =20
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[hugetlbfs] =3D "--enable-hugetlbfs, --disable-hugetlbfs, l=
ibhugetlbfs"
> +
>  inherit update-rc.d
> =20
>  INITSCRIPT_NAME =3D "memcached"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDvtLAAoJEEn8ffcsOfaWUTEH/1cLusgAIyDqxw6QVkYRMvtE
YHpAZSHxhxcvyOfJk6jMjjJdUy+/8rdhACXMlWXp3yGQNWu7qRAo+J0YsjAi54Qe
+aJFKz2AjZpKfYLaxkQQPQg2CcP32oybKncTfJRZ75aHSutJWM7TxnNUM1Wo59tG
urPYtPwwYxFTYT0efYuNgDhmZu+k8FjoRByBuW7vYrd5nkRyAJvvgIUIJDkWqdNM
qXGoLvPpBu5waAzYXAHqHnDIM7t/DICT6xzoVKKYkMvnEqly0txzrjIrnQCh3w+C
rll0xu3sRzyjSW3sdGlvZ/6Rk7kPPZ0HnrQ+LbvjVKyteNoN21qj6eIHaPBD/SE=
=DWjz
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
