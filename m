Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93786C07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.14747.1701215724163339611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=POnz0Ey+;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-280351c32afso5654417a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215723; x=1701820523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5eCspmskVreTSUELHlKbchM5zrTsMwBLoke0rO2vIM=;
        b=POnz0Ey+I0dz/wVrTOoMyzz4AoWg12BV4z2ep4cBdoYgSKpJGRb+w8Km+VM43SS8BU
         6s4Jddh09W6cuhXi5aADX0LeVSsYHK3xUiuJ7zpv9FcYLaoP4rS47Y/TwNF7qgpzI2pY
         Y2TRQtcloZUbqUF3kzyC/TX0LQnF4oya1DHrjU3WnVj703XnBb7JHzdmdDx4sMGtCkxs
         oSglclqoIQQo8unPk4Nzh2h/+9pp5MypBWqM19aUPwZHUbFo9oOTKIIS7zhzNQO1o4ln
         HKRfDFaxaDi6FpyTqycg5nDDeaC4dqWFNG+9rwB2WqwiASxvyfvTmjjmb8ZlXL1pDkDr
         rKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215723; x=1701820523;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5eCspmskVreTSUELHlKbchM5zrTsMwBLoke0rO2vIM=;
        b=jUZVLJOnuqiY66ioTnig8eDLLUB1Fg8VViEGTanestsckZK3oGiAIQC/YinWakWcyz
         UzExb82m4t56FlpvIydwCLL+PuI0lTXK9drDCXEc//hxiRXid95JWAylPVZngm1w1H7M
         vnEECXXoJ5HCVqsSymq5qneT6CxQL/wt6q+GV0b8l8NXH9Mi48NSZTeYe2JDSUy4MFJw
         rWx3M/lGnfkouZwZaXTcSo/zuzNgwVM+dbSYiB/dzM8RKBBm1OUOrpKcG8v4+5rxVP1k
         3pC5OrdUuE5orzW9f8WT24cjJaPbq5mk0YcyUEfd896G1Hg63gwpcVBHXRZoahEkK6X1
         DHIQ==
X-Gm-Message-State: AOJu0YzOADUPN5+0TDy5TxC83RIJHBFZseWN51Zn28UMyXFzGch6tuWi
	1mokTLUVGN002uemZxMy68Ih7eBd4c/YjA==
X-Google-Smtp-Source: AGHT+IHCll0sRV+LPpi/Lt0Ec/yxmRkZP7FRzo0Je22SMaPovLep2AyOT3epn15u4r3Aq8YkPXI/Hg==
X-Received: by 2002:a17:90b:1d0a:b0:285:75ab:40b9 with SMTP id on10-20020a17090b1d0a00b0028575ab40b9mr17617308pjb.14.1701215723334;
        Tue, 28 Nov 2023 15:55:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160141-28109-1-git-send-email-wangmy@fujitsu.com>
References: <1701160141-28109-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.14.0
 -> 2.15.0
Message-Id: <170121572179.1187527.10398256255971618577.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107111


On Tue, 28 Nov 2023 16:29:01 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Make ErrorType enums compare as strings
> 
> 

Applied, thanks!

[1/1] python3-dbus-fast: upgrade 2.14.0 -> 2.15.0
      commit: 69ddfb9c36b39b95f690639434bb1d3634f57939

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


