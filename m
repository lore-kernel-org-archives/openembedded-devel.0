Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F050EC46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14762.1701215740563158982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZiBFQFl;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cfb2176150so31249955ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215740; x=1701820540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MonAPa1w+nUdUy9HA3nwosqNCwt9GLhPYJLrGwhrtf0=;
        b=nZiBFQFlbkKv8wivsfarFI7wD5mOju2bGqIbi1clh6knDMZR+oxk2kDJMrZADZaMWf
         el2aD4esKQbnM9zjoFiwlaFL7tNAEOHEfsS3pAFLaB5bc8270z2wM/TBNA9IPDExwtS3
         pmbi5XBohq+oyYnKV3m9MQonekvelojTz1GdizPlqQlylxBFo6wv3axpK3E0jzwkbG77
         +UqBzjxZe6CoGpw329FUXzzAMq9+7vZd+to3La4kEZHrmD3b9DpKNVwqCPnhH0F8BYee
         ToUq5zWKzOqevzTf6D8m4StI6VfzOFLaxmV05sDH3C2chnuwHJMqR6lq3rYM7X+hQoAN
         zK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215740; x=1701820540;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MonAPa1w+nUdUy9HA3nwosqNCwt9GLhPYJLrGwhrtf0=;
        b=DCw5XUEOI65QDX+w1hyjlZFKI/hd2pbru3IUdQ9b0EWw8yorfqURN1IyuqWYcyrblr
         Sc2axU4i8BtglAk6Kug3RwkfYdlypUTiSbjU1T6MD2M29vaWIyWxwHDwJyBDQgq1ClZu
         zNSmvjt2lCBxCk2smXuKnaKNNtWhLipYtKnMtoFPH0/sTatm6DUovZ2tZ7SJ0NZcHCYC
         08VrBzxnu4SnJOwVqhyYJX1Tcgi+m+LbU893TYRJJa3inl+JTzCx/cXC4qibrWiMnMU7
         RL38XvFgj6Pz4TtVrgqoAzm9slsYsz1GhbRCf12qxWq8MixJ+XNde7JvKhkh96jQXH/a
         EuZw==
X-Gm-Message-State: AOJu0YwF/N95fbU6IV5L/G8W2IFOPJtgS8oHPXncFAEreA/IZYfCsIbN
	+igQdTV14f2TWM3W4T6ipX5Kn3QuW0PMeg==
X-Google-Smtp-Source: AGHT+IEUzdZnMCmum1pWHun2X58Y/EJmjZoNeUc3WtFlMkdbXi/JErxADhvBbizpz0x5D44jhIKKSA==
X-Received: by 2002:a17:902:9898:b0:1cf:ce79:8900 with SMTP id s24-20020a170902989800b001cfce798900mr8394792plp.22.1701215739847;
        Tue, 28 Nov 2023 15:55:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701161515-28771-1-git-send-email-wangmy@fujitsu.com>
References: <1701161515-28771-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 3.4.2 ->
 3.4.3.1
Message-Id: <170121573908.1187527.12757017539751053255.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107125


On Tue, 28 Nov 2023 16:51:55 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] thingsboard-gateway: upgrade 3.4.2 -> 3.4.3.1
      commit: 5a77dd140c6ccf6419a433c3639d46331dc3c6a1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


