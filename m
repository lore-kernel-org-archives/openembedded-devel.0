Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36146C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 16:48:32 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.50548.1674146907917514129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 08:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQVOzoeD;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id h3-20020a4ac443000000b004fb2954e7c3so590323ooq.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6bkUp2Cf9R07IZJ3P69gmObM9y14vXCwlPnUDZA2rrE=;
        b=bQVOzoeDXv6IZiYXpRlvvGzWWpwiwyxqML6EmevCqMfulx5f1Pm6TZnORV/ch73z6S
         wXhj1jktf60RyylTksc4U8o97Uzg1zTpCblKoQ63H8PXhE+LS0sjijDgjUPHJwoYmAOi
         t4Sv8uHm3wHBUDdjvWk1ubhMH8K7iytaMaeFjK0NvYdspZI+tGGrI0NBAMMwUmnQXNUi
         gnwa9TACF5k64tU14jJmSjV8GZJP9xQ1fDScEFCWhlZgXVI21l+zqFEAzCN4s12CvVSM
         rW33uR3WzA63T1MDhy9rvPPjZqLg0NWbMjDlnIAU+0LVrntmw+mD7QoTU01on6agO1vw
         hfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bkUp2Cf9R07IZJ3P69gmObM9y14vXCwlPnUDZA2rrE=;
        b=KO1TkjUUBWkmg3qcd+j5nP/dp591ciUkVdc0MAkaJIEQi9tDNErC+4us2CmHucuP5p
         ixLnaSNd2FzWbs8QOxKdGCy9CeMSfu/I9xyFg5xS8S2xFYHD+QikbgPwY4R72BSEZn3Y
         bII+GDCdymRokuTNct7GT/RdETeDvpIhD3pmPI8JfGK1RJ2t/P8c1O320PnLr1RtRlmX
         qfyxJ0N2zgrnyq/R8Xyxykra3QfdW10vaH/zoKBC9WF1tvIaBbwBfNuw1IgT19oZiuq9
         81Ch2OYYAGTJceek82gn6QD6cZDYBN3w/VX8H0lHHa3MlQx3HTObQg+1fNqyT1IpaeIq
         ivUQ==
X-Gm-Message-State: AFqh2krh9OV4cxNlAyX/SctnOCsFAeKKu+4TP38X+JI+W0adNxeB3IrP
	LzY5Gu9nPXSoxGnjS/mjJ2NWHBxyMU36DaSgNyjKw8gtOngbQA==
X-Google-Smtp-Source: AMrXdXsgheqIlhllyMRFdRAsPl+/2S4svN056cncK7//b0xfrvRTnm10WEN/TkK8SWk8f01ezA2SBVNXAG5n0WAW/44=
X-Received: by 2002:a4a:d134:0:b0:4a6:8760:da3e with SMTP id
 n20-20020a4ad134000000b004a68760da3emr486795oor.9.1674146907076; Thu, 19 Jan
 2023 08:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20230119151129.4351-1-kai.kang@windriver.com>
In-Reply-To: <20230119151129.4351-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2023 08:48:01 -0800
Message-ID: <CAMKF1srPZN1daEm-jkFGwAPr-9ccS4xBLW1cXzowXst=uXTQ3g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] libnma: 1.10.4 -> 1.10.6
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 16:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100663

A different patch doing this upgrade it already in master-next

https://patchwork.yoctoproject.org/project/oe/patch/1673939785-20072-2-git-send-email-wangmy@fujitsu.com/

On Thu, Jan 19, 2023 at 7:11 AM Kai Kang <kai.kang@eng.windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> =======================================
> libnma-1.10.6
> Overview of changes since libnma-1.10.4
> =======================================
>
> * Fix the path and translation domains of GSchema files.
> * Removed strings that don't match our conscious language standards from
>   the translation files.
> * Added autoptr support.
> * Fix translations of country and territory names in the mobile broadband
>   dialog.
> * Honor explicitly set APN if provider was not present in the mobile
>   broadband dialog.
> * Make sure Kosovar operators are ordered properly in the mobile broadband
>   dialog.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-connectivity/libnma/{libnma_1.10.4.bb => libnma_1.10.6.bb} (92%)
>
> diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> similarity index 92%
> rename from meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
> rename to meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> index 6adb7ec29..bff9a3360 100644
> --- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
> +++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> @@ -10,7 +10,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)} opengl"
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> -SRC_URI[archive.sha256sum] = "79e730dda19f9b34886f4064aa170f1a2326b08329d655d80b67e906c7f78b7c"
> +SRC_URI[archive.sha256sum] = "53a6fb2b190ad37c5986caed3e98bede7c3c602399ee4f93c8fc054303d76dab"
>
>  PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
>  PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100659): https://lists.openembedded.org/g/openembedded-devel/message/100659
> Mute This Topic: https://lists.openembedded.org/mt/96378895/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

