Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5752C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 15:46:33 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.10771.1722699986099323629
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Aug 2024 08:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AhnQ6JYf;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64b417e1511so76057367b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722699985; x=1723304785; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Kj4GIsFJstJCTtY6LmW+mwIis6cBct9u/l4C40gFgs=;
        b=AhnQ6JYfAjvVTAasd8DGvGN5nvDAVw3rsVafi/k8c9F3iisrWJ7e2QErFCm8rU/Jk7
         Sm4MXmykMap9QL5mz7kZrW1Rx1S0SdYreD7glkSw+qzxGmX2LzAxuLsVAbdS3nGyAJbd
         7qXt7p9NGO3BQygd74219N2UF9Ggp9SasMJZ5FdsMTU2KhmDjwAKUKiMbDW95R1U5++x
         szvxpSvMnelColq+KDqCZpXo6vCx4UBQ1oIbA2gqGGzInzH04S04cfwzLp/zBXak5+N5
         WjuJsPZG4GD18rTHHTHxJNPcbAX45Zb2FdhZwXuli8K2KhEw5iMBhR5EewrdjHvo5i9l
         8pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722699985; x=1723304785;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Kj4GIsFJstJCTtY6LmW+mwIis6cBct9u/l4C40gFgs=;
        b=wkLfqmxk1qpkg+7N31Shy+yo0SB1hJQQ65897Jv5RGuCFcjU0gFCOkRWAW1XfM7ArD
         Cer4P5IS4YB+SzO8Pz8THLpqPbVdcL5W4Yp005PZleCL26NAxamFah6EkdVm3OL5lB0n
         uN7QWodOOX5/ZwBkkePfsMvj2xTykB6+UTJuV5YdEh+sQ3wMKjwhB3askpAK0WeET74a
         ZJNrIjZrBa1Kn6PteQkgyaULjcvXRkJCDocUJOb4W7CtR2IO2cXMibf46TYwNyLyC5Nx
         XWvwgCe+M0mEWey3q+5L8VUJ9k1zAbmgpsZMeekooPMKvwe/WKfAv9dTM2o1M1tiD6TQ
         BX3w==
X-Forwarded-Encrypted: i=1; AJvYcCUyYVFWFC4IHGx7WnfU+6l7z1/8dfJ7/U3BajenwJp5uliBeTpuaPBTIvGtQV7nJgtcuU76fd5/vM9IgieIVpBkVst9jv9yQJWbW5KaVl06qt9CGBYQDAZeGg==
X-Gm-Message-State: AOJu0YwJESeJl6W7R0SUIQr9yD6g99zaikUwVlqaB1piPK+0Rq54kO9k
	5N4Zm8Qy6o2/hnMUiawf01PbNDk+X49SyNw3gIvCZl/VJRittXgm
X-Google-Smtp-Source: AGHT+IGyvSw1iWcv5uZ+VM5wJAZMdvR+Wcr/tuIw6CP00jBmj3Qr1NNShk0jeN0yDV9sx9JGJWz8Iw==
X-Received: by 2002:a0d:da44:0:b0:64a:91b7:e8da with SMTP id 00721157ae682-689637059ebmr68927077b3.35.1722699985019;
        Sat, 03 Aug 2024 08:46:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:233c:fb4:252a:b2a5? ([2600:1700:45dd:7000:233c:fb4:252a:b2a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a12d0ffb4sm6117757b3.99.2024.08.03.08.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 08:46:24 -0700 (PDT)
Message-ID: <174ac545-63e3-442e-9009-f106b59303a0@gmail.com>
Date: Sat, 3 Aug 2024 11:46:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Kirkstone merge request Aug 3rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Aug 2024 15:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111502

The following changes since commit 4052c97dc83d0c88fc277d6fc1815e0699020daa:

   xfce4-panel-profiles:fix tar error (2024-07-17 20:10:27 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 52ecd66835dcfd8b4e55c9cb6325908ccea6a4e7:

   nss: fix failed test of nss. (2024-07-30 09:45:11 -0400)

----------------------------------------------------------------
Emil Kronborg (1):
       php-fpm: fix systemd

Haixiao Yan (1):
       nss: fix failed test of nss.

Poonam Jadhav (1):
       tcpreplay: Fix CVE-2023-4256

Wang Mingyu (1):
       php: Fix install conflict when enable multilib.

Wentao Zhang (1):
       nss: fix failed test of nss.

  meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch |  27 ++++++++++++++
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb |   4 ++-
  meta-oe/recipes-devtools/php/php/php-fpm.service |  57 
+++++++++++++++++++++++++++---
  meta-oe/recipes-devtools/php/php_8.1.29.bb |  25 +++++++++----
  .../nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch |  64 ++++++++++++++++++++++++++++++++++
  .../nss/nss/regenerate_NameConstrain_test_certificates.tar.gz | Bin 0 
-> 10734 bytes
  meta-oe/recipes-support/nss/nss_3.74.bb |   2 ++
  7 files changed, 166 insertions(+), 13 deletions(-)
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
  create mode 100644 
meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
  create mode 100644 
meta-oe/recipes-support/nss/nss/regenerate_NameConstrain_test_certificates.tar.gz


