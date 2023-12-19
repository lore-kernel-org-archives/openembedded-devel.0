Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F71C4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6841.1702967273168517296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jW1lUIXD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3ac87553bso9274365ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967272; x=1703572072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/uBHm6gZ9RWizC6QO+fEN524a8v7zG4L4tAjqvxhog=;
        b=jW1lUIXDryGzvBOrqbp2njo5gBROfY6UeFyY89RXTFJNfKKXIBIxU+pVfXI5atPeYz
         YYaZbyj0l0NI3GOQddN4e1Qcs0rpuuR+AqfOeSULACX4x+2m6ZbH666pjHn0S6ZBi4Ll
         35VQcRJBvxugLwJn/YB6WWg9Dg8LIMfAa2NLsmmaptTyIA5+RdubKpj4jskFdUAKa/7Y
         UYcWIGMgI/l4vHak8hV1Xt3vJxCHyZR0vp8tSp5T/zwNUpL42UfDBDniDM9bkYCaUV2s
         cFKNJEaG05hhLyQSR4xNwYnXPY4KyVYhPK75z19Jys58++4Kw0Wl5zhuGtsgLqgNo/eU
         U9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967272; x=1703572072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/uBHm6gZ9RWizC6QO+fEN524a8v7zG4L4tAjqvxhog=;
        b=FcRfvF1Zh1fMbjjuxuv4KC1K1vSxoNO6MrIjaAgqrBNCdY3bkDwz77sDBwOMPW1+SC
         QgJ1qeDUgvfi+jtGxZqmU1ZsktRRdfUGKsgZQZc+lc/wFle+Z0tSagpJr/EocQBPwK1k
         oTs80yTS8PJyLIRQhMIYdC6kKoskw/sjDMr2DCTSO8tSIe+JFrPW1R2ie3nXbkcX3o+l
         fOtJyj1EDYkjtgOieYfwb2iOrmX9PJCUekkdHQobvWK5PsCP8TOsi4z4FZFWurs6dLCM
         ++aVkmTKVYr8g9nI0Za4W11GUnfRKdF+esEXuR9a04L8y+ZjVYzU1/vkhrxUz+AUAHXh
         ZxjQ==
X-Gm-Message-State: AOJu0YzmyKsa6FtP6QC3xRY7nIloklYfiHGev/0MFiIt1vTvUQTO7uIx
	qbTHAqrqFQPj0G43vSK1lMHJeGXMHUw=
X-Google-Smtp-Source: AGHT+IEvOhR+7aJl1zDcqIn8XVMsq3/vzdBIvm++0HPbrqDlZQIMg9sYkNdma4z/lN6MelgbWtUTlw==
X-Received: by 2002:a17:902:f682:b0:1d3:ba65:c575 with SMTP id l2-20020a170902f68200b001d3ba65c575mr1413397plg.104.1702967272611;
        Mon, 18 Dec 2023 22:27:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702612640-3452-1-git-send-email-wangmy@fujitsu.com>
References: <1702612640-3452-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libei: upgrade 1.1.0 -> 1.2.0
Message-Id: <170296727201.1627685.7403400244455333718.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107614


On Fri, 15 Dec 2023 11:57:20 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] libei: upgrade 1.1.0 -> 1.2.0
      commit: 5fccac2c22d4458b8df71baae8b4605a7ef71dc4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


