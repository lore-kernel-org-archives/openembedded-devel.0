Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F16F4213B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:28:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2095.1776277671331671465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SXQIMnca;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso84596915e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 11:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277670; x=1776882470; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwHDW4jM3ZayGnqDvPxken9Impo8TXnG9+akY4uXVRI=;
        b=SXQIMnca9E2BNi7mokxZ85QXtIV3yJCi1y3KJDLr05o6zZqiKVQKsORJcyNSBjQY1I
         FkY4gYSJubPKmZ5o06qnsPyW2C1ZBv5s8alHnop31clcWjCwFODM6nuWnDEi3ruNm5Kq
         1LnWWZTVBOKeBRaZH24pPOyVDz42FHNH84zxqKZBI8WhO+Pp+SN9wlhhMtERq5ev8Gnx
         v2I/5NQ2WWKSzpceg0e9/MW9RJ72xgmy77SRz4bnNQwffcNJme/Qcl2JWSFwgbLWIYoV
         UyMRsT2gWJHROkpxotgUYzfGOECOyX02dB/HtHBzxJek7n6lwvGVZgOeuFafcW3fl0L/
         fVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277670; x=1776882470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwHDW4jM3ZayGnqDvPxken9Impo8TXnG9+akY4uXVRI=;
        b=Eo6lyQDTrDTuUcvFxOiwJNrsRwsnP4kgPiaK+wcOSvA+8J2CViiVfsXHSkvo8+yXgd
         fEf2XXlj89j+d/FQVIszZfIbEbUPGNd9CjDDmMeUbXESRgLS2NC8NXyk/nO/AdnV7nnu
         jHnWhPhEYSDp/TtM0hV/XLretkMurpMdgoh/+RTPyfvGonXmPC1IA5EKH24Ojkqpen1Q
         K6270XY+8yZC47v+OcACaBfM+DFiD6pmnkc3UjsVOsKKitycnGpqbv3cgHhcj3P7nchL
         tKKp+l17iejHMZriCPG57ErzloqAGdoUtKCM9AAQMUK0NH8Bjg5A56c5XX8/bXCI5FWI
         BlCw==
X-Forwarded-Encrypted: i=1; AFNElJ9RAdjS0OsKWHdovIOnrXGHu6bFZ1COOgwSQBGz5i0vKWZ0neQYA4c43r71fn+pWM49jz1ZYhMljGy0qMHPeNt9QDk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzC7QY2EV9CHxLahp+remeGPNtFgcXT6FZHagcXkwRjGUzW2iGy
	W3vMp4Wp42sZlf2nN/BPU4BEJaW+e5Nk1axCTI7JjAI+eyggJjAlMX8r
X-Gm-Gg: AeBDietsyPCtPiyWcoIezy6zgHMPq6dW1SPDzltm5frBMP9qX2D7VBAlqHlTLHpK37z
	sBHLkBSo9n1MfLhtkqj0J5z/SBlMir4C/4UW0d1fV5cZc6DZeUI1I5guy79i41nWDGpNK7pzV3y
	BUw+7pMjVHEwvUFagho9Xk3vgYJfOiZiRLLBKCkCjRkp01X7+4VitzgSsWFVKWqcKCaWWDxRGy7
	+ZkVKLVANx9QkKyBRe8sYEr959UGGg8sds3JQ9u6cml62tSRF1yc5v8X/fGJnFiWlhCbcKwrZn6
	V8tAYL0WxoyKo87hb7Z+pldxO4R7a7sP2kUy2DbIhaWG1hX53BRMtc4zHRotHLnjeSHkhT0LhTJ
	aqSMW8GlwahEtPenNz2/dvZxEbsRx7Ar5SvT99WhH8vtKWRsxGm+bOMCf9BIXu/8JM4GAYCOm26
	3H1HIw29nYA+WP+lZRXtlA04J3OSv2HfbU9ZsuP7l9/A==
X-Received: by 2002:a05:600c:8907:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488d6860bc3mr217393365e9.21.1776277669445;
        Wed, 15 Apr 2026 11:27:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm245149365e9.6.2026.04.15.11.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 11:27:49 -0700 (PDT)
Message-ID: <2b4203a9-6dd0-48b9-bb67-91c134acc010@gmail.com>
Date: Wed, 15 Apr 2026 20:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] rocksdb: remove rocksdb_static
 from default PACKAGECONFIG
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org,
 zahir.basha@kpit.com
References: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126372

On 4/15/26 20:20, aszh07 via lists.openembedded.org wrote:
> From: Zahir Hussain <zahir.basha@kpit.com>
> 
> In our previous commit
> https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=33822593e5aed47f619a385579a47c366859408a
> 
> While adding the packageconfig knob for static library generation,
> rocksdb_static was mistakenly included in the default PACKAGECONFIG list.


That was left there intentionally. We discussed that we (well, at least
I) don't want to change the default behavior of the recipe so close to
the end of the branch's supported lifetime.


> 
> Remove it from the defaults so that the static library is not built
> unless explicitly enabled by the user.
> 
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> ---
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> index 7bfe157c1f..7e39928bec 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> @@ -31,7 +31,7 @@ S = "${WORKDIR}/git"
>  
>  inherit cmake ptest
>  
> -PACKAGECONFIG ??= "bzip2 zlib lz4 gflagsi rocksdb_static"
> +PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
>  PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
>  PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
>  PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126370): https://lists.openembedded.org/g/openembedded-devel/message/126370
> Mute This Topic: https://lists.openembedded.org/mt/118845876/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


