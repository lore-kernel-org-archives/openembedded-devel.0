Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ED2C636D0
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.121179.1700784060462943005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bT1AJ4+S;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cf8720c6b7so10425515ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784059; x=1701388859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPJfzkW2BysFQpau4/Eks7nHJTkGe3nlNGa3u4aL8NY=;
        b=bT1AJ4+S4VDc0v6eKu6ZF7MDeztYuRk3V1AP1gyM8lh0oTyTmVPwPUUaCVB3ylr5Hl
         UAvzMV/uyY0sk0Ce390wD32af8+Vr2/XFeW3rpq1e+9jzqZP6oktFIfHo5B2ClTXWQE+
         12pUxj7sVVAkRhndglnfWGtsHPPWZTToJVfByDSKqjyskdCYdYUzTfUqXjgDoAqRzWDR
         BaBDfUUmzJh+dPQvPKAFgF+nQK6dQTXdYY/eM6GETuWWn8MiyBdCAsJJUDz3HMnaUNdh
         y38+3kSNWcW+Tzacz6wP95Z8swty4VhDf7ut4s8+hXqQ8lUteUTNN/Lz5bESXDJYTw2v
         FlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784059; x=1701388859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPJfzkW2BysFQpau4/Eks7nHJTkGe3nlNGa3u4aL8NY=;
        b=iwzJzluCXPpPOfWWxUmJ/3L5bBxuB4Nzwj11gFveRh9n5POcpWRLnAITW/nwe7UBni
         nWHJx3v8XhzYuS3jnwqZtVoRAdB+pHXeoumu8Ow8OFpf5w/QfMbnzuYuWFB4QyJUWCig
         T2NQT1I2YQA1j/T+PxoVusOwdFvP3EnuAk2FXs7L9ca2ySW8JP1gomvSFWgwURnmvS2C
         4tE3UpWmMXIMDGFbMYki0sE3J4WDK1ymn2zYvHGM/uR4dIPs3OJK1qHQ+/LMdCBsOT/g
         RoHdvQDQG92vapFxAfzFqvGEC9bnBZYtg+Ul3nxHtcOuA6DnMYEM4gSuQevQJtlpNWV8
         V0Vw==
X-Gm-Message-State: AOJu0Yykf+38nmt9es/CxOR0pJGJ8rzLiHVTDkwY5UaM6iYR6J6p95NT
	s4mIX5tckj9XufuFeSufOn1xl69XhAib/w==
X-Google-Smtp-Source: AGHT+IHARx3KJtGy6FsB9Dt7HeiEEBZJx18f7lJUUlJhR4mRNqtlRKxwcK+Er8i6xvyIyWwJswH0Kw==
X-Received: by 2002:a17:902:d2ca:b0:1cf:7409:38ae with SMTP id n10-20020a170902d2ca00b001cf740938aemr1004009plc.22.1700784059551;
        Thu, 23 Nov 2023 16:00:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:00:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633888-7797-1-git-send-email-wangmy@fujitsu.com>
References: <1700633888-7797-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.6 ->
 42.7
Message-Id: <170078405873.3118595.1988595756596893486.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107029


On Wed, 22 Nov 2023 14:18:08 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -fixes bugs that stopped the Obex Push server from automatically accepting files
>  from paired devices and caused the device's Connection switch to appear out of
>  sync with the connection state.
> -build fixes
> -updated translations
> 
> [...]

Applied, thanks!

[1/1] gnome-bluetooth: upgrade 42.6 -> 42.7
      commit: 8cee44dd4bf264630f02643ad5b126b63575f280

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


