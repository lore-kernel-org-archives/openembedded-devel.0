Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FA6C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6772.1702967269550397977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cw7wvqzw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d307cf18fdso15842515ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967269; x=1703572069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQAnYfjiBjqwlqWr4PuDMOCJEie0Olynqmj+j5mFsak=;
        b=cw7wvqzwmJZbYo6ImcmG1UUwkO0sIHmyuz8tR/LL1xOd1uuXN/munZ4QbTlA+U7FrM
         qdmrCkuWFelt2heK36f38f0UMg3GqAK13/o4Cw3R4Lk0u3huKeAb3rWVEjZBPORtELfT
         LBtwkS08HCf8oqnKb3IFyinzspSPx2cN/cCU62AHzRtkyiwWJrByLsl622WpLLYuvQha
         oDTvmdzcW8q+T6VIanPvzUGAiSUtcHCkfub4iTpam4nIbZDMP1WZ+zzBCIV5DwbrCret
         hq0ODxGipOw0g9++14LLK1LEtkXRXGPq+mIgAE3xX/PV109ej4krvCSDK+t7XEViaITy
         T7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967269; x=1703572069;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQAnYfjiBjqwlqWr4PuDMOCJEie0Olynqmj+j5mFsak=;
        b=OH+PdxvNl8bf3M4bMV2JXsCYEEQaY1eZaeL/dw8IF/vQOT7LA2eyqxIOlNLXFxugkr
         jZRXR19GpJP7HwpANXa77UQDDWeDaU3Jrz+Vt1wOoT6tY76sdWkvgER5rXErTa/Iijzk
         kQw6mWo8M4pQAZ2EwDptb9rWLvKlAAQnVqBWyJWwNGZMHB9pg3rLPsYADjBwThf6/f01
         5gSGi3VIQSIjGxy2Cy/mgewZwdpF/CpuR7RlZgI+t+CvUnG4iV+3rvzM/LUuj37ZYIq7
         w+NUrOt5ga/ANyfAr95NXP2Y/RjMkRdV+poc8WN+Kk7mTWRJcYSbmKY4UD7gnDOvKUrQ
         S6Hg==
X-Gm-Message-State: AOJu0YzUbHb51jFkh+THUrs0Jtm9K08spy5uC2ylPyKWGB3UvH1/mgyF
	Df4/S+tbBdu6C5GdET6oNOM=
X-Google-Smtp-Source: AGHT+IH7PBnpkeoZmTjfnePu2IS3LJpUWFsfBQjPSDaGX6iKC3O9oivcnrlPO32gd2u1Z5AUmYCHnQ==
X-Received: by 2002:a17:902:b686:b0:1d0:c532:84ce with SMTP id c6-20020a170902b68600b001d0c53284cemr8510358pls.77.1702967268845;
        Mon, 18 Dec 2023 22:27:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702611988-3202-1-git-send-email-wangmy@fujitsu.com>
References: <1702611988-3202-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] gensio: upgrade 2.8.0 -> 2.8.2
Message-Id: <170296726811.1627685.851422595776436301.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107609


On Fri, 15 Dec 2023 11:46:28 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] gensio: upgrade 2.8.0 -> 2.8.2
      commit: 851b1777afe6117b9be368160cf9d4dd5288dbc2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


