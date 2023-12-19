Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC600C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:56 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.6843.1702967275222700074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KpPbiYxF;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-590bb31ccf5so2986771eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967274; x=1703572074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbYsN+W/ZscTtTfJ3a8wDNQdw+WJwZx19oXFTr8t/N4=;
        b=KpPbiYxFrCRKUeev1Y1eKMPUz9JyLFDmlViVzw17w5ull99ywbLiQmEYZv75FY4b3f
         SA5OxrHFDCMqHlZQ3W9MjFX2aV/wf39HCo1yLsuVzrrOsU21rQ89u91zkNpNzpSDK7+6
         V8/zIlKzgZWACHcSX1plTW5hICrC/+R5AZu0lVyu0lh+GI594vHhhLN5mz4Pi63t73mP
         9HIfkM24z5y2j2s3CAV3d7JxycWe+3ignJ4+Jn1IjG6sRJkK5RVeNb7lx0fCg9u8slGc
         D8JIQ8qTjU/MquffWqIBoQuarR8IXADpi3fBvb6sHET/K/bC73f7DzhKwhqw1TVJFJtj
         b5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967274; x=1703572074;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbYsN+W/ZscTtTfJ3a8wDNQdw+WJwZx19oXFTr8t/N4=;
        b=RFLpMlrLRvU0atdkkYTFAqbxeCqvrEi6FsYbkBkGOpsk2UHtPlxOIHj5nRHkcvqzqt
         uyzk1sjjqBwht4P6Nq6VFSc68q7EaHMh2FypuKAvuOq0kJ9WTytlfkMSyidCz3blosbT
         hKgJRBsTPR7Pgp5NN9blvIw+EYRhklFrOq85l2ytwL6wsjDU/J3hPDcQsqpw2O+QpRvR
         1iaBglNgesgsy9QPKbZmPdahUTCVehWbAsYa1YkARtTk1Yq+QQCUo7U9UnyuYWZH1Wut
         NMhfAWDI9nIR6fFQeAFpUEkM2AwCgKYY7QAR5ErUTQuhu7h9R8uVPt94i+sdguj8vrXl
         td5A==
X-Gm-Message-State: AOJu0YwQmd+qTiU/A1T5orSSNoiZzArlJkIg2pe3yHJLeB69Y7Ey/T0N
	fI3IUDjNgcneIor+VGL8HLA=
X-Google-Smtp-Source: AGHT+IHvJSC89/dci+Wbnugj3sBW/t9dZRoO+waOW0qNVX/s5OhUzX5IPydvjSK4pFzs8VQwOZ6KfA==
X-Received: by 2002:a05:6358:3419:b0:170:d73f:d25f with SMTP id h25-20020a056358341900b00170d73fd25fmr17177140rwd.37.1702967274300;
        Mon, 18 Dec 2023 22:27:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702619745-4200-1-git-send-email-wangmy@fujitsu.com>
References: <1702619745-4200-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] pkcs11-helper: upgrade 1.29.0 -> 1.30.0
Message-Id: <170296727353.1627685.17918582841232810809.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107616


On Fri, 15 Dec 2023 13:55:45 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> * core: add dynamic loader provider attribute
> * openssl: support DSA in libressl-3.5.0
> * openssl: fix openssl_ex_data_dup prototype
> 
> 
> [...]

Applied, thanks!

[1/1] pkcs11-helper: upgrade 1.29.0 -> 1.30.0
      commit: 7f858e4f54def093d9b8aed0dd98aa038449b69f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


