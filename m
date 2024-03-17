Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC298C54E73
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.27095.1710706702339043145
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=djzcqIsH;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so2183641a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706702; x=1711311502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsHWXGxw0Oha5tvDFHVG6LWlZPvjgNEMqK+Tm8r70Hc=;
        b=djzcqIsH5H87fDhr5LiWpRGxQzl7JIom8OYXnwt5u4AxQ/Qms5laP5xohGd91oRTSD
         uLOVm6C9+vqcrYDyJqCbRyz/hjT7pvWUPfYBYG7zLQ73LJRXDgnVr0hZ5YGn0g53mzu3
         89oX0arrg6oofeD3S1H74Zq27btI5cOClVG0FGcGPbM3QvyEwl5PMBkapff7sAWPQVNP
         aWyouQ2tmnvLCh57kJmejR4ulWE2oy+g1Brj0Qd68VagcF4qKVoWh5pqn/NHD1aXBEKz
         BFqeqFJH0+DV9ctAaKw6tey61n609x3V47MBdbIp16pQ6r9Scz9YXBMKGoka5WcRoABS
         klPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706702; x=1711311502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsHWXGxw0Oha5tvDFHVG6LWlZPvjgNEMqK+Tm8r70Hc=;
        b=vvfJgmR6Ej7oMhHACdbASte7/BSw8k+oRaUofM0dxUurcDqbRytR0xqPSUDsTgnIK4
         CWBNjS70XCOMUupuXcFyTGTAzvkoSPg2+3RsaMvb5NpxdttMAN/G6yBi8HKjl+/hILrz
         hDdMTfCwQF6iluqBUB8h3v1klrFiJcHHBbfeRu+2lbEoUoz1WJvU1bt1ydp/mmXTm7N3
         72xI+Ss0RXPGPyKCDoWqDzlVKOdhzghEauvK8vfVwLqo1r64YaJx71+tfodovMkhUW5D
         +AK5qFfBNMAt+1TPeZx96b2fpUsEvuC0oup79Pcguw3C9AEUqwhvaBvn4vLvgFa+XLN2
         gp+Q==
X-Gm-Message-State: AOJu0Yy39psJkx38/CWYezA3Hf8AMxGBNkw7NVkvCWscwxyEAWFStaQn
	4zw/9DgIawvMclCQOd4Otue3a3MFDYPqSdDa++fae+w5/XanEbsC
X-Google-Smtp-Source: AGHT+IGmkAeNzQ1XSl5hMHixY8vd45Fd9GdT4Ax+en15wFmLqbnXJ1rdllzOtK6vm7nLRbHZR6fvPw==
X-Received: by 2002:a17:902:b414:b0:1dd:c93c:580c with SMTP id x20-20020a170902b41400b001ddc93c580cmr9896686plr.4.1710706701727;
        Sun, 17 Mar 2024 13:18:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Dan McGregor <danismostlikely@gmail.com>
Cc: Dan McGregor <dan.mcgregor@vecima.com>
In-Reply-To: <20240314010521.1841026-1-danismostlikely@gmail.com>
References: <20240314010521.1841026-1-danismostlikely@gmail.com>
Subject: Re: [meta-python][PATCH v2] python3-pylint: Fix ptest failures
Message-Id: <171070670062.939783.16852229385647319379.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109380


On Wed, 13 Mar 2024 19:05:21 -0600, Dan McGregor wrote:
> Due to the way we install ptests, some imports switch from
> first party to third party. Update test expectations
> 
> 

Applied, thanks!

[1/1] python3-pylint: Fix ptest failures
      commit: 0c428fac857d5cdb90862431c34bec1b76bb7cba

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


