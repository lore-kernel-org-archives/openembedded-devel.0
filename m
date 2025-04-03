Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D2DC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 07:35:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7852.1743665712798099950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 00:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cz53eP+t;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so425610f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743665711; x=1744270511; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TR0czk/VmoKLNWizKLAS/t0qhHN0K/Tzl7bkujdSVGo=;
        b=cz53eP+teg6it6z4fbwhBtP9AahLyjFEyvF4oLN2byZvkSIP/bq7Iy79bQA2SCYsvK
         TBUgN0vt0M6MOCP7PHfHs88I5wnTZ/tnNrUn0+lGlphj9sDTVFmrLDIRJuUrhLIdRSj/
         z1j8rZm7zL7qcZ08QA6n/vPe/ltpaHwOqI9Diz8bPrHDfKPF4XLREhFWt3125Z5SI0Xj
         BvsbwPXYYKb55LfBakwwgjHMwNYpVeOEnQWA6wtt+DVwy86mPl7Pqt19qudO2mjrQiF3
         aokK9YLHcn++rDHssnutrCSOpj0x1Kd/dgVTpCrbhuunYAteG4tb1wPl55TaoGVjyVt+
         7dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665711; x=1744270511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TR0czk/VmoKLNWizKLAS/t0qhHN0K/Tzl7bkujdSVGo=;
        b=MvO5EnMjgqR6VPn9h2sgOQITV0bdLAoduGmrmDJpnWRZ9rzW+T9sZM10PuTedsmgo9
         rLOp9+KOckTq+onKHVpPAQ5r1i08UgqKuxQQ8qu2rtElIS6nJqfZnk/bfq6+SqU4Ln7u
         JTk51S14iS3oPS9A2l4ih81C9fYnDnm6g6PCmk8n9xXNeE6gQX5FYfVWdbaNUTTUx7By
         OItfo2v3bnVpU98hLNEOpMtm4QCkw5utTz6AK/LQXew1XwmjqizeHkTyhDvCmRId9ueE
         hUneO8nJQ+Kk6k/KfFBahaSGrZ+MYSfIZODMcGWnubnmEFMxsnmWx1yJuiZzwpjow600
         RGJg==
X-Gm-Message-State: AOJu0Yx3jadXw9gpvGaZxMg1xvBF0fPZbtYIWXDYhu0dvDN8lQlySegL
	yeJ+Uf2tBdasgJ+Mti0sjOoYuzdZ7oxA+Acmuys+0ShRplaVa1oi
X-Gm-Gg: ASbGncuS6Ye+yNRCDTahoBqLUPkwKaH4918by5sgZy3/JM/Pihu7BQCttgWF3ZXvNKr
	NogDLrZwVTQfHrpikIDFfpK1WJwVSr0DJ8JDzsn4M6nxhMBXqzgyhDhXUmJah9HemKVkMfwEorz
	yaGkZWAU0J/uc6jEHCCoTbPY+iVzPy5kc/C7gUG5sDho83HWTEblxjsWpwilRVhvxjcT+ALunqG
	ZufDPzn0jOY1vdPqw4dmnPgKze2vo1rZxK4udPkzCsV0YF528J7KXEShP7e0CNYl/LTTOReRtyR
	YRbPLQkV3+ja3UboUVt6kExnvzJD6dmI+we9M1SFTMtnnt6PEQ==
X-Google-Smtp-Source: AGHT+IGNlaJD7Ib3Inof/lF/hDnPvBKSIP2GtC6+6NXF1zc+qZKgXajdM7A9IMR1qnH93Urt0YHlUg==
X-Received: by 2002:a5d:5f93:0:b0:39c:140b:feec with SMTP id ffacd0b85a97d-39c2f8c6640mr1054271f8f.7.1743665710750;
        Thu, 03 Apr 2025 00:35:10 -0700 (PDT)
Received: from [192.168.1.2] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm1015766f8f.60.2025.04.03.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 00:35:10 -0700 (PDT)
Message-ID: <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com>
Date: Thu, 3 Apr 2025 09:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [linux-yocto] error of tiptop
To: wangmy@fujitsu.com,
 "linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 07:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116531

On what machine are you trying to run it? At least in qemu I get the
same, unless I enable kvm directly:

runqemu qemux86-64 qemuparams=" --enable-kvm "

This way I don't get that error.

On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
> Hi,
> 
> When running tiptop on the image of x86-64 for the latest repository of poky and meta-oe, an error occurred.
> 
> root # tiptop -h
> syscall: Operation not permitted
> Could not perform syscall.
> Don't know why...
> 
> According to preliminary investigation, the cause of this issue is related to kenerl updating of perf related code.
> This problem has been occurring since the commit f390c2eea571945f357a2d3b9fcb1c015767132e of branch v6.6/standard/base
> 
> May I ask if you have any opinions or suggestions regarding this issue?
> 
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL：+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116514): https://lists.openembedded.org/g/openembedded-devel/message/116514
> Mute This Topic: https://lists.openembedded.org/mt/112043323/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


