Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D4CCD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 07:39:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6915.1778139570737905408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 00:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pv9IZJbv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so6328485e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778139569; x=1778744369; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGQDSHpKSFoGE6+MqylWNanxQ3IOj/QgwvAhx+573f0=;
        b=pv9IZJbv7T77APrjh9k1Bl1I1HJkhqgJCKdeLwMzB3Xv1VBZycLrumLbj6cALKEavD
         ye+X1KnLNS1Z9SF7631/5BV9aDj68RuIGxfcR7IcswqSIpQTEq46XM9tmf2ZBNXg+Tsu
         +MSGxbcCOwyCpg+HB0bdCpmar/FysALn8eKT4X8jhARDZcH2C5CopdXUo9ex8if3JBj9
         /xonhz+w/MTpLPOirUPr43PVVNmtSIrMJomciiKFw1oeU8qqbyRl1t1kDZJieLRO7Ig3
         xSZ6/fsEOdeejVGIpyKZJoFf4PT281iJ/qS8a4zAnlMGfgX17IytznmQUyTqCjR59Aai
         gbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139569; x=1778744369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGQDSHpKSFoGE6+MqylWNanxQ3IOj/QgwvAhx+573f0=;
        b=j+ricGjBj4sM1GtSsMHetKxmDvA86aJ2ZetKDea/N6lYb/4pTXGA13v+9fUFpcxJW8
         G5ynq7dCJCr/upbgZC4tFxRj5xIiP7YCFDgQAwfBVgRBI2+xUIHBJdzrY2VdOgy/hnMM
         YhqBBX6GmA8SYwn+ANbo9M5FIKq/3zMYavtnfxlgEKCSJ/kpbONiaJue34yB5TlB0dIf
         Bgk3QHdn/DEPIZGLhCWTmcyPCdOIDHS3klOF8kl3oer5ubDyRmbbBVV1GbAVPgSZC4BL
         fCpyiV11Zo6Lsp2xl27nMObyoEYBa2gAB6BhNmNL9p+YHo6TOkHsoHHF3FLq9xIphm3w
         wMNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tn5LvoqsRFuEHOXt+xFuzNLK/ZgTaCr2F4ar19AW4ZHCri93TrnfXaf/V/672e3OIG+0Nv7/bbgb7fBmuL+UyUjI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGeENfQPTea7mB+ibvrv8Tw76MzpCWBqOP7xlZ8SQYd8iN4vl5
	oeBb/+fBYf7/XNNYLvamXJLALasS/TQYJcjSKmcusfYIi0HCXTc/VhmZ
X-Gm-Gg: AeBDiesRyevmO+ymQwsmYCC2eRrPYtgOyzy7pc90/Ogw4tND/TnyW6gXXmq56aJmzpK
	l23VNJFA9g06fngn7/89hyhwnz3wp9VUWrni7XM+ythRhFqUitwJBRs19fIsSqEEDKezZVU1jNt
	YctMDSi84FKzgDT1ZE/z1NLPEakg18Cp/ijTxO8cG5WaJehxSONaTHd+/cxEilbenMD4P3E5WGq
	YPTdWlTJzrG6gSBotb81i8C9cq0nDX7hqUQSoff8GmOF+Dx/wX2n9V2vXhHy0+S/cB10W4N5agv
	2wtIch9G3XYsWkyfmcdD4100HZ1fKYlcpRwK6R3GiRRf+3/nYD+hAhYLMgr7duLI64dqdd0neMq
	wC0LEMjGRKHD/cUbZu7dZ/Ah2ZAR9+CNRkUmsB22suL02qyVZnMXRS7E4svyDF097nD8l9vM6h2
	v9WF5rdKLOOs1wIr59HRw/VamPHTKQP4zyyyuq798fW2Gr2HXb1vFTw+JdbaSvCAE=
X-Received: by 2002:a05:600c:a10d:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48e51f21e7bmr83273485e9.1.1778139569031;
        Thu, 07 May 2026 00:39:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm192363945e9.9.2026.05.07.00.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:39:28 -0700 (PDT)
Message-ID: <4464a296-b5ef-46e4-a87d-90e9fcb29da3@gmail.com>
Date: Thu, 7 May 2026 09:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] openvpn: change bash rdepends to
 rrecommends
To: louis.rannou@semalibre.com, openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
References: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 07:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126810


On 5/6/26 18:07, Louis Rannou via lists.openembedded.org wrote:
> From: Louis Rannou <louis.rannou@non.se.com>
> 
> The dependency to bash is only required for dns-updown scripts. As bash is
> under the GPLv3 license, it might be preferred to exclude it.
> 
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> ---
>  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> index 0cbe4641cd..d967a0dc12 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>  
> -RDEPENDS:${PN}:append = " bash"
> +RRECOMMENDS:${PN}:append = " bash"


In case bash is excluded (with PACKAGE_EXCLUDE, INCOMPATIBLE_LICENSE,
BAD_RECOMMENDATIONS...) I would expect this change to throw an error
still, the latest during package QA, when it scans the scripts for
missing dependencies - because the dependency itself is still present.
Does it not fail those checks?

As an alternative, I wonder if it would make sense to install this
dns-updown script to a separate package, and make that depend on bash only.



>  RDEPENDS:${PN}-ptest:append = " bash"
>  
>  do_install:append() {
> 
> ---
> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
> change-id: 20260506-bash-rr-5fd0820519e4
> 
> Best regards,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126806): https://lists.openembedded.org/g/openembedded-devel/message/126806
> Mute This Topic: https://lists.openembedded.org/mt/119181734/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


