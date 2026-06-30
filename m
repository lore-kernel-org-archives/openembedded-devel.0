Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C47AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:33:02 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18284.1782815578616867143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 03:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tafhub.de header.s=dkim header.b=kc4zEYad;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id CED621880F26;
	Tue, 30 Jun 2026 12:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1782815575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VvsTYjL/Mg3JlhMjiC5g/tygyEnFglQF2meIoVnjnVk=;
	b=kc4zEYadw0Z0kKL7Cw5Rt5Kn3Gsye7t5uIcVlOdnIJTbtDXUntNIh9Tt2V9R88V7Zy3ZO2
	VB15MKmwbZZen2SJbwaaFRfC5BS4tvBi92hhnsWWj3ai8wTjeztPZdx/nr2WGGX44jdAGx
	sxje/xauMdfZptZG78X+4YY/DWsJj1UoTzJgiitis3he1/tLvjD2vhk90/1UNhcF/aFNMv
	u060U8zG3vBcgNSAGyO7yzjSqp2VYViblwQquq2Dd06gQdvpy5Vmku2F9J/oWTedvWudfk
	JJKxJUzvCghEA9dEzuwCFvbMHqGQ8HmZlbVWhW8Ob6mSVF9gzmvOaed4f6BY3w==
From: "Tafil Avdyli" <tafil@tafhub.de>
In-Reply-To: <20260630092206.322-3-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
References: <20260630092206.322-1-wangmy@fujitsu.com> <20260630092206.322-3-wangmy@fujitsu.com>
Date: Tue, 30 Jun 2026 12:32:53 +0200
Cc: openembedded-devel@lists.openembedded.org
To: wangmy@fujitsu.com
MIME-Version: 1.0
Message-ID: <9b39742f-4fb5-7b0b-6a1c-578fd49b44d8@tafhub.de>
Subject: =?utf-8?q?Re=3A?= [oe] [meta-oe] [PATCH 03/37] =?utf-8?q?fastfetch=3A?= 
 upgrade =?utf-8?q?2=2E64=2E2?= -> =?utf-8?q?2=2E65=2E2?=
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 10:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127980

Hi,

this update needs changes to packageconfig.

drm-amdgpu got dropped and replaced by raw ioctl calls [1].

libva usage got split into two [2]:
-PACKAGECONFIG[vaapi] =3D "-DENABLE=5FVA=3DON,-DENABLE=5FVA=3DOFF,libva=
"
+PACKAGECONFIG[va-drm] =3D "-DENABLE=5FVADRM=3DON,-DENABLE=5FVADRM=3DOF=
F,libva"
+PACKAGECONFIG[va-x11] =3D "-DENABLE=5FVAX11=3DON,-DENABLE=5FVAX11=3DOF=
F,libva"

Unsure if it is better to merge into one packageconfig feature:
PACKAGECONFIG[libva] =3D "-DENABLE=5FVADRM=3DON -DENABLE=5FVAX11=3DON,-=
DENABLE=5FVADRM=3DOFF -DENABLE=5FVAX11=3DOFF,libva"

Best regards
Tafil

[1]: https://github.com/fastfetch-cli/fastfetch/commit/55eb3c59d4d314d5=
61b9bdc7226bf1ec1a5f9d5e
[2]: https://github.com/fastfetch-cli/fastfetch/commit/eff0108bb542b40a=
72644d2c76e9c1898f05be3e

On Tuesday, June 30, 2026 11:21 CEST, "wangmy via lists.openembedded.or=
g" <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../fastfetch/{fastfetch=5F2.64.2.bb =3D> fastfetch=5F2.65.2.bb}    =
  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fastfetch/{fastfetch=5F2.64.2.bb =3D>=
 fastfetch=5F2.65.2.bb} (98%)
>=20
> diff --git a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb =
b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> similarity index 98%
> rename from meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb
> rename to meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> index 8a953508eb..cf1410a96d 100644
> --- a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb
> +++ b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> @@ -11,7 +11,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D2090=
e7d93df7ad5a3d41f6fb4226ac76"
>  DEPENDS =3D "yyjson"
> =20
>  SRC=5FURI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3D${PV}"
> -SRCREV =3D "636471c3669201b37fca587e2882eaf3c7062aeb"
> +SRCREV =3D "0e90f3a7d4ac5a7857a968a6f52ea1205be5f404"
> =20
>  inherit cmake pkgconfig
> =20
> --=20
> 2.43.0
>


