Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79643C61D85
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.121190.1700784073770557202
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHspGH+T;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf6af8588fso11348635ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784073; x=1701388873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzl2C0Wyu0HD0z/PKStsQIkMnX2sH+uqxdCpJWorKuM=;
        b=FHspGH+TBvekptigyIDZhHhr18zEhOXnJbdeQ7nh1qiPP7njWF2GblGwNi6dDIpTRz
         pehFLWiQmsL5rjPBYHlitCHcb0E3a5LAqGsivRZ3FSo1jw9wd0nmq6YCBvyrqGLkdYSn
         q2+5wXubag7FU8hBWmvHVQnRvB26UUeoa3l6SalVZA1xzkFvBd4ZluF8+9YUUr6BJFYa
         LZkEUyCYX4vtHgZ8fQDCObqzsRRsklgFtvrcgkfmPEc0B4ADH7jqwldMASE1oPVB6qv1
         FYEp01fecYkbk/JBlkonStlZO66eLvbzjlu110E5GNA8p2djUJtPGv9h7fd9HcEIgoWf
         fo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784073; x=1701388873;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzl2C0Wyu0HD0z/PKStsQIkMnX2sH+uqxdCpJWorKuM=;
        b=DNZINAJh2zREnllwzGP1fGv7kijDHgEcgkT7KKw1KanNd8DSF4S3G7/14jOj/ZBzwD
         riKhqvZazwtyX7kJqwuRvJfg0yiN0o7QIoWc1Wv9YU/+/tcbR/82E4TEx9HdGuaI/0Ri
         ag6i/Pe4a/GalK+8j0IBpeVkcRYC/rPfc6ROJ6sHPeDxBhCEiGPhjUj/k1fhcy/xcCvg
         +XZXqoR8gyJbhGIZEtVR6aNrm6I6gXecytmrlLGEp4KlaOGK6sWRlPHatJGyKFNJXhak
         ynnybQNVEXspHkE6ay40R8P9UrXBOOL4PiR2lO70h9KWDDLviljKwJu3mUrWKKXxbJBZ
         bOvA==
X-Gm-Message-State: AOJu0YxgkKl+o604erfv407LDZ9btQY6CifKHm+Aztjww3nmYogspBZa
	8YFFbRdUV7Oxad0g9uPuaWSO+2axABb3RA==
X-Google-Smtp-Source: AGHT+IHveNgs47qcfBqLHv+OZqndicgrCne+q1YmZw3amioDzrR7TQL7uiGUplj/HQuf0RoC3xoeFg==
X-Received: by 2002:a17:903:32c2:b0:1cc:787f:fb7 with SMTP id i2-20020a17090332c200b001cc787f0fb7mr1390271plr.19.1700784072902;
        Thu, 23 Nov 2023 16:01:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Charles Perry <charles.perry@savoirfairelinux.com>
In-Reply-To: <20231122235646.3631072-1-charles.perry@savoirfairelinux.com>
References: <20231122235646.3631072-1-charles.perry@savoirfairelinux.com>
Subject: Re: [meta-networking][PATCH 1/2] libexosip2: add c-ares and
 openssl PACKAGECONFIG
Message-Id: <170078407201.3118595.12971187347111135481.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107043


On Wed, 22 Nov 2023 18:56:45 -0500, Charles Perry wrote:
> They are enabled by default as libexosip2 works better with those.
> 
> 

Applied, thanks!

[1/2] libexosip2: add c-ares and openssl PACKAGECONFIG
      commit: fce26a78a14c8c32aac6ec299d0ce7baf51c029e
[2/2] libexosip2: package binaries in a separate package
      commit: 991e6852a53e0fcd40af8f0386d7f46bb318015e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


