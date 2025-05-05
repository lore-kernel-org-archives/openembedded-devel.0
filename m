Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F611C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:22:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.53315.1746458518821415775
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LXiMknzA;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6965155a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746458517; x=1747063317; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vI598S1xiaiLtuq7TD+LSP8ggVQobd2f8+1qYRPAXZQ=;
        b=LXiMknzA3xiWGXvbJfVHFBnka84MnUX588bOs4pW56gxo/I0XPSnXB7UolWgJFKftz
         JxsCzwidkDtjw7OMQMZW6Iu2ARvvhwpj0Q9xwec+Os6M0KqBUqfvkquCrivwfdekR8V4
         bvrDwH/ihIRYNNAnO5cIeCddWIpu/WTvLZBAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458517; x=1747063317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vI598S1xiaiLtuq7TD+LSP8ggVQobd2f8+1qYRPAXZQ=;
        b=EqgluVzQDL3U2IRFxe97P6xW54OdZJRwSX0P0WaunhJV9hTR7E4eZHuyQxygxWIihP
         ACy4gXjVmBOMhbYBFr4rll9wYLykx/v1Sc1dNrM9nf/I4Q1+ZAR/lhu4mH/wGUtg91Hy
         U2sDPDwtES/yFTkue3L6KUShrT1+TfTKSxahKPIeXMZHEyapwSQAq1dZFB9/VaptRa2K
         HH2j7gQk82cPoKqsAwCUEPrnIlQv3dVh9gGqirHLlS8J+f5eSIlAsRTjZHsy+twgIaVo
         g/Z8JNT566EszzB13PdJazukDmvKGK5smQCCq9iojFV+zt5jNJJ8qvQC88LXhMh4C/Kh
         cQew==
X-Forwarded-Encrypted: i=1; AJvYcCUO3hGUVF5Pu5sd/9Ivy6ffCEPrZb8V7b0Xf9h2TU4LU3OJmUsUL+6S/AUAED0wvMRopcioos+dXCDpamgl0BOpR30=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN6YtXS/FAZl4C/G9VATmk6D7DKRNO/nxJFdTdUXUvWTrPs8Nr
	qCOKkLXTDxiuzYnZm9rIo4pKOPqESco1/6igq63aMMeAkCgCLofQlYOHujpD2GZxhwRDK7xAOCi
	aXkQ=
X-Gm-Gg: ASbGncs4NggvT7U9yns0y93naxzSdm2RykwpgFS6jsATnYwunr8XiL4tsC10EtwJW+X
	FBZ+1yF/MR6e3mLcgK4+MKul+DVnVbnQuSmEy8Y0QXHgCXrzlu3grHswiItoKxjyLwvOzV18E3z
	iIwZiAanwSNp591/c05eg59z6XNcmbF7smsIPTnQcvmAQnFFVACkTb8/ZcgEhFcBh6nJg8VB5OQ
	0T83pdeYKKWXliBRLtviq0jmNJIfqa8TtcJ+OgoVU4hF40KO5DP7XsTihOe5ktiQDg3JZIvnvHX
	e9uNmxF8hz41/WIPYY3emCmP2pGca3juwVrluYwuI1WjY5BN
X-Google-Smtp-Source: AGHT+IEpeDcZqTS5/FywjWmKrXDAbxMyf8EKMoPC2+KE4a9V9miwWqKRl51u+RE44wB3YK5C2hhM+Q==
X-Received: by 2002:a05:6402:2345:b0:5f7:ebfd:58d3 with SMTP id 4fb4d7f45d1cf-5fab05c15c0mr6799328a12.24.1746458517049;
        Mon, 05 May 2025 08:21:57 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm2786967a12.77.2025.05.05.08.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:21:56 -0700 (PDT)
Message-ID: <66acae1f-3686-4fe5-b696-91dd460bf9f5@konsulko.com>
Date: Mon, 5 May 2025 18:21:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] x265: Fix error: 'uint8_t'
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250505143255.1548816-1-leon.anavi@konsulko.com>
 <1748b1e3-9831-4bfb-ab6a-81d43f27b284@gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <1748b1e3-9831-4bfb-ab6a-81d43f27b284@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117323

Hi Khem,

On 5.05.25 г. 17:51 ч., Khem Raj via lists.openembedded.org wrote:
>
> This does seem to a good patch for upstreaming, if it is deemed to be 
> inappropriate, we need a reason to mention it in the upstream-status tag.
>

OK. I opened a Bitbucket pull request to x265 and I sent v2 of the patch:
https://bitbucket.org/multicoreware/x265_git/pull-requests/33

Please note it is a bit complicated. The patch is actually for json11 
which repository as far as I know was archived by the owner on Mar 26, 
2020. So the actual upstream is now read-only. I opened a Bitbucket to 
the copy of json11.cpp used by the upstream x265.

Best regards,
Leon

