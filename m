Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DB3757284C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 20:00:05 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1YAl9g-0006bg-Kf from Joe_MacDonald@mentor.com ;
	Mon, 12 Jan 2015 12:00:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 12 Jan 2015 12:00:03 -0800
Received: by burninator (Postfix, from userid 1000)	id 90F005809F6; Mon, 12
	Jan 2015 15:00:00 -0500 (EST)
Date: Mon, 12 Jan 2015 15:00:00 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Message-ID: <20150112200000.GF6167@mentor.com>
References: <1416473037-23326-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416473037-23326-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-selinux][PATCH 1/2] ustr: Get source from official upstream instead of Fedora Project
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
X-List-Received-Date: Mon, 12 Jan 2015 20:00:15 -0000
X-Groupsio-MsgNum: 53813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline

--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Clearing out the meta-selinux queue.  This has been merged with one
minor tweak, PN -> BPN in the SRC_URI.

Thanks.

-J.

[[meta-selinux][PATCH 1/2] ustr: Get source from official upstream instead =
of Fedora Project] On 14.11.20 (Thu 16:43) Qian Lei wrote:

> Official upstream is still OK, so we use it first
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  recipes-extended/ustr/ustr_1.0.4.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/recipes-extended/ustr/ustr_1.0.4.bb b/recipes-extended/ustr/=
ustr_1.0.4.bb
> index 6651a73..d1f3d93 100644
> --- a/recipes-extended/ustr/ustr_1.0.4.bb
> +++ b/recipes-extended/ustr/ustr_1.0.4.bb
> @@ -11,11 +11,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc79c6e2ae13=
418d16d7dc82df960a1e7 \
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
>      file://ustr-fix__va_copy-not-defined.patch;patch=3D2"
>  SRC_URI[md5sum] =3D "93147d9f0c9765d4cd0f04f7e44bdfce"
--=20
-Joe MacDonald.
:wq

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUtCfAAAoJEEn8ffcsOfaW6m8H/RdluFW0nstAsdWiYgXHsqCD
aCve9ABSLDr2QJ0utQEHOkwGvR9PI1brt+u4PLBSrYiVwOLvawQz82f/ar5WZ3MU
XZ6GQLTHDLBweUfzTsf6V2nIxl2wd3P9f37AD9MSiCE1x+9TXwaVQi2hvp+th0Ct
/o6FycPCMYlv8IobI+vzh+wkXDLus4PcTS4Rr2mtEooWShxhKPNHA3a8tdlBEKYX
Am9QBRdzMwxPM5SZ+DGEYeNlC/FCwhkakjn8Mt914oOHrL0+GFZIQ4CDzHJSNHB7
jSkEsv3J2uysGvuTwu33EFRv2ByTU0PQCxOM1wDFyP4HNYSDU0GvsLHxdFEqkL8=
=CC+P
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
