Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F74C07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.14526.1701215737578676636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UubIPAKy;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfc985c92dso25514695ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215736; x=1701820536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gHGqtbmGerplhywWXdUDlyZXk4jHSafOuQ9qqi1898=;
        b=UubIPAKyMUx3e+1Aedo1+LO/pNDCVebeGz0CGjv3srafAQP3bhLAXYrNqJfR9GvIm6
         7APgpV8JdbiFu7MNU400RcEvMlUIRjmGJf1puBEj7v2aOSUoCWzBHc3j6q/aH+ksG8V5
         IgsqRHlaZ0A9BKwIP0IeboOU/BNtgXmvr0Nm8S/GXiqC14JDcBbU3gDjV9KlXFNs6Uyy
         mshXhFiuCr8k6NGxanNnYBzqwzEBADzThRFdv3xUHMtRJF4/rqlCRkx0g30B5USdBd1b
         dJMCjQW13OlUecAPtY4eeSL+qt7x8zl3VRhE4KEs9fYHPfFgS1bctioXxNp4gW10gx2t
         9CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215736; x=1701820536;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gHGqtbmGerplhywWXdUDlyZXk4jHSafOuQ9qqi1898=;
        b=WlgAfMfrGqGZk7hJ8eB+rNe+4DW/tvPRk9xX59TPVzaQk/sXf5PNxV4o7+Ic17MVpk
         7bCbeL7yo6LkEnADu1BgL9VC8AbprRmsyiuW2Awjscegl63FOUfFybVEsEIIAN4iYF6F
         CFWGQubzgbZiMZf+UZ5Eqi+XWnIwCiOLJAddmYMn8O9NPegjxeLqKTBuPadksu9y+rBo
         il43yn64O/8KuRsKUKarbMZkVBLPWnEPB2VGvAmNRu95P1MD918/vshrblt6PbL6ZNlW
         NFYkoet0/zWXXUyjhydYiYA+uhCQz//lo4uunhoMOedD9JLO/wrtw0iOtvTLFv0ZcP9a
         b7KQ==
X-Gm-Message-State: AOJu0Yz8TuSSzIRDllIP/uV6C/D/9xm1i7BqNV/Wib2EVSG0B+sgloBs
	l16tbRO4cAVMuJ1be7ajpz2KQVy+MwFLeA==
X-Google-Smtp-Source: AGHT+IEDMLkFHqA2Arrsar8ChrVgfgLTNJ88erBgDgWGQkb/i71zpm15ZzO7fvOZtprXKV5hI+gAJw==
X-Received: by 2002:a17:903:190:b0:1cf:ff65:b7ca with SMTP id z16-20020a170903019000b001cfff65b7camr3655074plg.8.1701215736585;
        Tue, 28 Nov 2023 15:55:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701161042-28580-1-git-send-email-wangmy@fujitsu.com>
References: <1701161042-28580-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade
 68.2.0.1 -> 68.2.0.2
Message-Id: <170121573569.1187527.4615648733707700333.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107122


On Tue, 28 Nov 2023 16:44:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Third-party stubs: remove unused type: ignores
> 
> 

Applied, thanks!

[1/1] python3-types-setuptools: upgrade 68.2.0.1 -> 68.2.0.2
      commit: a982f406c07c2912b3b282c562f5ae46f4527fae

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


