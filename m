Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCFC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.31419.1704682004725183607
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSxJgaSx;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d4a980fdedso12382615ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682004; x=1705286804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLYPo1/1Q9fDftBZn0aYF6uhMbkqNagdQfwKx6a8rFk=;
        b=KSxJgaSxNxRg3C0HqmUzBFXpsrNCCQbE2GlPl/vgRw87Q/Dtgk2TJGpfAep55d1oNy
         QpeWxMyFtnGosr4nXtIgv5fquGnRINHgsh45kM4EbcFQGRQ4BuiYkbk+J4vmiVKlJSHP
         OuVB23CB0LtDF3WrWCBy1Usn2ZESZtbJGMC7YMRXK0j8ebAUaCSLoMjhGLqTF1kmkUT6
         AAORahoJL+arh9kK+8xy1NTb9IMD9b/UsNR2ccx764703fdHaC1nuZFVEHeMwfPgqZKb
         eJO/nfoD6XaJQnkvFKqfXzMa7mV6zvDrNRWPVBMbNhFYeoPrwAMNgmrVPpOrivzfESoL
         L2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682004; x=1705286804;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLYPo1/1Q9fDftBZn0aYF6uhMbkqNagdQfwKx6a8rFk=;
        b=K2VlFv1L/mvMTdivRaWCI939HshQG3ta3sdv9ag3wUN/yFLeMme7jhGvz8+dSf4q4a
         VJgVORZlqDTQQRVq9SjLhGu7Uhl3eTphb4/+kjMUehPIIDTA2/Zby9ab0+G2qpXijUX5
         La/LgIbeJdQ66ygS70tP6CDsFkhRij8D4ShiMLSMKzF9Bblvyit0ZQqwsbK7qT3DROzR
         arcEvc51B6VcpnZYSjpMinGyJpaKI6b7cFtXnhJu+2rrsFJMtDhlLAlaEoj2NTfZItk/
         WG+OEb78Z52VqRvmBH65A/gv6RxGCbs04vPOCctpCXIoKYuW2HtJm0QKCP+Xmdespe+L
         wdwA==
X-Gm-Message-State: AOJu0YyXGT7rCQ7VLuTSLjJOZuF77gGw63RfoBJpw1VjlBd4fQCWBPDx
	QivwDzJL+8nNJdpLTlTRhx8=
X-Google-Smtp-Source: AGHT+IHUsMWxbMGuQqGPUBWQjNPfzGyhZIes6MWUMasgXQIbChTRrjeTH48pxPxiWJcO90oDGWpNcQ==
X-Received: by 2002:a17:902:cec6:b0:1d5:2353:a9ae with SMTP id d6-20020a170902cec600b001d52353a9aemr2106270plg.13.1704682003914;
        Sun, 07 Jan 2024 18:46:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20240101093225.2889204-1-yi.zhao@windriver.com>
References: <20240101093225.2889204-1-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH V2] vsomeip: upgrade 3.3.8 -> 3.4.10
Message-Id: <170468200304.912276.9839773657627238477.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108085


On Mon, 01 Jan 2024 17:32:25 +0800, Yi Zhao wrote:
> ChangeLog:
> https://github.com/COVESA/vsomeip/releases/tag/3.4.10
> 
> * Refresh patches
> * Fix build for lld
> 
> 
> [...]

Applied, thanks!

[1/1] vsomeip: upgrade 3.3.8 -> 3.4.10
      commit: e1c4be9bd47cb77c70b8ffe8f3b2abdb1e911318

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


