Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44B5CCF9F0
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:22:09 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web01.10698.1761758522715708790
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 10:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkDaiAkn;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e336b1ac4so316577d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761758522; x=1762363322; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rLlEvmm3FxlY/nULbqfoYIeoncf5WNNi+lxiw4fV3c=;
        b=YkDaiAkn5NkIhfFs2uO7Iwze5z1FQCJuR3MYj0E+/NpcM5L5qRNgSQ9V+7RCzoH7DN
         LBUDknGfkwrzdabtIE5MiXHL6oHGFL7reR2uKs0eXiFgv6Dip7ygmTCL6AXp4g/Sr15T
         3IwqxTd2Dw/9Q5uyWN0cd8tho9Ki8mXLyJ5upFOvkSf9MmfWOKL7eDqUtjuxUZ4eVHIn
         YT6iSM8OnRAXnKQuZ/dgaNdKW5C5T+xye+KqJ22McIJci/InoG1VKmSx4KmlkNvwT2ad
         101xpE9b3h1sz8Zw+eZOY7N3ls53u+EgQg+4olZ4iZFfn2cqn48IJ8ZPEmueXCOB3Mdv
         cGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761758522; x=1762363322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rLlEvmm3FxlY/nULbqfoYIeoncf5WNNi+lxiw4fV3c=;
        b=nQxo1Sdo9FkqIcfuxwDzi6Qt66Ob682nUGMpg22n7Uov8+fgh9ZoHSXKSnUwi7jS7G
         JemXilSiQhZRceaLafVghDuy8TKNXGvDv2Y+0rp9UPMXEekNhXN9y7bNJKJ925j6oZiD
         b5cT1Av7D25CpDsjQkWoMdH3jIlvVjGk1LM2H8CqIt6pJZBRBJUhf8g79UjPHHTJgRha
         KPkn912WmSChEE7qm1wsrWz8FXzsI8PVtp0tVnu+ZoLaiClUWdrNPtUkzC23mWSP4SDM
         Vz26Q0aqxd664VSpXuU486u9rT9soh0t+WYZS/s7vsyK1XRKLDzpf2FN8bAc1LgXq0EL
         MIrw==
X-Gm-Message-State: AOJu0YwdKK/Cxk9UURl4bUJUk+JiiczT+n1tzAbl8GMSvJp2pjxIuRAS
	csVL2pIyU+g45UsxL8WT1Op/cxMyj3Jgkzxo+YozkkpFAtx8d0rH5B5+FWl3LN9IzvOM+qhuuQn
	C5oAcS/r3DExc8GkXL1XHj2lTcKJxI4w=
X-Gm-Gg: ASbGncszgAQIlYPsSVnNXxGbSPUtmYEkrUtXKIcBN0jht60lSIzjs7JuFiog5yPc6b/
	4heHbEgQjBb6WCGXYUlAynGZDuZnR6XrQBYEA/dwMb8ktxQewx128EpYpvYiR5ZpiyaHLz824O5
	z5hdsWxOOUyRc06XRFJ1vzmGORaoLmferrEgvp5DnmxTxUE/dMymWEei2q/poeXJcv+8ai/Q68Y
	Yc3WrUL9UqhdjINrmkRlWchQdE8mSzd4hXxl9CMmXQsAHfyka7TnVSVIvblaNmJtF6TMmLTrc22
	z9ysYDSBPfWLiMyAt5o8wgdSlWdHsh6cawrF1dKe8xKODRR92rPMarW7V/MX8G5tBD2pqyP7lVy
	yMkk=
X-Google-Smtp-Source: AGHT+IHUyy9xGtXiEX/deMbIKBDjj3es5LLjGzFbsDNTc0Ljvu0IKPQEYRVyK8MufCAAV+iDQYz+PeYot7OfpiTUR58=
X-Received: by 2002:a05:690e:169e:b0:636:d3ad:8492 with SMTP id
 956f58d0204a3-63f828c2a80mr316833d50.6.1761758521725; Wed, 29 Oct 2025
 10:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251029070240.3402018-1-quic_sasikuma@quicinc.com>
In-Reply-To: <20251029070240.3402018-1-quic_sasikuma@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Oct 2025 10:21:35 -0700
X-Gm-Features: AWmQ_bllQ0o4XFHMr14bIZzi6RDnHFbddHau43l4JHpgWWoHbrJkZa3vaEvoWk0
Message-ID: <CAMKF1spojX4896z2PUc94orudEH4=ex7PVi+mXE+wTjwKRvC_w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libziparchive: fix missing fixed-width
 integer types in zip_writer.h
To: quic_sasikuma@quicinc.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121166

Which branch is it for ? it does not seem to be for master, if it is
then please rebase on latest master, secondly the subject line should
have name of recipe ( android-tools )
not the subcomponent ( libziparchive ) to denote the change

Its a good idea to read through -
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html

On Wed, Oct 29, 2025 at 5:44=E2=80=AFAM Sasi Kumar Maddineni via
lists.openembedded.org
<quic_sasikuma=3Dquicinc.com@lists.openembedded.org> wrote:
>
> Compilation fails due to undefined types 'uint16_t' and 'uint32_t' in
> zip_writer.h. These types are used in struct members but are not recogniz=
ed
> because the required header <cstdint> is not included. This results in
> errors such as:
>   error: 'uint16_t' does not name a type
>   error: 'uint32_t' does not name a type
>
> Added '#include <cstdint>' to zip_writer.h to ensure fixed-width integer
> types are properly defined.
>
> Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
> ---
>  ...x-missing-fixed-width-integer-types-.patch | 38 +++++++++++++++++++
>  .../android-tools/android-tools_29.0.6.r14.bb |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-wi=
dth-integer-types-.patch
>
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-int=
eger-types-.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-=
tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-widt=
h-integer-types-.patch
> new file mode 100644
> index 0000000000..0b5087f283
> --- /dev/null
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-ty=
pes-.patch
> @@ -0,0 +1,38 @@
> +From f6874a2f7de30b6eeefb2d509b895c58b93da8f7 Mon Sep 17 00:00:00 2001
> +From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
> +Date: Wed, 29 Oct 2025 09:38:17 +0530
> +Subject: [PATCH] libziparchive: fix missing fixed-width integer types in
> + zip_writer.h
> +
> +Compilation fails due to undefined types 'uint16_t' and 'uint32_t' in
> +zip_writer.h. These types are used in struct members but are not recogni=
zed
> +because the required header <cstdint> is not included. This results in
> +errors such as:
> +  error: 'uint16_t' does not name a type
> +  error: 'uint32_t' does not name a type
> +
> +Added '#include <cstdint>' to zip_writer.h to ensure fixed-width integer
> +types are properly defined.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
> +---
> + system/core/libziparchive/include/ziparchive/zip_writer.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/system/core/libziparchive/include/ziparchive/zip_writer.h b=
/system/core/libziparchive/include/ziparchive/zip_writer.h
> +index d68683df..7a05e349 100644
> +--- a/system/core/libziparchive/include/ziparchive/zip_writer.h
> ++++ b/system/core/libziparchive/include/ziparchive/zip_writer.h
> +@@ -18,6 +18,7 @@
> +
> + #include <cstdio>
> + #include <ctime>
> ++#include <cstdint>
> +
> + #include <gtest/gtest_prod.h>
> + #include <memory>
> +--
> +2.34.1
> +
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devto=
ol/android-tools/android-tools_29.0.6.r14.bb
> index 47c8e08b62..74928ed171 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
> @@ -40,6 +40,7 @@ SRC_URI +=3D " \
>      file://debian/system/core/fix-standard-namespace-errors.patch \
>      file://debian/system/core/Add-riscv64-support.patch \
>      file://debian/system/core/android-tools-scope-write-macro-to-prevent=
-conflict-.patch \
> +    file://debian/system/core/libziparchive-fix-missing-fixed-width-inte=
ger-types-.patch \
>      \
>  "
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121150): https://lists.openembedded.org/g/openembedde=
d-devel/message/121150
> Mute This Topic: https://lists.openembedded.org/mt/116011337/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

