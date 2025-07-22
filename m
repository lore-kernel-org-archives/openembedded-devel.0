Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E164CC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 07:35:21 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.7095.1753169718704213596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNsz6SvV;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so7611702a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753169717; x=1753774517; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7vSArDF79lBlXzilhQGoKSGXV7N2BDBJ/nbQpMvNCg=;
        b=JNsz6SvV21jLV1pNdbFokbExBvz6gJugWTwcuU2qF6VambqToc+yzC0niUapkCpZLD
         KwigmRRgZJvKpQXU9AtZNYfprF6fe9x21azel3xhp0Tv8LRenWfYLdwxIfS3Ki5zPQ4c
         syru9HZOULI+SoMobe6p4FUMon9aFOPQGqZ8cIDwK9b6TZ0SPnXyScjiaSg7oLlptyCw
         YmGGH+r3nm68sCCQXSzJsxIghQwx7T47e64yDNV3qfeQTjfanSCcHuDGMYMn+2H9L/zV
         yxKeJjDrYF8dpZXUG4Lg3lFSCk/gp5H3xxkJsl3PHB/ZWJs8F5ETuGOxzI4W1CcrwWkm
         bXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169717; x=1753774517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7vSArDF79lBlXzilhQGoKSGXV7N2BDBJ/nbQpMvNCg=;
        b=rouJ1qOfUSL/pkMRGM0wiWkyPnHtVpdq2cAI7q6i4IyIxFaPukJg/9/fXulOzOGnXv
         Y0y7bZ+8B/Cn2OmOQhqG3Q1kvAeVE+vgzCHhxP5aOqAtQXFIpUN2dqYeBipYRXCVgT+X
         CUcsd1helvFgkopDI8WEFl5vIRW6GVDUtXKur+ICQuYqoOhk2wa8iIjnLh4nmQKdPdVm
         ErmycH67STKs3dpbknc/fb3tbzNrTk76wkOdsrGdBhqXaYCJ/rdt15yOHX9jE9pGTiok
         Z5RNLbpOMBddL9Elpn00EqUaqHfogP2Z4LnF28vgbivrji3rez+tI89Qd2pa+A8F8y3q
         N7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUp+SWo7m4AOinf/Wukehbqa2FzFx21eG6qARoIQ/T8dl1KiD3eN4L9cV0C+bo3g6KxeWckWDJHTTP6BIYhgafsoFE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1P/+SLCbyyOItcIRJ8zdI8LOLoxmCVbMtpXKt4vcx0Cg0GJgf
	bQ/o0SohIqGAKElOL6p0flmbGSislI2hZzqb4gIAnP9ZFzQbXvlbU6U7
X-Gm-Gg: ASbGnct1FZBAeIQpZLKUmdlDD83iXPlvEc4iYpUXBCEC14G/Ig3YsHzdCH13nlaU43a
	zE/zuYeOXwmtK8vbJf+BXmCOAH2922+QNRHqZZYV09vGaW+alNkHTEc4zXdFUiLloT4TW3WbM2L
	NDym0z40imTK5KR6f6ADCRxhLWFUbXfRzlz5RijuiYxJ5XnpC0QNEkgkN43ntTJqCNjYJL+aD6j
	N/EPdlPRRGrcCefIuqUwKoxy3at6/L+MZggNl+NWTFTMeufnvZZtuWan8JFXfmlJk5xVWkiszCI
	eyTRI6KQZvGvVkSd3fuOvY40NoUXrUsJmXzKonaZSIq3nUulHXCWI4rA9Dqmo29Xh+MVBXQJi4l
	bFxkdqvmAjIG8CEMC3hOR271i4ihApg==
X-Google-Smtp-Source: AGHT+IHReo1MIILn8/pxRaaihplnB29PPjeFOskcR8dOxKTUgeD/jRY+nU+kgH+Tye5pgL39Ke0lRg==
X-Received: by 2002:a17:906:ae8d:b0:ad8:9257:573d with SMTP id a640c23a62f3a-ae9cde57740mr1651752366b.24.1753169716374;
        Tue, 22 Jul 2025 00:35:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a1a9sm815746266b.3.2025.07.22.00.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 00:35:15 -0700 (PDT)
Message-ID: <d49c1275-7214-40de-bca4-5696c85cae0b@gmail.com>
Date: Tue, 22 Jul 2025 09:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH 15/21] python3-twitter: upgrade 4.15.0
 -> 4.16.0
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
 <20250722031245.884-15-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250722031245.884-15-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 07:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118689

On 7/22/25 05:12, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> Licence Update:
> |# --- PKG-INFO
> |# +++ PKG-INFO
> |# @@ -1 +1 @@
> |# -License: MIT
> |# +Classifier: Development Status :: 5 - Production/Stable
>
> License-Update: Changed from 'MIT' to classifier-based license declaration

This shows that the specified line in the PKG-CONFIG has changed, and it
does not point to the license declaration anymore. Apparently it got
shifted by 2 lines to line 11, and it is MIT still. But there is also a
LICENSE file in the source, which would be a much better target for the
LIC_FILES_CHKSUM



