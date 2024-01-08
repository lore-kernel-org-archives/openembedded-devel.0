Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AACC4725D
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.31425.1704682013012626022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcO+oaYd;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28cec7ae594so1237195a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682012; x=1705286812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI2RED8bazEBSd7WAcagfQB0WyU6BM+PCUv7e35Kotk=;
        b=kcO+oaYdvlRpTtpnBWH6m2mxArcG0wIsSWBPP0A9NSNy+F181IQjM9EeaLM0bGiq2R
         tY/xeEbukIzB5rE6IJPScUCw+Qoq6mTKFdJNwiqGbdE65lAvuXuDugNxpmamu0bFAA0Z
         tnAA5oIhNwjaS5NGDDg4wL1uXAmRoZpiKZdAupIKCefGUxZ6NwJGrd1bfXjTmww8S71c
         U9t6E89gJAflVVbxJsC57QlBLpgjGValtHkl8MiwRByYYSI/HV9lUDNbGWuOe3aAZ1rI
         ogmFrGTNgMowT/X44HA2ddMbNJenWZa6MPF5QRU5+Q5KYjaqXW745v/p4TqkJesPILVK
         K4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682012; x=1705286812;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PI2RED8bazEBSd7WAcagfQB0WyU6BM+PCUv7e35Kotk=;
        b=h8VA6ZYDB+TwrAiyOn5PRhrUBVNE2NORbwNDrVosDmThDoAgZ+v1mHQso7k1kQ0y3i
         Os86bLZTwUohJCTuNgeJv65E+GSVLE6sgX4ItaZ2W5MaWsfo+NmBbw/FgEpubsen+AH8
         J3CaSHsZU/81ozuRE5jQtoUbJgderYUOSJDoMzgAnPtTOUBKv/lg4oZNFXAJ9QG7eWX8
         kCRGsyZJNrkcpaQ5OPnCcSyqFXHFJ1EFPTrCoLDs0XoiIRMzYo3iD7axu0OKhBmYzJqP
         z4w+w8yxkUFC7fedcDttCosPS8VffwP0cddxUDrmQVcLJ9ZvhBaoT4GPFmFjEVBkzEaf
         AizQ==
X-Gm-Message-State: AOJu0YyvvFLaLR0ifkGerTf60SKoumF/Eklj48SLR4NnPnUVii7YYW/f
	JogO1cTMVDYPsoUNUmrBIMTUHAmL5qo=
X-Google-Smtp-Source: AGHT+IEeQRPnSYyyIfOBAH1NbHQ/IVLYDnF0vv+WynpXpt6FXskncRxIeoEP6OuMfwipE3BjiqoWRw==
X-Received: by 2002:a17:902:ee55:b0:1d4:ca3d:742e with SMTP id 21-20020a170902ee5500b001d4ca3d742emr3484675plo.67.1704682012451;
        Sun, 07 Jan 2024 18:46:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179062-7936-1-git-send-email-wangmy@fujitsu.com>
References: <1704179062-7936-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.10 ->
 1.3.11
Message-Id: <170468201183.912276.5974063695217544743.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108095


On Tue, 02 Jan 2024 15:04:22 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Fix redlock to make multiple threads be able to lock on the same RedMutex
> -Asynchronously update slot-node mapping in some edge cases
> -Use weak_ptr to avoid joining EvenLoop thread in itself
> -Support setting connection name
> -Support shard pub/sub
> 
> [...]

Applied, thanks!

[1/1] redis-plus-plus: upgrade 1.3.10 -> 1.3.11
      commit: e53bbbed774f0176c28ae3a72665953e5270e217

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


