Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7B0C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:52:14 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.18451.1678711932581847895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KJeCGzFf;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id l13so12942494qtv.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678711931;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuBdI3We5uM3T7aBijGcjBvHa+ADLMJh3OY0cfDeWE8=;
        b=KJeCGzFfF73oX5PfrgfMFDrtq9fm8IH55k+fn6KRK3ulPMUX0EUh5Z8qUSVRxW3fx+
         7MnQcnGG9INAQyq9O8ZKMeLq5UhEIf7W3CLaIA7MaPYzvXrc2VDgXHh9YcpVDuREse+v
         jVzQ3Gl62Pz/5o8fRHv+zXkoW2Wf/qfYAVfSxJLT25pSvxyDZxdhKX4EyGGT4a+O51vG
         HOHzp1/BS2ixvaAEYwn+sgTHFy3FwT0dgDxs9fD/GvmoPS8OfLs4152H7mdL5+eBvdeR
         o4JgvP3oIdH46UZsnTejtHr4xXQnzP+bRyfBoeX7edMAtgPCKr8Hwz637OxCjQnmfDc8
         nuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678711931;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nuBdI3We5uM3T7aBijGcjBvHa+ADLMJh3OY0cfDeWE8=;
        b=i2SugQPLUvwc9K7th+PDNlKfzCAq/BhMdP2qu4KQYxpFnQxFbT2VC4SxYt7qRaNsc9
         4pBCrA5cJkrk2XF3fpArNDMwV7BLGipK1Ovu525F6Td6XT/Nl5WNZVDhhTxCFfTY8LN/
         c/k8HfbAAvJwBoajI+/OQJiNL7KkTEbdtxGv/Td+6jx06j9RKAPJ/vy3GD/SidB9j3uX
         RaoqvsplR0G9oXu3ordwF4UeLI9MjvXSM19EEJghXlV1RMXwlyYpbn5LqDqR9sgHWcuX
         Im/TpDy1k+PDwtXROKZnMkhA39AiuRUOoVXwAki67N6L65CxnRJkMGxO1FOh5nn1Davo
         qu8Q==
X-Gm-Message-State: AO0yUKXyOmtO3kAN6qAFC6wbajdAx4mLFxgYZOu1ZrKxhh2DKBPE9UFB
	cqFQTeSo0bRLyfkyXBrTakI=
X-Google-Smtp-Source: AK7set9aZvJ5HwM9z0xlHyWQHrhZU2lcjV9z/ytrV6oylbAM+I4b2ScphlUQ09Z+1Wf6551bl/Yy1w==
X-Received: by 2002:a05:622a:40a:b0:3bf:cd81:399f with SMTP id n10-20020a05622a040a00b003bfcd81399fmr59394704qtx.3.1678711931593;
        Mon, 13 Mar 2023 05:52:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:e7ce:6a2e:9f0b:847e? ([2600:1700:9190:ba10:e7ce:6a2e:9f0b:847e])
        by smtp.gmail.com with ESMTPSA id hf22-20020a05622a609600b003bfc335f124sm5276937qtb.79.2023.03.13.05.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 05:52:11 -0700 (PDT)
Message-ID: <51289d1e-8204-a989-15a7-ed0574152e7a@gmail.com>
Date: Mon, 13 Mar 2023 08:52:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: March 13th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 12:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101513

The following changes since commit b5b732876da1885ecbab2aa45f80d7a3086c5262:

   mpd: Upgrade to 0.23.12 release (2023-03-04 07:24:09 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to 613dc6e1076efcb8c0aadf7728433e5841e6a6aa:

   nodejs: Upgrade 16.19.0 -> 16.19.1 (2023-03-12 11:51:57 -0400)

----------------------------------------------------------------
Khem Raj (2):
       redis: Upgrade 6.x recipe to 6.2.11
       redis: Upgrade 7.x to 7.0.9

Mingli Yu (1):
       php: Upgrade to 8.1.16

Polampalli, Archana (1):
       nodejs: Upgrade 16.19.0 -> 16.19.1

Tom Hochstein (1):
       nlohmann-json: Allow empty main package for SDK

  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
  meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb => 
nodejs_16.19.1.bb} | 2 +-
  meta-oe/recipes-devtools/php/{php_8.1.11.bb => 
php_8.1.16.bb}            | 2 +-
  meta-oe/recipes-extended/redis/{redis_6.2.9.bb => 
redis_6.2.11.bb}       | 2 +-
  meta-oe/recipes-extended/redis/{redis_7.0.8.bb => 
redis_7.0.9.bb}        | 2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb => 
nodejs_16.19.1.bb} (98%)
  rename meta-oe/recipes-devtools/php/{php_8.1.11.bb => php_8.1.16.bb} (99%)
  rename meta-oe/recipes-extended/redis/{redis_6.2.9.bb => 
redis_6.2.11.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.8.bb => 
redis_7.0.9.bb} (96%)


