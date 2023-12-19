Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B84C47074
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.6839.1702967268538386180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JB9Z2MSB;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d045097b4cso15986865ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967268; x=1703572068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wvdp7vfsSZw9jNo6jMxRHN10LBzdTw6nE6I4qjWCs6M=;
        b=JB9Z2MSB2ckwcILyhYlx0C3XWEeZwmTcCcTcCb6OzxG5MBsAtZIUos8nIL9R+es+B8
         MlJ9TwB2sKm8F2j7uoYpDYtZt5l2re4qrxrRS3N4O8BUA8mETI4yOl164QheCi0CfyZH
         2Ki2sTfFkC1B2V0m9/SprTrbmPdJvl6MleANjkH3ZxszUyhifacZajRWvJSoyRaaDmct
         ivPiFgRUNuZS+6+5q9fj8efVuHlAUU3w7RSFmh9jf+q/sP6rn7XHhhGGPW1nzl8KXlIV
         8Z7PQbabmFNAIbmnVZN9hNibSsr0qIIIMAdS+jyXIEGHflEwYHZnCfIZPGkrQ9LLNgYP
         auRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967268; x=1703572068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wvdp7vfsSZw9jNo6jMxRHN10LBzdTw6nE6I4qjWCs6M=;
        b=pYaxVW4DM57EnNDfqeCn0D07r+K/qWDxTXx6BkAdYkbmQkzBZa8xZyFhzpbnjvDRnx
         7b27/oqa9EDLZc1ypIZ1A/uWiuwa3qg8B5/cR3Id7VbWXcxvyWRMJOdZMBkK+YDLHFSG
         fJXVVEb4+mOrgp5yngRqyDxLsq4QtwT/kVIIvXm5Lj73ew0XiD/ioysR3/cw77WEjF1h
         cz8tf1u0XgeMpN3R8cBC3B1QtdZ5OJRigOTlEkNyFoQDZTyfDIKztbIQlwdHnqfuTLN6
         16z7F8QEqB3CxLNYcCb19MVItnJJDgAR/HUFQH8Bqwkti1taqN9jVnaWpPykRZrrTE21
         i+cA==
X-Gm-Message-State: AOJu0YxFPtmg2SLFD2WJl0gDk9hojI2PdTvso1WA2eFoyi2RvJh/tB+D
	6+iVjb4YpjeDpukVVfrID8U0+nmb3vk=
X-Google-Smtp-Source: AGHT+IG64bvfYzGdoSBNpz1Lvzvvw6nafqFLt/osBkCxeDIB90BEpiYS8H74GEBlyjq3avZPUWciwA==
X-Received: by 2002:a17:902:e84c:b0:1d3:6395:d301 with SMTP id t12-20020a170902e84c00b001d36395d301mr5618043plg.91.1702967268007;
        Mon, 18 Dec 2023 22:27:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702611953-3164-1-git-send-email-wangmy@fujitsu.com>
References: <1702611953-3164-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231126.0 ->
 6.0.20231210.0
Message-Id: <170296726737.1627685.11636326889259616334.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107608


On Fri, 15 Dec 2023 11:45:53 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231126.0 -> 6.0.20231210.0
      commit: afb65e9e1823194387f9dc64916072ce0a795cc8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


