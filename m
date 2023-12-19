Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F01C46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.6770.1702967263534999944
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGSeLvnW;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cd82917ecfso2094318a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967263; x=1703572063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y31oNpmnZrTopblPleRXDXQ8cBvHOY9r5KM/rZ5V/t4=;
        b=FGSeLvnWcJ6spR+zsR/c5L7hY82xfgT9/HqiQtRxZ2Bmnoqyrri+1Xc/g8RZ3Po1Ek
         amKL/Qyn6ceL1YTwMsWYD/f68ZBBeWdCQ950Ib+FtVE7ZGJZmIYWGj/yKDvidW6uR+qV
         1Yp/jhX6SOWoCdzCgSRx1E7eiEZDJNqfFTZ9SMVztQf0V31KHe8QurZhp9IFMQS0p5ZA
         OhnXqpBekvh7Qq1hHpEV8awDyiog9wFcTQIwadTjW1nan2w3lA8bGkdOmKcWL2Q3R8R+
         D2SIEd30YtoiiMycQ6Q3TvA0opRyaN9OiKA6j/K96o5gcJMp5SnOGqawT8IE6vC2S0Y9
         B83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967263; x=1703572063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y31oNpmnZrTopblPleRXDXQ8cBvHOY9r5KM/rZ5V/t4=;
        b=DvDnlkmzW2d0vwjhtfxFXcjkisN0JWbE26oBwcshf77P0Yabsb5l62JfkRVFx6zaML
         C7wiAi8cv4fi4L6cA5PkD2nqTSPbZjVvpMSPYVlaNsZC9lsWazqe7+61bicqqGWAzbyQ
         kut3wcdgL3otNxdvsTj7gSbkmNIOimfZ2tyWMNBesmTmPoiheKgzxw7gC8Mz+S1ve/Ow
         bUXJKF2u2Dh9ZLMDuzi5Px1doh6mKPRvHX7JomyhWv+joov1nMHM/g/vk2ucdVMyhZOC
         Isp0yzngK8bIJaSujPQPoGOk0z6Z58bUodnb624BAwp+m+69zRQSojMDDJ0kAI9yWPNP
         X0Cg==
X-Gm-Message-State: AOJu0YyUN/h88hgoX4e9EAUeReW9TQNxINY/vOUYE+28kBacNtsltUJW
	JFTiTEQu50dtQzjOGwuYR/k=
X-Google-Smtp-Source: AGHT+IHzsUqD6oPoYyW7eXDLcBAcroEPIZzYnbn6Dcu08zIYJHrJ9tn3b+sw5tl4HgCMQOlzmv4Yqg==
X-Received: by 2002:a17:902:e54b:b0:1d0:796c:b06d with SMTP id n11-20020a170902e54b00b001d0796cb06dmr22022262plf.7.1702967262929;
        Mon, 18 Dec 2023 22:27:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599645-1707-1-git-send-email-wangmy@fujitsu.com>
References: <1702599645-1707-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.13.0
 -> 5.14.0
Message-Id: <170296726235.1627685.8583505888774805137.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107602


On Fri, 15 Dec 2023 08:20:45 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Add option to load traitlets values from environment.
> -Update types for mypy 1.7
> -chore: update pre-commit hooks
> -Clean up lint handling
> 
> [...]

Applied, thanks!

[1/1] python3-traitlets: upgrade 5.13.0 -> 5.14.0
      commit: 1e42b157bd68d282d4cfe2a9f0281610219da920

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


