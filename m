Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C2AC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:52:21 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.19069.1700171538227952517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3oESPlm;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28010522882so1146436a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171538; x=1700776338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T811oNHhhQ01rOx4NFhp9l1GgnxFBYhqnYmxpMrYssQ=;
        b=F3oESPlm9XuCyfhU8ziWiN+CB6f9ESnFEk4vXcQHuC1uVsxb++Ya2rZ+abcmDpqaQw
         bO2JvYz2GtVveoHVRj86MBIWABMv7QXS41b65knSMMcbjmSsg+1cWB0vNfbyHC+SiJDs
         B/AZmuoa9wgUT7vydC6oE77j5UuNQsNtYuZYWT7qwOONiVBlp6EbTPQNjrEm1i9vpC19
         U0ezRM0yIpCQJYSEoiA93nsUuMO4pxdiYP6fftpIbrzs+7OrxEJrPsjdEkjT5Zt5kJ9i
         vjCgcKlVkUDtw40197fwgWdiHWu+q22bJnYZwcNN68tVDi6YHfeQxIh5fzixUlkPdWAE
         BC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171538; x=1700776338;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T811oNHhhQ01rOx4NFhp9l1GgnxFBYhqnYmxpMrYssQ=;
        b=kFULywnWjAU/ajz0tB3dR0zcCohO2AczqRe/0jm4Rq0OiQTnNmljm3TfP9ZhPUMHxl
         ZJ3kZcgcXJJtAcqlu6gVjI1Av6aaRmtpmEaMJf+6OlEzx8BTB7mh8Z1ixC0ifLxHLVAn
         yv4N2NF31qb5tRTnX8QXvcDGeBqxhSbRtKhzkzHWt1Sk4qRlz1oq9lHKWnoemUSOhCs/
         4FoERbsFwwu4aIbrNLtVtwLnzrBMEsvg3FbmuJTTrIlKcBRUCyO11W1maOO+XI+t82FF
         q5+N5YxwVVbqNin/j+B4X7rnp0N2W2UOXhO87TdpoYKdiWnyPkP2TJQ+3oDwNdI4tM86
         i3ww==
X-Gm-Message-State: AOJu0YwY/wMZzsvtFd9gBbu6nhIr9Y/qWbkGR9I9Bx0kpqyJu15nQubb
	CLjFor5MGpeF35ifzJCELA8=
X-Google-Smtp-Source: AGHT+IE4FrJ3SnW83F87StkI953llRdSxEplajyh/BEf7OCKtrjDlSq2xBiJq9rbM2fxK9tafYkoeQ==
X-Received: by 2002:a17:90a:e7cf:b0:283:3f64:1480 with SMTP id kb15-20020a17090ae7cf00b002833f641480mr12788450pjb.14.1700171537614;
        Thu, 16 Nov 2023 13:52:17 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ck22-20020a17090afe1600b00279060a0fccsm181763pjb.9.2023.11.16.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:52:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231115210529.800031-1-alperyasinak1@gmail.com>
References: <20231115210529.800031-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] bolt: upgrade 0.9.5 -> 0.9.6
Message-Id: <170017153691.250978.2841975461302062234.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:52:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106841


On Thu, 16 Nov 2023 00:05:29 +0300, alperak wrote:
> Changelog:
> 
> * The compiler warnings caused by the incorrect data type declaration
>   were fixed.
> 
> * The log message `boltd[123]: [93B blob data]` was fixed. The sysfs path
>   will be printed when the domain can't be found.
> 
> [...]

Applied, thanks!

[1/1] bolt: upgrade 0.9.5 -> 0.9.6
      commit: 3029554ceb0b0bb52a8d8ec3f0a75c5113662fe6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


