Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A60C47DA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.31439.1704682020838745514
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QedfIlwq;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbb4806f67so1582274b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682020; x=1705286820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1hqn0luhkX4h2F/p+UlzQjAJljL0LtwEBJ18JkY1DM=;
        b=QedfIlwqXHjfc483VpuW5kfiieN03+3ETI4ILTxWa+7lu9x2l00uHZCkn6hv21drQc
         PdQ0bXhhyrUQ8qs3byc8jJYhd8uC5UKgUiuk8RUr0Xic1yY2TRVjehseguXf/GsQRMOU
         BpH6zomctQDevwcDPVKshHuDU30zlDpLNSsj+5f4s1KwjOFKyggNBp3L80SDV5nlHju9
         MSILEl9REq/kXY21ogGWrSkT7AfkR9xRCrO/4lS7EZAOub5jvyrgHJazE0w3NntxRg5A
         YDQaWQTm83s7aN+GWEYZ5gOqbizuh9QjAbiKS3CVuEdNF65DGgX3zJoni646Fdseiemr
         dU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682020; x=1705286820;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1hqn0luhkX4h2F/p+UlzQjAJljL0LtwEBJ18JkY1DM=;
        b=O2GFfuCkthZKvt+y7f28P6bGTqmcgyeBWZPwtwGT+NTcndOIZow4UgOwH+N1l69aYO
         vwQl0+MFmEPOjjvJJyBdR2qLAv1GGsKaX7YS1sdOFyjnVodDsdWycc7qmT6F7ZfN+p+E
         Jrz7kckDQckcTqELBZOEBsiM9enEINeKMbnnSVrRDQKkGNXr4eQD57TIa59rX9WSvZrJ
         jg5YgHPQxonHub2jTCnvYjtaevjw/fXxSgkR8E6wVVnS+Puc5L+e8Gy1YBPfJLSLZbLu
         eNhb+0bOSceB6kexD6qye94wEDRx10+0cQtguNU1+8Y9lvTD6GTyVqMfpFVzljrmn04b
         O0qg==
X-Gm-Message-State: AOJu0Yzu0vpsJ/f6rTXlPT5693WJEEe/ZTF/7UR+lbXUJbvD2CHtC7RO
	yBbyh4jWamQtsDRzpups9bE=
X-Google-Smtp-Source: AGHT+IEFoP2m7bqv5z5PcWGg3WgP+Q2VHDIFuPuMWaTlQ8zGq1Zx58dOIchwsCLbzz/ghk8482smXw==
X-Received: by 2002:a05:6808:2202:b0:3b8:b063:9b56 with SMTP id bd2-20020a056808220200b003b8b0639b56mr4198412oib.72.1704682020090;
        Sun, 07 Jan 2024 18:47:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179593-8308-1-git-send-email-wangmy@fujitsu.com>
References: <1704179593-8308-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 3.4.3.1 ->
 3.4.4
Message-Id: <170468201943.912276.13636344491683417543.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108104


On Tue, 02 Jan 2024 15:13:13 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] thingsboard-gateway: upgrade 3.4.3.1 -> 3.4.4
      commit: e38540eaeb9eedb9d3fc3e0677f8c51c4b465b38

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


