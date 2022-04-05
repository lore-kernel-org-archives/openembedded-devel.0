Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07EEC4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:17 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.642.1649193406997026187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 14:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BjMOYOX/;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649193407;
  x=1680729407;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eOAuJjHhZFD3Vx8Sw6nyyGdfX9UvaUKdxVHPyvH441A=;
  b=BjMOYOX/px6zJWg/0yrSTZv+dMEk67SlqLJOzOOvDcSbh8iil8y5Jdip
   ms7hMPzluRmALnhwWmPQu2DNP59n96UGGcsPToVw8rV9lzZz0oNbMW1x0
   1bw9qwpGJjccOOwdiv8lyPoQ5zYOC3rT6eWRmECeNNSu4FRjr7XTECes5
   mpvIuPy+/qMywEAAyJOlLMN/hDq91bAACuFuu5wGrZOxkgYVGxaEPr6ED
   n6SQLTZbRopUJWsSPcsVDbC0H9N2DcN4AXCKvgoO51KgE8GpSImMX/qU0
   scgFAwQN0uGLMgd/Rd4IVkyPGWmkrBEXymMUwAkcB0cVlNKHUVIQCSHpm
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [hardknott][honister][meta-multimedia][PATCH] libsrtp:
 Switch branch from master to main
Thread-Topic: [oe] [hardknott][honister][meta-multimedia][PATCH] libsrtp:
 Switch branch from master to main
Thread-Index: AQHYQqNu8PWsWqC5gk68ZWjMwEdAxqzh3NrA
Date: Tue, 5 Apr 2022 21:16:45 +0000
Message-ID: <de9fdc8e6a454acab8520465378cb9a8@axis.com>
References: <16E08CCA6970D8F1.3304@lists.openembedded.org>
In-Reply-To: <16E08CCA6970D8F1.3304@lists.openembedded.org>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96436

*ping*

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 28 mars 2022 14:58
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [hardknott][honister][meta-multimedia][PATCH] libsrtp: Swit=
ch branch from master to main
>=20
> The master branch has been renamed to main in the github repo.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/m=
eta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
> index 5b4f34592..b494a3ca0 100644
> --- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
> +++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2909fcf6f09fff=
f8430463d91c08c4e1"
>=20
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "d02d21111e379c297e93a9033d7b653135f732ee"
> -SRC_URI =3D "git://github.com/cisco/libsrtp.git;branch=3Dmaster;protocol=
=3Dhttps"
> +SRC_URI =3D "git://github.com/cisco/libsrtp.git;branch=3Dmain;protocol=
=3Dhttps"
>=20
>  inherit autotools pkgconfig
>=20

