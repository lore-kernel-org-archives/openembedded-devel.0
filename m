Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD36E7717D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD2mr63026905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 18:48:53 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 12 Nov 2015 18:48:53 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on attr
Thread-Index: AQHRHYde2SDKSY49CUKJu+iC9PBsvJ6ZO8zQ
Date: Fri, 13 Nov 2015 02:48:52 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
In-Reply-To: <1447359445-27258-2-git-send-email-kergoth@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend on attr
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
X-List-Received-Date: Fri, 13 Nov 2015 02:48:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> Sent: Friday, November 13, 2015 4:17 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Christopher Larson
> Subject: [oe] [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on att=
r
>=20
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> These will depend on libattr if it's available, and we need deterministic
> builds. This fixes a build-deps failure which occurs when attr is built b=
efore
> them. There's currently no configuration option to explicitly control thi=
s
> dependency, and I don't know enough about waf to add such an option, so
> unconditionally dep on it for now.

I added depends on libcap  for libtevent for the same reason days ago, but =
it really concern
me now, the 'libreplace' in these waf based packages check many packages(I =
see
libbsd, libcap, libacl for now) existence then build with them if found, an=
d there
is no configure option to disable them, does anyone has a better idea how t=
o
make waf build in deterministic way? Maybe we should disable the built-in
libraries 'libreplace' or add a PACKAGECONFIG for it?

Thanks,
Jackie

>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb        | 1 +
>  meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb | 2 +-
>  meta-oe/recipes-support/talloc/talloc_2.1.1.bb        | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb b/meta-oe/rec=
ipes-
> support/libtdb/libtdb_1.3.0.bb
> index 0b9e1f2..e349187 100644
> --- a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> +++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> @@ -1,6 +1,7 @@
>  SUMMARY =3D "The tdb library"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +DEPENDS +=3D "attr"
>=20
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-
> 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
>                      file://${COREBASE}/meta/files/common-licenses/GPL-
> 3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb b/meta=
-oe/recipes-
> support/libtevent/libtevent_0.9.21.bb
> index f297f30..c37eeb3 100644
> --- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> +++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://tevent.samba.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPLv3+"
>=20
> -DEPENDS +=3D "talloc libcap"
> +DEPENDS +=3D "talloc libcap attr"
>  RDEPENDS_${PN} +=3D "libtalloc"
>  RDEPENDS_python-tevent =3D "python"
>=20
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/rec=
ipes-
> support/talloc/talloc_2.1.1.bb
> index 89c390f..7931374 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> @@ -2,6 +2,7 @@ SUMMARY =3D "Hierarchical, reference counted memory pool =
system with
> destructors"
>  HOMEPAGE =3D "http://talloc.samba.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +DEPENDS +=3D "attr"
>=20
>  SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-
> 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> --
> 2.2.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

