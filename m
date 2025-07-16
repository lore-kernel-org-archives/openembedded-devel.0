Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CE7C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:54:24 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.15984.1752648859433904517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmYVpnx0;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-710bbd7a9e2so57917217b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648858; x=1753253658; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLAvM4QCvldh7g76u6k+bPnbb1DZ33lTsVQeUXsCaEQ=;
        b=ZmYVpnx0O0dSDy8OKheDYCjLD7fxngUUR8OvE672KFJk1VFrMH3vhbpGl+uXgB6gYH
         sBag2TANxDg7DUA8eGPc7QdwxoGJAIFkZtRhEzsHNA0dbaLzhDa2UtPMDI+igA9NWWhD
         c/pJ49FxekD2dTE15+kYDhrcX+0/cIkstG9zUl9yqqejEF7SMNn2hbqDh7XfIi7/Trmt
         schbSmxBe8ZnU20MtFnPEqDC/ZkIcqsfI47XSL4WoDxGezvi2X7NtBT76ndPc+V1bW5D
         HIppz8H5L5Zh/5YYwGApTxnQecgSaN7WKuzlQkmkFtIHLl10bRX2qKb7iigmblbbibqm
         0iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648858; x=1753253658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLAvM4QCvldh7g76u6k+bPnbb1DZ33lTsVQeUXsCaEQ=;
        b=qssOh///sXtx+vtto0EHQyW6e2W+d1Ava7Jn2UXiyzwMT+wf0cu5pGSNZsuyODx8ql
         LtjPzSZrZmjxx6us6CxP2qwokeou6Ol6Q69dLlyQtFsvPaarEGeaSHn0qp4euGGbWzLU
         ZLAVNnPBLtlJ7A5WeacjE0B7PSoahktX9VHlHXKwbmWV0Ab4V/NmTtg6lP67hQMNlEps
         6qQS1mnytonMs4lDfEYmS2tUAuqEY/BZtmjN2SVHVnyk/WS/wTOQuEhcJNGP8ktc7/kH
         66NMtD6SsHkAbcP8rD+yYZpPWkehaQ7dkUYKFTmK/x/LrZTDfLQHdksi4je8mK9tzYwe
         NqfA==
X-Gm-Message-State: AOJu0YzYFP/3/QazrpI6hxWKUIC7qjjuD5nXnJ3+5r2nfXKK6fvAu06I
	kLalKprggfnLtafd+Aj52ewA/uKk8nWEjc+JNJdZo8xWhMKRhuTIglG9WEUlQgeEQ8lVXPD+09v
	2+wP6VNC6ZDsuA2QJ3ASThYngBy/SIfM=
X-Gm-Gg: ASbGncvKfTeO5/jbTQH+miiUAz9os5drfJRTjXASItYhndEX3ZH2YiKbW1Aa8PlftBb
	uS1bcThWvCgfgLHBrnFiHDNQJF6IEU/fx/ifacXxuAA9NH4P54YcGrBK1w3DZzozD+uMLB1gOXV
	enjs8+xGDBrKSf4hWDiU7NedUeFTBoCuxcA2Qq8GgQPtGpWpCzrf4u4pmj+qCbCt5m1MT3Svxg6
	w3VYg==
X-Google-Smtp-Source: AGHT+IFYolEIhzfq8PCa2RvbPo72EQOQIDW7JoWQnlrteXleXAPCq1Hc2KwoNnJi2VJ9aLpOT7g0gk4EW9SuuVPy4NQ=
X-Received: by 2002:a05:690c:9c0f:b0:712:d824:9202 with SMTP id
 00721157ae682-71837126dabmr18647357b3.9.1752648858353; Tue, 15 Jul 2025
 23:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250715161434.8940-1-gudni.m.g@gmail.com>
In-Reply-To: <20250715161434.8940-1-gudni.m.g@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jul 2025 23:53:52 -0700
X-Gm-Features: Ac12FXzf4h5lHuTNG_SFrJAySNnibyNo4t-D9xzfkDDhGgo9ahtPnoAJdPjHazc
Message-ID: <CAMKF1spbXVjxYi8+O4nKQ3bis6Pbc-Ox9f8KjgqmK6LUaqF9mQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: upgrade 3.6.3.1 -> 3.6.4
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118589

This fails to build

from mbedtls_framework import config_common
ModuleNotFoundError: No module named 'mbedtls_framework'

for detailed logs see
https://errors.yoctoproject.org/Errors/Details/872324/

I guess we need to add recipe for native python-mbedtls module

On Tue, Jul 15, 2025 at 9:14=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Fixes several security vulnerabilities:
> CVE-2025-49601, CVE-2025-49600, CVE-2025-52496,
> CVE-2025-47917, CVE-2025-48965, CVE-2025-52497,
> and CVE-2025-49087
>
> Changelog:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  .../mbedtls/{mbedtls_3.6.3.1.bb =3D> mbedtls_3.6.4.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.1.bb =
=3D> mbedtls_3.6.4.bb} (97%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> similarity index 97%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.=
bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 0b64d661c4..3f8938bb82 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -22,11 +22,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d581993=
7a6c2f1ef1630d341e026d"
>
>  SECTION =3D "libs"
>
> -SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV} \
> +SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6;tag=3Dv${PV} \
>             file://run-ptest \
>             "
>
> -SRCREV =3D "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
> +SRCREV =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118564): https://lists.openembedded.org/g/openembedde=
d-devel/message/118564
> Mute This Topic: https://lists.openembedded.org/mt/114169589/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

