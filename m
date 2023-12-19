Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19979C4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6749.1702967239681073742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qikwzsn6;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3cfb1568eso10305875ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967239; x=1703572039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxA9fV1wv0QPasS7H0EMAg8gNu7kmlCIT75UqQVrxd4=;
        b=Qikwzsn6TUYhWjM8qES2RAJ8nV9W02KPbs1K7HdjiHcSyaRHxQqb1AGaBGwbagNtZs
         QDK4AJL6ahEoeKfz5TLSv827GJWtPNU3AwMm0RqckjqejOlDnTV5Sp/qtzxQAvZBbo+6
         4ZhvvOjQ0mjxDvHvp5hbvLnrBHgm7wHh8sGFr7phABQinh1v8SUQg8mIJ6DYyvYbg7TA
         TtadsOLr8JtNQFqzhvZJVcZ1qH0SBlcOv88NFsBJJa5dS5IK7dS/Uf+rMEr2xU4o7viv
         Txi09kdN1QAlkFIb6X3UWzkXfBPISJxLEHpkm6Pf+8Y86vNqO/QpCfDKC7Ok7I4cQnru
         8XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967239; x=1703572039;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxA9fV1wv0QPasS7H0EMAg8gNu7kmlCIT75UqQVrxd4=;
        b=uil7BqsanfTYQRDF3zeXtLq+3K6s1+WgJDZj7GVJ3u9DwCFzRKYlln8rIn/3tX6IsH
         /TjkfP7zPio657Al2MOq2QwzPzvtB00C+8AuZKOS9qHM4e+OVD6WH66BLE/KE6iG29ZN
         Fb9PB3mjGnocjtdwNQYOjQddVPZYp06R8bQM93axTaozbR6MXtSyCdUWPKyTuuLvGFc3
         Uz0S3wjj3Mr8CudU9MDgetZMRKYGSp33C+qIGLWVS6iLWy5F398kTR2+UE8a6yVi0l/u
         ciIKwzun9B/aL6snKMvWHstmqrbB1LiX/8EqSw251QJ23nPI+tb3KP1Mm7SDPbs8lmTp
         lVnA==
X-Gm-Message-State: AOJu0Yyo73FPVtWCleeHVd2vjwtXUlPIje4+KrBYq93j6B6Wfa2cfo/X
	UbTDm/4ETQ7gLDFzbvpzvZY=
X-Google-Smtp-Source: AGHT+IHeecfNOqgXEvMCTC4NreMryfHObUUJtyQr2l7PlbhcyAMa1sfWmkhpi4KmDNqaaYomDzvoQw==
X-Received: by 2002:a17:903:2443:b0:1d3:cb38:7dd9 with SMTP id l3-20020a170903244300b001d3cb387dd9mr2253252pls.63.1702967239008;
        Mon, 18 Dec 2023 22:27:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543174-27307-1-git-send-email-wangmy@fujitsu.com>
References: <1702543174-27307-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.12.1 ->
 1.13.0
Message-Id: <170296723839.1627685.16165222532952150154.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107576


On Thu, 14 Dec 2023 16:39:34 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://alembic.sqlalchemy.org/en/latest/changelog.html
> 
> 

Applied, thanks!

[1/1] python3-alembic: upgrade 1.12.1 -> 1.13.0
      commit: c66374a507eacb7c16573fc07021f0d47de4b4e0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


