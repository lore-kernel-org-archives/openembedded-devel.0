Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2709AC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:58:07 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.14203.1699451879358513961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMbLbgTT;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7dd65052aso85087387b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699451878; x=1700056678; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTDtxx+OQnsn/Sn7E8cIfz7VfFvt8DllYj6+/3dZJ/Y=;
        b=nMbLbgTTS0Df5wAeNs6fhVsovEoPms3QUa6ajsHI3T7WTrWnV/u8/sNR9x6PvZjUHh
         3+S/o34H8gZln9HrZfas5PQdZe7MonePXccWI/lZLoMgXtIvVubmNpbZoNuVf36U6P+U
         A6DD7o5EhGacAvAYbk2Y/q26FgbZWYs7YXVPTeqVcBtCXHmZK8vgt0XMu0zorke71NiZ
         7lSnaNAA3EjCu19pi1EEdo71gBUuz1caE6kYxuM0+VKLxRu7ErefsWaadBFArA1kH33d
         BUxJwV2/uSnF1mXZoFPTCWThBnlWut94cwN7iMUfOtcyFcgwiGymZ52ipPTAYj6RBTBb
         M/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451878; x=1700056678;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTDtxx+OQnsn/Sn7E8cIfz7VfFvt8DllYj6+/3dZJ/Y=;
        b=HRO/j7yCKgScNdG0cglu+pLH7XPvEM8HJwZzZ+PJCyCaXM/jtHy+r9wN2uMJb/IDGx
         RLjbY4wHZEDRJ+d5m+hy/yJZ8lOZJ32JAH5N5PWxvb8WIfmLggY0f3/IHdonGPiDqSYb
         gzA9ViE5R/eikytcPT419ur833zVyevbb4ceRSObcukFy3ZTVd2b54q0JUrpXh7E++Pp
         yEwb5/7jzmUPBRKvRntblzqfuFOtlaN9+Cst6iFKju3/UmjYpQyYiFuslunVgY5TGuAk
         i2LOq66tOcCW/ldN9ulS4bCnUUyqA8weEs0o7mT9+uz/2tNWlny+N9gY0NXFsGyzgJK/
         o5sw==
X-Gm-Message-State: AOJu0YwNqtY8xHIvvkyDFwNDq11xsvYEM6agxPdGVWVSaufNEstc698+
	9+k05uEbdDwrJAPeh6Ib8qwzxekFubETbA==
X-Google-Smtp-Source: AGHT+IFm/cY9mvQs7MiOD5bYSf7IZ1tQoIc/BxSlECk/yru6aev3c8oE8Oifc/QP6QjCUaf30f/WOw==
X-Received: by 2002:a0d:f301:0:b0:5a8:5219:df6b with SMTP id c1-20020a0df301000000b005a85219df6bmr1772683ywf.24.1699451878458;
        Wed, 08 Nov 2023 05:57:58 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:e0b3:28fe:245b:35dd? ([2600:1700:9190:ba10:e0b3:28fe:245b:35dd])
        by smtp.gmail.com with ESMTPSA id j190-20020a0de0c7000000b00583b144fe51sm6902013ywe.118.2023.11.08.05.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 05:57:57 -0800 (PST)
Message-ID: <05f768c6-fb99-4da3-87af-0ab94e216edf@gmail.com>
Date: Wed, 8 Nov 2023 08:57:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Nov 8th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 13:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106476

The following changes since commit 79a6f60dabad9e5b0e041efa91379447ef030482:

   mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0:

   indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)

----------------------------------------------------------------
Beniamin Sandu (1):
       mbedtls: upgrade 3.4.0 -> 3.5.0

Martin Jansa (1):
       packagegroup-meta-multimedia: restore x11 restriction for projucer

Omkar Patil (1):
       ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3

Richard Purdie (3):
       grubby: Update branchname to match upstream
       python-blivet: Adapt to upstream branch name changes
       suiteparse: Adapt to upstream branch name changes

Yogita Urade (1):
       indent: fix CVE-2023-40305

  ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |    2 +-
  meta-initramfs/recipes-devtools/grubby/grubby_git.bb |    2 +-
  .../packagegroups/packagegroup-meta-multimedia.bb |    2 +-
  ...1-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch | 87 +
  ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 33 -
  ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 34 -
  .../mbedtls/{mbedtls_3.4.0.bb => mbedtls_3.5.0.bb} |   10 +-
  meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb |    2 +-
  .../recipes-extended/indent/indent/CVE-2023-40305_0001.patch    | 4196 
++++++++++++++++++++++++++
  .../recipes-extended/indent/indent/CVE-2023-40305_0002.patch    | 4254 
+++++++++++++++++++++++++++
  meta-oe/recipes-extended/indent/indent_2.2.12.bb |    2 +
  .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb |    2 +-
  12 files changed, 8546 insertions(+), 80 deletions(-)
  rename 
meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb 
=> ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
  create mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.0.bb 
=> mbedtls_3.5.0.bb} (87%)
  create mode 100644 
meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
  create mode 100644 
meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0002.patch


