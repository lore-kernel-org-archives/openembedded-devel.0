Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B30FC72B9
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:18:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28201.1774174682956730767
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NlvTJXG1;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2931179f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774174681; x=1774779481; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUyKkiRlJKRRWDgohKYsnFaMMTgtHLFh0ub/UfGVwRg=;
        b=NlvTJXG1fXFX4CAWcZlrp6bjflu31OGqFbcNqEnNVaTCZcDo13vRg86NnC7bxHHkkf
         bTQDPVBCeeXjKLjyZGCBircEwM1j/jm9XAGOvjvjgitSEiKokSQcV8hLAZgDrEw7ULcv
         OcFSkpqHJL5dqhLJrpgGrJ2NTWiWgzYoGVj0SUiUgJLudYr3Uj4L1BP7mBRwisajjQ1j
         gWCFzB5bvKRXhEwdHFPjNuC6FvFRRmxJSe3LhK3OylwY957QZteYunGvzQaPY1kQTMxW
         +kn0oTFLQA8mPZmgCzO+M0g8Ii1CNQwtlTWgemnxWR1J1X3H7Q9iHpkwp9+fc2YqZ7/m
         VrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774174681; x=1774779481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUyKkiRlJKRRWDgohKYsnFaMMTgtHLFh0ub/UfGVwRg=;
        b=WLjD8T76gN0B12hQIKyuGnbY86ECqa1hzxX9wI5NR+XckHHEtjU/mi66uK+OAcy779
         LzyvixQ1p5zgT19t4Ba816gkDPUER9+ibWobCoQcqiWhr0Bq5mQKvePq/h8Tu2/XRuRd
         GDkkiBDqmsmkhsAsv1B5nE12jdsbjT+oXSUAD08NukODWR1dGEa63MmC5cwEVdybRoAG
         cnjpR/KtO4r9qYPV6Jvag9rkDZQ8nmOFJdFrK8IMTVoJUvFgFz25Q3o+yNCFSPr2aQZn
         qzfxlnt0y7n+yZgf2y9MikUMwfTym0CNt908LMBjFHLyqd+3PwfhAVF6NXJdMw/CDO+n
         O92Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv9KMz1FnCi1HIn7V/rMdxTQYGVDsune7euDvFVCdNm+quCWCVa/zshrLKTThNjcfD8LVrM8asNCSDhmUUED215c0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKgW2/PPMJpnuZCGAxxvFUqIxi3N5CsucTl8lUQh2vnViHM1a8
	NYojTqtOyc2BlINMR1DG//Knl3nreXpfjWEMeR6FldhCHgZ8U58AOmrKUVI0GA==
X-Gm-Gg: ATEYQzwERC4g5LGFyDN2h1yMCRp4TavxTdD18c9xRrp8C1iGuFyOGGuRHEeM8tGlquT
	GuZgdAbIK8GPdt4g3e0jUYY3kFvfSxOgBeLAkhMAUu7OLXRKjfQz5TZpeTxoj2oRC++O3+JqItu
	QoavmPew2DgI6YV0tVdupqwh1Wf/pTPfeVWVeVF+G2mdj5wfvCHOguNIkAkWH2fgVs6fZi3olJo
	2bMfLAKrN9/BkrjhjQ4DxzS4T1yIe5Mj6ETKdFFFzlrP5HnE6etzaypOqEb4+XsZnCq8e1ujuyn
	etbm4y2ICrWfSd2CTUZhU/BQCNuhwgs+yTmZsOVoFkE6l0L0PBagAKDWA+F2jb2XUbfvlb0Nmj0
	h3LttyTkavq7/HvolAVbZYnrIGeIe/uQjy8EvpQPPE/ChmmP9WeIr8ZVvNA7VQZto4BWi6runnF
	npMe5GoBag5YmIQS+fNcXLuM4yz93e7tARK9qD+HxeiQ==
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr102506835e9.3.1774174681171;
        Sun, 22 Mar 2026 03:18:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm260536015e9.8.2026.03.22.03.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 03:18:00 -0700 (PDT)
Message-ID: <52904911-e48c-4a2b-8172-ea1751747413@gmail.com>
Date: Sun, 22 Mar 2026 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 1/4] jasper: upgrade 4.2.8 -> 4.2.9
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125477

Is it possible that you forgot the [whinlatter] tag from the subject?


On 3/22/26 11:13, Ankur Tyagi via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> - Fixed a bug in the JP2 encoder that caused incorrect handling of
>   opacity components in some cases.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 330ecdd2ad03225db3cd0933f1083abed8598a98)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb}                 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb} (92%)
> 
> diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> index e00b56ddbf..b48fff7081 100644
> --- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> +++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
>  
>  SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
> -SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
> +SRC_URI[sha256sum] = "f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/jasper-software/jasper/releases"
>  UPSTREAM_CHECK_REGEX = "releases/tag/version-(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125473): https://lists.openembedded.org/g/openembedded-devel/message/125473
> Mute This Topic: https://lists.openembedded.org/mt/118446093/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


