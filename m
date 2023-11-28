Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EE8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 05:22:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.26231.1701148947712035784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 21:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzyK622A;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso3988297b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 21:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701148947; x=1701753747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nsEgKxonqAokiJuIgna1Z0kEHljdCoOpMwEsTfV+Go=;
        b=mzyK622AEfR6z+STW5aqFRbJgP9l30KDcz5LjfCsXdmr/HYQU/0O2meO7Rk4bq0/vi
         wx31goGOHbGolpCjXsTjHOOgnx73HD7aMZ75o5Tqj0Mym6hrLsOzBA3NfLc2Lu0piHeG
         /3S1PDAEdDlGaHTeCF6JS7+y7KZtti7wUb6astjWrUaAewT3n5bVtkVRiqxwhOEIhexM
         xY1XahfCRD5Z8cXeyrFkP3exHwR/sJo+URbDwj6WppK4BIRKhQ8h2UmpA+D8g8CptgN0
         A9IJbOSmRPQtPPd0CYF9wNt0Xz25LgLJnGa34n3v+hqBu7gKvwhDeYFwfVSjmiWMwVEy
         TBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701148947; x=1701753747;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nsEgKxonqAokiJuIgna1Z0kEHljdCoOpMwEsTfV+Go=;
        b=XnkPMb+e4IfWQu0xZok4+Qtvw2Rimnar4jMC+YtBZK4q17Y9j+TTBryYBH5FyHu/9a
         qTOcvw4JTkaY6Wm+H8JfDtPvUvU8XiD3HqLn0gEiAGh6E6vZ+N4x4OwD6D7H2xoZW9mI
         e3DsUZ1yCh/T+167EsYWafe/LLNIGY7kOAxA6HTnMgMEL4TwnyylmYE7jidO5JfE70FA
         7AZujk1fijvgYwqeISmFwG2K0aIGgi7Fk0BAXep7XhwP6JpUE/WGoOnv9OM308tfQYk8
         S/W36oK3b+nmI26WO5qTeae58P+ZT9xVL3/zzXIfesF9xYajz55mR36qnexnRfolEeHA
         8E2A==
X-Gm-Message-State: AOJu0YxyfXe/FVgbu8WVAv6vHQIN4ubovRBOaLx+VeJMEe2H89orJ+bT
	kijZcps524FRAq19yY5wf4y3BIR5I5BB8g==
X-Google-Smtp-Source: AGHT+IEg6igZnbYR2MQq2Ycj0QE7DxkDDqLMWIip8mh4IRozGEhHPv/efG4BBAz9gcER4PIre7EWjg==
X-Received: by 2002:a05:6a21:300d:b0:18b:885c:7a35 with SMTP id yd13-20020a056a21300d00b0018b885c7a35mr9889556pzb.50.1701148946826;
        Mon, 27 Nov 2023 21:22:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001cfde4c84bcsm1608485plf.141.2023.11.27.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:22:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231127164759.2203317-1-alperyasinak1@gmail.com>
References: <20231127164759.2203317-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] squashfs-tools-ng: upgrade 1.1.4 -> 1.2.0
Message-Id: <170114894590.164097.15087601297682192690.b4-ty@gmail.com>
Date: Mon, 27 Nov 2023 21:22:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 05:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107066


On Mon, 27 Nov 2023 19:47:59 +0300, alperak wrote:
> License-Update:
> 
>     Remove builtin copy of zlib
> 
>     On GNU/Linux, *BSD or MacOS we can simply use the system default
>     library. The copy was primarily only there for the Windows build.
> 
> [...]

Applied, thanks!

[1/1] squashfs-tools-ng: upgrade 1.1.4 -> 1.2.0
      commit: ec7ab6b435340bfc238add4bbe6fb3112494754e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


