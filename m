Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C7C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:59:11 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.70630.1701701944161884040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 06:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnQhE/wN;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d8751c8e7eso1840782a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701701943; x=1702306743; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O9MsKxFhqAQ7+0yT854xlFqhyVS1ZU1iMXou9WsTS8=;
        b=UnQhE/wNcn71p5fOuJKQPiB9r01OWywADgm8U9apcL46hU8TD2njnE9MGciKSNtJi0
         N8r4Dlu4FWu/cXMAU9Vs1yX4KELakbjvh/I2o54OEtVJ978TZWgQiqPRrqHCkCo6EzZn
         VXMkXF9JQW0HmGv+6AahL8OrkadqHGfuyygikDetkFXTmC1d2Xg7WMJBdBaWJ5icPAZn
         15kRi7doIBbxa9CfPCA4G0zdZpPKQwFS6kbmPaxENCcSKZDf/jhXG2s1LywjT7IlXvFR
         4p/27avia8Gkfh4yS31L29/QL2XugrIIbR4srza2I/lzB0Tz2WoD8x5LfSG/qm512+vY
         0Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701943; x=1702306743;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+O9MsKxFhqAQ7+0yT854xlFqhyVS1ZU1iMXou9WsTS8=;
        b=efzOE5QeM8FlBn4+3LpzRvwmjNEegqaPXLLnaYG/Z86BUdSoGxwuSvMGmfp4hiNSyx
         agauFOKRV+WtIhs26btB8oV8/ON4dWKOfllhK40f0Q4xoyJ+j23wJpgEwg8nwIyvIilm
         or+ImfeEEpYGUV6Er6GItnaDwnBVJT9JE2wKUwI7R1HtkS1pcL1zrZcBabF+Y33jgpBy
         sE4VkkZIFuCsYGk8GDoOaLODDpSu8pj3z5UaGEaeTOatS3Bksx6G4N66fv0usztB9dJ+
         Rol9OZohc8UuowC72h+8k6ppkstrXgNsk91G7hSpg8clKw3U85GKO4aRczZd5NFiSIUC
         Dc3A==
X-Gm-Message-State: AOJu0Yyr+rrmQC7CjbbyG0TV3dfDmKAoWfTdxxwBIDHb7gNQF6IbWbVu
	ueaI6Or2l3bSeCMjPlMwK5s=
X-Google-Smtp-Source: AGHT+IFGRFbBYSvXywIdC7fel3rk4fRysTOEPt75416cIoBtYy/GIXwrW+E5H/NB+O1c4EPBGF5Ntg==
X-Received: by 2002:a05:6870:d9b:b0:1fb:75c:3fe3 with SMTP id mj27-20020a0568700d9b00b001fb075c3fe3mr3835582oab.67.1701701943410;
        Mon, 04 Dec 2023 06:59:03 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:7ba9:2a02:7254:4b4a? ([2600:1700:9190:ba10:7ba9:2a02:7254:4b4a])
        by smtp.gmail.com with ESMTPSA id qx2-20020a056871600200b001fac77ee907sm2518961oab.33.2023.12.04.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:59:02 -0800 (PST)
Message-ID: <b724b5d5-0ffe-45f4-97df-9d0f1869c960@gmail.com>
Date: Mon, 4 Dec 2023 09:59:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickeldore merge request: Dec 3rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 14:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107205

The following changes since commit aa5e8edabbc414d8ec1b2ad63c8743c7baf99626:

   nlohmann-json: Add ptest support (2023-11-16 21:49:15 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to f29290563cb821fae95340ba959749641c69ed7f:

   python3-django: move to version 4.2.7 (2023-12-04 09:47:03 -0500)

----------------------------------------------------------------
Benjamin Bara (1):
       libvpx: upgrade 1.13.0 -> 1.13.1

Christian Eggers (1):
       python3-gcovr: switch to main branch

Hitendra Prajapati (1):
       wireshark: Fix CVE-2023-2906

Joe Slater (1):
       python3-django: move to version 4.2.7

Khem Raj (1):
       gattlib: Upgrade to latest tip of trunk

  .../recipes-support/wireshark/files/CVE-2023-2906.patch         | 38 
+++++++++++++++++++++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 1 +
  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 11 
+++++++--
  .../webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb} |  2 +-
  .../python/{python3-django_4.2.1.bb => python3-django_4.2.7.bb} |  2 +-
  meta-python/recipes-devtools/python/python3-gcovr_6.0.bb        | 2 +-
  6 files changed, 51 insertions(+), 5 deletions(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
  rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.0.bb => 
libvpx_1.13.1.bb} (96%)
  rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb => 
python3-django_4.2.7.bb} (58%)


