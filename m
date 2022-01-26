Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDEBC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 05:28:05 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9120.1643174885080814453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 21:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WomS7O8X;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d7so21407621plr.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 21:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m5ekc9bDB5z6A2h0wVAeDKUKKIKBm3h9JiOmRPQBkd4=;
        b=WomS7O8X1zY+ZWsKR5WEcVy8cLQApUF0as2bGVu/kI1GKLGXb2vz6uO4geoGlYZkbJ
         lstxl+YRT/ts7BtcKn7EETczJBEGI/kxczPZWQ17VGsvuzEpuL2fjieUUVrMf4nlZVC7
         21mz4wWEAmhz6+ziHdIk3HD/Kz0HLCav0ZIpMLyFGXiXG+4fngBkUggy2bEJhydGkpcO
         InN/flwVpx9fYUTDdBMJiOuB6BpgW7WqAIV6ANHUqfo79ELKH+8oFORZ3i1N49gn/HWV
         jq38e1fP1dvWHlMiAMA8zRLf+OJebz6QehjS3mfPnM6FOcdQJnYPi+6x0JXrePaCHxia
         N73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m5ekc9bDB5z6A2h0wVAeDKUKKIKBm3h9JiOmRPQBkd4=;
        b=P0y7FZR9WE2iCRG0cU8bQ5ukpGA2dUX0nH6f4+RqPyNV7aLmQWAlHObPYNXpExUhUK
         +xOkXdj8iRvkRT1lomipC//+4YQJX5Uw7er0OjqEV4+iwIoIb+TYK30kQfQ/LccFpPv8
         cEs9/NMisBy2XeovVuqcKgPYmXiZO2R3639Kz/Hht/7kNxyo2TBoYL4gYFdkHD9mQAdc
         45BxLDZ5TaacEnlowOfNy795juAwSKwcbwoTCafyJwzJbB1q8KqeQvbfIlvJGLFhoYOv
         Vmg+jSqJcpb6NDbRfByX25xkpKPCV/S3Bot8mhozJ3afRDdSvXyML3nK1nYEfVau3d3f
         VBFw==
X-Gm-Message-State: AOAM530WFeJ20Y7Hqi59ijSss38eR7fCpXtCoPMd1PkjLmMUBAEE6zXj
	pBmmPRXBx83xT+5bopkxm74SQir1A3StBg==
X-Google-Smtp-Source: 
 ABdhPJzQmDxwCQhxFDkhrXWm3QNZsJLXUZEmLQNEwKsomwHyI2lKgKmY4oSoJz3Af7LcUut5/7gAUA==
X-Received: by 2002:a17:902:9346:b0:14b:5c12:aa15 with SMTP id
 g6-20020a170902934600b0014b5c12aa15mr10526816plp.81.1643174884339;
        Tue, 25 Jan 2022 21:28:04 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:d69:3d63:6b0c:a11b?
 ([2601:202:4180:a5c0:d69:3d63:6b0c:a11b])
        by smtp.gmail.com with ESMTPSA id
 oo2sm681361pjb.31.2022.01.25.21.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 21:28:03 -0800 (PST)
Message-ID: <dd95de48-32fa-7ceb-3b74-bad9a92a1895@gmail.com>
Date: Tue, 25 Jan 2022 21:28:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][dunfell][PATCH] wireshark: Update to
 3.2.18
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
References: <16CD92912842F5D5.18975@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <16CD92912842F5D5.18975@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 05:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95095



On 1/25/22 09:09, Armin Kuster via lists.openembedded.org wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Source: wireshark.org
> MR: 114425, 114409, 114441, 114269, 114417, 114311, 114449
> Type: Security Fix
> Disposition: Backport from wireshark.org
> ChangeID: 8663cdebb2f10ee84817e5199fa3be0acb715af9
> Description:
>
> This is a bugfix only update.
>
> Addresses these CVES:
> wnpa-sec-2021-07 Bluetooth DHT dissector crash. Issue 17651. CVE-2021-39929.
> wnpa-sec-2021-09 Bluetooth SDP dissector crash. Issue 17635. CVE-2021-39925.
> wnpa-sec-2021-10 Bluetooth DHT dissector large loop. Issue 17677. CVE-2021-39924.
> wnpa-sec-2021-11 PNRP dissector large loop. Issue 17684.  CVE-2021-39920, CVE-2021-39923.
> wnpa-sec-2021-12 C12.22 dissector crash. Issue 17636. CVE-2021-39922.
> wnpa-sec-2021-13 IEEE 802.11 dissector crash. Issue 17704. CVE-2021-39928.
> wnpa-sec-2021-14 Modbus dissector crash. Issue 17703. CVE-2021-39921.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>

This fails to build on arm and arm64. Seems to be lemon related.

- armin
> ---
>   .../wireshark/{wireshark_3.2.15.bb => wireshark_3.2.18.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.2.15.bb => wireshark_3.2.18.bb} (96%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> similarity index 96%
> rename from meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> index 36e84d0ccd..9c234cf3f6 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> @@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
>   
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>   
> -SRC_URI[sha256sum] = "32f6cfd67b00903a1bfca02ecc4ccf72db6b70d4fda33e4a099fefb03e849bdb"
> +SRC_URI[sha256sum] = "bbe75d909b052fcd67a850f149f0d5b1e2531026fc2413946b48570293306887"
>   
>   PE = "1"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95076): https://lists.openembedded.org/g/openembedded-devel/message/95076
> Mute This Topic: https://lists.openembedded.org/mt/88676633/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


