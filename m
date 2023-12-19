Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B34C47073
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6819.1702967241381643224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmc1SQRi;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3536cd414so33066275ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967241; x=1703572041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eKt+SFwu9eq8SJZNPj1aO74TpS2jElp/Ey/VWCTRlw=;
        b=dmc1SQRiqWtyzowV7diduWdB92GjNZt9e3RK9FwXMBctr+vFd13LBKkijFD4Ew6qY8
         FTrTHuxDk41KYjIYklkSYm7y/GYK8kNqzVTqCs4pHVvo+W2hoyzRF1mj8BTQgOutwk8O
         huw8nFSOPW5Uxb9UNo567f3/pTzZeG/j7IEfRaECrb20godXrVp+yOu5LVlV76qC4ftT
         KJepCTL9LW7XxM4IYxlXYvxa5h/CQiGiHTaJALi+fuE+TpZqYMuOKYjaQKHKmb/c8/VW
         aSRhi6q6UGfTD2Qn48CXwtmpjbfAyk0ntK9bmOwxLu3ulOJCMJql8dFDTUjuwweHAxiT
         X7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967241; x=1703572041;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eKt+SFwu9eq8SJZNPj1aO74TpS2jElp/Ey/VWCTRlw=;
        b=kQqY5fzYDW2bdmIn59ekFhQ/ts1i74YsB/nxW4VrXYMl58cXe+trDNBbUilm1RqFO3
         gOsm3RWvFWOjyYWYqadD2xH0jdNmL9A6SfIV0a78NHo9Qv8F9pEWuXU75y8iuThu42Kh
         +egAUZNBXI6dqZVZSmoGmc1WwQE80EwPdOi9UniwBrYoiKlwtjaoBNn7dvc6cY00NeIu
         x5MB86uvo94CX6BgqCqBaHBgqD3myqfq0ww9MjCpibfsIQvrDvSVP20lkSa9cJsuhLy5
         CWN4mlaPh99Cqyz0l15RqVRxa6aNfzhDXsCMwdRIAK6WKJ7HKQwLTH8ZimzO5xoHWsB3
         mQNw==
X-Gm-Message-State: AOJu0YwyFqMMKv8kd50o/WCWfLndve2BugX9WelGA7OLB6Lxj4JPQ3xj
	47B1ndtDpXkiX4i2UuvvSbAHwur2ge0=
X-Google-Smtp-Source: AGHT+IH6FcvWug0GEqSWgG1GmytKD4DF0hq2HvGkdXdAPTxFLzSm1XVpJE/eudx+MG2G2nvZgo5kCQ==
X-Received: by 2002:a17:902:b708:b0:1d0:cae6:eea1 with SMTP id d8-20020a170902b70800b001d0cae6eea1mr16792029pls.83.1702967240792;
        Mon, 18 Dec 2023 22:27:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543543-27472-1-git-send-email-wangmy@fujitsu.com>
References: <1702543543-27472-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.1.6
 -> 3.2.1
Message-Id: <170296723999.1627685.1183229399119078842.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107578


On Thu, 14 Dec 2023 16:45:43 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Allow explicit zsh global completion activation
> -Fix and test global completion in zsh
> -Add -yes option to activate-global-python-argcomplete
> -Test suite improvements
> 
> [...]

Applied, thanks!

[1/1] python3-argcomplete: upgrade 3.1.6 -> 3.2.1
      commit: 02e3123e68934c88bf7c4a5dced5676a1f5f1c25

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


