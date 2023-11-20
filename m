Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A759C5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.43632.1700452259903808658
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7nao6/w;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4101361b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452259; x=1701057059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bggf3CHFe+ztKG9WDTgd9RDwoCX1Hw0IgXlr+Uv0Rcg=;
        b=c7nao6/wqnvdG3eSqsWqsyR09PRJGVHOS8yb7QMHPeMSIpNYBTzY76GueKFTBCvJPj
         Bjbkaosmf8xpOpTKY+1RcpYtIyNU9MeTDZkE43nNB2FPiYmxppQfIB/p/ZYxMevSBhx5
         CpjFWycbzTdjCUvYFROMi1R1n5aA8M9jUt7bFIj6LswUzwf6EqVwOA8KW6nSkevtV8qU
         7Ud27tC0HU9slPJgQxYrFt0hr60tTrRW+3FhHJoUHuovotWTQ0EuwN2f8oMPUAx3N7x7
         6QZcLwlxCqH5oa7UIgzpz1uXt7DFg9Md+3tqQCHLIkhF5KdUhIKHoXXqdsNgnRBrOGak
         T3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452259; x=1701057059;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bggf3CHFe+ztKG9WDTgd9RDwoCX1Hw0IgXlr+Uv0Rcg=;
        b=RhSNIqqjVbgp6gKUIyebMr3UDF1ljLfyZ3nhr17plk+dSMRMjUsRenlKmsHlk12S4k
         D6/fGtCN9H3wLGRiwoFDl1HdpzVevFs5eRjkpmlvftHV3upwj28EE5HNFuAocVrqM7cW
         KGdgkSpTsHjE1qIT5/h74BsskVRagM2T6l3bEAtu2FNN4iMRgJeYbGl0mcO8FwSAfRB5
         ml45isMCnm01tC6NpIfO52Xr9p57gKUfBf1XF5B3r+Ht+QoEBl2XChzhKH412ujRZwrQ
         NebhbLpEI9FuLtyF+sDvLTVCU1zBJr0ZPdQOZV4cWJWBBq9M1reuUSE/wVQWgTCvESBX
         Re+A==
X-Gm-Message-State: AOJu0YxfoIXvkmFPoPb2ohb/9Tmo2pU/76T8ZSVN38vMXSbM4KPkVIuK
	Z+YFrtLheRxEooBERcAF4tK0rYz4vLg2Tw==
X-Google-Smtp-Source: AGHT+IEbGQYODm4DcmcmdA5Zk9zhDs49WRcHETaDH71n6dAz2Rs9kLK2CNT1VGAaSxI8nJ2VzZnIUA==
X-Received: by 2002:a05:6a00:e88:b0:690:ce36:8b00 with SMTP id bo8-20020a056a000e8800b00690ce368b00mr6967793pfb.2.1700452259002;
        Sun, 19 Nov 2023 19:50:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123194-22292-1-git-send-email-wangmy@fujitsu.com>
References: <1700123194-22292-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-prompt-toolkit: upgrade
 3.0.39 -> 3.0.41
Message-Id: <170045225797.1416826.15863468458927647927.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106916


On Thu, 16 Nov 2023 16:26:34 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> - Fix regression regarding IPython input hook (%gui) integration.
> - Improved Python 3.12 support (fixes event loop 'DeprecationWarning').
> - Vi key bindings: 'control-t' and 'control-d' for indent/unindent in insert
>   mode.
> - Insert partial suggestion when 'control+right' is pressed, similar to Fish.
> - Use sphinx-nefertiti theme for the docs.
> 
> [...]

Applied, thanks!

[1/1] python3-prompt-toolkit: upgrade 3.0.39 -> 3.0.41
      commit: 9714181569059d1450a592b6958a910eb75a911b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


