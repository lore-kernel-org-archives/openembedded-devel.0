Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C133CC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:05:03 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.3318.1641402302478411911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cN+4/WUu;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id v25so36030024pge.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=WeEnJFMvSxqraxowU6hDFxIbM6dOXP3j7Uqmhmwkpws=;
        b=cN+4/WUucQ79gOj0LeMcknc3br+mg2DegWQ42MYD97GO8tHEaeq9VQafc5ZIEaGXNH
         Ns/itn6c/jBrzy1LdyQfy2oCODW/RpEz3AB7BPuT1Tjzc6lH09l/KW05sSF479PQNkhy
         WzCAVo6NXXw/Lqsv38ND87tishvhQexhx4UKLitw8FuV80CvXCkQA3ER4lCwazm+hinK
         sYciVB1HD6NMaaa5VuY70Q8h074/XkAzKrXPb6wg8YKzNFPMGLnoPhrHHKRAnfw7EPqC
         /Vrdi+FJ7ruVP5oafOz6robwyaA/II1zKWvlBUFI6D2bIKTl6CwVZ9O7rMM129WmzCnR
         +G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WeEnJFMvSxqraxowU6hDFxIbM6dOXP3j7Uqmhmwkpws=;
        b=6t8QbwjVw8SuSECmQr18q5xtHfI+/Us0YjgOV0CyK83b0uMooSNvQyCLqmMSmFQXOT
         MIMIQ4WQTiWkPOhm3m9w2APJSFxoWzKFuF1rp+WcmRc1I6EoqX4oKbYYfI7hUdoYmAzm
         JEESprZP2KvZTnr5MBLmomHpEpzBkiO29Uyd7wYGf2HDGvYu/yAboXfkae5uW9EA30BM
         dAF01V1AYSevMorFjw1GuMJdpLHyyyxBNzHRM3oY0hlHFJJS9ZttjCL4y8Sne6Xcmnl3
         YwL3V/TItsGYyiByG6TfqE+3Nd5zg68PhEtjhDeOG3w+j0ROVqXHR5uNLdYk2Dho72BN
         sDGw==
X-Gm-Message-State: AOAM531GTui47EcNZ9RBHVRNuI04tfIuCSSogQP0vLct2a5nLq00HJ4p
	eerQU6pKrYSdpktZiCHFfT4b6WaX6owvkg==
X-Google-Smtp-Source: 
 ABdhPJyVXXMRbJhwhVFhLDTUnnR7zA235V0UZrUSsbDrhC9NexAsvh937iqyObUK/EvWelo3arzhpg==
X-Received: by 2002:a63:87c7:: with SMTP id
 i190mr49738197pge.93.1641402301772;
        Wed, 05 Jan 2022 09:05:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:4599:2855:e7d0:f528?
 ([2601:202:4180:a5c0:4599:2855:e7d0:f528])
        by smtp.gmail.com with ESMTPSA id
 k8sm36552101pfc.177.2022.01.05.09.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 09:05:01 -0800 (PST)
Subject: Re: [oe][meta-oe][hardknott][PATCH] udisks2: upgrade from 2.9.2 to
 2.9.4
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20220105075924.77639-1-Qi.Chen@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c72a57de-8f09-0459-11c1-6c79f50bc933@gmail.com>
Date: Wed, 5 Jan 2022 09:05:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105075924.77639-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 17:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94664



On 1/4/22 11:59 PM, Chen Qi wrote:
> Upgrade udisks2 from 2.9.2 to 2.9.4. This upgrade will solves
> CVE-2021-3802.

This does not apply on top of current hardknott.
This recipe already has the protocol changes which this patch is missing.

-armin
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> similarity index 90%
> rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
> rename to meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> index f9e127438..ebda86fa6 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
> @@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  
>  RDEPENDS_${PN} = "acl"
>  
> -SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master"
> -SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
> +SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch"
> +SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
>  S = "${WORKDIR}/git"
>  
>  CVE_PRODUCT = "udisks"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94657): https://lists.openembedded.org/g/openembedded-devel/message/94657
> Mute This Topic: https://lists.openembedded.org/mt/88209858/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


