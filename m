Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C87CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 12:44:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8619.1762346695248899302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 04:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+GOKUeG;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4774f41628bso4245525e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762346693; x=1762951493; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AATbUXd9e7300tnSag+/a9BoCbf/CqdAE/fyRUK3ieQ=;
        b=l+GOKUeG0MXhrdpUr4z1wLlVMdktqshOzc2Yu3XsT80zz3x6NeZQMUOOWCP72e7bHh
         JeT6YiSPJ02EhZlgIr+Kt3friNiECpSqJmA6ldf7FOiJ3Iwlc9a9Kzd/nI9NEWMVSAKY
         OW3CuLvERCPGQLJHo3JVpQrifuHIm6K5q7q87DelHvxzX2a0SeaznxvOgOU0vBIW5qg+
         CAUExNCUbKDUXlloKTUJ9C8ZW6QIMFfsc4ULD+/NPZFS3ki1dlRSxPxmLs5ibmSQXTAb
         XYN0c55TW0TBhVzpBr2WuK5NXqx5gEP3ttV6zGJQX9CdnM4czQwFVUxFLSBXGorMpEDt
         Npgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346693; x=1762951493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AATbUXd9e7300tnSag+/a9BoCbf/CqdAE/fyRUK3ieQ=;
        b=S+A2goajjXxSo72x8VbfXCSAXpQVZou2f/NltghNYzt3klpEllIjYn9ojQPYi2lugk
         rCRiQV0WDsdOgKeDxbF0XnEnkd764gcW/nunIjTyUIuI9CAxHqPajmoczblK438LKt/Z
         x35LIhmZELIOV4ItgpvcM2ummgiZPST6pxcHypkFns+Oxz1NSqHWoEg1nSKgJCTnf2+B
         OE/T02oku++D+XPOm8ZCvXAD0TXRZvbSmt2SB0sbZXhmAonob/m1lgFSV66H0xzqSUTM
         hyXL/q67Ahk9BDKGAgOMIDTV7WJw+94VnhhFLuCwTFX2cjNNTyVIaNaUTmp+xRtv+Qw3
         fWxw==
X-Forwarded-Encrypted: i=1; AJvYcCURyhokdWxyYF2bR43fDeLYNeap6C8Y9BmPU54xx1QoAXV5CVQxL3GidK+TkCHGxaPIGCbrgiJs+7e+P204IVv8imA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFhK1+jmtU1NCG/kFvUGiUYntMRC+6j2hxY8SuDlLjGmLm72TI
	wqoCG4GXNv7XQx7565McFtti68/un6+asIMfBq6IwlhIfMHhoxBpK+ddZIveveLp
X-Gm-Gg: ASbGncs1pcc3j/1b8v/Fa5p2IqDX17wG8Db9ZSkxxnoigOeg17YyiV8j55LvQmOhAon
	DYhjTzK/Ofi8OGcRpV7q68l1h0wJJPUH5fWXpIe7UUFUfVfVwLRbPHGA2KIrLiTnCip061bpptL
	vskCP5spoNZt70rBmhNBiuVE7hbmeZ5I4bXIWpvsJlqEHDcbpa50OgTPRahQBoGYz0t4WbtlbLv
	KsIL5DKES+Ljv07gI0k4dIoEPWFFmBiyaDUXDULURBqLpz1tx9qKUdaAHA04e4U0cVc5n9UTdMt
	3DddNR1S0Inn4FBnUNeBrYiTyBHuQh7OYEJ1+rmAmcKg2k9EPcFiLTTEXT3Kv7hIs2JwBB1AWR7
	41GxwhEokawGWGGMNxEObFnU3EcbNdWQwoOIvksA0mkLj1QRbiGI5C+I5jqorrP0Ki8GFUhFDQI
	05ONIE9A5k
X-Google-Smtp-Source: AGHT+IEAmz+Wmo4d6pEsjxu2YQnw6H55YhMrEkajByLVz2RmW2WQA8v9g8iygAgUtWGPAqpoDU4rTA==
X-Received: by 2002:a05:600c:2d05:b0:477:549b:29ec with SMTP id 5b1f17b1804b1-47754c24be2mr42811495e9.6.1762346693235;
        Wed, 05 Nov 2025 04:44:53 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558d8a1bsm40951035e9.7.2025.11.05.04.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 04:44:52 -0800 (PST)
Message-ID: <fb9d9a9d-7d44-448c-a8ec-fca1e42e6e9d@gmail.com>
Date: Wed, 5 Nov 2025 13:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] fluentbit: add support for in-ebpf
 plugin
To: timotheus.giuliani@philips.com, openembedded-devel@lists.openembedded.org
References: <20251104145541.2177979-1-timotheus.giuliani@philips.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251104145541.2177979-1-timotheus.giuliani@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 12:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121326

On 11/4/25 15:55, Timotheus Giuliani via lists.openembedded.org wrote:
<snip>
> +
> +Upstream-Status: Inappropriate [Contribution not planned]
> +

I think this warrants a bit of an explanation: why is it not planned to
be contributed? Why is it better to maintain these patches going forward
in this layer, instead of adding it them to upstream?


