Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68374CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 11:28:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15569.1762255688439451075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 03:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GX63ljop;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso3908107f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762255687; x=1762860487; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9EOsHBcydQbReAYGLMka1nusViUAkglbMZ5aj6hMBQ=;
        b=GX63ljopw7i2YZp4R1/srRSwiB/nh3V7W+EcM2fTFSIotnSQ35dSpBcQc2y/vjZJD3
         aX/MPxbeu9qj68cLnA2dLQJgxeDLfgEb91s0B4h2pSoIX3Q57HgnyUDMARQc6r6p95DQ
         cjUTCuB/Vk68f2+7F++G/Ck/8Ha7HXqc+nQplX4Civ9eUeEGwe0C+CcM6O04T0JAxq84
         /09k6utkicWf8XTTau29QORznb+9GSYJkaOFuWURkf+SO3eWyRaTEJAHoKoVRH3JQ4to
         TiC07365754Gbm9aTZSOgkPdSdhWGFUxuvSiQk4RvIyICC2KwxDwG7zl38LDISyOhA8y
         cUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255687; x=1762860487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9EOsHBcydQbReAYGLMka1nusViUAkglbMZ5aj6hMBQ=;
        b=VH7q6ZlfHCxjR9dsDz8ChcHf0eKWSYrnvUNgLjzp8H8aoYi3Hz99GyIcubwbCkeyF7
         1yRAOam+1cjThxnnQl3KnjhqVXUqFv2SigNhs1mmMhyaEAro2G2FmwteoHlbiKr5lZVX
         KvOtJvua7OXo78iTpGMQ7ZyhmHEvJ2H23bRZpUYoFBJVERbzmmdBabR/jjm4p6g87B2h
         KZtAC6VxJQ7raxCO6mia1STxIZFT4IzJR+GS+aHWlemWRMGmbS70PNhOL/5R1soXQ1wF
         9XxB/+AH7RCbaHLmeUFB22zqAsEMgTrPhQN6r2VCaj/oMIjLznqfmRyJRGcIjen6ILVc
         5KAg==
X-Forwarded-Encrypted: i=1; AJvYcCU3GDew9vz4weL5LkBitcKrh0gFRQKqatmdsSVej+Q3WdFXHEJOoKC+rfOtf61fiNMAtPZi3kOXWThIN5CdZuPiLnI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdcMS9kVPHM1ko71fKsm2DvBV1lIeUY58wlcHMlRXD6SMDTcg9
	Rlh41TMMpb++TS+KEIHJfvDf/dnAaJZY9f2Ye+GBBgs3egRO0nwdzfmH
X-Gm-Gg: ASbGncv5NWmezUHbCp1NXa8aA/AhaHoFbXEzxw4cb4aSU0pn/AwpELuTm3GxWk9XuGh
	WyzSAn92dskpkTLHXzR0iHaWR36Ai5WXZHk7sxXduhN9gguZ1aoFIkLp4Mht8nd/R+vJkmA7ZBS
	JaeCyRFQJA06RRANxp2QT5T8efba3VPKmoEMc+eKXlGfHlYQP8pOd+/3JlcdHVZ+Y+buhE6zYwK
	OvCCR4uSRzlwkegel1D4+tVDHY+iNVuMFeIptQkQnodC/uhiYFRTcpofLHv+nuWkHHhQhgkIqkU
	q+o2jmhoh7wDhIZt2ECzoFRvh3T9GTa4LKRKrTmZA4TRwCYtgNevY//pwgCO1TDpjV1t6ndjbx5
	/6DQMdUmYSSUgD5dzyE9pOGb8c73lpI19nwCPWe8JcYydelIPcw7PC3Xi8O1K8HrLE1FDeCBCZ+
	7M/dD4ECNNuZbtaMlx8Po=
X-Google-Smtp-Source: AGHT+IEFGoXl6ebm4+eL1Rx2m79lUWzkNiv183ypH6ic5NZdqp5mRjjLd0u7Zc1aAj5z9eiwh/4cNg==
X-Received: by 2002:a05:6000:4381:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-429bd6a6097mr13872039f8f.47.1762255686516;
        Tue, 04 Nov 2025 03:28:06 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18ef99sm3918102f8f.7.2025.11.04.03.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:28:06 -0800 (PST)
Message-ID: <cc6859b0-e99e-4d68-afbe-7104f55101cd@gmail.com>
Date: Tue, 4 Nov 2025 12:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] fluentbit: set source directory to
 enable patch application
To: timotheus.giuliani@philips.com, openembedded-devel@lists.openembedded.org
References: <20251104093017.474084-1-timotheus.giuliani@philips.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251104093017.474084-1-timotheus.giuliani@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121295

On 11/4/25 10:30, Timotheus Giuliani via lists.openembedded.org wrote:
> The recipe was missing the explicit setting of the source directory
> variable S, which prevented patches from being applied correctly during
> the build process. This commit adds the missing S variable assignment
> to point to the git checkout location at ${WORKDIR}/git, ensuring that
> the do_patch task can locate the source files and apply the configured
> patches successfully.
> Without this setting, the build system would fail to find the source
> tree in the expected location.
>
> Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> ---
>  meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> index 05e4fd937f..4d82abc783 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> @@ -32,6 +32,7 @@ SRC_URI:append:libc-musl = "\
>  # prefix tag with "v" to avoid upgrade to random tags like "20220215"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
>  
> +S = "${WORKDIR}/git"

In the latest master branch this is not needed - actually it causes a
fatal error. It is set automatically for recipes fetching from git.

>  
>  PACKAGECONFIG ??= "\
>      aws \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121293): https://lists.openembedded.org/g/openembedded-devel/message/121293
> Mute This Topic: https://lists.openembedded.org/mt/116115059/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


