Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95BBC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:34:50 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.1515.1716572087523059022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abLJ9c+j;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9d70d93dbso3880622b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572087; x=1717176887; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou9qpgAvBQj5vxjonwCc1gBGbS1GQdDQ+aPyn9Hl2CE=;
        b=abLJ9c+jDOYBdLxB1YFowFwVC6onHIBTqD1ECTi9XBOfmm/QzwZd+du0d4aslNB7Rs
         Q1UpgBrfxBKXGjm6+ZGzdNVBzT43jCZNT3aqRzVr9sxO79Gteer/JKkC8Nysj/764ibF
         MCmQNFQY5XnuZFFdiZ+mcnGS959+YUTv8dfDVuG2CJzJF2pmtmcKR7HMl1d1vtf4Agkf
         YsP2VtGW+g38GmlfH2RnpYv/jnm0PGmgqGO45PBjNH3tNsF0K8nie0kXYYwlCa1r54QN
         xGbCJ5ALuuGt0U/n0Jx4SgxyRMC68XZa/3GcVq+9p5+haJIdeCtpu4yhiBmnkxlhMomQ
         nbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572087; x=1717176887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou9qpgAvBQj5vxjonwCc1gBGbS1GQdDQ+aPyn9Hl2CE=;
        b=rmLDMLdnoTRsHHWoJ1JYlDFlclX/HOiwxbqR1yJHIvZOGmeSIZmaoMQYqpODwbJ5VN
         Y2G2HCc98+jpkP0EKpz9o1Vmvlu8KGR6r6rVU7ydQNuWJ6qcgG762DYS8OWKPsZOngKB
         ZnZqQQFA47yU9uN4dGnd1XQFMkRD7gZvp7qoPBq7RYzjVo/op9gCavtJE3tMfn+grvIT
         ktrX2Fx7EEzoI5NShliUaLz7BNB7ODW4L70nfZ2/Ifk1fXR2strLi28yqg24HtJw3Yw+
         f7KL9oGK1m2qDDTEMfODfbFboYKJWD5f6txJYOpN259/7sAJWZHY2mT4u5y4B63+j2at
         6Cng==
X-Gm-Message-State: AOJu0YzQ4kRmHEIJjMNDjwh99rZ3HtEw/VjRnjqrchpAwrt3vQ9K/mEx
	1AxitEctyZM//Q9NfEOg81yetOG2xuO4MBSrFMkWGRlXByf8SrZQzhiO3Yl1WFJW8TDGafqFTX4
	S3AoLpZycLA+5kbIObW3NFOI0RD7FlZNt0wg=
X-Google-Smtp-Source: AGHT+IEsVehPuYrVIJpmpNquCifKXxTnUmTRB9x6Kbgne32BJVtqOVkNRZQA6XEVkmeS1z0VuOjhxX1GngCsrQBlfx0=
X-Received: by 2002:a05:6808:6086:b0:3c9:cf09:a847 with SMTP id
 5614622812f47-3d1a7647769mr2943591b6e.40.1716572086778; Fri, 24 May 2024
 10:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2024 10:34:18 -0700
Message-ID: <CAMKF1srWqFVcpqSemnOBF1yrHnV2Mr3tfGHpWH=c8YyYu-V-zQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-tools: fix building with GCC 14
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110515

On Fri, May 24, 2024 at 4:57=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> libstdc++ in GCC 14 has dropped several nested includes. Include the
> <algorithms> header to fix build error:
>
> system/core/fs_mgr/liblp/utility.cpp: In function 'bool android::fs_mgr::=
UpdateMetadataForInPlaceSnapshot(LpMetadata*, uint32_t, uint32_t)':
> system/core/fs_mgr/liblp/utility.cpp:264:28: error: no matching function =
for call to 'find(std::vector<LpMetadataPartitionGroup*>::iterator, std::ve=
ctor<LpMetadataPartitionGroup*>::iterator, __gnu_cxx::__alloc_traits<std::a=
llocator<LpMetadataPartitionGroup>, LpMetadataPartitionGroup>::value_type*)=
'
>   264 |         auto it =3D std::find(new_group_ptrs.begin(), new_group_p=
trs.end(),
>       |                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>   265 |                             &metadata->groups[partition.group_ind=
ex]);
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../0001-liblp-fix-building-with-GCC-14.patch | 26 +++++++++++++++++++
>  .../android-tools/android-tools_29.0.6.r14.bb |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
>
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/dynamic-=
layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-b=
uilding-with-GCC-14.patch
> new file mode 100644
> index 000000000000..ccd289c81ba9
> --- /dev/null
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools/0001-liblp-fix-building-with-GCC-14.patch
> @@ -0,0 +1,26 @@
> +From 9f4d839847666019cadf57aa34fd366801c11a44 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +Date: Fri, 24 May 2024 14:13:35 +0300
> +Subject: [PATCH] liblp: fix building with GCC 14
> +
> +Upstream-Status: Pending

This is worth upstreaming.

> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +---
> + system/core/fs_mgr/liblp/utility.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/system/core/fs_mgr/liblp/utility.cpp b/system/core/fs_mgr/l=
iblp/utility.cpp
> +index 48c5c8318d99..0aa8023aa87d 100644
> +--- a/system/core/fs_mgr/liblp/utility.cpp
> ++++ b/system/core/fs_mgr/liblp/utility.cpp
> +@@ -24,6 +24,7 @@
> + #include <sys/ioctl.h>
> + #endif
> +
> ++#include <algorithm>
> + #include <map>
> + #include <string>
> + #include <vector>
> +--
> +2.39.2
> +
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devto=
ol/android-tools/android-tools_29.0.6.r14.bb
> index f63b5c04b364..176107f2a7e2 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
> @@ -52,6 +52,7 @@ SRC_URI +=3D " \
>      file://0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.pat=
ch \
>      file://0004-adb-Fix-build-on-big-endian-systems.patch \
>      file://0005-adb-Allow-adbd-to-be-run-as-root.patch \
> +    file://0001-liblp-fix-building-with-GCC-14.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110510): https://lists.openembedded.org/g/openembedde=
d-devel/message/110510
> Mute This Topic: https://lists.openembedded.org/mt/106279982/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

