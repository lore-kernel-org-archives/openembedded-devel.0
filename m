Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996E7C4707B
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.98071.1703665314824957213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1qlBzBc;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9bee259c5so428890b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665314; x=1704270114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdOa19qLBxt8RongjYfFtIXMysHIlZNw78PJ87Tynys=;
        b=N1qlBzBcEEvUZQcasiFF7ZZ/eL5i0Uh35ah+kXP2oWApWA6KJzdVeYnaMnMIJgYEZh
         1btGzjecMeC3ELnn4X9vgH2JZqpp9FB/YFcv6MqKY/3PIzRi33o4pA5/Qh1q5RpZis/+
         iXLtrG6OXXpfOm7ODt8xV5HSXTjqlUHgnhhLgSv5h+FhDO9uXch7b+T6+WHugdq1+CB7
         ogPT+A1jWkaEP96E1UROGsjGptdRfgvqC994btTOJUCS31AZa0AQe+nMXXCyx34s6+/s
         WklNKw4kgeZ64EMYf5XkJvR8aCkpUxojVyZW7LF7mxbdTfiA5sTkpWN/GZEayuS2WQ4i
         hghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665314; x=1704270114;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdOa19qLBxt8RongjYfFtIXMysHIlZNw78PJ87Tynys=;
        b=N0fEEPZXXJQkhib3EG6XRo9oVT/jyV7g1FtMNBaDFDLxK7xHbv4RG/jGG/j0c2twxl
         ZeNbnr5X9O7330jDxtJY3DTXAHO5YRza7vod7h6q/fiB6vZPm+VFu2cCH+0YlDB2pKNu
         byiW0jy4YP+MbUr/HpQ0o+JfbJAotlEB3QmdZh4B8w6aQx/A+BWrOnb7llfh0oHtrZUl
         5NirFrD2/blPCTDkzUF+L5b5V8L+8ANdnQS1KEcgLzPHqpzuSCyOQg3qVOFfarf0NPjY
         EC/yzMPmqB7PFNlv2CbHScux3zCbVXqfMqJEChfPkkEzqa/uNFvyfQIavh5KkhfZhzCS
         1wog==
X-Gm-Message-State: AOJu0Yxt0rgWBVm4bvGxEfTsIQ6RjCUBAKBcr7gdpEQL9umbo06rH2MA
	vZoX2v7JhnEQlsdzqZLc50o=
X-Google-Smtp-Source: AGHT+IGAM6vVIvcY/fPuRVy3GZE02Y3W8akqNhRgSAr+L9MUO8CJN+mUEPVV1LpzkPpIZwBUlCm0Dw==
X-Received: by 2002:a05:6a21:99a3:b0:196:1616:15fc with SMTP id ve35-20020a056a2199a300b00196161615fcmr344091pzb.5.1703665314303;
        Wed, 27 Dec 2023 00:21:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221225457.3953906-1-derek@asterius.io>
References: <20231221225457.3953906-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-web3: update to version 6.13.0
Message-Id: <170366531359.1947762.5121813621599200973.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107862


On Thu, 21 Dec 2023 22:54:57 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-web3: update to version 6.13.0
      commit: 10b479c2ce4c204b17addee2f2ccf613202abed5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


