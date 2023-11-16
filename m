Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBB3C5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.19045.1700171481058134611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOx8aENi;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28010522882so1145880a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171480; x=1700776280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MADT1kl9hC8GN/Ccuj62C9Q6yKO+um+G5ZNpRWlkQew=;
        b=TOx8aENiK64gXoDlZdK0TBsOMXMDw3y8BakInhuXpAb1IYQxx4A9Wd7+4Nw11C2KSH
         Kd9aCMA8p8OmYONssci6bVRzQnDHaStnCCVVLdJXZcx3MiDjLD9Sr1kk6mOKPP4OeIKK
         3Y3nKv+vkbY3PkQ5KFTg4pDQijQsw5yC2xZiNqT0CfSdOUAWABkMtCY6mrTuKTFmM424
         R4Rb8InnhVOO7cfH7ldkl2TbM6TytjmlTlp0QPTiAinEcpnBdIgsboIC8mYrFcFFz1cT
         tR6UaMOz9QRCVf1Qu7nrtQrR6j4Lm8PEC7jbEEkFZZ+JPZ2cwretTYp036nzwfq7Ew2t
         dx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171480; x=1700776280;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MADT1kl9hC8GN/Ccuj62C9Q6yKO+um+G5ZNpRWlkQew=;
        b=UQ7RVIZWM07HuUHutbtv4hO9kIjCR6o8VGD9X42lGvfwTlOlNynKGxkKwzKH5LgIp+
         +YG5cJmToC9jsMBZHNv/wL+dVEk2awlAybUupfwQ7tJ+7o7fVzbb2mrdSogSg2pvLgR2
         VPa0471yuAUmlkPbqZI4pVJIi2fGkFKXdo85YSOhGDIf0gYarSMz7GIXz6s9QAbYANh7
         QWtpsmTQJ5VgAdSz/VmMdrI1Bi3M2Q+sTjfMqxqLLInSKyY1yfhS7UOCOQX8Ky0mSNA0
         5KiJYOObLura56RJ/NRo0yRcyP8G4kvl/S3GbBGhDLR0/uVsT3zGoRHz0F+GM/5Kl/gz
         Ji0Q==
X-Gm-Message-State: AOJu0Ywc0f5WWCLlhDIfDKL1PnyMEacxuYFvmY8wfPdsVOjywKFDDpVF
	5PgwED18pmEeN9smOFkAp4PJ4LmCq4+c0w==
X-Google-Smtp-Source: AGHT+IEzWk3Sz4x1J4V0TdcygFdpUsnImBLiE7oHFZT22xk8n+JGA5ysUAy2NmIB/Nha19ZvHYPyEQ==
X-Received: by 2002:a17:90b:33c7:b0:27d:1c70:23d4 with SMTP id lk7-20020a17090b33c700b0027d1c7023d4mr14618863pjb.44.1700171480424;
        Thu, 16 Nov 2023 13:51:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Armin Kuster <akuster808@gmail.com>
In-Reply-To: <20231115132611.16589-1-akuster808@gmail.com>
References: <20231115132611.16589-1-akuster808@gmail.com>
Subject: Re: [meta-networking][PATCH 0/3] Drop netkit pkgs
Message-Id: <170017147958.249256.7239064484621640423.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106833


On Wed, 15 Nov 2023 08:26:08 -0500, Armin Kuster wrote:
> The netkit packages don't have an upstream. Some are in-secure and
> have more modern and maintained alt replacements.  If someone needs
> one of these pkgs, please submit a patch to add it back in.
> 
> Armin Kuster (3):
>   netkit: Drop old and no upstream
>   MAINTANERS: drop netkit
>   README: drop netkit maintainer
> 
> [...]

Applied, thanks!

[1/3] netkit: Drop old and no upstream
      commit: 4c1e6d32ba6e9a14937a83f0d9375ef4d0b28057
[2/3] MAINTANERS: drop netkit
      commit: 428b8cd074079c16b231084b89d36fa71fbbef30
[3/3] README: drop netkit maintainer
      commit: 3e2ca90f93f1a16b07f99f843218b17dd6f5ad6d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


