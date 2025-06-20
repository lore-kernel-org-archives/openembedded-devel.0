Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07856C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 11:37:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.5710.1750419460734634777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 04:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuPDq+Nj;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade5b8aab41so355149966b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 04:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750419459; x=1751024259; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xR2GJDU9Qp67mozxsdwbUE3focZV7yoIegn78UBjI3M=;
        b=KuPDq+NjPZtlrepSbbZrbURaAI15XpBEzbXAuTZR+9d8gVkvGWuiw1OWFZJtHl3bZL
         /7deOkJXLSW7AEvtOtSulhYJECxBil05CSjJtIuzLCe5ZJK0MKyHpKpC2CEStkn3TRI9
         5a/cUl3sSY8W2n2D3MOvMrA3kmbr9gBASLIStMrLZ42aAff05e31BInK4n5TPzWIz2ep
         HTRDYlDhpOYJ0cjCQ02Vsym9zonBUea9jcnehLTvA1rnSDagOVa0e0IR967+AWj4HS9B
         Emx5BsCoVla7L7lanCnNkoP2MjJNCj0ni7tbDxgopQpBD+8lvBdZUb0MeMrctsBN2tOh
         rKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419459; x=1751024259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xR2GJDU9Qp67mozxsdwbUE3focZV7yoIegn78UBjI3M=;
        b=SS2sJ/LAGHuHMt4i8pJgDluQLXrhoSIENTPkUJyTOXPiIFyvPXxeWYQBuHZUv90qt9
         qyTqL23uE2zZJTirpEovwiD/m2eA3XURPM2ipWiRj2zgKmx7aQ8hWTDvyBvaw5qn0R4y
         hSDoHqM+q8vXIxrPvoj0LS1pYDa7zEwVw5uyjwHcq2ZiJ7RIOh56kGSFg3IQEo0NInXv
         kBRJZn9rOQyVttL8LKQuf0sLBL4fJ+Su22m6tjv2XblLiOXjKXi2jFB0CxYD3Op4Z5s7
         Flh7GVHV6CW7oS/oH0w7C8pB3j52RlEK0o3CICqL61Ny9a4Yhc6RcirXKRpr3yteDXP9
         fTZA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ENr3nC4+mZMnlKqkmVEXVnpxC3joMmMk+n7GfOqzogWdvtnTcRGolVvT/TQeVUj7XU6UW27Qqab+bYa7fpwDTdM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXlQPhJmSuxuNg3oQXDP2+Za4aQoALkmbY952VPs3YCJIU3KSf
	U+uB7q2fZGh4YfBjqNZ91gZtweh4ee0hUj5Ym4bGMr/jx5D+p9eLingP
X-Gm-Gg: ASbGncuCBkFmavOhqOnJV3GTqgpgm1FaWiu6fyQnxwC2w4i9cX6AZ0MSw9wgbUu2qWl
	9FartddS2oNYq1pHoO3oX3FfC20+afJlWi5+dPXrp5SaBEKbr+VFtKJKgDRZ2EsROcyztjvcOjW
	ORft5CSaJH4H+ADMwLTJnLi6ylZOBhESEO1vgzwr5w21rmNZsXJtGOgu9uQopmUrWZUSyF1H4Ku
	T6ySa6txuZC3XWPiBgYwX/MpUoNfd0ZhNt1RWHvRotbD1DlN8kH7rP0KcB6jG8rVPjp6IAFccfi
	Cqz0Ht58QtWN13K5pjnuy3634J5SPQbS5r8oxOmStrol78plUz9csUMmzqEoZhJeNEZjjQ==
X-Google-Smtp-Source: AGHT+IEB1GKmr0W/zmDzndo3vlnACIbnoUHAeYlf555AAa2K33UB4Is1A7NoribBU3OGKvdetRzi+A==
X-Received: by 2002:a17:907:3e8d:b0:ad8:a935:b907 with SMTP id a640c23a62f3a-ae057953390mr220675066b.8.1750419458645;
        Fri, 20 Jun 2025 04:37:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a62sm150049366b.177.2025.06.20.04.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:37:38 -0700 (PDT)
Message-ID: <96744e6a-cfb7-4b13-a135-e6f1d26e3d82@gmail.com>
Date: Fri, 20 Jun 2025 13:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] paho-mqtt-cpp: Upgrade 1.4.1 -> 1.5.3
To: leon.anavi@konsulko.com, openembedded-devel@lists.openembedded.org
References: <20250620104239.1709240-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250620104239.1709240-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 11:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117969

On 6/20/25 12:42, Leon Anavi via lists.openembedded.org wrote:

I added 2 minor notes.

> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> similarity index 81%
> rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> index 6f2efcda50..0093936786 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> @@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = " \
>      file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
>  "
>  
> -SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
The protocol could be changed to git:// only I believe. The only
submodule it seems to include is paho-mqtt-c, which is also added as a
separate build-dependency below. The submodule is only used when the
PAHO_WITH_MQTT_C option is enabled, which the recipe doesn't do. Also,
if it is changed, a ;tag= tag would be good.

> -           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
> -           "
> -SRCREV = "ac1b023eab789e829656144f12b248602c40e37b"
> +SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master"
> +SRCREV = "17ff3dc0270738adc710667be44847eebc038ae0"
>  PV .= "+git"
>  

The PV extension isn't required with this update.

>  DEPENDS = "openssl paho-mqtt-c"
>

