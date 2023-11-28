Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D8EC46CA7
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.14508.1701215713962289563
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ds4BZVzo;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cfc9c4acb6so24411315ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215713; x=1701820513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjKx8EZ/IgDYNxRDaUm/oWKH0axN90ODilUC6fi7CmA=;
        b=Ds4BZVzovE0D7vk8Wcuf7ZKg/pVO0YYk8muxDGiT4TEjAKPVwB7EOH9XgLGtARtNYM
         sOW7Y8c3i7ARsFgp+9qSEoO8QH2H7ZQS2uR/kHbKmTIovCm0D96wZ6dY1mOH8dkghP5B
         dajOKOR8AgLIA3MUkTTxg22Y8NwPe81XtOU4nRYbpSmoHLdG7pSkKasqwGOhZBdLTe7O
         Zl4H6/7cLJQ0PVOPWu+uaJmQwvRk84NMZVuHCqOxYtms7iw9eyK8ZkOp3DsRfAcNKTB6
         LvtY1TyJ8qKcxKMiJv1FlKbyjrzOGR76WOqAqx2z9pGkLG+vHOslJPmAexNw89capozA
         F4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215713; x=1701820513;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjKx8EZ/IgDYNxRDaUm/oWKH0axN90ODilUC6fi7CmA=;
        b=CfSazzWmf9RtkkAQWoU+V1dP0RzF01B2IWKWZ6LwQ9fiQ0H548Cic0XdEHos+wjCUb
         vk/zPGYZ/S5daNNZaXSp/N9Z/eQWtPpgk2STct/WSLSAkOzus7Bhlzwba/eHKIexSxYW
         PGFi0tZPVHA4K0ZKmYM4TsEh+mD2oF1yK4V2S16GX0V7LiNOSJc+LNRIFzRDbH84gOhy
         jriK/nfs2QhPsLcOCpl5u7zGGjPxVPIpDQIVAkHMz4YGiH9DQOd1Pende1YQ0NWVqSOT
         qbLoj9Q2/3GQvTcYLIkOoVtDcBq4UjNbkmA1dJnb4XujTcnH1e7PKaSjYONlzwwr9Ef0
         VBOQ==
X-Gm-Message-State: AOJu0YxKKzO8Uap1qTNfwo7bc//r2hJuyA6JGgnJt+iMcXE+drl3SktD
	PrhhoF6rx/5IG4bpK2UbqQScmTf4hCljwQ==
X-Google-Smtp-Source: AGHT+IGLrfHC2UFU3N8pJ1rLdWsiIdxlw05ULYjXOvry9UcKqu07ZmUy2MbDK4CJK15iGJCc/7DhYw==
X-Received: by 2002:a17:903:41d2:b0:1cf:b451:9552 with SMTP id u18-20020a17090341d200b001cfb4519552mr12444835ple.45.1701215713048;
        Tue, 28 Nov 2023 15:55:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159437-27750-1-git-send-email-wangmy@fujitsu.com>
References: <1701159437-27750-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] gensio: upgrade 2.7.7 -> 2.8.0
Message-Id: <170121571169.1187527.10643656643099440873.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107103


On Tue, 28 Nov 2023 16:17:17 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Release and windows installer.
> 
> 

Applied, thanks!

[1/1] gensio: upgrade 2.7.7 -> 2.8.0
      commit: b57a328c3636815562e296f93821bc245dd5906d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


