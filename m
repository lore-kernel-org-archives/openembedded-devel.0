Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35B8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.14527.1701215739682847217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzW2CVo+;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc9b626a96so47120855ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215739; x=1701820539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBP3J/yeWg9oZ4mLz3UYFk5biV0feB+VY7Lf+AX3iCI=;
        b=UzW2CVo+CbnGHs6APAVuNsh0BD36GR3E1r8Fcy8JlIbphDlVuGgBOtrvs4vjZ6HWqE
         Nui+lCvLNR0Bw6R8pvGu+md/zfC41X2hMlfvVPftaIPYObAQhXRS7XoyWs+8/hF9B+V/
         LXQJvJI9RFoiyWYWfgcSSJehsbgaK+ZJo6BxVCeBhDuA6bvapX6h4Z5WNDQgPmIRl0K2
         7fTGQ+PvrSqYQJ9JdV11twG1lC5PNppof7hqra8FLtKssiDJQ4FbHcN8PmbjpjeZFpOi
         WuGwCqouSZJFffKvCC0loV3vlyXVdKbJKM1Ir8Nj2R5XgbjRUl0xwld4MNbPwALG9Wfg
         dKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215739; x=1701820539;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBP3J/yeWg9oZ4mLz3UYFk5biV0feB+VY7Lf+AX3iCI=;
        b=LfrXpgpn5qgCCXoDPis2zK+Bt48C8v6lI9HPcu/k3YXVhz6hbcIs2d2EpyBoPoyVkL
         5gYqlAAoHIUEZM3WbMkHn+6zj6MpvtpzIZymVezRVegYZ06zF3426+fUCfuHEUdomjtl
         IsOB2IpLLkX3yPv8nm8nUc68AX18tf3GKacoRw0RysFi5C8fSR8jIRrL799SFrnIo94J
         dbrbv4HcKRLduqFNKJcxzQIkv36M2KwLoRiyXxR9BW7pfA9tJq5TWmxbbPZaO+fThD2H
         d9OFZM7Da+0bP1WtSX/cybdZ6vtUrxm6guofTH3h1Bf7uS1E0YUJ0TNcaVeMGpefxb8a
         UbsA==
X-Gm-Message-State: AOJu0YyOkd+y64V+zfVZQ/jI8YizZCLW/XBaDFHcLkGuJzd04wF8Qf4L
	HB0Ztkg9fj6PeXXC40a7mldiR76Wby7CIg==
X-Google-Smtp-Source: AGHT+IEYm+K1BFZ1Io/J/OixzrI+WaClwJZMbZSPH9vJAdKHxEkIyKMQXuFLutlNs19MY9kyvJp9tg==
X-Received: by 2002:a17:903:1cb:b0:1cf:b127:9982 with SMTP id e11-20020a17090301cb00b001cfb1279982mr14906914plh.4.1701215738947;
        Tue, 28 Nov 2023 15:55:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701161404-28714-1-git-send-email-wangmy@fujitsu.com>
References: <1701161404-28714-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.5.1 -> 4.6.0
Message-Id: <170121573802.1187527.2045691233067552306.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107124


On Tue, 28 Nov 2023 16:50:04 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  New release and Windows installer. Requires the Gensio library to be installed.
> 
> 

Applied, thanks!

[1/1] ser2net: upgrade 4.5.1 -> 4.6.0
      commit: 21cdf20995646d0cc8a92331dfa557b8cb0d2ad7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


