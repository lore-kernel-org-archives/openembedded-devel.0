Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC7CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 13:06:48 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.12482.1758719193160044614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 06:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kq1fsn/l;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fc14af3fbso11420352a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758719191; x=1759323991; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7+RFpeNr763PRbbGhNOjSRbqixQpUpJkLMAooqgTw7A=;
        b=kq1fsn/lXtUv/RbasCgv404yxp5/IA4CSt1v6KTzXycNZ/KkfEONtdt/JGMTwXFHIo
         AvxxECj1TGPGYZV1vdbGoTyt21x6Vc3YV38rTCEjw3ETs2c822eR1NBcaYRYpcAOt8ih
         xNwanHZEbFTMAknA2030f72cemnq3Nc/NpxVTfaBOIHGT3MzhLaYEJ4p8QQTfORaXrtq
         84kpqk67KiJkblQyxMcDXeWTjgguvx79shiRxTyfQIJvlTanZe8GYNU56umGHQlFTmSp
         OZ01hPof0Xc+Ri3HkFdeyNizGigouuDyFLNwh7auH3xAZYxM8uNOJednRdrXzPgADLhK
         LPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719191; x=1759323991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+RFpeNr763PRbbGhNOjSRbqixQpUpJkLMAooqgTw7A=;
        b=f9UVKY1x+FZ2bLcMYSwRKi9+DZqAZtQXdDW3YXdz7Bl1NsxQWfl52hdI828fCIMX26
         mWXoy6lJzLGoFQopMNECe6KQxSMRebyqcHN1f/gxUIK0YJTcr29BQ8KVZcPRs2Tnftz1
         3ezwzT/75XrAjPtvZqCBO3cirbYUGJwU3MXxj9sraqKUUhLRcM++Cjxa3cqlq+pVIIv/
         Qd+HFJTDQhcGKYnlcK4hQ5k/EKBz0Jl07OrKryP6CCXf8WICs7P8UP2L7RmL5DFUL7cr
         CSdE3rUQJOO+5eJUoBEfuvPgk/emkIx2TOcYswn5hW1oDB7ntpWjf0VJNkEZ14Nflz1A
         EQDw==
X-Forwarded-Encrypted: i=1; AJvYcCWIl5OeyOv7keuGE8DLRXb4BgqMYviYb6Vh2J+KBOA88oXLxTT/bqyaMx3DF1d6wm5PJKbyILu0Nee+u21WPqgOE9w=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwsWH/4Qlq0Uck7TIlVTfOtXF0n4VqD9npfnRm+LUcL+VdgwiuQ
	okYerVNsytX/cTYqmxuhpKj9WSwVhn2PHqCY6f42a1ymCjAKjbR+3EDa
X-Gm-Gg: ASbGncutGxOMY/8uB73IzCqOqMuUYNHZ19qvc1EtMiFolyT1XueyZu6/xVSmH1YIIiI
	527P9QAO3QpmE39YXrqVXz7N9arqlpxNHlBFi5TRyLBPTLB//LjlbbK1nosoEOFLLGNY5Q5fB2h
	2Wn4uOTB7Z9YU7o6q+lZm0YxG1C3J8nnlSNDGjf/o7U+4KiVKWPqFI/7776jct1JrpFCpMAzs80
	qFPwWVPD7d3HkqC0oqZMM3yuVYRICkniUl1vu8CMNw1RzrbWkZE8r/Zkio7ViW/U2uUmsDz+Uwf
	HghgLPLxTGrAKdcHo7TCRyB35NjqzzL2Rn3ZxAj9v/9sSyoMHN43hBYVMWzTdhtnBrEwmUCE/fo
	ZLfLvb8u6e7MkkhLGWNWR99/xWAzceVw=
X-Google-Smtp-Source: AGHT+IE72bj0yoyN5/xKVecWTaAdLmU9w/bvyKHY7Uu0p2NtvEXJGcygSNI49u2DlEbmIfVCpqux/A==
X-Received: by 2002:a05:6402:52d8:b0:634:54fa:f729 with SMTP id 4fb4d7f45d1cf-634677e9681mr5482629a12.21.1758719191426;
        Wed, 24 Sep 2025 06:06:31 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f28511sm12570321a12.40.2025.09.24.06.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:06:30 -0700 (PDT)
Message-ID: <e437bbea-1399-495e-9c4e-bd11353b5934@gmail.com>
Date: Wed, 24 Sep 2025 15:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-perl] [PATCH 10/29] libmime-types-perl: upgrade 2.28
 -> 2.29
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20250924090029.1786-1-wangmy@fujitsu.com>
 <20250924090029.1786-10-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250924090029.1786-10-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 13:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119825

On 9/24/25 11:00, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: add following flags to section build_requires
>   Test::More: '1'
>   Test::Pod: '1'
<snip>
> -LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
> +LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=d3b01c1228de75a9de9ee0bfb6e0dcf3"
>  
The license hasn't changed, but rather the license declaration has
shifted from line 11 to line 13.

Prev: https://metacpan.org/release/MARKOV/MIME-Types-2.28/source/META.yml
Cur: https://metacpan.org/release/MARKOV/MIME-Types-2.29/source/META.yml

