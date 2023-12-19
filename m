Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E751C47072
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.6826.1702967256077827437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rho0AlL+;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so1440714a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967255; x=1703572055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKoqqcnuxahJsKBRy70r1dG7qZ8ckbih0Todpi1RMLc=;
        b=Rho0AlL+DOmq/wkIGBfp6P2hd9dbDYot5wUMWnDV2wIbRZ6Uy8zPNs7nRGocT50KC+
         KSwL4yipb6+DZZLUcTK02v/Sadp2XX8gTyNE3nIfTybRle1Vb6UjMmoRNef+3Tj4ICpl
         bkbFqHtU24ugzJOucJiI5X85U6KmnfvI873rFksyG5V3gbZUfqZUC6IQK0Mac8ylIAyL
         AwF1JW5xgq10PUFjWjtBWO0R8H7dCI5ouOn5WZbuxl33SEIGXvztfna9A0BpFUIHvGNd
         bCx9si7O77DNf9cUawPdcCGLHAFHHX7f4mg//Fqd3J8oO8h4Ea0SKPCJFwY0JdAl7tms
         2j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967255; x=1703572055;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKoqqcnuxahJsKBRy70r1dG7qZ8ckbih0Todpi1RMLc=;
        b=rFi1HyD/SlX1LfmG3EJ+feoQYBH2+q5fq0b36bqgTpaoF8nYNpmHAhuxu0T7OtMW8w
         MoE5yN1hPwWjIVhnKByY87Vkfwj47iANP+xoCtWuSDeXYva3yz38kRqyc820aoiUXAC0
         oFswxDSkqq79CYXboHF6/R6ZM01thYhuRuF1R1AshVdO8H82+yCqycByJUW2McsuFY5I
         z7afjGkRSzFFamw/ffeS/C7A3MHhA8nLt7mQl2Ga5tszy4xxwjYmc/kfST7xG9Fq4bsE
         j+AsQ2/0acMyLYr1NKblMvx4AyXfQgraehkH0D3yP6Qt6U0XJ5f7SGwjpwi7GGKnGs3h
         oCdA==
X-Gm-Message-State: AOJu0YwOwFLRFpFvT59sPAXCNqTp5WeiPdXpXPiWr3KnYgTxDh30mLEJ
	C9XbjsEBXjwzZGY595E9T5k=
X-Google-Smtp-Source: AGHT+IE3ITlYI/PRibMwkXD4PYIQ1XRSJVXaBy/vnU1TAlAtE893DpyYba1Gvbk2qmPZcfXU2YT5tA==
X-Received: by 2002:a17:902:aa8d:b0:1d0:6ffd:adf9 with SMTP id d13-20020a170902aa8d00b001d06ffdadf9mr7826845plr.96.1702967255491;
        Mon, 18 Dec 2023 22:27:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214220408.2366088-1-derek@asterius.io>
References: <20231214220408.2366088-1-derek@asterius.io>
Subject: Re: [meta-webserver][PATCHv3] nginx: update versions for both the
 stable branch and mainline
Message-Id: <170296725488.1627685.511105724290184256.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107595


On Thu, 14 Dec 2023 22:04:08 +0000, Derek Straka wrote:
> Stable: None -> 1.24.0
> Legacy Mainline 1.21.1 -> Removed
> 
> 

Applied, thanks!

[1/1] nginx: update versions for both the stable branch and mainline
      commit: 8dc77ebf92fe81233aeb60e1eae8ee1402b6eb9b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


