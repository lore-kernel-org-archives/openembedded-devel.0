Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17434EB8FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:02:22 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.6766.1694001738075324208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i9W2+l+S;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59254e181a2so34009067b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694001737; x=1694606537; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9faSPiB6BxH2cAla2BKtbQk9ZXGk2wO2rOiFWKYEQw=;
        b=i9W2+l+Sdz/RQBI85RtAySdAuo/lvKKvFXZAkmLo0xOtzXgj9HnIJsQ9B1DC2CdHAH
         GaNP5kpJDbDV0+swQIJmKvRKxQDhEvJhPSMdlwhUQ2eZsTUIdvWJFFTGKatWYJRoqoWH
         dt0S+1/7ZOkgBq3eZegBcKD0M1VYh6YUmbg2I2HDAVWFhN3jISe3vVcOrF5cZfJDkx7p
         GKMQlgtmXwCFA3N0PuswI+ADYW2q2dhgajOeM5vUh/1NfKMvs1AlkkctCnag6gTPrQcm
         6K5NzvZWh/M+xATK++S6lqkWK821fDuf8FzNBzCFgbc9kCbxTE8QxP2DN5mtWmGVf8aZ
         HD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001737; x=1694606537;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9faSPiB6BxH2cAla2BKtbQk9ZXGk2wO2rOiFWKYEQw=;
        b=QcTDxsQbe8M0J3Ebz3qSRbh1BqNeZEmy66mNul5O9bC2PtzVv7QqtmrrJkhkr4oinI
         pSJ3Ygw1LmndEfEvwEZuLhzT0a2Pab+oLxDm7MPsrVZ/GUs+yQiUxU2+OzP5jFBc4zpG
         IXso+Sd6DZ8258mv4NgxnorZ84hYBuyOTtzmNbzGMW+WianrXcEoLFQTYYeDSU+WzZNh
         QtGavyneNbiUm7zIZCvW71QpNXDDXMFI/54rVyk/A+x3l89bLHI2xnB1NvOEQkF9eE9q
         NNxedsQcQVbCHlU2qM1wc2l73C0WQ2r0sPj41l6LTcEE3UtRKNIpvWiW9yxA+My7JBfd
         KhZA==
X-Gm-Message-State: AOJu0YydSmcbcvvXgP3fUf8LN0+kRQNKiBH6eur+2rj0OXptZXaoZl18
	3A9/Ld+y4QdSX6LWXTH4nuk=
X-Google-Smtp-Source: AGHT+IHxaaY3JJRMG5RTPFjPcoy61CMu5V6RWL4gfrmtobG5g63LuqPPsFpTZfnBMV7Ejd6iqw0CXA==
X-Received: by 2002:a81:b10a:0:b0:59a:d94d:566d with SMTP id p10-20020a81b10a000000b0059ad94d566dmr8971707ywh.21.1694001737192;
        Wed, 06 Sep 2023 05:02:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:5654:1c56:e678:3eb1? ([2600:1700:9190:ba10:5654:1c56:e678:3eb1])
        by smtp.gmail.com with ESMTPSA id eh10-20020a05690c298a00b0059adc0c4392sm1689925ywb.140.2023.09.06.05.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:02:16 -0700 (PDT)
Message-ID: <0e376e4a-d827-ce01-7bab-d6dcda74ac3a@gmail.com>
Date: Wed, 6 Sep 2023 08:02:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: Sept 6th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 12:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104778

The following changes since commit 41fffef6b044b2722aa13f7e7648a3f848231851:

   yasm: fix CVE-2023-37732 (2023-09-03 10:43:56 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 57c516973978ca2667339bf1aae7dc722b5bcac7:

   tcpdump: upgrade 4.99.3 -> 4.99.4 (2023-09-05 13:40:23 -0400)

----------------------------------------------------------------
Martin Jansa (1):
       libiio: use main branch instead of master

Soumya Sambu (1):
       krb5: Fix CVE-2023-36054

Wang Mingyu (1):
       tcpdump: upgrade 4.99.3 -> 4.99.4

  .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} |  2 +-
  meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch     | 68 
+++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb                | 1 +
  meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
  4 files changed, 71 insertions(+), 2 deletions(-)
  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => 
tcpdump_4.99.4.bb} (93%)
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch


