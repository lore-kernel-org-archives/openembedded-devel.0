Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A5DC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:44:40 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.29285.1702575878811269646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngYlws8R;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b9de2332e3so5849987b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575878; x=1703180678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZQntu/Y/E63vUGAr8fGottlrwsX8EPcLJsiyru8h9g=;
        b=ngYlws8Rzhb4glUTldO6C6yqK7uNSb0pTTltbgJBvkogty9aztbhceVnAcDlEOyoT9
         VLRHACn6JEEjkc/KSLjfhhHm26gvAhi60bA5xQu89DPbVTIs8MEybk9/2fJKDobde7B7
         o+nDwBrC79YVdWdwTO8NGKpo+Q6tO7IJZB6xWkFQZVFezx2wzdJ+ICxF1EzlEq7hmvJF
         LMy1lWhf8/nDagSFUvr5HRWvr7kJOJbQlUiZ5KoEwltKYkv5zLxYsV4zCrqhA+6j5K5h
         PdveySh10rKSu6oBLI9DV4U1Fj4ysoz1155O5Ttlk6CJ6IhxQoGVfM6+3ik73LGvVe/z
         +y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575878; x=1703180678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZQntu/Y/E63vUGAr8fGottlrwsX8EPcLJsiyru8h9g=;
        b=YEHO7DUlwvpczQY/WSTUZhMI/jCBYWJ3PG9Za6Xcx5Hl0kAoA56h/D1nRSIwLTCg3o
         p3OqLfgaRj95wJO+1+rcGpttDNTNzlxv8t51MY4DEtk7iZex8AiigiXYn1n5Re/yuhd3
         7d5JyDr8j+EYyVMHqvt4Qlf2BXbp11bIil5n6OuyhcHLM7LLB050/jbRQdmrwh+ugK9n
         HrZIaRg/bcVyE61r0v25aZq4QUoGPywQ8LPkENfVQl+1s9Qcy5CCCnQ3SmgBc0ncz6fE
         7WurmELTcnaIsiUylAfqWAgV1PpxLiXLUU/C6u/T9QToa6QqSzVqeD/AKBx8rvRjyMLF
         YJdg==
X-Gm-Message-State: AOJu0YwhZ+FKaQ36dMYoIe0hec+tQDsiIWgtzw1gSnfM1o5uSkRReSmK
	B8tVOa7+WQbcK+7NWROypqsktUCQauyaJLUDkFb0yhe79Cc=
X-Google-Smtp-Source: AGHT+IEr6pqjeCPAeUpPEBxEv/b36eSpxKhVVsV8E15QLw0K9qf8UIKE4LmUSjlTxK2PafUsoGbm7/DeQoOZPjk6xkE=
X-Received: by 2002:a05:6871:691:b0:203:124a:3a54 with SMTP id
 l17-20020a056871069100b00203124a3a54mr3604174oao.54.1702575877957; Thu, 14
 Dec 2023 09:44:37 -0800 (PST)
MIME-Version: 1.0
References: <1702544149-27990-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544149-27990-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:44:11 -0800
Message-ID: <CAMKF1sorwLbi=AaeGZ7Xd5RSfcV+1=-wa+nj8tZ_TzK+W+QgXQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 3.0.1 -> 3.0.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107460

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121319=
5741.1107961-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:56=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Packaging: Add a minimal "pyproject.toml" to sdists.
> - Packaging: Various updates to macOS wheels.
> - Fix a test case on Arm32. Note that this is not a supported platform
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-greenlet_3.0.1.bb =3D> python3-greenlet_3.0.2.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.1.bb =
=3D> python3-greenlet_3.0.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.b=
b b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
> index 523c2b6b2..337bd95a6 100644
> --- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
> @@ -4,6 +4,6 @@ LICENSE =3D "MIT & PSF-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De95668d68e4329085c7ab3535e6a7=
aee \
>                      file://LICENSE.PSF;md5=3Dc106931d9429eda0492617f037b=
8f69a"
>
> -SRC_URI[sha256sum] =3D "816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd=
6eb0696acb24005b"
> +SRC_URI[sha256sum] =3D "1c1129bc47266d83444c85a8e990ae22688cf05fb20d7951=
fd2866007c2ba9bc"
>
>  inherit pypi setuptools3
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107437): https://lists.openembedded.org/g/openembedde=
d-devel/message/107437
> Mute This Topic: https://lists.openembedded.org/mt/103166834/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

