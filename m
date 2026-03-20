Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6F91099B25
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:11:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18301.1774026682292193920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbAP2Qlv;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7934985e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026681; x=1774631481; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bP92xB2SklevdyINYW5dFwPekDQIGoHTOX6hMPdfJ+I=;
        b=YbAP2QlvxwLVIKPsihAkrdBho+2geXu1bJObaWj/LadYP3EhhZvjkamRLODyNuDW6x
         HKNJpl0lm3TycyNtwzAtw17W+Df9rIFuJXJfe15hvJmdW7GuKO++yWKrlxzBz3B2h3dI
         4QgBWJS/okhgYNTvhOXlNsoNNnv3i8VyBjXslT7QAYJ8vKw5m73s0EVmntgGOQxfy0XH
         f6fBJNZMdf/mm4C/myqVmHr4hXR2AK7tJbBuzU6MjHi5paOaymxs/4XCD43TWsG+eq93
         8Fxh6lpURT/lpxtSqXn/x2ceSEEEuKT37Dxvmnq+95jxpgLBZsJQY4M37b0Nx/2+YNdO
         kIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026681; x=1774631481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP92xB2SklevdyINYW5dFwPekDQIGoHTOX6hMPdfJ+I=;
        b=kMh0wlMGsH+alE56aJzNwtuWOmEWQlkBiXOd2wMTPhpUrsdQdjSiQBEmBUAytCVyp7
         SCaskhcwubGQGkULaAU9qucKd9rg9OzHg1wQovYjlcgyZSVIRhTUUSxi2HsVN0E4Tcwg
         zCepWV+EKR5JALaVPz3aV9PCgVnjhdwgZxKCu30CJTRZ1sJx3QTFHuPy3xMU6EWCgOCE
         kKmKyr0Gsy5hl7bVN3240rM3IEm5xUi55I4J++LEx/Vck/tSv1h7IGFfjlUAuIczAA3+
         N4LQViVCFcyjKDzEyoQh6I7fbf2y/4BdMEqFpdJh9A5qRsM4d5uxz8OE8y/id8jc/y9V
         PywA==
X-Forwarded-Encrypted: i=1; AJvYcCX/KEckuQTOB7/21/iI1fH+ngnzrvX4QNAsxsxktmPwi4DBWjMpOv9d80rkwGM0oLkU40hsg6vskHwIBkDfvzpgI7Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz10BG3GvAYwDr16bCfvmB3KbNHZR+E06ZuKZ7FltiG8S5da4Sn
	HiXVUIxAddwtgNz6NP8p+qC2Ui4dgpuyK8rxBd9kssQ93gtf+2q0Xe+h
X-Gm-Gg: ATEYQzyDVFnfrac6AEa0mUxL+Sl+jckyBEsZ1g07oyvdHR2nxThVUaWgNsLAbFtOD5F
	EtAvAnavuzKfRldFbc7rKwVvWe3XCLtxzrB0znPdbZI7z3HpqEihEB5IA5lnah1n0w7qeiM3dmM
	rmWoUvQb7W5yCIj5ikFVwJnHLIiso9YIxaF6o0A1VjHnCXL/F6Gxg5sUTUgpuErmLjnjqGXJODJ
	ih5ptZIkcRtmhhr8V0N23XrCGnV7/itR/+oWdEGjYQr7B2wq+xTE0a0E7+uJlqctD1FMW+4OEMZ
	e+bE/F5AYgyrttOdmIJvb9glITsuHBmSCFUugXUqbU0yFVlnrquL7FgtSECCfyP6Q0ulVhLYCok
	YLWKz5/opgFR+wa/TSLr0oeOMRmJroH6IOCazVV75Ocjlj7OI1ZrzyrIL2EOy5hP2HR/jvISQJB
	bA33NU8fieJ8E7XNx3Dweu8uF9MLz98Tw=
X-Received: by 2002:a05:600c:3b07:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-486fedab424mr58974485e9.4.1774026680396;
        Fri, 20 Mar 2026 10:11:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm250815745e9.9.2026.03.20.10.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:11:19 -0700 (PDT)
Message-ID: <c0e10c9a-39fd-4cf6-9868-e1b85649167e@gmail.com>
Date: Fri, 20 Mar 2026 18:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/8] python3-xstatic-font-awesome:
 Upgrade to 6.2.1.2
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125450


On 3/20/26 18:01, Khem Raj via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> License-Update: Updated font-awesome version number to 6.2.1
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...e_6.2.1.1.bb => python3-xstatic-font-awesome_6.2.1.2.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-xstatic-font-awesome_6.2.1.1.bb => python3-xstatic-font-awesome_6.2.1.2.bb} (61%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
> index 0562cc2671..934b236983 100644
> --- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
>  HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7c083fdfe0b927a9de368a17fbf13b20"


This file doesn't seem to say much about the license, only that it's the
same as font-awesome. There is however a license file in
xstatic/pkg/font_awesome/data/LICENSE.txt path, which seems to be the
license it refers to. One thing worth noting is that searching for
"apache" brings no results in that file.

What if we would check that file instead of pkg-info, and switch to
"OFL-1.0 & MIT & CC-BY-4.0" (or similar)?


> 
> -PYPI_PACKAGE = "XStatic-Font-Awesome"
> +PYPI_PACKAGE = "xstatic_font_awesome"
>  UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
> 
> -SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
> +SRC_URI[sha256sum] = "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2c8c46bd911ab1971"
> 
>  DEPENDS += " \
>      python3-xstatic \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125441): https://lists.openembedded.org/g/openembedded-devel/message/125441
> Mute This Topic: https://lists.openembedded.org/mt/118421458/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


