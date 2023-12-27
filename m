Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E690BC4707B
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.98040.1703665274414815306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsTkLnPB;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28c467446f0so1395136a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665273; x=1704270073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkLZ2BlHvZhImksF5uMQgDeNOVsXGurm+2BIPUkABwA=;
        b=AsTkLnPBYpgIWE+gGdVrhB/usGj6lf/jeB+guLnQP1AHJgze1RnqiaTRSmq9gzjEma
         zCrIoXkHtlHhIN1PwnJxh2y62AAhtM3ZZLje7ngvIIft/ync8aRqQKh8T7nwpbjngCs6
         ArjECl1jkfpt0TgiFaVi42euOdd7Z7HvPubkC3qis4pkuDPojug+6zOc5QdsUEFKZgkV
         miPfcWO5+jXDggZJKQmY503KP9WJP15W5nCXtwsLju1KemDSV1G7885NctIIOhOp0hLK
         fiGPJUCnCGwMTjHkawyflbtyHQn6NKMXpav15Vhu3nY8TjHSHb9cOeR/BfHeHqhshBNp
         21ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665273; x=1704270073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkLZ2BlHvZhImksF5uMQgDeNOVsXGurm+2BIPUkABwA=;
        b=gbL78gCWlRoh7jJcNn0e9NJ4cmG07vxsx8nSLgKKfms7IWCXiD8EK07sn6aiUGKxQY
         FnA1KPj/Hvoz1Dr17kEkDgF/2btWRZcbFSxOOyrFz4UJfm7DeCDqw7zvKZpYxKC0r8H3
         vY3SPIGwSGWUXss5TxgRf9dm+xA4rjA1J4ifBcVzDif48YtrsMq0BGyVjE48Q1zlnui3
         i9+uYN3UwwdoXHsSm5WQv+OJZAdOYoHERvbYDt3R7diO9kNfLCZsApFzKz5Df6kDYobR
         56FXnzpugYMss1MSsGTFMPi2Ln9BtwjlTB4grr21nsn3rq7l7bDNb8zZu12P++gxoFj0
         n4uA==
X-Gm-Message-State: AOJu0Yy2IMfb3Jpqq7ESBuu3QZtKLVzqryG8UdyJEGurtg990CHp2GGF
	Uc+3Yo/G8hIisDmZFr/wzAXEXnenDhA=
X-Google-Smtp-Source: AGHT+IFYCvbRguA8Vo4pL2zBoclE5bgJEb5+kVVKKD2GwO6YA7MjC1fSQSrqIa3tEqE22zHnFlHL5w==
X-Received: by 2002:a17:90b:ed7:b0:28b:eeec:5e8d with SMTP id gz23-20020a17090b0ed700b0028beeec5e8dmr9296830pjb.44.1703665273494;
        Wed, 27 Dec 2023 00:21:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@arm.com
In-Reply-To: <20231220155334.1055853-1-ross.burton@arm.com>
References: <20231220155334.1055853-1-ross.burton@arm.com>
Subject: Re: [PATCH 1/2] lemon: upgrade to 3.44.2
Message-Id: <170366527259.1947762.2949283615776316493.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107817


On Wed, 20 Dec 2023 15:53:33 +0000, ross.burton@arm.com wrote:
> Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released back
> in 2010[1].
> 
> As the small source tarballs no longer include the tools, fetch the
> sqlite github mirror instead.
> 
> Don't bother installing a pretty minimal manpage, as very few projects
> use lemon (sqlite itself, and libpbnjson).
> 
> [...]

Applied, thanks!

[1/2] lemon: upgrade to 3.44.2
      commit: c3ac5cf180f960dbbf6e3a3e76d6d44094873c72
[2/2] php: remove lemon-native build dependency
      commit: 668ba95ea7d1d5a9ea37e2a725f152eaf5eebd94

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


