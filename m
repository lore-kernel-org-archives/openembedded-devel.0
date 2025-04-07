Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFFBC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:21:44 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.59928.1744060898222455666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WfnddUR0;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-603f54a6cb5so2086429eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744060897; x=1744665697; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pn9feGaiiSdvYBCKfaJYAjlZQN3IguWniB1M42/j8k=;
        b=WfnddUR0djbhxmfQTKL0DBpDIFkPMVMXyQSPIjPK8INp7gPdyHzzVe3PJq+dtj7wYS
         SYJ6FRQnCmfR1lNqD54WOwglO43uCYUWD0JgGm97pK+/jnTMPfftHvRi+rpBi4xuMbne
         7N6aAFKIvbZBaSx/IQiGKkD+3xFgt/AvBBASrEDzNpANl0fbSS/RHVzSAq0hLFL14GRK
         UE+HnFBb9lun1mJuitSlZ0Mb9NGjFSdoKA6SkyNznnbYUM8T2M6m6rsJAKJp5dikUnva
         dYpQbCVz1Qh7+PRLvnrdHeuUao0DTnPm9OlP8SMyCpuoPiDRc2wZn0rsBBFTW3+Ill8P
         hGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060897; x=1744665697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Pn9feGaiiSdvYBCKfaJYAjlZQN3IguWniB1M42/j8k=;
        b=QxJehdrLRuVXDMXHMQpgtaKpaH+pULCa+vQqOc6en0JkC6riLbkTsNNgd6W3Fmgox/
         c+VUYAQ3YJCQo/PqXXXyzXc6tdGs3m+n/PUL4zfuxdtuzDS89aP6gsge7dfOL9y5PISe
         cQUdz64pNWIYe0qXTHHcVe6rfNB1FBXiZy4gF7+m5dDtMJRNsrKPHem7dDehYnJiuV9T
         rMv1A2PwQyI8K2yiFZLMgclRRyOz0A9+cXlBjHSHq/0GYM+4jvQAdPnLMYRK6NypAOVh
         rjDMpagNzOF60GJWXdMQUIytWGD2K+I6++nBvt6JuxM/1KNxDQzM3d1oQz9bx092xUnn
         4GOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6A9HYTdhGyX+E6PAmQcjpTwS8s2Y+KkjNeYP4+ILZop1526KB7oXfKqQYGfoerGE30ridwVo0M3UnvEpCBcnh8gY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYoW5FpfsLQ8ecn/LyNQ7V9c/dmyf2WGtlkZ2/X3UBWc2ONmbk
	Rw11a3UOAVDC31+pTn5FNTjWHPva69jNw9/KGHjbgGSDRBOC4VY/TgIbTK2QTxLyqLNZp5BMN3y
	APkD/jVNk3Xam1bA4Y9XCrwVizIv/ECkzPVQ=
X-Gm-Gg: ASbGncvo11KiA011/LJaBIVNlof4tMRA6AshbfGPxnfvBSahvxltxZ8XxbMyu6xLwid
	LnAYtE4rM6aJC6BRL2b7AWtRbfbsk7LUnQpHWwM42R/7X/L8p/UkK6vrHEkwhlWW0+TEYu4TksV
	FsBJ0rtMO3fRCM+CGUORXRDsNHL+ulYsycmJWZmaM7PCHnjrtUTLIkVBAi
X-Google-Smtp-Source: AGHT+IEvwQDYF1M6zzxChHjZrEhTsj1nT4ctX+uuSL2DBaQR0JIH72wstlmut01m815iMXBQBzuwIfeU0+E6fAeXZ50=
X-Received: by 2002:a05:6820:22a2:b0:604:5fd:ed68 with SMTP id
 006d021491bc7-604155d9415mr6733625eaf.2.1744060897404; Mon, 07 Apr 2025
 14:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250407121547.2516285-1-changqing.li@windriver.com>
 <20250407121547.2516285-3-changqing.li@windriver.com> <d8e529cd-7e25-4f93-bdbb-466877ba08ca@windriver.com>
In-Reply-To: <d8e529cd-7e25-4f93-bdbb-466877ba08ca@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 14:21:11 -0700
X-Gm-Features: ATxdqUG9rYvzwEIpkVg_TS8njDpl_ITw4_fO9fmXv-pSDL03i8_BxEIeDZEgum8
Message-ID: <CAMKF1soCb36sJntEEm35wEUq2KYQn729A21+UA_qdBmsfQvnKA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: upgrade 11.4.4 -> 11.4.5
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 21:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116680

On Mon, Apr 7, 2025 at 1:56=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-04-07 8:15 a.m., Changqing Li via lists.openembedded.org wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../{mariadb-native_11.4.4.bb =3D> mariadb-native_11.4.5.bb}      | 0
>  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
>  .../recipes-dbs/mysql/{mariadb_11.4.4.bb =3D> mariadb_11.4.5.bb}  | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb =3D> mariadb-=
native_11.4.5.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb =3D> mariadb_11.4.5.=
bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-oe=
/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 66b46d2afd..f704ff6dec 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>             file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch=
-di.patch \
>            "
> -SRC_URI[sha256sum] =3D "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090c=
bbefed52599dc77b"
> +SRC_URI[sha256sum] =3D "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6=
b9032cbf0e9b5354"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/recipe=
s-dbs/mysql/mariadb_11.4.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
>
>
> Sandy, there's a mariadb build failure. See below.
>
>
> Khem said on IRC:
>
> ... Changqing Li and report this build failure -
>    https://errors.yoctoproject.org/Errors/Details/851668/ with mariadb 11=
.4.5 upgrade
>

I think this is the change causing the build failure

https://github.com/MariaDB/server/commit/d5a417b9d55ac2744b600463a1abaf0657=
72d678

My guess is that it does not happen on gcc but does happen with clang

> I see the patch on lore.kernel.org but not in my inbox, mysterious world =
of emails
>
> ../Randy
>
> --
> 2.34.1
>
> pLK@tY:ATbOf1"dW
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116666): https://lists.openembedded.org/g/openembedde=
d-devel/message/116666
> Mute This Topic: https://lists.openembedded.org/mt/112131137/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

