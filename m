Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89452C001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 12:50:20 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.71972.1690721411195992919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 05:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YLjiYzCH;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so3725007276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690721410; x=1691326210;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KqgiONwCVkrGQk+LKo2QKwDxSF1+Uou7eV5oCijPHo=;
        b=YLjiYzCH2gsNk22QHiFVCMKTxPBnKIjjeBQSdL1xHDNnk+scXND3G9zLJW+KEnf99C
         8uxROA1WyO+F0+NsgfLX8yJzZBFK6z2wevNuZdv6aM2VM0Kd+olA7yaG7phNt1fEzLvw
         CUq+U5KaqOIpNzzn1EH+zv51RG5WBKSCwuChWIUmjVwUzTgTVPbbEBFkTHeBgAkhpMc5
         WRm37M0C6NiuOEV9vdmz9UlgB/N/9ji/yaQqw7yDjlTi03W92p14dvox3fAAhtJFFzQn
         tUTT4OZ3c9q9Xjl/hh8/2RCzxNqLsPhpEh5g2mZvQFTlh3EPhJpHj1ZQrjx3FiI4Ip0x
         7L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690721410; x=1691326210;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6KqgiONwCVkrGQk+LKo2QKwDxSF1+Uou7eV5oCijPHo=;
        b=X37S8gVzTbY0zfZb34fu0b6EzzrNbJ3zcA6ANSwdovK8r98eVBweIdEPCCdpEFin8P
         xLcKMVZBMMdOK66oN3GDohoMfA1VfvN8GZfY1SWas97zjc43Lit2r9nXWpLfoYzHZOq7
         r1MVdncOTD/Pkb7cazDaGm9rjMiz4Rmxdi/0InYwJzwUjc6AgbT2gCJtfNFZyYq9YDOI
         F4xtQA9md6LOEepcdfzt5IRbJriJIOUdaWfBywf3OjHDxxjZZLEnsNd8bQj41GLcduBk
         jdZ8NxwglirJcHwhL4mAiJ5tJg0xyCWBDHbKHwa5+a6IlwCTScDM4mNSsLiyAHeGRimI
         PsZg==
X-Gm-Message-State: ABy/qLYl1RPiT5IwBM7XJfQjaPrVyjuFTdrFWdRP5FfgM0PNW+HCRyVH
	Y1GXyhRb+oC7awzsZ6yYxVE=
X-Google-Smtp-Source: APBJJlGFeXoWZzOm6i71NPBl+L12ECZtjLAJVmbhS8a8GrBsaVAx3WCWltKtwBo5nIMdbpAn8RlNTw==
X-Received: by 2002:a25:e6c7:0:b0:d0a:8972:abc8 with SMTP id d190-20020a25e6c7000000b00d0a8972abc8mr6240233ybh.60.1690721410127;
        Sun, 30 Jul 2023 05:50:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4bc3:732:c84f:6e7? ([2600:1700:9190:ba10:4bc3:732:c84f:6e7])
        by smtp.gmail.com with ESMTPSA id i9-20020a25d109000000b00bcf788d09e3sm1911660ybg.34.2023.07.30.05.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 05:50:09 -0700 (PDT)
Message-ID: <fe54b2a9-06c6-a509-20af-3b61ddb71dba@gmail.com>
Date: Sun, 30 Jul 2023 08:50:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickeldore merge request: July 30th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 12:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104074

The following changes since commit d71a08b3d8fc69d3213c10885af9cc693056a8bd:

   mbedtls: upgrade 2.28.2 -> 2.28.3 (2023-06-28 16:28:35 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 03fd1d368ac19793b3e4c35159ba2ce802247e4d:

   yasm: fix CVE-2023-31975 (2023-07-25 07:15:34 -0400)

----------------------------------------------------------------
Chee Yang Lee (2):
       rabbitmq-c: Fix CVE-2023-35789
       c-ares: upgrade 1.19.0 -> 1.19.1

Jasper Orschulko (1):
       yaml-cpp: Fix cmake export

Joe Slater (1):
       libgpiod: modify RDEPENDS for ptest

Mingli Yu (2):
       dialog: Update the SRC_URI
       gnulib: Update SRC_URI

Polampalli, Archana (2):
       nodejs: upgrade 18.14.2 -> 18.16.1
       yasm: fix CVE-2023-31975

Yi Zhao (1):
       open-vm-tools: Security fix CVE-2023-20867

  .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 163 
++++++++++++++++++++++++++++
  .../recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb       | 1 +
  .../recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch  | 131 
++++++++++++++++++++++
  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb    | 4 +-
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_18.14.bb => nodejs-oe-cache-native_18.16.bb} |   0
  .../0001-Disable-running-gyp-files-for-bundled-deps.patch       | 7 +-
  .../nodejs/{nodejs_18.14.2.bb => nodejs_18.16.1.bb} |   4 +-
  meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch         | 29 +++++
  meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 1 +
  meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb          | 2 +-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 87 
---------------
  .../c-ares/{c-ares_1.19.0.bb => c-ares_1.19.1.bb} |   6 +-
  meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb             | 2 +-
  meta-oe/recipes-support/libgpiod/libgpiod.inc                   | 2 +-
  .../yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch    | 117 
++++++++++++++++++++
  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb              | 1 +
  17 files changed, 459 insertions(+), 98 deletions(-)
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
  create mode 100644 
meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.14 => 
nodejs-oe-cache-18.16}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.14.bb => 
nodejs-oe-cache-native_18.16.bb} (100%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_18.14.2.bb => 
nodejs_18.16.1.bb} (97%)
  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
  delete mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
  rename meta-oe/recipes-support/c-ares/{c-ares_1.19.0.bb => 
c-ares_1.19.1.bb} (83%)
  create mode 100644 
meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch


