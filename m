Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F5BC07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.14509.1701215714990681032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dnMctVTp;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d001e4cf7cso9268655ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215714; x=1701820514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Du2evvVNN6/J3enmHB9ezqA4w5xQd9YsiKgsx7tGY0=;
        b=dnMctVTpX+jvnAO9HU0EX+jkGJ7FCHlBewpIUOfKb71BVzDVHigvqx3VrztdU9YvgP
         a+DUekFVRSKh6W/nSbRSiJSF9eQ+e1REaUKaG4zZcAiB+FrOYbT0mP/8bv1cZN/9ZyZh
         7mVQUAVM7Wh3JZ9xFEkqITrZXjdakkaKWTKSepefYfxa+yinX3bR7oB67SwQ+KKs2LDj
         es2CEu6egAwIfc+AanGF2cx+WlZXIisCbe69/MqQSsccSAbtdexUs5xV6g1ecjBfQ2BT
         ICdSdBixNnR0vG82dA6HmwjK12iJN8hLB/bT7u7ynGpz8NBB2cU4Ka1VMn9cN09jDg0d
         U0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215714; x=1701820514;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Du2evvVNN6/J3enmHB9ezqA4w5xQd9YsiKgsx7tGY0=;
        b=ueEY+4GIXMI7BbJFxqDeCtQsdErYHTlUa8eILaHfgbtKmAbu2L5vI8Z34HWf7sHkSo
         Ls3LijYWn6ppVDpCOemMohHtqUCKBTHIXXi+0UQLCxGCofAEAlVBYTAti0utS0vpBBwZ
         GJ1a3q108JHzH1K9+tWAOBmuwmCf8cgBUMmVC5gyfZ/8r9xntgkNMdDqoTx2toeN1aV2
         mAZ0+f8ndTb7bh1qKlb/Kxyq+iX/XJGADiJkjy5fFbbcXaonGV7Cho6xAwATBnAR8k6V
         q3lgI6ARdw9J+RBi3XpF1hO98E5xDHnPUvSBv8kvGwW+v8tiF5IIYzShX72klpECal49
         C3KQ==
X-Gm-Message-State: AOJu0Yx7qXVzNGOsZIN0jSVsq6YGiW2ss+RTws5H2263dQ9TRTiXeQZX
	a69l7g+QV7A6AV+qMhz8FJxpx1pD3PEByQ==
X-Google-Smtp-Source: AGHT+IH0bQXYtcihPI+dKRTXyNQnrh5YZFoN9qUDbsE7nEM/YEhNrjIkkh2EgxgfrmGMUFUVgh9dRg==
X-Received: by 2002:a17:902:ec85:b0:1cf:a9c4:7f4b with SMTP id x5-20020a170902ec8500b001cfa9c47f4bmr17007652plg.24.1701215714006;
        Tue, 28 Nov 2023 15:55:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159483-27786-1-git-send-email-wangmy@fujitsu.com>
References: <1701159483-27786-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] frr: upgrade 9.0.1 -> 9.1
Message-Id: <170121571318.1187527.4548846305320900690.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107104


On Tue, 28 Nov 2023 16:18:03 +0800, wangmy@fujitsu.com wrote:
> 0001-tools-make-quiet-actually-suppress-output.patch
> CVE-2023-46752.patch
> CVE-2023-46753.patch
> CVE-2023-47234.patch
> CVE-2023-47235.patch
> removed since they're included in 9.1
> 
> [...]

Applied, thanks!

[1/1] frr: upgrade 9.0.1 -> 9.1
      commit: 94f462ce829f2b66ca59dbbae2b8c66d48796ec4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


