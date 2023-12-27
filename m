Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014D0C4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.98059.1703665300059548453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efHW16n/;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28c7c9b19f1so506473a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665299; x=1704270099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/NdZvUqSRtURxnH7Iak7ZE7w/Gv4wKCgvz+uQEjPxQ=;
        b=efHW16n/R4e1bj639p8w++umRqjB31GUJ0EqWKuG8Injfp2qwV1up59HPDSRCAE3Mw
         tz4SyDn7zSVCpb9tyhfCNX3INDu0WO0Ps3FR2HbYTf4Y04/7Amw9NuYGli3XUxh8g5dS
         S/cvdUOj1CAT/hrVj+f6B7c78HmHExf1nc4aTbtzo1yypzYpuNPXotXc0uie1T8GOPg2
         aCqEgAgUwdptZc2xR4BEB1BAxGIiOQoeZ6mwWzswU8OMMZfjGxmnPuBR8pg9x8UrwpET
         sCPbDZRia6BK8lMw33doSx6Q118ZuWZ4yyeFKt3bQQ1ZJbNfAV93tuAsvJeldLwNTfxf
         fiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665299; x=1704270099;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/NdZvUqSRtURxnH7Iak7ZE7w/Gv4wKCgvz+uQEjPxQ=;
        b=rgLVXXc+Z7JWkjKR8vMO4/iqg97lSW81Io2u9wLvcyNuyvywBHN/LSDUAOX7hHr0XC
         miJiL3t7ODRW4nnmjCdeNAm8lirGPCfWv5SlCg7uRmhuEotWUwoqQ8dd53oQKyZfFypM
         jLGHUoL+qcuKm18BD6vlx/Yzr3zwAsaHP+Hw6Fh37tueF/OkWr0w0IPZEUAU8w6nD0RR
         MVnQj5ZHlKYjL/QrQPFpGdkbgjEKDrP5Z3/H8JSGoD/upTO/NQlGLoQakS9c38F/6D/m
         Y0sH+8efyCPuJDyZv9US+r5PPsRFkMXBJnyndNhNS6NUjJreT9jOc9Mjmu1yl0cDdB04
         si7g==
X-Gm-Message-State: AOJu0YxfYrSxQA6KVUOec/JtszlKaeJEWY4yCbSKZeFllhH9kqJ6aDC8
	BRVirlTqAU61XVnzrpJ7jSw=
X-Google-Smtp-Source: AGHT+IFtB/HyUsn0WcPCWUQgpJHH7hrC2B4CqwuenLIz8kOiCH+svbRpvBc+lYdHQFUCF7LOTWKU3w==
X-Received: by 2002:a17:90a:7d10:b0:28c:874a:a5c with SMTP id g16-20020a17090a7d1000b0028c874a0a5cmr448221pjl.67.1703665299437;
        Wed, 27 Dec 2023 00:21:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221164425.3890796-1-derek@asterius.io>
References: <20231221164425.3890796-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH 1/2] python3-grpcio: update to version
 1.60.0
Message-Id: <170366529879.1947762.9943501870855295573.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107845


On Thu, 21 Dec 2023 16:44:24 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/2] python3-grpcio: update to version 1.60.0
      commit: 7596fc3d21e4a9c9749c0de633648455246d96d8
[2/2] python3-grpcio-tools: update to version 1.60.0
      commit: 40b627c4a69664d9621ff82f342f594abad510e8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


