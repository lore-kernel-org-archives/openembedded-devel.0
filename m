Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA87C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.30699.1702451247168641944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHoe+Aag;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d9e756cf32so4258385a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451246; x=1703056046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5sWWx5hwCA6Pzr7Kc0QZLQPoUdM7h9B3r+x0O+3FB8=;
        b=IHoe+AagkcWEpLLlOeBftRf+3UUel5ydRrE7lHEUWHZH5dtQHiEzhY8IgQ6v+9fPRR
         Lq+OiRR2V/5iKt4Z7zVc7OyWBhYzqZF+UleznqqEpgnA4za57U2784rhuWNVV/nsrprx
         m7fANbJPhyxPVIlgbQn/oK+1byooVQ8k0M2nlfVsDaQKBYI3nD0049LLO2lNt5bsxvmu
         ZaoBeo+wuUk5le8dLCHIYo0nPdqIq30OlLi45OcB/mVimPzNlPfpl36OKhp9Ui8QuvF9
         QAltBSfdycpGxMbwgNe92mk2MLTM/+9tTRfQBw21PjDMVR3PwSUKu5ztNo/oj5oxXrZ0
         thTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451246; x=1703056046;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5sWWx5hwCA6Pzr7Kc0QZLQPoUdM7h9B3r+x0O+3FB8=;
        b=fgzYmOILmPzoSuq6dHVBdLkk8iCP66GZN5M1vDDlOai0ELSQj6TnfGFQNXNcsG2Gf1
         IXiYVutAWUMBLcvnJzsEjl+jZUrfKG4bi3Lo6eTdryDoX3rkk8uGd8Cic6qGLRhE/wGA
         zi6dnlyoCXu4uEsKjEZRnlOsvOfvReNXoI/2rIvpbVxwmkZkVG6jgnp1/H2DSHEJII2r
         WUnI81RJm7ovmMp54fAKhhgn40P9SiTvyRvIINkxwijjfjMu/mO56/lR713fvpHSlAeX
         3HLBaf9gW+25SLaqQUI3mmXKn7PkU9EO3jnRCgLhWVHoGQ/PNSFScUrG+t7Wdp8RzxSV
         SeZQ==
X-Gm-Message-State: AOJu0YzwplxCdrMY186hLONN2t8zxHTMmT60qIGJtXro0pAetiZ+wnnH
	h6hEb5mql0SxqhjB2jPSi26HPw/vsR0=
X-Google-Smtp-Source: AGHT+IFGf03RQcQeB0AB9SalrdZui+YwsNzqePNAd2550KzjIEowJyyjMQgICyRg01FCAXTgRs7NTA==
X-Received: by 2002:a05:6358:5e0f:b0:170:4205:a974 with SMTP id q15-20020a0563585e0f00b001704205a974mr10727469rwn.13.1702451246115;
        Tue, 12 Dec 2023 23:07:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231206190108.60409-1-f_l_k@t-online.de>
References: <20231206190108.60409-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] wireplumber: update 0.4.15 -> 0.4.17
Message-Id: <170245124541.133993.13142141803291617690.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107364


On Wed, 06 Dec 2023 20:01:08 +0100, Markus Volk wrote:
> WirePlumber 0.4.17
> 
> Fixes:
> Fixed a reference counting issue in the object managers that could cause
> crashes due to memory corruption (#534)
> Fixed an issue with filters linking to wrong targets, often with two sets
> of links (#536)
> Fixed a crash in the endpoints policy that would show up when log messages
> were enabled at level 3 or higher
> 
> [...]

Applied, thanks!

[1/1] wireplumber: update 0.4.15 -> 0.4.17
      commit: f95ba6d0742a550c43ede57f04baeb6a6b98538a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


