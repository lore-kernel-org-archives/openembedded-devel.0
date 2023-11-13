Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08271C07CA9
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:02 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3219.1699900435081960298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9/YTKgv;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-692c02adeefso4171260b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900434; x=1700505234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S33IW6Rd6R23SNlqpsTaZJpNNjZLYDyqplI2hmNln3w=;
        b=D9/YTKgvZ9O9fQO/78Ak2LAZMY6D3OLJKwBGN13u1hQgTTKQUiJVHwAWS3p+3c/hIx
         6dV7CKg4h3zCM7ndv3+Z2To6UroNpldklSCeDtrPkw35wOQDlruiWT6LiPYHIU7n8C5E
         VLZe9OgtLtGwV1oXncdX69Rvga6Npp3UDGAHwhYaLM06boV1nF/Z2/htCh1K2eQtSMJZ
         3U2k3BtuOLu0SbE2kknQMgfvnavvGshxQK6rQmc9lkgT4ME48M2M8Wb1h7Nceldxu589
         yV9heNZomO7Oz5wTvv1uUIpmX9R6wZ78IiM5oxxEOH4S/yBi/Plv3084LvbA7KXKtE+M
         nerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900434; x=1700505234;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S33IW6Rd6R23SNlqpsTaZJpNNjZLYDyqplI2hmNln3w=;
        b=lFGHAq48nEkztxzW3Rj3rUaAyerAiFRlfpR6hf6cdr41fUpfpdAiWVayGvWiSOxsxa
         SWebdgXRc8iRkAbePTtlpwTL9SXL0EOyBp3jyJbUdB88A4ol1JfzvX+S+MZMa8SodL+G
         JT5onwQawMY3glgT7y9jo3J7uWK414b0DU72qSjoLlzFXWFAhzpiL1TMESzY+jQPapI7
         /m9g6gabd5A+2iENh6GOxg8nduhjqmczag/imHeimOtRDCkSBozVUhVmmxSKaMK8CVTb
         OFsxEOmnWDajY1dBmX0DyvbYbVhjfeK8ikfGkNTXfe7fqZ1myExX3dYewE/Rkhswu4Wa
         /+Iw==
X-Gm-Message-State: AOJu0YzszVdurvQ6Y96QM8p4YQky5enPHGTo7mWkP9/wfRUSa7RUK0Ll
	0c8MSVtfUSXAAv7iqVynaeWUjCfEB2haBA==
X-Google-Smtp-Source: AGHT+IGiEOwVlAepZezeDGnCOBz5bqAHwn22AgflaDCjDFRbYP8aytw+gjMxwzxbtNAzv5apso5bcw==
X-Received: by 2002:a05:6a20:9383:b0:186:736f:7759 with SMTP id x3-20020a056a20938300b00186736f7759mr3174859pzh.62.1699900434362;
        Mon, 13 Nov 2023 10:33:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112102857.135199-1-alperyasinak1@gmail.com>
References: <20231112102857.135199-1-alperyasinak1@gmail.com>
Subject: Re: [meta-filesystems][PATCH] fuse3: upgrade 3.15.1 -> 3.16.2
Message-Id: <169990043317.4418.2030077164207280754.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106657


On Sun, 12 Nov 2023 13:28:57 +0300, alperak wrote:
> Changelog:
> 
> - Various minor bugfixes and improvements.
> - Readdir kernel cache can be enabled from high-level API.
> 
> 

Applied, thanks!

[1/1] fuse3: upgrade 3.15.1 -> 3.16.2
      commit: 59c4f115ad8678a782ad59d36afc0a33f8fc4635

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


