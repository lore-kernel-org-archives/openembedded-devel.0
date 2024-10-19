Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3336ED3C91E
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 16:18:04 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.8982.1729354674367253140
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 09:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9+v8bRW;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71806621d42so1451722a34.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729354673; x=1729959473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1eVxb1M2vBeNLIQWDntLcemPDGCuJooom1XPX3hk9o=;
        b=N9+v8bRWSz6qhXXwIDYEQyfjtZCSAnU2lvHnabtaHyG15un3GSDCawh+Ifl5FgNfmr
         Tra4q+MuhYbzJGfqbIvuqs6LVgwKlSTa6arQpNvQrZlleTes9523tkmV4IXPADCexGov
         bCih6mrv3W/DBNC4TtGq96DesshjeNuCIQr5agYX+ZjO4zffdwHBSVLO0ETq7Ss5cVRk
         e7K0aUT+slvH5deGsguCLgmiSOdKURTxkHgokqI0I2P4IPZQ7eKL4/PgmkDjR8r0xfMB
         UfFMCcE2C8pw1iYHOpATXHWHr3HIa+7Qew1FfgZ1fK+uvgfCSA64EzJmOerYfd4V0GV2
         3yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729354673; x=1729959473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1eVxb1M2vBeNLIQWDntLcemPDGCuJooom1XPX3hk9o=;
        b=EIhmfI3Svi+on8PlUffzfZF7YxHi9XZOTD9QIMoeQbOBVEcEBt1/JVtVo7gbJGf9h+
         hvBWeHSEi0KJv5LXVAA+zrMcKPzKlXtKJ1wPDWu4gWYPUnBlBeKRpcpS9K+Q//7jf/m/
         Kfks742srO7Znt3nQzUbWEVT/+r045OA3fddcqf3iC3FIh8H4cONLvzQHoaYZ2Aye7M+
         NG/EgT/vDQ4lF8fKe0RXurdFncQjjmMEtDgb4+Hkpa+XPwDSn79vCZrlK2qrPcxctCRx
         WIKgYJDA4BUnWiRo99Sxl93ETtqebb5wVooVC/ZvHyVZ+TgSfIPo2n6SHFKgPqR/wj0o
         gLHA==
X-Gm-Message-State: AOJu0Yy4t8s+aypqARU2IeVLDKW3eOYtfWMogUIKkdh6JuIuDS76kS4Y
	1TCZ3fc0zQ99kJyd+g2pvhMq9pg18qxlNX825tcvBdwio2MhvRMkJDaeNZkWVXz3WBjPSP1x0y0
	wjR/j0MjA6hMpokV+sLRTvPnz6b8=
X-Google-Smtp-Source: AGHT+IEQelK1mBAG23Y3RsAhkMkpvvaQSmROsOF4ZBfUwYVXg3nhqL/nmH9fs6vQXVaB9FqBaECxLIEAobtxdprPYlo=
X-Received: by 2002:a05:6830:4424:b0:718:75f:9321 with SMTP id
 46e09a7af769-7181a86038fmr5353017a34.18.1729354673433; Sat, 19 Oct 2024
 09:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241019153231.175637-1-sanakazi720@gmail.com>
In-Reply-To: <20241019153231.175637-1-sanakazi720@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Oct 2024 09:17:26 -0700
Message-ID: <CAMKF1sqjGTMz5Fg1BvCdi5q_w13Xwq+S8d-RQxCa1Nv_RMPwSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x
 releases the same
To: sanakazi720@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 16:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113061

Thanks for fixing it. I would like to suggest couple of things

1. Use patch version number when its reworked and sent again v1, v2, v3

and in the trailer document changes between versions, it helps
reviewers with context between two patch versions.
eg. see https://www.kernel.org/doc/html/v4.14/process/submitting-patches.ht=
ml#the-canonical-patch-format

On Sat, Oct 19, 2024 at 9:10=E2=80=AFAM Sana Kazi via lists.openembedded.or=
g
<sanakazi720=3Dgmail.com@lists.openembedded.org> wrote:
>
> OpenSSL's soversion will not change for any 3.x minor release.
>
> https://www.openssl.org/policies/general/versioning-policy.html
>
> Signed-off-by: Sana <sanakazi720@gmail.com>
> ---
>  .../0002-detect-correct-openssl-3.x.patch     | 28 +++++++++++++++++++
>  .../recipes-support/libp11/libp11_0.4.12.bb   |  4 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libp11/files/0002-detect-corr=
ect-openssl-3.x.patch
>
> diff --git a/meta-oe/recipes-support/libp11/files/0002-detect-correct-ope=
nssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0002-detect-correct-o=
penssl-3.x.patch
> new file mode 100644
> index 000000000..b56e2602d
> --- /dev/null
> +++ b/meta-oe/recipes-support/libp11/files/0002-detect-correct-openssl-3.=
x.patch
> @@ -0,0 +1,28 @@
> +From 74497e0fa5b69b15790d6697e1ebce13af842d4c Mon Sep 17 00:00:00 2001
> +From: Mike Gilbert <floppym@gentoo.org>
> +Date: Thu, 13 Jul 2023 13:52:54 -0400
> +Subject: [PATCH] configure: treat all openssl-3.x releases the same
> +
> +OpenSSL's soversion will not change for any 3.x minor release.
> +
> +https://www.openssl.org/policies/general/versioning-policy.html
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/74497=
e0fa5b69b15790d6697e1ebce13af842d4c.patch]
> +Signed-off-by: Sana Kazi sana.kazi@kpit.com
> +
> +diff --git a/configure.ac b/configure.ac
> +index b96979d9..c344e84a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
> + # issues with applications linking to new openssl, old libp11, and vice=
 versa
> + case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
> +        $PKG_CONFIG --modversion openssl`" in
> +-       3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
> ++       3.*) # Predicted engines directory prefix for OpenSSL 3.x
> +            LIBP11_LT_OLDEST=3D"3"
> +            debian_ssl_prefix=3D"openssl-3.0.0";;
> +        1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.x
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-oe/re=
cipes-support/libp11/libp11_0.4.12.bb
> index 223778200..87b26bf01 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> @@ -9,7 +9,9 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be894bab9bc501572864=
b29"
>  DEPENDS =3D "libtool openssl"
>
> -SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;protocol=
=3Dhttps"
> +SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;protocol=
=3Dhttps \
> +    file://0002-detect-correct-openssl-3.x.patch \
> +"
>  SRCREV =3D "53d65dc48cf436694f7edcfc805414e608e8a2bf"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113060): https://lists.openembedded.org/g/openembedde=
d-devel/message/113060
> Mute This Topic: https://lists.openembedded.org/mt/109099694/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

