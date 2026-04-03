Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964BCD7309E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 05:14:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5376.1775193235562151487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 22:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hgelEpK1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb14227cso20916375e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 22:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775193234; x=1775798034; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgUPKIV0J1GLYna0OdhhyATkTwLInjkBkuKi6gCcphI=;
        b=hgelEpK1YopiKQNaydQ6ZPKkvx/Ky2jFXVDSMoRzbKr0BdRVkgBR+Hrx/iUomPFfZ7
         k00w1G8jfDOxHWE8QgtLu6UKP3Ny9IHHVOu73qCoPebOj8Kn6N26e7gqcuwvXWTrJA8U
         8UGHyPHHfyaMGaL8J8vEWAlvS3g2uE39/OmPhod0CGCMHX5WstqO6KzmL3ArY98lioHc
         NG2CqSnAs39qZQDVtlfjnYAQ6vuNYLlJ0UabcZJfqCsQYDp0X49lmhC38xjuepUVrvtx
         RjM5mwd7zLuLVkdeAMXouyjzhtPgRLHXuhBE/aIfvmREo8d6ydWrDr6Wj47m+yrmnLXM
         aO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775193234; x=1775798034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgUPKIV0J1GLYna0OdhhyATkTwLInjkBkuKi6gCcphI=;
        b=Xox01k155E7UDn6QV1XS53rgZHBSruZZHygbtDTT0IZVW8kkReNahobmeTewmPvO/m
         56uHuGrUkGdaZHFs680YXNd9Tif2clnV9rG2uHlrBGGOdR7v1MJXHXRbg05J7cUbPjcr
         AHboAH4O+XA7MF37QNhDim74stCY99maxDa3STmVwrA43lzA+I3TNxIbxc/Dlv3tuInL
         zVWTz9uWJsJU90IawJ7fYBkqZVW4g+Ui0lMS2v0huoRdxenuN0dMgPJPCkQEOcazrStv
         nLFTt6Au+5Zx3UV0m+AxT3pTqcy1yRtKwPI5YS7oz5NCD1CWKwMbpdqEe8rzWpE+XbD+
         NSYw==
X-Forwarded-Encrypted: i=1; AJvYcCVKVoUEPe4hUWFWYTzq5d6Z91N2lutEls0dX9WtGFt9xjGa20qgi9whxeWA6jJgbNuya3/yNj95LLBGHzay03xr18w=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywq0SM/tdBe63jx4t0Lewf9RRfy8au5m9eA8Agj+6CQ7ettTvlZ
	thwRLQyUfuvR0h9QR7odq1xHzpKev8aKWdxQAhlze2ZATscvlmZv8ILT
X-Gm-Gg: ATEYQzz3nBx3jhNLQu5HtMpSlhwF5sSSrzEavGhwKgBdhNTp+VLXP/CJZJz6at4sYCS
	/ocfDqvcSh/cmmNHxKHmZrWSvJrd3DoaeZi2ziHbcps29cul3AE24FKz+VPXH1R+DBOspFPojU+
	8rLtclDrQX1kTc6TLvuVDAo+R7kT/AU2elj+P6w70ncFNyMeHxaLHnrCynaeYohKioG9ig3Sh4k
	VEZ3VKE5Mljp9il8gg9rx2TIpa3ksKaTRN/tN7tznUo/MtIWK8gM2qSv0kB22g/BfJO8UAS6bA4
	cWV9sxMtxNPNnXDJ39Rn6jA32WPuJPIsfiUsX8QV8f8uf91bXciDTYLJ1kn6Jzkgqaze+MFAfb7
	JLyfMZmd6QayED0ERShrsKWxbi7tg00AWTlyMSB7oOEy8Baiq1vYJcfzlD9i3lni0yLq1xliR+c
	WMgALfzrgTefGXFHyykWI6eYHl+Zcjnek=
X-Received: by 2002:a05:600c:4ec7:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488997ee016mr23613145e9.23.1775193233502;
        Thu, 02 Apr 2026 22:13:53 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm398951695e9.2.2026.04.02.22.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 22:13:53 -0700 (PDT)
Message-ID: <98cc4863-d04d-4d61-9509-b70f5748bd12@gmail.com>
Date: Fri, 3 Apr 2026 07:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] thunar-shares-plugin: add missing
 HOMEPAGE
To: schonm@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260403012420.4784-1-schonm@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260403012420.4784-1-schonm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 05:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125970

On 4/3/26 03:24, J. S. via lists.openembedded.org wrote:
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> 
> (cherry-picked from commit e5c5731771d9b0acd2035338ac6760963f0d0229)


Since it's already in master, I assume you wanted to send this for a
stable branch?


> ---
>  .../recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb  | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
> index 3b4f38da02..b270ad0838 100644
> --- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
> +++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
> @@ -1,4 +1,5 @@
>  SUMMARY = "Quickly share a folder using Samba from Thunar"
> +HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-shares-plugin"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125969): https://lists.openembedded.org/g/openembedded-devel/message/125969
> Mute This Topic: https://lists.openembedded.org/mt/118643900/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


