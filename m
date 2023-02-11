Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D8C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 23:16:01 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.1031.1676157354321505448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 15:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WoXJQnKH;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-16ab8581837so11132284fac.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 15:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eU1t2MgAYNMsXfOgGxSN6hBdIfAgSBdF0sLYYyb+u9U=;
        b=WoXJQnKHpORCx87nZl+dm4Oi2wYsdJzbk8qFsppgcPttY827BgYKCkn3TXZPjIuxFz
         DX6SLaFnmnmggj4luj58ErXC33IZnLP5hOnmiOI6G+LTfUg8auVz0S1EtmlD41jvL+BX
         ollmpcEi5A/SnGNtNg+E6gLxBJDU++kXUZk3r927rlOn7BDkdNiIOZyki+JC1skh7+iH
         VwGdHdDzfLQnUctBySXotZJq6U/BhUJOwh3qGj8/+eV8hhJFAWPHV1XRUFqT6zFt7uRl
         a3UhmGy1edeNr06zB3N00T+GXy8MGlqXC6sc46dT1E/9s0efK0di4Pu1BFy/X/A2/p0s
         z4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU1t2MgAYNMsXfOgGxSN6hBdIfAgSBdF0sLYYyb+u9U=;
        b=77KTYHZ57+FamDw4UMJGO42sJQ6z7pKDetEw6CweL9Sdb2y9CA8k2R6zXEyCY0gSi8
         vgbiDnjC7LLHcrqpX7BTn1nehWLnjII7QaxG9GfdHskWyUrnYFNa/lPoi7pEKmDkA//e
         vuRo+SGluAACo6Of0ithAIVnRsNBSypjV/9PXZtkTdUhAVBbW55J2NQqHeHvEmEJGWQv
         cNyOtEh1v1Fjc0i6lb4NFhsKhjta9SN4g/nRQ00UNsV+HJhPUgNYXLcJqkByikdexNCP
         NekUh1aypUij+oBqgeir0XkCC5Bxh88vm8US3h8wnKsroA2I/VX0cei2xZVVq1ErBWYK
         Tjag==
X-Gm-Message-State: AO0yUKU8xkU9BAhtYpmaB4CPU8B2EHVLlx7j0VBUWDbum9Gc8iHzmj4R
	XSoMvXvkXMikhr1W2etunExnJZLJu5u7YcgWNCU=
X-Google-Smtp-Source: AK7set/e97nUWMKDcHkFiL9KDOne2n9H+quyZL7vxaPhwxLRQkuqElpexrOi1RwsENGgdUmkcdwINTyYe/fi67B7WvY=
X-Received: by 2002:a05:6870:96a3:b0:163:d288:863 with SMTP id
 o35-20020a05687096a300b00163d2880863mr1786649oaq.55.1676157353440; Sat, 11
 Feb 2023 15:15:53 -0800 (PST)
MIME-Version: 1.0
References: <1676122479-6002-1-git-send-email-wangmy@fujitsu.com> <1676122479-6002-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1676122479-6002-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Feb 2023 15:15:27 -0800
Message-ID: <CAMKF1spgOjaqadzp-cPRn6jn6Z-8g6MTrAt2LQn+JJ-PQEar9A@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade 0.16.0
 -> 0.20.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 23:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101042

This fails to build see

https://errors.yoctoproject.org/Errors/Details/689684/

On Sat, Feb 11, 2023 at 5:34 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Delete redundant blank lines in the LICENSE.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...est-asyncio_0.16.0.bb => python3-pytest-asyncio_0.20.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.16.0.bb => python3-pytest-asyncio_0.20.3.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
> index 1dfeab633..24b807822 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
> @@ -1,9 +1,9 @@
>  DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
>
> -SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
> +SRC_URI[sha256sum] = "83cbf01169ce3e8eb71c6c278ccb0574d1a7a3bb8eaaf5e50e0ad342afb33b36"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101028): https://lists.openembedded.org/g/openembedded-devel/message/101028
> Mute This Topic: https://lists.openembedded.org/mt/96896337/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

