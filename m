Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE4E702CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:08:07 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XRL9V-0007OY-4z from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 06:08:09 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:08:08 -0700
Received: by burninator (Postfix, from userid 1000)	id E23A55814C3; Tue,  9
	Sep 2014 09:08:06 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:08:06 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909130805.GD2125@mentor.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 1/6] ipsec-tools: Fix build with glibc 2.20
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
X-List-Received-Date: Tue, 09 Sep 2014 13:08:07 -0000
X-Groupsio-MsgNum: 52041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH 1/6] ipsec-tools: Fix build with glibc 2.20] =
On 14.09.04 (Thu 00:32) Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ipsec-tools/ipsec-tools/glibc-2.20.patch       | 23 ++++++++++++++++=
++++++
>  .../ipsec-tools/ipsec-tools_0.8.2.bb               |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls/glibc-2.20.patch
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glib=
c-2.20.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glib=
c-2.20.patch
> new file mode 100644
> index 0000000..36efc49
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glibc-2.20.=
patch
> @@ -0,0 +1,23 @@
> +squahes below warning
> +  warning: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _D=
EFAULT_SOURCE"
> +
> +Seen with glibc 2.20
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: ipsec-tools-0.8.2/src/include-glibc/glibc-bugs.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- ipsec-tools-0.8.2.orig/src/include-glibc/glibc-bugs.h	2006-09-09 09:=
22:08.000000000 -0700
> ++++ ipsec-tools-0.8.2/src/include-glibc/glibc-bugs.h	2014-09-03 22:27:22=
=2E551563888 -0700
> +@@ -4,7 +4,11 @@
> + #define __GLIBC_BUGS_H__ 1
> +=20
> + #define _XOPEN_SOURCE 500
> ++/* Legacy feature macro.*/
> + #define _BSD_SOURCE
> ++/* New feature macro that provides everything _BSD_SOURCE and
> ++ * _SVID_SOURCE provided and possibly more.  */
> ++#define _DEFAULT_SOURCE
> +=20
> + #include <features.h>
> + #include <sys/types.h>
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> index 208268f..babce40 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec=
-tools/0.8/ipsec-tools-${PV
>             file://0001-racoon-pfkey-avoid-potential-null-pointer-derefer=
enc.patch \
>             file://racoon-check-invalid-pointers.patch \
>             file://racoon-check-invalid-ivm.patch \
> +           file://glibc-2.20.patch \
>            "
>  SRC_URI[md5sum] =3D "d53ec14a0a3ece64e09e5e34b3350b41"
>  SRC_URI[sha256sum] =3D "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c95367926=
90564c74fe722f2d"
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDvu1AAoJEEn8ffcsOfaWD5IH/i+pmxuZYQlvXux6GEUl4RQ7
mdFEqB3995hFtpFSzGNamYZs7KpZ326HvtPFRF0HSQrztwWodPD+Eobg0NWq5tnl
oxvlCMWgyuFIwhg194SCa0iSShDusOVKyXcdg6LKLv2qLSHchVUfHVZDwSiXcZKH
s5yh3AgU5eNZUnciTF15fUp/4nTcEy8TQXipxzzA6wd6CTfUSYgNQV7jDLXNYlHk
3dN0d1YTSSC3HiZQ+Ncto1gneyhOy5YItcRDjt79/joX/kP+/C0s4/yw0G5ABbMD
AO/Oq3855nhrjSbWryDj8usBnfXX05QWACSSOkafjIJ8zS1JdMYi6yTd0IUSjlk=
=VTyq
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
