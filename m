Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C091BE7D0CE
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:30:32 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.19889.1695385829742643119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9QcWVrW;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59c0b5f984aso24954087b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695385829; x=1695990629; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baKEmWjiXlqZC6rSIlwoqLiLTk+ZIrOnNBRBDPOvlAA=;
        b=M9QcWVrWY/RmR/D3O+fn94Pjz9xVxZu7aUxfV3PnVd+tF5b64VreHYEyiV9lkNMwSB
         goKbnOIpVpbYkEGhFYFEbhfZ87NJahem2pCiddv6+qyNHAm3ZoxFPxd0LD3mb1tgFf5F
         1jIWuwH09pGnujaM1uVRYzsi7Ed7Oo1boPs4RCeRjjbxECDt4ksC4Ot27tdnotxkG8a4
         BdfTJIDTZEbob6bNGD2VKS3E1TUK+7dZw+0T3s5OBR2atQcSqPdpTYEv370JglGDpBIR
         6YT/QfmPbl4F66Z5WCzL8N2dWASeXnwS6VLkedb3Yuva1Yws7jZ43ca9/Jc9GQJc/Xk5
         m9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695385829; x=1695990629;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baKEmWjiXlqZC6rSIlwoqLiLTk+ZIrOnNBRBDPOvlAA=;
        b=jDV1ranlfio5ahrIoPkvXMAaA7J6kiErKqQayiJIjqTbA6LFZpa9PepYQxHMLLv6bJ
         7pPM1qpowq6oFSjibxkhV7E30y+Ghy7LkrOZNTgt/Q52y7XsitxmVtLeII/V9UlhYtqI
         Vj3Y1tlPlnjzJ88digX42Q4B9jehhZe0MsI0o1Pj/HmZZNUp9Vmv0+tmsF4bjleDUOvJ
         MsilFC81UBtly1RV6awL5h22a3+cpjfstOd+5KyjBcvAMJ6RyYl6f7VeNS1B9kmVm7xc
         qKv7RfMsVOkmOUwRIKscYfaJr5UbramgbMGy0ojGQpNnnSMw/NtiPM0yJkCUVVWrSFDE
         IMvQ==
X-Gm-Message-State: AOJu0YxFDI0PE1TQIJOz1graQcyLpmyofd0XGWEtv8DVZhVzt3uWfhRD
	x/jbh/8PnJTvqurvguf5pp0=
X-Google-Smtp-Source: AGHT+IGaqcuKW6FhaOm1ohoxzAR4H6iliqB5+D67ryQt8icO0gtRLNmAiL9s6u94eOMqW+dIMXASzw==
X-Received: by 2002:a0d:d8d7:0:b0:58f:9696:842d with SMTP id a206-20020a0dd8d7000000b0058f9696842dmr8296355ywe.15.1695385828856;
        Fri, 22 Sep 2023 05:30:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:15b9:8178:ac:c972? ([2600:1700:9190:ba10:15b9:8178:ac:c972])
        by smtp.gmail.com with ESMTPSA id v134-20020a81488c000000b00570253fc3e5sm846909ywa.105.2023.09.22.05.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 05:30:28 -0700 (PDT)
Message-ID: <099ed3ed-bab2-9659-b148-b66a74e04cdb@gmail.com>
Date: Fri, 22 Sep 2023 08:30:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request Sept 22nd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105064

The following changes since commit 57c516973978ca2667339bf1aae7dc722b5bcac7:

   tcpdump: upgrade 4.99.3 -> 4.99.4 (2023-09-05 13:40:23 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 32c529d435c45e60151c714936d451ed9e341466:

   poppler: fix CVE-2023-34872 (2023-09-19 07:22:00 -0400)

----------------------------------------------------------------
Chen Qi (2):
       grpc: fix CVE-2023-32732
       grpc: fix CVE-2023-33953

Chris Dimich (1):
       image_types_sparse: Fix syntax error

Martin Jansa (4):
       mongodb: enable hardware crc32 only with crc in TUNE_FEATURES
       khronos-cts.inc: respect MLPREFIX when appending DEPENDS with 
anonymous python
       libcyusbserial: fix installed-vs-shipped QA issue with multilib
       tcpreplay: fix pcap detection with /usr/lib32 multilib

Polampalli, Archana (1):
       python3-appdirs: print ptest results in unified format

Yogita Urade (1):
       poppler: fix CVE-2023-34872

  ...1-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch | 82 
++++++++++
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 9 +-
  meta-oe/classes/image_types_sparse.bbclass                      | 12 +-
  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 1 +
  ...1-backport-iomgr-EventEngine-Improve-server-handling-o.patch | 224 
++++++++++++++++++++++++++++
  .../recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch    | 81 
++++++++++
  meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb                    | 2 +
  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 4 +-
  ...1-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch | 43 
++++++
  meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb    | 4 +-
  meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch    | 46 
++++++
  meta-oe/recipes-support/poppler/poppler_23.03.0.bb              | 1 +
  meta-python/recipes-devtools/python/python3-appdirs/run-ptest   | 2 +-
  13 files changed, 498 insertions(+), 13 deletions(-)
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
  create mode 100644 
meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improve-server-handling-o.patch
  create mode 100644 
meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
  create mode 100644 
meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch

