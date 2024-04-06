Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF3AC3A59D
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 01:04:15 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.2938.1712365454912328356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 18:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dZq4MRfu;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e696ee8fa3so1996450a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712365454; x=1712970254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMNz4LbrEqWayFwMeJ4js+tfxDcReTIE3mbcdkXY3mU=;
        b=dZq4MRfudc3CfGWW80x49YoCtSX3AKiDLfbuBIDpmuax6tqbIrVCt9PGMcatfAVs6J
         5oDVxKWGUzQHIkztEAzE8I+5xlyL/tlMqv3vJ1xFLv/NWx0Vo9rrW0QRt6UvFDwGn4i5
         CvDqeA+k1STvvnU1eQ4eM2IoYNX0J0hHnMO8p11QNb+Tpb34XXUlIy+N1ZcCluH8hxnO
         ddLqer3qqnqW+Yp4aFnFPW1VguI0jOOkAxgVbfWTMFRNDpUHlDBy91SwdCJhuMi7TTaL
         mwwSYa9lhRl5GwKbyU0uGf+ntYpjzHSRA+sgT6wIzQQij9p5yb+xdPPw5ifIJnX1nBkZ
         v01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712365454; x=1712970254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMNz4LbrEqWayFwMeJ4js+tfxDcReTIE3mbcdkXY3mU=;
        b=gV4/ImxA+5QJ8HckP62ap7dx4XopOYb0sedfNC4xRCsGTq4hLKb/zTMcvIwCOgZ0qc
         JNTPmQiVUGgWBpH2jlivEteiVm0EZkgvXq14lyTY8XzT/XggHpA1MTYI/YfgYV/6urnZ
         Uf+mCNmMD2LABHn3iVJfndM6ZdIuACBvzsNp+zsR49CG1s2SJi2u7TkdfqpohOXkv6e2
         xliv7nYM8SGRSrpjNcmKO0+Fq1EFgsv/gdddRi5S7XXg5WgV1AzaNiw5rqalzZA2PMv/
         fjcksXTwhfBqxLtE5auPJpb80LSZg8hEVYP64v9k1oXpziNVJ4+YRKrz52pDMuTO9yNG
         tOcQ==
X-Gm-Message-State: AOJu0YxqpWKXsfBduGtemMMpdrsVIK4FyAugOR/SDw8inmX8b6SXxfo2
	6vMQljcaYOCRDSSWQWF8TLBoAYhsaSlr/KE3utXvjBhoL71UGCQBwJVHpMTb9LBA95ps+thK/xs
	oy5wOOllollFG8RPE6saHRiiFUig=
X-Google-Smtp-Source: AGHT+IGYTsJIgaFAxAD+uSn3gnHWNf6ncMux9YpSODpAVi38IE6tK8pvF5E7EApKD28e28Sx5iiVXHH6LUUW04EZ7yc=
X-Received: by 2002:a05:6870:828e:b0:22e:c37c:4536 with SMTP id
 q14-20020a056870828e00b0022ec37c4536mr1304125oae.2.1712365454024; Fri, 05 Apr
 2024 18:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
In-Reply-To: <20240405162459.1286945-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2024 18:03:47 -0700
Message-ID: <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 01:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109830

fails with latest musl

https://errors.yoctoproject.org/Errors/Details/761688/

On Fri, Apr 5, 2024 at 9:25=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.or=
g> wrote:
>
> Tools to handle creating and mounting composefs images
>
> Flexible mechanism to support read-only mountable filesystem trees,
> stacking on top of Linux filesystem.
>
> It will allow to enable filesystem integrity by leveraging the stack:
> ostree -> composefs -> fs-verity
>
> For reference:
> https://github.com/containers/composefs?tab=3Dreadme-ov-file#filesystem-i=
ntegrity
> https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostree
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  .../composefs/composefs_1.0.3.bb              | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
>
> diff --git a/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb b/meta=
-oe/recipes-extended/composefs/composefs_1.0.3.bb
> new file mode 100644
> index 0000000000..ddc67d9b57
> --- /dev/null
> +++ b/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Tools to handle creating and mounting composefs images"
> +HOMEPAGE =3D "https://github.com/containers/composefs"
> +LICENSE =3D "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
> +LIC_FILES_CHKSUM =3D "\
> +    file://BSD-2-Clause.txt;md5=3D121c8a0a8fa5961a26b7863034ebcce8 \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.Apache-2.0;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> +"
> +DEPENDS =3D "fuse3 openssl"
> +SRCREV =3D "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
> +PV =3D "1.0.3"
> +
> +SRC_URI =3D "git://github.com/containers/composefs.git;protocol=3Dhttps;=
branch=3Dmain"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109825): https://lists.openembedded.org/g/openembedde=
d-devel/message/109825
> Mute This Topic: https://lists.openembedded.org/mt/105351850/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

