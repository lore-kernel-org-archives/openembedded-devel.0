Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B154C4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6742.1702967232392926266
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdCx5ZWB;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d075392ff6so28484155ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967232; x=1703572032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XybZrP+v06A+9P9RPo7LF72jaPLr7EXkPSU20VLflqM=;
        b=CdCx5ZWBMEmhSetDM1f63qodh1BLHv6X5sk1+PomkS/mSBjZQ5c6p8DYrUdLe6Fsly
         Ru9Pd+2b9ULsJWgj5UeLmB54TQZvXHs/cR5GxVRSzmn5YgdKo8F3+b3Vys4HVRr4usZF
         xWN/xokJdLYa7VHdv/6l9qlWT1jN8524FATps1y8QZkBHF38GfgNs1lZE04wFwr4P4uP
         WFLEq7dzzJ+C5SMrFwExT80oBMpNBTBSzmeYO95ZecsPqFq0H1RtLz4J/PUtWN4fx9V1
         tsc1GYle/0P8TaIv/RLuR+MYAOSekQKC/QObwxK3/MZLCTVLOXDXt1B/WeBhsurfXFFs
         KAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967232; x=1703572032;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XybZrP+v06A+9P9RPo7LF72jaPLr7EXkPSU20VLflqM=;
        b=iGpp+5vUF471E99TOC32LE/tYr9W9C6Qb81jIT+2cLnlB0z/jdJUBHfkjGQvXfjlL5
         FnygyXB14YYzxUPPn1Dr2KfFjnlpIAzu+FcTfcsbY3NCHN2iOGAcfjYYdFolbXtvfWuL
         9yoijO80ixEnbwd1DDsc3MNfoL0JLen8R7lpfcgWwMiH6jCH/DqykNmCQmN00PZ6t5eh
         1Av2kSyuwLmvCe1LTayRY5kCpnXm7F0gECE1TrMdNpF8yYeQun64X5boWscPo97zpJLF
         3WrprUKCGPBLaRxIpfpkSRRXTQo15EiXpjhcupBd3SgJGaWYZOIIPRz095wQnhejb48M
         Ejtw==
X-Gm-Message-State: AOJu0YxnpSjTKZHbhVTiXDlCGMV7oDeakVjHGqWOIfB+wRc/w8YGP2qT
	6zIlZ18jJCZefC8h6vp/8vU=
X-Google-Smtp-Source: AGHT+IHR6Bap4yATteZARXbuWYE+vntX2HiNowOHLT207NTqMkv3AyFFATuqyynjGUyoiPyLzM9sdw==
X-Received: by 2002:a17:903:2ac7:b0:1d0:5302:4642 with SMTP id lw7-20020a1709032ac700b001d053024642mr883061plb.16.1702967231743;
        Mon, 18 Dec 2023 22:27:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214050339.1190691-1-derek@asterius.io>
References: <20231214050339.1190691-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-colorlog: update to version 6.8.0
Message-Id: <170296723109.1627685.9743543741948566810.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107567


On Thu, 14 Dec 2023 05:03:39 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-colorlog: update to version 6.8.0
      commit: 0d2ddca3352fb131309c0fb75a1346f466d9be9f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


