Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BF4D5B161
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 19:35:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11947.1765654506792485873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 11:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2xpl930;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1321571f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 11:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765654505; x=1766259305; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRUUvWpgJI7L68s0zdQeOwslOIx8A5FZzc6Gbbosy08=;
        b=h2xpl9304Ut1OUFBfbFnscKPieO+U1ezU84SHua1R3ZjwWQSiysOzqBPnaZaS/0tQV
         83CbDDcI+pK36cIdygaRH9H/WAGf90JkR/Ch4bjTmhXNu9ZMLRcnVbSqho+qXgkQgLWd
         reLMPvN6EwStxD/AVsCoCH1BkVp4NXWPSecQCc1++KO/Xqhom8pzY83abKYUbtulkopu
         u45KT3wV99z/wfi6UctWyOzh2WxKbZJVRI//U6HMbaN2Amu9CCeX9f2Rp7iAT41OPmxz
         uUhnz/AF+Yd1dEZOfnvmlSN/5qT0RNnbc2IskWoQvXVsxX+cfpb/8Oqj86WTnmAun8Tz
         r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765654505; x=1766259305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRUUvWpgJI7L68s0zdQeOwslOIx8A5FZzc6Gbbosy08=;
        b=vBTR952twdxF3Ae0Z21J3b5Xgm6oSOll3Dc3dpuDcojJ+YoQxOtatEsDOPIJbpzoRs
         rXDhvND2qMKa4Vj5AwTsM+T2qT6KmFpUQx6+4CWUogu1pOZ5tze4UrSfj+yc82QJ0Uth
         1IbMo+mLw0Dhu1ON+C+lQHAq6mm+XzUWHNsoUtpXY2kutaI0l1iO/KrQDgV4M6VEeLXo
         ajLyC1X9iz4T3JR5h+UYPLtmtdBjrKjAy64r/mMul0LMgz01Y5D2wiW6l82xRA5x0T43
         GZRV1ZgOpKHQEkTO8knOKCZwgMhOiOUao+xno7EAU9iG/tqWWD5Xzh4FLLnf3d4Mudwz
         Dvxg==
X-Forwarded-Encrypted: i=1; AJvYcCXVST7wEOkqz67nEofaDmj8kFjIezc03i2S2clTQyL00Qz31+XQXxD4am7cz7E3Ux29Ire25ouk5uSPuUTO4NRd7kw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLloNEdCT2jCGErNJPBE1NLWCaCsOWNRWc5N+9yDi87z8eJnbB
	4Xgsw8dA5L7TZlTCvmeL6LiZFbicBtN0F1qwdKN9nuznRBsOKdpE8UKG
X-Gm-Gg: AY/fxX4A8F1HEI7SGY6bHalxvzxQ/iVsz27ByJ+p/yoRVH6/yjA1/IcqRAG9uC7oAcL
	iZ86L9A7q1TiCDMOkcKTDO9H+tuv+Cv9LBozC2asTONhZggrHyN9qdoY+ODnCfSCF6Z5qDgVC8c
	BY2ynwUBrDSg+L1E+a3LK2qhKVWKNH7PbNkOaA2DVJmC1yj9e9O1asnZmebslrtxvlGmKa053en
	h5fI2J1vp2ON1s49YTRCrVOzg04z8Yqu5VFcoP9NizdK1t6HHyTh+WFZGQed1NHdys5dMOAH59x
	Q4cFzIm9zVjYdUcirzYWd/ozwOI15yL4JVPHZJiN1FeakhgyBjxhRLLLXDClUfvZw7yhS5hzmqT
	XMn+BgnmevJUywWF5dG0xt4cwuUQLoUNqr2NagLgE22qhOrhQR9SynpKqCQX04+6bbBGVXw9zVJ
	l+oahsRnOm5BuXhhlheX8DLfGFpp8X2Q==
X-Google-Smtp-Source: AGHT+IHgQCYzrEZ9qgM7iaGrW70Fdboitz0mNWXx7jJ/6ZdRdK/mKM2k4gc7WXQXAsBTkduxt54ZpA==
X-Received: by 2002:a05:6000:2f83:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-42fb46e2cdfmr5797842f8f.33.1765654504921;
        Sat, 13 Dec 2025 11:35:04 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85f81sm21325913f8f.21.2025.12.13.11.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 11:35:04 -0800 (PST)
Message-ID: <9e898b8b-45d4-4e6a-98aa-a954914a3158@gmail.com>
Date: Sat, 13 Dec 2025 20:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/5] civetweb: ignore CVE-2025-9648
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251209153953.951218-1-skandigraun@gmail.com>
 <20251209153953.951218-2-skandigraun@gmail.com>
 <182436.1765653700176088747@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <182436.1765653700176088747@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 19:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122640

On 12/13/25 20:21, Ankur Tyagi via lists.openembedded.org wrote:
> I don't see the commit[1] which fixes this CVE in the current recipe
> version.
>  
> [1]
> https://github.com/civetweb/civetweb/commit/782e18903515f43bafbf2e668994e82bdfa51133
>

The recipe fetches b6ef58f4c4c7fbe90fd1065bccf45b143345f1a6, which is
from 30/Sep/2025.
The fix is 782e18903515f43bafbf2e668994e82bdfa51133, from 2/Sep/2025


The first and last line are interesting from this log only:

$ ~/git/civetweb]$ git log -n 30 --oneline 
b6ef58f4 (HEAD) Do not scan third party projects  <== recipe revision
3784be9d AppVeyor: Add Visual Studio 2022
cafd5f8f Format code
3ee51c19 Update sqlite3
8543cf79 Appveyor: Deactivate SSL for VS2019 / VS2022
9cabe415 Merge branch 'master' of https://github.com/civetweb/civetweb
b4afd1e3 Merge pull request #1358 from DL6ER/lua-5.5
c7df0249 Fix timer test
b20a7bc1 Set minimum CMAKE version for tests
2fefc5c8 Add Lua 5.5 support
618790d4 Unittest: fix alignment
acaf7e3f Use atomic operations in timer test
4bd10c49 AppVeyor build: Replace obsolete Visual Studio builds by new one
b3a34ad2 Merge branch 'master' of https://github.com/civetweb/civetweb
98dab2e1 Merge pull request #1355 from aryanrahar/fix/uri-len-dup
48b58d1b Merge branch 'master' into fix/uri-len-dup
e06d8d96 Merge pull request #1352 from
mfranzen0906/feature/replace-asterisk-with-origin
7b7bde47 Merge pull request #1350 from Geeoon/various-typo-fixes
a9900426 Merge pull request #1341 from yubiuser/prevent/CRLF
c5844556 Merge pull request #1347 from
krispybyte/fix/uri-processing-heap-overflow
dfb58aad Merge pull request #1354 from
civetweb/dependabot/github_actions/master/actions/checkout-5
3e7ecedd Update SECURITY.md and LICENSE.md
d8c74f7c Update README
782e1890 Make parsing of URL encoded forms more robust <== Referenced fix


