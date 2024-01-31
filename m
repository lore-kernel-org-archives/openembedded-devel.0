Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35C9C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 20:36:13 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.6037.1706733370242771954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 12:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=sil1cMmy;
 spf=pass (domain: baylibre.com, ip: 209.85.167.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bba50cd318so189996b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706733369; x=1707338169; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fz7gsdcgHrha92W7XcS4YP+i2lb7bZmViGRBtlPEUvY=;
        b=sil1cMmyqFKeQSnj3z2o790iUmL8t7wGrzkaVVvpg/rdB8u6pLSWTGtOYKNb9g0yZ/
         SJkyM9Hlb4STaMG7+FQC5ddhmh9AKX0lNn+Je0fHRTRUKMs1HdEdITBUroENqorUJIy2
         CAAO4fcpeahmM3fqm0bDWlXYXPdVBhru5ZXNJDSHN7QHtgu0F5kQl40DEREI9BGSVfyZ
         zW5fsvp5cayZ1Y45IdwPIgvib/l0LcYkn90MdTqgIgk1djSPBhEFKiY2uF5OptR7Uo8F
         CYvAiQe36VX57j/utTziEFgGk6cvS7odRA/H3V5KModfNcMOTAYzLsRZRWNvoKPml8Or
         xo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706733369; x=1707338169;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz7gsdcgHrha92W7XcS4YP+i2lb7bZmViGRBtlPEUvY=;
        b=foWiLwAuP0IuRvPCJ1tDRFMlU+txGySCJNA+S/sBaMO/kVZKfl0TZCSJ9yAQQu2bM5
         rToXxSXQ28UO63Pmi/A611xkeCpXPbSTWrhkno0Fe/yob77mJoB81bo+B6AUDnkurl2R
         0pZXU0kucVgu2rmC6yse2+y8HVKGVPsM/rLkmvTF+vC4oghzTCXLwUm9WHioJBRWC4Vl
         v0gRAGU5p3COmN+/3tNLaYoA9C6eWzkdPEmqxx6bNul+N4K2mxYmDK9ZgDTTGSdJ9qPV
         4asnO898QA9/XbHW/HMpYStX+X0yzvY0tyESRGXwvNRw403rcss+LImSbwbBK5jRXHnx
         MEAg==
X-Gm-Message-State: AOJu0YwhzW0HLqC90YjY+fNrVojECkkYZCYyP1xBhmskuqgB99yYCCS6
	H4lNyau4fRHFJLq+ITOp5FgsKNmsCUObeMPqRKcPeJ0LaXshijA1+mZLU1KIAlw=
X-Google-Smtp-Source: AGHT+IHN7zTTZHyuA3RIYX1Lfu8a344aWqdZVeh0L+WJfAHG0UPgxB16083eDoMC7VYDPVZ1zCTOkQ==
X-Received: by 2002:a05:6808:3996:b0:3be:f032:11c6 with SMTP id gq22-20020a056808399600b003bef03211c6mr315964oib.6.1706733369502;
        Wed, 31 Jan 2024 12:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWe0dUwtCC/tvb73qhQFug/WBJw6jvGLmakchF6borTXNton3+g24aZORSkIqNyMUsATpLqcTcTxe//ljBPitVxJlP5jy6Wa7mxFuYSDbmCtg/ufMeRTnGRJA==
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id p23-20020a05620a057700b00783de6b5ccfsm4649902qkp.88.2024.01.31.12.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 12:36:09 -0800 (PST)
Message-ID: <630968c2-01ba-450e-b714-c02b9561c98c@baylibre.com>
Date: Wed, 31 Jan 2024 15:36:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-google-auth-oauthlib: add
 recipe
Content-Language: en-US
To: Alper Ak <alperyasinak1@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240131074948.18462-1-alperyasinak1@gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240131074948.18462-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 20:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108510


On 2024-01-31 02:49, Alper Ak wrote:
> Signed-off-by: alperak <alperyasinak1@gmail.com>
I know that the recipe name is fairly self-explanatory, but you should 
submit new recipes like this with a short commit message describing what 
the recipe does and why it'd be useful to have in the layer.
> ---
>   .../python/python3-google-auth-oauthlib_1.2.0.bb   | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
> new file mode 100644
> index 000000000..b1e89e4b4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Google Authentication Library"
> +DESCRIPTION = "This library provides oauthlib integration with google-auth"
> +HOMEPAGE = "https://github.com/googleapis/google-auth-library-python-oauthlib"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[sha256sum] = "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc501ea8"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} = " \
> +    ${PYTHON_PN}-google-auth \
> +    ${PYTHON_PN}-requests-oauthlib \
> +"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108505): https://lists.openembedded.org/g/openembedded-devel/message/108505
> Mute This Topic: https://lists.openembedded.org/mt/104071227/7611679
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

