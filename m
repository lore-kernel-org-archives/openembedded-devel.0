Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D88C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.14520.1701215729521810901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lp5shNF4;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cf856663a4so43003385ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215729; x=1701820529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nK03H4vbmgipMVWqlc/IC9jFgsoY8n6upK1FibkuJvE=;
        b=Lp5shNF4sIAOC96fwkoVyKIa2i/12VX3C7UcVkxq7HI8GdGcJGv+qYcoCtmSap6MPh
         6fZBo60E7T87bvncVDYDJnyHDCrs8op7HKz5v+XflTGimEoMJTTvYzMV45PTk6Vrbsra
         gmA0wUGyk3EWDaVrZi1c055/YgRpbkXrmJelqhwraHaBn/fx3cD1Au4k1dFzPiNvRQuN
         cH9GwvuCXZXUNohQOJr1TP5LcMcB7btCa+yx5f9mQu6WzuHtkZTwG1FVrj1hGYSqH5P2
         WO70njopB3nDjYvmdls5vuLE4LyX4rD0w8YxYtOb6ZUFP1eN/NJ2QOp74p4QoKZ3qxqi
         ED1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215729; x=1701820529;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK03H4vbmgipMVWqlc/IC9jFgsoY8n6upK1FibkuJvE=;
        b=WZ59Q3XDYtyKLueV8ky2CtMF2QtqW/cSLQPYUjfMzdbrfiigtQ3Y+kDfR/GUaJdMVA
         SxJQ4/M6VTB2GfXN7I8cCyobExzAXe8pnLo3bOJC7tnc62Sstr/17TbYFTkLfCP0gm4Z
         fdsLwW+an1sqFCwb4fn51irwvw21PduQiocpQfZpuGDcbkOqtVVB2hjsY/hs3Tmq+L6s
         RwLGBYnNfbWTOfcPoIOoAYfZruVjmDaVBPSAuKtLgTrN/gW61Q4hDfa7uaC0UQwendoo
         ob4LD/67H40IyEufd34URu5RPGMKVMOSSL2j+H0k5i08wlZtWZF7iK/19vLs1u+cQzqg
         w8Iw==
X-Gm-Message-State: AOJu0YxTC/U4j16gUI1TKk7OGwt0hoz+aiosRTRlsjvlZKUv3ESbNgm5
	NIgBY1Mszq8rstajCvHXlydzHVVBlVpF0Q==
X-Google-Smtp-Source: AGHT+IHuNPSgCLrXtnOvrJEwjPiEz7QhHBl0DyQiU3V1kYxgTjsLPJpMKoIJ6xOVLJdQcEPQuIKqrg==
X-Received: by 2002:a17:903:110e:b0:1cf:51f9:197b with SMTP id n14-20020a170903110e00b001cf51f9197bmr20075621plh.23.1701215728672;
        Tue, 28 Nov 2023 15:55:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160511-28280-1-git-send-email-wangmy@fujitsu.com>
References: <1701160511-28280-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.10.3 ->
 2.10.4
Message-Id: <170121572774.1187527.3819036817287603920.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107114


On Tue, 28 Nov 2023 16:35:11 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Do not detect as requirements.txt if the file is a python script.
> -Provide information of the original line when parsing requirement fails.
> -Resolve -r requirements paths relative to the requirement file they are specified
> -Updating package now overwrites the old files instead of removing before installing.
> 
> [...]

Applied, thanks!

[1/1] python3-pdm: upgrade 2.10.3 -> 2.10.4
      commit: d0fdcca9b21def00d4c716e803b7d9a97d136a15

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


