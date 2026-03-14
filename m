Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0518310706F5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:30:47 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15282.1773513042784679246
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XicaDtOm;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso2003006f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773513041; x=1774117841; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=343jJE9Kdy5AqTUiXNspwU300vpPm5rR9fkSWShvnYU=;
        b=XicaDtOmdmZEMrfauYXzlpftAPprG9vrD0z+GxFptXSUnTieAJU2U+8hHD7bvQVLIz
         Z9wYY9JUFmnwObo83pNWD9SO4BhtG9s3+tS0M6jEiJVUJ8vYdqymrt8r3Ia3e+S6wfWY
         0r6AqGkc7Rc/zSoSc7h6xBUKsNygAV0wF1PXSyBx8LhE2SxY+7lA2A3Mt2oUZL0m2XZZ
         7+8EVAYtoRw6JLdhzu9iiJVyHs8OmgbhCY2Zox8dCEVMHWPnF6/RwClfrxT9C293XjU2
         xVzEvLvkcXj3Qftf1YXJYxVXijkgZ4FjJfeiEdOIgYJbgWc3JXfl+5LTpiGtAr3az9f6
         gG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773513041; x=1774117841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=343jJE9Kdy5AqTUiXNspwU300vpPm5rR9fkSWShvnYU=;
        b=N6tHxVk4ZrOMwAbhAf9lcqqzMIVGmkZ0ImuCpPSJVeNX/37c4WXPp68a1f2haUzhNb
         kYYcFQXDOHwFfGvuOVx4CJHYbjeiqCzAmbTpvFeR1jpQnmI2eLQmOEdrSdpWvtAnPqTx
         CgRkkx66OMC7b0WiUl1pffwvx6wiAj4tPHE1TrAfYdlSPIFGqFTq/CxWLk+4vGk461uy
         Efgy4H0T1IVYRNTx6MnNEPLURE6Be7+csaaUvaHumLdNm0hntfIi9fcyko0ADtsPJgHV
         GL3oVxcqEeTYaI1mznssglDS6G4H6TO5aM1zo3XLfNQ76egu77Pw3zSZpTnZOcnE/BUG
         6AKA==
X-Gm-Message-State: AOJu0Yw1uDgkXgzphU3Jg2SioIIuiia2QXZ2XKNEm7nSM0V2woVzP3Ss
	SmWG7BIVeX7L9Gd3F9QFwDixAjL+Dp78eJ7cIQp0IqkerqChF/WKOo7+YGNK0A==
X-Gm-Gg: ATEYQzx9ltwNXEPwsLdeVbYblhPRAKpF+FsxK4444rPcjWFQU83/FoFVGL0o71S1ypL
	LJoPyTNGvJRD9osFNI/DrmDXfVEQt2eP6YfIi7xq/uncHdu8fV727uaGv4aBXU3laSg9LEDI7TT
	nGN7OC5EzS7cvF0SDo1sAWniMQj4mle/kuOavWuaeZv48WyhJR4ICgY+OvXMVkH9Lhw8ecMnfG5
	bb3qHpU+cf1Wl5mHtkUpwaHwLwyFAEhul26BMlDhmzD5vJXsW8iptPZypUWClA6b7puM5zSr732
	gzmskefRq2J2hNxvZVfvEauPOUzJMAXtqo5m7GbS0Ox4IFo2otBcq3eKIIrqa6PyqzmONwmWDhx
	8DPR36sME9l288V1ONk7n4qJI1vjex81FqeDj/PKArzTclF70RJ+j/IJ4NfltER72St53bb+wvM
	PUA/a9AynDHIxqhY7YNCKYdHCaRyumxiI=
X-Received: by 2002:a05:6000:4029:b0:439:8a13:2c65 with SMTP id ffacd0b85a97d-43a04db0af6mr13616031f8f.37.1773513041045;
        Sat, 14 Mar 2026 11:30:41 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm24059893f8f.10.2026.03.14.11.30.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 11:30:40 -0700 (PDT)
Message-ID: <bdc3a82f-a595-4a4d-96ae-f7edfab47098@gmail.com>
Date: Sat, 14 Mar 2026 19:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH RFC] nftables: build with native
 python instead of host python
To: openembedded-devel@lists.openembedded.org
References: <189CC8783BF6D022.1508127@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189CC8783BF6D022.1508127@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125212

This is an RFC, because I'm not really sure if this is how it should be
solved. I'm not even that sure about the root cause of the problem
TBH... I got this error in my Docker image, based on Debian 12, running
Python 3.11. Without taking a deep dive, all I could find on the
internet was "update distutils or update python" - I guess this patch is
the latter.

If you have a better idea, know the reason for this or you just think
that this is just wrong, feel free to comment.

On 3/14/26 19:26, Gyorgy Sarvari via lists.openembedded.org wrote:
> Using old Python on the build host with SetupTools 82 results in an error
> message during building:
> | error: invalid command 'egg_info'
> |
> | ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
> | WARNING: exit code 1 from a shell command.
> 
> To avoid it, use the native Python environment built by OE.
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> index 505dfc12d0..d27e60a18d 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> @@ -16,7 +16,7 @@ SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
>            "
>  SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
>  
> -inherit autotools manpages pkgconfig ptest
> +inherit autotools manpages pkgconfig ptest python3native
>  
>  PACKAGECONFIG ?= "python readline json"
>  PACKAGECONFIG[editline] = "--with-cli=editline, , libedit, , , linenoise readline"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125211): https://lists.openembedded.org/g/openembedded-devel/message/125211
> Mute This Topic: https://lists.openembedded.org/mt/118317775/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


