Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81871C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:56:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.928.1651593403091601148
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 08:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arkCOD0U;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id kd11so12495411qvb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUM4kBfaKr4qGXOEEk3mrom7T+VAb0ezkdH7QULiN+Y=;
        b=arkCOD0Uv3fL1/YpxbkicPtN2gMILsVeGAhiEicXqpmzOnWJV3HCzi1FK5tBXyThbi
         f3A/X1FP+IDGerxWCNVx26Oz/KAFfurR7AxEmRtkfg9BNXvyS4vdcQ2rrG5s1/DQM89F
         Bq0xiAe2kKdfdn7YUZ4/s/bweCu7iFdg35lD+2ATZxKFFWcs7gM60KpUHREaXBeeUDhM
         3y2Wb1+ZGCcTHQmKS/CpkBCnoTUoe9JKRxlWXmJbVf48bkj+hnhuSiiiniVWC4wmSXSu
         IzP+bWZ6T/5PcdWf80qCHRTFHJfgyUHVmZhGRYfccucdhKjSIJ1Dp2rDhC86wJyZTubm
         LuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUM4kBfaKr4qGXOEEk3mrom7T+VAb0ezkdH7QULiN+Y=;
        b=0ZpVyUh+uP7DucRz7nIwhF4z74XPxcR17oicoDXuz4UXXCC7CyX+c2W+iGWuhhBQ1B
         phZ8hYA/T7v4aFgbvgttmTZi4lObQUUB8xPG4eRmVc/kk2plhdHsm4mkRfQv3GZNrl+z
         PQmmncxBGhFz6pwmgpwVrFeoC/v+xAhvXjT9eYv8sJ4JyYFSEUX4JPqLunezTcJGbjPA
         lhgAdNZrXHj8LH30N3HXAbNGltLhDaIbEQOYsxVT0wsl0IKUUt7Yv+PX/PliKVsdwqlM
         Zu+pdXFpBwlFAz9+LGk5IaFjKuVBsSPiYz/rrYlQ43+fxigpTtNPQtSTA97mCf22a2vY
         6R3A==
X-Gm-Message-State: AOAM531hcuT7/5DgrGFF0fb31KPe8BcsTAhhaW+1gVG7rKBF5WX5KmfK
	omexRL6RtErMSxNML4bCPfqDbrqvC9eAGdN90+8=
X-Google-Smtp-Source: 
 ABdhPJxUCeQfUQL6Tt47PAP4CVjxUX7h2wMU+HD8TzPJBZXgOJcsHGhTCfS0Mo56gT9b3HiyefV28Ap4I/qTmWTd9i8=
X-Received: by 2002:a05:6214:c2f:b0:45a:88d5:32e1 with SMTP id
 a15-20020a0562140c2f00b0045a88d532e1mr9128802qvd.36.1651593402100; Tue, 03
 May 2022 08:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220503091644.2507658-1-jiaqing.zhao@linux.intel.com>
 <20220503091644.2507658-2-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220503091644.2507658-2-jiaqing.zhao@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 08:56:15 -0700
Message-ID: 
 <CAMKF1spFGXX9p6dZmdZUxEeSvQ1R=cg6=0VA814kExH+m1h8pw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 2/2] openldap: Upgrade 2.5.9 -> 2.5.11
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 15:56:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96953

On Tue, May 3, 2022 at 2:17 AM Jiaqing Zhao
<jiaqing.zhao@linux.intel.com> wrote:
>
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
>  .../openldap/{openldap_2.5.9.bb => openldap_2.5.11.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/openldap/{openldap_2.5.9.bb => openldap_2.5.11.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.11.bb
> similarity index 97%
> rename from meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> rename to meta-oe/recipes-support/openldap/openldap_2.5.11.bb
> index 958a21b9c..cc84d8d86 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.11.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
>  # basically BSD.  opensource.org does not record this license
>  # at present (so it is apparently not OSI certified).
>  LICENSE = "OpenLDAP"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \

Describe need for this checksum update under License-update: section
in commit message.

>                      file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
>                      "
>  SECTION = "libs"
> @@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>      file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
>  "
>
> -SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
> -SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364e6fb9e"
> +SRC_URI[md5sum] = "c7205085cd4192cf95d0df6f5afa510a"

you might as well drop md5sum while here. Its no longer needed.

> +SRC_URI[sha256sum] = "9514b07776d09f2e39aa75857395cd5634dafc209b526adb2abcb6f1c611d7f1"
>
>  DEPENDS = "util-linux groff-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96948): https://lists.openembedded.org/g/openembedded-devel/message/96948
> Mute This Topic: https://lists.openembedded.org/mt/90855525/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

