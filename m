Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D60BF8D771
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:23:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23593.1776367406269877639
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X1+CQnbc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-482f454be5bso10463495e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 12:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776367405; x=1776972205; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAUIN7Rlq9oHRv1kGS+LUPhlkVnPKcblWEG0/8n8sFk=;
        b=X1+CQnbc7GQ/Clbb8IR0czVTO86hWLnDU/KoHEBW1PnSBYQN7GNFyOQa/5Rw8JlU8m
         /TZ8pcxGWUV2ZcuGeFIwg75oAxs7WnNKf+WZgwxLDxy6a4XteiXQJBcYePkJvKG5JsMd
         GHoa7otjYiYunC3nlHMqfAIPXTjeh/80NmATax4HlUyPtJWqpySJKtPE4naPhEYhi0wU
         nO1+PJnYLCrO8n/cuOVQ0zoU3vPTNF+3ZZnbi+4IQE12PR2YAQ1ykkawlrXk56qEm0FM
         hyhqP/CR9VDjNXKx41ihxlg+3ybkaXWzTuFPWEf9Lempalz07hBOCvfZsXxAlCZg1dRj
         OpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367405; x=1776972205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAUIN7Rlq9oHRv1kGS+LUPhlkVnPKcblWEG0/8n8sFk=;
        b=puFcnbkJrB9TnrqKOJAJGzIXa9ZySnVQ8fYTtXOfsd3GAe57Q2H/cRoFuj6fV35DuU
         JDML7oM6mtPJnLqdjL/TPeuNWkhwLNry6Tt7Dx2LK4r2SdFL7a2MEnHtTt26nPwdWUU1
         99QnPmrUDjFPVaU73xxshR4rym7VDG29vpiSMxnYbxArHsj0CTHs0WhdAiYQ+8yn0s28
         Mdyhk2xny4bW7wQIFxaXPcK+2XClJYSyLi5NTkpXDPQJmpqxNLWUmPTy/GVTKZUG6aDo
         jJDWm8wFLhobfMkgwTXEn1XX9s5vu8wHh3VJeZw4p/AriIRxLk+q2fFvLZMN3qOu6dGV
         0jUg==
X-Forwarded-Encrypted: i=1; AFNElJ/dUKVBnh/LBIEDbBoF6HF52IO202dkAVJh4bMMhlZDE1Va4orVEuFtU+X3gpT1zK0YXBBQj/d0XEiqzgyrnslOtlg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+bAUu6Y3z2vWGBz7QQ8e6ofoRsEIZJcbK7olRxh4GFx/MVGz6
	S8igS8EUFJmyh4ZhisaAZeqrvL9yMRS+QpQuRN3LoZPkIi27gUZcBSIT
X-Gm-Gg: AeBDieteNG0MQZr9hid8G+wVQRFnJGiCD1r98punlEqATm5RKixCPXE7UsfLT4dTSv3
	i7kMwRQfyBUje4v+qt3YKUJqyDVuFxj6Ws+d9VLvkjH2/5+QSGt6o4PErcFOpuMxN/JU39Pjyci
	U6j+efHBs1CEWOPgm1SNUu24SCu7Twe4leBfFI8XOv6hfx3FZgiV6Y6LphOOWYjpuyyDE4zuL9D
	WW1M6zzDRfOpBS9R39aDEJ9zjkjLhZPkZukWgtJolL3Fbr5+FmQir4gtqfDCNEXuGniW59SMfSa
	LKKLGrZ4Pds1V1ck7GA10xiYWpMn+X1zK6O3+QhtwvmggPZWnymsVWRJFrYq6KKJ5n9qev/0YXz
	Alq97O1TsmTC0Yr4f1SWqz64TtOHFEovbkOjm3c+6je2M0M68XdiaoMlGIKm7j1bEI0PZ8iPoAW
	m26ljtkofgRRdpj+8SqxkyQFqbPLTgxaDze2kC0OmlAg==
X-Received: by 2002:a05:600c:6099:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fa7d0f01mr7123585e9.2.1776367404459;
        Thu, 16 Apr 2026 12:23:24 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f581d93bsm75618905e9.8.2026.04.16.12.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 12:23:24 -0700 (PDT)
Message-ID: <7a1772a1-238f-487c-ae6f-b258261d783a@gmail.com>
Date: Thu, 16 Apr 2026 21:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] rocksdb: remove rocksdb_static
 from default PACKAGECONFIG
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com>
 <2b4203a9-6dd0-48b9-bb67-91c134acc010@gmail.com>
 <1451444.1776366643402500662@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1451444.1776366643402500662@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126408

On 4/16/26 21:10, aszh07 via lists.openembedded.org wrote:
> On Wed, Apr 15, 2026 at 11:57 PM, Gyorgy Sarvari wrote:
> 
>     PACKAGECONFIG ??= "bzip2 zlib lz4 gflagsi rocksdb_static"
> 
> 
> Just a heads-up—I spotted a typo in the PACKAGECONFIG string. It says
> gflagsi instead of gflags.
> will you correct the typo or can i send the patch for this?
> 
> 

Please send a patch. Thanks

