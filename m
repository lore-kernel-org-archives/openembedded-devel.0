Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87DEC47DA6
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.198990.1703983120999340947
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWRNH3op;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bae735875bso299765739f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983120; x=1704587920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq+AGRef5oWP2L9xKUdR8v6jZzbOqi8IjSDUaeoJfEA=;
        b=nWRNH3opVx3a7ZJ6WB0bPG7msIVUkcXLZAyLECgz7zmilAxwjsxigM27cv3rcUXWjH
         YMGVMZXUrafJgJiG2ygLLjC73zRe+Qde1YVle1pyLsm3OE4hDF3q/n+EEvpJrJCLH7wr
         r2Ol4Z2Vm6zxVgwD/jXM/dvm9qab6bx1Kq5aHKvjghNVA4ZxxcmrdmN+pVwcYNQs0Q7c
         bcZfdRfIW4Xg0/SbR7IvcYtDpUnut82y7TzkwZPFLf6G7uurqKqQC1v80b+UbjII0z/O
         xjzP1yjuZF/Y3NDHH5jFVr1OiduFXG4eAHTzb7RmA+MtVC/pZ5VjOI1XuMyqA2VO/1pR
         xmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983120; x=1704587920;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq+AGRef5oWP2L9xKUdR8v6jZzbOqi8IjSDUaeoJfEA=;
        b=MVrJF5H60Q3rNQ49bYyp8v9bxMyrYpZuc297PpjJCBceHo6FloKkEhwjMqP3rjtoNT
         DNstA+KO3WAW3RrUP4Ak0jXPRoaXDaFM1mOfjPlz1373n8UzrVWwAqYdn3OcDGPRvN8A
         0u/J6PSHPFOSUfhnVwNVtqvMvUUfvNNkEb+XRBEn048zcvAp7aPTF8wF/9ONzrbICATB
         vrGtv4PAHzxXUQIO/wQfqquhtRp00iuKW9HgWAQXdrF8rN+zTO/QlfUQoEQT6uh3pi0W
         2Sg43Dd9LNDMBTeB5Ml1Rz+Nu6Sy5erLjF9FrZJ/CAdMGdOPUcyAckAO8alZQiuz+Kak
         qhrQ==
X-Gm-Message-State: AOJu0Yyja2TIC/EY14c0b8Gn+Il9GBNoPN7w2jYCKACrIrzSQjqvMlZv
	Jx5WyWgdls6xAAI4tSWvAKETF106NiY=
X-Google-Smtp-Source: AGHT+IFPFFLpQXiZ8I0Acnev1c6KdE2+dTFYuNUwMd3zLo30FUZZaXkXWtlybXP6NIVVtBXY/xiOrg==
X-Received: by 2002:a05:6e02:1647:b0:360:711:7894 with SMTP id v7-20020a056e02164700b0036007117894mr15756514ilu.74.1703983120134;
        Sat, 30 Dec 2023 16:38:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703577131-13597-1-git-send-email-wangmy@fujitsu.com>
References: <1703577131-13597-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] opencl-icd-loader: upgrade 2023.04.17
 -> 2023.12.14
Message-Id: <170398311938.873206.6866402953673742095.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107936


On Tue, 26 Dec 2023 15:52:11 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> Synchronize with OpenCL v3.0.15 specification release.
> 
> 

Applied, thanks!

[1/1] opencl-icd-loader: upgrade 2023.04.17 -> 2023.12.14
      commit: 0fdda9232f61755318da961104a7077f7bff49dd

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


