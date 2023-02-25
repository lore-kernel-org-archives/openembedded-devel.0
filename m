Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AB7C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 17:15:49 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.48193.1677345342074743776
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 09:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fOXBS8bI;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id ay9so2593164qtb.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MfMuPDK5SuPIMY83E3zjLXUG2EweIJ36NKG90Lp3/Y=;
        b=fOXBS8bIT274bSnfrq+7La4ZuUwDk1IfPDTksB6ZiyQNTMAmmRCrW9Z0waDcuzJY1q
         qza5NAshMVR0sA4oXZf1Hp/s7j6M1azIxGJ6EJCpJ/MouXF2zavzx110sbFsuve+QlS2
         3Agg63UPbwEXCVCNS+VHRXXho+//7TFnEcIpAnkJzsLEOrsFKeJVi+SZ1Mk615nfPk6n
         iVuWvJ/L2HIC1J1UrjvdHPAvwOIjyeOcQAxjgoSbIq0tNq7YNQ4lRXhCBk+hA136qJEf
         mJDxDl5BMPcCkL33jjkXuWuZ7Nw7JRO5xSUbxOi/VmZJ8D77xgNw1J5W9AR4UIkTbra0
         bCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MfMuPDK5SuPIMY83E3zjLXUG2EweIJ36NKG90Lp3/Y=;
        b=0Ugdv+gdkwjOJoYAcptrNJiy7UK91qIwVV59hBbAJ6B8NeugK7Rj24ohAPieLaIUTk
         uSuOq6DKvRSvgMilYYgoutkjk4gRHF6CRXq6F5U/Ta/VRyzk1RwOr/xq93OzF7nhiogA
         +BAbnzxnOrVu1iuBHIaI9FAxg48/FwM4eGNR8v/8nLnLfxpZRjV41sz54WPOMaRX+B0z
         KqKgBCiKbjhS1k1K6DFvRxDUERrB12BY2LBBcKFX/cmrKiZXdGcPi3Mp28LwGPBQNROT
         oaHA0+X/mJWZLVqog9nQm/Info0vKmqbqH5mPLl6LDR757w6VIVWxd3us6oMldqt/E09
         Nufg==
X-Gm-Message-State: AO0yUKU7GHbXuh0VLneRobifTT3Wd5g4nYU3U5tcx0Vol1CXITLLVv/Y
	umjWiEN4drqD10VRJ1husQJxTSm1e2w=
X-Google-Smtp-Source: AK7set+6XxxefVDP2tztyjsFW+cRIvrrPEMKUhxeLto3NJPPYX3oeWjbg1TIAgwkORckSb4KKxguJw==
X-Received: by 2002:a05:622a:1312:b0:3bd:48:70a3 with SMTP id v18-20020a05622a131200b003bd004870a3mr31929023qtk.1.1677345340996;
        Sat, 25 Feb 2023 09:15:40 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:e5ea:9bdf:4891:2b34? ([2600:1700:9190:ba10:e5ea:9bdf:4891:2b34])
        by smtp.gmail.com with ESMTPSA id 81-20020a370c54000000b007423ccd892csm1532553qkm.47.2023.02.25.09.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 09:15:40 -0800 (PST)
Message-ID: <86b0188a-bf97-a9fb-8967-d4e42a08f2e3@gmail.com>
Date: Sat, 25 Feb 2023 12:15:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc
 deprecation warning in downloadutils Warning appears as:
Content-Language: en-US
To: Narpat Mali <narpat.mali@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
 "G Pillai, Hari" <Hari.GPillai@windriver.com>
References: <20221219053618.3558291-1-narpat.mali@windriver.com>
 <DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9@DM4PR11MB5550.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <DM4PR11MB55505E4A9EF24EC63FC7E772E4AA9@DM4PR11MB5550.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 17:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101251



On 2/22/23 7:05 AM, Narpat Mali wrote:
>
> Reminder.
>

Is this it?

https://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb?h=kirkstone&id=19f07c055a3d023f81882c4904d66949085fa322

- armin
>
> Best Regards,
>
> Narpat
>
> *From: *Narpat Mali <mailto:narpat.mali@windriver.com>
> *Sent: *19 December 2022 11:07
> *To: *openembedded-devel@lists.openembedded.org
> *Cc: *Polampalli, Archana <mailto:Archana.Polampalli@windriver.com>; G 
> Pillai, Hari <mailto:Hari.GPillai@windriver.com>; Mali, Narpat 
> <mailto:Narpat.Mali@windriver.com>
> *Subject: *[oe][meta-python][kirkstone][PATCH 1/1] Fix collections.abc 
> deprecation warning in downloadutils Warning appears as:
>
> tests/test_downloadutils.py::test_stream_response_to_specific_filename
>   requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: 
> Using or importing the ABCs from 'collections' instead of from 
> 'collections.abc' is deprecated, and in 3.8 it will stop working
>     if path and isinstance(getattr(path, 'write', None), 
> collections.Callable):
>
> Upstream-Status: Backport 
> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  ...abc-deprecation-warning-in-downloadu.patch | 41 +++++++++++++++++++
>  .../python/python3-requests-toolbelt_0.9.1.bb |  5 ++-
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 
> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>
> diff --git 
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch 
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> new file mode 100644
> index 000000000..baa833b6d
> --- /dev/null
> +++ 
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
> @@ -0,0 +1,41 @@
> +From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
> +From: Jon Dufresne <jon.dufresne@gmail.com>
> +Date: Fri, 1 Feb 2019 16:30:01 -0800
> +Subject: [PATCH] Fix collections.abc deprecation warning in downloadutils
> +
> +Warning appears as:
> +
> +tests/test_downloadutils.py::test_stream_response_to_specific_filename
> +  requests_toolbelt/downloadutils/stream.py:161: DeprecationWarning: 
> Using or importing the ABCs from 'collections' instead of from 
> 'collections.abc' is deprecated, and in 3.8 it will stop working
> +    if path and isinstance(getattr(path, 'write', None), 
> collections.Callable):
> +
> +Upstream-Status: Backport 
> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + requests_toolbelt/downloadutils/stream.py | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/requests_toolbelt/downloadutils/stream.py 
> b/requests_toolbelt/downloadutils/stream.py
> +index eed60a7..1d1c31b 100644
> +--- a/requests_toolbelt/downloadutils/stream.py
> ++++ b/requests_toolbelt/downloadutils/stream.py
> +@@ -1,6 +1,5 @@
> + # -*- coding: utf-8 -*-
> + """Utilities for dealing with streamed requests."""
> +-import collections
> + import os.path
> + import re
> +
> +@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=None, 
> chunksize=_DEFAULT_CHUNKSIZE):
> +     pre_opened = False
> +     fd = None
> +     filename = None
> +-    if path and isinstance(getattr(path, 'write', None), 
> collections.Callable):
> ++    if path and callable(getattr(path, 'write', None)):
> +         pre_opened = True
> +         fd = path
> +         filename = getattr(fd, 'name', None)
> +--
> +2.25.1
> +
> diff --git 
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb 
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> index 366f41ca8..72ad7a618 100644
> --- 
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> +++ 
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
> @@ -6,7 +6,8 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571 
> <file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571>"
>
>  SRC_URI = "file://run-ptest \
> -          "
> + 
> file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch 
> <file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch> \
> +           "
>
>  SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
>  SRC_URI[sha256sum] = 
> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
> @@ -31,4 +32,4 @@ do_install_ptest() {
>          # remove test test_multipart_encoder.py as it fails,
>          # downloaded file is not supported
>          rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
> -}
> +}
> -- 
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101209): https://lists.openembedded.org/g/openembedded-devel/message/101209
> Mute This Topic: https://lists.openembedded.org/mt/95760086/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


