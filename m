Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD15772C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:38:30 +0000 (UTC)
Received: by wmww144 with SMTP id w144so21012329wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6H1aCTebnwYkYDgLQpMJp8vqTjSuisZxqwdDROldZzM=;
	b=dA3hRF4MFFbrQf2pl6CzA1Uw0zEMFDxQcXyofs/sr5Jinay3ubKaFgTcl7FEjS5yAL
	7jR6PlqYK0h/IO3QlF6f/zP7XovMub8p3ADhZB7HxT3My4qtVC+Y6WXROIqPj2R2r5xB
	BKQxeKXmFJ6EtST8ein4j9m3SQdP6Pd5CmIEwhJsjJaQ+UhU6U7/+fjafsfq4NOlNDMo
	EbFQx4bf/qoQtYLfI7Vg5sRsekSooStu/wpgR+qYpBR1489V4xFI3rpPZnveUW7JfSAu
	ML2mOajBF4GR/TOdPJlEM1QXcUmmlURRFqpux9jXJgosXbfWohBw/puSgAkbxowwvsaA
	wCkQ==
X-Received: by 10.28.4.7 with SMTP id 7mr2477112wme.85.1447407510897;
	Fri, 13 Nov 2015 01:38:30 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	jh4sm18947085wjb.33.2015.11.13.01.38.29
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 01:38:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1447359445-27258-2-git-send-email-kergoth@gmail.com>
Date: Fri, 13 Nov 2015 10:38:28 +0100
Message-Id: <39CE9B1B-A0D2-4186-90B5-79281E821017@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Fri, 13 Nov 2015 09:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 12.11.2015 um 21:17 schrieb Christopher Larson <kergoth@gmail.com>:
>=20
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> These will depend on libattr if it's available, and we need =
deterministic
> builds. This fixes a build-deps failure which occurs when attr is =
built before
> them. There's currently no configuration option to explicitly control =
this
> dependency, and I don't know enough about waf to add such an option, =
so
> unconditionally dep on it for now.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb        | 1 +
> meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb | 2 +-
> meta-oe/recipes-support/talloc/talloc_2.1.1.bb        | 1 +
> 3 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb =
b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> index 0b9e1f2..e349187 100644
> --- a/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> +++ b/meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
> @@ -1,6 +1,7 @@
> SUMMARY =3D "The tdb library"
> SECTION =3D "libs"
> LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +DEPENDS +=3D "attr"
>=20
> LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
>                     =
file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff39f19dfec=
6d293b95dea7b07891"
> diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb =
b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> index f297f30..c37eeb3 100644
> --- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> +++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://tevent.samba.org"
> SECTION =3D "libs"
> LICENSE =3D "LGPLv3+"
>=20
> -DEPENDS +=3D "talloc libcap"
> +DEPENDS +=3D "talloc libcap attr"
> RDEPENDS_${PN} +=3D "libtalloc"
> RDEPENDS_python-tevent =3D "python"
>=20
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb =
b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> index 89c390f..7931374 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> @@ -2,6 +2,7 @@ SUMMARY =3D "Hierarchical, reference counted memory =
pool system with destructors"
> HOMEPAGE =3D "http://talloc.samba.org"
> SECTION =3D "libs"
> LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +DEPENDS +=3D "attr"
>=20
> SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
> LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
> --=20
> 2.2.1

RDEPENDS is wrong for deterministic builds, since they leave a race =
condition open that attr is build parallel to libtevent
and 2nd build is different to first build.

If you want, I handle that better in a patchy way I discussed with JaMa =
yesterday in #yocto (patch check out depending on PACKAGECONFIG)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


