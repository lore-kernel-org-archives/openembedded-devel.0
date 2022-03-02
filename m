Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9912C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 14:49:36 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.8019.1646232574179474950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 06:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=DdcAPmUV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646232574;
  x=1677768574;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0ZfENlXUfAt/cerT64UvJnySIU9UgXNJ4IuQmqvKzys=;
  b=DdcAPmUVwOljn94ZAiFiSSmNmzZLKnjsmFUhffuODEgk6DBosvtAcK8E
   jvUwlqpfDjfdrjlh0YQ3i5aQaGJbjBxs9zZbanYab24D96ffcUqyha0KU
   sYS0aVgZX+LF49aYoUcbx9Av598bMIAxLfuwvnBtvkLfuXGYEd/TG5ylm
   f9g37I+v+/hvEfoK1eqpk7mO4LvGK6oTSOBs1ADRe3Jwpj4gIVqQxUVBP
   5kn7dJdSoA5wg6hytSY8YCW9Yr1q0lfVSnArgV52SqG8mJKPO1yxUNSEy
   xMQDJ1m2shiKDndfI7t2TDVH2FHyg4nzOxAYsriQCXiJabhBPbb0mCTEl
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Justin Bronder <jsbronder@cold-front.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python][PATCH] python3-pyscaffold: fix wheel build and
 license
Thread-Topic: [oe] [meta-python][PATCH] python3-pyscaffold: fix wheel build
 and license
Thread-Index: AQHYLbntNjSiqLMYRk+WApwL8jPegKysLMNg
Date: Wed, 2 Mar 2022 14:49:30 +0000
Message-ID: <2889da1e5fda4609aec7aa8d4a1651b0@axis.com>
References: <20220301221548.30730-1-jsbronder@cold-front.org>
In-Reply-To: <20220301221548.30730-1-jsbronder@cold-front.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 14:49:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95689

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Justin Bronder
> Sent: den 1 mars 2022 23:16
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-python][PATCH] python3-pyscaffold: fix wheel build an=
d
> license
>=20
> Without python3-setuptools-scm-native, the version on the generated
> wheel is 0.0.0, not ${PV} as expected which causes
> pip_install_wheel_do_install to fail to find the wheel.
>=20
> Consulting the LICENSE.txt distributed with the source, the template
> files under pyscaffold.templates, which are installed as part of this
> recipe, are licensed as BSD-0-Clause
>=20
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  .../recipes-devtools/python/python3-pyscaffold_4.1.4.bb     | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-
> pyscaffold_4.1.4.bb b/meta-python/recipes-devtools/python/python3-
> pyscaffold_4.1.4.bb
> index 7e5599e4aa..f58fc5e9aa 100644
> --- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
> @@ -5,8 +5,8 @@ used to create template Projects."
>=20
>  HOMEPAGE =3D "https://github.com/pyscaffold/pyscaffold"
>  SECTION =3D "devel/python"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D82=
27180126797a0148f94f483f3e1489"
> +LICENSE =3D "BSD-0-Clause & MIT"

The official SPDX identifier is (weirdly enough) "0BSD".

> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D14a49c74a1d91829908ac756c=
07e6b91"
>=20
>  inherit pypi setuptools3
>=20
> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] =3D "46a2bbdf255ba2efc6c56ae1428249b=
61d56c4a3e54ef3db0d05fa9779
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> +DEPENDS +=3D "python3-setuptools-scm-native"

Build dependencies typically go near the start of the recipe,=20
i.e., between LIC_FILES_CHKSUM and inherit.

> +
>  RDEPENDS:${PN} +=3D " \
>  	python3-email \
>  	python3-compression \
> --
> 2.35.1

//Peter


