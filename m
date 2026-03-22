Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72AAFC72D0
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 18:25:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.715.1774203947590768068
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 11:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GH/memb8;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb14227cso36539775e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774203946; x=1774808746; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8eMxbkHxor4Gkfh4ACzbJ0q+t2d4UQtt0WsXu0km0s=;
        b=GH/memb8pJRV3tYCGKbR9oMnBWEwjwnKiWLahXa8oxmFIvBQqTWIY0BAdjmgq4m788
         oWAcrnLzxmvfqtM+58iHuzpuoWcH+C6Kdb4nT0v4r6jtobzeBRU3iustPNBH8Xp+6+p2
         dzMTJP1bl9CgDELz96FifhrvOq/rFj1COZ9EoVEbsdZEy6luHBJ/jB2imw8rGPVSVDFx
         q0n9KGoAPYohwrEpkXSOExi2NhBrU1kARzQOkrTjf0EB6xQY6vlPIS8L+W74MLJ9KDUa
         VoLeeFPoIe8R0KCZjCZRm7ZKHaEGSSpAMxNLQbzomivMRsD2sHd51+d1SFV6Jq2ooSwF
         E8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774203946; x=1774808746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8eMxbkHxor4Gkfh4ACzbJ0q+t2d4UQtt0WsXu0km0s=;
        b=KGxk4wjSLMIv4dveSAM+vCKAlWAbKKOfjcFab6arH/BUycAEOvaamf2i6X786J1r9v
         qvOy5r0vohkrW9lBHkTUb8n3rbwJiEqKd4WbaNpYM+Mom/C32jvkNx1sGKqlVr+qHk/S
         +2t2wapkP5V92gN+c+27EyO7sdZlyysAZWIBo55mXlzQ4JqgCtX2qMzgvA2E0xnWvgKT
         wbmo0UVfNsCuD/a++x5pSPEqeihm6t6FaUJZTY54/tVaL+0yWD8pUgxorkMauvRZvw2Q
         bytrWa0IpXb9iGSP2uo/ykSib3w2mOz88vnLDpIOnTUE6ZsrBp55VjJJv/JRFv9edvEj
         wQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLhehK0Hs++3mQiB1FCpL0Jp4rAdg00r2qYGikG3zPLl3fYQ3Vo2RZZCHX/LBUG3qtosWsrU4QXUqHRuS7Vm+eDy8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrCQ2E9sj1Lp+L49UdbuD5UVb/U9KKeoe3K/MFbWsi7O98ccqB
	cME8uxXpACCwVJvrTwPZeKwgRfUNE9LvlXeyC5pEwLLF1TUfKscXT3h7
X-Gm-Gg: ATEYQzwUNVCd2v7WfcwVkFhvEOnkwFAfBiVX7eiVC/ueux/ntwxSnkadqp4D7XO/gqN
	UCxE2y1ECd4Plgt0kOsbVgmGs9o2KbfpNqNG2mkP/iXSZGeQ2QnxquYR7fKWo1pVbm+umwKZi80
	kKL5w/JPGUKFjdpbH0OlyyBdLg3Q1OoVIlhT3oeAqhtIJeAdDPO5psNEfKKLqhTAPggRZtOgDKc
	pMcocuD7j8jcqDqLcGJUrfWBIbur/xB1hU/CVQrvp+CDnnuvlkL5r594g5iG0cO2r5dyfNNN0BA
	t2MinVLoJsNriumfzFEtOuatXyR+bTqlnrG2FZL6P5TK1lDT1OmMr242ydilRjHHMY39QEpkW1p
	RsuQOn5+ByncXBbzqvBRv/TU9DMom4CzAAeDq6pAWQF6pOg512jbkbTtLu19Byi480tH6iDQOTX
	AcqcfvNw8NGV8AYvWcuh+yh/iFono8k2M=
X-Received: by 2002:a05:600c:548e:b0:485:40c6:f51a with SMTP id 5b1f17b1804b1-486ff028ff2mr132562625e9.31.1774203945682;
        Sun, 22 Mar 2026 11:25:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae132sm22388502f8f.6.2026.03.22.11.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 11:25:45 -0700 (PDT)
Message-ID: <f5f9d5c4-d5d3-443a-ad48-53743ebb212a@gmail.com>
Date: Sun, 22 Mar 2026 19:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] ntopng: Upgrade to 6.6
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260322171515.1955265-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260322171515.1955265-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 18:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125487


On 3/22/26 18:15, Khem Raj via lists.openembedded.org wrote:
> Fix build with Lua 5.5
> Add fixes to build with ndpi 5.0
> 
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  .../0001-Follow-rrd-post-1.8-change.patch     |  32 ---
>  ...kefile.in-don-t-use-the-internal-lua.patch |  36 +--
>  ...utogen.sh-generate-configure.ac-only.patch |  36 ---
>  ...Allow-dynamic-linking-against-ndpi-3.patch |  51 ++--
>  ...-configure.ac.in-fix-configure-error.patch |  42 ---
>  ...nfigure.ac.in-fix-host-contamination.patch | 188 +++++++++++--
>  ...figure.ac.in-not-check-clang-on-host.patch |  44 ----
>  ...a-5.5-API-signature-for-lua_newstate.patch | 247 ++++++++++++++++++


Could this patch be trimmed? It is 200+ lines long, but it changes only
1 line, the rest seems to be whitespace change.




