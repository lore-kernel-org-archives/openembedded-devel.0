Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA84CC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:41:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.8666.1658500872469817132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UHOxby34;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id l3so3741199qkl.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zpnAJjPsQ72qgGlmkk/7jsWZ/rYDibe8awDcZ6GZ8QA=;
        b=UHOxby34oTvj2RfnuEbi5ocj2NR3J+t1OU30um1/x+PJIBnC8nGiDYXVGazU6E9CR6
         0ZdsVmnjyhz1/DTqV0KZQWp1IfqGQcxyGt/Uu+2IdOBANmk56mmYmrMxCgqt5WxNPvSK
         UBhdefRHqrhBvzeqseQbKOxxBzxTFfATRII/ArOQcejIYmETKcIF6qpTfI81tN3PpShf
         EH6pJzWXtbyfkXyGmJueZnr90SPtlPXigAqWKb7twBjKk8g8NuU1J6s9vD5cWt59WL5I
         2TEpcyDOCjxcOsCDyMwLHZ+X6jo3PPFMpYm+AMbNCGz13+9SoHLcdyYcthfPyrH/hOcI
         m9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zpnAJjPsQ72qgGlmkk/7jsWZ/rYDibe8awDcZ6GZ8QA=;
        b=eVz0XqpX114PEOMABv6JpWaPyQIqt+PpEOBrJjlCK2AHoA47t3SFs/KvUo0B9OvSSG
         cB7jrVqlsKSKQHwMXtF1FwB9ep453VEqBwfUOnpNJsmCbTQ3NGt7R+Ow66A3LdM2+4id
         8e79OtKEr1taiJgTBRL2JC2fvbybjfd9meoY6iGuwl5AZqWtG7uGCVnNum+C9kkfsx+Q
         ejnh6UFGT6H/6IEjjSDLPa56eDWkGhMwjiIS0UExvlvGOcuPTG8FH2+r03JAED2tv7kr
         jGMC8TGgq5LLiN5S+9A4lVTd01s6xfvI3s9NfhFq6P96py755H/t3J5HVZxLimsNnvjx
         yePw==
X-Gm-Message-State: AJIora/6A1vYMYvw7TuO/0DLIZlxQnHh1cYjcO2YEs7fWfPuYvrn/fwO
	QHbVBR/p7qzw66frxEBXtW8=
X-Google-Smtp-Source: 
 AGRyM1voGEGVirhv/C49s8yq+gzXRQi3qd8gjA1017E+nsI5ANyNHfFXAzREhHJSCynhzV1YwAZsKg==
X-Received: by 2002:ae9:e8c9:0:b0:6b5:e58b:7f5a with SMTP id
 a192-20020ae9e8c9000000b006b5e58b7f5amr111797qkg.741.1658500871424;
        Fri, 22 Jul 2022 07:41:11 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e?
 ([2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e])
        by smtp.gmail.com with ESMTPSA id
 a8-20020ac81088000000b0031f0485aee0sm3030206qtj.88.2022.07.22.07.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 07:41:11 -0700 (PDT)
Message-ID: <6fa93dd7-9068-52c7-aef1-203311ef670f@gmail.com>
Date: Fri, 22 Jul 2022 10:41:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: fix build failure on 32
 bit architectures
Content-Language: en-US
To: Gianfranco <costamagna.gianfranco@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
 Gianfranco Costamagna <locutusofborg@debian.org>
References: <20220722091924.958556-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220722091924.958556-1-costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 14:41:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97953

Hi Gianfranco

Can we squash the three patches that you sent for vboxguestdrivers into 
one ?

Thanks
-Khem

On 7/22/22 5:19 AM, Gianfranco wrote:
> A variable has been renamed upstream from BUILD_TARGET_ARCH to VBOX_KBUILD_TARGET_ARCH
> 
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>   .../vboxguestdrivers/vboxguestdrivers_6.1.36.bb               | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
> index 70ddb436a..37dd0224d 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
> @@ -21,8 +21,8 @@ SRC_URI[sha256sum] = "e47942e42892c13c621869865e2b7b320340154f0fa74ecbdaf18fdaf7
>   S ?= "${WORKDIR}/vbox_module"
>   S:task-patch = "${WORKDIR}/${VBOX_NAME}"
>   
> -export BUILD_TARGET_ARCH="${ARCH}"
> -export BUILD_TARGET_ARCH:x86-64="amd64"
> +export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
> +export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
>   
>   EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97945): https://lists.openembedded.org/g/openembedded-devel/message/97945
> Mute This Topic: https://lists.openembedded.org/mt/92544071/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

