Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1441FC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 20:50:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.2113.1646945444031119972
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mfuTJqTK;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 1so4863850qke.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqNttfv/ET7l0Fqks68feuIALBVi7LDyitDrcs58Ius=;
        b=mfuTJqTK3pzZL3mIKO15jdJNi/I0xkLiZ2hbQxlcsDlkY1Rle/4I3BU8iFbpDdju6Q
         nyICZwcjNuj+B47ggb1tJ3+eY5L0dREQCTLTG43H7K8KMR+qr/656MFB0CEe8qYW5gcD
         SAyCwZIWGcfFL3gdiCUIUgVuiCk1tLYEoL7Acz9ybQqtzL9BD71O1ADUyLDp/Z38ZhRX
         pHdNbhDN0ksJSlezTNwh0tk6sOvIccm5GKK7dgw0eZO2cd8PkP2aN0s9rU5iv8SmqLYQ
         778bZFVfUczIR6+Aa1zXAL1O+0v5w7wPa6h6zc7nYJI5JgQ8EFklxBfAtugXfnfUPcwS
         U9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqNttfv/ET7l0Fqks68feuIALBVi7LDyitDrcs58Ius=;
        b=dVBr6skfZqrptvaWPF3/7fycxub6jWllF6QnqN3g7jnytT16XUUiHEQa7JeHt+keJ5
         8dmkdjlZj7w/1ekT2uwqLSFFrO+3UgOqB6C19fKXWxUK7uYH4KwrYKmDWrK8v1QtdH8Z
         tdRBklwHsy8CXBC4px6RE/2HCoHnEylYaLRBBnLuu6bUeR/K+ApnsflqfA/i5dplfOk0
         woTCR7RyBuxxRlOHfPxcq41CsjzIGIfg5aUgaqimcpLMSZeSkZpGmVsTHubkCRa1CDVj
         lAN8ITPBWDGXO4bqNSWHcN+Q+pGjZHrymc6bdFckC4bg+URPGOUfmTCC2D+xQC6shwtu
         FVdw==
X-Gm-Message-State: AOAM5336tE1VCz2S1lH4tfUGfO1c9toeRi6/orNGgfZJVxBC62x2l782
	zEmLmi3Dm9dmvfl9zj5L5HkeyGZYQ4hY9flavbY=
X-Google-Smtp-Source: 
 ABdhPJxuo0gzUlYLlChyfEm+FIy+0eEtHMtbJ9weYs+IVd27B6izq9fZ98fWjmCjv1Dwy8XOyrYMuRuXIPXJFEkadVw=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr1212782qkp.180.1646945443042; Thu, 10
 Mar 2022 12:50:43 -0800 (PST)
MIME-Version: 1.0
References: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2022 12:50:17 -0800
Message-ID: 
 <CAMKF1sqEEMFQH7oEpvup3nNjBqCUbvfp32KREsFCrutHvrMENg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libcereal: upgrade 1.3.1 -> 1.3.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 20:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95942

this fails to build on qemumips see
https://errors.yoctoproject.org/Errors/Details/651369/
perhaps its clang being more fussy here I dont know, can you build it
for qemumips and see if it works ok with gcc atleast

On Mon, Mar 7, 2022 at 4:45 AM wangmy <wangmy@fujitsu.com> wrote:
>
> This is a minor bug fix and build enhancement release for cereal.
> The primary reason for this release is to correctly increment the version for
> cereal in include/cereal/version.hpp.
>
> Bug fixes and enhancements
> --------------------------
> Make doxygen docs reproducible
> Add CMake options for building doc and sandbox
> Correct patch version for 1.3.2
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libcereal/{libcereal_1.3.1.bb => libcereal_1.3.2.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libcereal/{libcereal_1.3.1.bb => libcereal_1.3.2.bb} (94%)
>
> diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> similarity index 94%
> rename from meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
> rename to meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> index c905b74d6..08291d2db 100644
> --- a/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
> +++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
>  PROVIDES += "${PN}-dev"
>
>  PV .= "+git${SRCPV}"
> -SRCREV = "1de8fe89471d69ea392ea260ce74e079d5f4b415"
> +SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
>  SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https"
>
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95855): https://lists.openembedded.org/g/openembedded-devel/message/95855
> Mute This Topic: https://lists.openembedded.org/mt/89610748/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

