Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AD9C001DE
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:57:35 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.28559.1690127853130972476
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ibo6TxNL;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-583b3aa4f41so15143597b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690127852; x=1690732652;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifKDMOrLFb/0x41Pi/pqu2jNVnh2GrRBAwJzCFsuH4M=;
        b=Ibo6TxNLVcaEjpx1l6k8kbf8tEBlDI29HDdmwXDLsADq7r8ysTE4+68TBdtVGMwbNG
         eMRC6wl37MwsnMhzl+mBPu8vDe9zAl4f+KmGz7Gy4FWpd2wesgoQfufOLmE/Koy37GM1
         kUjSqK5m1kKXcbwylanUimOGBJVtq+hQpYhon/Z7VdXCTbfWs0Mpc2f2CKAxnX2dqze6
         EbDtbc6hu37A7n8wT1g80/L3oSvxF5wK4xu3kPyM8xip3fIA/Lql1I7Q1yfyTxAxrhZ1
         qOXt1MwO7/xnc8Nx9LqRxfpBEbMp04UfnnELBfP6DcWCFIYCeFUn4aaYoDmnj5ecCFtC
         U6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690127852; x=1690732652;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifKDMOrLFb/0x41Pi/pqu2jNVnh2GrRBAwJzCFsuH4M=;
        b=FL2cCK+5FrRI5PA4aKxqN5Aj5vBqdp883eN6rSXgqpxc7yPBS2NH8TIOfMjWzm6gjD
         89oYhLDw+z3qWp9qocvMwtQr229E3XssEQ9tv9Z3yqEv4ByKkt8hUbC34cpaG1QmxPuJ
         nbpKOPuEh+BSAPARf4DXHugWGCpHyztbePVsc+YKmrnZ4HLXE1iRud9j4Uge1wxa05tk
         FgDzRu1y92R0wLn4ZqQBXLHxeWfpqD8GGijT9K5tHTZaWjVrF8i0wO4fn/l9oM0lv6oW
         clkYQ8x1tFzYlNSj7Eps9BLqvHH2ZZYld/N9c+XGeOCGUDTs9Lkx4K19YIiW55S7+wGq
         p+LA==
X-Gm-Message-State: ABy/qLa9L6xoB9LQ06hq04yRfazLkWRD4KOvRiaScCcH0uP16VmMuir3
	Hhm8GbbOaLXhfwAzvHwPYzk=
X-Google-Smtp-Source: APBJJlFzLRPV/2Fp1uMIWdd6ue0JPwPQqkYLw7DYh7CVYaUsNZ/z2Oxxg6JQ1fEPdRRb9i0ec/gZfw==
X-Received: by 2002:a81:5288:0:b0:568:be91:c2b1 with SMTP id g130-20020a815288000000b00568be91c2b1mr4834077ywb.9.1690127852252;
        Sun, 23 Jul 2023 08:57:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:8587:6c69:de6b:78eb? ([2600:1700:9190:ba10:8587:6c69:de6b:78eb])
        by smtp.gmail.com with ESMTPSA id s66-20020a0de945000000b005772646629csm2227721ywe.144.2023.07.23.08.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 08:57:31 -0700 (PDT)
Message-ID: <549b6ba3-84d8-a884-202d-d0a594e9e174@gmail.com>
Date: Sun, 23 Jul 2023 11:57:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Dunfell pull request; July 23rd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jul 2023 15:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103989

The following changes since commit b5282ece919f016d91a1043769676efb02b4f0fb:

   openldap: fix CVE-2021-27212 Assertion failure in slapd (2023-07-14 
07:08:54 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to b8b0b06821d4d4df0cce4f07fa31a8ca1dd38f46:

   sysdig: Depend on system libb64 (2023-07-22 07:49:35 -0400)

----------------------------------------------------------------
Alexander Thoma (1):
       Fix tigervnc crash due to missing xkbcomp rdepends

Khem Raj (2):
       libb64: Add recipe
       sysdig: Depend on system libb64

  meta-oe/recipes-extended/sysdig/sysdig_git.bb                   | 3 +-
  meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb            | 2 +-
  .../libb64/libb64/0001-example-Do-not-run-the-tests.patch       | 27 
++++++++++
  .../libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch          | 57 
+++++++++++++++++++++
  .../libb64/libb64/0003-fix-integer-overflows.patch              | 77 
+++++++++++++++++++++++++++++
  .../libb64/libb64/0004-Fix-off-by-one-error.patch               | 26 
++++++++++
  .../libb64/libb64/0005-make-overriding-CFLAGS-possible.patch    | 40 
+++++++++++++++
  .../libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch | 27 
++++++++++
  ...7-initialize-encoder-decoder-state-in-the-constructors.patch | 44 
+++++++++++++++++
  meta-oe/recipes-support/libb64/libb64_1.2.1.bb                  | 39 
+++++++++++++++
  10 files changed, 339 insertions(+), 3 deletions(-)
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
  create mode 100644 
meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
  create mode 100644 meta-oe/recipes-support/libb64/libb64_1.2.1.bb


