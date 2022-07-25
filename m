Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC89AC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 12:37:17 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.27606.1658752628147827049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 05:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=i09UcX0l;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1658752628;
  x=1690288628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RpDSY9mA0V8RyG/Wh6UJIjYoV1GoIzDgp/Rdw7iXGK0=;
  b=i09UcX0lJy8fOfyQ9L0GOIu4vT/hDskwOABiktZtE9qvPUK1/TmxEKtF
   YepeMsUYfqjn6kHh0MlzaGiC8HfuSGIbLJSIusn+EIESIAdyIExoNVrlb
   c5iee+BdNUnzYeM0Pxa/rZ1st8mxmgT1zgiG9NXAlQr6h3tcAq3lNBpgU
   WUIRZFpHNmvpfJHF92ldzKWLIymkeDM3wQux5CfLZe9zt7nMexqoxF4Mo
   E3/2+6glXF76b7cpICzlHy0isvgO+p0hRlZ3bDlLmzOdAxcoJToD2nwVX
   GyKE2bKCZ3gffLxd6G5orzJRlssZmu+gxQ/MrlMdRc6ts4nEp/dilrDqF
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [master][kirkstone][meta-oe][PATCH] libwebsockets: Avoid
 absolute paths in *.cmake files in the sysroot
Thread-Topic: [oe] [master][kirkstone][meta-oe][PATCH] libwebsockets: Avoid
 absolute paths in *.cmake files in the sysroot
Thread-Index: AQHYZIg3IE2EvxaaQk+YmOs2qus82q2PfMkQ
Date: Mon, 25 Jul 2022 12:37:06 +0000
Message-ID: <fcc5e5d6a94242be8156c39320eda243@axis.com>
References: <16EDCA27BD1173D2.21694@lists.openembedded.org>
In-Reply-To: <16EDCA27BD1173D2.21694@lists.openembedded.org>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 12:37:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97969

Please cherry-pick this to Kirkstone.

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 10 maj 2022 18:08
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [master][kirkstone][meta-oe][PATCH] libwebsockets: Avoid ab=
solute paths in *.cmake files in the sysroot
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb  | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2=
.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
> index a5fcb8d72..2a3a4ebd0 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
> @@ -41,3 +41,6 @@ RDEPENDS:${PN} +=3D " ${@bb.utils.contains('PACKAGECONF=
IG', 'libuv', '${PN}-evlib-
>  RDEPENDS:${PN} +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${=
PN}-evlib-ev', '', d)}"
>=20
>  RDEPENDS:${PN}-dev +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'static'=
, '${PN}-staticdev', '', d)}"
> +
> +# Avoid absolute paths to end up in the sysroot.
> +SSTATE_SCAN_FILES +=3D "*.cmake"

