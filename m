Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4856AC93
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 20:56:48 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XrCIy-0004f9-Uv from Joe_MacDonald@mentor.com ;
	Wed, 19 Nov 2014 12:56:49 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Wed, 19 Nov 2014 12:56:48 -0800
Received: by burninator (Postfix, from userid 1000)	id A0D8C5805F1; Wed, 19
	Nov 2014 15:56:47 -0500 (EST)
Date: Wed, 19 Nov 2014 15:56:47 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Message-ID: <20141119205646.GL6216@mentor.com>
References: <1416382491-11239-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416382491-11239-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-selinux][PATCH] ustr: Change the SRC_URI to upstream and add a new patch
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
X-List-Received-Date: Wed, 19 Nov 2014 20:56:56 -0000
X-Groupsio-MsgNum: 52945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dZihrQ6eCIduWT38"
Content-Disposition: inline

--dZihrQ6eCIduWT38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for the submission.  Just a couple of comments.

[[oe] [meta-selinux][PATCH] ustr: Change the SRC_URI to upstream and add a =
new patch] On 14.11.19 (Wed 15:34) Qian Lei wrote:

> Official upstream is still Ok, using it first.
> Add a new patch which is applied in Fedora20

As these are two unrelated issues, I think two patches would've been
appropriate with 1/2 being the one that updates the SRC_URI and 2/2
being the c99 patch.

You should also provide an upstream-status for the C99 patch.  As you
say it came from Fedora, odds are it is already submitted upstream, so
'pending' could be appropriate here, but I don't know.

Finally, meta-selinux patches should go to yocto@yoctoproject.org (cc'd
here), not the openembedded-dev@ list.

I'm fine with making the changes I described above or you can send out a
new version of the patch/patches if you like.  I won't do anything with
it before tomorrow, either way, to give everyone time to have a look.

-J.

>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  recipes-extended/ustr/ustr/ustr-c99-inline.patch | 44 ++++++++++++++++++=
++++++
>  recipes-extended/ustr/ustr_1.0.4.bb              |  8 ++---
>  2 files changed, 47 insertions(+), 5 deletions(-)
>  create mode 100644 recipes-extended/ustr/ustr/ustr-c99-inline.patch
>=20
> diff --git a/recipes-extended/ustr/ustr/ustr-c99-inline.patch b/recipes-e=
xtended/ustr/ustr/ustr-c99-inline.patch
> new file mode 100644
> index 0000000..5f2d5da
> --- /dev/null
> +++ b/recipes-extended/ustr/ustr/ustr-c99-inline.patch
> @@ -0,0 +1,44 @@
> +From 1b1c36ec67b7976d0bca0b6c7b766540cb541c1e Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Wed, 19 Nov 2014 14:48:18 +0800
> +Subject: [PATCH] c99-inline
> +
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +---
> + ustr-compiler.h | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/ustr-compiler.h b/ustr-compiler.h
> +index 642e6e8..63735e0 100644
> +--- a/ustr-compiler.h
> ++++ b/ustr-compiler.h
> +@@ -113,17 +113,23 @@
> + #endif
> +=20
> + #ifndef USTR_CONF_EI_PROTO /* external inline */
> +-# if USTR_CONF_INCLUDE_CODEONLY_HEADERS
> ++# if USTR_CONF_INCLUDE_CODEONLY_HEADERS || ! defined(__GNUC__) || \
> ++     ! USTR_CONF_COMPILE_USE_INLINE
> + #  define USTR_CONF_EI_PROTO static USTR__INLINE
> + # else
> + #  define USTR_CONF_EI_PROTO extern
> + # endif
> + #endif
> + #ifndef USTR_CONF_II_PROTO /* implementation of inline */
> +-# if USTR_CONF_INCLUDE_CODEONLY_HEADERS
> ++# if USTR_CONF_INCLUDE_CODEONLY_HEADERS || ! defined(__GNUC__) || \
> ++     ! USTR_CONF_COMPILE_USE_INLINE
> + #  define USTR_CONF_II_PROTO static USTR__INLINE
> + # else
> +-#  define USTR_CONF_II_PROTO extern inline
> ++#  if defined(__GNUC_STDC_INLINE__) || defined(__GNUC_GNU_INLINE__)
> ++#   define USTR_CONF_II_PROTO extern inline __attribute__ ((__gnu_inlin=
e__))
> ++#  else
> ++#   define USTR_CONF_II_PROTO extern inline
> ++#  endif
> + # endif
> + #endif
> +=20
> +--=20
> +1.8.3.1
> +
> diff --git a/recipes-extended/ustr/ustr_1.0.4.bb b/recipes-extended/ustr/=
ustr_1.0.4.bb
> index 6651a73..485e80d 100644
> --- a/recipes-extended/ustr/ustr_1.0.4.bb
> +++ b/recipes-extended/ustr/ustr_1.0.4.bb
> @@ -11,13 +11,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc79c6e2ae1=
3418d16d7dc82df960a1e7 \
>  		    file://LICENSE_LGPL;md5=3Dd8045f3b8f929c1cb29a1e3fd737b499 \
>  		    file://LICENSE_MIT;md5=3Dc61e779b782608472bd87593c3c3916f"
> =20
> -# Official upstream seems to be offline.. replace w/ a Fedora Project mi=
rror.
> -# http://www.and.org/ustr/1.0.4/ustr-1.0.4.tar.bz2=20
> -
>  SRC_URI =3D "\
> -    http://pkgs.fedoraproject.org/repo/pkgs/ustr/ustr-1.0.4.tar.bz2/9314=
7d9f0c9765d4cd0f04f7e44bdfce/ustr-1.0.4.tar.bz2 \
> +    http://www.and.org/ustr/${PV}/${PN}-${PV}.tar.bz2 \
>      file://ustr-makefile-fix.patch;patch=3D1 \
> -    file://ustr-fix__va_copy-not-defined.patch;patch=3D2"
> +    file://ustr-fix__va_copy-not-defined.patch;patch=3D2 \
> +    file://ustr-c99-inline.patch;patch=3D3"
>  SRC_URI[md5sum] =3D "93147d9f0c9765d4cd0f04f7e44bdfce"
>  SRC_URI[sha256sum] =3D "3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e4=
8f331fd99e1fc2c4"
> =20
> --=20
> 1.8.3.1
>=20
--=20
-Joe MacDonald.
:wq

--dZihrQ6eCIduWT38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUbQQOAAoJEEn8ffcsOfaW6L8IAL0RvvfdCEBw4t/tfO6eAgce
L7C0Vpqg+IPH/hmxMjJFmPts0SHA1lp7ybaCHHVe3VDkpJSyJJVNTgA7PA52Wklc
eJmN+5chuLQeefrZK5EKIKnK9382LfA3qM9cleLaElbUGtvu02uf6CosTRcnS2gZ
4D9oCnRxuW1SKV/o82u7C6gs/iugbY832g461QgQV/5WgO8IQVnt0Pz1728TFywN
oio6ocMDO/DZZfcsQpbLuM4Oblq7T08X/UbXFyV9tDxK6oEvc2z7P9XDkVM5UFRj
lJTUcRJvCdOHzndz3ckp7hQZ98dNvhVwRDNoXJIGOUnI1ynxc8Ww1yRT24cwG34=
=OVOV
-----END PGP SIGNATURE-----

--dZihrQ6eCIduWT38--
