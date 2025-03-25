Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4572C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 10:43:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.62408.1742899430701904466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 03:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBdpdvaQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so9484533a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742899429; x=1743504229; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgcT9bBrnJ8Sw1QFN/MWHFbwpFV8LQrIzqP3qaIg5Js=;
        b=fBdpdvaQKd/uBbKsNbY5Oq1ZB2zRJMGrEvhUr9bOnojIcOlm9GYLbO+wkHenFb9bwh
         aF3JIAXIG01FieFZ9c6yqal7n+nj829/mWDYLW4f7CjMQIOGfXdTdQ1hds/GKiG3rnUp
         OW2lm55VeDX8iPJeMI7ODX2RnMS1w1Akm+XtAIF2sHPfJfUOHtts3GR5xXSL0dBDOFOg
         aXQ33h1OhHO5kYyalOff2grHNuYz4CuL2gWWMUWQPs07IUIeak+3lXWBDQsEQsabnKhr
         MLVkePHah+EPD5poxSYIMzDZjkwtGM9M6QD+c0ehXr4GfccpG9c5HpLUmGXkjMmv89c9
         9hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742899429; x=1743504229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgcT9bBrnJ8Sw1QFN/MWHFbwpFV8LQrIzqP3qaIg5Js=;
        b=vzYB1tUNHaoKHAeqhK5u/pKB9hhddHcpD9EWDTDaajaYYPjXsubuvtKhxpOqDxLTct
         LDsIXK3j98uggzIFxybBSDUkAHKw70kLY01IB1C/gJkxsAgUBf/Iloy+fUY4kcwp2aRx
         RdMNBG71SkBJ6SJIbfwox+6Z91UCniBcsmJNxw3fF8F7Hss4ks7kol/2gwSE5xdpCjTq
         JJPs20dm1Ckemt6aJlAK1A2Haq6c3NXV+lT/fCOHFfhgJtQ75RAJSPRzBdh8hU9uIKGW
         z4g/ET1k2RDm3oSQ9VCuuga5ZMjUNn6B4zPS5YFIaXDR++YcdYPxdRby+tsh3OmU0r9o
         U9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuq/L9YP+PNvBpcZvBPhioJz+2Gbtc6zumbNW/b7odXovGx0yQfR2SFQFlWvcRvzRWtcJp7TrAwoQD6y018cJtYcM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMmRj8wYIpqjHL+wPBK0aqZRFJM2O4soOTsuxewcLfPhsqZqaq
	Q3Kfao35lDT9tgD5PH87mVpTz28oPkpHTYDTDNbU8nISxL+F1jwE
X-Gm-Gg: ASbGncufKrmo4DYZFi27eiFONbWJtbkUvRB15oA3XxnOntVJ3I8dkeEBB7qLNSSBdAs
	HAiMHeA71bH48X3VhMnlTskkdY/9K/wEGPzxBM1Rm2c03vE21UPkaE74CpwRM0kDqggvEqrh8ys
	7r2Tj0ak0fO5dNH6J3gLsfEl5nMKlLGqukk5+D+IPLzFnxeVBrj2hxYnhaS1rqMo5M58a3nicw+
	t8RgL6Tz8tYqNhTBQt1Hip9i8BWaM/y3E68IfuMLENue+A+fVL8YCDeq5TnsFKrl6S0fISUqN2w
	9joFnPwlQlT0Weka3AF1M8tGzw7nyJlCoHPIFPlHwyNnxtBnp+y9
X-Google-Smtp-Source: AGHT+IFWTOiGa5zOoSWCVCBB8qKEspIxqI+bMbyBM7u1A6tGYrMaADlnqLECJaiGhJZ7ISbIr8gSLw==
X-Received: by 2002:a05:6402:414f:b0:5ec:9513:1eaa with SMTP id 4fb4d7f45d1cf-5ec95131f99mr7045180a12.23.1742899428762;
        Tue, 25 Mar 2025 03:43:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c7737sm7666192a12.49.2025.03.25.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 03:43:48 -0700 (PDT)
Message-ID: <e844376d-314b-4395-ac46-42eab3f71e12@gmail.com>
Date: Tue, 25 Mar 2025 11:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH 33/45] python3-protobuf: upgrade 5.29.4
 -> 6.30.1
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
 <1742893312-3809-33-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1742893312-3809-33-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 10:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116270

I think this supposed to stay in sync with the protobuf recipe, which is
at 5.29.4

On 25.03.25 10:01, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-protobuf_5.29.4.bb => python3-protobuf_6.30.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_6.30.1.bb} (95%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
> index d39c5e9790..48853699ac 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
>  "
>  
>  inherit pypi setuptools3
> -SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
> +SRC_URI[sha256sum] = "535fb4e44d0236893d5cf1263a0f706f1160b689a7ab962e9da8a9ce4050b780"
>  
>  CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116261): https://lists.openembedded.org/g/openembedded-devel/message/116261
> Mute This Topic: https://lists.openembedded.org/mt/111893783/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

