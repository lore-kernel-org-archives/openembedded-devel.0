Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C00D46CABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:06:18 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so2062636wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 05:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=yeaHTHNXw0JmbPkp8G+2QZqDguzisCSBEq4RGzODXno=;
	b=BXuKCqbfTwRUPesuf41JI5HT0MEYIC6gbM6TMJxTocnpfqRvT2EVU0dq7LwHonJvCf
	DvpVD9PgDRNOTkwnx5OvlgX1bc6PYsdknH0WOrW2xwhf5ONQKZh5alp0a/P3ieTLxjTT
	WEuAvKBshn9nlFomDUDLI751GfRfvoM1sILcX5pvCfSl32KF2aCt1Jg69M1WUYj+Xt4x
	3BWlC1wlBdxOV83EEXqZdcB0XiDyzUQmBS6M4CXMMC93A0TvcMbCCUhf3jA+x1h3PsVA
	BWocSvqWjg5+k0Ys9RhWNYgIiNLaC35er2dPgWEDz4hJzl/wWIKUe8mpGSgfbz+a1naY
	+BUA==
X-Gm-Message-State: ALoCoQmfa8chZ1Lyn3zOL44VNsgsxwwDVwbFmqYLTgZPuB0BmmltoksRswVMcUgAdlmaczIFbtnx
X-Received: by 10.194.93.3 with SMTP id cq3mr34465467wjb.26.1381838779885;
	Tue, 15 Oct 2013 05:06:19 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id b13sm5551650wic.9.2013.10.15.05.06.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 05:06:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
Date: Tue, 15 Oct 2013 14:06:16 +0200
Message-Id: <61507A97-CE1F-49BE-BC95-8B8F9AD4D54F@dominion.thruhere.net>
References: <1381837057-9403-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 12:06:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 okt. 2013, om 13:37 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> License files changes:
> + * This file was part of the Independent JPEG Group's software:
>   * Copyright (C) 1991-1998, Thomas G. Lane.
>   * Modified 2002-2009 by Guido Vollbeding.
> - * Copyright (C) 2009-2011, D. R. Commander.
> - * This file is part of the Independent JPEG Group's software.
> + * Modifications:
> + * Copyright (C) 2009-2011, 2013, D. R. Commander.
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Acked-by: Koen Kooi <koen.kooi@linaro.org>

> ---
> meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb =
b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index 4fd258f..f18d37d 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -3,12 +3,11 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
>=20
> LICENSE =3D"BSD-3-Clause"
> LIC_FILES_CHKSUM =3D =
"file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5b2a0e6457a6cfe21d \
> -                    =
file://jpeglib.h;endline=3D14;md5=3D7bb9a39828a1b1e84acd4e8aec1e5532 \
> -                    =
file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5dfc0e21ec902cb33 \
> +                    =
file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a9f8da313cc4015ed6f \
> +                    =
file://djpeg.c;endline=3D13;md5=3D03db065044529233c296324be85530ab \
> "
> -PV =3D "8d+1.2.1"
> -PR =3D "r2"
> -SRCREV =3D "837"
> +PV =3D "8d+1.3.0"
> +SRCREV =3D "988"
> SRC_URI =3D =
"svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=3D=
https;module=3Dtrunk"
>=20
> S =3D "${WORKDIR}/trunk"
> --=20
> 1.8.1.2
>=20


