Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3253BD3C92D
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 16:53:32 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.27949.1729443210814360069
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 09:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KfEomKfC;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so3533253276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729443210; x=1730048010; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygDcZeV94JfCCdasVBKuDa2lWcVLD7EUGLvEGMT+0Lw=;
        b=KfEomKfCesc58TD98VWZ7lqz00JGOhDoHI4lUI+ySZ4tOdkkf8GgcaSqk+3JEKJn6j
         cWK5ok/ghyjwL0w27Rh4GHwhPtzYYLrHbeq/6bl5GCXe4ZKtgOruAvlxPLEiNRpPTAkX
         sLSfXJVNisuLDAbX1a1aHW8MDEeUHSwJFL3HG4Nc2coomo813AeekIlOYpUPWGSaAiul
         KduCjO6PTy8TQhLbNmgWntqY5vgrJ2eQ0aJPWZdQNL7cLWpws65HTfTa/tsqzkvmWDE8
         6En3QIR4iFtpZZb+XnPBDiPMH9lxqEQPUFAHi6aSnLh5FQ6RoHRyfG2RndeLVwPkBzOk
         3oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729443210; x=1730048010;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygDcZeV94JfCCdasVBKuDa2lWcVLD7EUGLvEGMT+0Lw=;
        b=YlBYh0+5SQ5QRIzwMF6IirNxDI/5iw5MQUdCHblfT2hPOnwYE3vy8hMEcMwufkm1WE
         3vClh4E4wYFKsa3FZ6tsiGTk/rcgYmMoayY8WV/bmIScKDzx3TduYHxQU6EsSuw2Iytx
         IkjUsCmXWXISiGlVithCAOwSHq5Mpz+6teA0ksFaNwgOFYEVAV90PS9mQMIt7J7qFqko
         qrM0VoTL4u8ZpbmBFLBHAh6SzLnX/Y6mnS7EpDi8eHUCa9Q6ZE8wa1rCl6XJ9Y/BOPiG
         IoB7Lu859Uqa/mCBiRowWPUXKjZBfbcrESTlNnmyIVRR8oqEZzFnaWSb01ohm4cMR+np
         uyVw==
X-Forwarded-Encrypted: i=1; AJvYcCX8gfQRwthXjDZ2IckRb6QksyhUsPZ7yzoRQzX6kKb+s7RuTmlE4+37hFEBgm5yZsl+6qu/ouQE5IGk14P3Kkusngw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqFO/xkToNRJWZC05GGtvRwMalHOlie/4WDb6cCidbs/jVa1W/
	PK9pLutREi5btP6r3wATAPIdG6LodyhCxoWLoa8J6LCP8k2xTti6RyFRGQ==
X-Google-Smtp-Source: AGHT+IHceQzHZ0yj7RBTAV43OeHGYjR7f2Nc5DHeCW0F9TqLQn2IqGCrsTMMZXT7kqJnidrK/3aYJQ==
X-Received: by 2002:a05:6902:1aca:b0:e29:2761:7981 with SMTP id 3f1490d57ef6-e2bb12eee97mr7618058276.16.1729443208601;
        Sun, 20 Oct 2024 09:53:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:2993:8a9c:64dc:9868? ([2600:1700:45dd:7000:2993:8a9c:64dc:9868])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccc4c7sm3780277b3.87.2024.10.20.09.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 09:53:28 -0700 (PDT)
Message-ID: <5dddf64d-d959-4d55-9cb9-8aa260b28dd1@gmail.com>
Date: Sun, 20 Oct 2024 12:53:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Oct 20th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 16:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113068

The following changes since commit 72018ca1b1a471226917e8246e8bbf9a374ccf97:

   rocksdb: Add an option to set static library (2024-10-06 07:29:13 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 2e3126c9c16bb3df0560f6b3896d01539a3bfad7:

   xmlrpc-c: update SRCREV (2024-10-15 16:59:45 -0400)

----------------------------------------------------------------
Andrej Valek (1):
       externalsrc: fix support in various components

Martin Jansa (1):
       xmlrpc-c: update SRCREV

Ryan Eatmon (1):
       kernel-selftest: Update to allow for turning on all tests

  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb           | 2 +-
  meta-oe/recipes-kernel/cpupower/cpupower.bb                     | 2 +-
  meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb | 2 +-
  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 26 
++++++++++----------------
  meta-oe/recipes-kernel/spidev-test/spidev-test.bb               | 2 +-
  5 files changed, 14 insertions(+), 20 deletions(-)


