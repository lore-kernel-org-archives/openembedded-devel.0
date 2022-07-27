Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD775C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 20:20:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.24703.1658953196264418867
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 13:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qGUhvb/b;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d3so9111098pls.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 13:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nlWsE/BlTOTg391+9I8dbxi74B3XcN8O0xh2oN95th8=;
        b=qGUhvb/bjvhGWgQInwA78wHz45R6OXlRNveuzBDbNznRkIRsutbdrWtwVTmJEUTSy1
         bWpiuVoa22B3mv1Dv74vEWFI6amKaiCBclgYfsbZjJ9bpyLEe10Qz4+HxYobeKz//3bg
         wMpHv/FQ5jVoGPxOmk0HfQT7/1Qv9LAMR8Smhgt9CYbGS2nCOQGlaORxJ0SaZrun0zaF
         HrAqgNEUbUukRII8VORg+6Y9XndEHgFrOM1GSg2LJPVcoGsPWg71TSWPx65jDYSsoOfx
         CAMmVtieSMDGBib2iFku6l7Mz2md19U0AkCJSAPnHyfdApPIqhe4mXom5OSNJBr6EhzZ
         wFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nlWsE/BlTOTg391+9I8dbxi74B3XcN8O0xh2oN95th8=;
        b=pm/jLgGuf5r6sGtgVnMsRnCopmXfzd+c3oj+FYy17CCIK9B++4XN2Hep3f0+Xw2w7x
         lkIFnK2edMeVobzzMFJtz14E/4ws6ZyDQ/ik+YHssOMX1IVzXFz2GbKsxsO6vITXJvxq
         0Uli1Cqc9HJBHYHrUs8PGCRXefGd/q8E3RrqTICnOfTAHCuiEHvjvfXpWc3ZFFXXhOPV
         JgargRXmALWMO8Vn416I6JL3zrtQEd0BAk+xLW8D8JFA3SFEpZQNTabsIEuoqV2L893y
         mihmM1WHpYn8yG4YCSynMQTc7KorGeWzi6ke0aOn/3XHgIKg8yxfa+VFqbBNK5x+jXel
         UhnA==
X-Gm-Message-State: AJIora9j/LNdoHfj5RQ+BKvyrcbEgPL6qyftgUa851fxaYaFLB5XRtkQ
	L/JxwojGn+JGHN/ufZHvYmMNK06K2mw=
X-Google-Smtp-Source: 
 AGRyM1tnB49sUjuOAjFPMN/v+jnKpBnwsTqGpg+/WD8awS1pfsw2u4ziAxqrFmtPusvZAEBjzDIbcQ==
X-Received: by 2002:a17:902:ecc2:b0:16d:6146:3337 with SMTP id
 a2-20020a170902ecc200b0016d61463337mr19776744plh.139.1658953194763;
        Wed, 27 Jul 2022 13:19:54 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:cb87:47f5:7b76:e22c?
 ([2601:202:4180:a5c0:cb87:47f5:7b76:e22c])
        by smtp.gmail.com with ESMTPSA id
 c22-20020a17090ad91600b001f1694dafb1sm2157874pjv.44.2022.07.27.13.19.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:19:52 -0700 (PDT)
Message-ID: <3f3ef5cb-e09b-a933-9c11-81773c61fa63@gmail.com>
Date: Wed, 27 Jul 2022 13:19:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][PATCH] sshpass: add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220727181928.34114-1-mike.petersen@ni.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220727181928.34114-1-mike.petersen@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 20:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98019



On 7/27/22 11:19, Mike Petersen wrote:
> From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>
> Needed for automating ssh logins, used in auto-tests.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Mike Petersen <mike.petersen@ni.com>
> ---
>   .../recipes-connectivity/sshpass/sshpass.inc           | 10 ++++++++++
>   .../recipes-connectivity/sshpass/sshpass_1.05.bb       |  8 ++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass.inc
>   create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
>
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass.inc b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
> new file mode 100644
> index 000000000..b19ae4313
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Non-interactive ssh password auth"
> +HOMEPAGE = "http://sshpass.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
> +
> +INC_PR = "r0"
> +
> +inherit autotools
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
> new file mode 100644
> index 000000000..a345dbd95
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
> @@ -0,0 +1,8 @@
> +PR = "${INC_PR}.0"
> +
Don't think we need PR.
> +require sshpass.inc

Can we combine both files?
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI[md5sum] = "c52d65fdee0712af6f77eb2b60974ac7"
> +SRC_URI[sha256sum] = "c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98018): https://lists.openembedded.org/g/openembedded-devel/message/98018
> Mute This Topic: https://lists.openembedded.org/mt/92655179/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


