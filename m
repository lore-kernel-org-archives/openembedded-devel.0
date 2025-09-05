Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6354CCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 07:33:55 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15749.1757057631830574607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 00:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DxePrLVD;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so3322072a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757057630; x=1757662430; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1m8P3XziUNtrSTL8l8y3cY1tic2aMJOXwu8XiKQO/Y=;
        b=DxePrLVDgx5cNzoIKPkvkrjKP2nCx2NhgfPsvoAixpuwVszM3w2RlOwRCnX/ryO5Oo
         H9IYTysHyvGE8UYa3YleIOFdru/g/tfjblJHrhl4kJbsOxGwqPxne13P1GKUjgC2IZi6
         n+6w+xNhkc+htRoEToSSfMUURZuh3V1tHiP0/Fw5uHDKRHiXaaywkJNDCU9ljkWgu+p1
         HDDRmuoblJOWXtq/ICtmTy/3410jhHHjOF2IRihvsN/FRhzsYlQ7PgQcVdhxH1x9cmI4
         CCN95icm0SXTP9n+ZJGs11HkkPC7ZxB8aqZ2g6m5/BjQN4E0tzUjUbiKB5Y8enu7Er7d
         mnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057630; x=1757662430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1m8P3XziUNtrSTL8l8y3cY1tic2aMJOXwu8XiKQO/Y=;
        b=p/ETnf9ObUU7Q3ZqOkHHNZ6fpCjHd3IBcjngMZ8PtjilSCHw1ueRynZ3Ug4zBmovmN
         R4VkHdTERdxQK1Ae6T8jv1w/JZNJR7KDnnDMEg0ga0US+ecEfMLe6jZ1tfIEqaen4g7x
         I8gTrSDS1SG8nfBWRBFWOWibaU8HhuxV/qNRIkqkXxsbD31mXxLFuvNwRbnE6dj2T4ZG
         QPaXKJerYoUCZ8DnrFLctdPgodLlvNWTzAEdEwzPuvqaGZs9QnGySeGAFkNIs1LQl7fi
         7sQMfuHsyB6le9xR2X5/9R1vHWk/LFQC1+Tu2AdMvu0gbtJNmVuwUT93iZMT2HNCGkIa
         KOKA==
X-Gm-Message-State: AOJu0YwmQitCB/PkHvq87bWKEbTLmnhYcL5YIpNFgrjVtD/sJSvEg2tN
	JAphwWeUXvk/U6lr/F79g9Xj64Pz+Bfwya+DrGTIdrVWKXakUyHj5qYXQ7+/xn8O
X-Gm-Gg: ASbGncs0P81N1bKkHYVcTLke8AKXP9/f4UrQagpa5/a4Ev21QA+MFtQwG5KWh94UiJs
	pKiw9/Zoho2PlbHolXWDfWcr8tA6vNoseK8aqwzVRB8496fYD+NNPnVd44jNAYwWxIuO+q+t6s+
	aG4M/BMihIUfcDRuK1uFzcDupAz3lS80KJM77giA1otJHtLNKD6TV2QlALQBEzDywyP9D8KBrYq
	kQI6EWkHWGVSdi01ACQ3ELJBEOhm2RSFB8wLmlAu4aXdbz8Ino2ICaX7bC1GraD4jt30t7c7GXm
	oWmFfvD0NMqYRQI6b+unfL5nbIsjbTRfcN2LkMZzPRPfimhYfBVcGEr5ltVnYJEv0+XYzEz2Sl+
	XCJMxH7PoxYeeicf5VxBLAYSwGpPdAKM=
X-Google-Smtp-Source: AGHT+IFuZ9uW9UmnlxUn4mPrTW0idZWhbNgC6Si16FtBt0jLLpQWVeHVLEncT+IhC7RIvrgdt5bYIQ==
X-Received: by 2002:a05:6402:278a:b0:61c:91c1:37e2 with SMTP id 4fb4d7f45d1cf-61d26ac2c0cmr18785813a12.16.1757057629750;
        Fri, 05 Sep 2025 00:33:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7848sm16695852a12.2.2025.09.05.00.33.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:33:49 -0700 (PDT)
Message-ID: <af4325ef-e7c5-4c96-b6a6-ff27f7811082@gmail.com>
Date: Fri, 5 Sep 2025 09:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-webserver][scarthgap][PATCH 1/1] apache2: upgrade
 2.4.62 -> 2.4.65
To: openembedded-devel@lists.openembedded.org
References: <20250804111849.3601694-1-archana.polampalli@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250804111849.3601694-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 07:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119311

Could you please rebase this patch on the latest scarthgap branch? It
seems apache was just updated a few days before this patch was sent, and
this patch doesn't apply anymore.

On 8/4/25 13:18, Polampalli, Archana via lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> This upgrade incorporates the fixes for:
> CVE-2025-53020 CVE-2025-49812 CVE-2025-54090 CVE-2025-49630
> CVE-2025-23048 CVE-2024-47252 CVE-2024-43394 CVE-2024-43204
> CVE-2024-42516
>
> Changelog:
> https://www.apachelounge.com/Changelog-2.4.html
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../apache2/{apache2_2.4.62.bb => apache2_2.4.65.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.65.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> index 66a017a864..34526fc78e 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
> +SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
>  
>  S = "${WORKDIR}/httpd-${PV}"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118852): https://lists.openembedded.org/g/openembedded-devel/message/118852
> Mute This Topic: https://lists.openembedded.org/mt/114528271/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


