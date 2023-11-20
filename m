Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2CDC5B562
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.43606.1700452267832626268
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y66HS4xQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530489b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452267; x=1701057067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fN1t2OmPRVLQiTbYz8m/+b7dk+0YUCTEK9FDauokf0=;
        b=Y66HS4xQVb48/Mj5YppHsEIIyp4dFicguPXN5hmqYaCCAMCI3jfi8VyytYPLR285ko
         9urZ3LMlp0dGpeVYMvKJUE97XsI+nmYMRS1V6d2sxfhfvCljzVK5HbNt1Vle1TfKNL3M
         IXF/7oB2L7hVY7ETRO597Tzux3VuDvYbVUA/LRByAmvYUMetj20qJUlVDSWH3NErWp0o
         zZ1zVbJgQtLsjPcxY1TuMgxqyLvbgVrsXEvarim+oMhnl2oSp92YDEeQG6ew616pCYD0
         aCJ+bbqlBJsVNL1+P0uaYXTU8lpVGan6Blk+cLOK2BbVveal7YLqITJemC3zUD5J9DaE
         LDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452267; x=1701057067;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fN1t2OmPRVLQiTbYz8m/+b7dk+0YUCTEK9FDauokf0=;
        b=FWO7s/bu+eLAmS5bjx0iQrJoO8MduaDqv6D5PsNrf9tt96KSeeBE/QSrFoCAQfFE1B
         /nuaG9wtYX39Ki4+to7mEF0LhnaPcZgNkvBLf6u4/95Hvhnc0kJS0LmefshpSxi2lP+D
         IsTZR0JEFLZtYrc/yuQOJwL+/XP683oy3wfGlZ0hDdeB5OeJCE1Zxng7h9vtcrhqUpVq
         BzvWf6BDJtOHd5gl75upzq2vOC98lxl5hBbPnSGJzQTIFbSlbehthV/aLwlyVgyZMaXK
         KcYv3CisMifaC44rfDPWDYhxYbCgWU5e6FckZaCuUkMpCbCGVCY/94hdxFS+4+CMBaIK
         5+sA==
X-Gm-Message-State: AOJu0Yyq6LjfEZN+mpN5F1kRGEzrQ/ib6mIA9NHdtpHlieAkLPwIj7H9
	OnLaWaLNh5fmgKsRirh2EBFOtvdYVyYyHQ==
X-Google-Smtp-Source: AGHT+IF4NuPSMKFXqFgld368THdcSyYlG6EFfq2SkJDLynARNu+2eDToRgSNnVKEWUUL7cNPiCmSLg==
X-Received: by 2002:aa7:888e:0:b0:6cb:a28f:85c2 with SMTP id z14-20020aa7888e000000b006cba28f85c2mr2309023pfe.16.1700452267229;
        Sun, 19 Nov 2023 19:51:07 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123588-22554-1-git-send-email-wangmy@fujitsu.com>
References: <1700123588-22554-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-tomlkit: upgrade 0.12.2 ->
 0.12.3
Message-Id: <170045226622.1416826.319484842468114301.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:06 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106923


On Thu, 16 Nov 2023 16:33:08 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Improve the performance when parsing a table with nested dotted keys.
> -Keep the newlines when replacing a table.
> 
> 

Applied, thanks!

[1/1] python3-tomlkit: upgrade 0.12.2 -> 0.12.3
      commit: 17735e0224727e4c8c2a52f520d720ededdaeabf

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


