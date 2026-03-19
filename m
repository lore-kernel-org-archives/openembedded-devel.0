Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90562108E1FE
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:14:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9566.1773922448608994388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=miwJuXNX;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so5306155e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922447; x=1774527247; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2fT6jNi+kYQF0pPyr3xXrg9id+mDaR/+6Zs2f2vYQI4=;
        b=miwJuXNXcGsWSuz50cIBwhM7MpPWtHSmexBctXBhJvjFLQt0qDxsSvsmkYRb8AjDkM
         mwG782UE/mAb8Ozj8uzIMZQ+o0SR6SGYgcbP+BXcyslqBEv7WYWmJEoH2ikrBmmHRIfR
         kxfF6UJ4O0Ai1O9IX5RoEeuc+FKwvGQMn3exKJp+G+bsi4wCliBAd4+ThaT+jbI76QrQ
         96JBc1BSKY5VYNgQiILcukW0KgsmQ9m4dIlGlSXhUShnXajMqjuqHiAnP3xuSoFa8s4f
         vtYy7PQWKdL9ClynmxudclH1psDECvZtPxp8HH1DdM28l3UpZ0F5G3OO7fTWauOJ5lxf
         NuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922447; x=1774527247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fT6jNi+kYQF0pPyr3xXrg9id+mDaR/+6Zs2f2vYQI4=;
        b=EwpHN59hmDlvR6+/jqWlvhYg5pm84HsnunMUKqp8NlI0JQhNJZpQKvOyOAQWVKEKqw
         l0VcBbXpWyERX8PvEZAiB/y4GDia2XvbzsCDvaiOTDWfh7bKPBwDuwHrJf4whInouCSd
         hUd2UbObVdyKfoxbyxIcqAflbYOlqc0SxopqNiA9sVnwrXP4YJbPQnubRPHTnrvoGWAL
         +RZfG8j3p3WOOVM/3F/79Yk5sXeX7l21qO17PS7FD4rpT/G3GAcngwl/RB34lMasdOIw
         IPycGQLGpHjn1JIT07m8tyUaycOXF4zG/WojT1queap4LP7GlbjwTNc6kdARiJz/F75s
         /xWg==
X-Forwarded-Encrypted: i=1; AJvYcCVwZnnLeRobzBcwkfACcPVQAscJGi/tk4zfZkY1GfahnxBzUTfgJwtcCfFYOBuE1XXPSRRJWjY+sTRryU8BotR/0E8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7fxlJzrzsKZ3EP8wR+0QDJqFErCyGaajhV7h0NSLR7Mh34cPj
	k1Tgz1Z2ukz3QCdKD5/LJSRTGfqUqBmhTzpkoCqsoUPK/NK4dFxwHNvE
X-Gm-Gg: ATEYQzzt3eOL2gILcEoE4KfXf2D7lFlFPgPqMM9HEzYKtqvjtjz4D+P76+4uN+KfFZH
	3cUHbCiYqHOUwRdhv59DL3Q6AtXUJDHOGLXtyKLwAFY6KG4taLkbQ+xFVgD6QCp0rSfWy9oExIV
	3k0YCKl/Ku7YQYrd8S0AgYcGAZVM3sBM/qNS4AB+aa5ZkGe/b41ibCWxMfNy6WzfZc+8NKgpO+6
	c5viEQsWf+ZGqzKJsjSlBdNTFqtoOlc4kKdB4nwtkPafDJCgSWk5wkWnB0EAzlv16X5HK4shxoX
	coyldraEDACWHFbw9tYVzhLc1zbSLrr6pvmXXZrkIIUe3rrSTFucEPghRaxUq91r/24dtO/LUmC
	NnBgnDgFftM/FPRrxKqifnERZ+GpEE4ajLH8MeihxLfFERTepofGwFTlK18I7Nhy3R+2qhjITv/
	dO06ZW9OqAmjStpeBZ5L8UqJ66uAAEA4Y=
X-Received: by 2002:a05:600c:630f:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-486f443841amr125410425e9.14.1773922446484;
        Thu, 19 Mar 2026 05:14:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bb1b38sm75826185e9.3.2026.03.19.05.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:14:06 -0700 (PDT)
Message-ID: <f5b55363-531f-4a9e-8b14-5341d99bda78@gmail.com>
Date: Thu, 19 Mar 2026 13:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH 7/9] xfce4-screensaver: upgrade 4.18.4 ->
 4.20.2
To: peng.zhang1.cn@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
 <20260319095547.3614749-7-peng.zhang1.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260319095547.3614749-7-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 12:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125398


On 3/19/26 10:55, Zhang, Peng (Paul) (CN) via lists.openembedded.org wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> 
> Changelog:
> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.2
> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.1
> https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.0
> 
> Removed the patch which is no need, when changed to meson.
> 
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  ...ce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} (85%)
> 
> diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> similarity index 85%
> rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
> rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> index 7322dedc29..2033eb082f 100644
> --- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> @@ -7,13 +7,14 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
>                      "
> +XFCE_COMPRESS_TYPE = "xz"
> +XFCEBASEBUILDCLASS = "meson"
>  
>  DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
>  
>  inherit xfce-app
>  
> -SRC_URI:append = " file://fix-cross-compile.patch"

Could you please also remove the dangling patchfile?

