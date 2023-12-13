Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E8C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.30695.1702451240418071892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kf0n6WSm;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b6fa79b547so395006139f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451239; x=1703056039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKSO0t7DUFWnk/sH4QUjAY408IqZryb4H1DwOFT+qJI=;
        b=Kf0n6WSm7Bqyp8Ltw2UmkKgQwBdCZu8cXx8FqLeJc09xhe0bjS93FaQ3jur0KtVwK0
         0+bQAukHWLAP+zpKPF0CphVkqO7TdioHOaN8RLe7j/6cfjh2VlQZsv0Znuea7C36llKe
         NiEK7i7rwFRBrv8/yDvroBWDUxQrSUDkrl/XOYaboBxZC4gDLKF86TjyPdjCNLoLAgdI
         kM+zRrCRoTY9Q3KxuBQkT/g+itxYuT0GcweCr48TGv8syGwU31N6fkuH15Gi4Zvt1wjK
         x6RJZkgJCPKTJCEdZU4umBS/ZitsOyFS8CRZBGH1CS7yCaPtGO/lNAuyspgFqI5vTtao
         oaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451239; x=1703056039;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKSO0t7DUFWnk/sH4QUjAY408IqZryb4H1DwOFT+qJI=;
        b=i6c0U6rXgLmKhzqcRF2DA9YOL048NPn6RHsFye1LEigqGe5+Y9jv2lyvPktqEveci8
         9tNqoiiSe28OhwWVORrDr8VfzhsnPumQ7sPTM7hL6PVs9nqUE0Y0usfr8Tt1hNog5CW9
         4/+mUz8PvHDSO1zLiYoJes8hybshPNa+b+mEWnQ5Nj117O6lqnFvZLWRRwgMUXxQKzkH
         SkahPO2xmRwRVrFi/CIKWqDFoXLVnPY1u0UQsRCznLOKmD29bG3jU1dtiTF9w4ITg6zr
         XR8mOeMGQsIjIppakXN7W8snTNKdVVcg16ampajkD67W15LKv3SpsRm7vobbFSj1M+54
         XgQw==
X-Gm-Message-State: AOJu0YwXWrUFlSMSaK6V7DhPNb1wHyOJBdyk9SBIv19AKVZ2m0CZVfNT
	vnDl7YCzc25sRMwXRAiRwtgOeICAbAE=
X-Google-Smtp-Source: AGHT+IHtbDufCtT3l/nZSIaefh9a2aLSrtRNZdn5NDRA3gI/FAF/4W8sB+ZqF34wwgrJ2we1zg2gFg==
X-Received: by 2002:a05:6e02:174b:b0:35d:6211:80cd with SMTP id y11-20020a056e02174b00b0035d621180cdmr13088715ill.14.1702451239462;
        Tue, 12 Dec 2023 23:07:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206131738.305706-1-alperyasinak1@gmail.com>
References: <20231206131738.305706-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] xsetroot: upgrade 1.1.2 -> 1.1.3
Message-Id: <170245123868.133993.18215484992132660077.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107356


On Wed, 06 Dec 2023 16:17:38 +0300, alperak wrote:
> Changelog:
> 
> * gitlab CI: stop requiring Signed-off-by in commits
> * Handle -Wsign-compare warnings
> * Variable scope reductions as recommended by cppcheck
> * Build xz tarballs instead of bzip2
> * CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> 
> [...]

Applied, thanks!

[1/1] xsetroot: upgrade 1.1.2 -> 1.1.3
      commit: 1a84a1ebbe197552077b4610c6fdcd459532113e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


