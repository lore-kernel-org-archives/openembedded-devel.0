Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E14EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 15:10:25 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.7351.1688310621594938361
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jul 2023 08:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qLfo7fzU;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5776312eaddso25859197b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 08:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688310621; x=1690902621;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqQqoHd6JhyQtoK6iCu1bjJ/Cg29Ig56EwNIxELl9UU=;
        b=qLfo7fzU17pzKoxT2N7PgcmtCRXYX8556NXNTwn8581IaL1HGICcsaGq1gJeyOL1cg
         +CeJu20wgHmIAAHq9UuzjjBGsIL0tlTa+4rY1f1Mzyyzzh+irKbqBXozxpRhfT9VfBF4
         4kUjB+KrBcpHgEci6FDGNmxpSnNPtyh0oe8Ju85b+ofgBORs4BVFA3RHRmmW5qPlZagJ
         pEa/H2eg+dU9hHWPLeOiWmexJGNA5hvMEo5aJASIE4cym2nFYlz97zTw2zkZ7jc3t4nz
         +2dfLFMeblYlbbxfqwvVvQe+xdBQ6dbFba87+Vr/ve7tMD5KtC3Kdf6jCX+UBIM0pNRJ
         z77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688310621; x=1690902621;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqQqoHd6JhyQtoK6iCu1bjJ/Cg29Ig56EwNIxELl9UU=;
        b=IigJdZ5D0jEO8n8+xj4HpQqJLH3aDgC9iaGQKGtxJ35mTdND9Ue+hnxwtekLyiSJWS
         QlS5I7vg2n1QCXCgq4vsa0Q5Gt901xoBVx2YjDM9EJcwiHx1D56ebzrVX9FlJbiZIzCP
         mxoUsNKRV1T4R2qWvNvMLfWmwg0GgLiD3cCvQq7qtR3HT1gf95FXSuOVhnmfeAuHPMoJ
         piipwekGepkX2+yEToNLpTo+VsMruAa6KapI/P0s4DhTKfj7LUIdLlHO0U3TriVM4E0c
         wZ5CXbc7LmzwULvDeDImSL4i2VLaD04qC0ltbeqGRga5a+Fk9E2oVNXDkVxcO8LNVTI4
         xkAQ==
X-Gm-Message-State: ABy/qLYF+xS+U6amPSpKpFrjn22GHwW1+2KekDkoKLadlbs6L6MAi6OI
	HoF0dARv5szQVhYBNTmB0FAoY9uRo4w=
X-Google-Smtp-Source: APBJJlFyOrpNFHRwTVWhvVqP+C0fLhsVTGbWGw+0CIJekgU17+pud0Wn2UFoyau8WvX7v/ztVqlusw==
X-Received: by 2002:a81:4702:0:b0:56d:1cc4:3335 with SMTP id u2-20020a814702000000b0056d1cc43335mr7130133ywa.11.1688310620730;
        Sun, 02 Jul 2023 08:10:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:2d9c:8fc4:3a88:3856? ([2600:1700:9190:ba10:2d9c:8fc4:3a88:3856])
        by smtp.gmail.com with ESMTPSA id d186-20020a8168c3000000b00577139f85dfsm2314211ywc.22.2023.07.02.08.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 08:10:20 -0700 (PDT)
Message-ID: <58ea60fc-5580-0bb6-edb5-6d403c5900a9@gmail.com>
Date: Sun, 2 Jul 2023 11:10:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: July 2nd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 15:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103650

The following changes since commit 5a01ab461c9bcabcbb2298236602373948f8f073:

   wireshark: CVE-2023-2952 XRA dissector infinite loop (2023-06-17 
13:15:57 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to d71a08b3d8fc69d3213c10885af9cc693056a8bd:

   mbedtls: upgrade 2.28.2 -> 2.28.3 (2023-06-28 16:28:35 -0400)

----------------------------------------------------------------
Hitendra Prajapati (1):
       wireshark: Fix Multiple CVEs

Joe Slater (1):
       python3-sqlparse: fix CVE-2023-30608

Polampalli, Archana (1):
       tcpreplay: upgrade 4.4.3 -> 4.4.4

Sandeep Gundlupet Raju 837 (1):
       opencv: Revert fix runtime dependencies

Soumya via (1):
       opencv: Fix for CVE-2023-2617

Wang Mingyu (1):
       python3-django: upgrade 4.1.7 -> 4.2.1

Yi Zhao (2):
       frr: upgrade 8.4.2 -> 8.4.4
       mbedtls: upgrade 2.28.2 -> 2.28.3

  .../mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.3.bb} |   8 +-
  .../recipes-protocols/frr/{frr_8.4.2.bb => frr_8.4.4.bb} |   2 +-
  .../tcpreplay/{tcpreplay_4.4.3.bb => tcpreplay_4.4.4.bb} |   2 +-
  .../recipes-support/wireshark/files/CVE-2023-0666.patch         | 122 
++++++++++++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66 
+++++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33 
++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 3 +
  meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch       | 88 
++++++++++++++++++++
  meta-oe/recipes-support/opencv/opencv_4.7.0.bb                  | 3 +-
  .../python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} |   2 +-
  .../python/python3-sqlparse/CVE-2023-30608.patch                | 51 
++++++++++++
  meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb   | 1 +
  12 files changed, 376 insertions(+), 5 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb 
=> mbedtls_2.28.3.bb} (93%)
  rename meta-networking/recipes-protocols/frr/{frr_8.4.2.bb => 
frr_8.4.4.bb} (98%)
  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.3.bb 
=> tcpreplay_4.4.4.bb} (88%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
  create mode 100644 
meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.1.7.bb => 
python3-django_4.2.1.bb} (58%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch


