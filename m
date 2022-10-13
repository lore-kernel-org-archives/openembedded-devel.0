Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA658C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 14:43:33 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.8316.1665672208838803684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 07:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KiAWXqCN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id l19so1405733qvu.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5osZhbbUH1V2lF7rpKIWL9fCkQH0USl7l7GHV0vQjw=;
        b=KiAWXqCN3290M7Kp85iJluaJ35cypK3SJFYwGR1r4QuYK3LghphThDD48txm2tyj3q
         8LCk2euzgfV7vS7HHLvH1+dbVVaJURZmo7925WeSfhBH4/lb8dLkRcT2dNHA112iQNDR
         3dwANQ0V1OfxKLKDI+cPJDzoJdIgeTY5xmH7GVdxNq3TZRY2H8Dg8FTRCGnh0dgMRUY0
         h/DCD5sPPEuepqKbTpQqxGBftfNrK90d1LwwFzedveMIkGiMOv12wFVWjT+LyPZDq+Kk
         hTqv3cppah0rfnaSDkoUKBcDf+LmYxL79skwS6jeyX7az0Oven0L5HpoN0xHdfT17xuS
         pq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5osZhbbUH1V2lF7rpKIWL9fCkQH0USl7l7GHV0vQjw=;
        b=m89x5KBRUm8SYQHiLCQle4KrqMR3F0AD0PPDk5Ia8Q9ydhs8oQetSzxPt9Y+qcq6lS
         hQeQSW1gz6J4ExQlvZUXL/J1LABjV4pJBoPdax21HasjJvqYX59bW/JQ2IvpYoWuW9UE
         Pqc31XI0WgdFzboMfYFqnwRDrcMsxs4ClSzWFdBWfPgEFHQT5V8cAXBsbo/0yH4uR5/T
         /qumHsYXpYOfb9cxJM1qkwiWvcjk8L6yUHJq/OA5bOaAPbcV8YVpPWlJMoktJTCNbpcM
         rKMYzbeP75lRxQ70R74uEJiTDVWQNZe9/lohEJB27xI8+MYV6OPg3eh5VqB0oerljUzR
         hU+w==
X-Gm-Message-State: ACrzQf14VGtaz+VB0gNe2XEpFz4AzplmSUQ9FFGavx/lIVI+IG2gmoDD
	oQrrDvyqUG4E3NUCbG16qj8=
X-Google-Smtp-Source: AMsMyM7pWRWaggBvuYQD9t8kfI1f8BRjYCFCRrco6OgtbqzLCFwhf6L0f5bsQRL+1da7alviD+g7wg==
X-Received: by 2002:a0c:f4c9:0:b0:4b1:b290:a4d with SMTP id o9-20020a0cf4c9000000b004b1b2900a4dmr223927qvm.68.1665672207865;
        Thu, 13 Oct 2022 07:43:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c946:b088:7e2e:ed71? ([2600:1700:9190:ba10:c946:b088:7e2e:ed71])
        by smtp.gmail.com with ESMTPSA id t24-20020a37ea18000000b006e42a8e9f9bsm18525085qkj.121.2022.10.13.07.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 07:43:27 -0700 (PDT)
Message-ID: <f4555291-0c06-53bf-b92c-ec0f71ba88b6@gmail.com>
Date: Thu, 13 Oct 2022 10:43:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Oct 13th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 14:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99159

The following changes since commit 05dcac98473402d87e0af73bbc2c5a6a840abe93:

   postgresql: make sure pam conf installed when pam enabled (2022-09-15 
08:39:48 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to bd2d8fba766f912bd1bc5cde7d6f0e72152f1547:

   minicoredumper: retry elf parsing as long as needed (2022-09-25 
11:03:26 -0400)

----------------------------------------------------------------
Khem Raj (1):
       audit: Revert the tweak done in configure step in do_install

Martin Jansa (1):
       libcec: fix runtime dependencies for ${PN}-examples

Richard Purdie (1):
       lmdb: Don't inherit base

Sakib Sajal (1):
       minicoredumper: retry elf parsing as long as needed

Steffen Olsen (1):
       postgreql: Fix pg_config not working after buildpaths patch

Wang Mingyu (1):
       postgresql: upgrade 14.4 -> 14.5

Yi Zhao (1):
       frr: Security fix CVE-2022-37035

wangmy (1):
       php: upgrade 8.1.9 -> 8.1.10

  meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch  | 151 
++++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb                         | 2 +-
  .../files/0001-config_info.c-not-expose-build-info.patch        | 11 +-
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
  .../postgresql/{postgresql_14.4.bb => postgresql_14.5.bb} |   2 +-
  meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} |   2 +-
  meta-oe/recipes-extended/libcec/libcec_6.0.2.bb                 | 3 +
  ...001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch | 128 
+++++++++++++++++++++++
  meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb   | 1 +
  meta-oe/recipes-security/audit/audit_3.0.8.bb                   | 2 +
  11 files changed, 302 insertions(+), 7 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.4.bb => 
postgresql_14.5.bb} (83%)
  rename meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} (99%)
  create mode 100644 
meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch 


