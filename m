Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F985E674B5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:51:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80307.1766411483115130015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 05:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RgiHbQyG;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so31195165e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766411481; x=1767016281; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bcj1AkxnBCu3gGNTZAN91F6FtbH4MoTNGAOm3FkjSmU=;
        b=RgiHbQyGZ2a1+UFm2U8JAWE2kBkZpU3Jm/4N0aYKm8d3nSvggLkuxabfIuaEF3cmfg
         qavWHRSGWGF4xSxmiobyoW4Sx4tYK5d5Jfp5t7tDTpR1UPMGrgNrERZOPRHsXcZFSlqQ
         6NlH4WYJM+OjiQOhtmRGa8uUbwtUkzH28k6/ZwFy297Z4XmxMHLxbxNoMSINm4mOHzRJ
         UwyFYZweEiGD9ocSxt4F6coFfKR2+1OOyZfepYyKdWgJ5C6WSe212iVNI0d1wY1kArKl
         4syyvLR2LrUw3T6QN9UIxrrCgXumT+S7WZ7gg0xVWL3bmh6J5XcNJvd1q+4EuM/cp/fO
         qq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766411481; x=1767016281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bcj1AkxnBCu3gGNTZAN91F6FtbH4MoTNGAOm3FkjSmU=;
        b=KYthyNW31ulKMHvSPkNgtJ9cQlUn741ypmEN85dE6Do0YuKJCHZdr/3HRq+D9XoOEw
         GyQ25F+k4+y3zQm2q0a/fg2srZ7a0TLyo9mY7f4pQP6XGj+00EwTZoVZx0l2zRuWZG6h
         gNpaWd5XijLy5vq2pqi96wTfXsUfpGV9AGHmIw4PJb45J0x+vGvhbe6jJoUgpGmROoVv
         TxsREpxNvL6zZjy+chsa5F+GTrlXVFXj+YfrhdAJ0xYeDPCwuFIONpQdcq1XP6GN8Qzu
         2KSEWHNs4JmVtroiUKfZSCxWuydxQfJo/qGvRSf5S/7gpQXl+tQ9af3lHh0hXAxgsT0d
         AW5A==
X-Forwarded-Encrypted: i=1; AJvYcCVY5NEWvYHA6+YwYryx2NV4OGwiFbw+PMwwMAn3xSArxAT1UIqTrewc1ciOwG2yHkHGXYOx3r3AuFmKisExGP3DBRo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuPhgu0yQHBLohV2E4qFlgSE9l+2ddwm1jrUV7rErWyoDv1Lhf
	q2l5PqADjhVhVzi6JQvUf35fx9syOctjD9MPyiQ1GxkDSBr+MaU8eKas
X-Gm-Gg: AY/fxX6pkhRM1vXwI2Qd7di92iqtSjMPL98musBMBRKyV0r/UzInStUFCHuA4KcL8xb
	bYNuSUAaQ6/vPoOL9fF2rewjk3ywJ3MEg6NXhE8bGwEdI1HhiNHFQb/dpqWOnwSDcFZlbJSQqnr
	q/rjYD1jc0wVgPoyRCmOn4ZZv+H1tHWjK99FNEfd8G+G42N90WxGhDHCwVm6NFt2laRZCZfc6rU
	YZ3YqTBTAAxTdxzUO1XdKRs1ctJatFFFNxWGTKkwV5cWH/biRRE9RZtupwtbr9eLfavQ6CPntTh
	gZw2i3nUuoyS6Wh0TgNgn7PqFwZpmdbYWMBVqDMKeOpEMYfzC5hwps13cJdds6b8E/sfqf/jYV2
	KEf9gIFt6BrcXWPhutclkgIAP/z/fMuiZWX6RvhCs4aWM4DGAw2oxJfM2ofAfXUK9HvAMBQULAh
	Uk/itiRVb+XRiMdkw35M8=
X-Google-Smtp-Source: AGHT+IEzUQ+f7lh+tYkcwFM5NMAbyyqNYtW+ggnMfbvtotOxrnq73mt1CO8nMGqupAKRbd0CynObig==
X-Received: by 2002:a05:6000:40ce:b0:430:f2ee:b220 with SMTP id ffacd0b85a97d-4324e4cb94dmr13284426f8f.19.1766411480998;
        Mon, 22 Dec 2025 05:51:20 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm22284852f8f.37.2025.12.22.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:51:20 -0800 (PST)
Message-ID: <74f86d03-0aac-49af-8464-40e9705feb11@gmail.com>
Date: Mon, 22 Dec 2025 14:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-selinux] [PATCH 1/1] systemd: create backlight
 directory via tmpfiles for SELinux compliance
To: jaihindy@qti.qualcomm.com, openembedded-devel@lists.openembedded.org
References: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122788

I think this should go to the yocto-patches ML instead of this one,
otherwise the relevant layer maintainers might miss this.

On 12/22/25 12:15, Jaihind Yadav via lists.openembedded.org wrote:
> Ideally, /var/lib/systemd/backlight should be created and labeled at
> runtime, not at build time. The previous approach installed this
> directory during image build, which can cause issues with features like
> OSTree when SELinux is enabled.
>
> This change ships a tmpfiles configuration to ensure the directory is
> created and labeled correctly during first boot, allowing SELinux
> relabeling to work as intended.
>
> Reference:
> Previous discussion and initial fix:
> https://docs.yoctoproject.org/pipermail/yocto/2018-April/040854.html
>
> Signed-off-by: Jaihind Yadav <jaihindy@qti.qualcomm.com>
> ---
>  recipes-core/systemd/systemd_selinux.inc | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/systemd/systemd_selinux.inc b/recipes-core/systemd/systemd_selinux.inc
> index 7d466ee..f36519c 100644
> --- a/recipes-core/systemd/systemd_selinux.inc
> +++ b/recipes-core/systemd/systemd_selinux.inc
> @@ -1,7 +1,13 @@
>  inherit enable-selinux enable-audit
>  
> +# Ship tmpfiles config for backlight
> +SYSTEMD_TMPFILES += "systemd-backlight.conf"
>  do_install:append() {
> -	if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'false', d)}; then
> -		install -d ${D}${localstatedir}/lib/systemd/backlight
> -	fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'backlight', 'true', 'false', d)}; then
> +                install -d ${D}${sysconfdir}/tmpfiles.d
> +       cat > ${D}${sysconfdir}/tmpfiles.d/systemd-backlight.conf <<'EOF'
> +d /var/lib/systemd/backlight 0755 root root -
> +z /var/lib/systemd/backlight - - - -
> +EOF
> +    fi
>  }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122787): https://lists.openembedded.org/g/openembedded-devel/message/122787
> Mute This Topic: https://lists.openembedded.org/mt/116900764/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


