Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E08CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:22:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.28504.1761560532027305911
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TL+TTmA2;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47117f92e32so39671735e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761560530; x=1762165330; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SjFbmqCL3abwXE7PUWuFsVNp2UP0VPvrAxypXnveLM=;
        b=TL+TTmA21uWyQXYXySV/BnzUHYpoMiSOJWbM6P3PW1/gQB4lB1MFQhE+iPWchqSuGu
         UkbV3I0FU/wkT6jYZQe4fPG9av/Fyn/8AJUxjD71frp9pdSsXQJk21PJvxP4iZ15cETP
         BpxtpTAF8ZFef4rDV+qP+STR82XhJyyLGuWWNBBBVjbIxpVWnRMq2lY+cPr3eli73dED
         2aacKOxPIFCuLuiQzHIlx6vVeiCy/n2NZQncERUzG/YeYVQn/1ATxD6QrAxf16of7pV4
         KiYMabyNmiLjFmR+xrQboI1NKb4OOewmFj25qAAkfOSD4b72OwB1JrwRor+HO5L7vk84
         JCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560530; x=1762165330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SjFbmqCL3abwXE7PUWuFsVNp2UP0VPvrAxypXnveLM=;
        b=Om3emhwdcLNYXwyhtjWy25hBoNnTTlWUPEkIpv/JrEHHdfTv6uvgf9Dh49hwgijd7q
         m5VXZ+TMsGc1j7TRtJloTNQqR7elOMJ62qmG0+7gxCyOp8bHDIuY32KcbupeTtQkjYq+
         H0gdOVgcVMge490Q4FEMLzFTwN+eeacoUKQmFRk67dXAZj1jxlTtSYprIBPTsVpoqCGV
         oXjuQufbz3v4aN4ZAZtx31UlmfhXRuEJQQrnW+mpItH9Yf47AMYVA3TbSiq3w6x4tLS0
         ESKB2PGiCp0YI+IeO57kFs2GYezubfSTC6zyCK8TvxPflgkvbU5D9xGpHr3t/TpsbKGI
         KFSA==
X-Forwarded-Encrypted: i=1; AJvYcCWa8ANtmfPvuf6iOhm/oCzSUJ3BaFc57FzNUFLs3N5jH7YCib7iEED3LoyaVeI7WI7YaXk5lkblJIJMVoBcznFajNA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxABAKnx+VSIaC2PSPEtlp+BARhMXXvtX1rRLQeww/HMo9l9fdL
	VdESqFgmRJnDtK6WAYXUeuGtucZ84gUNzUYveSYs7CNaMKD6lam89FAv
X-Gm-Gg: ASbGncufBx02vGrPpt6fnZiHV8RG8t99P8BBGONhA4Zfi+cWflxTJ5ijYhjKK7qOzoT
	IVLOpNXVFciV1eBt7I/+XmHFw+VWPwdCPKKr3gHLQrRp9sWc7yqNOCHL3NpsPgm1VbLIkuw7dba
	nC6MLAFB022/SK2u8vZMaiWdejwAsoxyf+V273xDwqYSlKAoC4hhj4JQEogps38sob8haCTKqHc
	nUh+LCyVIK10NZrIT1EfIKnB+HTVCtF147XMMqvPN2Pf5q3SPjQa/SD9Jf2qiGVO0rBtof/So4S
	kl6O1A1vvn+8cTIQyEC7ffSF8o5nnUWuIHEOT0DGuXOK9eQ9nsFG/E7VTe+7PHwRBUphwhr1Xsn
	dE0eKMU0bw+9LGO1AQikyIxeOCjtf5azSMErnM+0xlb9PxsXP6u0uR+6FIPMcxIcJt49xvDxiGc
	oq8kbhdd2MANbmLtjf/28=
X-Google-Smtp-Source: AGHT+IFQNWX1mBdHIrhxCd+y1BL0BR63kwwY0E8ktn9gKWbN8ZXeAoX0k9Ojz5pgLoCh81Sh+9LPKw==
X-Received: by 2002:a05:600c:5029:b0:475:de05:661f with SMTP id 5b1f17b1804b1-475de056745mr53478935e9.41.1761560530177;
        Mon, 27 Oct 2025 03:22:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd042499sm128326345e9.8.2025.10.27.03.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:22:09 -0700 (PDT)
Message-ID: <a04706c7-3ac2-456c-8333-cf6a793fa6a8@gmail.com>
Date: Mon, 27 Oct 2025 11:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH] imagemagick: adds ptest for imagemagick
 recipe
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <09ba1133-9de9-4bd6-8d59-4cc87b2b2aae@gmail.com>
 <798.1761560334206814866@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <798.1761560334206814866@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 10:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121032

On 10/27/25 11:18, AshishKumar Mishra via lists.openembedded.org wrote:
> Thanks Gyorgy Sarvari , for insight
> Will re-look at these suggestions and re-share the patch 
>
> The problem with test cases in imagemagick were that it would require
> manual verification of files generated 

I see. If the official testsuite requires human intervention, that
sounds like a good reason to me to do it your way only - could you
please include a note about this in the commit message?

> Example they require user to manually open the output file and then
> check if the drawing are proper or not . 
>
> That i thought might not be usage for ptest , hence created an simple
> test which generates the source and then use that source for test 
>
> Point-2 & Point-3 , i will work again on patch and share them shortly 
>
> Thanks ,
> Ashish Kumar Mishra
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121031): https://lists.openembedded.org/g/openembedded-devel/message/121031
> Mute This Topic: https://lists.openembedded.org/mt/115970043/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


