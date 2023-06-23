Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE12EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:03:14 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.39428.1687518186021752583
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qk2L38pJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-be3e2d172cbso405815276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687518185; x=1690110185;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DebRCIC160zgopeYPCLisHpQiYMuzuWfFATr4rxOKkA=;
        b=qk2L38pJxqoJKata9371sHNSmNMGymNZnvvZm1XjFZKDkROHk9hs2nuPYby+QG6vAZ
         MTPBYvWf5NsaR366enXJCIdtILRSbjee0MQThGfLBR/3G7f9nLgMisZ5jdwJgG03eoSR
         6E+RfRg4DaVsHErVJb8P48GJCXq4ZW0PXPB0qYOqSZJbGu+ur3Xz1fICS3tgo+U7oj9F
         rug+JKQsTeAae7DfnkejBeErHzq1Wam12J14Bit7mRJZ8j40QNOn+jlOJ8X48d7Yuxnv
         SSJcX1CIQyPz0EPb8LfQqADAY9qrYpxq0YH6vTod0p9z6R5Nq97AEQMFYEgkbQLxfJvy
         SKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687518185; x=1690110185;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DebRCIC160zgopeYPCLisHpQiYMuzuWfFATr4rxOKkA=;
        b=BPgFL4/F/KEEPkApEpcqiOXeB1QfOAy9jAAHguZ7VlzsskyFl2Pv28y9aCdIBIfu5Z
         pMpXqzgzYkUcJlHD9ScRVg6HzfoGeybWVIuBvkIPeSW/4CovW3CE94fbXIfIRGgOtPLK
         oo98vTWPaHwG2yE0AotEBwWQ6tuwEAugcc3fpELkx5fMRC9UOjHkbSzxdio7cmPacA1K
         yc3yqZ4DD6Ua0i02nKBqOJ33+8LvzwBS2On5l+QGjXWvfuPQqRctd9mZH7OnzH0cBi+2
         v+oRNvcn5xhhWiph8PxMyMn0nzM9UbMI478Cg+wagHFq9XAzlwCr31vmv4tuh411J/ur
         fsdA==
X-Gm-Message-State: AC+VfDxSuS5FiwOq2IDMccqUg+iWBxlF11AhDNS4jmSdesCeS35UR4Xj
	qCZDCE0BO7yWaus3sUZO3mFcluMPNj8=
X-Google-Smtp-Source: ACHHUZ7VUJhGcgIXOrt3kB7zbR289EVnrcxSCQxqC6wDe4n3x4C/fJbBxa30WwVyn3SEzfAHZr1I1A==
X-Received: by 2002:a25:7188:0:b0:bf2:b00c:f09 with SMTP id m130-20020a257188000000b00bf2b00c0f09mr10449860ybc.40.1687518185114;
        Fri, 23 Jun 2023 04:03:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:80e:b8b0:6c85:7e? ([2600:1700:9190:ba10:80e:b8b0:6c85:7e])
        by smtp.gmail.com with ESMTPSA id 62-20020a250341000000b00be53a1eb5aesm2021360ybd.53.2023.06.23.04.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 04:03:04 -0700 (PDT)
Message-ID: <a1efe910-35a9-1b45-6c17-5eccc74bca3e@gmail.com>
Date: Fri, 23 Jun 2023 07:03:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: June 23rd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 11:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103494

The following changes since commit 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee:

   nodejs: make 14.18.1 available but not default (2023-05-16 07:09:25 
-0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 6334241447e461f849035c47f071fa4a2125fee1:

   c-ares: CVE-2023-31147 Insufficient randomness in generation of DNS 
query IDs (2023-06-23 06:58:18 -0400)

----------------------------------------------------------------
Hitendra Prajapati (2):
       c-ares: CVE-2023-31130 fix Buffer Underwrite
       c-ares: CVE-2023-31147 Insufficient randomness in generation of 
DNS query IDs

Martin Jansa (1):
       nodejs: fix native node-gyp to work with python-3.11

Samuli Piippo (1):
       spirv-tools: switch from master branch to main for re2

Vijay Anusuri (3):
       openldap: Fix CVE-2023-2953
       c-ares: fix CVE-2022-4904 & Update SRC_URI branch and protocols
       python3-cryptography: fix CVE-2023-23931

schitrod=cisco.com@lists.openembedded.org (1):
       gnulib: Update recipe name to 2018-12-18

  .../nodejs/nodejs/python-3.11-invalid-mode-rU.patch            | 46 ++
  meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb             | 1 +
  meta-oe/recipes-graphics/spir/spirv-tools_git.bb               | 2 +-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch      | 67 +++
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch     | 329 
+++++++++++++
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch     | 717 
++++++++++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                | 6 +-
  .../gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb} |   0
  .../recipes-support/openldap/openldap/CVE-2023-2953-1.patch    | 30 ++
  .../recipes-support/openldap/openldap/CVE-2023-2953-2.patch    | 76 +++
  meta-oe/recipes-support/openldap/openldap_2.4.57.bb            | 2 +
  .../python/python3-cryptography/CVE-2023-23931.patch           | 45 ++
  .../recipes-devtools/python/python3-cryptography_2.8.bb        | 1 +
  13 files changed, 1320 insertions(+), 2 deletions(-)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/python-3.11-invalid-mode-rU.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31147.patch
  rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb => 
gnulib_2018-12-18.bb} (100%)
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch 


