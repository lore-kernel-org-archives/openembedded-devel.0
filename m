Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CABC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:38:01 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.36.1667839075602220545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 08:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kvsaopkH;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id j6-20020a4ab1c6000000b004809a59818cso1678633ooo.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o522Z//DIjLyZkmtnswcxVsX5niv9Jpzaf7qcrYjItI=;
        b=kvsaopkHrzGONtPJzNCE0EmHGud65Ea0ClQNyKivo7hxKpzPZw9/OsG4/3V+SWiefu
         XkO282BnJL6q/aypuGa8Rgln4iBd0idvkscuTLKbd0WNtGZ0nz6q5F3pPuL3+K6RDR/M
         V51cM/tZC5tB8t9ug/HrRrP8P3ZEtoaGVno0oplBa/HLyxa4RWqaDTfjq8KnQ35bXpwC
         R/l+dQfhhzL+Oum1FUWuCjOGqAmzG/tkGXytkp/+z38WhW6shbRibcesdC/ZBySb4IGX
         t2Hr+IWdDqvjnIrETriah6aRnsve/DToY4Xi+n8b7ccI3BjCMSQQuNdAbJDxt4LO7X12
         if/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o522Z//DIjLyZkmtnswcxVsX5niv9Jpzaf7qcrYjItI=;
        b=GBNqdbdeqBJBCf9Bq6IE4wHTpAiavVUhjRLbg+qWaoW546JzdU7k3ZNZob5f8e8QX2
         1Pyi+hBDPK/rvz7uupgJg6JEC7urAdCvT38c+8CHj7fpKBWr+yeQnTBh9WGfPi5JnVv+
         jm57PXexO3dVCMpE/ZqFIj73d//Vm+krO7SVGLxJLPqyGlT1LZrn55M1XG3rCG3c0pyM
         94eX1Idy+kGwxSn5ZBf97VJVdCImm0be8cDvYZ0JOSupHIfH4aboeYiVDyXcGNobkEfB
         ArbcNRKLePLlNi4mZVA0YHLa3lHo4ThrBrCbr6082XkpYDXraNUWjStzki/jiCCcOxje
         1hlw==
X-Gm-Message-State: ACrzQf0YRxjZAc6MjelofZ1eK7dRYc1qr6+TbUAwFpnwbjImGgB5LcWq
	PZSfzAD2WUFNcVTeH6Mes2L9gnq5GxgoqA1EtiY=
X-Google-Smtp-Source: AMsMyM5ZurvncyjvyYf06/GnqPMk2HOR2EnOfDshRKf+FHxBvhbOd7bbEMaUjlz0jhixB7U+asER/wrR8aVh2jXH094=
X-Received: by 2002:a05:6820:1686:b0:49e:a54d:518b with SMTP id
 bc6-20020a056820168600b0049ea54d518bmr7967768oob.9.1667839074782; Mon, 07 Nov
 2022 08:37:54 -0800 (PST)
MIME-Version: 1.0
References: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com> <1667810179-31041-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667810179-31041-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 08:37:28 -0800
Message-ID: <CAMKF1srsG5u=sVDjBrF5BpHmbA0ySVkay=5y3LXTB+KyFBJNmQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-httplib2: upgrade 0.20.4 -> 0.21.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 16:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99474

This was already proposed earlier.
https://patchwork.yoctoproject.org/project/oe/patch/20221102145441.3101891-2-leon.anavi@konsulko.com/

On Mon, Nov 7, 2022 at 12:36 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ==========
>  http: `Content-Encoding: deflate` must accept zlib encapsulation
>  https://github.com/httplib2/httplib2/pull/230
>  Begin support and CI against CPython 3.10 and 3.11.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
> rename to meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
> index 52fd88ddf..3e285d9ae 100644
> --- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
>
> -SRC_URI[sha256sum] = "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5b47aef259eb5c585"
> +SRC_URI[sha256sum] = "fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34"
>
>  inherit pypi python_setuptools_build_meta
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99465): https://lists.openembedded.org/g/openembedded-devel/message/99465
> Mute This Topic: https://lists.openembedded.org/mt/94862099/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

