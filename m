Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3D7C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6821.1702967243287103437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=baFx6Ffq;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3b81d9719so10740755ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967243; x=1703572043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1uCtDz7HcLZw8bBv3xkVd56ZLigDE/dxAQBsx3lNjU=;
        b=baFx6FfqsdjIbWO+uvpJyW3ZJS9wZiItEtnrZ9n1y4eJfpO9jVHIShSBe/C/Sdm1nF
         3CHxeT6VJ787FyiOO16Rux4SaOyJgw3y+34XR4Mrdi4lVA7/pS6zMR95x6yhHmT9MepO
         ScM15ZDY5RfH5ONrbZT3E6p/v20falmFX7ckibide588rOsMn8fw/FTFbAzIpW0T6Im4
         fqLktSZIPyQ4mwJctfulVSnsMO7RyeEBcJf+6OmERSbcxNGCWrCrPRiOXBgsI8Q+2P3B
         +BEliYmpUNHVtHBStTEcV38XO6s1zS+MYO79w5m8xPFWgqfC5nuC+kmvheV6/rHvYNBH
         SLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967243; x=1703572043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1uCtDz7HcLZw8bBv3xkVd56ZLigDE/dxAQBsx3lNjU=;
        b=AzsfaKxlD92s3TgSWJd+/0Pj37HgpZXgzmpdhlOEYLXYDVncMUwEfQEjasRN4jt8HW
         QsUltd9WfjO5FRlfa668ixMtln7m5FFcX0njs7/pYlkxriNbhrrcsOVJriALX35s8o0i
         Dz1ndYCFUiIPZZq0+zg5kKI1anmWWcUmWt3Unu4VajSy3bBBU3Xg5knKDrKKN4VAQNTY
         zaXELtYOP3Jx2bjeLmSYmZp8jzm2+GhMHhxGL5cNQcYeC41ULCrPvQ7QIz9YlMdaeOXt
         vCJIQ0an3iCUTGN1vqDCvp0TLtrscncfnsX9GLfyb31ZWkSxyAuFDWc5Wbkn9lCRxVLY
         l4fQ==
X-Gm-Message-State: AOJu0Yx3usSCgzmq2LMXTD16nLEBZwCYSTJWH1CgoBtHKjFgewTgyXBH
	ZHW++9npMR+gns4b5eafBUJ0FR7x0aM=
X-Google-Smtp-Source: AGHT+IGEHkPYiXlQinJZlHy5SNCwOe+wMhjSEte6gbqjsmuJ+LGTiN3GqhRkKbixh1jNZIphD0ZkwQ==
X-Received: by 2002:a17:902:eb87:b0:1d0:ab30:5582 with SMTP id q7-20020a170902eb8700b001d0ab305582mr10291494plg.129.1702967242625;
        Mon, 18 Dec 2023 22:27:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543858-27712-1-git-send-email-wangmy@fujitsu.com>
References: <1702543858-27712-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-django: upgrade 4.2.7 ->
 5.0
Message-Id: <170296724186.1627685.15821308583790743569.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107580


On Thu, 14 Dec 2023 16:50:58 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>   https://docs.djangoproject.com/en/5.0/releases/5.0/
> 
> 

Applied, thanks!

[1/1] python3-django: upgrade 4.2.7 -> 5.0
      commit: 532ba5518af7b310549784931bcd7d45ae0dbe35

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


