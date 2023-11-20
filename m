Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F99AC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.43635.1700452262282167110
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvX1+mlO;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6bee11456baso3265007b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452261; x=1701057061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltx+lxjLS2rW/mpAPDfybHI5zDfkSIYN6setXfrCuGc=;
        b=YvX1+mlOuCEOA/n0Z/Ed/Q4D6npbxDhKvlyJKD4S0qMhkiAT7ajWzebebqMKS4+ZUp
         TAGfKLh+ITR1meHlfsK9fpZ2a4Tfcgvgl8YDBlZE/pN6hyRRLZGWNS4vsFm8fhFHNcQp
         MaUr9peCvbHSeBBPnr57MrHwxT+YY2RtAr8//OM3xBaiA9UrY4YaNiSpUNewNzWbtq8w
         3oVhqcxBKL39DXft9El1Uga/0f1wv8Ai0vqJNOfuAucnwfB9MelntmxSz1LpSRmCghwH
         zgJx4Y/ZBXd3KADaXQ14KmKiiMqdUENzVwMJr4rWspEdwm58lJG7qgIm0aPsQewUD8ad
         j1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452261; x=1701057061;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltx+lxjLS2rW/mpAPDfybHI5zDfkSIYN6setXfrCuGc=;
        b=iEWWp/sNJAlBbCFtKm+0S88l/djcmEod6mUAjnS3tLO5jkKB329JdHbiiS8+GlU7a5
         T9UwCNOhc2I0d+LIwrIIo3tF5YtpF81MBnvSQf/5PkHf3WSw7h7GQ0CGU+VCH5oTI2uj
         nsIV1RHqsGqhHkL+cxp5jz+rLip+kS8+CQn8O61T4UiHi82L02sYkD1vnd4sJl8LzxSI
         vqbWUEGiauIru/WQWWA54VP8cEmDtQ79afAR7GFbgbL2C3LvYunTkZq4cZRrooX3Y5C2
         AaWHAQ1bTgPxtWhLbMVsPGmuNATgMQxmgWOTKzbFm76L9U138t1Dm0dMRD0059F2x8YY
         loEg==
X-Gm-Message-State: AOJu0Yws3KqJLCMAVmYAxMuA1Q1ii6uIcWuqdQozOkc3u9AEtHKLzyYW
	FDX489aqlGUpN6P7X8UjmxT2oazY1XKcSA==
X-Google-Smtp-Source: AGHT+IGAawH6N1E8HpDeyFwMmwizRETCVmdO4bai2dC9hXHAe4sUhqshknftgIYXbgBa7umYAMPhqQ==
X-Received: by 2002:a05:6a00:ac5:b0:6be:5a1a:3b93 with SMTP id c5-20020a056a000ac500b006be5a1a3b93mr5015225pfl.4.1700452261570;
        Sun, 19 Nov 2023 19:51:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123365-22385-1-git-send-email-wangmy@fujitsu.com>
References: <1700123365-22385-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.4.2 ->
 2.5.0
Message-Id: <170045226074.1416826.10620425628441528484.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106918


On Thu, 16 Nov 2023 16:29:25 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://docs.pydantic.dev/latest/changelog/
> 
> 

Applied, thanks!

[1/1] python3-pydantic: upgrade 2.4.2 -> 2.5.0
      commit: 1a108cc4bbf86644935cf9cdeca55730514436ee

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


