Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DB5C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 22:59:01 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.11458.1683327538339224359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 15:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gOTXbUDd;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a10577911so34572517b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 15:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683327537; x=1685919537;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ2uZiLXGbQyrD0Wcmeuq6YbgnTjabPU1omhrXNwreo=;
        b=gOTXbUDdsOmGV0NjnMcZMLqThHKfeWiZImY/6dcy4n4UQ5T3TV+fPuQtqd/LOqNI95
         4sH9WJEr3L86CTKv+4/j9cZkiDb8Y/wiNv18QGgVZg/x/DwSDLR/5XvocibB90Sq2Z3X
         Bvku2weOIv6yetn7V7zepXggodauhR/k/kuSdYp4F1yKKde5UKNtHHMmR4HxCm15mBJV
         AqRnbFdMAnd3mIX3cd3vUBSHF7RypolVDBQH9ndDUBg1Am7vsueC3WfxqdvlZNjrU7S+
         AjTmy+2FxEpOamaslA3okAw2L/rOxGLW91pU29STg6i6A8ehI34Emz51QXxfiblClamA
         Pxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683327537; x=1685919537;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZ2uZiLXGbQyrD0Wcmeuq6YbgnTjabPU1omhrXNwreo=;
        b=CwYGYUqAuvdZbs/i+NUEksiMF3CSdkZVd/EC8/RQULu6kAE1hKKAVZp+9UcTZbOMTl
         owk//xD6fGkqUA6yUDjjykOGL7sricBVV3OBBUMcI08UNLjHYOiGTe6j25qojj61PX32
         F4iiXv0b+kIYjZMANsOHO+w3l1mXGQGfPFqJjoCWDNWHJ//4+8em4vizwMBSSQsiXFVO
         KR+xZGZl1jbaSUakfs6+iZdBaDUWPaU6+P6I+5yZfPEx1ka3AC/jZDQyeRnYBCz5k3k7
         fwA+5lHOQfJTH6pFCfG/EEAsh4EsZhHlNEX3uCX7hFeYgDJW3fwwwENbfbU2Wrh6wbJj
         WdsQ==
X-Gm-Message-State: AC+VfDz+qssKpRjqMRsMMcK+Z0JEz8wkjKhUIxnDf8r1Nhtv3dkfL+Gk
	nIJp2/XwndmDxWl57eLNyu50aOz6f3A=
X-Google-Smtp-Source: ACHHUZ6rn6WJPBogo0jyeb96ME02xB2imI8UgMhWNphpwzI/Xs3qU0P2lKC9eY7/sSDY8sbTHzf2Wg==
X-Received: by 2002:a0d:d9d4:0:b0:54f:8cf7:c117 with SMTP id b203-20020a0dd9d4000000b0054f8cf7c117mr3748501ywe.45.1683327537305;
        Fri, 05 May 2023 15:58:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:9a3d:c457:f105:2b71? ([2600:1700:9190:ba10:9a3d:c457:f105:2b71])
        by smtp.gmail.com with ESMTPSA id s67-20020a0de946000000b005461671a79csm761539ywe.138.2023.05.05.15.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 15:58:56 -0700 (PDT)
Message-ID: <5ff0489a-9a5b-6a89-e4fd-f73e7c883161@gmail.com>
Date: Fri, 5 May 2023 18:58:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: May 5th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 22:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102320

The following changes since commit 7007d14c2558f86a49c2e2acb6154432c2ba4092:

   mariadb: Update to latest lts 10.4.28 (2023-04-06 07:32:45 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to e39b002df9675776cc99dccdcac07607ce783b15:

   multipath-tools: CVE-2022-41973 Symlink attack multipathd operates 
insecurely (2023-05-05 07:20:59 -0400)

----------------------------------------------------------------
Alex Yao (1):
       lcov: Fix Perl Path

Hitendra Prajapati (1):
       multipath-tools: CVE-2022-41973 Symlink attack multipathd 
operates insecurely

Hugo SIMELIERE (3):
       openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
       openvpn: upgrade 2.4.9 -> 2.4.12
       libmodbus: Fix CVE-2022-0367

Viktor Rosendahl (1):
       jsoncpp: Fix broken handling of escape characters

  .../openvpn/{openvpn_2.4.9.bb => openvpn_2.4.12.bb} |   7 +-
  ...1-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch | 52 
++++++++++
  meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb               | 5 +-
  .../recipes-extended/libmodbus/libmodbus/CVE-2022-0367.patch    | 38 
+++++++
  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb           | 5 +-
  meta-oe/recipes-support/lcov/lcov_1.14.bb                       | 2 +-
  .../recipes-support/multipath-tools/files/CVE-2022-41973.patch  | 154 
++++++++++++++++++++++++++++
  .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
  8 files changed, 262 insertions(+), 5 deletions(-)
  rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb => 
openvpn_2.4.12.bb} (91%)
  create mode 100644 
meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch
  create mode 100644 
meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2022-0367.patch
  create mode 100644 
meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch


