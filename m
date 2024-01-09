Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03C6C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:38:57 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.9549.1704771532246185476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aGRayQNX;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-205cdc4b2b8so1809408fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 19:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704771531; x=1705376331; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SRRLpfLTgxmm2p5x9McWV03M306v6clONXjwVe6D7M=;
        b=aGRayQNXVK40e0mmqGPV96Ei/gLIDOVo6b7b3YkLCeshKBP9ORBr8DLQ4GnNUvKW7e
         v/dlXQ5uwPf/EcDmxncOeA8PAOUd8QBxpHOePntjYZoyy0l2wDzGf/mgZWt/xFRIjR+O
         LW5dcPhb/R0sECPplBQO3gKxgn/K8ATeCttvGYinMUi+dWJCXA+hQUSF6FBOi1xEilcA
         IvXO0UPloKz5AMzdnNcPSQNEfHdbwY+PQYC/h0QWUpffFFarPnCndAk78Q+s87ndVrt/
         eIlE0TZnJCz/Rfm67Ab/txRi+4aUyxpQmLmit4HllvK2VW4Kg8xdCtgMjSAIJmRFfW7h
         ylZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771531; x=1705376331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SRRLpfLTgxmm2p5x9McWV03M306v6clONXjwVe6D7M=;
        b=CfLEWohXm5IZ85xpihvjPmosvY924lGXq94waoqmLc1fUritnZng8RJ5zX6HkGz6rZ
         7NEBOslh6z7XlvYoEyEtfJlxRZkZxXO8M7tTG0LJQaErDtsbnJGrd5WbOINkA/mzduIp
         FXHa/3Kkk2+i5YZ4GMMYgaAvCcf+MP+EbUyEARt/N0ZHtgQJeYoyDiHi7AjdfDGU0U0J
         nvMP+kxKf0yQih1Y2MZAGOJc4uJS+T8twZpf9uHF0SrNtG08FqlaxmHKGoENQ2LkfToF
         ZujrRVyfsyJI05U7JELXHboHPbRu/yFrcBPrZZiV0P36o8G56kI5i8flE32mW+H7XzR4
         pLZg==
X-Gm-Message-State: AOJu0YyQg73qOzjkwenoFLn4vp6qK4RngOYLf1vil6Ik97EZE0pjN2HR
	bIY60NPdlySeOXXtducbp930CEF3UO0ELb3AVyHCg9zaoOc=
X-Google-Smtp-Source: AGHT+IH0T1knof0d5nCKdBrgLcKEd4bnJBdNpdP3uyq2m9gCUvE7K3p3j/VPDhhGzMRjlgzHLAIDzxNjWDpCC49xC/U=
X-Received: by 2002:a05:6870:ab8a:b0:203:cdaf:8297 with SMTP id
 gs10-20020a056870ab8a00b00203cdaf8297mr6553126oab.34.1704771531502; Mon, 08
 Jan 2024 19:38:51 -0800 (PST)
MIME-Version: 1.0
References: <1704722231-31088-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704722231-31088-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:38:25 -0800
Message-ID: <CAMKF1sojLY0nwqcNiJuyBOe+h30gS6tCuo=1QOvfxkF-TSOSgA@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] rdma-core: upgrade 48.0 -> 49.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 03:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108178

fails to build on musl.

http://sprunge.us/Q7mOb6

again its needing a basename patch with musl.

On Mon, Jan 8, 2024 at 5:58=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
> refreshed for 49.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...llow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch | 10 ++++------
>  .../rdma-core/{rdma-core_48.0.bb =3D> rdma-core_49.0.bb} |  2 +-
>  2 files changed, 5 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/rdma-core/{rdma-core_48.0.bb =3D>=
 rdma-core_49.0.bb} (96%)
>
> diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cma=
ke-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch b/meta-networking/r=
ecipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-ove=
rridden-from-envi.patch
> index 03ba87261..84378fd27 100644
> --- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allo=
w-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
> +++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allo=
w-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
> @@ -1,4 +1,4 @@
> -From 92747aab189aa3cee954ab31ee019205f8984155 Mon Sep 17 00:00:00 2001
> +From 166d97e6ef63dac1941135e97d0c42ce7a8950af Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 27 May 2023 17:22:10 -0700
>  Subject: [PATCH] cmake: Allow SYSTEMCTL_BIN to be overridden from enviro=
nment
> @@ -8,15 +8,16 @@ for systemctl
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   CMakeLists.txt | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 9b7462861..c4d82fb49 100644
> +index 2c3deef99..ae60f50b0 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -226,7 +226,10 @@ else()
> +@@ -229,7 +229,10 @@ else()
>     set(CYTHON_EXECUTABLE "")
>   endif()
>
> @@ -28,6 +29,3 @@ index 9b7462861..c4d82fb49 100644
>   if (NOT SYSTEMCTL_BIN)
>     set (SYSTEMCTL_BIN "/bin/systemctl")
>   endif()
> ---
> -2.40.1
> -
> diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb =
b/meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
> similarity index 96%
> rename from meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
> rename to meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
> index b9e07604d..1d30c4a15 100644
> --- a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
> +++ b/meta-networking/recipes-support/rdma-core/rdma-core_49.0.bb
> @@ -7,7 +7,7 @@ RDEPENDS:${PN} =3D "bash perl"
>
>  SRC_URI =3D "git://github.com/linux-rdma/rdma-core.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>             file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-e=
nvi.patch"
> -SRCREV =3D "3e039515b959fea70356b010ed093e43cf360e99"
> +SRCREV =3D "0bffa5d9be9b0ede538f395bf40eb25a84003a49"
>  S =3D "${WORKDIR}/git"
>
>  #Default Dual License https://github.com/linux-rdma/rdma-core/blob/maste=
r/COPYING.md
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108163): https://lists.openembedded.org/g/openembedde=
d-devel/message/108163
> Mute This Topic: https://lists.openembedded.org/mt/103597113/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

